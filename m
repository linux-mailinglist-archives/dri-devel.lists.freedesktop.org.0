Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70C790277
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 21:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C53210E203;
	Fri,  1 Sep 2023 19:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6B710E203;
 Fri,  1 Sep 2023 19:26:14 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a812843f0fso1392278b6e.2; 
 Fri, 01 Sep 2023 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693596373; x=1694201173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHGVVmsyhgtP/USdgG81z47GsFqLU0aEkIKpPuhjrVY=;
 b=MdMQtcntm2Y282tu9zLluIOSFI+ed/aIR9A7HjzHdxzMP1VcpBSlRrv+YA8nTTOf4X
 EaxvmF4O5+xQ6AOQBY0MDNqoOyTliOXaj+pxX6IwSrff2JuDnwKfu+BJjx90nU/MGmsf
 mMPbbFTk1IwhnXXftZi8infMKasb/Q7lg8DnYY459DdyDtDmsL/Bk8gZsS3WUMlNBmsV
 cQG/JIq5xJN5Yrb3pwbuSWeFtMHen3M5A/iUotZyp46cvE2unbIEcptvv4J3U+qrpolt
 qgtmjape/aIV7TdqnFPoQ3LkEAv+xhhvwaHm5BzhJn2G33lyLp1PIv4caxrAxDQNwC3k
 lDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693596373; x=1694201173;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHGVVmsyhgtP/USdgG81z47GsFqLU0aEkIKpPuhjrVY=;
 b=USioDHAHvmO1Nlwsn4UDG/6rq2W0ZRfxiFMZdDFVAZvM07jGDz1HSXzMNd0ZUEN0k+
 rc1QT6ANqKhuVb5CL40pFtBWhEMV3zXhqEr0QdNbra0S1LlcsgKpYmFSRNCjes1Ar678
 qa21uZ2oJKuUoLdvb14DwIu4DebIhQm19LJ+9eMKazjEtPlbyJUE4mFeszs1ZTOp0YlE
 p+e/VZrB3tqXkr7mBYuu2XnVw26a9i/xjUj1T5WsxU1tuQurnKbfDuru2Kj21x1ADOXA
 7htWM9Vp2vLmk3Xrjl08vkvbz3SJh5gErhAQQB//J207vPmNR8VN8nnQ/8AqYE34asM0
 lXCw==
X-Gm-Message-State: AOJu0YxUQgWCHXV0VpqMSwlHi9RNNbU4wBPMSd60cGc9xtX3Z4N+nLHJ
 GinLFD7dVuUdaBCMS0b6kQI134dLmydfEJoLaAjEPOV9Llw=
X-Google-Smtp-Source: AGHT+IELT//9p/zVUwrBfz6CRP8TgEMaXjDDvWWTOQPl8DxQAO2NTl05+hQEulowAVOhrR/GPBiiH7TKQgYbmDX+PAM=
X-Received: by 2002:a05:6808:14d1:b0:3a4:6691:9340 with SMTP id
 f17-20020a05680814d100b003a466919340mr4212325oiw.41.1693596373238; Fri, 01
 Sep 2023 12:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692884619.git.jani.nikula@intel.com>
 <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
In-Reply-To: <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Sep 2023 15:26:01 -0400
Message-ID: <CADnq5_OVm2HsLwDuDEU4npLJiZdTUL+_XnbqaoDS50a1LRWXfA@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/edid: add drm_edid_is_digital()
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:46=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Checking edid->input & DRM_EDID_INPUT_DIGITAL is common enough to
> deserve a helper that also lets us abstract the raw EDID a bit better.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Seems to be a few additional users of this that could be converted:

drivers/gpu/drm/i915/display/intel_sdvo.c:        if (edid &&
edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/i915/display/intel_sdvo.c:    bool monitor_is_digital
=3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/i915/display/intel_crt.c:        bool is_digital =3D
edid->input & DRM_EDID_INPUT_DIGITAL;
drivers/gpu/drm/i915/display/intel_hdmi.c:    if (edid && edid->input
& DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/gma500/psb_intel_sdvo.c:        if (edid->input &
DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/gma500/psb_intel_sdvo.c:            if (edid->input &
DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/gma500/psb_intel_sdvo.c:        bool
monitor_is_digital =3D !!(edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/gma500/psb_intel_sdvo.c:    if (edid !=3D NULL &&
edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/gma500/cdv_intel_hdmi.c:        if (edid->input &
DRM_EDID_INPUT_DIGITAL) {
drivers/gpu/drm/display/drm_dp_helper.c:        edid->input &
DRM_EDID_INPUT_DIGITAL &&
drivers/gpu/drm/nouveau/nouveau_connector.c:            if
(nv_connector->edid->input & DRM_EDID_INPUT_DIGITAL)
drivers/gpu/drm/radeon/radeon_connectors.c:
!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/radeon/radeon_connectors.c:
!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c:
!!(amdgpu_connector->edid->input & DRM_EDID_INPUT_DIGITAL);




> ---
>  drivers/gpu/drm/drm_edid.c | 17 +++++++++++++++--
>  include/drm/drm_edid.h     |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 340da8257b51..1dbb15439468 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3110,7 +3110,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_=
edid)
>                 return ret;
>         }
>
> -       return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) !=3D 0);
> +       return drm_edid_is_digital(drm_edid);
>  }
>
>  static void
> @@ -6519,7 +6519,7 @@ static void update_display_info(struct drm_connecto=
r *connector,
>         if (edid->revision < 3)
>                 goto out;
>
> -       if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
> +       if (!drm_edid_is_digital(drm_edid))
>                 goto out;
>
>         info->color_formats |=3D DRM_COLOR_FORMAT_RGB444;
> @@ -7335,3 +7335,16 @@ static void _drm_update_tile_info(struct drm_conne=
ctor *connector,
>                 connector->tile_group =3D NULL;
>         }
>  }
> +
> +/**
> + * drm_edid_is_digital - is digital?
> + * @drm_edid: The EDID
> + *
> + * Return true if input is digital.
> + */
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid)
> +{
> +       return drm_edid && drm_edid->edid &&
> +               drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
> +}
> +EXPORT_SYMBOL(drm_edid_is_digital);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 48e93f909ef6..882d2638708e 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -612,6 +612,7 @@ const struct drm_edid *drm_edid_read_switcheroo(struc=
t drm_connector *connector,
>  int drm_edid_connector_update(struct drm_connector *connector,
>                               const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
> +bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>                                   int ext_id, int *ext_index);
> --
> 2.39.2
>
