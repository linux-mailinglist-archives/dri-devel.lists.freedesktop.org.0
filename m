Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A6225D05
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733626E33F;
	Mon, 20 Jul 2020 11:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375F96E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 11:01:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7C830804BA;
 Mon, 20 Jul 2020 13:01:13 +0200 (CEST)
Date: Mon, 20 Jul 2020 13:01:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 0/19] backlight: backlight updates
Message-ID: <20200720110112.GA147689@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
 <20200720093601.GA3368211@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720093601.GA3368211@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=fxJcL_dCAAAA:8 a=xWK_zBApGLd1q-zgG6wA:9
 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee.

On Mon, Jul 20, 2020 at 10:36:01AM +0100, Lee Jones wrote:
> On Sun, 19 Jul 2020, Sam Ravnborg wrote:
> 
> > Hi all.
> > 
> > Follow-up on v4 - with only a few changes listed below and
> > in the individual patches.
> > Thanks for all the reviews and the feedback on the patches!
> > 
> > I am planning a follow-up on this patchset to update the
> > backlight drivers all over to use backlight_get_brightness()
> > and backlight_is_blank() as appropriate.
> 
> [...]
> 
> > Sam Ravnborg (19):
> >       backlight: refactor fb_notifier_callback()
> >       backlight: add backlight_is_blank()
> >       backlight: improve backlight_ops documentation
> >       backlight: improve backlight_properties documentation
> >       backlight: improve backlight_device documentation
> >       backlight: document inline functions in backlight.h
> >       backlight: document enums in backlight.h
> >       backlight: remove the unused backlight_bl driver
> >       backlight: drop extern from prototypes
> >       backlight: add overview and update existing doc
> >       backlight: wire up kernel-doc documentation
> >       backlight: introduce backlight_get_brightness()
> >       backlight: as3711_bl: simplify update_status
> >       backlight: cr_bllcd: introduce gpio-backlight semantics
> >       backlight: gpio_backlight: simplify update_status()
> >       backlight: jornada720_bl: introduce backlight_is_blank()
> >       backlight: use backlight_get_brightness()
> >       backlight: drop backlight_put()
> >       backlight: make of_find_backlight static
> 
> All applied, but to be honest, that was quite painful.
That was not the intention :-(

> 
> A few notes for subsequent patches.
> 
>  - Enable spell-checkers in your editors
>    - I fixed the issues up for you here - there were quite a few!
>  - Run ./checkpatch.pl before submitting - here's what I find useful
>    * .git/hooks/post-commit: https://pastebin.ubuntu.com/p/WpPFd6M2rB/
>  - Please keep the in-patch changelog below the '---' line, so that it
>    does not end up in the final commit log
>  - Cc: lines *above* the *-bys please
>  - Cc: lines dropped for any *-bys provided
>  - Lines wrapped ~72 chars (not 50)
>  - One whole empty line spacing between paragraphs
>  - Ensure you use the formatting expected of the subsystem - in the
>    case of Backlight it's:
> 
>      <subsystem>: <file>: Subject beginning with an upper-case char
> 
>    A `git log --oneline -- subsystem` would give you a good idea of
>    what's expected.

Thanks for the input - I will use these points as guideline for the next
batch of backlight patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
