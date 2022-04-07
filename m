Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8234F841E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127A610EB52;
	Thu,  7 Apr 2022 15:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979C10EB1F;
 Thu,  7 Apr 2022 15:52:34 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e2442907a1so6421963fac.8; 
 Thu, 07 Apr 2022 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zvj/6TWHlPE3u4x5qOj/MKYPFT6/Bmdp2X/t9e2Hd8Y=;
 b=CQDxXIvAORTaLH1lFp/KE84Zi+yDyH4SXv+XQEBC2Oyx8UdXxqtoLkVRDzoxXjT1Kl
 dvqd7S7bks2Rdp2q2GbnKtG5VbJ2SX8nPyMzRINh219Y9bvYBctWKRz1b5BB31xtcwMB
 QON9WWLgNfulPIpzzC2zVFMqo1k0IQQdzWDYQPJf/EiJkXgRImm0ORmd8ss6D6VbNFuj
 CM5IjjUdfZyCTfnlUOzQtoirtV6/kO7mWKoILCl4hu+IQtXxkzK0ioMpEKo/iZc6aXVt
 t5kCQOZE7FgPfPwYoeEKQJ0QuOB5wRr+48mzpcCXM1MxbDNBSjPKcJspb87V4VIPkWuL
 PhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zvj/6TWHlPE3u4x5qOj/MKYPFT6/Bmdp2X/t9e2Hd8Y=;
 b=HYOlRhDz+C7EEu7QHlwmxdKw2pHpygA5TXiQIztaPeMn7z9abcmf3HCG733MWExC93
 4QXBfFuCAH5gVa1wpyAE5LTKkgcYk3mtjax5rHm24CryhBf3vH9Zv/sN4AJqMowVQVIB
 RL6EgCaVjVOr9cDRNeIXzZJPAiJpJ6EXpOIwfOqEQNxpDQ+8qvOWJocgN37u1OWu5qAQ
 41B4x5gpviCWkujxhVCy6VtZYaXcpFOQbQawFI92pAoSiYgSEglc1n21D3NZyKIoCDsW
 Wusyipbf45OQE0FrlXyswwfI13IAYQvg+Jq6YAzguEdRPxte0rA3qsMTeCEOB8zjfRra
 h5YQ==
X-Gm-Message-State: AOAM533w6idcKMYxqEYOBBqXuubchXZy4JiCOecCCZqu4XRezmP1dUQM
 P7HDA9kmvX1vbc/zx4OezMbUhVHUSgAGz4JwteE=
X-Google-Smtp-Source: ABdhPJwbVKatWleKRKuoYIdjXNJJqi8U/WypflC2hMRpEw7pq07icfUzlhwiLHyArNuGU+u+cXNZZrxQTtUk2cOd5tY=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr6162010oaa.200.1649346753856; Thu, 07
 Apr 2022 08:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
 <bb7635cf-461e-7abd-6092-4be67099c846@amd.com>
In-Reply-To: <bb7635cf-461e-7abd-6092-4be67099c846@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 11:52:22 -0400
Message-ID: <CADnq5_Ogke7XuVsQaB8pskreXam1ASTE2jna=U6iuKuuyR4r-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix indenting mistakes in
 dcn10_hw_sequencer.c
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Haowen Bai <baihaowen@meizu.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 7, 2022 at 10:18 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-04-07 02:00, Haowen Bai wrote:
> > Smatch reports the following:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2174
> > dcn10_enable_vblanks_synchronization() warn: if statement not indented
> >
> > Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > index ee22f4422d26..3c338b85040c 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > @@ -2172,13 +2172,13 @@ void dcn10_enable_vblanks_synchronization(
> >       if (master >= 0) {
> >               for (i = 0; i < group_size; i++) {
> >                       if (i != master && !grouped_pipes[i]->stream->has_non_synchronizable_pclk)
> > -                     grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> > -                             grouped_pipes[master]->stream_res.tg,
> > -                             grouped_pipes[i]->stream_res.tg,
> > -                             grouped_pipes[master]->stream->timing.pix_clk_100hz,
> > -                             grouped_pipes[i]->stream->timing.pix_clk_100hz,
> > -                             get_clock_divider(grouped_pipes[master], false),
> > -                             get_clock_divider(grouped_pipes[i], false));
> > +                             grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> > +                                     grouped_pipes[master]->stream_res.tg,
> > +                                     grouped_pipes[i]->stream_res.tg,
> > +                                     grouped_pipes[master]->stream->timing.pix_clk_100hz,
> > +                                     grouped_pipes[i]->stream->timing.pix_clk_100hz,
> > +                                     get_clock_divider(grouped_pipes[master], false),
> > +                                     get_clock_divider(grouped_pipes[i], false));
> >                               grouped_pipes[i]->stream->vblank_synchronized = true;
> >               }
> >               grouped_pipes[master]->stream->vblank_synchronized = true;
>
