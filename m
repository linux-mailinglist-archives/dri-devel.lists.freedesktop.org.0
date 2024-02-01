Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC88845453
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 10:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD93510EAE7;
	Thu,  1 Feb 2024 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B2310E87E;
 Thu,  1 Feb 2024 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706780529; x=1738316529;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ikqlPofptowdFuxonJk/ufaJUSivjK6duE85XWDZU+Q=;
 b=SlpU4B5jXjjQO4FIz/m3X5DlUVX6qL+lp0XVad3DrM8K0QgPytQPgpsL
 70u9SaWKdLNISMxmVHAhrdd7/uqmNF3vI4zCeQLeAefyrhcW57ZeHB91e
 pIMQUE2horlhcVZ0gHKA7UoEuclu5gfgaz5QKofmQXYBTQKG6NeZCeEC/
 tBvmncc0dwIKMPZ6h2z4KgaxyAN9exGDjVcfg7p0SJGq98ssMb59wG9hV
 ZJ0X5m91qi5UqNN3h+xMUFx6vjM/GO9LSYTf0V9Tie2ZN0O4qzDJ8lTLx
 KpJJWnqiu7MlfTjOKRLGchBjMbr38wK7ZzhZefvYoKcJIwMDoFwl9W8mL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25317942"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="25317942"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4328030"
Received: from aragners-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.111])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:41:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/nouveau/acr/ga102: remove unused but set variable
In-Reply-To: <a8b9677e-2d51-4cdd-8105-02649ec221ea@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <4d9f62fa6963acfd8b7d8f623799ba3a516e347d.1704908087.git.jani.nikula@intel.com>
 <a8b9677e-2d51-4cdd-8105-02649ec221ea@redhat.com>
Date: Thu, 01 Feb 2024 11:41:53 +0200
Message-ID: <87le84h672.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> On 1/10/24 18:39, Jani Nikula wrote:
>> Fix the W=1 warning -Wunused-but-set-variable.
>> 
>> Cc: Karol Herbst <kherbst@redhat.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: nouveau@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Thanks, pushed to drm-misc-next.

>
>> ---
>>   drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
>> index f36a359d4531..bd104a030243 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
>> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>>   		const struct firmware *hsbl;
>>   		const struct nvfw_ls_hsbl_bin_hdr *hdr;
>>   		const struct nvfw_ls_hsbl_hdr *hshdr;
>> -		u32 loc, sig, cnt, *meta;
>> +		u32 sig, cnt, *meta;
>>   
>>   		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
>>   		if (ret)
>> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
>>   		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>>   		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
>>   		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
>> -		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
>>   		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
>>   		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
>>   
>

-- 
Jani Nikula, Intel
