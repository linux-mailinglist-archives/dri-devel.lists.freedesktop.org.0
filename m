Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C074397DE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1590889FDD;
	Mon, 25 Oct 2021 13:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C40D89FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 13:51:45 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 d144-20020a4a5296000000b002b6cf3f9aceso2581120oob.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4VCrhWe5ZrfwX9CUdBZWlusEwEBGPfdtN1YeM+lr65Y=;
 b=Q+ssNDyYLIqpKTOkZTp4Vz7/Tdn+3IQfomTwHlXWvgx6+Gdu2+SgMAsrtGz5B218Ci
 Rnt2K8PtGPEzsyQhmZswy9TAZ3jGt1Km1kGJarffuezpOSXQlzq/de3KvAlkqO0wPszj
 71iXAsOU2+/e1E0OBMvlMWdEl1Vz+ociAm4EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VCrhWe5ZrfwX9CUdBZWlusEwEBGPfdtN1YeM+lr65Y=;
 b=PozkCbs93DuX5ixPYzGor92DFWdSJsihyi0p9cxsI0iEM4+/o9cWeiss8LaKKmCh0h
 rG6fREyYLodhueRkgOUg+1OEP5RqV41dTYqgYfn2wyve6hy9SnqvF6YT+KaE7sByxIJY
 5dGfx+tHmIlTzCTayNE6/RUR11s4SF06oN7gWb5LQ3/neCyr5GSEyufFAYE5CtkOnZaQ
 WWxG5ww08doydjIAYxC3zWhrCcF2k1Y42wDgcc9NyAlzEDDNbRXj9R/iRxqepmApEmDz
 Ra9fPkei4+1KlnbS+LAP1gDInE4FyGwRpTajWw4mPpZCIcqlUUpIhiR0zJhvs4j44R2F
 3QtQ==
X-Gm-Message-State: AOAM5316dCf6dn7U21aokBAtUMsxbV9nhlZH0YW3yex4a24noMtbNMN6
 Ks0M7Qe5T/k3OzON9NElqMAqTIwdtW94/og0FIVfqg==
X-Google-Smtp-Source: ABdhPJyV9/aLaMtKOzsY8+JwNWr0UJJK32s3I3AmQhBUD9+uUBwJLdiFE8MUM8IfYASpuuDRaErFkJhMrRmUZ208BB8=
X-Received: by 2002:a4a:ae0b:: with SMTP id z11mr11750807oom.25.1635169904865; 
 Mon, 25 Oct 2021 06:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211025134907.20078-1-joonas.lahtinen@linux.intel.com>
In-Reply-To: <20211025134907.20078-1-joonas.lahtinen@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 25 Oct 2021 15:51:33 +0200
Message-ID: <CAKMK7uHTdVY2VOGb89aKE1z_mwjMk5pmBmidNmVMX4xuLNqDxw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Tvrtko as drm/i915 co-maintainer
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Intel graphics driver community testing & development"
 <intel-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Oct 25, 2021 at 3:49 PM Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
>
> Add Tvrtko Ursulin as a co-maintainer for drm/i915 driver.
> Tvrtko will bring added bandwidth and focus to the GT/GEM domain
> (drm-intel-gt-next).
>
> This will help with the increased driver maintenance efforts, allows
> alternating the drm-intel-gt-next pull requests and also should increase
> the coverage for the maintenance in general.
>
> Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98aa1f55ed41..07553156a1c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9361,6 +9361,7 @@ INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
>  M:     Jani Nikula <jani.nikula@linux.intel.com>
>  M:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>  M:     Rodrigo Vivi <rodrigo.vivi@intel.com>
> +M:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>  L:     intel-gfx@lists.freedesktop.org
>  S:     Supported
>  W:     https://01.org/linuxgraphics/
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
