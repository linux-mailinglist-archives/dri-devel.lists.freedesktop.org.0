Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B089F7B0B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E0D88668;
	Thu, 19 Dec 2024 12:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OcyXlYsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564BC10ECE9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 12:18:32 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5f321876499so358507eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 04:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734610711; x=1735215511;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/zZmtHNscTF0PAfth4eqmIzKHaZDRc5JpLLiC42f1I=;
 b=OcyXlYsPd6vx8nBre8F1CyuwKiCJB/LPZaLDZMhq8bsS9eM8sOLXp3Ykw6WRAU82nv
 j44twxco1bG4LeoecQxD75kuuLdxU+YKPYfsxiWN1EVeGyVeAJ3elxet9HTpjznLZ/X5
 4pSM4DtKksclOaGeNqwiTMtNE8Qn36Otk0fVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734610711; x=1735215511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/zZmtHNscTF0PAfth4eqmIzKHaZDRc5JpLLiC42f1I=;
 b=ZsLVwNdhczNFH1f0MohiELW66+a3tSUyB+llLYnr1JYvqDTLG+mfzfVWvROS+SEisN
 W6HeDcMer1DmQpxXRDPi6OoQTQ0z+JlgkxNFPxejYjQRZ2dSRqxPDEloFQ+XeG+Hexst
 2/PeUMOoj5tp8h1nXbohnne8S3f2B26NslJTZN8VtozqnTfTFB/1yVV2uX+55YKA/e8W
 5b548hFuXYwVZIdGNppqEUMQEzuK0Q7o9F2cvOw6B9BGNEkGk40PiwCMP741ywQJuZRX
 6kIl7TfnTp9US/gnBhcbnNHlF4/v5M0I5Vp3QqEPbxJUe5lN0JBvB0hBw0TtWaRas+Us
 11kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtZqJWcvFvSV36sRGIXhigAFXm5bR/DMw2saEZr4lXdiiNRPSwSmiU/6LG3kHLv4MTD6XV4sVoMB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4lCyx2mC6b/61BZHBKMWCtYapTeqTIa+SyF4aOBWoO2xnpuL5
 b0korFIEyeMfa9hfAksiG8uFi9+Gld3uzVd72Hg9b2HAkdlRwcgVeQ1BFg+k4aNNHfXls5F9jro
 GFot6piViNVk4rniv6OUNiwUKoIxcvs/Ak3Rz
X-Gm-Gg: ASbGncvuiL7zCefk0rof+mNmAmdwHfXxjRvL5rDFdiKLhLq/e/IO0hITRmdCgtZfEsW
 4oUsZG4Bb2iyeaOiP58ZpcjIkAMD7lLc7rC+Ggmtfxa3X7HX6y8KMTUZMxCm8kWwn
X-Google-Smtp-Source: AGHT+IEvtT8t5Teq56hrAOeQiyeMSo8uG29Y8OsZYd86BewMpp2JXJZrHKqIu/101yrrZb6SsaRzwH0dQwUII6sjcPw=
X-Received: by 2002:a4a:c4ca:0:b0:5f2:b6d5:bf53 with SMTP id
 006d021491bc7-5f4d86056c1mr1722999eaf.1.1734610711521; Thu, 19 Dec 2024
 04:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20241219070330.224996-1-xji@analogixsemi.com>
In-Reply-To: <20241219070330.224996-1-xji@analogixsemi.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 19 Dec 2024 20:18:20 +0800
Message-ID: <CAEXTbpcnuJykS8GPeNb8eRDwuDjMuHBSd7H9+aboYkfg5Ub_Fg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge:anx7625: Update HDCP content status
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
 bliang@analogixsemi.com, qwen@analogixsemi.com, 
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

On Thu, Dec 19, 2024 at 3:04=E2=80=AFPM Xin Ji <xji@analogixsemi.com> wrote=
:
>
> When user enabled HDCP feature, userspace will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
>
> As anx7625 bridge IC will be power down after call .atomic_disable(),
> then all HDCP status will be lost on chip. So we should reestablish
> HDCP again in .atomic_enable(), and update hdcp content to DESIRE if
> current HDCP content is ENABLE in .atomic_disable().
>
> v4:
>  - Change HDCP content value to DESIRED if HDCP status is ENABLE in bridg=
e
> interface .atomic_enable().
>
> v3:
>  - Move hdcp content value checking from bridge interface
> .atomic_check() to .atomic_enable()
>
> v2:
>  - Add more details in commit message
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

