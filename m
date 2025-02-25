Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C59A43B6A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071F010E609;
	Tue, 25 Feb 2025 10:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTwC28WN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3A310E609
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740479096; x=1772015096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KJi6fGx2qAW3OOyEjyDwdnC/hKQyC55feyHtoB8Hh+Q=;
 b=MTwC28WNmEVHs2sIhyVOBdvfU/QIbIrZyaoe+t+mBCu3VzkYKl8fXWV4
 HtUUf/ia7TRmGtIJFrE5dbx70e8r0mr0jjgRdRlnlqpgFL9PlwsRLQIxg
 c5zcNi19ekBx+U4z9Ahhlxy+S8fIs+NkuUVSWogQHvjsqGGN0XaYYx4dg
 QyMb0b20EA9tKv/vOU2Ldu44rwUESCxhA5kF06PCxvnVosmv0Tjxs1wn6
 yWfX1oH/yo2Gz01/0ifZKq5AfqKTbe5zSn29Cxx/bBr75cyyyjNyw/52E
 Wf5pkSCFTMmrFzFzyEuET+S4iZNcrxVnoelcKE0b+PjUGprfXUiytWP4V g==;
X-CSE-ConnectionGUID: 0S5a5NhJTzSe4OZdEBX7pQ==
X-CSE-MsgGUID: Bd3gxpbLRvSRRUI09XVcvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41158819"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41158819"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:24:55 -0800
X-CSE-ConnectionGUID: xO4dWD+qS42xRL47uWu9lA==
X-CSE-MsgGUID: 5SjyaEnGQZWpLxskDmf7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121292015"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:24:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tms7M-0000000ExQ9-3UHb; Tue, 25 Feb 2025 12:24:48 +0200
Date: Tue, 25 Feb 2025 12:24:48 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z72acJ0MoSOK5_RI@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
 <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
 <466c38c3-7f74-46db-8270-bebafacf0007@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466c38c3-7f74-46db-8270-bebafacf0007@suse.de>
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

On Tue, Feb 25, 2025 at 08:37:32AM +0100, Thomas Zimmermann wrote:
> Am 24.02.25 um 15:29 schrieb andriy.shevchenko@linux.intel.com:
> > On Mon, Feb 24, 2025 at 01:38:32PM +0000, Aditya Garg wrote:

...

> > > +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > Okay the xrgb8888 is the actual pixel format independently on
> > the CPU endianess.
> > 
> > > +{
> > > +	u8 *dbuf8 = dbuf;
> > > +	const __le32 *sbuf32 = sbuf;
> > But here we assume that sbuf is __le32.
> > And I think we may benefit from the __be32 there.
> 
> No, please. XRGB is the logical order. The raw physical byte order for DRM
> formats is always* little endian, hence reversed from the logical one. sbuf
> points to raw memory and is therefore __le32. DRM-format byte order is
> impossible to understand, I know. But that code is correct.

Okay, so it's only about the colour (top-level) layout, the input and output
data is always in little endian?

> *) White lie: there's a DRM format flag signalling physical big endianess.
> That isn't the case here. So nothing here should ever indicate big
> endianess.

But should it indicate the little? To me sounds like neither...

> > > +	unsigned int x;
> > > +	u32 pix;
> > > +
> > > +	for (x = 0; x < pixels; x++) {
> > > +		pix = le32_to_cpu(sbuf32[x]);
> > > +		/* write red-green-blue to output in little endianness */
> > > +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> > > +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> > > +		*dbuf8++ = (pix & 0x000000ff) >> 0;
> > 		pix = be32_to_cpu(sbuf[4 * x]) >> 8;
> > 		put_unaligned_le24(pix, &dbuf[3 * x]);
> > 
> > > +	}
> > Or, after all, this __le32 magic might be not needed at all. Wouldn't the below
> > be the equivalent
> > 
> > static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > {
> > 	unsigned int x;
> > 	u32 pix;
> > 
> > 	for (x = 0; x < pixels; x++) {
> > 		/* Read red-green-blue from input in big endianess and... */
> > 		pix = get_unaligned_be24(sbuf + x * 4 + 1);
> > 		/* ...write it to output in little endianness. */
> > 		put_unaligned_le24(pix, dbuf + x * 3);
> > 	}
> > }
> > 
> > The comments can even be dropped as the code quite clear about what's going on.
> > 
> > > +}
> > But it's up to you. I don't know which solution gives better code generation
> > either.

-- 
With Best Regards,
Andy Shevchenko


