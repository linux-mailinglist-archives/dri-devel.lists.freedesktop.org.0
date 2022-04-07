Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FB4F8492
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC5B10EB6A;
	Thu,  7 Apr 2022 16:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0110E28C;
 Thu,  7 Apr 2022 16:07:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id a19so1605932oie.7;
 Thu, 07 Apr 2022 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WZc922TCkE49F8hGZOnYik1JaLOlZX3dBUSjrkm78qo=;
 b=ef8hjGCXAvHCiEwP6/S3w3yGSEbo8Mowe/AtutAkNNHKu0/c/vnFP35yO+oTCmSXzv
 7CcwjhjDaDUQBc7Qbw9hvKlzTLlSrsskExp4bs12YtSgM9cRoDazvi7w51bbpe2E0rvz
 sgOAHUj1aIDePV8roZ1gK6DDwg8Hj+hsfCHCn2tpUni/RrBz8aHMJfqUaJxl0T/pVaqa
 taEKsGaudGSREFpHiLeIaBB5n6PCsKOPnMBZPKbQSiz3myMpqjFk4NkCdq+VqC6Ld3HR
 a8Gvyp53Ju7Qiczm5KgjH4fBESrXXwgNmrWI/oAfbkInLUZM3JRJ1Y7hQiXTH1Ves/Fs
 OF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WZc922TCkE49F8hGZOnYik1JaLOlZX3dBUSjrkm78qo=;
 b=wswfYJTlq3C7XujxoX6rT4eKB09WTGM6pF4P18IpS1+75bNlh/fav2Xy5bW03tNv7m
 bBLgkyLwsy6U44MRO+2OynxziL+N1OEQzGmHUE93PWIBTi6FQvnXOBdJtySrdZ43KNpt
 lkIFBwfl1ecLBiaHRCL5Tnnbb3XJGIGXK2WXl3gCasBjY+HN/kU1eyell3jY437MaICg
 5vyiZHODJiIpnXahvAUzWnD/7MAaeaCLGDbfVlID/iguPfdP2BF7CFEzkFts88WkZg5G
 QnDUvQJdS9wzn7JQe7dsTSgkFgXjzuGgPZcrY5mTtP5o8QluyLdWVF3c+r/Es1wJgCZM
 yWrw==
X-Gm-Message-State: AOAM531uxGVz4FhqlDN39VLrFv5Hc6py+3nWFkPdhwM9hDz+0inXerkF
 5l5wP0omRnTlB0CR9EDwAYcKIS0HsQIocHo8DzI=
X-Google-Smtp-Source: ABdhPJzIL4EpK3DQnR+LNMct9rhw7zo1YuFYfIGktjGBWN36b1ZLz75mvni1P6FT0iILO3UJhNrH8W9NdLLOwXv14oY=
X-Received: by 2002:aca:6006:0:b0:2f9:c685:f4e2 with SMTP id
 u6-20020aca6006000000b002f9c685f4e2mr317231oib.200.1649347678620; Thu, 07 Apr
 2022 09:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
 <bb7635cf-461e-7abd-6092-4be67099c846@amd.com>
 <CADnq5_Ogke7XuVsQaB8pskreXam1ASTE2jna=U6iuKuuyR4r-Q@mail.gmail.com>
In-Reply-To: <CADnq5_Ogke7XuVsQaB8pskreXam1ASTE2jna=U6iuKuuyR4r-Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 12:07:47 -0400
Message-ID: <CADnq5_Phw7SvfdtX_RN7N4xEzceYpZLvRv971y3YyOdrg5Lz_w@mail.gmail.com>
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

Actually this just causes another warning.  Dropped for now.  More below.

On Thu, Apr 7, 2022 at 11:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Applied.  Thanks!
>
> Alex
>
> On Thu, Apr 7, 2022 at 10:18 AM Harry Wentland <harry.wentland@amd.com> wrote:
> >
> >
> >
> > On 2022-04-07 02:00, Haowen Bai wrote:
> > > Smatch reports the following:
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2174
> > > dcn10_enable_vblanks_synchronization() warn: if statement not indented
> > >
> > > Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> >
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> >
> > Harry
> >
> > > ---
> > >  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > > index ee22f4422d26..3c338b85040c 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> > > @@ -2172,13 +2172,13 @@ void dcn10_enable_vblanks_synchronization(
> > >       if (master >= 0) {
> > >               for (i = 0; i < group_size; i++) {
> > >                       if (i != master && !grouped_pipes[i]->stream->has_non_synchronizable_pclk)
> > > -                     grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> > > -                             grouped_pipes[master]->stream_res.tg,
> > > -                             grouped_pipes[i]->stream_res.tg,
> > > -                             grouped_pipes[master]->stream->timing.pix_clk_100hz,
> > > -                             grouped_pipes[i]->stream->timing.pix_clk_100hz,
> > > -                             get_clock_divider(grouped_pipes[master], false),
> > > -                             get_clock_divider(grouped_pipes[i], false));
> > > +                             grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
> > > +                                     grouped_pipes[master]->stream_res.tg,
> > > +                                     grouped_pipes[i]->stream_res.tg,
> > > +                                     grouped_pipes[master]->stream->timing.pix_clk_100hz,
> > > +                                     grouped_pipes[i]->stream->timing.pix_clk_100hz,
> > > +                                     get_clock_divider(grouped_pipes[master], false),
> > > +                                     get_clock_divider(grouped_pipes[i], false));
> > >                               grouped_pipes[i]->stream->vblank_synchronized = true;

@Harry Wentland should this last statement be part of the if clause or
the for loop?

Alex

> > >               }
> > >               grouped_pipes[master]->stream->vblank_synchronized = true;
> >
