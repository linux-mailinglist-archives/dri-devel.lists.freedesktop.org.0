Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBE57839A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909B7AE7EC;
	Mon, 18 Jul 2022 13:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC989AE72C;
 Mon, 18 Jul 2022 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658150512; x=1689686512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t54h+03DTals7K9cEuEjuoCsltxBcdxS92lbUylXBc8=;
 b=gPqJ6n8nQ7xSEZsIX3o7faDYT5Zli5MLQuURfhi28u5idAUlxD1/7C0r
 uFX0hajy9yjJgjFWYk1vImFPV7C8kqdcf1PiRNwJUSlQD4TA4TFQLUqGa
 xuNtb2RrBRsDkFWj4YiHBJnuw9oQnV1r1N9xyAAQ0FiC5Ydl/tsMlFAn7
 f2z3EGoKm8axkK6C6baEq9oeuhMnkBfMmzi50QOM7TnaQErD3NhekK7Mu
 r1EbVBA6RrAFHmS1IH8p2mUqHo8PSuCR1u9QiQhoSvXFYSyRXpajupY4y
 hs2pNcRXoA5S8jX6F7lMVWm4L/+xJCtHPQkHflMZ1KwCSmpCToGMFKE7b A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="350178673"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="350178673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:21:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="686732431"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:21:49 -0700
Message-ID: <de7c7b5d-267b-25c7-6695-cd9e47a0217d@linux.intel.com>
Date: Mon, 18 Jul 2022 14:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/21] drm/i915/gt: document with_intel_gt_pm_if_awake()
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
 <1ed105f9fd605e1ccdaecc18c394c17eaec1035e.1657800199.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1ed105f9fd605e1ccdaecc18c394c17eaec1035e.1657800199.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
> Add a kernel-doc markup to document this new macro.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index a334787a4939..4d4caf612fdc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -55,6 +55,13 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>   	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>   	     intel_gt_pm_put(gt), tmp = 0)
>   
> +/**
> + * with_intel_gt_pm_if_awake - if GT is PM awake, get a reference to prevent
> + *	it to sleep, run some code and then put the reference away.
> + *
> + * @gt: pointer to the gt
> + * @wf: pointer to a temporary wakeref.
> + */
>   #define with_intel_gt_pm_if_awake(gt, wf) \
>   	for (wf = intel_gt_pm_get_if_awake(gt); wf; intel_gt_pm_put_async(gt), wf = 0)

Maybe say in kerneldoc the put is async. Although for me documenting 
trivial helpers is a bit over the top by anyway..

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
