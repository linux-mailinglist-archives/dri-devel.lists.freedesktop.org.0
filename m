Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C290714B2A
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473810E293;
	Mon, 29 May 2023 13:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F410E293
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:55:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30aa1eb95a0so3256559f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368533; x=1687960533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nTPwRcU9/1owFrxG0zY81x47hBDLk9OGUJzI1r232yU=;
 b=LWr/g27RUnLmjW3T0TzziGpJ6dU3yFMD0ZkbRXguiTeMWWNxRMcii3JVD3SdkYxLSL
 Q2zJc/hK+eVilxyWDq9VWLGOiwv2+OtPXq+Btm7uYOf86seEzZF0YIeCX+yjMSboiI2c
 88KAAH9HIiP8mIksgsZp+PAj4ru1k2qAoBwvknLWWIaxLiYqCPXrfpQdR3t64Yo/smWw
 mssYTEQkhqQzqJUIQIGqE8ovS1Q8LVE8onl+dSfriT/vuzqlQjQ1KBty0AmTEQCfA9PE
 kRsrsF9w1ILVCA088Hb4AdoGwDJATkxgpNUDeaRcHGpXzc9qAEwwwGArtJWsIkXf3ISB
 x31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368533; x=1687960533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTPwRcU9/1owFrxG0zY81x47hBDLk9OGUJzI1r232yU=;
 b=lApGneMaPtlP8Tsde/QFtKHiLiH9Q/ctR24wtAkElfNRGuPdXvm9Lm3WcUYCnWr9Kb
 UO8xhBaZOUuiI4S6VUfJ5EE2WMqNRIuAaxSvHsdlQmQk9xxycs5+4sggtmQxSEYBh0iR
 qzOglqR52a8xdbWJYH3GDyTLaFgEJ2ziB6lU17/EHQZ4qcR7nPN8aaR38sZPgUy18lyg
 8W6Qs34288hh1JNGVmWyepNHJPSXGw10aQQEEp5wocntUDDEx2C4tNeuw1Mlq3MIyx8m
 ys8wX6dGLf4tU+xdE1+kLRdNxG/SnHQanEYwKbprBPV0/lNpgyP3iw5aewuNv0KF9gut
 A/dw==
X-Gm-Message-State: AC+VfDx1g2x/ZA4p9fUuwg0NDAOSxoGhFUqb+YhHMoYlmKt0Q7EU6G90
 03OrQ+vCtREk415pqCXLZ4M=
X-Google-Smtp-Source: ACHHUZ5eSkNEsDiTtiEBDzlhzfIK9hH43HFqaSiCjMt3hgF///ZXBnNz6oeXz1iWZkcB2H6r75yy/A==
X-Received: by 2002:a5d:4143:0:b0:30a:ec3b:58d8 with SMTP id
 c3-20020a5d4143000000b0030aec3b58d8mr1939358wrq.3.1685368533466; 
 Mon, 29 May 2023 06:55:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d5344000000b00307acec258esm74633wrv.3.2023.05.29.06.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:55:32 -0700 (PDT)
Message-ID: <86a96f9d-196a-8592-41ac-f3b8303d55c6@gmail.com>
Date: Mon, 29 May 2023 15:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/27] arm64: dts: mediatek: mt6795: Add MMSYS node for
 multimedia clocks
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-18-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-18-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add the MultiMedia System node, providing clocks for the multimedia
> hardware blocks and their IOMMU/SMIs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 99cc4918e6ba..a8b2c4517e79 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -635,6 +635,19 @@ mmc3: mmc@11260000 {
>   			status = "disabled";
>   		};
>   
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6795-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> +			assigned-clock-rates = <400000000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +		};
> +
>   		vdecsys: clock-controller@16000000 {
>   			compatible = "mediatek,mt6795-vdecsys";
>   			reg = <0 0x16000000 0 0x1000>;
