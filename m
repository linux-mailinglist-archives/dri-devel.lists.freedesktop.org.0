Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7361A9FAD2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F310EA1D;
	Mon, 28 Apr 2025 20:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YCpiCoDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2A210EA1A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-22438c356c8so58857295ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745873645; x=1746478445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=YCpiCoDq6sPh6svruz0MlsIlBweFs5dqFoLwoEOv5qBH2P0tZpgsJMC2YgkUDl4Qcp
 uwgov61Zu87qoR2jag2VIo/RoERqRSzCL/3QfPPb0ySJ2lIJY4jR5P3xlgSKolGcXR/2
 bCjngBT02j6RgeUPvPNaJRgTCUXyjyx3pfsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873645; x=1746478445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=vcVwTdJyOsxjuIhAxK4Oui9K5/SIeM5RUcKPQcjh5kS8Y0C9eupNnyQCG6h3r/iyxT
 j5OciCpl/wJ13eLAl9q6VtIpc5yQhL+634TjlZcIzycWJeDiFRdIcBSOQTbtFiHMLPh6
 zhYrkzNH7fyZSCrYTppmvZWusc+lGAQyteDLI6bENJ9gfUKFsx7+toSHwArK8elSRk5L
 Y9ArLTqJSPoRm6mdZyMVrkmlaOTrbOxkrEGpdzmMMCK88WQE0KtRcVpIxxPKabW+gfRE
 4MowG8j/nZ7NvDgC4BqD2x8miYhqrQgdUZVXnDupwWYC7UjpLN1dMVl+6J1zwRzWXpP5
 fAQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUq2VojQbH3kDHQ9pzya9Z5nbr4AeTKfyN12pOsqwjKjZI9+wQqvAH4lsVfdkVn2mDEX5nMn+KRu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOtZRRhsBbVrJdCaJ/ZQbHNL3zieUDPnAaIDNi5FnpcLJtQH4P
 xbsPMsk7ocNFz09fDelgTDsuis+ZNSTI0RSedErP1ZNIcjtAQarED1X2VvvuAV1DwKmy7F6NjWs
 =
X-Gm-Gg: ASbGncvht6kKHTgcrmWiNAxGd5mi8TmuajlHn3Ud1XSU2njjpw3qAAiydJiinAvJ/rL
 4M/ugP7pXFhp8dxmbSkKwtRDRx0eSdSJWrgfc4ebIwbTFL1bn/fyXiWPBLb3RlIRm4nY22MZMGn
 Wnc/U7z2DqLdTJ+bYqLQhAuwUfDnXgJKGSx1o+iU6c4ZYWGvVqPODUKZCjWOrEJUN1ztP+/Ro69
 1kCsD/r4iKENBUlfcZixLelpAnGrWvisd1tj33n1cDbS7BNTLloP3YBwVniaUZIiAwrIyy2Y285
 wawC0nJYV+s7YiuWz795lvU+7wfp8TK2lD2XX1ZXZtkS5FRoGx14a2tTQ4vgZyS5Tj08/84543d
 MJ5JG
X-Google-Smtp-Source: AGHT+IHMbhnuTaXQiDIhBL7h9mi/XkM4WdG7IaGojcu4Q5oFoPd7HM13K+aMh59ijpZ92FB32jz6Lg==
X-Received: by 2002:a17:902:f60a:b0:223:5e54:c521 with SMTP id
 d9443c01a7336-22de5e03bc7mr16472115ad.0.1745873645390; 
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15fa80fbb5sm7659791a12.55.2025.04.28.13.54.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff694d2d4dso4697627a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVygzH1f9S8S+2plui84U2zhnwzyd9oi505Z7xdmigijBSeB1nf6ObsK4QCcmRtbKyHcJOzkbH8frc=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Herve Codina <herve.codina@bootlin.com>
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

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
