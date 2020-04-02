Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FC19C1D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 15:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1261B6EA89;
	Thu,  2 Apr 2020 13:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6C16EA8B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 13:13:15 +0000 (UTC)
IronPort-SDR: MUHdhbijDgeb9+Z1HmCpLPeP/xpdmSJ/fHc4A4WTKcVCKVSVseSbnHxUSeCy857g6y+N0QVxkA
 JYqQfXL4aONw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 06:13:14 -0700
IronPort-SDR: oycpBmIeL8Aolm8xaeSxgyKLWhkhgilFqq/3EG2Y8ZJAHSWCy31ZfgBruDftT4vZR/W70hI3/e
 11oRgzrDnyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; d="scan'208";a="243058094"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 02 Apr 2020 06:13:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Apr 2020 16:13:10 +0300
Date: Thu, 2 Apr 2020 16:13:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH 05/33] drm/panel-leadtek-ltk500hd1829: Fix dotclock
Message-ID: <20200402131310.GU13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-6-ville.syrjala@linux.intel.com>
 <175919560.moPVmXkzvO@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175919560.moPVmXkzvO@diego>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 01:52:27PM +0100, Heiko Stuebner wrote:
> Hi,
> =

> Am Montag, 2. M=E4rz 2020, 21:34:24 CET schrieb Ville Syrjala:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> The values came that way from the vendor .
> And lookin at other Leadtek display datasheets, 60Hz should be the
> correct refresh rate.
> =

> The display is also running happily at the 69MHz of
> your patch, so
> =

> Tested-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Thanks for confirming.

I think this patch the last one with a huge difference between
vrefresh and clock. So once this goes in I'm thinking of declaring
the remaining patches as not important and pushing ahead with the
mode dieting. Can someone ack this so I can get it in?

> Heiko
> =

> > =

> > Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drive=
rs/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > index 76ecf2de9c44..113ab9c0396b 100644
> > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > @@ -377,7 +377,7 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_end	=3D 1280 + 30 + 4,
> >  	.vtotal		=3D 1280 + 30 + 4 + 12,
> >  	.vrefresh	=3D 60,
> > -	.clock		=3D 41600,
> > +	.clock		=3D 69217,
> >  	.width_mm	=3D 62,
> >  	.height_mm	=3D 110,
> >  };
> > =

> =

> =

> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
