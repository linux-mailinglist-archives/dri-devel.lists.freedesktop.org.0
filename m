Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDA2CAD4B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274D56E02B;
	Tue,  1 Dec 2020 20:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485BD6E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:28:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C52D72001F;
 Tue,  1 Dec 2020 21:28:34 +0100 (CET)
Date: Tue, 1 Dec 2020 21:28:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: panel: add flags to BOE NV110WTM-N61
Message-ID: <20201201202833.GA2040622@ravnborg.org>
References: <20201130182643.GA1497637@ravnborg.org>
 <CAD=FV=Ur+dENMpHHN7b=fahhtMFZ_BCDcr7cTDyPzZgn7rqbMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ur+dENMpHHN7b=fahhtMFZ_BCDcr7cTDyPzZgn7rqbMw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=DW601nYS4FH9a570c1EA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Dec 01, 2020 at 10:53:17AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 30, 2020 at 10:26 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > When applying a patch to add the BOE NV110WTM-N61 panel I forgot
> > to add the changes that added flags to drm_display_mode.
> 
> Sorry, I didn't mean to make more work for you!
> 
> 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Fixes: a96ee0f6b58d ("drm: panel: simple: Add BOE NV110WTM-N61")
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 216cde33b5c4..2d093b5a513c 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1367,6 +1367,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
> >                 .vsync_start = 800 + 3,
> >                 .vsync_end = 800 + 3 + 5,
> >                 .vtotal = 800 + 3 + 5 + 24,
> > +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> >         },
> >         {
> >                 .clock = 57500,
> > @@ -1378,6 +1379,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
> >                 .vsync_start = 800 + 3,
> >                 .vsync_end = 800 + 3 + 5,
> >                 .vtotal = 800 + 3 + 5 + 24,
> > +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> 
> I think you're off by 10 and a letter.
> 
> The subject talks about:
>   NV110WTM-N61
> 
> You're modifying the structs for:
>   NV101WXM-N51
> 
> I'm happy to post this if it's helpful to you, or I can review a v2
> from you.  :-)
Please do so, that would be very nice.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
