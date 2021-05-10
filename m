Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204333792B4
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 17:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AB46E4AB;
	Mon, 10 May 2021 15:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125D6E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 15:29:35 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso14795608ote.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k95ih2ffkgkY95e2EU15G37daHl01gPBVHAFJpuGyaU=;
 b=I0xcw5/NbuXhmMGTGJqW5AfWBvxK+ZLxU4yUrsF9rj6gbcPt2vL+1fvp6yG2h2Zkkd
 aI7YmaYFYV1zFJbLmkkASsXsuCvTuk36P8gClCNgwHzj/Y3bd87MNgMtD+GOEnL1cp1Y
 fycaJN4zL/UaNrRRszAWG4ayukd8Okjbz+aopRocjTk11NPoc65Am6mZNhjD+Q1VoyHD
 RY0JfWmWCjlzcgd911ynNvqlMZ3fgA/rZ9KYQCFVVP4OEqZHhWSXwtPMY6r+TBENR4yj
 Dw7R0H5lSoK34lk4aQUl+EqpB3IvbhbSgP3cReX39Np1wt1lknwkC+zR07WBWzfXg6uu
 X+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k95ih2ffkgkY95e2EU15G37daHl01gPBVHAFJpuGyaU=;
 b=AfhS3lOYHA8kKVPQHewdP+UBp2ANcepi+uar+TC+rv6e2laMP8nxRtvuZ+KScvnWRG
 ihozjstHsCpwrhIluSnfD4UYMEGduzlHQ322TWF8vHTfpvYOGPuW3gtJs+Txam92PkhD
 L13MTAmO5RfLo2RsRHUwiZADK1uTms1a0u1OJHOKbQe7b2AGmsNhj9W6k8DLiErYWJwo
 arMPQtIUAc07iqubOK6YHfcRpGXXKr22MZit7S8HAtXF3wEs1a6pXkM3omwZ1V7sasC6
 ms+EJ5BJRGHyXmL6l+xvMCOvKulAHal5TnyPo4zpGXP/bn5jeq6zw/99QkeRJ6u71xtn
 tijA==
X-Gm-Message-State: AOAM5321KmP+8vOiNP+UAZaea2zPLrw3E62W/eyTMGQ1ucduywreaGP6
 YTD7m08F10pGITouJHZNne97gm7RQk1XeGa0cE0=
X-Google-Smtp-Source: ABdhPJwpAw9IQWW+EYi8SurGMFtmT59DlJ0+ItGo0bVIXaLZ8jcYWjXnpGTwFBasaje7NKAGgPyfra8EWfiM36NbuIM=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5912009otl.132.1620660574438; 
 Mon, 10 May 2021 08:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210510145218.10322-1-tzimmermann@suse.de>
In-Reply-To: <20210510145218.10322-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 11:29:23 -0400
Message-ID: <CADnq5_PWgG0PJxkNMG=xN7R=TD+S5gXVHb7sGSAPRoTxjKhn5A@mail.gmail.com>
Subject: Re: [PATCH] drm: Include <asm/agp.h> iff CONFIG_AGP is set
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Jason Yan <yanaijie@huawei.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Platforms without AGP don't provide the AGP header. Only include it
> if CONFIG_AGP is set.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.
> Fixes: 04dfe19a5ed6 ("drm: Mark AGP implementation and ioctls as legacy")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Jason Yan <yanaijie@huawei.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_agpsupport.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsu=
pport.c
> index 07c10443770e..a4ad6fd13abc 100644
> --- a/drivers/gpu/drm/drm_agpsupport.c
> +++ b/drivers/gpu/drm/drm_agpsupport.c
> @@ -35,7 +35,9 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>
> +#if IS_ENABLED(CONFIG_AGP)
>  #include <asm/agp.h>
> +#endif
>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> --
> 2.31.1
>
