Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68DD874821
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250E10E2E8;
	Thu,  7 Mar 2024 06:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SSeprdVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD6110E2E8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 06:24:39 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso5696391fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 22:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709792677; x=1710397477;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJJx6XhDRfgPt/8OwU1WYfWX5sGRnhgvN/CrlZDuL1I=;
 b=SSeprdVXByIX919oe1mZ3FovJ5wWNTSqyn4nvyRgh/+YNz42whSKakFVUVcCxs09w4
 3nwbb2QtvIy2iPAi1OBPkxPUy5bhQy8FOg9L5AzSdK1scHWtoeDbB4GOWVBOJ5GY4CE/
 zOGiwcjhZ+1k7mNu2OwZMz9t+NqKsDv9NfkRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709792677; x=1710397477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJJx6XhDRfgPt/8OwU1WYfWX5sGRnhgvN/CrlZDuL1I=;
 b=GUhsEki/aHVyntHFkAny6nISilS4SkgQpMkE6oZcfT063JgcX2Lv7KVeEaHMehlCPn
 hdJltlicwXvBcR6J79HteMH4QlUruK3b+nLH39MHFXw/vDyZsO5PDVo4BBq7SQSw0ihe
 7lRhChbgKGYShAxBaDglYnyREVR2OTe28VAMj9/MwKdIjRAhJE6VIC5bBnG4cU08d0yo
 6WuZCkU16ceZnI82ko6NqKI6HojRg8EMHsTfquggZH3Hi/4QFo/IoFSwSitKlIvbXfdp
 k5N28+fUMf0BF8RW0OvLvKFD50v6ViWx+wl588fnjUQ/iTrfzM2S74Sk/8aAC6VEHBuA
 0m4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtAy9BzZU4qgoYwED5NQSnbt/5cOoKsZgjW3t5zsibCuy7gmUAt/Pqzw24fTqGqNpWanKVumTSSY0uK5N+N50gJ4jYszcoWQPo9If3aGAu
X-Gm-Message-State: AOJu0YxHUp6S+kXSdSWVGIu50NnCcDlgq/ZN+kEc/7iFao3jiZKu/jCP
 0aSG9iTsRUfj/LPwznisAGQ/2GHYuQ0af1DBfxfbyeKr0Z73Ym01hFnPL9UK8O+lEb46TvL7VGH
 DDLeCTFsNfJfownFZV+Wk7jBD2NGMrbIHZV60
X-Google-Smtp-Source: AGHT+IG9bL7mKM9ZtwISH72C9rWzwjWBxEKgo4y0KjtnQ28PVSCnbnBN4WWhE3QRZh9KOHDhdEgcunbfDEypG1Rp+yk=
X-Received: by 2002:a05:651c:198c:b0:2d3:ffa0:8782 with SMTP id
 bx12-20020a05651c198c00b002d3ffa08782mr718856ljb.43.1709792676971; Wed, 06
 Mar 2024 22:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20240306-anx7625-v3-1-9034263bf530@chromium.org>
In-Reply-To: <20240306-anx7625-v3-1-9034263bf530@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 7 Mar 2024 14:24:25 +0800
Message-ID: <CAGXv+5GWjChTxLaTXiq5JnwFmWu=hg6Gy6+qjYxofXqVXxETPw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: anx7625: Update audio status while
 detecting
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

On Wed, Mar 6, 2024 at 5:59=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> Previously, the audio status was not updated during detection, leading
> to a persistent audio despite hot plugging events. To resolve this
> issue, update the audio status during detection.
>
> Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
> Changes in v3:
> - Add Fixes tag.
> - Link to v2: https://lore.kernel.org/r/20240306-anx7625-v2-1-7138e00b25b=
f@chromium.org
>
> Changes in v2:
> - Add a space after the colons in the subject line.
> - Link to v1: https://lore.kernel.org/r/20240305-anx7625-v1-1-83ed3ccfa64=
c@chromium.org
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
