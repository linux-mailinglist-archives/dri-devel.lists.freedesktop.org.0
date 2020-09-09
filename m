Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCC262C27
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60336EB37;
	Wed,  9 Sep 2020 09:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9F6EB37
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:42:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t10so2225931wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z8RXnpnyBMjt2Rl+qFLfs99Rgx6FHbwDsstUMymIPBQ=;
 b=kevpgpBezl8qGbV7RG2kxXNWEHlnYbeaRmCOmICumPajZr750haas/HIHumLtfoXR7
 5LMTicH6uqLvsYFaD+KcKHT1vcw1oblYbClP7dRMaZHUQ2bSWj+8v3uy4TtjfyichXOD
 utx2VaZh6zLD6xYSXMhvcBl4ufAFx/i1sehZpNvq1sFN87WKO+HRtMe5qbH6vlCCQCVN
 FOfUeUPiuwpuRDFLs9fg71niN3SYxz6dPtHwUn0PM/1pA+x1Q8PgbACwbo2ViPSul9ho
 NYXW6JjPvcnTqJfQrr0CSR8wbilkQCwYwJaARAQ8PN31FkK0fBz/2r3/yP92ShtMeyJV
 nk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z8RXnpnyBMjt2Rl+qFLfs99Rgx6FHbwDsstUMymIPBQ=;
 b=G7rc/mOKG1Bn4O3KCMk951iTFhVa8SkXbKEs1y5nSeg4rnrM+515Zs5jYz2Bh0FqTQ
 sdvEdVLpU1I1V5vp+PsozIOQuL0+dLlul1vu7Ogfb0SxpoJW0WymFgt2Th0Bm3ffUUZ1
 5Cq51FduAWD7xDU+x9lqcord8clR4Sbv/YNAuzm+hWNmrr2NhMjsrmxMwY4Naq1itQ+u
 Ji0/jMmpg9To2KZWWdddldmoO4yd3Cf0w5hCCBG6VyYJu89VIH181F/hs4QaJ5Wt+TYM
 YcYQHz9G40TnHpd84H8B43efT2kLTFEhrrSUihZNg2W9p8rGb2cfipZEfi/nJimFMcnz
 1b7Q==
X-Gm-Message-State: AOAM533Ms51pxFd2XXJN7Hvp0pZ6Nkr8bZTE014RCvtu08E7S+/VUgal
 iEiyMNX8FbVdHlKiHW/lNwE=
X-Google-Smtp-Source: ABdhPJyxx21J8UyPGAPaHM/8Ki6ecXPVaEM7uV8gatmLfxzs69Jo48V5cXIPhGqgMe+/DzTyxE7C+w==
X-Received: by 2002:adf:ba83:: with SMTP id p3mr3217999wrg.246.1599644565115; 
 Wed, 09 Sep 2020 02:42:45 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id m185sm3201670wmf.5.2020.09.09.02.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:42:44 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] arm: dts: mt7623: add lima related regulator
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200904110002.88966-1-linux@fw-web.de>
 <20200904110002.88966-5-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b893cbdb-2011-88a4-dd57-3ea82cde08d8@gmail.com>
Date: Wed, 9 Sep 2020 11:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904110002.88966-5-linux@fw-web.de>
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Alex Ryabchenko <d3adme4t@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/09/2020 13:00, Frank Wunderlich wrote:
> From: Alex Ryabchenko <d3adme4t@gmail.com>
> 
> GPU needs additional regulator, add it to devicetree of bpi-r2
> 
> Signed-off-by: Alex Ryabchenko <d3adme4t@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.9-next/dts32

Thanks!

> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index f41f221e56ca..826912545ef1 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -79,6 +79,13 @@ reg_5v: regulator-5v {
>   		regulator-always-on;
>   	};
>   
> +	reg_vgpu: fixedregulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_fixed_vgpu";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +	};
> +
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   		pinctrl-names = "default";
> @@ -283,6 +290,11 @@ &i2c1 {
>   	status = "okay";
>   };
>   
> +&mali {
> +	mali-supply = <&reg_vgpu>;
> +	status = "okay";
> +};
> +
>   &mmc0 {
>   	pinctrl-names = "default", "state_uhs";
>   	pinctrl-0 = <&mmc0_pins_default>;
> @@ -402,4 +414,3 @@ &u3phy1 {
>   &u3phy2 {
>   	status = "okay";
>   };
> -
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
