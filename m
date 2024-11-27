Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B89DA189
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 05:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7210E03C;
	Wed, 27 Nov 2024 04:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KX6HgwrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5E10E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 04:43:13 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3ea53011deaso1183557b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 20:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1732682593; x=1733287393;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=buIj9lD4l7EjMTWNqbbtXYSQ2Eo8RWol7XgFHIWEhAQ=;
 b=KX6HgwrV/fv0wpNLrgwl9Nmvlghp9fWpR0GiVAr2nQszKmOTrY3o5aS9abtAXtZO6C
 3v/rAUBiZMkkev2O43eyJI15PZJUXoFRiaO8VzAoVFrg8BRKduhbRVpkvDM7XjfM/c3k
 QDQm6QyGlKqHI1QMJyElbqWyQ2msNmkMnvNPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732682593; x=1733287393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=buIj9lD4l7EjMTWNqbbtXYSQ2Eo8RWol7XgFHIWEhAQ=;
 b=MSo/DByAfFNLHiW/dZ2VGV078MFvPqAEavNKqpNUujPQHYLvG0+OALrCy4kfbFB9oQ
 GE7v81tR+zspPngzuqmBhEQlhWLAJX9inKm9U7sEmqzl/GqObGKxApcXLZPKq2bSqxgh
 qob8iTqCCTiy6wgoQkL1xKJK+RiaWu5LXh9IxaxH4+OQgmMr1jhUF9YDUWypmqZOIlo1
 Yj4kcK7oHk9tpVKak1IN3lEZsxTAiFQup/dAxIMcGazTgNYCLnUbq4D5rsSjWKs8aYAt
 BI9ZXyw/WAw3TA2xl7gbBu5Vux6pRS4AYBVD1OdktgMVdyHwhRzHkBTgTPMFGjBriiM0
 Li2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSr5oou7QUiGqsPCzFc3Unri8JrzyDN8KtKFhTw3hjjJOqitSnuhpxn8L6Qjee+Fd2X/2I6GP2Caw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg4QAdxEW/1LjWLLXrWSqpO81SAAloNHgZ1YSMXWIQNYNlvoEU
 /4Q9hvOhWIgDXSdw+J+KgK3FvDsPmiXupacFdO+3Gt2nVL+O6RoGW65iWY8CgVTxOoCz9InZdVE
 /r6mxwskBMz4ftXHkmy94OvQbAoiROOX/XZuN
X-Gm-Gg: ASbGnct0cHhfPQ2UyE2I9M96mRM0grCuAG8jZ6hR+HPOz2C2V8whRbwT2ifrBWlu2Cu
 y5qKqfP+azgsNCh1CLKSPayfTZlmK7Z31sQDYT9Q20ZhpfwrjXkAmnfwH+Jc=
X-Google-Smtp-Source: AGHT+IHzVwgmp24HNWYR9QgilyN0+vKnYnhsqeCOo3U9Uzr8ko0VEjMW3SCABnxFA+zY3W8ifSeKNUAKmHsycZau8KU=
X-Received: by 2002:a05:6808:3082:b0:3ea:5a0e:941c with SMTP id
 5614622812f47-3ea6dbc8cb9mr1709943b6e.10.1732682592979; Tue, 26 Nov 2024
 20:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20241127030221.1586352-1-xji@analogixsemi.com>
In-Reply-To: <20241127030221.1586352-1-xji@analogixsemi.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 27 Nov 2024 12:43:02 +0800
Message-ID: <CAEXTbpe=3mN-wCJGRVe7SSbzr5J=zFhWOF30jm5HH4cN_GyK_w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:anx7625: Update HDCP status at atomic_disable()
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Nov 27, 2024 at 11:02=E2=80=AFAM Xin Ji <xji@analogixsemi.com> wrot=
e:
>
> Update HDCP content_protection to DRM_MODE_CONTENT_PROTECTION_UNDESIRED
> in bridge .atomic_disable().
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

Tested-by: Pin-yen Lin <treapking@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index a2675b121fe4..a75f519ddcb8 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data =
*ctx)
>                                  TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
>  }
>
> +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> +{
> +       struct device *dev =3D ctx->dev;
> +
> +       if (!ctx->connector)
> +               return;
> +
> +       anx7625_hdcp_disable(ctx);
> +
> +       ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +       drm_hdcp_update_content_protection(ctx->connector,
> +                                          ctx->hdcp_cp);
> +
> +       dev_dbg(dev, "update CP to UNDESIRE\n");
> +}
> +
>  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  {
>         u8 bcap;
> @@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct a=
nx7625_data *ctx,
>                         dev_err(dev, "current CP is not ENABLED\n");
>                         return -EINVAL;
>                 }
> -               anx7625_hdcp_disable(ctx);
> -               ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -               drm_hdcp_update_content_protection(ctx->connector,
> -                                                  ctx->hdcp_cp);
> -               dev_dbg(dev, "update CP to UNDESIRE\n");
> +
> +               anx7625_hdcp_disable_and_update_cp(ctx);
>         }
>
>         if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> @@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct dr=
m_bridge *bridge,
>
>         dev_dbg(dev, "drm atomic disable\n");
>
> +       anx7625_hdcp_disable_and_update_cp(ctx);
> +
>         ctx->connector =3D NULL;
>         anx7625_dp_stop(ctx);
>