Tested-by: Pin-yen Lin <treapking@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++--------------
>  1 file changed, 29 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index a2675b121fe4..1871262d5a97 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2137,49 +2137,6 @@ static void hdcp_check_work_func(struct work_struc=
t *work)
>         drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
>  }
>
> -static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
> -                                         struct drm_connector_state *sta=
te)
> -{
> -       struct device *dev =3D ctx->dev;
> -       int cp;
> -
> -       dev_dbg(dev, "hdcp state check\n");
> -       cp =3D state->content_protection;
> -
> -       if (cp =3D=3D ctx->hdcp_cp)
> -               return 0;
> -
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> -               if (ctx->dp_en) {
> -                       dev_dbg(dev, "enable HDCP\n");
> -                       anx7625_hdcp_enable(ctx);
> -
> -                       queue_delayed_work(ctx->hdcp_workqueue,
> -                                          &ctx->hdcp_work,
> -                                          msecs_to_jiffies(2000));
> -               }
> -       }
> -
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -               if (ctx->hdcp_cp !=3D DRM_MODE_CONTENT_PROTECTION_ENABLED=
) {
> -                       dev_err(dev, "current CP is not ENABLED\n");
> -                       return -EINVAL;
> -               }
> -               anx7625_hdcp_disable(ctx);
> -               ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -               drm_hdcp_update_content_protection(ctx->connector,
> -                                                  ctx->hdcp_cp);
> -               dev_dbg(dev, "update CP to UNDESIRE\n");
> -       }
> -
> -       if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> -               dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\=
n");
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
>  static int anx7625_bridge_attach(struct drm_bridge *bridge,
>                                  enum drm_bridge_attach_flags flags)
>  {
> @@ -2416,7 +2373,7 @@ static int anx7625_bridge_atomic_check(struct drm_b=
ridge *bridge,
>         anx7625_bridge_mode_fixup(bridge, &crtc_state->mode,
>                                   &crtc_state->adjusted_mode);
>
> -       return anx7625_connector_atomic_check(ctx, conn_state);
> +       return 0;
>  }
>
>  static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -2425,6 +2382,7 @@ static void anx7625_bridge_atomic_enable(struct drm=
_bridge *bridge,
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
>         struct device *dev =3D ctx->dev;
>         struct drm_connector *connector;
> +       struct drm_connector_state *conn_state;
>
>         dev_dbg(dev, "drm atomic enable\n");
>
> @@ -2439,6 +2397,22 @@ static void anx7625_bridge_atomic_enable(struct dr=
m_bridge *bridge,
>         _anx7625_hpd_polling(ctx, 5000 * 100);
>
>         anx7625_dp_start(ctx);
> +
> +       conn_state =3D drm_atomic_get_new_connector_state(state->base.sta=
te, connector);
> +
> +       if (WARN_ON(!conn_state))
> +               return;
> +
> +       if (conn_state->content_protection =3D=3D DRM_MODE_CONTENT_PROTEC=
TION_DESIRED) {
> +               if (ctx->dp_en) {
> +                       dev_dbg(dev, "enable HDCP\n");
> +                       anx7625_hdcp_enable(ctx);
> +
> +                       queue_delayed_work(ctx->hdcp_workqueue,
> +                                          &ctx->hdcp_work,
> +                                          msecs_to_jiffies(2000));
> +               }
> +       }
>  }
>
>  static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> @@ -2449,6 +2423,17 @@ static void anx7625_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>
>         dev_dbg(dev, "drm atomic disable\n");
>
> +       flush_workqueue(ctx->hdcp_workqueue);
> +
> +       if (ctx->connector &&
> +           ctx->hdcp_cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> +               anx7625_hdcp_disable(ctx);
> +               ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +               drm_hdcp_update_content_protection(ctx->connector,
> +                                                  ctx->hdcp_cp);
> +               dev_dbg(dev, "update CP to DESIRE\n");
> +       }
> +
>         ctx->connector =3D NULL;
>         anx7625_dp_stop(ctx);
>
> --
> 2.25.1
>
