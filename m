Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F769341FE6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEAD6EA2E;
	Fri, 19 Mar 2021 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB36EA31
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:43:55 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so4993158pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86LC+1JkNbbYNnfKum5G/BlJ9HpQquJ6GZDdITyjMEY=;
 b=ESqHg/Y6nunNSt2A+n9NWRNhz9fMlfBI4MSa8ZUCLsFHV6hBHTbyKTb5LvtUBy3sDl
 tZ3TZCOfAxuslM6hVBzvZBG+WDWr6+KKfr45IXsC++3CgBLssBEmOYJPoltIUCj5Ab5r
 Ps5BzO93U4v5ATBIff4UXI55yoi3tueb3M2Mxsxr8AalFKT0qmZjt0ytDLMrSuh+Xjv2
 nn1qSIhjlu63a0/GM1HyDQ0gsQjhbyl0d2JTYfEuiD0xDFDASfbE81sV/e6NUMEG69T/
 p4rrhKaWnvLHgogq2P8lT5x0kwhxjSmRELfZbJfWCaMnzgbK6aqmocai87gZbkTlRmnh
 tqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86LC+1JkNbbYNnfKum5G/BlJ9HpQquJ6GZDdITyjMEY=;
 b=TLLyXRI4TH0jLx4jj7eXM6joGodp5Ni9/LbYTvt+lfSUIm9uZ+AaOISDSPyDrnVLkp
 F3JADYveeZ7MEELoIUE3Rssm1a43X54p01vPJjW3zkEGJtwCByYCa1gqNxd09OlxGrm+
 mtBBHBwrMlXi0VIHOy2zvlJ6Hl+7Lm0QE4FomLN9P9ML9/CBdEzkoGrdFR/pIfchmazQ
 9Av5H7xKDvE2b5lURVcdI+vcsNgN4ID9IA6XN9BK6AzzpBhnZBFTaveobOIyDq3oV/7A
 Y0POlgKwVTtVcoZhLZ6krDeo/rkNG/DumvApgyLloMU59RSbJeEqQz0A6VGvJls6HYiQ
 zpMg==
X-Gm-Message-State: AOAM532vtqwoTc9OJqjoU1Yqoz1RiAeu4yHjIJXWAXrckgpZo1lHSM2c
 TclRCivK3oWRZPi8ofK6HhXp8Ak0YvjG/8H8S9yBnQ==
X-Google-Smtp-Source: ABdhPJxMIHdTlGCXNCULSxlRJJagvj2AatBYPGQF37Ua2ikdmUUVJ4WnoNWSgNo0fgfSZ+4tH2iCCodydlKkCHKtvhM=
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr10386254pjs.75.1616165035134; 
 Fri, 19 Mar 2021 07:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-12-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-12-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:43:44 +0100
Message-ID: <CAG3jFyvMb+ENOnM4Ug8Vkfk1uGThQj=+M96mf3ef0e9jzapoCw@mail.gmail.com>
Subject: Re: [PATCH 11/30] drm/bridge/analogix/anx6345: Don't link encoder
 until after connector registration
To: Lyude Paul <lyude@redhat.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, amd-gfx@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:58, Lyude Paul <lyude@redhat.com> wrote:
>
> Another case of linking an encoder to a connector after the connector's
> been registered. The proper place to do this is before connector
> registration, so let's fix that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 8e016ba7c54a..6258f16da0e8 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -556,12 +556,6 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>         drm_connector_helper_add(&anx6345->connector,
>                                  &anx6345_connector_helper_funcs);
>
> -       err = drm_connector_register(&anx6345->connector);
> -       if (err) {
> -               DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> -       }
> -
>         anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
>
>         err = drm_connector_attach_encoder(&anx6345->connector,
> @@ -571,6 +565,12 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>                 return err;
>         }
>
> +       err = drm_connector_register(&anx6345->connector);
> +       if (err) {
> +               DRM_ERROR("Failed to register connector: %d\n", err);
> +               return err;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
