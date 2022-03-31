Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5184EDC21
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4CD10F1C7;
	Thu, 31 Mar 2022 14:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295610F1C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:52:31 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 p4-20020a17090ad30400b001c7ca87c05bso2639860pju.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+77n4Cd+WgjOsrZvbRjH0euETUqRMnAVYODMjlpGGo=;
 b=w0uW4ZykK3wI1+jxb+RyulUySC/g95wKU/FS2/NZGf1M783LZ78ueeoZp6ISw8XQvR
 ZB5WTh2PqXKa/Zqjj+nk4uGFWBIb6ZOopo3A6yTVcgTfAqIN81CV6k9famSEvduY8Ru3
 8kkCIl6CyyWRpGfRko3ksgBbulKDnpbA/2o6DG4crs8FhAsA+2O4MfroFxYJh4SI6B6J
 oaGNSs1zWOS8S3zQKdlKwTYPFiyHJBJne838nGDfkHB/QZcceECgSMB422UhTtftLLHd
 cIjTjsi0O9SiZkJ+YPwAI2k4p1VMzrP5Qj7kaStBbuOj1FQGLHPBBRPZbews8ieJgqkK
 WYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+77n4Cd+WgjOsrZvbRjH0euETUqRMnAVYODMjlpGGo=;
 b=FcgButGIoN9TyW8nqOdwB+iyysjOvLCyWKA6ZOQycT9vSJd5yqHb5HWipD0waXE4jZ
 avlPlA+BetfIVAfql3az6e6vI6wQrKVGJXn1Kazp4oNXCpyn4eddcU5I8NQaq076mdOK
 2QWAVR7nJFlqizEdWKvWoz/p7tXhu5XD7/Rs1ZamlsXI2S+zNlfJoXJAz0IxupkkFPK8
 pWdiWqxgSQZeRR7PNn5UE1iwBJBOcLmbgo9f1wElCSXuJcSbxuC282btTXvOk6OpJh8N
 HB8AmKdXh58vk0hRN9vhL+WpEbJqGqSA22eWq+RW60ZaZplazKPo4sCzCzajV1nDpNUl
 1xbA==
X-Gm-Message-State: AOAM530GU+q2izVcFLPqTkfVxvVHizEf9vkUIw9U+/2eZ0FuBF2TSiAM
 zAcViEtQFDsgCZDxE54cZG7fSro6S8TXIA5vpJSfKCZp9V0=
X-Google-Smtp-Source: ABdhPJzFavQebLLdkl+Pgj6UuUntll7v1hKUSNTamNClpXkkZOgTdJ6taVDGKjsJ8x/q/vYPn5SnmTbbY2vGYgt0P1o=
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr5162021pls.65.1648738351513; Thu, 31
 Mar 2022 07:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
 <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
 <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
 <CAMty3ZDZunQ6J4cwHSDT3uEKEdR3QDEbve6ec=EGG2iYirWGtg@mail.gmail.com>
In-Reply-To: <CAMty3ZDZunQ6J4cwHSDT3uEKEdR3QDEbve6ec=EGG2iYirWGtg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 16:52:20 +0200
Message-ID: <CAG3jFys2WZ8AuNBZBPqDbWU-vPo1ngvzc6wW=MLy13aFBKLRcw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 16:50, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> + Robert
>
> On Tue, Feb 22, 2022 at 12:17 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > On Mon, Feb 7, 2022 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Hi Sam,
> > >
> > > On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > >
> > > > Hi Jagan,
> > > >
> > > > On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > > > > Hi Sam,
> > > > >
> > > > > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > > >
> > > > > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > > > > recent testing in i.MX8MM platform.
> > > > > >
> > > > > > Fix it.
> > > > > >
> > > > > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > index eb475a3a774b..cf3f21f649cb 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > > > > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > > > > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > > > > >         .num_modes = 1,
> > > > > > -       .bpc = 6,
> > > > > > +       .bpc = 8,
> > > > >
> > > > > Any response on this?

Reviewed-by: Robert Foss <robert.foss@linaro.org>
