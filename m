Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED64293DF5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 15:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D496ECCE;
	Tue, 20 Oct 2020 13:57:49 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4986ECCE
 for <dri-devel@freedesktop.org>; Tue, 20 Oct 2020 13:57:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603202268; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=sFsR7M8X8a+NGk5pENhxehQ5yW7VE3tjrETpgs/Etbg=;
 b=AMeE3bccQgrlpghptvuXWroDYHyZxktyJYuxzDlKaxLPf+cjFW/zW34NKddmuPt2j0FHXJHA
 wQ3c+0gVnLy/GqA0T80JqT7sY9NU7wG52mc5bMOa1dS2T74miCLPMSsO3c9cnRPFCvbRdvlC
 ABeCCASC8jwwPV822lvD297xsKc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f8eecc1aad2c3cd1c98cf6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 13:57:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 66007C433FF; Tue, 20 Oct 2020 13:57:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.179.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 84A3AC433CB;
 Tue, 20 Oct 2020 13:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84A3AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH 2/2] drm/msm: Fix duplicate gpu node in icc summary
To: freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
References: <1603113558-23330-1-git-send-email-akhilpo@codeaurora.org>
 <1603113558-23330-2-git-send-email-akhilpo@codeaurora.org>
 <20201019145922.GB31882@jcrouse1-lnx.qualcomm.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <e9e72bd7-0048-6e9f-8ca0-f5163c1b05f5@codeaurora.org>
Date: Tue, 20 Oct 2020 19:27:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201019145922.GB31882@jcrouse1-lnx.qualcomm.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/2020 8:29 PM, Jordan Crouse wrote:
> On Mon, Oct 19, 2020 at 06:49:18PM +0530, Akhil P Oommen wrote:
>> On targets with a6xx gpu, there is a duplicate gpu icc node listed in
>> the interconnect summary. On these targets, calling
> 
> This first sentence is confusing to me. I think the following few sentences do
> a better job of explaining what you are trying to do.
I can just remove that line.
> 
>> dev_pm_opp_of_add_table() api initializes the icc nodes for gpu indirectly.
>> So we should avoid using of_icc_get() api in the common probe path. To fix
>> this, we can move of_icc_get() to target specific code where it is
>> required.
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 21 +++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 20 ++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 29 +----------------------------
>>   3 files changed, 38 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
>> index f29c77d..93da668 100644
>> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
>> @@ -519,6 +519,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>>   	struct msm_gpu *gpu;
>>   	struct msm_drm_private *priv = dev->dev_private;
>>   	struct platform_device *pdev = priv->gpu_pdev;
>> +	struct icc_path *ocmem_icc_path;
>> +	struct icc_path *icc_path;
>>   	int ret;
>>   
>>   	if (!pdev) {
>> @@ -566,13 +568,28 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>>   		goto fail;
>>   	}
>>   
>> +	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
>> +	ret = IS_ERR(icc_path);
>> +	if (ret)
>> +		goto fail;
>> +
>> +	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
>> +	ret = IS_ERR(ocmem_icc_path);
>> +	if (ret) {
>> +		/* allow -ENODATA, ocmem icc is optional */
>> +		if (ret != -ENODATA)
>> +			goto fail;
>> +		ocmem_icc_path = NULL;
>> +	}
>> +
>> +
>>   	/*
>>   	 * Set the ICC path to maximum speed for now by multiplying the fastest
>>   	 * frequency by the bus width (8). We'll want to scale this later on to
>>   	 * improve battery life.
>>   	 */
>> -	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> -	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> +	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> +	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> 
> This seems reasonable but I hope we can get somebody to sign off on a real a3xx
> part.
> 
>>   
>>   	return gpu;
>>   
>> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> index 2b93b33..c0be3a0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> @@ -648,6 +648,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>>   	struct msm_gpu *gpu;
>>   	struct msm_drm_private *priv = dev->dev_private;
>>   	struct platform_device *pdev = priv->gpu_pdev;
>> +	struct icc_path *ocmem_icc_path;
>> +	struct icc_path *icc_path;
>>   	int ret;
>>   
>>   	if (!pdev) {
>> @@ -694,13 +696,27 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>>   		goto fail;
>>   	}
>>   
>> +	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
>> +	ret = IS_ERR(icc_path);
>> +	if (ret)
>> +		goto fail;
>> +
>> +	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
>> +	ret = IS_ERR(ocmem_icc_path);
>> +	if (ret) {
>> +		/* allow -ENODATA, ocmem icc is optional */
>> +		if (ret != -ENODATA)
>> +			goto fail;
>> +		ocmem_icc_path = NULL;
>> +	}
>> +
>>   	/*
>>   	 * Set the ICC path to maximum speed for now by multiplying the fastest
>>   	 * frequency by the bus width (8). We'll want to scale this later on to
>>   	 * improve battery life.
>>   	 */
>> -	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> -	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> +	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
>> +	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> 
> Less confident we can find any 4xx fans to test this, but if a3xx works then so
> should this (in theory).
> 
>>   	return gpu;
>>   
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index fd8f491..6e3b820 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -920,35 +920,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   
>>   	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>>   			adreno_gpu->info->name, &adreno_gpu_config);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/*
>> -	 * The legacy case, before "interconnect-names", only has a
>> -	 * single interconnect path which is equivalent to "gfx-mem"
>> -	 */
>> -	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
>> -		gpu->icc_path = of_icc_get(dev, NULL);
>> -	} else {
>> -		gpu->icc_path = of_icc_get(dev, "gfx-mem");
>> -		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
>> -	}
>>   
>> -	if (IS_ERR(gpu->icc_path)) {
>> -		ret = PTR_ERR(gpu->icc_path);
>> -		gpu->icc_path = NULL;
>> -		return ret;
>> -	}
>> -
>> -	if (IS_ERR(gpu->ocmem_icc_path)) {
>> -		ret = PTR_ERR(gpu->ocmem_icc_path);
>> -		gpu->ocmem_icc_path = NULL;
>> -		/* allow -ENODATA, ocmem icc is optional */
>> -		if (ret != -ENODATA)
>> -			return ret;
>> -	}
>> -
>> -	return 0;
>> +	return ret;
> 
> This could go even further:
> 
> return msm_gpu_init(...);
> 
Yep, we can do that. Thanks for the feedback.

--Akhil
>>   }
>>   
>>   void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>> -- 
>> 2.7.4
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
