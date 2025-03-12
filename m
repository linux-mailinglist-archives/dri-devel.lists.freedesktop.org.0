Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DCA5DC5C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5A10E138;
	Wed, 12 Mar 2025 12:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DqsOzadR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C6310E138
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:10:45 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3fa5d864b7fso864009b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741781445; x=1742386245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6al4fkmYBSj5fDWDWHaUc3WTalLIMZbik+IUlLaCEjM=;
 b=DqsOzadRVpuJqs5HHQefy9Ix8RWihWl9kDHyFlypp4gKWMYL/+TDf98TbrcpG5y3UT
 qg48eZdSu2eKMlLNcj+mbfr7JWnpqP0t87EbjNDjCzQshEcO4JERPuDjmhAHIIv1kzDM
 q8DHLh5ZUnWcQol0/jQXxgrQBOQg2855ByS2t9KRNNmqoDuuVAVhcpdiijZ83Zq8ZdrC
 czLVXHt/yCj2kruaxfuOzEriNKKaXE1cz0TKK4T/GcRaAvZN4USIdh/LN80xtcIQm+0e
 p8vPK61BDzvFLoQroEKIcdfWp3h18ymeEWKSC6q3kQiXJVaRGrRVS3T/8MeaojjbUinm
 H/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741781445; x=1742386245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6al4fkmYBSj5fDWDWHaUc3WTalLIMZbik+IUlLaCEjM=;
 b=Qwp1Wg4CP7UXluiofDSjbTfDdCk8qC8dfjGZLpDHIS2QjlkeodDVBDS59Gyn46j+6J
 TNWJoueAVk1ezzjR4oR79by0iDBiUr7zYJ5dgGQPVKDSn8i9B1pHCpcCP9dkYmMe8+xf
 TwldcSY12EawnDnD2wiEuf2kwn8eHIQqQhhqT2eC8byu3C7Dg9pXFGNoxffirHwVma1Y
 jANMAinlrflz6RVCj/ZtuIaZ/Qn3ys8v4hiHn/ULBINQQrlZF1eda/NROUcqPL7yVFvT
 449uID/uQdKzvGCqDHFqILWNMeAP6dqcElMI3K+CsNfjGff7zT771vQVaGsi5h5IHMzO
 Br3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJCA1uoxI+eud/9BLyolnoa9r/F1CwNBaTjylNjD9Djrvt2ft02VOpOEhP2iOLei1UPsZz4Q90rOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDnWnMUJdjbwOSXpaznH72ZWSPeSes+CefPvzSqYo0v7Q3UWuM
 YNjFdKITv1+INJfssOcShxZZ3dZFQho9OILZ11pmG5HppKb2q4Xegz54344KgVr0xGc/6YThKZ8
 nhNLpqF6rztxAGtKQw2KqJPpiKR4=
X-Gm-Gg: ASbGnctqJIuJNqpx5hzJpoFLnjKOUXqESArsW03V44Sg93V0xZBuhbULM4cMy/Yd25x
 XSpziPIqk9JXD2MW3JS4wmFVUMkNPBgUJNCnVZ3Ub9Kypx5VpD/l/YB0LGv0xKlILBuDzJRf2Ab
 DqGXXzrSte4zPiP79RcpMGKY4Q
X-Google-Smtp-Source: AGHT+IHiXXfgrtcNBgG5mFtYpI2d+AkU2roVvNBcZ173F0AGVC+0JF0D1d41ffyOMIChnpevZ/KX3WvnEqFj/elZ6D4=
X-Received: by 2002:a05:6808:250f:b0:3f9:43dd:a054 with SMTP id
 5614622812f47-3f943ddb14amr6086916b6e.34.1741781445154; Wed, 12 Mar 2025
 05:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250303145604.62962-1-tzimmermann@suse.de>
 <20250303145604.62962-4-tzimmermann@suse.de>
In-Reply-To: <20250303145604.62962-4-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 12 Mar 2025 13:10:34 +0100
X-Gm-Features: AQ5f1Jp1mmn23aCgwrlcH_j2oLDV0G-s4lPE-7eiZx8O2o8g69Dv3Qb6vJLmW8U
Message-ID: <CAMeQTsbZRDssvoWMZ9QFnLb8_x=S0Kh6KMBKXfh2RfVisjSc3Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/probe-helper: Do not fail from
 drmm_kms_helper_poll_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, simona@ffwll.ch, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 sean@poorly.run, dri-devel@lists.freedesktop.org
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

On Mon, Mar 3, 2025 at 4:24=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Failing to set up connector polling is not significant enough to
> fail device probing. Print a warning and return nothing from the
> init helper.
>
> This only affects the managed init function. The unmanaged init
> already never fails with an error.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/ast/ast_mode.c     |  5 +----
>  drivers/gpu/drm/drm_probe_helper.c | 11 ++++++-----
>  include/drm/drm_probe_helper.h     |  2 +-
>  3 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mod=
e.c
> index c3b950675485..4f2543730b97 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1018,10 +1018,7 @@ int ast_mode_config_init(struct ast_device *ast)
>                 return ret;
>
>         drm_mode_config_reset(dev);
> -
> -       ret =3D drmm_kms_helper_poll_init(dev);
> -       if (ret)
> -               return ret;
> +       drmm_kms_helper_poll_init(dev);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index 7ba16323e7c2..6b3541159c0f 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -958,15 +958,16 @@ static void drm_kms_helper_poll_init_release(struct=
 drm_device *dev, void *res)
>   * cleaned up when the DRM device goes away.
>   *
>   * See drm_kms_helper_poll_init() for more information.
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise.
>   */
> -int drmm_kms_helper_poll_init(struct drm_device *dev)
> +void drmm_kms_helper_poll_init(struct drm_device *dev)
>  {
> +       int ret;
> +
>         drm_kms_helper_poll_init(dev);
>
> -       return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_rel=
ease, dev);
> +       ret =3D drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_re=
lease, dev);
> +       if (ret)
> +               drm_warn(dev, "Connector status will not be updated, erro=
r %d\n", ret);
>  }
>  EXPORT_SYMBOL(drmm_kms_helper_poll_init);
>
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helpe=
r.h
> index d6ce7b218b77..840ae5f798c2 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -17,7 +17,7 @@ int drm_helper_probe_detect(struct drm_connector *conne=
ctor,
>                             struct drm_modeset_acquire_ctx *ctx,
>                             bool force);
>
> -int drmm_kms_helper_poll_init(struct drm_device *dev);
> +void drmm_kms_helper_poll_init(struct drm_device *dev);
>  void drm_kms_helper_poll_init(struct drm_device *dev);
>  void drm_kms_helper_poll_fini(struct drm_device *dev);
>  bool drm_helper_hpd_irq_event(struct drm_device *dev);
> --
> 2.48.1
>
