Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA64D045C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5DD10E089;
	Mon,  7 Mar 2022 16:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75C10E089
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:43:25 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso1889539ooj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ahRBp9yt0ZPpBFG2Tzui7hdIn/8fP27GT8DryPqqNA=;
 b=WFTt40wJT9u6EVRBAnCcRmFf9RPoCxrALhBhhUOOv0EltGYmFHOlOMMUXVAtLytKFF
 xk6MsqcY13Rpk8hyZir3N0z5jz+e71r1L4zwqc/w1pxBjRLjBVgqWIwe5ESlQKfuKaNg
 3mLqdimuPq4KRiUxrNbUKmKDOJr6qZ3RpH60ZkTBtUvXlf4z8LWQq3Q/uMgIIQmQP05z
 OfgaRZORXNrRKihXjdg1BkigIk0rQs4Wa3gmsYPbSReiVMo+DADN1Yj9wzOLz11ZS9Hx
 DDhoF1rx2fPEDNNod3/SjocIbp/DrvvxW24XWa9GzoaJoSEW14wKs+RQJlPHuwgIBep3
 Nh4A==
X-Gm-Message-State: AOAM533lCs86YArsGNPbO583/xaPW7A0YrEGdMgBCGAxnDSBDaP1Y8K6
 SU5BzlGbILkVa+83i+yzYA==
X-Google-Smtp-Source: ABdhPJwK7Z8VahsxmcSCvl23V4RUpi+Y1xGPVc+4r9GinlZLpWcbqoisF16Xe98HLqEc7r2Fua2VNA==
X-Received: by 2002:a05:6870:315:b0:d9:a20e:c0bf with SMTP id
 m21-20020a056870031500b000d9a20ec0bfmr6530459oaf.128.1646671404592; 
 Mon, 07 Mar 2022 08:43:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g2-20020a9d5f82000000b005af678c9cfdsm6527808oti.41.2022.03.07.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:43:23 -0800 (PST)
Received: (nullmailer pid 2731161 invoked by uid 1000);
 Mon, 07 Mar 2022 16:43:22 -0000
Date: Mon, 7 Mar 2022 10:43:22 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Message-ID: <YiY2KiXz1qsFQvuM@robh.at.kernel.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307154558.2505734-3-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 04:45:58PM +0100, Robert Foss wrote:
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>  
>  			anx7625_in: endpoint {
>  				remote-endpoint = <&dsi_out>;
> -				bus-type = <5>;
> -				data-lanes = <0 1 2 3>;

Well, this was clearly wrong. Connected to a DSI output, but parallel 
interface with lanes...

We should have a schema to disallow this combination.

Rob
