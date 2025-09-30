Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C46BAB23C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 05:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF98310E4B7;
	Tue, 30 Sep 2025 03:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FMfFMDrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61010E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:15:46 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso2173567b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759202142; x=1759806942;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9VNt+2mjTk7M/315hb/0C625yS1/uUIWUcK/eJkk2E=;
 b=FMfFMDrSFXVI4eB+9RDDDkKmk3Sc232eo4kxZwgEKzQT2J+CCBlwRy/N9EzPQ9NOOl
 9r72pVU3C0IBemHSGOH5rLN0jhaE/D3zvjvinpwOYum7eBoeYFMNeiYR+FQ3fL2ugldx
 ve/9bzIBXM7nUvCwmlpAlBgnij7SlbxWngigU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759202142; x=1759806942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9VNt+2mjTk7M/315hb/0C625yS1/uUIWUcK/eJkk2E=;
 b=m2HtKRNmeRYLdVONYKICXVS7B2I6ozUWWuSfK2ZglmhiZX/6t9/QEVke84XDMELFQK
 57huwz5GMkRQ3gdG4r/n9cI9P4wpBQo/FcVdc+lnrWtGxxCCTBRNppKEDtjKtba+g3D5
 QEyc5ZRj8o4ouToGFUinz0d7j8uNF1NriH+DdP5ME8pm0Hud4ZWzxWO/ign8hK753U9I
 tzctz6GvLi3Qx7Ap2UFhCP/xXel+M1SJuziIy9ga/aiqxSz4K0cfm/xTe9+Jrbgl0OEk
 ayajSHAge+Zv2k7/Rjkt2aziXIdPT3RqUuGMbmg+W37Be2bUDAKJywwJlnvQali+0gqe
 gMdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXyVwmneX0Bc+V3woFbyNjfOfq+UcgtLiklZktHUYjneezkb5QMWVcT8nHJdhcq1iH4bPGWV5oLak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywQdOA5f/s6mrH4CkkB0Z1hRYgQ1qnr+tbk1FEYDQvi1Xf1eWl
 G6OspklWltlPJ18oggnSTUsSz4zPtLMw6JUXX5MPn1ypRk/G8RBUEIbPP8txpZhJSgleIy+Ey/M
 B6io=
X-Gm-Gg: ASbGncsr4a80VSiN9hZ4Ym7dCJKVp/labTBBB4rJtI3RMDzAUswEJZ/LR1UVS4IdQcP
 UHN7BSja/46eQH2kmfJIA1ALNt7DifFc8cDYCI5+nHd6mbAg8XV9Yaji6V+jjpV93N4ESyD2Ff3
 qUWbVgbSxeGqV9w/pHG2d5ctO10RQVmK7CT6h6vBCDtiq+Tsw9yciMbMH1VNa8LXQc+vdjxxrHp
 nLehm0JKPfyXaOf2yFxp8DPzcofe+CvjFEwooJeQCAKsoE1yANKzV8TWwQk2RywVQLDJ5C72R4F
 tkAChg94x0EbIeyNhQwwDePiMybgpO7bI3VyspmRQt6ywVbKnXoPhjiX0237S4ZZko8WUvPRqiu
 JdL2+nynEfRlBEBgtBrCvmbe1OjJFSQ6nZlKUhfpQZ/B8SeHBkp824g9oYnM9NkjQZDTnIDo1zf
 Ip+G8+Pm8x65gzvQNSr0adzUUaTyOUYL9lNps=
X-Google-Smtp-Source: AGHT+IGL9EuYXs6WK/n4VCypx/Cbwg5qFzXS/VoEV34bS7uogEh7Dg5+gKav8GccbcgKQTjFfQdk5Q==
X-Received: by 2002:a05:6a00:1a94:b0:781:1a9f:2abb with SMTP id
 d2e1a72fcca58-7811a9f2cf8mr16314976b3a.24.1759202142520; 
 Mon, 29 Sep 2025 20:15:42 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c0709csm12363588b3a.81.2025.09.29.20.15.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 20:15:41 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b5506b28c98so3718417a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkFb0RQsZia/BH6qxT8YsnoRCbjZjJDWO5psvh22AzGxiEgDkhTsK3Ehjg5aRyj7Xb7+ZZqmz6Xrg=@lists.freedesktop.org
X-Received: by 2002:a17:903:278e:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-27ed4a3ebf5mr154705285ad.16.1759202140267; Mon, 29 Sep 2025
 20:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-9-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-9-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:15:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
X-Gm-Features: AS18NWC8gI3JaOT7-DFuGJwv3EdaIz2pXOb_FdBFJQHicmbnwrHDBbTXVpKcO4I
Message-ID: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga 11
> with Tegra 3 SoC.
>
> The raw edid of the panel is:
>
> 00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
> 00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
> 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
> 46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
