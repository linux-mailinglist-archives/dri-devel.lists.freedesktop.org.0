Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A369D4ED5A1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492F110EB0A;
	Thu, 31 Mar 2022 08:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84E10EB0A;
 Thu, 31 Mar 2022 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648715413; x=1680251413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RMI8gL5DpCkh677IYtc7xyxQns8lB1Jpx9AA/OdNb9Y=;
 b=a+mHLAFfwJppBnAewDcvrt277ehj+yPV1HIxQdJ0zAYn23DTViKRyiHA
 c5MCLy7UhTDsz78mWmjjgJbPD6wYDUMUUIyIq9goC3hunJ82ofYHS9NBw
 YTivGAmPUkkUh9MibbdnLMzmQ0jSywKR7HMRgKr5syc4SkBLJVLvctTDR
 otTKBxHMx7TzW3eFEWHXq9G3/dijY4/PRG1DrJ14rMOQqG6ef1P4jiCWI
 NlmHqLfguIBgNdDlC4qrG9nBWZl1AcipspGn0rIWn5iRH5Xn+IO3R8BGC
 d3topzhxNgx6fJCtv4JIba/3LVxUNLhBNTp/hJQegH3botmkTOEcMgyN4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346195888"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="346195888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:30:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="839628045"
Received: from vvendra-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.255.230.104])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 01:30:13 -0700
Date: Thu, 31 Mar 2022 01:30:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] drm-tip compile break
Message-ID: <20220331083012.teu6v3c45gkgdicf@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
 <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
 <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
 <20220331081529.4gsfd6diznsjzfay@ldmartin-desk2>
 <afa8f35b-88a0-236d-6740-e36ce12c851b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afa8f35b-88a0-236d-6740-e36ce12c851b@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 10:20:58AM +0200, Christian König wrote:
>Am 31.03.22 um 10:15 schrieb Lucas De Marchi:
>>On Thu, Mar 31, 2022 at 09:35:50AM +0200, Christian König wrote:
>>>Well the fix is trivial, but somehow rebuilding drm-tip always 
>>>fails for me while merging drm-intel-next.
>>>
>>>I probably have somehow messed up reverting the conflict 
>>>resolution. Ideas?
>>
>>It looks like the error is in the wrong conflict resolution in
>>629041de3a0c M─┐ Merge remote-tracking branch 
>>'drm-misc/drm-misc-next' into drm-tip
>>you'd need to redo the merge (-i) after telling git
>>rerere to forget the previous conflict resolution.
>>
>>https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdrm.pages.freedesktop.org%2Fmaintainer-tools%2Fdrm-tip.html%23removing-a-wrong-conflict-resolution&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7b9d9727a7314f7a9a8d08da12ee9ee2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637843113330258383%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=y5KjOfpLsu%2B42zDUZmKlkOFNHiAsjHfNPNMEVeZ9wLI%3D&amp;reserved=0
>>
>>
>>it's also useful to use dim -i, to make sure we can build on each merge
>>afterwards.
>>
>>AFAICS the revert would be on 141577c6d0bd 
>>("2022y-03m-29d-09h-01m-04s UTC: drm-tip rerere cache update")
>>
>>taking a stab on it, should be like below. It even builds,
>>but I have no confidence to commit it.
>
>Please go ahead with that, it looks correct to me.

done


>
>I somehow messed up my installation so badly that even a "drm 
>rebuild-tip" doesn't work any more and fails to merge drm-intel-next 
>with a conflict which seems to already be resolved.
>
>And when I try to resolve it once more drm-tip says only "Preimage für 
>'drivers/gpu/drm/i915/intel_pm.c' aufgezeichnet." and doesn't seem to 
>remember the conflict resolution.
>
>Any advise how I can fix this?

probably: 

	dim ub
	git clean -fxd
	git reset --hard drm-tip/rerere-cache


To try without pushing, you can do:

	dim -d rebuild-tip

it would also be good to get a review on 
https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/16
that has some improvements on dry-run and other things.

Lucas De Marchi


>
>Thanks,
>Christian.
>
>>
>>Lucas De Marchi
>>
>>-------
>>diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>index dd78402e3cb0,68494b959116..000000000000
>>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>@@@ -200,17 -187,20 +187,17 @@@ static void amdgpu_gtt_mgr_del(struct t
>>   *
>>   * Re-init the gart for each known BO in the GTT.
>>   */
>> -int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>> +void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>>  {
>>-     struct amdgpu_gtt_node *node;
>>+     struct ttm_range_mgr_node *node;
>>      struct drm_mm_node *mm_node;
>>      struct amdgpu_device *adev;
>> -    int r = 0;
>>        adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
>>      spin_lock(&mgr->lock);
>>      drm_mm_for_each_node(mm_node, &mgr->mm) {
>>-         node = container_of(mm_node, typeof(*node), base.mm_nodes[0]);
>>-         amdgpu_ttm_recover_gart(node->tbo);
>>+         node = container_of(mm_node, typeof(*node), mm_nodes[0]);
>> -        r = amdgpu_ttm_recover_gart(node->base.bo);
>> -        if (r)
>> -            break;
>>++        amdgpu_ttm_recover_gart(node->base.bo);
>>      }
>>      spin_unlock(&mgr->lock);
>>  diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>index fc4563cf2828,28f5e8b21a99..000000000000
>>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>@@@ -375,9 -375,7 +375,9 @@@ static void amdgpu_vm_bo_base_init(stru
>>      if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
>>          return;
>>   +    dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>> +
>>-     vm->bulk_moveable = false;
>>+     ttm_bo_set_bulk_move(&bo->tbo, &vm->lru_bulk_move);
>>      if (bo->tbo.type == ttm_bo_type_kernel && bo->parent)
>>          amdgpu_vm_bo_relocated(base);
>>      else
>>@@@ -2660,12 -2597,9 +2606,12 @@@ void amdgpu_vm_bo_del(struct amdgpu_dev
>>      struct amdgpu_vm *vm = bo_va->base.vm;
>>      struct amdgpu_vm_bo_base **base;
>>   +    dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>> +
>>      if (bo) {
>> +        dma_resv_assert_held(bo->tbo.base.resv);
>>          if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
>>-             vm->bulk_moveable = false;
>>+             ttm_bo_set_bulk_move(&bo->tbo, NULL);
>>            for (base = &bo_va->base.bo->vm_bo; *base;
>>               base = &(*base)->next) {
>>
>>
>>>
>>>Christian.
>>>
>>>Am 31.03.22 um 08:28 schrieb Christian König:
>>>>I'm going to take a look, but need to figure out how to find the 
>>>>broken merge
>>>>
>>>>Christian.
>>>>
>>>>Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
>>>>>Is anyone looking into fixing this:
>>>>>
>>>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 
>>>>>‘amdgpu_gtt_mgr_recover’:
>>>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: 
>>>>>‘struct ttm_range_mgr_node’ has no member named ‘tbo’
>>>>>    amdgpu_ttm_recover_gart(node->tbo);
>>>>>                                ^~
>>>>>make[4]: *** [scripts/Makefile.build:288: 
>>>>>drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>>>>>
>>>>>Thanks.
>>>>
>>>
>
