Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD361529AF0
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FC5112C7E;
	Tue, 17 May 2022 07:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B33112BB3;
 Tue, 17 May 2022 07:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652772947; x=1684308947;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d6imrCBiGBbVz2D/NUzP92KgMzg0Fvwm4TsGR5xbZNw=;
 b=R4OmfO6oM7sMQUIPuO56Jc1lzNYm6YMVUMZvjvc8HXczts4TSjtfgUMq
 2i9ByWOrnHh/OzDMC1A2pA80sM5JHKzuTlrdFSkNTPvRvaEBQKWTbZ9dW
 q8baQ1WN7H2Zou0yDw0KdoiOpKl9IPgXuksoMX+5O8deuT5BdXP8AoahK
 l88aOuLV4CwXmx4SByDEaF4D1iPHS3hvTSv9noXacIijRDqJWOWbjBaNH
 9/oWAGxBsfyDsIcukkU/W6PjrUQhFUQFBUmi3N3hND/wiQqDxGrxZ8T0H
 s2yBE4NmKe3Sw2ugUfNCgGjQOwlu6plz1YyJSfKdnQIeaG4xFGvGk1lZ3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="296371655"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="296371655"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:35:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="596991454"
Received: from aghafar-mobl1.ger.corp.intel.com (HELO [10.213.210.37])
 ([10.213.210.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:35:33 -0700
Message-ID: <d7310d85-4e8e-6b3b-2ec5-3a56bb9babeb@linux.intel.com>
Date: Tue, 17 May 2022 08:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: linux-next: Tree for May 16 (drm/i915/gt/intel_gt_sysfs_pm.c)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220516205718.2c5a52f9@canb.auug.org.au>
 <1af2e702-2ea4-02ad-7682-e39cee20cc13@infradead.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1af2e702-2ea4-02ad-7682-e39cee20cc13@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 16/05/2022 22:22, Randy Dunlap wrote:
> 
> 
> On 5/16/22 03:57, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20220513:
>>
> 
> on i386:
> 
>    CC      drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.o
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function ‘act_freq_mhz_show’:
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:276:20: error: implicit declaration of function ‘sysfs_gt_attribute_r_max_func’ [-Werror=implicit-function-declaration]
>    u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function ‘boost_freq_mhz_store’:
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:327:9: error: implicit declaration of function ‘sysfs_gt_attribute_w_func’ [-Werror=implicit-function-declaration]
>    return sysfs_gt_attribute_w_func(dev, attr,
>           ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function ‘min_freq_mhz_show’:
> ../drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:416:17: error: implicit declaration of function ‘sysfs_gt_attribute_r_min_func’ [-Werror=implicit-function-declaration]
>    u32 min_freq = sysfs_gt_attribute_r_min_func(dev, attr,
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> 
> Full randconfig file is attached.

There is a fix for this in 09708b6d82ef ("drm/i915/gt: Fix build error 
without CONFIG_PM") queued up, waiting for the next pull request, which 
the plan was to send out next week or so. Is that okay?

Regards,

Tvrtko
