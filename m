Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BB765899
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6310E19B;
	Thu, 27 Jul 2023 16:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09DD10E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:26:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so13023785e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690475190; x=1691079990;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tchYlHZMwfEha29OltN4SIaODl/6Qjb64Vc3sLHb8+Y=;
 b=PXB4tyAG2ehkamoaVnyGUUno9lFYnR4PLwIvLkeH9s+c9DaGYGMFY9sU9EEPhcYp/s
 C12h9gajnR6cC68M+ooloClgqVAOZCF1NQpy1/GN6EsKIbzsdheC2VZco0Kq3dUcvG8r
 JibXeFuWi9kOX37MkNjQe+oRYElXvpVPZUR6DugrwiZGDof5PKEcsdbXl2ASC5TraxyH
 Pw1fDLOp1cGq6QtqPLz1aCqdsv68kEWGLkY8K5T+qPP5jLZOxWlwaZ0OXVSkFHgiDG1n
 Qi5jK/UUjyLf/Fz8Hu+avkQXHSNxR4penrtFx11PAjDwYeivcYAh/hFZ1mQREaQq9Sj+
 QXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690475190; x=1691079990;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tchYlHZMwfEha29OltN4SIaODl/6Qjb64Vc3sLHb8+Y=;
 b=FVjdpyEVEz+BJYjiLXZ1Ev//LLRkGG8+27iP3coNP91g9YiFeF7Vsv5BpDdl+nDeoC
 xh8jv3xxWLIM4jm0+6uUQE9GGMTy4JO8uUMmuQEJQWB4d0QdpTKwqe+JS/Limv67nDd5
 njGFzBT4dh5r4Jl7elRRxCdPeshBnUfBFCUJ5bJ9f2NeTPEmEEiEd5rcpBVCyWzSFojC
 G6qSJCJgf6UIpd6QrRu+OLbIJKo69X6a4EFTDKCI8LEgKgpKCn28a/hbnYinatG8Coyi
 0a9Ynn8O1YLl4RgZo4eAffjs4ID8NTBrnfzOE91/tPsh+DdFrxQQIqxA2Ta2BthgCqxY
 cwPg==
X-Gm-Message-State: ABy/qLaoHbkVFKXT6qr8NweCjX+7HEit1wEWRboXFPNczLvGOibrYAY6
 ibsp09Dz8sMvwKgoGf7z5c0=
X-Google-Smtp-Source: APBJJlGawCHttDuITQqdJcf15YH9xdR1nYtbyMSt+zes+gOlZU/94bNaWVZtNPWSoQzctCMMY7lURg==
X-Received: by 2002:a7b:ce08:0:b0:3fa:99d6:4798 with SMTP id
 m8-20020a7bce08000000b003fa99d64798mr2126312wmc.37.1690475189887; 
 Thu, 27 Jul 2023 09:26:29 -0700 (PDT)
Received: from [127.0.0.1] ([46.211.28.141]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c260e00b003fbca942499sm5118934wma.14.2023.07.27.09.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 09:26:29 -0700 (PDT)
Date: Thu, 27 Jul 2023 19:26:28 +0300
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
User-Agent: K-9 Mail for Android
In-Reply-To: <ZMKJE1G87-jWeg2_@orome>
References: <20230618085046.10081-1-clamor95@gmail.com>
 <20230618085046.10081-3-clamor95@gmail.com> <ZMKJE1G87-jWeg2_@orome>
Message-ID: <5A2447D3-DB49-4788-AA05-182AF0F04ED2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



27 =D0=BB=D0=B8=D0=BF=D0=BD=D1=8F 2023 =D1=80=2E 18:11:15 GMT+03:00, Thier=
ry Reding <thierry=2Ereding@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Sun, Jun 18, 2023 at 11:50:46AM +0300, Svyatoslav Ryhel wrote:
>> All ASUS Transformers have micro-HDMI connector directly available=2E
>> After Tegra HDMI got bridge/connector support, we should use connector
>> framework for proper HW description=2E
>>=20
>> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo=2Ecom> # ASUS TF T30
>> Tested-by: Robert Eckelmann <longnoserob@gmail=2Ecom> # ASUS TF101 T20
>> Tested-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom> # ASUS TF201 T30
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  arch/arm/boot/dts/tegra20-asus-tf101=2Edts      | 22 ++++++++++++++++-=
--
>>  =2E=2E=2E/dts/tegra30-asus-transformer-common=2Edtsi  | 21 +++++++++++=
+++++--
>>  2 files changed, 38 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/tegra20-asus-tf101=2Edts b/arch/arm/boot=
/dts/tegra20-asus-tf101=2Edts
>> index c2a9c3fb5b33=2E=2E97350f566539 100644
>> --- a/arch/arm/boot/dts/tegra20-asus-tf101=2Edts
>> +++ b/arch/arm/boot/dts/tegra20-asus-tf101=2Edts
>> @@ -82,9 +82,11 @@ hdmi@54280000 {
>>  			pll-supply =3D <&hdmi_pll_reg>;
>>  			hdmi-supply =3D <&vdd_hdmi_en>;
>> =20
>> -			nvidia,ddc-i2c-bus =3D <&hdmi_ddc>;
>> -			nvidia,hpd-gpio =3D <&gpio TEGRA_GPIO(N, 7)
>> -				GPIO_ACTIVE_HIGH>;
>> +			port@0 {
>> +				hdmi_out: endpoint {
>> +					remote-endpoint =3D <&connector_in>;
>> +				};
>> +			};
>
>Does this need a bindings change? nvidia,tegra20-hdmi currently doesn't
>support OF graphs, so this would probably fail to validate if we merge
>it without a corresponding DT bindings update=2E

drm/tegra patch is backwards compatible and connector node is optional=2E

>Thierry
