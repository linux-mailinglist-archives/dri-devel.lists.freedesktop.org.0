Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D9A42302
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82DE10E3CA;
	Mon, 24 Feb 2025 14:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db/AM0T1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B7F10E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740407360; x=1771943360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dmpFLg1ecdSuqOmmUqoxFTq+m5PnyBOgLaZ2gXmFR84=;
 b=Db/AM0T1xVUfp+6v+DX5EccKk/ZW67VtEpUkesMN4e3N7Z5l3TRFBP8C
 XbolYCGXzosExBFuBbEyc8TfGr5KEoGUQvW1sCY7sqhbWFRWqUQr7og4Z
 Wc20E7/EZBOa0aXp7l6KU7JO0d3cD3YCygt5eXlPLDxjzZI7Sz0uxaryK
 1saiUlzX2Qwi4ZHXEnjdNvRJ3oppalXBJOpSy+Dw2SWL4fnXWVOkYHLZw
 Twr5Lxjscsu4Q2F4M6Bc8NSw8yQfwaX9caWtTc1IJWM3AVJbT0xENGSFb
 B+MKst9NoyFH6llQ7wsmnzK91MATy9QSXBxMB7Eo8zF49z+V6xKq11NRO Q==;
X-CSE-ConnectionGUID: MH43TTF8S0q3xMHc3I8Q4w==
X-CSE-MsgGUID: p11IYGUkTVGax1aqN0Nr5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41179669"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41179669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:29:10 -0800
X-CSE-ConnectionGUID: 0iePib4FSf2eNgfBrf7owg==
X-CSE-MsgGUID: ZXhrhEvLTWOgTMYDmhF4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116557498"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:29:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmZSB-0000000EibU-3puf; Mon, 24 Feb 2025 16:29:03 +0200
Date: Mon, 24 Feb 2025 16:29:03 +0200
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
Message-ID: <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
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

On Mon, Feb 24, 2025 at 01:38:32PM +0000, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> Add XRGB8888 emulation helper for devices that only support BGR888.

...

> +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)

Okay the xrgb8888 is the actual pixel format independently on
the CPU endianess.

> +{
> +	u8 *dbuf8 = dbuf;
> +	const __le32 *sbuf32 = sbuf;

But here we assume that sbuf is __le32.
And I think we may benefit from the __be32 there.

> +	unsigned int x;
> +	u32 pix;
> +
> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		/* write red-green-blue to output in little endianness */
> +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> +		*dbuf8++ = (pix & 0x000000ff) >> 0;

		pix = be32_to_cpu(sbuf[4 * x]) >> 8;
		put_unaligned_le24(pix, &dbuf[3 * x]);

> +	}

Or, after all, this __le32 magic might be not needed at all. Wouldn't the below
be the equivalent

static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
{
	unsigned int x;
	u32 pix;

	for (x = 0; x < pixels; x++) {
		/* Read red-green-blue from input in big endianess and... */
		pix = get_unaligned_be24(sbuf + x * 4 + 1);
		/* ...write it to output in little endianness. */
		put_unaligned_le24(pix, dbuf + x * 3);
	}
}

The comments can even be dropped as the code quite clear about what's going on.

> +}

But it's up to you. I don't know which solution gives better code generation
either.

-- 
With Best Regards,
Andy Shevchenko


