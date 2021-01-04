Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8BF2E9F8B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 22:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13538970E;
	Mon,  4 Jan 2021 21:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514C88F58;
 Mon,  4 Jan 2021 21:31:40 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id b24so27462626otj.0;
 Mon, 04 Jan 2021 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TiqNYXMJ5AKgiEIfqOfwDDmZ4Q7rDHmzjJ1+bk86GTY=;
 b=t5Xc45uYRah37wlZLN0dHKfBi7XMgQc3oF6NM/094txV5GuQTcXMd1NWLZtkSJJEXj
 KIsDCNRmNxClm/eXcm2FsO5/DZqvY7gjECaPeHeGJAwFPoc9n/65CSjPz8/oKCVlCZ13
 rl0C3o8Kl2t/0YabYtdFOSkG3JEs7fDhrrcnYRiqJTjcNzyR0JpWw9uGxY/WgdhluwdM
 mXKHPmH8KzXs8+v0O2LtSOSzFtkcUx7JhXDjXNVXcts9Xa78KDN8iMYRyH3nuYrjycqs
 YdFJ0W7f3C2aOeFvKMkp3vQqyfiNFqnQbKD1z24L7aI2MlPaN0VnVBThAqC9qq/UE5mj
 zjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiqNYXMJ5AKgiEIfqOfwDDmZ4Q7rDHmzjJ1+bk86GTY=;
 b=gK5NvgHi3Teu2XmapIlwCi4ls2yo+IKphFvj0i4xETRlCxhd4GLhvTFQTw2OgVQi7S
 qFlN5SA69AU9z97NZXzfSh4tyAOhT07QXAotR5TYIbPNLXIPUGhcODVaf5FDQwvphV+4
 0JyU8736zjzOkGyF8eFocVPn0m/5HSztSZ/vGdnvf9ua35dAt97hQaQGyQ8Zxzl6NlTY
 h7pECU+tcPuByLOOeWpnBSfmapcW8gVprVxuEttTZj/i56YVu+OIF5eq3BYzJ3mL7gDX
 +VgtYZTGPGQZGPoK1rdpftRGXtXj4qIRSQlYjFJlPgZhjD6GbWNthDsWxTkgL58Li8Ov
 lwyg==
X-Gm-Message-State: AOAM530zu/HOeFomt5sQOkx+3xEzuYIgoYrRM+bH37Q69glyxV2qmEqE
 T5baQzIT8/rjkxp7QX1NVqiWyuDcVbNTKcDHDX4=
X-Google-Smtp-Source: ABdhPJx0es6MM2qKijebzR1bndmLf2P2I06XpZOm2Ap8COkUGeYo2wKJfHIr48xJjGJdhhVlSyKrB941RQHaLlSRD74=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr39584321otl.311.1609795899762; 
 Mon, 04 Jan 2021 13:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
 <20201228185059.3949-3-mario.kleiner.de@gmail.com>
 <2b1f7e42-bc31-824c-387d-0b08193b6a67@amd.com>
In-Reply-To: <2b1f7e42-bc31-824c-387d-0b08193b6a67@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 16:31:28 -0500
Message-ID: <CADnq5_N1zsMpnLtdmPQqzVXYfSwfhwXUmUb07hQAL9e5wHgr6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-8/10/11.
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Mon, Jan 4, 2021 at 4:17 PM Kazlauskas, Nicholas
<nicholas.kazlauskas@amd.com> wrote:
>
> On 2020-12-28 1:50 p.m., Mario Kleiner wrote:
> > The hw supports fp16, this is not only useful for HDR,
> > but also for standard dynamic range displays, because
> > it allows to get more precise color reproduction with
> > about 11 - 12 bpc linear precision in the unorm range
> > 0.0 - 1.0.
> >
> > Working fp16 scanout+display (and HDR over HDMI) was
> > verified on a DCE-8 asic, so i assume that the more
> > recent DCE-10/11 will work equally well, now that
> > format-specific plane scaling constraints are properly
> > enforced, e.g., the inability of fp16 to scale on older
> > hw like DCE-8 to DCE-11.
> >
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
>
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>
> Regards,
> Nicholas Kazlauskas
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c | 2 +-
> >   drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
> >   drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c   | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> > index 8ab9d6c79808..f20ed05a5050 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
> > @@ -385,7 +385,7 @@ static const struct dc_plane_cap plane_cap = {
> >       .pixel_format_support = {
> >                       .argb8888 = true,
> >                       .nv12 = false,
> > -                     .fp16 = false
> > +                     .fp16 = true
> >       },
> >
> >       .max_upscale_factor = {
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > index 3f63822b8e28..af208f9bd03b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
> >               .pixel_format_support = {
> >                               .argb8888 = true,
> >                               .nv12 = false,
> > -                             .fp16 = false
> > +                             .fp16 = true
> >               },
> >
> >               .max_upscale_factor = {
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> > index 390a0fa37239..26fe25caa281 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
> > @@ -402,7 +402,7 @@ static const struct dc_plane_cap plane_cap = {
> >       .pixel_format_support = {
> >                       .argb8888 = true,
> >                       .nv12 = false,
> > -                     .fp16 = false
> > +                     .fp16 = true
> >       },
> >
> >       .max_upscale_factor = {
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
