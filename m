Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6CEA424BD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8075B89209;
	Mon, 24 Feb 2025 15:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/Jzk+OJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA4B10E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409255; x=1771945255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xw3KB9gjyy7jwvn7lKbpsP4JVAclfVpengUyudkK6YQ=;
 b=a/Jzk+OJxsxkhc0eu/qExw/iYr3IyU1CTbbGSn9bqqi5CVto4yodJ3EK
 IUPgM+Dm3aM6XCBoG+Y8+SFV09qUj/CrdNzyLtFNorWy50w9+p3EoV901
 GX01NDAOfkkZjGCNJado8nOR8Mwx4CnaOWvl9dR9Q02vkJRG4hGce+BoP
 0PucWahySwMzr+VmltKUDn4f+e4cU82A+y5sODxkrAmRoimCL9w8wwKCr
 75GzMhv7x6jeNG7j0CtSGvrDHgHTHWh5g0QwoY6qvsJrBvkTKp+gTBvY4
 pT8Zs1UpiJ0EwLFi6ZkCJIivhkV2YnndFHqxOBKYH3lNzQQ/aabhI/DoZ g==;
X-CSE-ConnectionGUID: LvuIMFX3S6mSBlidhU4/Xg==
X-CSE-MsgGUID: crlEciWsSqC9vS4TCFdAxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40353424"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="40353424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:00:55 -0800
X-CSE-ConnectionGUID: 1nyFkwNrQwyQIVpJqp6H1g==
X-CSE-MsgGUID: pl7Gd87GRPqSpQTH/LqWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115875289"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:00:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmZww-0000000Ej2f-0MUb; Mon, 24 Feb 2025 17:00:50 +0200
Date: Mon, 24 Feb 2025 17:00:49 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7yJodpB4WAB5oHn@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
 <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
 <7D98DED5-5B18-4AAE-A347-C880232530B7@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7D98DED5-5B18-4AAE-A347-C880232530B7@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2025 at 02:54:07PM +0000, Aditya Garg wrote:
> This conversion helper mimics the existing drm_fb_xrgb8888_to_rgb888 helper

Not really. See below.

> > On 24 Feb 2025, at 7:59 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 01:38:32PM +0000, Aditya Garg wrote:

...

> >> +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > 
> > Okay the xrgb8888 is the actual pixel format independently on
> > the CPU endianess.
> > 
> >> +{
> >> + u8 *dbuf8 = dbuf;
> >> + const __le32 *sbuf32 = sbuf;
> > 
> > But here we assume that sbuf is __le32.
> > And I think we may benefit from the __be32 there.
> 
> So, like drm_fb_xrgb8888_to_rgb888, we are using __le32
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_format_helper.c?h=v6.14-rc4#n657

The rgb888 != bgr888, that's where the byte swapping happens. So, one should
use __be32 if the other has already been using __le32.

> >> + unsigned int x;
> >> + u32 pix;
> >> +
> >> + for (x = 0; x < pixels; x++) {
> >> + pix = le32_to_cpu(sbuf32[x]);
> >> + /* write red-green-blue to output in little endianness */
> >> + *dbuf8++ = (pix & 0x00ff0000) >> 16;
> >> + *dbuf8++ = (pix & 0x0000ff00) >> 8;
> >> + *dbuf8++ = (pix & 0x000000ff) >> 0;
> > 
> > pix = be32_to_cpu(sbuf[4 * x]) >> 8;
> > put_unaligned_le24(pix, &dbuf[3 * x]);
> 
> Again, 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_format_helper.c?h=v6.14-rc4#n664

As per above.

> >> + }
> > 
> > Or, after all, this __le32 magic might be not needed at all. Wouldn't the below
> > be the equivalent
> > 
> > static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > {
> > unsigned int x;
> > u32 pix;
> > 
> > for (x = 0; x < pixels; x++) {
> > /* Read red-green-blue from input in big endianess and... */
> > pix = get_unaligned_be24(sbuf + x * 4 + 1);
> > /* ...write it to output in little endianness. */
> > put_unaligned_le24(pix, dbuf + x * 3);
> > }
> > }
> > 
> > The comments can even be dropped as the code quite clear about what's going on.
> 
> These comments are literally rewritten :
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_format_helper.c?h=v6.14-rc4#n663
> 
> >> +}
> > 
> > But it's up to you. I don't know which solution gives better code generation
> > either.
> 
> I don't really mind any code change tbh, but I’d prefer that as an
> improvement to existing code, and not a part of this patchset.

Right, but see my argumentation above.

-- 
With Best Regards,
Andy Shevchenko


