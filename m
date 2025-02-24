Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AEA42489
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843E08930B;
	Mon, 24 Feb 2025 14:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh7TFlCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031FF8930B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409065; x=1771945065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ApbmW1BVLLWh9Y/yw3zWhdEJQrg5lHizqsSsqNz41bs=;
 b=Mh7TFlCraqWktYWmeqI9Svia61tunJ0vKV7ckH8pmf85GAecOgN3T9lP
 RfIMJXmv78nyxNYNMb6LcWilzRan4J3O/p3nVKRr0zYR3mnP1pnJlv6tG
 wNwA/60HX9GKO0fLgQpwGnM/alJNSjTcYeT9y1li4Ya9Lm0C6As3LlFLt
 G5sSyOd/N1yqOCo9tMPJas+1OsWubcQ6ZcUtgurkyDq8+L9kIEmFhQdAm
 TyD01NXmtEnxOOqB0As37GoKJzCq0RGqF14GC97kd3G2F1izGMPCIzW3e
 85bK8BhCOgYMMO2q64rkbrx6dk0fAuvGOCwS5+uFdpmC4CF2vq8wEcOq8 w==;
X-CSE-ConnectionGUID: giz6chAzQ72zK0KhX3kWTQ==
X-CSE-MsgGUID: OSFK6nwuQ5S1x/vB94V/0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51380521"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51380521"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:57:45 -0800
X-CSE-ConnectionGUID: fj4upMoLRuGZSzt6VUfMXA==
X-CSE-MsgGUID: GM9+VcLkSF+/Kc2LOMAWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115814785"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:57:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmZtq-0000000Ej0X-2boH; Mon, 24 Feb 2025 16:57:38 +0200
Date: Mon, 24 Feb 2025 16:57:38 +0200
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
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7yI4roBKA-PI4EC@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <Z7x7kMjaDbCp_LB2@smile.fi.intel.com>
 <5BC3A795-99C2-4F00-ADD0-7ECD0285CDD0@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5BC3A795-99C2-4F00-ADD0-7ECD0285CDD0@live.com>
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

On Mon, Feb 24, 2025 at 02:32:37PM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 7:30 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 01:40:20PM +0000, Aditya Garg wrote:

...

> >> +#define __APPLETBDRM_MSG_STR4(str4) ((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> > 
> > As commented previously this is quite strange what's going on with endianess in
> > this driver. Especially the above weirdness when get_unaligned_be32() is being
> > open coded and force-cast to __le32.
> 
> I would assume it was also mimicked from the Windows driver, though I haven't
> really tried exploring this there.
> 
> I’d rather be happy if you give me code change suggestions and let me review
> and test them

For the starter I would do the following for all related constants and
drop that weird and ugly macros at the top (it also has an issue with
the str4 length as it is 5 bytes long, not 4, btw):

  #define APPLETBDRM_MSG_CLEAR_DISPLAY	cpu_to_le32(0x434c5244)	/* CLRD */
  ...

(assuming we stick with __leXX for now). This will be much less confusing.

...

> >> +struct appletbdrm_msg_information {
> >> + struct appletbdrm_msg_response_header header;
> >> + u8 unk_14[12];
> >> + __le32 width;
> >> + __le32 height;
> >> + u8 bits_per_pixel;
> >> + __le32 bytes_per_row;
> >> + __le32 orientation;
> >> + __le32 bitmap_info;
> >> + __le32 pixel_format;
> >> + __le32 width_inches; /* floating point */
> >> + __le32 height_inches; /* floating point */
> >> +} __packed;
> > 
> > Haven't looked deeply into the protocol, but still makes me think that
> > the above (since it's the only __packed data type required) might be simply
> > depicted wrongly w.r.t. endianess / data types in use. It might be that
> > the data types have something combined and / or different types.
> > 
> > Do I understand correctly that the protocol was basically reverse-engineered?
> 
> Yes. Although it was reverse engineered by the person who wrote the Windows
> driver. The author has just made a Linux port.
> So, as far as how is was reverse engineered, it not really possible for me to
> explain. I don't even have any contact with the person who wrote the Windows
> driver. The only point here would be to myself RE the hardware again, which
> tbh isn't very motivating, considering that we have a working driver.

Right. I agree that is better to have something working than something
good looking, but wrong.

Can you add a summary to the commit message that since the driver was
reverse-engineered the actual data types of the protocol might be different
(including, but not limited to, endianess)?

...

> >> + /*
> >> +  * The coordinate system used by the device is different from the
> >> +  * coordinate system of the framebuffer in that the x and y axes are
> >> +  * swapped, and that the y axis is inverted; so what the device reports
> >> +  * as the height is actually the width of the framebuffer and vice
> >> +  * versa
> > 
> > Missing period.
> 
> Alright. For some reason (a mistake on my part), some dev_err_probe were also
> still left in this version.

But those are seems to me in the correct locations, no? How do we even know
the DRM device before its creation? So, dev_err_probe() calls in ->probe()
seem logical to me. Somebody from DRM should clarify this.

> >> +  */

...

> I’ll send a v5.

Please, wait a bit. it's too fast to send one version quicker than 24h...

-- 
With Best Regards,
Andy Shevchenko


