Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797F27B70C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 23:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0C289D02;
	Mon, 28 Sep 2020 21:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6689CBC;
 Mon, 28 Sep 2020 21:34:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so2537991wmj.2;
 Mon, 28 Sep 2020 14:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQrdqBVKuFkBR+f0GYAd9o2HNlWRXfR1jzG2t8Uh5d4=;
 b=VU0yiyJr2d6dsdFGWp7exYvOaJaJNYoG4osHuqSV1OjPaA9G9/w01tG+kxmQmnJ7+k
 wgKajhRa1tAqH/ezjSobf936luISfn/vzrhraV+tIfil16LqVBQmTcLBFBWYITwGTPjI
 Z5AAsQjO+m5yjzC/K4RykMpNYaJdw4ecMXZTLItfRQcOMgGuB4vdcPIt0t17fJ2IJZw0
 3415dxSEpPm+ZqV/MUhfq9aQGurmRthOGsgrjR010bmUQNN9fwtg1KC+iW1u+0571fJ/
 wzROp7BIv8i9Ec+bCyTOk/UIGGw4akTh4DFkjfuJNR/zWNCwo3UA6bxCBYELsiDmQ96O
 2wZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQrdqBVKuFkBR+f0GYAd9o2HNlWRXfR1jzG2t8Uh5d4=;
 b=fEWXzuNeVV23xoViEO6YwyJTcJQpx7qTljqjy09HvXmvBLTzPMgN4M4qxTlf0RcUE3
 2KZ9+D9neI/otGb4zJSzQwuPHrbP8rdRDYbWwbnxTICtSIK8cSFfGkkwCOsItU1c5I7q
 P2Iil5t3zWkX1NQkF/LAZCzrEkLkWkJXY6kIfMXiMNuq4G988pkYFIYXv1Y40l+I4U29
 K3zgEgisdcIPX6YEIukdR3sTgxwjXvIZQkx0I3Eje4/Xy5yxHXdZCeVKZnL6ugifhJ88
 XnSj1hrCWvc42Z5gZFuVIljNp0mwsDYPid+dQzHxbTdztvP+d456mAqttht9UtWRIf4u
 W0Cg==
X-Gm-Message-State: AOAM532IE+I1bLC8kEJc2EHJ7WBZQ1sXybE/yJGF5c0cUs1KFzTB1xjU
 ktKtqI+JPo6+ykM/6A2YlgzQfse2pW0V+zUccyU=
X-Google-Smtp-Source: ABdhPJwqvg7aDNEIPSY4pgWZqSeaqRCxbbpAMobeBd1OrmQn8K77MphqX+HMsrY0+QYdft+LYd+EMT12guPUtyu5kls=
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr1080450wmc.73.1601328864332; 
 Mon, 28 Sep 2020 14:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200928023641.90932-1-yanaijie@huawei.com>
 <41625a2c-d859-6ff1-cb03-08d97d606131@amd.com>
In-Reply-To: <41625a2c-d859-6ff1-cb03-08d97d606131@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Sep 2020 17:34:13 -0400
Message-ID: <CADnq5_N9yOTo_ZAskdXdeiA8XZR05t5V_Y1_o9wS2oVcyxE8MA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: make get_color_space_type() static
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Jason Yan <yanaijie@huawei.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Sep 28, 2020 at 10:06 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2020-09-27 10:36 p.m., Jason Yan wrote:
> > This addresses the following sparse warning:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_hw_sequencer.c:180:26:
> > warning: symbol 'get_color_space_type' was not declared. Should it be
> > static?
> >
>
> If you have multiple fixes of the same or similar nature in the same
> subsystem (e.g. drm/amd/display) I would prefer a single patch to fix
> all of them. These really only need separate patches if they go outside
> a subsystem.
>
> I see a lot of these tiny static checker patches from Huawei and while I
> appreciate small patches I feel these are needlessly small.
>
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > index c026b393f3c5..2a9080400bdd 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> > @@ -177,7 +177,7 @@ static bool is_ycbcr709_limited_type(
> >               ret = true;
> >       return ret;
> >  }
> > -enum dc_color_space_type get_color_space_type(enum dc_color_space color_space)
> > +static enum dc_color_space_type get_color_space_type(enum dc_color_space color_space)
> >  {
> >       enum dc_color_space_type type = COLOR_SPACE_RGB_TYPE;
> >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
