Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C105B2396
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB89910EB5E;
	Thu,  8 Sep 2022 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347F10EB5D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:27:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e20so26992122wri.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3ICuKknol5YpILZsOk7pACxUpATHdQ4OEZIYi1vqZio=;
 b=QLOHXXQnm6Nrq2L5bd6t4DAhEfH/9DWk7mr+48UhVMcq+rNytsLlxTm/mNNwqkmBWV
 MWiliboBWak732jTpkJliPF/7/tCvJnB/pQNEsO8wuXPIhm61+sEWyUBOvAMMnkyxlZ2
 ZxGAbt5dLmaGFSEWtNEaUsrb0BYpOj4/C0cttqRpYkx94P9IB/wlACFIGcswp4biu8rh
 au88pxfURiElI1JS9+PMxzzkD3XuXgvfT6vrOXPl3CGKao7U81EEQF1PmK0B8rqzihKz
 piBsVqvee5mxPATnDIQHpYReiAckYxsLBjR1c0O5C6TJnF2Su1Ra312//iIysC6JJB4j
 tBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3ICuKknol5YpILZsOk7pACxUpATHdQ4OEZIYi1vqZio=;
 b=3QsLhKOr7b3JWOfKXI2A4DKzUJckyZeTyTCUCDqzmOXoCuAvHJAUNVLlyDWXraFoOl
 HKs3fsSci1s6ctE2skuHOBtdZaDQMNK8WwTOnX3UTNbzyloQ2NpPa1CgjA9SoPcGgDIL
 RTlQTh7eWAOWTYUIyd7l2BAaK/fOO3/gSfJ1QhaufXAOPxe4pmvwpMK2j7Q4hgeVK7s+
 N+cyiU25wE8tTjyvkuoEjyeS3Um7HJSiXRssIBlD7d1KdAYC7t0sAKMCpGHJS785P2Tf
 Z1gJYrE6fOF1PcNKNERbY+O7CdHUq+w/NHcAj1O+3ctuvCpTGW9WhGxhCjKUrFy8mLVc
 EowQ==
X-Gm-Message-State: ACgBeo3YIFP87eXeaRmiciPVBc7YTl2kz0NbUZnhY7Sv4TIAmzQZGtiF
 OUnrY7qaWlvtkoibh88MPiA=
X-Google-Smtp-Source: AA6agR57Kt0uMyyLl4xHf64C/F/H486W/S1HP0tzZLCgcEgdJoEY4PI/DxoD3o37ca36UFcPQybAuQ==
X-Received: by 2002:a5d:59af:0:b0:22a:2fa5:c5c5 with SMTP id
 p15-20020a5d59af000000b0022a2fa5c5c5mr2205970wrr.333.1662654437032; 
 Thu, 08 Sep 2022 09:27:17 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 l7-20020adffe87000000b00228da396f9dsm11168169wrr.84.2022.09.08.09.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 09:27:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Thu, 08 Sep 2022 18:27:15 +0200
Message-ID: <2124701.Icojqenx9y@kista>
In-Reply-To: <20220906153034.153321-6-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
 <20220906153034.153321-6-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 06. september 2022 ob 17:30:34 CEST je Cl=E9ment P=E9ron napisal=
(a):
> Enable GPU OPP table for Beelink GS1.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts index
> 6249e9e02928..9ec49ac2f6fd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> @@ -5,6 +5,7 @@
>=20
>  #include "sun50i-h6.dtsi"
>  #include "sun50i-h6-cpu-opp.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"
>=20
>  #include <dt-bindings/gpio/gpio.h>
>=20
> --
> 2.34.1


