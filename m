Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF87147BA
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 12:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B1B10E271;
	Mon, 29 May 2023 10:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1810E271;
 Mon, 29 May 2023 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685354813; x=1716890813;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U1TsKlIKqlAkAk+ynvXHbRTCq4Ng5rsCi5jfPO/4B8s=;
 b=W3d2qeeqbDIFdMECbtxPxukjCCRi5UDnez4rROhxb9H5Z4egDYRgudc2
 bioteoGog2SxLl/iJhDue8raO2Te4gsGyLBMB2s/EbfKfilMaMMAnjm1f
 2Whp1SYcWYJk8a9aanBkRCQY6fw/rt9OGBtm2pYw/leAxpWH8tQqdIb9A
 dZ6IdEZD5Z+whGec7YC/AHQ9Z8lnEBjlMCTCoC1mNB1tkZiBebE9QNc/Q
 1CiOUiRq9XtmvRUSXgRaUEMwYANj8Gtn3QMMNZhUMAiQhbslMIrmk6XbE
 j74xuzJpYA89n1I8jRfGunW4uf7uzIM+/s6bb193TS3nLtAQAdVuxVnK3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="353515769"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="353515769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739096825"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="739096825"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:06:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915_drm.h: fix a typo
In-Reply-To: <970d2cff-f181-d933-8ce3-b1dbe7f90fd8@189.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230529074912.2070902-1-suijingfeng@loongson.cn>
 <874jnvimtf.fsf@intel.com> <970d2cff-f181-d933-8ce3-b1dbe7f90fd8@189.cn>
Date: Mon, 29 May 2023 13:06:45 +0300
Message-ID: <87wn0rh2oa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 May 2023, Sui Jingfeng <15330273260@189.cn> wrote:
> Hi,
>
>
> On 2023/5/29 16:06, Jani Nikula wrote:
>> On Mon, 29 May 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>   'rbiter' -> 'arbite'
>> Should be arbiter.
>
> Yeah, should be arbiter.
>
> arbiter is a noun. Here, this arbiter may referrer to the 
> drivers/pci/vgaarb.c.
>
> Can you help correct then apply it ? thanks.

Please send a fixed version and I'll apply it. I'm not fixing trivial
patches for you.

BR,
Jani.


>
>>
>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> ---
>>>   include/drm/i915_drm.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/i915_drm.h b/include/drm/i915_drm.h
>>> index 7adce327c1c2..3dcb1db519ae 100644
>>> --- a/include/drm/i915_drm.h
>>> +++ b/include/drm/i915_drm.h
>>> @@ -42,7 +42,7 @@ extern struct resource intel_graphics_stolen_res;
>>>    * The Bridge device's PCI config space has information about the
>>>    * fb aperture size and the amount of pre-reserved memory.
>>>    * This is all handled in the intel-gtt.ko module. i915.ko only
>>> - * cares about the vga bit for the vga rbiter.
>>> + * cares about the vga bit for the vga arbite.
>>>    */
>>>   #define INTEL_GMCH_CTRL		0x52
>>>   #define INTEL_GMCH_VGA_DISABLE  (1 << 1)

-- 
Jani Nikula, Intel Open Source Graphics Center
