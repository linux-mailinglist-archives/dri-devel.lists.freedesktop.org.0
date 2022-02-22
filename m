Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047644BF236
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807010ED90;
	Tue, 22 Feb 2022 06:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5C10ED31
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:47:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a23so39630601eju.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsRSMGXVH8DOLUmw+Tt0abErU8aMnNC+VQ3me4rwHQE=;
 b=Sh1m+c3uirNJn1P4wT6eXPS6PiKzBavkjdE5IwE6BaEXggtW0rH0liNNZK1CBJfhqK
 Sv3YhgfXbinLVRH7b8uK/LFvfi2jWdGHSCXTPUBHA4k0S/8fO6832Ht++uRq9CSVl1gc
 kb2TpzGsXl/Yar7yefxUsvk6yzyppS2Dskeb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsRSMGXVH8DOLUmw+Tt0abErU8aMnNC+VQ3me4rwHQE=;
 b=oED/+zWZNowuOxRxccYUWWf/6u1uER+lwzjdagXYeFC6f0p+9D5HP6/IiQI/xFqHbL
 QrWD3c4eEKH5bDWVGe5um/wSY1lFXnrgLNGMomXxVFVPctsOpRN0TIbydn+7aMHZFeNK
 DyhVQYG0ruCeXHY8q/2DBiSFbX+IxMUPqFfAmKVNFck02mjpwl5b+OLMASe/IpIb05Ov
 SgkWJz1/23KLxHo0/oWDBEoEp2Txi0n4bMTmhMfW8OMQg0txtdHUp5VR42Sk2WJXh0K7
 zSOqfwlzPIZrnWHxQztewU+Q+MosbeUaol2apWzdsQu60SHkroKepdp3VKvp9xyDkt7Q
 DaWg==
X-Gm-Message-State: AOAM530FfZvGF3n7+Gh1EbxXb/DPjGKi90b4Ojpt8KmyO/cAX3u4uUBc
 6G+vqz7i6OTQOXcB0uTNgkXXb7j4NkJaMEFlPkOImw==
X-Google-Smtp-Source: ABdhPJzMnAZeDNYp1UDbfSrij+4/JEt4F94OvKYBTDuA9IRAH0IvVDSifURCNqd2YvchXT0dCoWolSmHtuFwkaAs4SY=
X-Received: by 2002:a17:906:b1d0:b0:6cf:7f39:50e0 with SMTP id
 bv16-20020a170906b1d000b006cf7f3950e0mr19225621ejb.760.1645512475316; Mon, 21
 Feb 2022 22:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
 <YcA7u3S6y63rHeua@ravnborg.org>
 <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
In-Reply-To: <CAMty3ZCWH=mBi0Uak74ztdB=j81urRZaa=Xse+hVYCbHoJidNA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 22 Feb 2022 12:17:44 +0530
Message-ID: <CAMty3ZC1O9Se+cMbYkVhAKDdv6VG_JEizP_Wht3sBg9QuV=NWA@mail.gmail.com>
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

On Mon, Feb 7, 2022 at 6:34 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Sam,
>
> On Mon, Dec 20, 2021 at 1:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Jagan,
> >
> > On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> > > Hi Sam,
> > >
> > > On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > >
> > > > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > > > recent testing in i.MX8MM platform.
> > > >
> > > > Fix it.
> > > >
> > > > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index eb475a3a774b..cf3f21f649cb 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> > > >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> > > >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> > > >         .num_modes = 1,
> > > > -       .bpc = 6,
> > > > +       .bpc = 8,
> > >
> > > Any response on this?
> >
> > I am too busy with other stuff at the moment to spend time on Linux
> > stuff, but expect to re-surface sometime after xmas.
>
> Any further comments?

Gentle Ping.
