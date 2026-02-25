Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y1sBJA6NoGkokwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA51AD5D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F010D10E9F3;
	Thu, 26 Feb 2026 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UvU3cHNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0B10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:35:26 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2bdbd13ca01so2568971eec.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772037325; cv=none;
 d=google.com; s=arc-20240605;
 b=I+hvtV9cr4wZZXZLcIxepcBPFISvaiolICdcCRi0pPVc9cVzF/YQn+RgQSnuzT0a3O
 kCaKk66iNmX3BsvaQFPS5tFT7KFWwIiVzMTvlrX9QGKHhybF7/OHPVF37cJvm1JRuXez
 qv9pf+b2uIU/CXZHobG+yPOAMGkpqOw9Q4+SZkw8A+hWo0E2AZN1RGycqH/fBEBxj8K9
 8SlulDrDZoKAwHxptISrVm7wmKdRRy+rB+5ds8czZQRci5HtgJriWzzYxse2ztKKRg85
 ZZWfSiu43gNOKkk7EtR1mE4NIFzL9BT/tq4PHAesmSDZYiTabWxx1TStZHGlj2C60mHE
 wzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
 fh=+APR/hnxoPggaG10CYVHkGqM1TL6N7/MnqvLMEc2rDk=;
 b=AnxpS3u8/2gZCmLoSPMXJMP09pz9MXLqhf6JYN/kfR0IsX5o0g0Ivv14mlKyIAa3Ol
 oE9M54ndI9ozkvvJ4B7qbdTDIeliSM0EWKJ0gnxwWRcad4neKaGMcUggMgughm/BkUHK
 tifQ0jewFazF+F20aiuGiA/ueNhcwFlFSXz0tFktGr2u6gqwSsUjCnJRKb/R0BubJDCH
 d+8WTrkhRRNj8swm4XOYl2s9JPiPMMr2nrPMWkf0nAyAjlUjk38KTYhAx9cTaSsKoTyY
 0pVPcmV3upcI1+JtXIhRC0LEr0Xhb5JSIzy/E8w+ZL2izoc1Pg+MqvEgfOYPzJMySw5r
 7oZw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772037325; x=1772642125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
 b=UvU3cHNr8f7zPndFHTX2VvrzN44i30Jv6zRSFFKUbNRY5XvocN927XjuAwr9LBoMOQ
 uzKXpSC+8ZrL3yWbr723EHJqWlLUFfNYUWmEv/vq23jw4BdLdu50nYgeq7iy5c9gnnpj
 AoWyaXWwtDHw/gx+wT8qXshqUOh1hXX2E5ObnGlVT91CYzVpXMsGu2InWnrYeofUfEK4
 mjouVQwG06MlzzwE08Q4g8bmpGdIocii0engavGBm+MWsKQ5ry2F23Py0EEgSrZME97h
 KtvAoK30NeQMVSUKbamssdHep4y6yxn5htzGo/BPL1vQ880Jw1L5e+VykfPRPpOycYDc
 JzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772037325; x=1772642125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RuMyK8k/Iub+seZtBM6TPXaM4YVrVm+PvcW0VWb+Be8=;
 b=VTH7DdsnC7TAMuSkBeu5VeUMUtWu2P8TU0P59Di9e+lL3v1sUFowikofhjVwHW5tCD
 rxM6u05c7tdiUsjaL/jDYF2DJhqpS8RkPmaE929s6ud8pXyCc7Vu9ZxUpeFSNttKNyZR
 y38YuQc3gUq+5tKeg4t9N0OYTbEy5HV0TXNIYa5FjBFT07MoZXy36usR0pgRQga6E29c
 UHKuQh/pyE3Xmb9Axez4DQ4aYaC61wY/ZPF2T1tg591r2LeggZHNIXMNbbYU3AFLm+R5
 4U7XfQ4kTD01veztSiRQ0Vv8d52IzpYSyWLv3DJWJUSLUeoCl0nydLLKrtyIgkIOJP1m
 d8xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQiyM2aonpXESHDRn8izYyXpcHlLOn6VKn3FmH7USFkqmErFiaAQb6333nyiFBPYncEUfGtLJJfDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuMYxRbzuRW1j7B6Vhc9M8+QtpboRWLRS9I/3hO/Mj0q9wPw9E
 kAvrm7bBDk/2uZ889wQGKbYp2uLlal8h/daKKeN/I61/9oG7owEz0cbcZ4Hsz/46SfA4V6zRRyo
 eUr7i7UxtSd/D3JL3rPFxfdMJsxFY728=
