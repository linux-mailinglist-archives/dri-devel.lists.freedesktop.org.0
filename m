Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D33C2915
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C5D6EA57;
	Fri,  9 Jul 2021 18:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DF56EA14
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:37:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id b5f25ce5-e0e4-11eb-8d1a-0050568cd888;
 Fri, 09 Jul 2021 18:37:27 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7CED4194B04;
 Fri,  9 Jul 2021 20:37:30 +0200 (CEST)
Date: Fri, 9 Jul 2021 20:37:19 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
Message-ID: <YOiXXx8VwTi4BztF@ravnborg.org>
References: <20210524184226.3064621-1-jagan@amarulasolutions.com>
 <CAMty3ZDt8L70xHH5pMy0M-3ATt9jAXAy3VVeRV_iMkcoebn99w@mail.gmail.com>
 <CAMty3ZCm4rguiEba69EyZ6xaBROkTfWvsc6vvrJL7X7KusCGBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMty3ZCm4rguiEba69EyZ6xaBROkTfWvsc6vvrJL7X7KusCGBA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Fri, Jul 09, 2021 at 11:43:53PM +0530, Jagan Teki wrote:
> On Fri, Jul 2, 2021 at 10:58 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Sam and Thierry,
> >
> > On Tue, May 25, 2021 at 12:12 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
> > > recent testing in i.MX8MM platform.
> > >
> > > Fix it.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 9be050ab372f..6f4151729fb7 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
> > >  static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
> > >         .modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
> > >         .num_modes = 1,
> > > -       .bpc = 6,
> > > +       .bpc = 8,
> >
> > Can you pick this, if all okay.
> 
> Gentle Ping!
I have lost the original mail. Can you resend then I will review or
apply it.

	Sam
