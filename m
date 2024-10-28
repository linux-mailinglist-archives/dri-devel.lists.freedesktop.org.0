Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998789B30D6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03910E4A0;
	Mon, 28 Oct 2024 12:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cK6LDV7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5A310E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:47:22 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb3c3d5513so36271751fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730119640; x=1730724440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DeYQ+dNxtG99x0aQLlVj5mjHlCA8mn9SpdtFx66tefw=;
 b=cK6LDV7gjnp+vX5yw/mr67C7lNwwCmjSGTGLSCBqCewWnYD/s7pYZQNzeJlHpFV1Rk
 WHkTi/CGiwtJy0bI1UaGZqWlNjUabWeMJN+h//o/b6MMrOIRVud1XYd+bHeb47VbYYPX
 Fdwq9ZedjShKJ9pyw61zdPwkTMj/gOgBYXtNKECyQyxwwEsHIi2+51xljk4wSgfLCwTU
 smCFpbsWokoxS6qqFrLABAQokwCDLDoauLbdmLdZXgLt2CPgGXFiRco3pmOb2uyByFYD
 e5jc7PbMpyer8y2nCrB2R1u0JtzlSLHfzewNKvC25JY7RN7gCNeoPSp8Owv4lFKlyWqv
 GT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730119640; x=1730724440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DeYQ+dNxtG99x0aQLlVj5mjHlCA8mn9SpdtFx66tefw=;
 b=vMWB+RsUB5h2LM1lAYP4jGRauE6Vf1H3cmSPY81ShVh8DTqdkRqJI8Sf3tAmZ2axdi
 ruD/ygPHBJV/OgZW+HO4oPclSaH9ceAScMmXG4n249v7zid4Ymm7ZRuiuoiNfz8sZiKu
 s9OqjoL38Yt31qWTkiWBaV2Jut93mmpMokmNqLAwTFyfYz8thzk0r/oI/Jq54giJJ6A+
 Ffy/WbTduoRfE3dhtS82vlBeYQwDTHAJmpQlq6Sp62pVJrFpGnsayS1ih2OyguI2IX3I
 crX5mGph07kBtj8EuAlfE979vHJjjRx3LkJcwP5l1zPAX9Bn60I/+E/rJDsvmULtLoBe
 I5HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtwELSXsW1AmkH1wxp3BqL9X01w3pS0r6zamAhyHxgLWwF281q66nQ2EvdMNnnHK+aR+VdWQbd/K0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR5/UB7+uywWnDZlF+wAIIrzn11YJXxYN5i9xxSxZXue0ppKap
 dm9Esu/I+rJcJwRCC5xfxv+k9RaPTMwFxAV23vRzYQ/19pYOJYgenOutJHeTgTb5h8GRP+YcxRa
 MnHEBbAjtvRhSIuzE9nNWdDbAde2PFFtnxGJThA==
X-Google-Smtp-Source: AGHT+IHOLCFQLPNhZz+uFzdwwXch/oc0CkWdrvmLFctGLdK8llDYUMinPepdGvS7x3K/TdVsln9gijrEdwd/6GxRpNo=
X-Received: by 2002:a2e:1319:0:b0:2fb:60a0:f4e1 with SMTP id
 38308e7fff4ca-2fcbdfe8db2mr27240591fa.24.1730119640455; Mon, 28 Oct 2024
 05:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730070570.git.jahau@rocketmail.com>
 <30c154954a4e0f75d90f6ef6f393a5ba8b3ffea9.1730070570.git.jahau@rocketmail.com>
In-Reply-To: <30c154954a4e0f75d90f6ef6f393a5ba8b3ffea9.1730070570.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:47:09 +0100
Message-ID: <CACRpkdZfJqhUFrpv7BmMiuQYJJ8dveJyaKVh9dpVYbz-QDnKGg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/panel: samsung-s6e88a0-ams427ap24: Add
 brightness control
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

On Mon, Oct 28, 2024 at 12:42=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com=
> wrote:

> The tables for brightness to candela, aid and elvss were taken from downs=
tream
> kernel file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [1][2][3].
>
> The gamma table gets generated in "ss_dsi_smart_dimming_S6E88A0_AMS427AP2=
4.c" [4]
> with hard-coded starting values. The function smart_dimming_init() [5] go=
es
> through the v{*}_adjustments, generate_gray_scale and gamma_init procedur=
e.
> Instead of calculating it manually, it's easier to compile a custom downs=
tream
> kernel with SMART_DIMMING_DEBUG enabled and read out dmesg early at boot.
>
> Selection of the values for aid and elvss are again according to downstre=
am
> file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [6][7].
>
> The set of write commands is guided by downstream file "ss_dsi_panel_comm=
on.c" [8]
> followed by "ss_dsi_panel_S6E88A0_AMS427AP24.c" [9].
>
> The dsi mode flag MIPI_DSI_MODE_VIDEO_NO_HFP prevents screen flickering w=
hile
> changing the brightness.
>
> [1] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi#L341-L397
> [2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi#L214-L254
> [3] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi#L301-L320
> [4] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/ss_dsi_smart_dimming_S6E88=
A0_AMS427AP24.c
> [5] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/ss_dsi_smart_dimming_S6E88=
A0_AMS427AP24.c#L1816-L1900
> [6] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi#L256-L268
> [7] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi#L322-L334
> [8] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/ss_dsi_panel_common.c#L1389-L1517
> [9] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/ss_dsi_panel_S6E88A0_AMS42=
7AP24.c#L666-L678
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
