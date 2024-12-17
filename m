Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB29F5763
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307BB10E2C0;
	Tue, 17 Dec 2024 20:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOQoR7WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153210E048;
 Tue, 17 Dec 2024 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734466448; x=1766002448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mkS8bGIKwgjkAul5XLm+qXbojqTTipaPqyKI4CS0y6g=;
 b=JOQoR7WSPA0TJS50mPoAkIy4eLW9fwWs13CItYOk5JHoSloNiWhyHFJy
 x9cejLBb6Gl7peEAxDIrf25uSoNqD+3XOFysFtzrpwqJjqe0wROBwbP4L
 +6Yjr+9JwjeAXVY+XyVYvwKFQ5V7ZOOJYHrwM9LUyXTDHyDOwSafosPXD
 DP+34dwhRFpxhYmyHQRJC+Tv5ou+ABPephZ3qmZ5w2vtzOifaGdzANFOV
 FqS3BZI1w2Tzl16+4SNRMA2MNhZmFozHZ9z5QrWFqckqcKarOqTke5Irt
 tEYGJm2khlBhWgvvGSTGLt+BW4UexJXy3QdtbnmLZhJO3V9fnicFXCsqg Q==;
X-CSE-ConnectionGUID: KEd4DtcsR+a8thGPV+MzkQ==
X-CSE-MsgGUID: tR8ZmUVMSViWEhJZKCnGrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37748913"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="37748913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 12:14:07 -0800
X-CSE-ConnectionGUID: h5Tzdj0bTvi2zArmH+/jcg==
X-CSE-MsgGUID: gcQkEiB0TwmUZvzywvq7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98083216"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.153])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 12:14:06 -0800
Date: Tue, 17 Dec 2024 14:14:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Arnd Bergmann <arnd@kernel.org>, 
 michael.j.ruhl@intel.com, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "David E. Box" <david.e.box@linux.intel.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
Message-ID: <fjforguil5lcij77tgmjk5sw5bzuwg7m34nsdmrzbinnmt2xte@moz3kbsg6tgi>
References: <20241217071852.2261858-1-arnd@kernel.org>
 <Z2HIW4c-S_IA9bWb@intel.com>
 <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <36bae0e6-9153-4cb4-9c85-8a582a47044b@app.fastmail.com>
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

On Tue, Dec 17, 2024 at 08:28:59PM +0100, Arnd Bergmann wrote:
>On Tue, Dec 17, 2024, at 19:52, Rodrigo Vivi wrote:
>> On Tue, Dec 17, 2024 at 08:18:44AM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:
>>>
>>> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
>>> (.text+0x19861bf): undefined reference to `intel_vsec_register'
>>>
>>> This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
>>> style dependency to allow building with VSEC completely disabled.
>>> My impression here is that this was not actually intended, and that
>>> continuing to support that combination would lead to more build bugs.

why? if xe is built-in, vsec needs to be built-in as well. If xe is a
module, vsec can be either built-in or a module.

>>>
>>> Instead, make it a hard dependency as all other INTEL_VSEC users are,
>>> and remove the inline stub alternative. This leads to a dependency
>>> on CONFIG_X86_PLATFORM_DEVICES, so the 'select' has to be removed
>>> to avoid a circular dependency.
>>>
>>
>> I really don't want us to hard lock this X86 dependency here.
>> What if we add a new DRM_XE_DGFX_PMT_SUPPORT and that
>> depends on INTEL_VSEC ?
>
>Yes, that should work if it gets phrased correctly.
>Something like
>
>config DRM_XE_DGFX_PMT_SUPPORT
>       bool "X86 PMT support"
>       depends on DRM_XE && INTEL_VSEC
>       depends on DRM_XE=m || INTEL_VSEC=y
>       depends on X86 || COMPILE_TEST


that looks good to me.

thanks
Lucas De Marchi
