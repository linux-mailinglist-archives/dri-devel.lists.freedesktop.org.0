Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E3307AFD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 17:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E62897E9;
	Thu, 28 Jan 2021 16:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CBC896B0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 16:31:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id 7so6060435wrz.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aB7zuQWcrPzPmAQrvOloCgHrIKsDNj/0Gfzl4leTLYE=;
 b=e5uIsa58hkgWWmUhwaKnmmHmMUqxBkDVk7uZLLwbgjSz2lN4sTUnVWwF1moV9j/Zfm
 9SoMLVIaxYNZCG9mfg/6Frbu3C2JGaXQqMN6L+v+3zyCD+pk6JpVlVSYBhu5O4Xe9OUa
 0ieB3VbXfC/pLsnVtkmY26Vq5jDJkM3FNHnQN9Lz0ywTWglPxoQPT2+TKvizMPwOmUAT
 f0ouhlrpI7UphqCMOrtQTF3xmHtt4oqHX/eBzNg59KoIpx/PI1k1TPNVlnBNpYFCb2jb
 hppBiESlyfW1zUk11ucEBIlEnNnprnXvBmPYkuSsedCk07W0f4bXH25nu+Xdf7/jplag
 bT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aB7zuQWcrPzPmAQrvOloCgHrIKsDNj/0Gfzl4leTLYE=;
 b=SKJ/1RBXK98LjxF3q+jQp1E7EC07siMX8YvsQ7DDj+1e3y2Ma3P6Fa1vZY25sPsW0X
 +XHhIac4aF3F0DIMxAC8Njz8J9eOWlN9xRQmxRf9aPB8oGy3vlezSO0lJJmh6D0IfnGR
 sNq1gypK6cESp/6n8eNZM4HFozCFAQ7QaSEtniPOSS7IlBkymJm/DWeuwDAEJxgGlgeV
 RC+Vi4gt7OrZnpsd/vp+L/IIuqsNQKQ3TRVwzhif9Xmb0nMl6HyDJYQQKOWTS8QrvgcI
 olkYyKhs3jjKQxOcgO4SJ8uKmPqzD0PPU0XB0t7ezlCrrqU6LsxcQMoR1XOrW00F5yJr
 W+1w==
X-Gm-Message-State: AOAM533V3aXRj1nvAgF035mrO+TbMcAOvWD8Ak3MLLcKkKb9eid0BKcg
 XHUD4Ev/iaSLB7JgdRZO0ug=
X-Google-Smtp-Source: ABdhPJwYip4jGo3j1j/kpGaNQKnhSrNc2zFSNPByK826616JOYqRX00Y68OHdP666t5omBXVRS5RQQ==
X-Received: by 2002:adf:e511:: with SMTP id j17mr14390620wrm.17.1611851512379; 
 Thu, 28 Jan 2021 08:31:52 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id b3sm7439842wme.32.2021.01.28.08.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:31:51 -0800 (PST)
Subject: Re: [PATCH v12 1/8] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5eec39ff-de13-a749-d8c2-f2426e9565ed@gmail.com>
Date: Thu, 28 Jan 2021 17:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128112314.1304160-2-hsinyi@chromium.org>
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
> property name must include only lowercase and '-'
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.11-next/dts64

Thanks

> ---
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
