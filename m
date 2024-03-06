Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3537872D3E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 04:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72276112E3E;
	Wed,  6 Mar 2024 03:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lqT3QFKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3730112E3E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 03:07:39 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d22b8801b9so91727511fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 19:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709694457; x=1710299257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3G5ilIgHzJp9EnFwdcrT7Tr1Dh0x/+SLzMuY+cXrdc=;
 b=lqT3QFKA0SfienAqaKN5dCYLgZv85BP7LAE8NDnT5A78My/sHgkE8CBu9qsHdWVjYT
 1fbmXFvMc1KtjZt7ixERJHwvGw5qZK27Xoi7ziFN85jcfI0tprigkNC0XbKEjZfvBjiy
 v5wso33NlIQ3SuUmMyJ0An3llN92+Wl+NNHQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709694457; x=1710299257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3G5ilIgHzJp9EnFwdcrT7Tr1Dh0x/+SLzMuY+cXrdc=;
 b=f4hk4iU0Ozcp8GZ8dsLMI2DZzryZg3ZGnCWtGrEVahYPD5dlXLXTjDDVi3xFjM0LAm
 1ViJY4fMUWy0rekRmaA7Wc5wYADNFwhhE4MBMSxRnV1PY2lhqqVmrvr5jXOmE45GFhLo
 vkkvo5e+uuBbq8DV3Lht2R0gnirCoywqdXoi/L6VgTo+QnwmvlFzYhz24uxXSMTnBUfD
 6K3KkSCATkqtKo0ADOAaZx7vW07V5ULbxzGrcSaxbenFF/8807QJ5jqarbLSZJmLOMrg
 WAsS8fjLTfrOFEDrlzz+r4bA4hBNue6EgpVxZyo6awAT9JK2CwzGCDv9jdK0Mzg0wZ6M
 MYjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmkQTMk3fi3OZeCuw3L95LAGwu7Q3AdUNm+oWAPEqhxpUdaxCK7fctkOXSKPHHBphS+pWLqu14kN+wVMxb+aZytcKC7BuWfhcfKRJgWmj
X-Gm-Message-State: AOJu0Yy+49tpg/HkPvXpMawoBK0Yud1FYSrj2YzM6s9RPZk1CsfCAKEV
 oaK1rYW4P4A7HTynnjdG4E0kvcPEXZjpxVaA8W2IXYuzjUkxgDxDxFIWU7eWWi7atSdbXiT0msB
 ttFWJgxA+aR58O8EYc2nGW+kSQaG82sO2QRHd
X-Google-Smtp-Source: AGHT+IFd4fYrH7VT+oC7ZfIpSRkqSnwMMbSguOpGCTPqEmdBUEJov0MCaZASXOwtSpdb28dWKW8lrLtkXDn42JRqQ8M=
X-Received: by 2002:a2e:9e16:0:b0:2d2:d32b:dabf with SMTP id
 e22-20020a2e9e16000000b002d2d32bdabfmr2332926ljk.22.1709694457516; Tue, 05
 Mar 2024 19:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org>
In-Reply-To: <20240305-anx7625-v1-1-83ed3ccfa64c@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 6 Mar 2024 11:07:26 +0800
Message-ID: <CAGXv+5GdgECuCeXGX3MJJRMr3XyMdZkJPyH7e5V+041ViQEi-g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:anx7625:Update audio status while detecting
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

Hi,

Please add a space after the colons in the subject line.

On Tue, Mar 5, 2024 at 8:32=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> Previously, the audio status was not updated during detection, leading
> to a persistent audio despite hot plugging events. To resolve this

                       ^ it feels like this sentence is incomplete.

> issue, update the audio status during detection.

Please add a Fixes: tag.

> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 29d91493b101a..9f0d0c5b8ebf5 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2481,15 +2481,22 @@ static void anx7625_bridge_atomic_disable(struct =
drm_bridge *bridge,
>         mutex_unlock(&ctx->aux_lock);
>  }
>
> +static void
> +anx7625_audio_update_connector_status(struct anx7625_data *ctx,
> +                                     enum drm_connector_status status);
> +
>  static enum drm_connector_status
>  anx7625_bridge_detect(struct drm_bridge *bridge)
>  {
>         struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);
>         struct device *dev =3D ctx->dev;
> +       enum drm_connector_status status;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
>
> -       return anx7625_sink_detect(ctx);
> +       status =3D anx7625_sink_detect(ctx);
> +       anx7625_audio_update_connector_status(ctx, status);

Nit: add an empty line here.

> +       return status;
>  }
>
>  static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
>
> ---
> base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
> change-id: 20240305-anx7625-fe16d3a9d37d
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
