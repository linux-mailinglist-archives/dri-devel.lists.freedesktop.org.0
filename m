Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0773561E91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52BF10ED47;
	Thu, 30 Jun 2022 14:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A634310E125;
 Thu, 30 Jun 2022 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656601167; x=1688137167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5hIiZ+xX0clGrQ4KYAhk9azc+acuKglpoTjIYfYyYg4=;
 b=SAoPCmXoreqn938Ok1Sd50CtXymnFEZiR9ZIQhHE6HydtdDvyK2nGn5W
 d3071JJg0cEJP9mppvVozSJV+5L0378nghHDTNR1E+XYw/M+WocM3Guhj
 HCGswkziFbvLJwC6Bu8GM+IHioH7XNvA1vPBgUp5FthrhJi/Ne58Da4FC 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 30 Jun 2022 07:59:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:59:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 07:59:24 -0700
Received: from [10.216.41.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 07:59:18 -0700
Message-ID: <7051f99a-751f-38e2-6d9d-f9c2439dc012@quicinc.com>
Date: Thu, 30 Jun 2022 20:29:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 1/4] drm/msm/adreno: Remove dead code
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
References: <20220528160353.157870-1-konrad.dybcio@somainline.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220528160353.157870-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, Jonathan
 Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 jamipkettunen@somainline.org, linux-kernel@vger.kernel.org,
 Wang Qing <wangqing@vivo.com>, Yangtao Li <tiny.windzz@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@somainline.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Dmitry Osipenko <digetx@gmail.com>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/28/2022 9:33 PM, Konrad Dybcio wrote:
> This BUG_ON will never be reached, and there is a comment 20 above
> explaining why.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 3e325e2a2b1b..b1c876c339d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1548,8 +1548,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   		if (ret)
>   			goto err_memory;
>   	} else {
> -		BUG_ON(adreno_is_a660_family(adreno_gpu));
> -
>   		/* HFI v1, has sptprac */
>   		gmu->legacy = true;
>   

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil

