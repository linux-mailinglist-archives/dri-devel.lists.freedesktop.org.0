Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF15E35C64B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAB6E578;
	Mon, 12 Apr 2021 12:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232DD6E578
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:32:27 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso1974703oto.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAbEERU9Z0GRvzFVMLnHRE6+8DF0Uz1ZfFddY3ugnyA=;
 b=SrYJl92CjxSoYrwOug1b0tkxH9c361upsDw6OQCPoJ1rzOiABXR6o+eTvxdylf6/dc
 BPWuuRNyt/bi4lvo/XIY4YNTfKAZafjnJWQ2bCvqAtx9tDOgVKvG4bEjN/oGqX+I9Mnn
 zQIZ39QwjesFlpkRYdDJ0uliAmwCtu6jdk0eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAbEERU9Z0GRvzFVMLnHRE6+8DF0Uz1ZfFddY3ugnyA=;
 b=CiM0rRLdQf+EVP/EVooblhWAGSqZ2D6v9Mniox1LGGbMONAFtPoG6fN5JI6VMEaC8d
 M7PHqTnS9SQyMREbghMhTM8zqtkFVo5Ta4dSVBcusDclo15SDm4gE21esKFxSOdKB0+P
 WzB4BRQFN0BZ004T1+htep1ZcXJAOYzNQVA+bmo1HjNBOl3AW2A3ZXa1+qz4XB/fqP5l
 Czz+DjJ2mhg5JvSx3UFulJCRSG1EE9e6Ho2ZOFXfRcFA167V+fTqMfdry7VBLFdXHY7Z
 XdS0x2Zqkyz1hsulL15YItb2QYV9f47aFGEpMvIMWm1fWfv9ZnN8mZVW8tIByUTm91yZ
 jcwg==
X-Gm-Message-State: AOAM5324FUtXD+rlXhuRfptptr1zEAyfwMCK+eh/vHUhLUEcLWFo46FT
 3sJ4u1jjECiEJcJKVRzJvizadSsWLaGVO3Ytnjuv2g==
X-Google-Smtp-Source: ABdhPJwZWPab0+ruj3pNaCbsI0IjG/t2sOrbjhFfXAU0A+ZBAduA4x4bwCTAGxcyHKaoZgfbflns84om4s5i6zN8Mg4=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr24378174oto.281.1618230746369; 
 Mon, 12 Apr 2021 05:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210412122056.28351-1-fmdefrancesco@gmail.com>
 <20210412122056.28351-2-fmdefrancesco@gmail.com>
In-Reply-To: <20210412122056.28351-2-fmdefrancesco@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 12 Apr 2021 14:32:14 +0200
Message-ID: <CAKMK7uEzf64xB5TLS7VvyLVJmX4MBNnHcr3_n1zDq3hOVAm1Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: drm: Replace "unsigned" with "unsigned int"
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel <outreachy-kernel@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 2:21 PM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Replaced "unsigned with "unsigned int" since the latter is preferred.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Nit for the subjects: In drm we generally don't have the gpu prefix,
but just the level below + what component. So for these two patches it
would be drm/atomic-helpers: as prefix in the patch summary lines. Can
you pls adjust that? Patches look good otherwise.
Thanks, Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f2b3e28d938b..cd748ff61162 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -106,7 +106,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
>         struct drm_connector *connector;
>         struct drm_connector_list_iter conn_iter;
>         struct drm_encoder *encoder;
> -       unsigned encoder_mask = 0;
> +       unsigned int encoder_mask = 0;
>         int i, ret = 0;
>
>         /*
> @@ -609,7 +609,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>         struct drm_connector *connector;
>         struct drm_connector_state *old_connector_state, *new_connector_state;
>         int i, ret;
> -       unsigned connectors_mask = 0;
> +       unsigned int connectors_mask = 0;
>
>         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>                 bool has_connectors =
> @@ -1478,7 +1478,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>         struct drm_crtc *crtc;
>         struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>         int i, ret;
> -       unsigned crtc_mask = 0;
> +       unsigned int crtc_mask = 0;
>
>          /*
>           * Legacy cursor ioctls are completely unsynced, and userspace
> @@ -2575,7 +2575,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
>         struct drm_crtc_state *new_crtc_state =
>                 drm_atomic_get_new_crtc_state(old_state, crtc);
>         struct drm_plane *plane;
> -       unsigned plane_mask;
> +       unsigned int plane_mask;
>
>         plane_mask = old_crtc_state->plane_mask;
>         plane_mask |= new_crtc_state->plane_mask;
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
