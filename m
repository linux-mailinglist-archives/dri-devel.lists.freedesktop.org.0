Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CA12E89F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 17:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87A6E118;
	Thu,  2 Jan 2020 16:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441C46E118
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 16:21:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id ECD25804DA;
 Thu,  2 Jan 2020 17:21:35 +0100 (CET)
Date: Thu, 2 Jan 2020 17:21:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/6] fixes for atmel-hlcdc
Message-ID: <20200102162134.GA13454@ravnborg.org>
References: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
 <20200102090554.GB29446@ravnborg.org> <20200102160534.GJ22390@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102160534.GJ22390@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=sy_eDPmhS6KF6TahjTwA:9 a=CjuIK1q_8ugA:10
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
Cc: alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 dri-devel@lists.freedesktop.org, peda@axentia.se, boris.brezillon@bootlin.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee.

> > >   ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")
> > > 
> > > Claudiu Beznea (5):
> > >   drm: atmel-hlcdc: use double rate for pixel clock only if supported
> > >   drm: atmel-hlcdc: enable clock before configuring timing engine
> > 
> > >   mfd: atmel-hlcdc: add struct device member to struct
> > >     atmel_hlcdc_regmap
> > >   mfd: atmel-hlcdc: return in case of error
> > 
> > Would it be OK to apply the to drm-misc-next, or shal they go in via
> > your mfd tree?
> 
> How are they related to the other patches?  Do they have build-time
> dependencies on any of the other patches, or vice versa? 
No build time dependencies.

But from the description of "atmel-hlcdc: return in case of error":
"
For HLCDC timing engine configurations bit ATMEL_HLCDC_SIP of
ATMEL_HLCDC_SR needs to be polled before applying new config.
"
I get that changing timing for the HLCDC may fail if these
patches are not applied.
So it is only to have updated hlcdc support in drm-misc-next
for further testing.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
