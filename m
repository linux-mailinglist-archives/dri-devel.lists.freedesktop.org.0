Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416789B30BB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0FE10E49E;
	Mon, 28 Oct 2024 12:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JR5Dn2e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF5610E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:46:25 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539f72c913aso5383845e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730119584; x=1730724384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aSTTKcsEues9Slud5u2I4oUCfkMRIvmSj7eb96RQ74=;
 b=JR5Dn2e1O6SWjkdgqdvm9iXB+WNG83UfskhPih5tW85Kh/rIC4GsjL5iOS0JuIFmzs
 sSSFAbpLfBqA2l1cro7znFlKv2vHqqNuV1Ou34mFtDxEX82VCiK6ITWwZ82I6ZnUEwn9
 oZGXFZYWbsKVggsVBO+a6dPP7HxlnwpT7kCd9JNARkzrM17PDY+nCOuwaGI//++Cb+X1
 YI5nnRwgeaNzcw+WNB1It61OVxUq5YOdntXVV48u2L1ehKSkOS4SmdZeuzk+75wXmvuz
 HewSiCx9VBzPcweNhondvG3xuUeeOStPtHj9kJ5m4hDChU7oYAQH9s4GLNkartww2Hi7
 nrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730119584; x=1730724384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aSTTKcsEues9Slud5u2I4oUCfkMRIvmSj7eb96RQ74=;
 b=rbwV3Cxt8o6pV8Y2iBYXt93+ZUdO2zt7riH6/pfMbV22KbWMeusZ2Jwuyg7e9EK8md
 CZlvZMoYMqh4ka1KFshsrgD+TyCyT8Xc8eyqgsb7OPMD2NJGTO+c2Ldo6OgvaicS8oI5
 RKHpD7V2OqBsuE8S33tMk4hxkB5UaXp/tS3WTxNGGJkrQLbrwdXG5eanMqt2HhfqO3I6
 V0dvPIuzT+u6Y6dJ1IJarEx5untbgluESaoxWumGGHASeyXSDOPSJnVvDjWQKO7mhvLG
 CY40WFlWx4IgvZLwm/6Q0z3J9q9fh5anm59cD2KamhJQVHWdbWJs+iijF7GS7Y52hqXY
 /tig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+vj3rtU/RkBVTQDFtvUynGFen0cqRlNDoilSr6s5+au6Qkd78YS/YOhrejd06/iKqemY2quK8EzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAl4hSYEmdR3WEfpNCUEHq8h3n7q6cppNRXZYo8WV2MTkg2nLe
 NcMk3ChVV7BOfmenv1RInSCvd9TdWUIR6zit84tXuePRlATQdCXv8n4ec6Ro2AT3o63QuMppAA7
 jiW8d1aav7ekg8BmRB/b16gtt1fYhsuvRIFMIgw==
X-Google-Smtp-Source: AGHT+IHKBOt7btwvvrMi093N8L0HSsxQd++C6ep3baxxUYVZr5QdfiIpCSS/MoaRNRGceN2TTToscxI5mPA8SlKe6OY=
X-Received: by 2002:a05:6512:318d:b0:539:f65b:401 with SMTP id
 2adb3069b0e04-53b34c463d9mr2861815e87.57.1730119583728; Mon, 28 Oct 2024
 05:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730070570.git.jahau@rocketmail.com>
 <d92ef0036b66520bb6d1ec908165e776cf30c303.1730070570.git.jahau@rocketmail.com>
In-Reply-To: <d92ef0036b66520bb6d1ec908165e776cf30c303.1730070570.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:46:11 +0100
Message-ID: <CACRpkdZSxvLri-9CQQMuFP-Q4UswoJq4YDySWR0GXz0=+xcLiw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
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

> This initial part of the panel driver was mostly generated by the
> "linux-mdss-dsi-panel-driver-generator" tool [1], reading downstream
> Android kernel file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [2=
].
>
> On top of the generic output of the tool, there were a couple of changes
> applied:
> - Added mipi_dsi_dcs_set_display_on() to function s6e88a0_ams427ap24_on()=
,
>   otherwise the display does not show up.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off()
>   changed DSI commands to multi context and used "accum_err" returns.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off() repla=
ced
>   msleep() by mipi_dsi_msleep().
> - The function s6e88a0_ams427ap24_get_modes() was changed to make use of
>   drm_connector_helper_get_modes_fixed(). This also required to include
>   drm/drm_probe_helper.h.
> - In function s6e88a0_ams427ap24_probe() registring the regulators was ch=
anged
>   to devm_regulator_bulk_get_const(). This required to change supplies in=
 struct
>   s6e88a0_ams427ap24 to a pointer.
> - Removed bool "prepared" from struct s6e88a0_ams427ap24 and according pa=
rts in
>   functions s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare=
().
> - Removed include <linux/of.h>, it's not needed.
> - Added comments to the mipi_dsi_dcs_write_seq_multi() lines in function
>   s6e88a0_ams427ap24_on().
>
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-gener=
ator
> [2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Comments instead of #defines?

OK then, it's readable too.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
