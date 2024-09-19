Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710C97C978
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 14:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D2110E6BC;
	Thu, 19 Sep 2024 12:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xmez9ih5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77FB10E6BC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 12:50:37 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-846c2471f0eso207169241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726750236; x=1727355036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lynh9AqoNJtlb54yCwbo34NdMY498MNudPm3PDmLEVM=;
 b=Xmez9ih5BepCJgnuwIvgaCZIHP7ChxiBLNQjdAqvAD8YMCYr4qYROln2hC/GFO33Mx
 bBA8jfGhy9OHJHhxMao5ynrvwHCF8pk3sLZHZG9+i9Rgcu0XXDWBtlFlg4KldjBKE5RX
 MM0EYgTrOXy+RJ1k9O5bqygnH5ArJpI6urta7wqkcxF5rhMhmMOQZrrUfJtK7mw3ZPib
 3FCzRjrNqXwzhhPw4JFAqkYaynxQyapLjC8FoGX3Fk2RKUWqTvlRwALlu6y13tg1JvqB
 LoLtfy9IEC4bKqJrfJzirDSyWcLE3li8QqaVootoUUUPjxNKHF6qU8i2FnrVvzZrtKbY
 Nrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726750236; x=1727355036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lynh9AqoNJtlb54yCwbo34NdMY498MNudPm3PDmLEVM=;
 b=mrRpQsGuNHLM2v1WmVYtZU4n8hhb1DpwIu02ZBnwMw4L7NgfUsHnrJS00/DK8ghtVG
 ICZIWTqR9lx/ygcA+XTkCBlqMdn/2x4FEPISjJaVZgt9L+hrYjgPbxSR7zxFxGmS67mM
 pWaizxcQIkcogoV/yOAaTbMEoplqUXVAc2+fdRBSvQFW17pDMFaI7tvMppbHQ4Nap7Yy
 Zlzqa0LW+Webft65GGbZl5rp/i6F9Q7NecdM8tyzzAfqGho1pcargFryMmEpJTvnz37+
 Gst7VbVjhTijf2KfsoPVLGGpy+dIeCh8YYrstqVj9FhSChd8jkaTEVOSrr365CzTLis3
 VyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA6xbRZzvCiMHYGHCBZUAqKxxhKmZaqYARdLg4AJAlU+REwUpQ6WKfC5wQrYbyliiPUiFlfonXxLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYbsBqumG3C89Af7P4wtbCudX+vatM4sytSjxFtCp90EmrhB/C
 N5eKQaGIBwaY3+dmXEEXAAUbk4e2UpDlsZCpYmTi8U6alPTuFcaaoOcr3xcnZoMfsUsFRcLH1Q1
 ly/yJ9Dywv9xGApSGzgLP5fhoAUI=
X-Google-Smtp-Source: AGHT+IEKMNbTQZXLRsS7SXG2H/9yDkohzhnwPtb9QKmG2n0WI6EVG/Fv5duzKAwAkVqQrCI53KiuMLSBZ1iaMAbwZsI=
X-Received: by 2002:a05:6102:e0d:b0:493:dee7:9b8a with SMTP id
 ada2fe7eead31-49d41513da0mr18959356137.13.1726750236464; Thu, 19 Sep 2024
 05:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-6-2d2efd5c5877@gmail.com>
 <bpujvanzp4yph2jkgog2rkvoywjtqad3jgk47kkex6v223flpb@66zporslyjzt>
In-Reply-To: <bpujvanzp4yph2jkgog2rkvoywjtqad3jgk47kkex6v223flpb@66zporslyjzt>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 19 Sep 2024 15:50:25 +0300
Message-ID: <CABTCjFCTKoZK58rXBnTd22J2w_mkPp5=nx292eOwW5dAMbp9OA@mail.gmail.com>
Subject: Re: [PATCH v4 06/27] dt-bindings: mfd: add samsung,s2dos05
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D0=BF=D0=BD, 16 =D1=81=D0=B5=D0=BD=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 12:1=
4, Krzysztof Kozlowski <krzk@kernel.org>:
>
> On Fri, Sep 13, 2024 at 06:07:49PM +0300, Dzmitry Sankouski wrote:
> > Add samsung,s2dos05 MFD module binding.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> >
> > ---
> > Changes in v4:
> > - split long(>80) lines
> > - fix indentation
> > - merge with regulators binding
> > - drop pmic suffix
> > - drop unused labels in example
> > - correct description
> > ---
> >  .../devicetree/bindings/mfd/samsung,s2dos05.yaml   | 99 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 100 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml=
 b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
> > new file mode 100644
> > index 000000000000..534434002045
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/samsung,s2dos05.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S2DOS05 Power Management IC
> > +
> > +maintainers:
> > +  - Dzmitry Sankouski <dsankouski@gmail.com>
> > +
> > +description:
> > +  This is a device tree bindings for S2DOS family of Power Management =
IC (PMIC).
>
> Drop this sentence, not really useful. I know that I put it into other
> Samsung PMIC bindings, but let's don't grow this pattern.
>
> > +
> > +  The S2DOS05 is a companion power management IC for the panel and tou=
chscreen
> > +  in smart phones. Provides voltage regulators and
> > +  ADC for power/current measurements.
> > +
> > +  Regulator section has 4 LDO and 1 BUCK regulators and also
> > +  provides ELVDD, ELVSS, AVDD lines.
>
> What are these? Input supplies?
>

ELVSS and ELVDD are common abbreviations for AMOLED panel backlight supplie=
s,
AVDD for panel electronics. I conclude that s2dos05 ic provides
ELVSS, ELVDD, AVDD from the facts, it can measure its current and power.
Those power lines are controlled by display hardware [1],
i.e. vendor kernel driver has no clue how to control those regulators.

I guess they just combined regular regulator ic with ELVSS, ELVDD, AVDD ic
like [2].

[1]: https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/an=
droid-8.0/drivers/gpu/drm/msm/samsung/S6E3HA8_AMB577PX01/dsi_panel_S6E3HA8_=
AMB577PX01_wqhd_octa_cmd.dtsi#L3508
[2]: https://www.st.com/resource/en/data_brief/stmp30.pdf
