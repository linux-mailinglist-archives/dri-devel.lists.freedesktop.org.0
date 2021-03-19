Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8207341F88
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E916EA29;
	Fri, 19 Mar 2021 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD686EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:35:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so4947246pjg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0R7vCUqOiWqusGQdLDA2yAGdzDAYsdMM6CojvsuIllk=;
 b=dYE81wS7DSKdB7GyR7+XAISp1t5pL/zSDfGVzIkbDNtoK9UFhOBsBQloCz5aWC1JAw
 lb3M2Iovl8eVPmG9iOIr/YUjCSJAhPTN/g+p6UMu6/Y1VjFTY32AXsOmDiENYV+o4uYU
 2E6IrTuBArSyTrhCPYpg4mJiuwrSs7OAHvKo0A4CJV1bCBDO7aWZsxn8OtdcMNW1ZA7u
 S+elXIqViLr/nD7rTq4htiUkJ5lo2uGNeF21pedQKl0u5C8M9VsU/JvlO1Bjey6pA7C4
 ANLJaApZfubVYKU033BWxll74mz1LZeSHXGAp7PYpcEbxUnJW9WBOVD/HMYy5a3wMAlo
 KCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0R7vCUqOiWqusGQdLDA2yAGdzDAYsdMM6CojvsuIllk=;
 b=YLbSHi7jmxSbVA+FhwBVaPPJRHTvt0MRT3GOP6NrlyACYJ8quvrFIZCL0Dt+11YZYa
 ZQVuXGRzZ21PBryMZsbB0xdA2eR9+rvYmql0B6jHOYzRO+DD1twYQCvf/AlO9k3/rElJ
 8P6S6vSfKkwn3HftimPtPVPZ8GZQgMWlwH1d7Xoutnm1ptHvxjTkJYw0XVVJOn7x4dhd
 lHmRWX+I6C74pxZSuZs/cPllj+CApju6c1xAIzzrXm/jmib+yp/CmLyCszkcEwA19mEL
 FOUoIeb7ZdvzkstbAz5ZaAgzNDJfe959P++7Y2Gar4BGPmwDXm0gNE7VdyVfVXxYVcEx
 ycnQ==
X-Gm-Message-State: AOAM531Y0vIFlCdoVxdP3AfQ8cg1+v7zV2oABmut6xNnQZRkj1TpoD2Z
 6507918nAuR45mGvLRbpfkKZr3FIx7/ZQMLhBHbHOg==
X-Google-Smtp-Source: ABdhPJx6mz7QtxY42zHzQ4OwZrXSYkhmbs+ESa/8sPIZwAXqhmt9XhBi9MDQuYZrkn0CZzsEUeDWOtF7VrY+uzB9bCI=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr10307132pjh.19.1616164552793; 
 Fri, 19 Mar 2021 07:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-9-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-9-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:35:41 +0100
Message-ID: <CAG3jFyto=4U7wqtw92Escsu9cXGV=xD8SUKm_UUm7bRmYPUYxA@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/bridge/analogix/anx78xx: Setup encoder before
 registering connector
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
Cc: Torsten Duwe <duwe@lst.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:56, Lyude Paul <lyude@redhat.com> wrote:
>
> Since encoder mappings for connectors are exposed to userspace, we should
> be attaching the encoder before exposing the connector to userspace. Just a
> drive-by fix for an issue I noticed while fixing up usages of
> drm_dp_aux_init()/drm_dp_aux_register() across the tree.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index ec4607dc01eb..338dd8531d4b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -924,12 +924,6 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>         drm_connector_helper_add(&anx78xx->connector,
>                                  &anx78xx_connector_helper_funcs);
>
> -       err = drm_connector_register(&anx78xx->connector);
> -       if (err) {
> -               DRM_ERROR("Failed to register connector: %d\n", err);
> -               return err;
> -       }
> -
>         anx78xx->connector.polled = DRM_CONNECTOR_POLL_HPD;
>
>         err = drm_connector_attach_encoder(&anx78xx->connector,
> @@ -939,6 +933,12 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>                 return err;
>         }
>
> +       err = drm_connector_register(&anx78xx->connector);
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
