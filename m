Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B278B97D4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 11:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0E410F0CB;
	Thu,  2 May 2024 09:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="b/k1EJ7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F60C10F0CB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 09:33:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so89810561fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714642436; x=1715247236;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUPIZkrFl6BEjtW1yyE61WicVfg6hOSYbd+LAsiXxyM=;
 b=b/k1EJ7oPue3Ep0wRs/lx36jAXWXoDDFhLfjSWoLtAkaWrRJR+CVjezuzeH4idKYgE
 n8wf7kZWgzmF/vLJFqMKiXP+o9fnM7HE+4mlLkdtHGTygUjNR41bW4HaiBku7J3VsAlz
 NUFrHICX6O9dUWg72oFzKcWFUbA5QDsUzj9j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714642436; x=1715247236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUPIZkrFl6BEjtW1yyE61WicVfg6hOSYbd+LAsiXxyM=;
 b=u15EsoQgPqMspgHn17hyC4uC0n5czvuXxkuG81lhQMrOJXaKP6Ad9b00yZozcf8Q8A
 fCDf4MbfVLAWpXKcamgDzGRRSwXsUpARzXrZAwrJV+MvN/Du44Xz5q0dutF4ArLKAVso
 RCRf1LSeTyZQBeg7MoatxzSLjdJq3OLI7CDaJpB/2WLzO/EADAJ9NSjolXmXvZT5R4xH
 kdVAateH4PRPBUNaQojmxrr4Gy+7AjamT1k+LfKT6Ph8kuNrF+h2ZQM/qUNfVv7amE+9
 jPWakfC0IfKSOe3NSiCeQ28NF68Ulnng29m+N1gUiARHyScST+3LeW3nDyxMPb3Y49pi
 mt7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh6VECR/PooHAyVsACcELYPvh0DEHGwm9AbE/LwfiJtTderEGKrIVPR2WqUCjHE200bSDd/wjthUWvkcEIys46hq2jjVy1dw+OgfghZ+tG
X-Gm-Message-State: AOJu0Yw+VJraQBGJBl2PYsNBTw2GLu/diFNXpKHpLcKPW2DwJbD/IG5f
 jfqaRhwaWhApFO7i0iK6NtBMDoxd1h6gdqDI2CupJljtK0xihII9HDkMs1WXbp0YLp1FBGtj0kD
 0DrYtd8lPB3/HpJ4zMJwBbgwfJpdrGc2cni1w
X-Google-Smtp-Source: AGHT+IGq4dmzHxgktFLM5a2WhXUqq3A67gAwjMdqjX26QYOxX34ttC61CkVRyaFFQXyx2u2V5502HE2Ng9PF3eBB1oM=
X-Received: by 2002:a2e:994e:0:b0:2e1:fa3f:6165 with SMTP id
 r14-20020a2e994e000000b002e1fa3f6165mr481449ljj.8.1714642436155; Thu, 02 May
 2024 02:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
In-Reply-To: <20240502-anx-tdm-v1-0-894a9f634f44@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 May 2024 17:33:45 +0800
Message-ID: <CAGXv+5FS1UwFiGYh-qZDau0yok3Gwf7g7GdRi=qJAG51ZDXD1Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add TDM setting support
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, May 2, 2024 at 5:03=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> The anx7625 supports two different TDM settings, which determine whether
> or not the first audio data bit should be shifted. This series adds the
> support for configuring TDM setting through a property in the device
> tree.

As mentioned offline, this shouldn't need a DT property. Instead the
machine driver dictates which format is used to the DAIs, and the
DAIs set their respective settings accordingly. It would seem that
one of the drivers is misbehaving.

ChenYu

> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Hsin-Te Yuan (2):
>       dt-bindings: drm/bridge: anx7625: Add a perporty to change TDM sett=
ing
>       drm/bridge: anx7625: Change TDM setting accroding to dt property
>
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml      | 4 ++=
++
>  drivers/gpu/drm/bridge/analogix/anx7625.c                         | 8 ++=
++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h                         | 1 +
>  3 files changed, 13 insertions(+)
> ---
> base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
> change-id: 20240430-anx-tdm-7ce41a0a901d
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
