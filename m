Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6086A503
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465F410E9BF;
	Wed, 28 Feb 2024 01:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kjf9YQBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A810E9BF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:28:32 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e4a5ee63f4so1108358a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709083712; x=1709688512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TG9LRH7eFEOhXweP6BfJavoKE1KflH590lEzMtnAQb4=;
 b=kjf9YQBZMZxwyFOhC1xrqBIrPUP+Yq35UH9tB0d/qdxDt+Bg8ZAl/K7RVTBD3xXjzj
 znMGfFps0B20IIar5GjNxWgzyR8UmBcNWxghgYxG5gY4IZKWcBXK35BYlNQo7WCix2w7
 TcoYWE8Izupb6fGa/O5l5lx5bqso9IBKnyh/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709083712; x=1709688512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TG9LRH7eFEOhXweP6BfJavoKE1KflH590lEzMtnAQb4=;
 b=EpvkFqNW4R90HMsrBEwMKfn2ngLkgLCrH+sZrzIt2PLD5EsZGO0IJLEwLkV3wZlcg/
 VPHJM1ypzt8ug9SzRd4LsHi+FEGJaM8kYz42ffmbkOGu/Sysga749xsRMLlyDRWR5gAO
 8EVJcDxjM58sftwkcKAxQbBfSa6O8imbpPNUiBjlouQKPa4jL9m6K4yICShbqd5FKcZ6
 tL23sEc/bSnU+Ms5Zn+xkbZKVC8QjFUPrarDgdIswXqlHCnJfk1KMqz9Ym5KnBthGZoQ
 SXIKoJQ1tVIjwTqD+FNGjBU2eVowp083BM8ABIfsV7RtiVUwYji58cgrLlbVReL2RxCW
 LiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWen3OTMKyhAv5QS2Yn5JXDp4c+H64pLLvKXokR53PRGPU5oTT7GqKPXR9BBNy1odue+Ogyi86RS7EZ4vTg+UFUB5UrGN5dICA0e5VTYTSs
X-Gm-Message-State: AOJu0YzXNPDOVMgup4ynGEb+oARXZOHhllRNn2ZaLDwwK1q+q7BGEzpf
 h3+4uVkEoSRPpdLi9mJolnsAFg/23KBvomBOX83zWglqM03ahs4qIZ+jyf5Nk20/ATB/cUcXVgh
 NcO8whuL1V2FQAzuOTPQ7Qa0mZGPdfDIM0yj7
X-Google-Smtp-Source: AGHT+IG1dEAkf5yEFaKk9SWNj5ZtLwHK0Fg2SkuBw6fFTV//VPKF/d0SiFkgQOj+YmtOoPBTxv5ug7sL0HVECZSr2jM=
X-Received: by 2002:a05:6830:11d2:b0:6e4:6305:367b with SMTP id
 v18-20020a05683011d200b006e46305367bmr13453954otq.30.1709083711928; Tue, 27
 Feb 2024 17:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-2-hsinyi@chromium.org>
In-Reply-To: <20240228011133.1238439-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 27 Feb 2024 17:28:06 -0800
Message-ID: <CAJMQK-h2RcZb_PmyYQxndBogY=dBiXMOBZJB=mXgwQb5Wm6ucg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm_edid: Support getting EDID through ddc without
 connector
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Some panels are interested in the EDID during early probe when connector
> is still unknown.
>
> Add a function drm_get_edid_no_connector() to get edid without connector.
> No functional change for existing usage.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> add a function to return the entire edid without updating connector.
> ---
>  drivers/gpu/drm/drm_edid.c | 45 ++++++++++++++++++++++++++++----------
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 1ad94473e400..15b97c8ed993 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2364,7 +2364,7 @@ static struct edid *_drm_do_get_edid(struct drm_con=
nector *connector,
>         struct edid *edid, *new;
>         size_t alloc_size =3D EDID_LENGTH;
>
> -       override =3D drm_edid_override_get(connector);
> +       override =3D connector ? drm_edid_override_get(connector) : false=
;

typo: should be NULL here. I'll update in the next version with other comme=
nts.

>         if (override) {
>                 alloc_size =3D override->size;
>                 edid =3D kmemdup(override->edid, alloc_size, GFP_KERNEL);
> @@ -2385,18 +2385,20 @@ static struct edid *_drm_do_get_edid(struct drm_c=
onnector *connector,
>         if (status =3D=3D EDID_BLOCK_READ_FAIL)
>                 goto fail;
>
> -       /* FIXME: Clarify what a corrupt EDID actually means. */
> -       if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLOCK_VERSI=
ON)
> -               connector->edid_corrupt =3D false;
> -       else
> -               connector->edid_corrupt =3D true;
> +       if (connector) {
> +               /* FIXME: Clarify what a corrupt EDID actually means. */
> +               if (status =3D=3D EDID_BLOCK_OK || status =3D=3D EDID_BLO=
CK_VERSION)
> +                       connector->edid_corrupt =3D false;
> +               else
> +                       connector->edid_corrupt =3D true;
>
> -       if (!edid_block_status_valid(status, edid_block_tag(edid))) {
> -               if (status =3D=3D EDID_BLOCK_ZERO)
> -                       connector->null_edid_counter++;
> +               if (!edid_block_status_valid(status, edid_block_tag(edid)=
)) {
> +                       if (status =3D=3D EDID_BLOCK_ZERO)
> +                               connector->null_edid_counter++;
>
> -               connector_bad_edid(connector, edid, 1);
> -               goto fail;
> +                       connector_bad_edid(connector, edid, 1);
> +                       goto fail;
> +               }
>         }
>
>         if (!edid_extension_block_count(edid))
> @@ -2444,7 +2446,8 @@ static struct edid *_drm_do_get_edid(struct drm_con=
nector *connector,
>         }
>
>         if (invalid_blocks) {
> -               connector_bad_edid(connector, edid, num_blocks);
> +               if (connector)
> +                       connector_bad_edid(connector, edid, num_blocks);
>
>                 edid =3D edid_filter_invalid_blocks(edid, &alloc_size);
>         }
> @@ -2637,6 +2640,24 @@ struct edid *drm_get_edid(struct drm_connector *co=
nnector,
>  }
>  EXPORT_SYMBOL(drm_get_edid);
>
> +/**
> + * drm_get_edid_no_connector - get EDID data without updating connector =
status
> + * @adapter: I2C adapter to use for DDC
> + *
> + * Similar to drm_edid_read_ddc(), but not checking any connector status=
. Use
> + * this function to get EDID when connector is still unknown.
> + *
> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
> + */
> +struct edid *drm_get_edid_no_connector(struct i2c_adapter *adapter)
> +{
> +       if (!drm_probe_ddc(adapter))
> +               return NULL;
> +
> +       return _drm_do_get_edid(NULL, drm_do_probe_ddc_edid, adapter, NUL=
L);
> +}
> +EXPORT_SYMBOL(drm_get_edid_no_connector);
> +
>  /**
>   * drm_edid_read_custom - Read EDID data using given EDID block read fun=
ction
>   * @connector: Connector to use
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 70ae6c290bdc..80c9e32ff80e 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -565,6 +565,7 @@ struct edid *drm_do_get_edid(struct drm_connector *co=
nnector,
>         void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>                           struct i2c_adapter *adapter);
> +struct edid *drm_get_edid_no_connector(struct i2c_adapter *adapter);
>  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>                                      struct i2c_adapter *adapter);
> --
> 2.44.0.rc1.240.g4c46232300-goog
>
