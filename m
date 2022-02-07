Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58714ABEC8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14B10E46A;
	Mon,  7 Feb 2022 13:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053ED10E46A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:05:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s7so3231873edd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6FvBT7R5v+QG/+YfkN2sXWoQenHBGKeI41StiEHRaY=;
 b=T0JvL5y+42KULc3aFsHzlWPbqu9bVpC9P1HwWzFQBjaUcPDvx/xUjU9Th1o6uv7xfk
 VpvClrhfLQYGykEJAFqyi5WeUYy2WehsfFoZYpWWJ+dA5eArupkLz/rMXFtOaqWXuh8X
 d5W4/251DUpBGhc8KjwwinfwguQ9f9oVNjjVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6FvBT7R5v+QG/+YfkN2sXWoQenHBGKeI41StiEHRaY=;
 b=K3FPYZrNIzoixTjT+R4tjN6qFu8RcKZgQw07oAcQa4ufjeZmWNDIVHL/BZM/TGijY0
 ZQ/KtbQ921LsFvhp+HJX1N3Ywn08dR95Jq91Qhlo6thoDc4Jjj1JfiWpvuqbRU7s3ulj
 /AISRs2jmSRSPCAZ/G9EvtVT4ZeY7mYdrqwfJCnS4V1TyfwCKvcRTLgfonpXS6YJcxJI
 CD9pV9/D4fyJ19y/Oyf8F5YUkg02WGB+ghnBaRzxZH6ieBZN0upyw+gHyxoRq2z4B+bh
 ERZKeEt/ikKiWPLxScBOP6phFBjnZEKaG+PAvnCyp2EzH/IAaOVZyyS15yi3oksaPmnr
 2ipQ==
X-Gm-Message-State: AOAM530L0u9rQJLBf3B5QC4Q/bPLCiWWDnUYIVGytHOq1h/QST6a03eu
 xtkCqZSjpQwrJwwHQ5QoGvW/i7RbHqMBi4jKWHMkKw==
X-Google-Smtp-Source: ABdhPJwYe8vigYXcMByrevi0OwR/kN2YxJA6FM2XW12gWf8cClb4DSfog3SkOReCZ1mwxl+af0XAvbwsQsN9d8Mqm6Q=
X-Received: by 2002:a50:8a89:: with SMTP id j9mr13799843edj.111.1644239110504; 
 Mon, 07 Feb 2022 05:05:10 -0800 (PST)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
In-Reply-To: <YcA7u3S6y63rHeua@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 7 Feb 2022 18:34:59 +0530
Message-ID: <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan,
>
> On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > Hi Sam,
> >
> > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > recent testing in i.MX8MM platform.
> > >
> > > Fix it.
> > >
> > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index eb475a3a774b..cf3f21f649cb 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > >         .num_modes = 1,
> > > -       .bpc = 6,
> > > +       .bpc = 8,
> >
> > Any response on this?
>
> I am too busy with other stuff at the moment to spend time on Linux
> stuff, but expect to re-surface sometime after xmas.

Any further comments?

Thanks,
Jagan.
