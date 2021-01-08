Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1942EF085
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 11:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78C899F0;
	Fri,  8 Jan 2021 10:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE37899F0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 10:17:41 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxopt-0008R4-RV; Fri, 08 Jan 2021 11:17:37 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxopo-0007ev-2X; Fri, 08 Jan 2021 11:17:32 +0100
Message-ID: <8a37aaa3bd4d2b032f45cbab998943e6a7f5c086.camel@pengutronix.de>
Subject: Re: linux-next: Tree for Jan 7
 (drivers/gpu/drm/imx/parallel-display.o)
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 08 Jan 2021 11:17:32 +0100
In-Reply-To: <CAKMK7uGP6tmmSx8jFcGK_kLDYQO6PBy-TYMEj=WWh5VRTJ7cFQ@mail.gmail.com>
References: <20210107140103.0cca6432@canb.auug.org.au>
 <e1042fe6-10e9-b62c-fae9-0d3b66e42866@infradead.org>
 <CAKMK7uGP6tmmSx8jFcGK_kLDYQO6PBy-TYMEj=WWh5VRTJ7cFQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-01-08 at 10:03 +0100, Daniel Vetter wrote:
> On Fri, Jan 8, 2021 at 9:55 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 1/6/21 7:01 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20210106:
> > > 
> > 
> > on x86_64:
> > 
> > ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
> > parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'
>
> Probably something in the pull from philipp that I just merged
> yesterday.

That is likely, although I'm not quite sure how that activated, the
of_get_drm_display_mode call was there before.

> Philip, can you pls take care?
> -Daniel

Thank you for the notice, since the of_get_drm_display_mode() is only
for legacy device trees I'd like to stub it out and keep compile test
coverage:

https://lore.kernel.org/dri-devel/20210108101343.23695-1-p.zabel@pengutronix.de/T/#u

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
