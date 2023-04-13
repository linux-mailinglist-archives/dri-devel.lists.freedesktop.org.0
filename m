Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4896E0992
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700DC10EA8E;
	Thu, 13 Apr 2023 09:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8110EA8E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:02:30 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e7so3386826wrc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681376548; x=1683968548;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ldTjgbcAixArTLp8Y3OwHiWDDm8sGdVLf5wYTEAfqeg=;
 b=Sq5siWuukFu2ZV2SC5RtzEOr90Zr3KADENV26Bcj0bkBKMEDDDiM4JLiedIbsGmM6/
 BpcIyDVkAfqs0T5sp4+dhaJ/a8fvtOtLU/dVNXQtVb6muPxOUfylQpCtAPUnf9ZDnD1N
 OUsXuUxo4AcxJGPKCiv29bMPXUeeKmzTa5jzzYG9xelseWYh7pI/mtRJw26RhA9rqU+6
 PQMoTZ4VJX8y2aAEA4TQrdn8lu4dKPxyjcspBIKNTkRnc21PjvOPW2Z8ABijJgHRH18k
 VV9O2EQfumjBnwcdMIxGuo+bLSkMnncdkcRHP6m4jYcMjXXD2cjI1EktepxPYL6li4Nc
 I5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376548; x=1683968548;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ldTjgbcAixArTLp8Y3OwHiWDDm8sGdVLf5wYTEAfqeg=;
 b=C5pp1AJazV0z2o1jv5o41knIqYIA+y/tdsbTAo3VlcWAAT+d89nZSqC8mKV0Ju4k4+
 euguCbXRKoTvdNBosSJQF/aq2RiQZdM/I1ooZ9oNH79Bam0p2r68/MkM0LzyTJWjV9hE
 +Q3j7MtlaTAgLynVYkE3I6JkeW9FmdPnnLqlEq38JpjErUpn9noAGAZPNwxXmv2Ko73R
 4cMPwqc7Bs0MjXfA0WiYCcjGx7g1I4+83Iw+M0/8wFMfhUOtPWuGG/CE85gNnMUrLI7q
 Qo0bjKgFoflWbKuVCoLo3h14ekbO56mkHwZfnBxvPZ5g0eum6Ox2zJXOF7rRHh7G7ZNw
 f4xg==
X-Gm-Message-State: AAQBX9dJB4y79xUfLOSnXpa48x4L9rO1olIhLzpHI8vj4CB6yasZflFG
 aAcPSN1wCc+al1XKYuLGsnQ=
X-Google-Smtp-Source: AKy350asP4+G83mAEIf1p9IarcfPfSoPgb5XVETZON+sPwEmFsRqvaVHYjROuiy2L1CPru9rX5YgVQ==
X-Received: by 2002:a5d:4d0c:0:b0:2ce:fd37:938c with SMTP id
 z12-20020a5d4d0c000000b002cefd37938cmr907993wrt.50.1681376548080; 
 Thu, 13 Apr 2023 02:02:28 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056000015000b002f21a96c161sm820964wrx.70.2023.04.13.02.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:02:27 -0700 (PDT)
Message-ID: <b986d097-6cb4-cbde-3cd1-b8d68d222d9d@gmail.com>
Date: Thu, 13 Apr 2023 11:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com,
 shuijing.li@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because there are different definitions for cmdq
> register bit control in mt8188.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>   drivers/gpu/drm/mediatek/mtk_dsi.c     | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index a13b36ac03a1..9ba05961479d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -654,6 +654,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DSI },
>   	{ .compatible = "mediatek,mt8186-dsi",
>   	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8188-dsi",
> +	  .data = (void *)MTK_DSI },
>   	{ }
>   };
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..500a3054282d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1208,6 +1208,12 @@ static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>   	.has_size_ctl = true,
>   };
>   
> +static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
> +	.reg_cmdq_off = 0xd00,
> +	.has_shadow_ctl = true,
> +	.has_size_ctl = true,
> +};
> +
>   static const struct of_device_id mtk_dsi_of_match[] = {
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = &mt2701_dsi_driver_data },
> @@ -1217,6 +1223,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
>   	  .data = &mt8183_dsi_driver_data },
>   	{ .compatible = "mediatek,mt8186-dsi",
>   	  .data = &mt8186_dsi_driver_data },
> +	{ .compatible = "mediatek,mt8188-dsi",
> +	  .data = &mt8188_dsi_driver_data },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
