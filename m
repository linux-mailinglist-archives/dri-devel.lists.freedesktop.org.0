Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95B4EB4ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 22:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058410EE63;
	Tue, 29 Mar 2022 20:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162E10EE63;
 Tue, 29 Mar 2022 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648587330; x=1680123330;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QOPFOuJOfba4L+FeuEz1NdlNEPoVm4AUyXGmKyFlUQQ=;
 b=M0bYKFcFShHgTdGjKsbYOwuvw/zdQuUZA3SUBCmFCInlew4yMuGMDs/a
 T/dCXC9xaqFrOj+DQHvVKwmYoDYm23yi7Jiq7k0pf4P60IYuJbInAYkCQ
 IbHMUQdlfWpg4IA1peg33VBhyACxe5eaVacU848kwP2Swebbv96oANHRr A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 13:55:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 13:55:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 13:55:28 -0700
Received: from [10.110.122.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 13:55:27 -0700
Message-ID: <a10755a4-a2dc-f0f2-7828-e2617c573116@quicinc.com>
Date: Tue, 29 Mar 2022 13:55:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm: msm: add null pointer check
Content-Language: en-US
To: <cgel.zte@gmail.com>, <robdclark@gmail.com>
References: <20220329103416.2376616-1-lv.ruyi@zte.com.cn>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220329103416.2376616-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, lv.ruyi@zte.com.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org, sean@poorly.run,
 Zeal Robot <zealci@zte.com.cn>, greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems to be a duplicate of

https://patchwork.freedesktop.org/patch/479378/

Thanks

Abhinav

On 3/29/2022 3:34 AM, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> kzalloc is a memory allocation function which can return NULL when some
> internal memory errors happen. Add null pointer check to avoid
> dereferencing null pointer.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index 5d2ff6791058..acfe1b31e079 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -176,6 +176,8 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
>   	va_list va;
>   
>   	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
> +	if (!new_blk)
> +		return;
>   
>   	va_start(va, fmt);
>   
