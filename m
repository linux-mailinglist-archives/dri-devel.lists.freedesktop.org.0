Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC07452D24
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22876F3DF;
	Tue, 16 Nov 2021 08:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1856F3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:50:32 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u74so40891385oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEjJ77+UyJwVlPULZ4jyz+pU/j+PKMrGW1TigVTD6KA=;
 b=VgSubul8sBxv+qgCERzD8MvC1scC+FnFNWf12Dg0QDssMijQSpkE6i6w/lPeVspc+W
 MFnDBjmo9VE7m0OdSirJbSOzmUdcSKmga7+4wYrFxUgV/2/nA8dD29g2dshb6tthUxww
 dSbPHdDxxbqyLUGRw9BYgsD/k4ZSw4Z4Mlr0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEjJ77+UyJwVlPULZ4jyz+pU/j+PKMrGW1TigVTD6KA=;
 b=FHEhEh7vYBVttW6REZF/1B3xHRjvxQLkFSmBrvw8l0VkI3z+7C1lSGx2M+cnhgN+KB
 U3kwJPXcuaERJOMrmId03YehRAJD6lz1rbfJrTP5t7cplJdfURCQxXRuknKHDxgu2HWq
 qP91XeIx6BzPqrj5UdGfXlnS905sa4I+sfXLbr859N8NSm81tNA0UhpplZwQnMEzaFlh
 60gkO0NeLopGaLVW2JFU9+M7HlqM38/+j1cpi0JhIj+DeWrJU9PNU42ae0bTYe8mJcxl
 hm83EbpjPcAtatnsFzVbQO4ivPYiVRuRjxmhE85H0Uvk0V04kxt8pkxb6kkLJB+sX2h+
 zGrA==
X-Gm-Message-State: AOAM530nIH/3hGvNeRm5ollcI0g4CqF2kKbV4pOZagmLcyebW/A2yyYd
 FrV6gftKGN9AjfX/CFgGibV5hJVanQM/4J2BX8dXK2mfFPo=
X-Google-Smtp-Source: ABdhPJxDVhU01pH2Yg3VeM0lg0LzD0oc91nPo2b/uM76zBNm/7ZeCVtJB6saqXlaUPaWtvcGeZnDgnsGxlkpVia2jhg=
X-Received: by 2002:a05:6808:118a:: with SMTP id
 j10mr51262797oil.101.1637052631363; 
 Tue, 16 Nov 2021 00:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20211115160135.25451-1-angus@akkea.ca> <87czn01odd.fsf@intel.com>
In-Reply-To: <87czn01odd.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Nov 2021 09:50:20 +0100
Message-ID: <CAKMK7uHVS-SSVHYy132NuaDfsEgF4SBa69rjSVT4zEm8PzSXJA@mail.gmail.com>
Subject: Re: [PATCH] drm: drm_probe_helper: add modes upto 1920x1080
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: kernel@puri.sm, David Airlie <airlied@linux.ie>,
 Angus Ainslie <angus@akkea.ca>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 9:44 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>
> Cc: Ville
>
> On Mon, 15 Nov 2021, Angus Ainslie <angus@akkea.ca> wrote:
> > Lots of monitors nowdays support more than 1024x768 so if the EDID is
> > unknown then add resolutions upto 1920x1080.
>
> IIUC it's supposed to be the fallback that's pretty much guaranteed to
> work. What's going to happen if we add 1920x1080 and it fails?

Yeah unless we are now in a times where monitors fail to light up
these very low resolutions then I don't think adding more here is a
good idea. This absolute fallback list is _not_ about making things
good, but about getting anything onto the screen. If we really, really
need this (and then it needs good reasons) then a defensive approach
might be to add more modes, but still leave the old 1024x768 as the
preferred one. That would avoid any regression potential.

Otherwise this just becomes a game of "I want to have the best mode
for my broken screen without working edid as the default", which is
no-go.
-Daniel

> BR,
> Jani.
>
> >
> > Signed-off-by: Angus Ainslie <angus@akkea.ca>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index e7e1ee2aa352..5ad66ae9916e 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -517,7 +517,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >
> >       if (count == 0 && (connector->status == connector_status_connected ||
> >                          connector->status == connector_status_unknown))
> > -             count = drm_add_modes_noedid(connector, 1024, 768);
> > +             count = drm_add_modes_noedid(connector, 1920, 1080);
> >       count += drm_helper_probe_add_cmdline_mode(connector);
> >       if (count == 0)
> >               goto prune;
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
