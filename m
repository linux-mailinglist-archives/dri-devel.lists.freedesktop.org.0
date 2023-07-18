Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17547573F3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93010E081;
	Tue, 18 Jul 2023 06:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A8210E081
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:18:13 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so78367921fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689661089; x=1692253089; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KA1k3LWdJrycD7+8OcHcVZB99NNNbrk61vgndGZGEcM=;
 b=DpzU++FE4Ax0xt45yhig+1UQjsLFHwRkgQyIWi0NXZpKJ7C5flgwQUT+795d9afTSS
 jY1zc36HC/j7RH2b/pmgWfGnUlFbdfM7ZYNBHri+DRXdVlxXeRLr8/EIdC+LH0jFhMdR
 XDMcj73CHjloM9lT5M4ILWA9aW1Z784lfnuEl7UdvJprzZgA9miRXu/ImrEv4fjyg0Yg
 LapLMBqub/u4MN3nVIAvof29Hcnj4bwSpWTAteFyD58GSMaWFTIaVI6JtfLtX8fRFF2t
 v9pAisptdpzM21tq7jQv7z7oOhX/wwYNdvx2DZ9Lwvd+IR+G8cltwB60DnKHsyKxJ/AB
 V1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689661089; x=1692253089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KA1k3LWdJrycD7+8OcHcVZB99NNNbrk61vgndGZGEcM=;
 b=Flsq1sNGZ8jK5DvAQqhQHLfS2sLja+TqyZOP+AUvXG0FSpVyRPRzAE4dw+fmVzL1MG
 4QuBNZbu6MSvyVPSj5Fnq/J2qYT/df1Cg1PBFYlyuW/vIUHJ5A2wScKB3lOfjY1sQeCm
 tIG4YJo9pkoOMBBKCIU9/xKXvZzNsOzhRM+ZEsmSTC5R4DKrfZtVxS60clxmAFSK1was
 3ZNgocNrquliPM/GtKpuFP+KEYGz8fNWc+ZCmE9vnBUxLNqhiQCLSaS/jmN60+lI7OCK
 L6Hg6ZUmY687UE4VFUQBMXWiZRzbdgmnVcBa+Eq9PUSZjtx3AdHhKQwWfBWV7LDBxvjx
 Sgqw==
X-Gm-Message-State: ABy/qLbl4cTyP3cVVTXPZs6oA3OX8YXir0QpUKkRGixXinaXwCDim8fZ
 Zupb0uCK8Zd2HDnRnIXRuZqV9/j27U8vE0JJixpJrw==
X-Google-Smtp-Source: APBJJlGB0oIGKDOPuaduZrWnO2FxLltxsvsGPi07T5wrz5pWNnb/vYvW5RkHh+acrIJO2WQbbmY7yUIzF0xFnt3F6Vo=
X-Received: by 2002:a2e:9dcc:0:b0:2b9:3461:45ad with SMTP id
 x12-20020a2e9dcc000000b002b9346145admr4853916ljj.20.1689661089433; Mon, 17
 Jul 2023 23:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230516164416.11616-1-alex@shruggie.ro>
 <CAOMZO5Br-nMxLSekZL5jLHNpyfOH_KgL1WUgAZ25wu86S2eYwA@mail.gmail.com>
 <27105a1712cd7be1d3d36702873f5702999566e7.camel@gmail.com>
In-Reply-To: <27105a1712cd7be1d3d36702873f5702999566e7.camel@gmail.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Tue, 18 Jul 2023 09:17:58 +0300
Message-ID: <CAH3L5QqOUOR4t2b2r780Q7YcWUqDo_rvmLYt_VHKx1MszaNGNA@mail.gmail.com>
Subject: Re: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 10:48=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
>
> Hey Alex,

Hey Nuno :)

>
> On Thu, 2023-07-13 at 17:19 -0300, Fabio Estevam wrote:
> > On Wed, May 17, 2023 at 4:08=E2=80=AFAM Alexandru Ardelean <alex@shrugg=
ie.ro> wrote:
> > >
> > > From: Bogdan Togorean <bogdan.togorean@analog.com>
> > >
> > > For ADV7533 and ADV7535 low refresh rate is selected using
> > > bits [3:2] of 0x4a main register.
> > > So depending on ADV model write 0xfb or 0x4a register.
> > >
> > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> >
> > Should this contain a Fixes tag so that it could be backported to
> > stable kernels?
>
> Yeah, most likely yes... With that:

I'll add one.
I seem to forget some upstreaming routines, since I started doing less
upstreaming.

Thanks
Alex

>
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
>
>
