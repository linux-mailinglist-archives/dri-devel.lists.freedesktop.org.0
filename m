Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3F66BCC3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EADF10E3CC;
	Mon, 16 Jan 2023 11:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6010E3CC;
 Mon, 16 Jan 2023 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673868092; x=1705404092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+cODhuFky0xvAVI1YBOLUwLffLhd0hai1D7NWLccOEw=;
 b=mXB3L2SWLRRWG/3Wp7pbNc56bkv2Xe5ZM9MUp+2A2LHw0e5KqcZ4/qpI
 BZl9G+QfPt5wy/57feEfqcp3klIdfrc6k6PbUl1FhLXKL2aDRrChIAXD2
 l8Ijng7oD72k+fbx8AFqMWO03+vI7VwSgKsPd2Yx7j/CPn+lMGU5sIapG
 KWgLk16DKB8YN9z7p3s4mwExFseWyc2r00aaP/t7w+GEU5xAEZpasWLG2
 KWVwkvmmw+I1ECSuaCygThLsSs5vRIxTXP1hTKor+7WAiffR8PWg9LjPT
 0KlLi6AMdtGDBxDI3HzNveDfNjfKLuYDV8zvGGnafmaMEgJnrag1MSQ4/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="323142170"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="323142170"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 03:21:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="608873612"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="608873612"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.26.210])
 ([10.213.26.210])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 03:21:29 -0800
Message-ID: <29cd1dfc-13e9-e51d-4059-868ecbff4393@intel.com>
Date: Mon, 16 Jan 2023 12:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Unwind hugepages to drop
 wakeref on error
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230113114903.7824-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230113114903.7824-1-nirmoy.das@intel.com>
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
Cc: chris.p.wilson@linux.intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.01.2023 12:49, Nirmoy Das wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Make sure that upon error after we have acquired the wakeref we do
> release it again.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index c281b0ec9e05..295d6f2cc4ff 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
>   			I915_SHRINK_ACTIVE);
>   	i915_vma_unpin(vma);
>   	if (err)
> -		goto out_put;
> +		goto out_wf;
>   
>   	/*
>   	 * Now that the pages are *unpinned* shrinking should invoke
> @@ -1871,7 +1871,7 @@ static int igt_shrink_thp(void *arg)
>   		pr_err("unexpected pages mismatch, should_swap=%s\n",
>   		       str_yes_no(should_swap));
>   		err = -EINVAL;
> -		goto out_put;
> +		goto out_wf;
>   	}
>   
>   	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
> @@ -1883,7 +1883,7 @@ static int igt_shrink_thp(void *arg)
>   
>   	err = i915_vma_pin(vma, 0, 0, flags);
>   	if (err)
> -		goto out_put;
> +		goto out_wf;
>   
>   	while (n--) {
>   		err = cpu_check(obj, n, 0xdeadbeaf);

