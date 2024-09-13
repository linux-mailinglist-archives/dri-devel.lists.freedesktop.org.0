Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A498978860
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 21:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ADF10ED75;
	Fri, 13 Sep 2024 19:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kali.org header.i=@kali.org header.b="oz4+4pID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE0210ED75
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 19:02:52 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f78b28ddb6so21866081fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1726254170; x=1726858970; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFMQpW/5xpKH62jSxPCKZoeksH9vz3ccBemfSscBQOM=;
 b=oz4+4pIDKUladJBCc0HiQUomvbX4BTSPkjzE/5sNZMTq6lp9/kadrYHXn7zT6mCzze
 1IksqR+U2Rs4qGSYvlkFpSRqW2Pf3QqI0l4LQvInWH5ND21dn8mtjFN9NeLUN1F06869
 TMJ+I/FrWLz5LG6c/nUY6gTe8bwiX9KHm2Aukbs1G4CpTHjZlnLwAUNNfcE9VyoY059h
 WWrW2xhlUml8DJ7VG/gdvEK057oRYvCRrASCzLSgmQEMJa8SSNH+z9fbkghFhW7Nhtd1
 t+nJVYIjZJQsrQHnb9XJCq3yHcNrVqeOgnEq4RqPb4UtBZ/MgZNlCr1C7rfW5V7NeNwB
 pMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726254170; x=1726858970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFMQpW/5xpKH62jSxPCKZoeksH9vz3ccBemfSscBQOM=;
 b=KRNnZTF+PRv0DBiDSM8OmDp6QgK8stNCIIAMC1UxvoW04BRX3pxp9lHwP/cCvWJbqp
 HDVTNKdgzBr2q0s9I+T0HbLxqjeASikmVulOMAGr9W0vmvC2U3o9KJ+gqr2d5vD5CM2z
 XDINjyYg/ockC68jux3V8/jl4HJYG6qCC+OJrfHL6yAEBdYbUaTcqdwlZLhQahr+LZI0
 c7xh68PmE90AI1t72bLhmZSrwCCPRb1Z389eQ3rmUP/exCH40zXxKSl0k8zq9vy01jki
 G0UIA46npl1BMYQrh5MiiGuwa2bJn2bhayGhqEJYopuhOBp4/UvFBhlc5wn0xzCVFzmm
 v0og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVUJ0isH34mHjVo9gbbR3rf4CB1IdkAxjRj9aTXiPyfYNFmL5k8D1urhAnMdfdckYUpfZe4ULIkAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQGn3E45LiUTYJphCnFzHUBGdGSYwBLBZb5pDV6oz4V1SlHyis
 +Lrbe+wA6HQLUyB4fJAumKAm4a+T6rAvp3cC120TKwVcEPppOvWmI9FWV/xM2oz3MG4zCt5bB4D
 GKRs63o8feF+/Rc1xkFI0IirppUQVi64gRW65zg==
X-Google-Smtp-Source: AGHT+IG04MtFkoqeSZ+ZwHbb/afYODEkr16FWXAk4qdDs5nfmXBBJ7oS+aKXnVw26IQAdUNCPeHcTtPlTkeDl/uvGDw=
X-Received: by 2002:a05:651c:b2b:b0:2f1:563d:ec8a with SMTP id
 38308e7fff4ca-2f787f4a407mr40618911fa.41.1726254169824; Fri, 13 Sep 2024
 12:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-16-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-16-2d2efd5c5877@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 13 Sep 2024 14:02:37 -0500
Message-ID: <CAKXuJqgrkt3qqCZsYP=jB2CVDSoacxH645Qxqein+JMkApx0Aw@mail.gmail.com>
Subject: Re: [PATCH v4 16/27] arm64: dts: qcom: sdm845: enable gmu
To: Dzmitry Sankouski <dsankouski@gmail.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

Hi Dzmitry,

On Fri, Sep 13, 2024 at 10:15=E2=80=AFAM Dzmitry Sankouski <dsankouski@gmai=
l.com> wrote:
>
> Leave gmu enabled, because it's only probed when
> GPU is.
>
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 2 --
>  9 files changed, 34 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot=
/dts/qcom/sdm845-cheza.dtsi
> index e8276db9eabb..a5149a384167 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -741,10 +741,6 @@ touchscreen@10 {
>         };
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index 9a6d3d0c0ee4..59cb6e6e434c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -444,10 +444,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index 2391f842c903..d31efad8a321 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -414,10 +414,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 46e25c53829a..8a0f154bffc3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -345,10 +345,6 @@ &gcc {
>                                 <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm=
64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 486ce175e6bc..87fc4021e024 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -419,10 +419,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch=
/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index b02a1dc5fecd..a3a304e1ac87 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -415,10 +415,6 @@ &gcc {
>                         <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi=
 b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 617b17b2d7d9..f790eb73abdd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -239,10 +239,6 @@ &gcc {
>                            <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         status =3D "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index e386b504e978..501575c9beda 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -381,10 +381,6 @@ &gcc {
>                                 <GCC_LPASS_SWAY_CLK>;
>  };
>
> -&gmu {
> -       status =3D "okay";
> -};
> -
>  &gpi_dma0 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 54077549b9da..fe154216f138 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4948,8 +4948,6 @@ gmu: gmu@506a000 {
>
>                         operating-points-v2 =3D <&gmu_opp_table>;
>
> -                       status =3D "disabled";
> -
>                         gmu_opp_table: opp-table {
>                                 compatible =3D "operating-points-v2";
>
>
> --
> 2.39.2
>
>

This seems like it would also affect the sdm850-lenovo-yoga-c630 which
inherits from sdm850.dtsi which inherits from sdm845.dtsi (they are
sdm845s with 2 higher clock speeds)

-- steev
