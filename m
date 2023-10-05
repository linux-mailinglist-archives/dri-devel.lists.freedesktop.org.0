Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912D7BAEF4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 00:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C050A10E4A0;
	Thu,  5 Oct 2023 22:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5353F10E4A0;
 Thu,  5 Oct 2023 22:49:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-533d9925094so2674808a12.2; 
 Thu, 05 Oct 2023 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696546183; x=1697150983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruHF2qY6fIMsnHXSXu/O5UBGCOEh6ZYhOkBWuKb5maU=;
 b=BDXwnOP9ITJf9dCGerRwxhZaiMyUYoS5+hSYr73Ib7F7OF6rwvSvjU51C2ROaT1HMr
 auciggcE1dAcFKDylNrYOdarU7h8mKDmJkfOeC4mMUpTWYIe1ajDXl0J0bLO8r52Iiq9
 qlnhHjgOi5T11QiErIUcxdro2S3y5AMrPpYwERyGh1PcsH7nW/7bgJYS9wOwlsYVbKgT
 Dam4EEoIQGaYD/gkxmGqdH53WEkNZtqxeJ89fIXD5ozi2KiZnP3jrqgY/JkdCGiU3M4M
 2/hmte++K4GaJ1/hrda5Tfsm9bVuE1UYDemSySLgoxflrGMiZWdWS8PciafP7Ll0DLM/
 9xPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696546183; x=1697150983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ruHF2qY6fIMsnHXSXu/O5UBGCOEh6ZYhOkBWuKb5maU=;
 b=mJTYanhbUCV0Pq95NlK07dG5BQN6h27FeDNFD6TYuJ1NK3cA7OjQKRmUzBpwFeCu15
 IB4Qx5aAbIaGVijPxIblOozq4YGcNSB4xUASoPYfVwIUslHO/UHCBpC02v1XRseHSIkA
 v0QGQsUALqF5wrkL89im5lJFQ+C6iFe3y8FoRQs+Cvc+blPTxJJu9wJ1vcE3dbajua7M
 F1ZZgm3QDxQn9nNHqfgHOz8YujN06lwJHwTm/VjYSY5cWVLPfKp3kRqQqmm2bZN2YBgW
 TVk67S1DisahWPDfYogqHWp2FBaZxRJm1jNMV80EtdVXcqCV5A4WmuhT56x6mo6IhJ2w
 m7WA==
X-Gm-Message-State: AOJu0Yzr9FBtJ+vl4XKsL09RZfPLgj5v/3uVsHzKd17mO3bSvLDEZWlh
 QjpqX/vjpJZoNvVFbXrT6jct2pk77jpdt/JXa74=
X-Google-Smtp-Source: AGHT+IEaPo1RQwkwbado7ahDJti9JqEe1+NqsIklGIQLHN+kXVQ7cUg7odehdVdsbOarTJ1lMbCsCv9jOV+26I2ZaJw=
X-Received: by 2002:aa7:c991:0:b0:536:e5f7:b329 with SMTP id
 c17-20020aa7c991000000b00536e5f7b329mr6086237edt.33.1696546183113; Thu, 05
 Oct 2023 15:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
 <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908030521.236309-2-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 5 Oct 2023 15:49:31 -0700
Message-ID: <CAF6AEGvThK5L-UTAsHwH1_xH5R0zNT+dL6DHvBQUYm3hq9uBdQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/atomic: add private obj state to state dump
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 7, 2023 at 8:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The drm_atomic_print_new_state() already prints private object state via
> drm_atomic_private_obj_print_state(). Add private object state dumping
> to __drm_state_dump(), so that it is also included into drm_state_dump()
> output and into debugfs/dri/N/state file.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_atomic.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index c277b198fa3f..9543e284dc15 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev=
, struct drm_printer *p,
>         struct drm_crtc *crtc;
>         struct drm_connector *connector;
>         struct drm_connector_list_iter conn_iter;
> +       struct drm_private_obj *obj;
>
>         if (!drm_drv_uses_atomic_modeset(dev))
>                 return;
> @@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *de=
v, struct drm_printer *p,
>         if (take_locks)
>                 drm_modeset_unlock(&dev->mode_config.connection_mutex);
>         drm_connector_list_iter_end(&conn_iter);
> +
> +       list_for_each_entry(obj, &config->privobj_list, head) {
> +               if (take_locks)
> +                       drm_modeset_lock(&obj->lock, NULL);
> +               drm_atomic_private_obj_print_state(p, obj->state);
> +               if (take_locks)
> +                       drm_modeset_unlock(&obj->lock);
> +       }
>  }
>
>  /**
> --
> 2.39.2
>
