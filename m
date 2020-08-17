Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EEB2466A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 14:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F376E0CE;
	Mon, 17 Aug 2020 12:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FED6E0CE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 12:52:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597668731; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JGVe9PW+tTDsQAAqGjQ8ritTdegK9mneovtsPPAvGdU=;
 b=wse4s9tcYK9MLudW2ntUawBE005juOyefiuDUnvDHh3djR7U/Z0CoWTsmxGVIb3fVi2/g0Rm
 vO28cfPZSS3qD8icgQNG/N5SOCYj14d9GEx7sKIQIz2df9DEkB3bBywfamQmGpvcaywHkaKb
 hkPjnB9MusrA4NtCGtf+GPMKaWQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f3a7d6d8567201751bdf31a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 12:51:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C24A6C43391; Mon, 17 Aug 2020 12:51:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.7] (unknown [117.217.239.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3ABC4C433CA;
 Mon, 17 Aug 2020 12:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3ABC4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [RESEND PATCH] drm/msm/a6xx: fix frequency not always being
 restored on GMU resume
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20200813185450.19387-1-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <270c4efd-8524-c389-3347-2f9c4e246b6d@codeaurora.org>
Date: Mon, 17 Aug 2020 18:21:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813185450.19387-1-jonathan@marek.ca>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Why don't we move the early return in a6xx_gmu_set_freq() to 
msm_devfreq_target() instead?

-Akhil.

On 8/14/2020 12:24 AM, Jonathan Marek wrote:
> The patch reorganizing the set_freq function made it so the gmu resume
> doesn't always set the frequency, because a6xx_gmu_set_freq() exits early
> when the frequency hasn't been changed. Note this always happens when
> resuming GMU after recovering from a hang.
> 
> Use a simple workaround to prevent this from happening.
> 
> Fixes: 1f60d11423db ("drm: msm: a6xx: send opp instead of a frequency")
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b67b38c8fadf..bbbd00020f92 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -845,6 +845,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>   	if (IS_ERR_OR_NULL(gpu_opp))
>   		return;
>   
> +	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
>   	a6xx_gmu_set_freq(gpu, gpu_opp);
>   	dev_pm_opp_put(gpu_opp);
>   }
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
