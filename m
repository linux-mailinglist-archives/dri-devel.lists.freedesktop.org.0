Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D808C457582
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 18:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97666E42C;
	Fri, 19 Nov 2021 17:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE10F6E42C;
 Fri, 19 Nov 2021 17:32:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="221333308"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="221333308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 09:32:13 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="495946821"
Received: from rmahambr-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.27.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 09:32:13 -0800
Date: Fri, 19 Nov 2021 09:32:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Rename gt to gt0
Message-ID: <20211119173213.4gupm2m7tcmfur5g@ldmartin-desk2>
References: <20211117133456.688802-1-andi.shyti@linux.intel.com>
 <20211117133456.688802-3-andi.shyti@linux.intel.com>
 <163715857341.11567.6516227738264680366@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <163715857341.11567.6516227738264680366@build.alporthouse.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 02:16:13PM +0000, Chris Wilson wrote:
>Quoting Andi Shyti (2021-11-17 13:34:56)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> index a9727447c0379..4bfedc04f5c70 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>> @@ -936,7 +936,7 @@ hsw_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>>  static void
>>  gen9_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
>>  {
>> -       const struct sseu_dev_info *sseu = &i915->gt.info.sseu;
>> +       const struct sseu_dev_info *sseu = &i915->gt0.info.sseu;
>
>This feels like it should be pulling from uncore->gt, since the MCR is
>across an uncore.
>
>Overall though, rather than introduce bare &i915->gt0, how about pulling in
>the patch for to_gt(i915)?

agreed, why are we going a different route rather than using the to_gt()
patches Michal prepared? If the to_gt() is not what we want, then please
sync with Michal on the proper direction

Lucas De Marchi
