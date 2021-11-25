Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDF45E11C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 20:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1A6E0BE;
	Thu, 25 Nov 2021 19:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC356E0BE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 19:44:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x15so29653956edv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 11:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9oU1uXkriAScBT39Syg/FKdxMTMlNc0lBFBBQ20vggw=;
 b=JPHd9H3xP1jgvn5m4y21YhcKXqZIu/T7fmE2AkgGyO5anSKGRQiZ8blYyEHwr5giH/
 4VmsEIsQ+3wlv5BnT2OA4Cl4B0IXP7eEyFTWel9hinLR3sOIoCJO6SuYvpxHcyjXp6jM
 NxP3ccnej5BnWEEWt0/ig+1B4wp4rqpE4L4Wnpq7OjWh5RZ3r7ch4thiiM4RwHU+YHa3
 12J8noIJ9cioC0bxD/78KT4mRWVS3d28hWvfLVg+sHpPEaARnU64Si5ADH0nkt5H8i6S
 i0Dcigb/zDaXvV9Jf+91MPzxOrR+C2SaB1j8rCYH6bc0U5HroQCLP1TvNU5Kujn+pC03
 dPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9oU1uXkriAScBT39Syg/FKdxMTMlNc0lBFBBQ20vggw=;
 b=rc0AVp+/nOnLEKLUa8L7MFLxH/cDcgg/ZZzyVvMGNesvQm0IIhbPCqQNGxbROFBFdl
 h5jqJ1ZCCQp2d5SeJW6CuP5Tz8Wsccx5FsF9xpTyXsAiukAISJEJoo3C9QcbHAsewidS
 0hb2jjT2+tnTcLNHKcqJwSMk/jDIg7QTFMvNdQzseeSWAL2zW3vWIKpTogPdYLgSuHG8
 E98UaIacHrsfN5V52xgXeKHSv6p9V22NFqurX2NFHc76RpNAPYZgRzWyDky23jyc3NQ5
 4VYSzVq7GN6tsrBMiYTUed2q+fh92ONx9qHKXwEKUiF//QC/iANLSOJcmsOnPO58dKBh
 EZqw==
X-Gm-Message-State: AOAM531pbr2j87itjPjnOga8qqcj/Xa6xKiPOKyTpkuWQhjLNRWLUbGE
 +tLacXI1Ivn2eCBMECplVzE=
X-Google-Smtp-Source: ABdhPJwSUdOD7SkfpYIj1CJ/H6tTynOlhCey4yG3EibrwCFGYc6TrtV7+5IkHQMGUFdN/ktderw++Q==
X-Received: by 2002:a17:907:86a1:: with SMTP id
 qa33mr34540749ejc.142.1637869458116; 
 Thu, 25 Nov 2021 11:44:18 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 e15sm2465981edq.46.2021.11.25.11.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 11:44:17 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
To: Michael Riesch <michael.riesch@wolfvision.net>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211117143347.314294-11-s.hauer@pengutronix.de>
 <20211117154429.2274443-1-michael.riesch@wolfvision.net>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <db4731a5-56b9-f1f8-2d3f-c62bb7e3b91a@gmail.com>
Date: Thu, 25 Nov 2021 20:44:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117154429.2274443-1-michael.riesch@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: s.hauer@pengutronix.de, benjamin.gaignard@collabora.com, hjc@rock-chips.com,
 pgwipeout@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/17/21 4:44 PM, Michael Riesch wrote:
> Enable the RK356x Video Output Processor (VOP) 2 on the Pine64
> Quartz64 Model A.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../boot/dts/rockchip/rk3566-quartz64-a.dts   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
> index 4d4b2a301b1a..9fba790c6af4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
> @@ -205,6 +205,16 @@ &gmac1m0_clkinout
>  	status = "okay";
>  };
>  
> +&hdmi {

> +	status = "okay";
> +	avdd-0v9-supply = <&vdda_0v9>;
> +	avdd-1v8-supply = <&vcc_1v8>;

Heiko's sort rules:

compatible
reg
interrupts
[alphabetical]
status [if needed]

> +};
> +
> +&hdmi_in_vp0 {
> +	status = "okay";
> +};
> +
>  &i2c0 {
>  	status = "okay";
>  
> @@ -546,3 +556,17 @@ bluetooth {
>  &uart2 {
>  	status = "okay";
>  };
> +
> +&vop {

> +	status = "okay";

status below

> +	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> +	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vp0_out_hdmi {
> +	status = "okay";
> +};
> 
