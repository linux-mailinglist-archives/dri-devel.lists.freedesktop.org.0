Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33585A425A3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B910E18D;
	Mon, 24 Feb 2025 15:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xf7aXe+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4810E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409895; x=1771945895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qUzubzLgBT05RrsaQ4UBzMm3XMNcQZmfka4Vb8NPVi4=;
 b=Xf7aXe+J41UoptqyDI6XE8oU70pJb7n0Q+djFO5h18/mqFCetK+Si0zT
 zKJqSayspg+TKNSaiExKJXO388lWreJzsQO4/GG/4Ik3hUtHwlHNFfMA6
 vLciCaAfw/+fHCWCjUZxI5ytRHB3h8jOUETjg5rHHh8nWEbzpFpWQLX9X
 rbliE106y+Iudrrcz4gcIa+KJjkMVmE5hcbZxaGQ/931TOPJ8OH7cbW4e
 5yF/XJYwbTaaq3NgYfk/Bon3cluTszy63D1K6zO5d/WGwH3AFrxzIJKCZ
 68PHuazQRJKLKqYJbld4YeR41oBlWKJSMQkOPYS/NonFf2/BexJhkIDAo w==;
X-CSE-ConnectionGUID: O3bFbA4zS26H6M751PcnZA==
X-CSE-MsgGUID: huYzrjAdRCCD6tXaAumZhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51806063"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51806063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:11:35 -0800
X-CSE-ConnectionGUID: 4/Ao5ftqSSWETV+dElBn4g==
X-CSE-MsgGUID: wU5cAz5sRvebytjsw+OlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153286520"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:11:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tma7E-0000000EjB1-3EDe; Mon, 24 Feb 2025 17:11:28 +0200
Date: Mon, 24 Feb 2025 17:11:28 +0200
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
Message-ID: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <Z7x7kMjaDbCp_LB2@smile.fi.intel.com>
 <5BC3A795-99C2-4F00-ADD0-7ECD0285CDD0@live.com>
 <Z7yI4roBKA-PI4EC@smile.fi.intel.com>
 <3D520B56-AE84-4D73-9604-495642AF5B30@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D520B56-AE84-4D73-9604-495642AF5B30@live.com>
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

On Mon, Feb 24, 2025 at 03:03:40PM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 8:27 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 02:32:37PM +0000, Aditya Garg wrote:
> >>> On 24 Feb 2025, at 7:30 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Mon, Feb 24, 2025 at 01:40:20PM +0000, Aditya Garg wrote:

...

> >>>> +#define __APPLETBDRM_MSG_STR4(str4) ((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> >>> 
> >>> As commented previously this is quite strange what's going on with endianess in
> >>> this driver. Especially the above weirdness when get_unaligned_be32() is being
> >>> open coded and force-cast to __le32.
> >> 
> >> I would assume it was also mimicked from the Windows driver, though I haven't
> >> really tried exploring this there.
> >> 
> >> I’d rather be happy if you give me code change suggestions and let me review
> >> and test them
> > 
> > For the starter I would do the following for all related constants and
> > drop that weird and ugly macros at the top (it also has an issue with
> > the str4 length as it is 5 bytes long, not 4, btw):
> > 
> >  #define APPLETBDRM_MSG_CLEAR_DISPLAY cpu_to_le32(0x434c5244) /* CLRD */
> 
> Lemme test this.

Just in case it won't work, reverse bytes in the integer. Because I was lost in
this conversion.

> > (assuming we stick with __leXX for now). This will be much less confusing.

...

> >> Alright. For some reason (a mistake on my part), some dev_err_probe were also
> >> still left in this version.
> > 
> > But those are seems to me in the correct locations, no? How do we even know
> > the DRM device before its creation? So, dev_err_probe() calls in ->probe()
> > seem logical to me. Somebody from DRM should clarify this.
> 
> Thomas asked me to do this change. Maybe you didn’t see his reply.

I saw, maybe I took it wrong, but I really don't understand how on earth
drm_err()  or whatever can be used in real ->probe() of the physical device.

Imagine the hypotetical case

probe(strict device *dev)
{
	mydrm;
	foo;
	...
	foo = devm_gpiod_get(dev, ...);
	if (IS_ERR(foo))
		return dev_err_probe(dev, ...); // how?!
	...
	mydrm = ...DRM alloc...;
	...
}

I don't even believe it will be possible to create drm_err_probe() as it most
likely will require to have an allocation to be always the first op (that may
fail) in the ->probe() which might be not the case for some device drivers.

> >>>> +  */

-- 
With Best Regards,
Andy Shevchenko


