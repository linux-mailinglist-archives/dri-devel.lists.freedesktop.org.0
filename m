Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DFC6DFAB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 11:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082A810E232;
	Wed, 19 Nov 2025 10:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="amxKN1ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFB310E232
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 10:27:41 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b73545723ebso1177181666b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763548060; x=1764152860; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
 b=amxKN1wszSem15F79q3PCN0YwGndNvbvR+6J5z0Vx/8j0C9rxlQcxnzu2fGfvMgbRz
 9Dg6AmFjoxi1wnHchxffJcNmHiGUQGzYYGZPFcM4PfpwOvrIVsVgmmRmtF7wfK+f3g3M
 RDPNqQzjtD/KidVnaxGtRJFkd+2hb+jq0XgV+eAyFlUF5dWij4BTXMuvdJ5h/FfSV8WO
 vWoG1g8xjG0wemLtfVXFyVOHUO+AfNC3irs11HTxCDA8J1lSxihh6DACHW50bG2feDJu
 +2M7ytVzNwXaxQNeA65MsyQJlebvBBzyQnnn/OQ4/f2VusURXh7pDeZTnYvrek8q5RZR
 jeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763548060; x=1764152860;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S+nM8TwEn3pAM+Wkbq5/nAzbOqWOMItS7/Y6FbwZo48=;
 b=JWzB4yFc2/VcEtc55MGTyFD1tuFjMgpLufPbQnetH80mjSetCO7ftwiJr8F9LYeRRS
 PGbkCqYKERcgRUJJKY4qmtuE1DTXxJcPU8YVrTqdPFlkOE+2fZphNBMVfqrLJzWKu6Zz
 7S0wz6IuytUIHIxMl7ujgRPovmrnWuQjPep5FLvdxvyVusU5VFMERPrZ0mfavm1tMW5Y
 I90NKM+L08aXO4RekswoE7x/1H7uV2DHXCMLoq/lrDEf+1C/0URONPbFjlmu4ZgMiQQT
 vOg0bY0JZsjSOy29w6WqdD0Nvfo1ioUJA0Ck7K/RPogpBJ1wZ4Gu+PWdVxmD3Z6ujpYC
 MUAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURk2tdD51h/o8o7TlmYsIVj85U9u5vsibg5FU5RVhp7gohPG+0xw6jembGluqBaWtBlao6iOW4/ME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6KxCWRl9bMU1vqFDhHFWaRV0NUfZ4+Fag2aVcvYk3knzLGP7i
 hjbLJvDHTiRGFabHO0z6udyxdoo+njsYkVjd+4SCyb2xtH7uPHN75Lyg
X-Gm-Gg: ASbGncsK9y2c/ux83DAUO/05Lsblj9JSuU/2ZriLwkP55aaSul8KshBgC7n6p1/e9KQ
 8xErykS9+SffJo8etqURXFsqZBulO//B7beErJLMs3jdvhswjz33xOg6PVKMskNhBfSeS/zKytW
 RK9lhIrOtVKsTyi9NmBASMamBdAK2AmSxppEMWHMqN9USaL/PgWStQFxn/i4RkP26hjJ9QqqCkw
 cMIFAxsfne9cF6msowrDrHeGixBjSFgckB4z7R5bkbaxIoLaFNlzM3/JuEq/Hwg3yvA3ktwCgiE
 Dzlo5e7U6XJt1njGNxsd1OtkLbthnZg8LewLUK1HihIN/kXFlBr+1rEVDk4zLYssCPdi3v62HyM
 N6k7mAO7RZoIusvjepjKDqie2suArINTVyqE/YtC5+MQuLT8/X79gkomyL2KGuHJCqHU2BhMmo3
 AzNATFGBFI8SetlfidCZn2uHOcXQ5FLF6ZBdz0VrR6PZwUaQMIYQtX7AF6tj3hS+GCXhbU6O+d+
 zA=
X-Google-Smtp-Source: AGHT+IFcsP/JWu7DWWlBu/BkWNRt0LIFSuLh7i2sy3UQ2gmA3tYApcSpm1bJdautTGMK/vyZo0UGug==
X-Received: by 2002:a17:907:7e93:b0:b73:9368:ad44 with SMTP id
 a640c23a62f3a-b739368aff0mr1299146866b.16.1763548059649; 
 Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4635sm1588133966b.26.2025.11.19.02.27.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:27:39 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
Date: Wed, 19 Nov 2025 11:27:26 +0100
Cc: ao.xu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: Apple Mail (2.3826.700.81)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pls see inline

> Wiadomo=C5=9B=C4=87 napisana przez Chuan Liu <chuan.liu@amlogic.com> w =
dniu 19 lis 2025, o godz. 03:57:
>=20
> Hi Piotr,
>=20
>=20
> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification ]
>> [ EXTERNAL EMAIL ]
>> Ao,
>> Is there any chance to get this s4 drm hdmi series for current 6.18?
>> (i tried backport this series to 6.18 but have some issues with =
reparent vpu_0_sel to sysclk_b_sel)
>=20
> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
> background here?

Well - it looks it is because bug....
Martin Blumenstingl had perfect eye and catch typo in patch =
https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com=
/:

By replacing:
assigned-clock-parents =3D <&clkc_periphs CLKID_FCLK_DIV3>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VPU_0>,
<&clkc_periphs CLKID_FCLK_DIV4>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VAPB_0>;

with:
assigned-clock-parents =3D <&clkc_pll CLKID_FCLK_DIV3>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VPU_0>,
<&clkc_pll CLKID_FCLK_DIV4>,
<0>, /* Do Nothing */
<&clkc_periphs CLKID_VAPB_0>;

dmesg is like this https://termbin.com/6020

So i'm getting hdmi working - but only when device boots _without_ =
connected hdmi at boot (and connected later)
If hdmi is connected at boot - boot hangs at:

    0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX =
controller v2.01a with HDCP (meson_dw_hdmi_phy)
[    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare =
HDMI I2C bus driver
[    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops =
meson_dw_hdmi_ops)
[    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on minor 0

FYI: It is after applying =
https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v=
1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments =
on this series required by changes in 6.18).=20
For VPU clk changes see =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/f=
iles/0312-drm-meson-add-vpu-clk-setting-for-S4.patch=20
It is 6.18 adaptation of =
https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v=
1-9-cbc2d5edaae8@amlogic.com/

As kernel hangs - i have limited caps to drill where root cause is.=20
 =20
Maybe above hang is reason of my backports or missing any pre-req =
required to get s4 drm working?
Anyway - it will be good to test with updated to 6.18 series of Add DRM =
support for Amlogic S4 (plus info about any pre-req required to get s4 =
drm working)  =20
    =20

>=20
> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
> selectable clock sources, so this reparent operation will definitely
> fail. This has nothing to do with the kernel version.
>=20
>>> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>>>=20
>>> From: Ao Xu <ao.xu@amlogic.com>
>>>=20
>>> Add devicetree document for S4 HDMI controller
>>>=20
>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>> ---
>>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
| 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
>>> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>> @@ -55,6 +55,7 @@ properties:
>>>           - const: amlogic,meson-gx-dw-hdmi
>>>       - enum:
>>>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, =
S905D2)
>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>=20
>>>   reg:
>>>     maxItems: 1
>>>=20
>>> --
>>> 2.43.0
>>>=20
>>>=20
>>>=20
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>=20