X-Gm-Gg: ATEYQzxJzDG6bYCq35wJO9iX+leabUe62oqHfuqoU3gNE+IRwffBMAgFtPkcuXnSwhy
 hNx13GQSDtpa9pYNgDeWOL+vkYYKEJGcIfFK9nafacDDteNbIaThCg31QbqnbUPg8QBcWa8UeEf
 sVK3SyONqaDfZfYrCPQkHUZ2epChzXjJYTuV+fD9dEunPit/9ogyn83Xyxwizblp53qAmllaIqt
 ITGx0HgjUvmKBzcfEZs2pGA2+vH2xTYki619BErmL7XFoGgqXwd0FU3Ud2AedcyyxL5wt8FW3hd
 RjTl3OdGtF7Rz/sgug==
X-Received: by 2002:a05:7300:730c:b0:2ba:8018:cc53 with SMTP id
 5a478bee46e88-2bdcc09cdcfmr451942eec.35.1772037325339; Wed, 25 Feb 2026
 08:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
 <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
In-Reply-To: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 18:35:13 +0200
X-Gm-Features: AaiRm500k62S5PT-UtPwx_C8A375gU6HJuFS3MnM7OdDg835C8WPOS3XQzbLxvI
Message-ID: <CAHuF_ZrQPZSv=AhK5Cq8aNq1NVcdZhHC3v0ju4sW4whYYP+d+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 =?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[25];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,0.0.0.0:email,qualcomm.com:email]
X-Rspamd-Queue-Id: F0AA51AD5D8
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 04:24:04PM +0200, Yedaya Katsman wrote:
> > Enable the MDSS nodes and add supplies and bindings for the Samsung
> > S6E8FCO panel.
> >
> > The ldo and iovcc pins boot up with a current of 16 mA, but they work
> > fine with 2mA, so I used that.
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b=
/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc4=
55d2235f8e6a9737a 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> > @@ -82,6 +82,32 @@ key-volume-up {
> >               };
> >       };
> >
> > +     panel_ldo_supply: panel-ldo-supply {
>
> regulator-foo-bar-baz
Will change
>
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "panel_ldo_supply";
>
> Is it an actual name (e.g. from schematics)?
In the downstream dts it's called "panel_ldo-gpio-supply". [0]

[0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96=
de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi=
#L28
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             regulator-boot-on;
> > +
> > +             enable-active-high;
> > +             gpio =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-0 =3D <&panel_ldo_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> > +     panel_iovcc_supply: panel-iovcc-supply {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "panel_iovcc_supply";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             regulator-boot-on;
> > +
> > +             enable-active-high;
> > +             gpio =3D <&tlmm 124 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-0 =3D <&panel_iovcc_en>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +
> >       thermal-zones {
> >               rf-pa0-thermal {
> >                       thermal-sensors =3D <&pm6125_adc_tm 0>;
> > @@ -128,6 +154,46 @@ &hsusb_phy1 {
> >       status =3D "okay";
> >  };
> >
> > +&mdss {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdss_dsi0 {
> > +     vdda-supply =3D <&vreg_l18a>;
> > +
> > +     pinctrl-0 =3D <&mdss_default>;
> > +     pinctrl-1 =3D <&mdss_sleep>;
> > +     pinctrl-names =3D "default", "sleep";
> > +
> > +     status =3D "okay";
> > +
> > +     panel@0 {
> > +             compatible =3D "samsung,s6e8fco";
> > +             reg =3D <0>;
> > +
> > +             vddio-supply =3D <&vreg_l9a>;
> > +             ldo-supply =3D <&panel_ldo_supply>;
> > +             iovcc-supply =3D <&panel_iovcc_supply>;
> > +             reset-gpios =3D <&tlmm 90 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint =3D <&mdss_dsi0_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dsi0_out {
> > +     data-lanes =3D <0 1 2 3>;
> > +     remote-endpoint =3D <&panel_in>;
> > +};
> > +
> > +
> > +&mdss_dsi0_phy {
> > +     status =3D "okay";
>
> Missing vdds-supply.
Will add
> > +};
> > +
> >  &pm6125_adc {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&camera_flash_therm &emmc_ufs_therm>;
> > @@ -387,6 +453,34 @@ &sdhc_2 {
> >
> >  &tlmm {
> >       gpio-reserved-ranges =3D <22 2>, <28 6>;
> > +
> > +     panel_ldo_en: panel-ldo-default-state {
> > +             pins =3D "gpio26";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-up;
> > +     };
> > +
> > +     mdss_default: mdss-default-state {
> > +             pins =3D "gpio90";
> > +             function =3D "gpio";
> > +             drive-strength =3D <8>;
> > +             bias-disable;
> > +     };
> > +
> > +     mdss_sleep: mdss-sleep-state {
> > +             pins =3D "gpio90";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-down;
> > +     };
> > +
> > +     panel_iovcc_en: panel-iovcc-default-state {
> > +             pins =3D "gpio124";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-pull-up;
> > +     };
> >  };
> >
> >  &ufs_mem_hc {
> >
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry
