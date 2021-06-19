Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AA3ADBC3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 23:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587F86E051;
	Sat, 19 Jun 2021 21:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3FB6E051
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 21:10:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id d9baea3a-d142-11eb-a36f-0050568cd888;
 Sat, 19 Jun 2021 21:11:01 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 11E31194B13;
 Sat, 19 Jun 2021 23:10:51 +0200 (CEST)
Date: Sat, 19 Jun 2021 23:10:45 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] drm/atmel-hlcdc: Allow async page flips
Message-ID: <20210619211045.GA603275@ravnborg.org>
References: <20210330151721.6616-1-dan.sneddon@microchip.com>
 <20210409105816.cfffdr3edzi4yntm@sekiro>
 <088b0446-85c2-2d87-0439-a0cc14772c6a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <088b0446-85c2-2d87-0439-a0cc14772c6a@microchip.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Dan Sneddon - C50748 <Dan.Sneddon@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches - M43218 <Ludovic.Desroches@microchip.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas, Dan

On Tue, May 25, 2021 at 11:29:15AM +0200, Nicolas Ferre wrote:
> On 09/04/2021 at 12:58, Ludovic Desroches - M43218 wrote:
> > On Tue, Mar 30, 2021 at 08:17:20AM -0700, Dan Sneddon wrote:
> > > The driver is capable of doing async page flips so we need to tell the
> > > core to allow them.
> > > 
> > > Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>
> > Tested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> 
> Sam,
> 
> Do you need more from us or can you queue this patch (aka "ping")?

Thanks, patch pushed to drm-misc-fixes.
If there are more atmel-hlcdc patches pending please resend as I have
pruned my inbox.

	Sam
