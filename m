Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF947A5D3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 09:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247F10F787;
	Mon, 20 Dec 2021 08:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019D810F79F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 08:15:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 1ff94cb3-616d-11ec-ac19-0050568cd888;
 Mon, 20 Dec 2021 08:16:25 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3776E194B61;
 Mon, 20 Dec 2021 09:16:00 +0100 (CET)
Date: Mon, 20 Dec 2021 09:15:55 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 AM-1280800N3TZQW-T00H
Message-ID: <YcA7u3S6y63rHeua@ravnborg.org>
References: <20211111094103.494831-1-jagan@amarulasolutions.com>
 <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMty3ZD1B1P5t3CxUMUDQdfJu8Q=oQWqJ+AE1Ka0AQ7+f2yNMA@mail.gmail.com>
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

Hi Jagan,

On Sun, Dec 19, 2021 at 10:10:10PM +0530, Jagan Teki wrote:
> Hi Sam,
> 
> On Thu, Nov 11, 2021 at 3:11 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > AM-1280800N3TZQW-T00H panel support 8 bpc not 6 bpc as per
> > recent testing in i.MX8MM platform.
> >
> > Fix it.
> >
> > Fixes: bca684e69c4c ("drm/panel: simple: Add AM-1280800N3TZQW-T00H")
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index eb475a3a774b..cf3f21f649cb 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -719,7 +719,7 @@ static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
> >  static const struct panel_desc ampire_am_1280800n3tzqw_t00h = {
> >         .modes = &ampire_am_1280800n3tzqw_t00h_mode,
> >         .num_modes = 1,
> > -       .bpc = 6,
> > +       .bpc = 8,
> 
> Any response on this?

I am too busy with other stuff at the moment to spend time on Linux
stuff, but expect to re-surface sometime after xmas.

	Sam
