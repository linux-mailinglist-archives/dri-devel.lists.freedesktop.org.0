Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E24E2558
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36610E313;
	Mon, 21 Mar 2022 11:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C41E10E313
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 11:40:52 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c2afb48c-a90b-11ec-8da1-0050568c148b;
 Mon, 21 Mar 2022 11:40:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 75829194B42;
 Mon, 21 Mar 2022 12:40:52 +0100 (CET)
Date: Mon, 21 Mar 2022 12:40:46 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
Message-ID: <YjhkPnr46IOy5iS+@ravnborg.org>
References: <20220311170240.173846-1-cbranchereau@gmail.com>
 <20220311170240.173846-3-cbranchereau@gmail.com>
 <YjD1rl7jSxLvJhfL@ravnborg.org>
 <CAFsFa87NBB8VFFHJKjyPi+A255i9dyE-xxTggz3kLcEXmSWJXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFsFa87NBB8VFFHJKjyPi+A255i9dyE-xxTggz3kLcEXmSWJXg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

> > > +     { 0x0d, 0x58 },
> > > +     { 0x0e, 0x48 },
> > > +     { 0x0f, 0x38 },
> > > +     { 0x10, 0x2b },
> > > +
> > > +     { 0xff, 0x30 },
> > > +     { 0xff, 0x52 },
> > > +     { 0xff, 0x00 },
> > > +     { 0x36, 0x0a },
> > > +};
> > There are some random (?) empty lines.
> > If they have any significance then a short comment would be nice.
> > If not, then drop the empty lines.
> >
> 
> The empty lines are not random no, to access a different page in the
> init, one must write i.e.   { 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff,
> 0x02 }, to access page 2, so they add a little bit of readability.
Then I suggest to just say what page is is like:

	/* Page 1 */
	{ 0xff, 0x30 },
	...

Etc. then it is obvious this is page boundaries.

	Sam
