Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CECB51E7D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32610E988;
	Wed, 10 Sep 2025 17:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fqm07/ja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385D10E988
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 17:04:11 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e98b7071cc9so6320216276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757523850; x=1758128650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAhi2nhP6RcwyawffhfphrfKgf6fcZyr9ahN0hYRF7o=;
 b=fqm07/jacNmDEMcCCqy2hthTE+X1eslzSqXokILpRqKZ+JwWLcarU4+KWeziK16kzq
 mX6YNIfxF6S1GkV3InlAchqVK+opRs0wc0+73aJQMljRNMJHAkjaU4ZhCWYi1xsZ+cuw
 bpbkuJAs2LSVWs2j99H8kTIVhp9cC+Adr6rt6vSC3yety1q3bgwasPpgyTYQYy8zPZwk
 rRqzhLFPGWjn7dhtGxG8GrMpii0HFWb/ZpnNLfS7NM5T2s5psYMcLg1tu/vMaan3YAEU
 CwAF3R3cTTQEJXE6IaNWzepk4QFZrnb+TffqN0x+1BUf+BltTybuqxhPuoh9glsYTYkE
 SQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757523850; x=1758128650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAhi2nhP6RcwyawffhfphrfKgf6fcZyr9ahN0hYRF7o=;
 b=hsldtOBgxlelVxm4nP1bZ/clW39Pxcx2SUa+GW856skbaKy6aSvbzvY9A38+eXxIBO
 xJyftAqCNZBA1MTRHQMwUS+up07J2ErlpoK+k+w/cJBh+4VhjLZgMKn/mtVY9KdtP0IJ
 9GE9I+Cp4rB0CQ+VaKVf/egdyr0FnXKejR351QVh0QB8o7h0XZ0c2z7ZTGNW8E/fWxYm
 RXNcWak3Lhzz66/4Nwem62st/0uqPOQKxSfkjodi7QuuJZThNYC0BvcqdHfEoC/gb+K7
 Y053gkcaeGcbZ1reBUQUBhgwWjrk26R+XL+SAkkG2EQmF6v63ueJ2joCjmiJQXcDg223
 YJTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0bkAKzDfKSNuOQQbt/JYlgBsEwt2jX3GrZkAnC+cyhYAYWrLdMXXP6Gv4h39NA9V/7cCIHA3qRyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw/ijxBP+BHdo8T5xJHGl5JT7zEOk9IpwJDSVz2cTJXdMxOLTI
 8DI4oBQWdCYs3eeBtX9Rp9rRdL1azrpKMgnrpl5OzW4/8SNGmt0wQVrznpQigEn8cd7AcnbL8Jg
 pE9NAGRzHZXjBmHWghybA4W5IgL4UFx8=
X-Gm-Gg: ASbGncufHEhILBb8NaMmTNH/y4Pv6obQ/dfTsl4nyqXTIlKM+ci72aFZHWiwJqRMXVq
 3HlZnZhKJvYxpZtqL7SCVuErUVpMO8xEC8AgBcVvO6veaq96oc8PASNtYs5ooUYPC+U8AtVPuBe
 55TqU0uvmoYGPM099k2ALfSiLL7JTd3VWD+IldXxKOVRngkkHApXROkK20Cucec3/RKdRy+cQO2
 toVpBg+PE00Nom46mc=
X-Google-Smtp-Source: AGHT+IEfnhT9ZSnLfrxKenO2m0z1nuzfqS7vviy8OiPv+Dkiyq8OrSHh9+vCeh+cYF0spuidfc9qnQhd9ZCiFqloKVc=
X-Received: by 2002:a05:690e:250b:10b0:5fa:ccca:7c27 with SMTP id
 956f58d0204a3-6102c30b9f6mr12766300d50.8.1757523850376; Wed, 10 Sep 2025
 10:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 10 Sep 2025 12:04:00 -0500
X-Gm-Features: Ac12FXwb-SXXuwNDs7DFnPiik28LYopuJH_w6GUXGeVeKXumFwg8fkQlWOaiNp0
Message-ID: <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Aleksandrs,

On Wed, Sep 10, 2025 at 7:01=E2=80=AFAM Aleksandrs Vinarskis <alex@vinarski=
s.com> wrote:
>
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4fec=
8c1d1f20ee525bc 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,14 +83,11 @@ leds {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&cam_indicator_en>;
>
> -               led-camera-indicator {
> -                       label =3D "white:camera-indicator";
> +               privacy_led: privacy-led {

Should this now be privacy_led: privacy { ?

>                         function =3D LED_FUNCTION_INDICATOR;
>                         color =3D <LED_COLOR_ID_WHITE>;
>                         gpios =3D <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger =3D "none";
>                         default-state =3D "off";
> -                       /* Reuse as a panic indicator until we get a "cam=
era on" trigger */
>                         panic-indicator;
>                 };
>         };
> @@ -685,6 +682,9 @@ camera@10 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&cam_rgb_default>;
>
> +               leds =3D <&privacy_led>;
> +               led-names =3D "privacy";
> +
>                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
>
>                 orientation =3D <0>;      /* Front facing */
>
> --
> 2.48.1
>

v5 does not turn the led on here on my X13s whereas v3 did (and v4 was
not tested)
