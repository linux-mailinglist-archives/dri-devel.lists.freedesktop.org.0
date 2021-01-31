Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EC309B98
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3C66E1A4;
	Sun, 31 Jan 2021 11:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B986E0C2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:29:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id j18so10217074wmi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 03:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XHb9cnox9HkjfJVutQn1daYnX6lfpuc7jeu45/QEfeI=;
 b=EQeHdvxEhoyJe9zcUUy/4MUJFr7xk942ZePSW3M+m4/sZqotS29RG3HdBcEcP1JOnz
 wQ4Ya6LxkaogoTRIFPlBQ3EuyVVEuvnfD2d2pNE3LB8kuITs9n5zz4i/qbxTI47/MC3J
 O5ZwA3QvAGZzaPJ3UmgGVagq/DwjwPMQjz+whLq7tTbDcOHT2JxvrBcNmsCw1ZMXag3h
 xdvh9Nlslmy1Iu6NpKqdj8r17O1lMsb5PoeaylQ7VMLm+dXzQi8nsd7GeHoQ1zDIeqpa
 IQQ4kySEJZLafR7+bzuz6rDegIID4bF9hyEegbodxfMtUeC9SnDbMWomOmFOdiOaF40C
 Fkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XHb9cnox9HkjfJVutQn1daYnX6lfpuc7jeu45/QEfeI=;
 b=MU6NVx/5NbzfkbHYVQwyIjqDYDOJ6yo2Shkf2dufJ2ook0qXuN+ZSmABTmQZtYFx6F
 1uvwA9bM0vgQdgM6SJyWpZeii6SgORK7T1QhunMJ836xHnswEUzsc9h+UXp5HBzvo+B2
 6jbPmdkK4phRWW4wJUHpJkUGZlqeEWv8kMVm3EANl92Z6537PWvEbYJMDE/UVgNiPPNy
 DbAOHCjnPGjyiqANHtcTMqKKSlcZ8Hffj3+rDMQwo0BkGXby8oGIsGy9xRKK+OK7qOFe
 KL/exUTgYnPdJtAZfgAOxVx5sljjnZxyl73KFmnNxe1bLP5dTKnSO0wKiL+qh+zxPGvX
 F9lw==
X-Gm-Message-State: AOAM530xIR8xNX4k/5wM/XjF/57f57GJXjAO8jh657g3WuQ8unsapWZC
 RSbuzcYyjonErLpwD8gGTw4=
X-Google-Smtp-Source: ABdhPJxldbS+DBTdSmlDy0S9DQbm5EfFn+7dzBMcUpRAq1/jcgUEDxeOgVOPME7rz9Liocj4zeWn8g==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr10719171wmq.156.1612092582086; 
 Sun, 31 Jan 2021 03:29:42 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z18sm22061538wro.91.2021.01.31.03.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 03:29:41 -0800 (PST)
Subject: Re: [PATCH v13 1/8] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <72ebe1a7-a54b-fafc-c58b-05b06d63e210@gmail.com>
Date: Sun, 31 Jan 2021 12:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129092209.2584718-2-hsinyi@chromium.org>
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

Hi Hsin-Yi,

On 29/01/2021 10:22, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> property name must include only lowercase and '-'
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

I applied 1/8 and 2/8 already, so please drop them for v14.

Thanks,
Matthias

>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7e..6c84ccb709af6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>  			mediatek,larb = <&larb0>;
> -			mediatek,rdma_fifo_size = <5120>;
> +			mediatek,rdma-fifo-size = <5120>;
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>  		};
>  
> @@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
>  			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>  			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>  			mediatek,larb = <&larb0>;
> -			mediatek,rdma_fifo_size = <2048>;
> +			mediatek,rdma-fifo-size = <2048>;
>  			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>  		};
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
