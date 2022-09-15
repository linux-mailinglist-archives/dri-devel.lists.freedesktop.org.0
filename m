Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD205B9F44
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623C710E1F3;
	Thu, 15 Sep 2022 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6533910E1E5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 15:59:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bq9so31587571wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=t0i/TBZDs7elMmSaK59d+TIsx+y7LWOVQuu86421qJg=;
 b=XyXui7x1eEUDQwQQYrglR5eB3aj/RM0yZ3vcjpOHBJXQ80mfYNO1sTXtlv++vne7JK
 /Mb/Gftu6+B1z//gjd9lA9w+3EskiTjR6GrT7VbfPgr8ANZ0NQS/jebJwk/HfeNa1Zda
 cZUrqR8WgC5m8Ji2tNo7qCIu2tqH3xb97rIUsEvPCDgLx71HziJjgH73WlUiIJahQ3jQ
 Q8EieUvvkme3gKk3atiXyHnvglkX8hlJtqMig2juqtb2tvbp0M+Tsmq1VTpsrErPWgaY
 irarFeT8Mcy0NfVUqciaE7pIi1+1tr4hg/t8/EBNNYe53xpssacCXSIjZsl9GO2pMdtn
 kSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t0i/TBZDs7elMmSaK59d+TIsx+y7LWOVQuu86421qJg=;
 b=os0gTAb7JsJWTCd3xOjbDsnBQ3bMLXK8kE7EA6cHp+yIiaTKY34LgX9OwCIlf/o6O4
 tfXdSzs83vUksWkqV3Qt1WMykfLa5+suieKjK/rZ8+wNQ9Z+cWpNZUql5NgZcl5Ub6XM
 8FV4ajjnCAdT7NFZ0Y6ygZlQw0EaWXIHVhIrOwIgCsuJNfZKTxa+uwn0+Ll5qZA59Ctg
 FZy71b7e7cLvb9EfPMdr9Fx71/xcke0A9L3k2IMNa8J2iutlL9aYTrZJ3cJ9P0glA+hK
 dA+fCVD57wttjLLRtorz/nrm1VNAzkhS0afed+nr/5MbmLjUtrnwsoY2OVwM8rKVxoDt
 poaQ==
X-Gm-Message-State: ACrzQf22J5M+Ya+d2KLlrS3ioWOKEIxWnuhY9ZGggBIZlpOZwcesu/nP
 KCo7o0zuT3aSwfteuabmuOE=
X-Google-Smtp-Source: AMsMyM5/jiNeWYU9WoRMSlLzfCdBR8Xnr6/lfRMXtFiqq8S+1eZjAzfpnQw1yT+m4rqEm6haKmPb+A==
X-Received: by 2002:adf:cc92:0:b0:22a:361c:20b1 with SMTP id
 p18-20020adfcc92000000b0022a361c20b1mr205701wrj.691.1663257563771; 
 Thu, 15 Sep 2022 08:59:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003a62400724bsm3475950wmm.0.2022.09.15.08.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 08:59:22 -0700 (PDT)
Message-ID: <7c2242ff-f526-a305-9d4b-650427a58a9d@gmail.com>
Date: Thu, 15 Sep 2022 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] drm/mediatek: dp: Remove unused register definitions
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220915075028.644-3-rex-bc.chen@mediatek.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/09/2022 09:50, Bo-Chen Chen wrote:
> Some definitions in mtk_dp_reg.h are not used, so remove these
> redundant codes.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 096ad6572a5e..84e38cef03c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -153,8 +153,6 @@
>   #define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
>   #define MTK_DP_ENC0_P0_3094			0x3094
>   #define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
> -#define MTK_DP_ENC0_P0_30A0			0x30a0
> -#define DP_ENC0_30A0_MASK				(BIT(7) | BIT(8) | BIT(12))
>   #define MTK_DP_ENC0_P0_30A4			0x30a4
>   #define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
>   #define MTK_DP_ENC0_P0_30A8			0x30a8
> @@ -171,8 +169,6 @@
>   #define MTK_DP_ENC0_P0_312C			0x312c
>   #define ASP_HB2_DP_ENC0_P0_MASK				GENMASK(7, 0)
>   #define ASP_HB3_DP_ENC0_P0_MASK				GENMASK(15, 8)
> -#define MTK_DP_ENC0_P0_3130			0x3130
> -#define MTK_DP_ENC0_P0_3138			0x3138
>   #define MTK_DP_ENC0_P0_3154			0x3154
>   #define PGEN_HTOTAL_DP_ENC0_P0_MASK			GENMASK(13, 0)
>   #define MTK_DP_ENC0_P0_3158			0x3158
> @@ -206,8 +202,6 @@
>   #define SDP_PACKET_TYPE_DP_ENC1_P0_MASK			GENMASK(4, 0)
>   #define SDP_PACKET_W_DP_ENC1_P0				BIT(5)
>   #define SDP_PACKET_W_DP_ENC1_P0_MASK			BIT(5)
> -#define MTK_DP_ENC1_P0_328C			0x328c
> -#define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK		BIT(7)
>   #define MTK_DP_ENC1_P0_3300			0x3300
>   #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_VAL		2
>   #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK		GENMASK(9, 8)
