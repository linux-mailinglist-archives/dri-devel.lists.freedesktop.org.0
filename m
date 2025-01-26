Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32491A1C5F8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 01:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29210E116;
	Sun, 26 Jan 2025 00:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VnHc0hkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92A210E154
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 00:52:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-304d757a9c1so36480711fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 16:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737852758; x=1738457558;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e571IkY7EK87y3Sunky/t3TOpY/BAarwHBxbWfeNYyU=;
 b=VnHc0hkPkO53Kmu8LP0QOKK8H81vmjNli22WujIaiyGdeFtFVHIeokkgMY6GS1G1ne
 y+zOpkmCW1n7Nx53BYvqdBVortiYHx4fn5IiI8GKx/w2GIUCJEPHTLJq1hhu54vY2lHf
 ni30C4zvqp4r1SWvO6hrAeRATf6OrNIdM0kts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737852758; x=1738457558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e571IkY7EK87y3Sunky/t3TOpY/BAarwHBxbWfeNYyU=;
 b=kk8CrwmW0XuoFNWjLTEMo1FeCIHDlq5Qb90ctAynkOZGMi236NK/JzY3/bJd+Iecoz
 1oW1GYQmlwItdTFffZ+PfxPdUPulFBLqBs2vDiNMougtccAmUOTSdnC8IS3ZqhFHKLGx
 2RpybcbE0ujSS7sqWAdmhn73hZV1JorH3GQpeLgKJLaaP/RQ+EOhPFkm6y7jTylJI3eB
 Z4dNCT5WFLGkBjLd6PxwZ1l4arJtk1ymkODtRD1Frkp50iLnzoe3lQcNOkT5PoB2ROgP
 bg0oJljmh6IOBIhuL/3Ye5Ti6HvPJIxhB6ne4PjtfuVOqRBUOWQUsd3TVwqocUh89MiJ
 hGqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqWn3lrrVMeXuriumG3HkarsxWYGfP3KJP+SjotSyzumnCdLph+Rw1s6rUHePrR23SUrYdODS5UU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywXunJMYwnjD2GMzbFIkssmn/hwNPqzuFhFi6rQBzf+YVZH3cZ
 1HhfZUE4gBlSKsBpms5st5wfMj0lSmzmjpt/cr4j6JHwofCPoRUeKXe2ylaYin++m5TXRsbFrE0
 ykA==
X-Gm-Gg: ASbGnctNrNfCDHcJNEN6lC9XvtaZ15XhnaV82qDwlEbGKRFsIDKnMjDpyx1Bxd3jF/j
 2qxmTi6/5U2qySvHYzbPjikpB6dpDQ3jLH/f2Dgxi6YZBj8b9kaAA0lEHMqcBBaPB9qqG/N3zWw
 kZPqr7M2XVe0jBQgAEMGB35Ryidsiqjv1+ZpQxm4GcC1IdUBFZNDX/YDcrXkpn+NrU72OqdXWbS
 C5Jrp0C7j3UTb5AY8ZZAAntomALTNEVicpbaPMbCKlP6Ok4VKDGzGcy4oNi3FVcVzwug5JrRQvx
 /ldBggoaB1nzEOVTXYaOuOtJgpp696u3ZfIUEPkkOczI
X-Google-Smtp-Source: AGHT+IENq5LLhzcUAGsg2UlPED3gG3nWPYPmjln0Tm/dALF8qJX992DFqy9U3wEW+kzWpPakUm63QQ==
X-Received: by 2002:a2e:b811:0:b0:302:3356:35d7 with SMTP id
 38308e7fff4ca-30761c44fe6mr33725221fa.18.1737852757609; 
 Sat, 25 Jan 2025 16:52:37 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc1971bsm8496701fa.76.2025.01.25.16.52.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jan 2025 16:52:35 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so3477777e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 16:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXyhX9Wzh/lldeB5FdfGNgLzc1oiUSg7ICvGrop/MiAcUv8yfXQXPriAt6I4jFipinijIXSJt4M/Hs=@lists.freedesktop.org
X-Received: by 2002:a05:651c:205c:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-30761c517bdmr37753901fa.19.1737852303712; Sat, 25 Jan 2025
 16:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-13-damon.ding@rock-chips.com>
 <rwn3g7tqgjnc525cjqtivgfgedhooiayn5nujng7bdzazgqhle@wfpuvoyr2tii>
 <CAD=FV=WKsA9fcq-LzGcYmgbMuMLUp5SMggpzBzZnvd3sxGf9BQ@mail.gmail.com>
 <7ef0454b-fddd-44c0-be4a-c81c443f08f6@rock-chips.com>
In-Reply-To: <7ef0454b-fddd-44c0-be4a-c81c443f08f6@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 25 Jan 2025 16:44:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZOfqcV51Sog3CNBe0mengYyX5cRbftdDY0e73mZNWQA@mail.gmail.com>
X-Gm-Features: AWEUYZlT8dd77sVC0SZMqkozj-k92yxOjbM1lGN9IVzDz0DDUqySb4xOYDl6kKM
Message-ID: <CAD=FV=XZOfqcV51Sog3CNBe0mengYyX5cRbftdDY0e73mZNWQA@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] drm/edp-panel: Add LG Display panel model
 LP079QX1-SP0V
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, heiko@sntech.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
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

Hi,

On Fri, Jan 24, 2025 at 8:18=E2=80=AFPM Damon Ding <damon.ding@rock-chips.c=
om> wrote:
>
> >>>   #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product=
_id, _delay, _name) \
> >>>   { \
> >>>        .ident =3D { \
> >>> @@ -1955,6 +1961,8 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50,=
 "MNB601LS1-1"),
> >>>        EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MN=
B601LS1-4"),
> >>>
> >>> +     EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200, "LP0=
79QX1-SP0V"),
> >
> > I don't love that the ID is 0x0000. That makes me nervous that the
> > panel vendor isn't setting the ID properly. ...but at least the string
> > matches in the EDID so hopefully that will be enough to uniquely
> > identify things.
> >
> >
>
> The ID "0x0000" makes me nervous too, but the EDID obtained from this
> panel indeed show it, which is quite surprising. May I still set it to
> "0x0000" as it really is?

Yeah, keep it as 0x0000. Since the panel name is in the EDID then
commit bf201127c1b8 ("drm/panel-edp: Match edp_panels with panel
identity") should provide some safety.

-Doug
