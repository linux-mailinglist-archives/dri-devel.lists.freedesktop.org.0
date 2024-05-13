Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230548C459D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542A10E45A;
	Mon, 13 May 2024 17:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E+zm6he4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D7210E45A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 389AD60ED4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FDEC4AF07
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715619910;
 bh=fKLYgNDA/digYnWNRW08cOMmokW4r4hgkCbjsWRsSAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E+zm6he4xQXh9LDp6KAFhACNhDdFTFDmxRna7mTl604COroq92WHD07nd+3vQ6IqV
 F3DdvOaMTNDpPFd7QiSExPopY2+UF3EMzr1JDGzJSb3Nid6z7tQPV56sDw69e+/J7b
 a3efPdg30KewvGbz7Pm1F4QRZO4vyNG5e5LF3UXYfoLiEMBbZR3qhs67beza9jO0Xd
 09darohG1ERfRz2rb0i3nE9QuteIOKT7EE17rqneUHwxPRN3hLGQJzg38BDhDHzE3p
 4MfVkTMnmKTyEOaZ03tr8kAqRENtHh+AHgqZrnIMAwT2rE/qLLWQycncgtALcLP6hF
 mgQfsHUB7vw9w==
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-23f0d54c5ffso3111032fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:05:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSI1CouLpOCb77ETTFWVJZ5ZtCDH/5ef7+ErgbLJ52ownEH+qo
 mawZSP3JuguWW8fRH8dIIMkX3CroBxqtB5LMBPz6CSor+v79K9e4/QsGbtVY+SbfGjKZXHMEYKD
 D1plAj06hZKLaD6PZSqjC0FTQ2qMO/pcH4ie9Pw==
X-Google-Smtp-Source: AGHT+IFPq0L6Gz1XOu/lJcqmGeVzwTvh6ytgxzHGtXvox7Hn85LwnpXujCKfIMo+2NgPIgTuRCoEOLeS6nwc8rfpqNQ=
X-Received: by 2002:a05:6870:ac21:b0:23d:697:e8fd with SMTP id
 586e51a60fabf-24172f6b5b4mr12903657fac.40.1715619907211; Mon, 13 May 2024
 10:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715347488.git.jani.nikula@intel.com>
 <24536f4a1a12af7b43ba86e9761dfeef179b72df.1715347488.git.jani.nikula@intel.com>
In-Reply-To: <24536f4a1a12af7b43ba86e9761dfeef179b72df.1715347488.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:04:56 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5YZf3ZiixnfcntzJN8YfmQzXPzbYssCkneLwiWz=febA@mail.gmail.com>
Message-ID: <CAN6tsi5YZf3ZiixnfcntzJN8YfmQzXPzbYssCkneLwiWz=febA@mail.gmail.com>
Subject: Re: [RESEND 5/6] drm/bochs: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>, 
 virtualization@lists.linux.dev
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

On Fri, May 10, 2024 at 3:27=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Prefer struct drm_edid based functions over struct edid.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux.dev
> ---
>  drivers/gpu/drm/tiny/bochs.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 2d7ad808cc0e..d12d6e0bf3df 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -85,7 +85,7 @@ struct bochs_device {
>         u16 yres_virtual;
>         u32 stride;
>         u32 bpp;
> -       struct edid *edid;
> +       const struct drm_edid *drm_edid;
>
>         /* drm */
>         struct drm_device *dev;
> @@ -199,10 +199,10 @@ static int bochs_hw_load_edid(struct bochs_device *=
bochs)
>         if (drm_edid_header_is_valid(header) !=3D 8)
>                 return -1;
>
> -       kfree(bochs->edid);
> -       bochs->edid =3D drm_do_get_edid(&bochs->connector,
> -                                     bochs_get_edid_block, bochs);
> -       if (bochs->edid =3D=3D NULL)
> +       drm_edid_free(bochs->drm_edid);
> +       bochs->drm_edid =3D drm_edid_read_custom(&bochs->connector,
> +                                              bochs_get_edid_block, boch=
s);
> +       if (bochs->drm_edid =3D=3D NULL)
>                 return -1;
>
>         return 0;
> @@ -303,7 +303,7 @@ static void bochs_hw_fini(struct drm_device *dev)
>         if (bochs->fb_map)
>                 iounmap(bochs->fb_map);
>         pci_release_regions(to_pci_dev(dev->dev));
> -       kfree(bochs->edid);
> +       drm_edid_free(bochs->drm_edid);
>  }
>
>  static void bochs_hw_blank(struct bochs_device *bochs, bool blank)
> @@ -471,12 +471,9 @@ static const struct drm_simple_display_pipe_funcs bo=
chs_pipe_funcs =3D {
>
>  static int bochs_connector_get_modes(struct drm_connector *connector)
>  {
> -       struct bochs_device *bochs =3D
> -               container_of(connector, struct bochs_device, connector);
> -       int count =3D 0;
> +       int count;
>
> -       if (bochs->edid)
> -               count =3D drm_add_edid_modes(connector, bochs->edid);
> +       count =3D drm_edid_connector_add_modes(connector);
>
>         if (!count) {
>                 count =3D drm_add_modes_noedid(connector, 8192, 8192);
> @@ -507,10 +504,10 @@ static void bochs_connector_init(struct drm_device =
*dev)
>         drm_connector_helper_add(connector, &bochs_connector_connector_he=
lper_funcs);
>
>         bochs_hw_load_edid(bochs);
> -       if (bochs->edid) {
> +       if (bochs->drm_edid) {
>                 DRM_INFO("Found EDID data blob.\n");
>                 drm_connector_attach_edid_property(connector);
> -               drm_connector_update_edid_property(connector, bochs->edid=
);
> +               drm_edid_connector_update(&bochs->connector, bochs->drm_e=
did);
>         }
>  }
>
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
