Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D939690EE4C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 15:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E630110E2AA;
	Wed, 19 Jun 2024 13:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a82dHyEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5197C10E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 13:27:54 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-48d9998787fso2297874137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718803673; x=1719408473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+EdAOsIyAeNB2MEPeOqJ21gcXQroPI9pOzshoyJ47o=;
 b=a82dHyECNMmL5KjXy7XvE6yLvFoKmxi0aseqkKFFWFsdMXtLJ81iko8pxic5C4I7OI
 tU7DWt1TqzBRs/0YZRIcpJp6oYbfBm7avn0JCYyG2izqFwE5DhhjQZCB7K0r2U4k/WKB
 8+Cec0H6x/TyQxRd07z6aRz9FDcUjKYGtt7YbNcMhNCLhMWG8fFd0EbmJJOC6IRgWs+Z
 Fjkm0s7MP6JlOHHZ+gwrJIA2rS5vw76qP5Gp9W4Mzm1DOpWY2c991/oFTMX1ZVTUVhu6
 7px/Us+A6kfPhK7Ahudn8ffKlSx7CYZQ10spwRtCOaeRKRVgIm89ln6gHXpPP2kSnoV3
 Npwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718803673; x=1719408473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+EdAOsIyAeNB2MEPeOqJ21gcXQroPI9pOzshoyJ47o=;
 b=aKPuN2mzxOxgAfpmIAAXUugN9mfSc0KqkJdAU7Q1dBS9gg/gz+rk+JPNvROXd+zSwM
 zZG5Br0sjSKDLlasJ+wdtaZnRsaUO4JeH0Irc8gL7a1elwGWhogH2iKFYMpGgSl0dFtS
 sDVwYrDda1JgoEQNGrI7wCOtTf/XTzEOWwmrTw/83ORv8rf16LHxN/kD3r8xtriRQDNI
 QecyPb95t3T6GYkOaaRtFQizs7kdkgb3785wm3JdRHRWZsYsQqVdWallAnPE1mBgb8lm
 D7oIiNTd1WFwTPWsyrl8Q+8xhBX6vA0Za0335SzCgiKfpG+Q3R8e0seXNUToYHEPy9kh
 Jjbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxonpbNzPdEurjGUuqgFshpSVbyOCbDbjHK0AgsC2jFRssdiLCCNXEv3UyJCDi/NZvN7OK0bLRzSQcb0IMEa1pNIi8Ya9ioWBLFalNCPJU
X-Gm-Message-State: AOJu0Yw+dPgLYrb066lvllXasb+07kOjPZ9tiEZkQ1OeZ44pFnito3ry
 OhwjNluA7utVJ98BgvyMhQKbybByNSnR2/AwEuap4Hd5xeC5TmxLdl0eSWU//pTIFkKC/qxfTdx
 hc9QBIZRo9p6zkWeqs2zf2glc6ks=
X-Google-Smtp-Source: AGHT+IGwE8bFf/VlY/jk/YXUnYkoze8GDMP6nvE5vZma8oxX1CjkKEtLu+mwZHIrK4bFz/7xDykwdahIAJ7lHkmGhA4=
X-Received: by 2002:a67:ee4b:0:b0:48d:8904:3dad with SMTP id
 ada2fe7eead31-48f13140716mr2780689137.32.1718803671634; Wed, 19 Jun 2024
 06:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-11-e3f6662017ac@gmail.com>
 <pkmxbxoc4sno6mbjsftz6hp5lxefc6yhwxjlhiy2pd4wbkzpvl@as43z4t64mm6>
In-Reply-To: <pkmxbxoc4sno6mbjsftz6hp5lxefc6yhwxjlhiy2pd4wbkzpvl@as43z4t64mm6>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 19 Jun 2024 16:27:40 +0300
Message-ID: <CABTCjFABEY0urmgrr5E3-oq9u_aNR8KcCTMpJpoGLOTPOfKAGg@mail.gmail.com>
Subject: Re: [PATCH v3 11/23] drm/panel: Add support for S6E3HA8 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
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

=D0=B2=D1=82, 18 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 21:39, Dmi=
try Baryshkov <dmitry.baryshkov@linaro.org>:
>
> > +     ret =3D mipi_dsi_compression_mode(dsi, true);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to set compression mode: %d\n", ret)=
;
> > +             return ret;
> > +     }
>
> Interesting, compression mode is being set before the PPS programming?
>
Yes, as per vendor kernel:
https://github.com/klabit87/twrp_android_samsung_kernel_sdm845/blob/e8bb630=
39008e1704a2f1bde68d39ded9c16ea88/drivers/gpu/drm/msm/samsung/S6E3HA8_AMB57=
7PX01/dsi_panel_S6E3HA8_AMB577PX01_wqhd_octa_cmd.dtsi#L5508
