Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D122512B1F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 07:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2248110EB2D;
	Thu, 28 Apr 2022 05:52:13 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8C10EB06;
 Thu, 28 Apr 2022 05:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651125131; x=1682661131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/u+htlH4NSK2kG6RTYS+YYAvCv3Wi+ifHkv2cu0qslY=;
 b=W9/pO6FtGUz955SO7yKTGlFsqLmInHqjf7qPMzFLcQHJbJIGC2vmxwBa
 YiXFtsomKUvRMhwOxjM41EFg3GxKSV2n64Rn4pZQ7hK3Rwh0EH/j+OxIm
 nijw/5NXYBXAkhu82aYWaXKc/zfP7PiLsqYNQu7sutAKwokWQd6FPMAiT
 Z66IQS486TeIItqCI9o1JfXbxmm7J7lxcl4Uf/4knk5aWb5KUpVQz1Eg3
 40h3m9CFNTbcHjUv6OuEyOVcFrXmlhsQIL8ajDztpz7Fo/5i8abxxnolo
 sr5uEDgq0kLjAa03C1KUh+GGdq0yxMajKbKTR+9JpmxR5rDke3kWMeSDf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="248100697"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="248100697"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 22:52:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="731225787"
Received: from rochoaga-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.120.12])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 22:52:10 -0700
Date: Wed, 27 Apr 2022 22:52:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/2] Initial GuC firmware release for DG2
Message-ID: <20220428055210.76zevss7c4qcf2pk@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
 <6410f76c-af4c-2c75-1ba7-aee3480a6539@ubuntu.com>
 <727fbd97-bf4e-1802-6e30-8b943ca523f6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <727fbd97-bf4e-1802-6e30-8b943ca523f6@intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 03:14:16PM -0700, John Harrison wrote:
>On 4/27/2022 11:24, Timo Aaltonen wrote:
>>John.C.Harrison@Intel.com kirjoitti 27.4.2022 klo 19.55:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>Add GuC firmware for DG2.
>>>
>>>Note that an older version of this patch exists in the CI topic
>>>branch. Hence this set includes a revert of that patch before applying
>>>the new version. When merging, the revert would simply be dropped and
>>>the corresponding patch in the topic branch would also be dropped.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>
>>>John Harrison (2):
>>>   Revert "drm/i915/dg2: Define GuC firmware version for DG2"
>>>   drm/i915/dg2: Define GuC firmware version for DG2
>>>
>>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>
>>The firmware is not public yet, though? Shouldn't it have been sent 
>>upstream already? Same complaint applies to DMC.
>>
>>
>Not sure about the DMC team, but for i915 we upload the firmware to an 
>FDO repo so that the CI system can find it and run the pre-merge 
>testing with it. However, we don't send the final pull request for the 
>real linux firmware repo until we have merged the i915 patch to 
>drm-gt-intel-next and it is definitely going upstream. Otherwise, we 
>might end up pushing firmwares to the linux repo that never get used.

we don't want to risk sending a pull request to drm if the firmware is
not in linux-firmware repo yet though, so we need to be careful with
this workflow.

We still have some weeks, which should be sufficient time if it's sent
to linux-firmware asap.

2nd patch pushed to drm-intel-gt-next.
1st patch I removed from topic/core-for-CI.

Thanks
Lucas De Marchi

>
>John.
>
