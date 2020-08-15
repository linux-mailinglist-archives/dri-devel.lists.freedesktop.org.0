Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652E2451D5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AD86E0B7;
	Sat, 15 Aug 2020 21:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE396E0B7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:09:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CC94680540;
 Sat, 15 Aug 2020 23:09:32 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:09:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/5] drm/panel: samsung: Use dev_ based logging
Message-ID: <20200815210931.GB1242831@ravnborg.org>
References: <20200815125406.1153224-1-sam@ravnborg.org>
 <20200815125406.1153224-2-sam@ravnborg.org>
 <CACRpkdYhYUJGXgHfqsMPoQXPpBma4jOLyEB=wOPXY09RMsVq3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYhYUJGXgHfqsMPoQXPpBma4jOLyEB=wOPXY09RMsVq3A@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=ze386MxoAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=Igz15Yc0uS9Mdv-RYuMA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=iBZjaW-pnkserzjvUTHh:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 09:23:59PM +0200, Linus Walleij wrote:
> On Sat, Aug 15, 2020 at 2:54 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> =

> > Standardize on the dev_ based logging and drop the include of drm_print=
.h.
> > Fix a few cases where "x@" was used when printing the mode.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Guido G=FCnther <agx@sigxcpu.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> =

> At one point I was told to not use dev_* but use DRM_DEV*
> macros instead. "OK the DRM people want it this way, no
> big deal."
That could have been me, sorry!

> But I'd rather do it like this so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
