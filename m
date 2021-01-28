Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F050A307B03
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 17:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174AF6E21A;
	Thu, 28 Jan 2021 16:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4137C6E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 16:33:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c4so3333358wru.9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mS4VbiBmP+TiGI4tqZd3H3wmmFTbUqmfEe4EGj5uZTQ=;
 b=jALa73k4QK4Uy0+5UktdwYg0c7XpKg8EpVst2mobL07iI/od5OxnP30mSDNFqjQTVY
 /1l1XT0nI9+XoMnyTyM/fCLDV5QzyqbDq8o0D68xNu4wQRM1O2ELY5U94tZDQf3Zblj/
 aHYjZjRqjFI6A9KZTBLIhO+viSYci6LYSlOXJbofHlIIO0xfFWu2Bds6P+yR9MPx4CaH
 VblRiCZYw7f7hpxWVFx+7WsP8N13Aew8R2XYRT2mfTKIAKjJlchp58AJuFEctm841hVR
 yMMgZiqpdJmagniZ6mhrDbjVbbMDlNqvMgJ4lqkzL2DbMTMrs9etUdAnHI+SyU+zWJqv
 atgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mS4VbiBmP+TiGI4tqZd3H3wmmFTbUqmfEe4EGj5uZTQ=;
 b=XB/XIEhlSUnPkgC7KRw7mytkqNG6Wv7ulvCYhFE9T2nkg6KEuDN9IQnLya7kPkV0eZ
 vSeFnrW1KMN/q9DLDU41BswfYC+2FEnvpxxo6kLnDLa+uVp2ORFnifGrcaaNJswAlhrl
 6DUgEg2HMbwmPn0/vftOQYmHQpEMkas4VRavzz9fgB5GRJKv3iFTRTUagejoXRB4rtd7
 JyxVAMYOpGhnlc8WTfMq4uLt5KQwh9WKcF0M3W8UbypM2ubCxQz/+HOJTwSsduuTUBtx
 8h/0fbFZ/FfSgiYW6XtyBa+odGCPy474agOcuSbTIUnYnwZtqknDUwJP5AwMrF5iGRG+
 +PQw==
X-Gm-Message-State: AOAM532g0cwRJ/GGzL9ew4tk18H5s3alwfuYKubcEoH2QjtZnQ4udjmH
 nUmxNp8JgJxOjKIc7F0m/xU=
X-Google-Smtp-Source: ABdhPJzXc7RAcUzkhqmVzI5/o/6zMGEWLiJthw7dPGDuM3HIKgO1NIh8wZNNDVCWgLTJkb2rzY4xcg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr17870569wrr.409.1611851587974; 
 Thu, 28 Jan 2021 08:33:07 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 62sm6630860wmd.34.2021.01.28.08.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:33:07 -0800 (PST)
Subject: Re: [PATCH v12 2/8] arm64: dts: mt8183: refine gamma compatible name
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-3-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a8d5d947-532c-a9f9-d249-e1a0b246c41a@gmail.com>
Date: Thu, 28 Jan 2021 17:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128112314.1304160-3-hsinyi@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/01/2021 12:23, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> mt8183 gamma is different with mt8173
> remove mt8173 compatible name for mt8183 gamma
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.11-next/dts64

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 6c84ccb709af6..9c0073cfad452 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
>  		};
>  
>  		gamma0: gamma@14011000 {
> -			compatible = "mediatek,mt8183-disp-gamma",
> -				     "mediatek,mt8173-disp-gamma";
> +			compatible = "mediatek,mt8183-disp-gamma";
>  			reg = <0 0x14011000 0 0x1000>;
>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
