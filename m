Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854D6245C8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B31A10E705;
	Thu, 10 Nov 2022 15:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023A510E705;
 Thu, 10 Nov 2022 15:27:12 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso1328104otn.0; 
 Thu, 10 Nov 2022 07:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1pst4mjXkHPDehzhUrgugj0c0D8wqbX/pL++4dcio4=;
 b=C4hCu+oyaR7oq86pg7EbrlNcCfKh9uaM7ENLzlZvmsOIP7UyUC+9DMfuSouwFPZViB
 iFi0ZGBMT/r2ZaElOPmxxtNEdX3uBP5wAyuN09zjKBV30WgOvM/4owhKabJLJNYgdVre
 Qqpv8m3BsFkw9RV+pKa3wWea0GwcUeG0eUEgu3iSWLI2Rz+h7lyZ+UewGf/wxotPh1gi
 oNwrIS8AE9WONetSKIgGoMpOwscdGFkBFdWQc27QtrS4qJY6rqqePZ1gH3Ow1xLUWwpL
 serC+K7HnALxF2rP+x1r6jYoZq85+n8oqWc8E4Ffh169g0nXTSvS0VRDZXQWPF/b4nG6
 Jc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1pst4mjXkHPDehzhUrgugj0c0D8wqbX/pL++4dcio4=;
 b=3aLqPFp5oZnr5WjzOxy5iv1N6xLY3+UxY92BH2ruHiCaPWvoiMxzZ7LaqMhZXLtsTk
 QFNLR4rYfhMpkw+xudfXRxF6T0QZtL/Tug2FyRn44EivfqXiw4tgsGx3GPOLdrgC70Q3
 y5p4mu+JXY9LiK9dwsdcLLXH8OURwYWWTVXFTnz5A/UlV9ltaHh/+h/3ARgEVlVtrVOv
 yXGuSnR+kfqPT8M/ZXmThdIF6ngE8uFv5YvVbsLxkSopIMKpmh9/XGABM4fWp+IyBmHF
 LjMiS4syaa6q94mWugRMcLh4gZ6uOSdp4sDB7gUKUIIpy7YPFUJ9M+KOWD9Yxg+7jQkR
 6Idw==
X-Gm-Message-State: ACrzQf2tDiB3a15bfR/nw6c9QvZFhA97Xb5bIRo0uNC2jAHF2RoCC2tI
 Aa4rtSZDvu+OJyI0rv+ApJ2HzVtvhdAYqUh5P/c=
X-Google-Smtp-Source: AMsMyM6aBovoqLR7eDay9ReJfMc99bftGgsZq6bsZnvuTXGSrrhc7nPuobDSkmczqL08cDkwG5wybq+nxUiLr/ITkKc=
X-Received: by 2002:a9d:6119:0:b0:66c:92a4:450d with SMTP id
 i25-20020a9d6119000000b0066c92a4450dmr14945905otj.123.1668094031971; Thu, 10
 Nov 2022 07:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
 <20221107192545.9896-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20221107192545.9896-2-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 10:27:00 -0500
Message-ID: <CADnq5_NTOocMSkz=3BCbxjWQn1nFj7wUzwRaAHxT1izC7GOh8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm/amdgpu: Use drm_mode_init() for on-stack modes
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 2:26 PM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
>
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M =3D E;
> + struct drm_display_mode M;
>
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when !=3D S
> + drm_mode_init(&M, &E);
> +
> S1
>
> @@
> expression decl.E;
> @@
> - &*E
> + E
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d9940a3c64dd..7fa4b61bc5bf 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5685,7 +5685,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *=
aconnector,
>         const struct drm_connector_state *con_state =3D
>                 dm_state ? &dm_state->base : NULL;
>         struct dc_stream_state *stream =3D NULL;
> -       struct drm_display_mode mode =3D *drm_mode;
> +       struct drm_display_mode mode;
>         struct drm_display_mode saved_mode;
>         struct drm_display_mode *freesync_mode =3D NULL;
>         bool native_mode_found =3D false;
> @@ -5699,6 +5699,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *=
aconnector,
>
>         struct dc_sink *sink =3D NULL;
>
> +       drm_mode_init(&mode, drm_mode);
>         memset(&saved_mode, 0, sizeof(saved_mode));
>
>         if (aconnector =3D=3D NULL) {
> --
> 2.37.4
>
