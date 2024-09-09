Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46628972013
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BEA10E5F5;
	Mon,  9 Sep 2024 17:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="URde76xD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B410E5F1;
 Mon,  9 Sep 2024 17:11:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2054fea6f26so1710115ad.3; 
 Mon, 09 Sep 2024 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725901872; x=1726506672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVftTf/6dppL8th41rroSYqvMXFlN1yv6xhVhcE4Yek=;
 b=URde76xDmwTVRZIFfZsVbOLaJ/2UJq7eOWTE8e7N3i1QTv2J9t24Y8tBM0cx3c+1L3
 piqGcq8nMBV5TJXIxjX6GoepDRbh0NtNhw0oKFV34qqpXmnvvIqmvn9IbALe3J8+mXDm
 hVhy3fHKQ1brC1PTk3oF6bv75ePNl8YwHUMM7YRIyOFuzUGiyostWqIUZln0dK5c3fSM
 VzSeGLgfiAJ4CPj5QmJ3wjXqIzDnmqGhaaaduhQzERKcGOfSXXFTUrxzPFcRqUn85qGG
 v+X8y1g9Hi5TnA8UAfZJKxPYFn0tk7GUp7esCLdRQb/YaJb9G+mn/icnyj3+vwQThU7g
 E1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725901872; x=1726506672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVftTf/6dppL8th41rroSYqvMXFlN1yv6xhVhcE4Yek=;
 b=jakQ5MOtvCx/UTZLPBwRLWgz85cgPfP5C7Ee5s3A+922YxP8BvWWKNrJfxvDy0k5WZ
 JvnnbNosom4iOZnDZT3yZ7Phqk5rAKzk+H1JQU4lmOXlHl6oPkM2fd6r3c9T4VdgNmmA
 3C8ZlNAUGVP1h6kMd/i249FKJbtx04lwl8hpuzEw8dQdWZ+TufKSXdL0nEckFxFn3lKG
 uCy7fmRPm7lylcwmOVr7x+jsXvCbpYq1zv5Ngn9u6z0KhCRVFIQXXB4iTfItmpWSDhRS
 xEihrSVClKOwqFHQOS17qdJF7WJIA9fTbkEnBfEvdqWuQkcmyNRDwRLk0ZBHFNE6RqOb
 rDww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHiqWkWkxUbpYJSFmqGZ6k3EeIlur7cuI5zSrvy9t1eBQMQ8sUSFMDbEt3U/JbyikUD9kH44rfPbY6@lists.freedesktop.org,
 AJvYcCXZD1tWR/cZrr1L0ozwaOGIq2KPA1orz6CyUDtmc+q4ZLeqfGD5XNcVRz7TF40HxGM6OuYK4PkY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGZJw7QZ8dvWfQ+yiXOM6Lnj3d62Nx2qDiHHCfKSR3s89nr5yh
 vBiijj3BWB0BrzeNnNMzJZkTbw4h10iYTyDqXdWcCTXEtcvsSUhfssDcVAI5vOZsjXqqCCxvd+F
 TUwVgmPCRCr1vv3ih8X1QNjxXBv8=
X-Google-Smtp-Source: AGHT+IG6tq0gRvkzZXE20DrtwJfgOOovD9fBBwckWQFdSkiHCtqeKpXQgZwxo2UTje5uc6S+kLw3UDjEzbi2mI3hjqk=
X-Received: by 2002:a17:902:d2c2:b0:205:76c9:795d with SMTP id
 d9443c01a7336-206f0605ebbmr59105145ad.6.1725901872296; Mon, 09 Sep 2024
 10:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
 <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
In-Reply-To: <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Sep 2024 13:11:01 -0400
Message-ID: <CADnq5_PMnCUYsUq_SPS8woi20KxaW2+teMzhmmOyFJRaq3YVQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/amd: fix VRR race condition during IRQ handling
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: Christopher Snowhill <chris@kode54.net>, amd-gfx@lists.freedesktop.org, 
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

On Sun, Sep 8, 2024 at 7:23=E2=80=AFAM Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
>
> On 9/8/24 09:35, Christopher Snowhill wrote:
>
> > On Mon Sep 2, 2024 at 2:40 AM PDT, tjakobi wrote:
> >> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >>
> >> Hello,
> >>
> >> this fixes a nasty race condition in the set_drr() callbacks for DCN10
> >> and DCN35 that has existed now since quite some time, see this GitLab
> >> issue for reference.
> >>
> >> https://gitlab.freedesktop.org/drm/amd/-/issues/3142
> >>
> >> The report just focuses von DCN10, but the same problem also exists in
> >> the DCN35 code.
> > Does the problem not exist in the following references to funcs->set_dr=
r?
> >
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:      if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:             =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:             =
 pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:        if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
 if (pipe_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:               =
         pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:        if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:               =
 pipe_ctx->stream_res.tg->funcs->set_drr(
> > drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:      if (pip=
e_ctx->stream_res.tg->funcs->set_drr)
> > drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:             =
 pipe_ctx->stream_res.tg->funcs->set_drr(
>
> Maybe. But the big difference I see here, is that in this code there
> isn't even any kind of NULL check applied to tg. Or most of the members
> of *pipe_ctx. If there really is the same kind of problem here, then one
> would need to rewrite a bit more code to fix stuff.
>
> E.g. in the case of  dcn31_hwseq.c, the questionable code is in
> dcn31_reset_back_end_for_pipe(), which is static and only called from
> dcn31_reset_hw_ctx_wrap(). Which is assigned to the .reset_hw_ctx_wrap
> callback. And this specific callback, from what I can see, is only
> called from dce110_reset_hw_ctx_wrap(). Which is then assigned to the
> .apply_ctx_to_hw callback. The callback is only called from
> dc_commit_state_no_check(). That one is static again, and called from
> dc_commit_streams().
>
> I could trace this even further. My point is: I don't think this is
> called from any IRQ handler code. And given the depth and complexity of
> the callgraph, I have to admit, that, at least at this point, this is a
> bit over my head.
>
> Sure, I could now sprinkle a bunch of x !=3D NULL in the code, but that
> would be merely voodoo. And I usually try to have a theoretical basis
> when I apply changes to code.
>
> Maybe if someone from the AMD display team could give some insight if
> there still is potentially vulnerable code in some of the instances that
> Christopher has posted, then I would gladly take a look.

@Wentland, Harry can you confirm this?

Alex

>
> With best wishes,
> Tobias
>
> >
> >> With best wishes,
> >> Tobias
> >>
> >> Tobias Jakobi (2):
> >>    drm/amd/display: Avoid race between dcn10_set_drr() and
> >>      dc_state_destruct()
> >>    drm/amd/display: Avoid race between dcn35_set_drr() and
> >>      dc_state_destruct()
> >>
> >>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++------=
--
> >>   .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++------=
--
> >>   2 files changed, 24 insertions(+), 16 deletions(-)
