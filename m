Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA379313081
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7296E88F;
	Mon,  8 Feb 2021 11:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs48.siol.net [185.57.226.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5508A6E88F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 11:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id AFB935220A4;
 Mon,  8 Feb 2021 12:19:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id cBk2nonlnVtu; Mon,  8 Feb 2021 12:19:00 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 63D4F522137;
 Mon,  8 Feb 2021 12:19:00 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id BAF935220A4;
 Mon,  8 Feb 2021 12:18:58 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: linux-sunxi@googlegroups.com
Subject: Re: Re: [linux-sunxi] [PATCH 4/5] drm/sun4i: Fix H6 HDMI PHY
 configuration
Date: Mon, 08 Feb 2021 12:18:58 +0100
Message-ID: <2739213.CQdApTN3EZ@kista>
In-Reply-To: <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-5-jernej.skrabec@siol.net>
 <CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo=teQ@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, wens@kernel.org,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 05. februar 2021 ob 04:22:56 CET je Chen-Yu Tsai napisal(a):
> On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> >
> > cpce value for 594 MHz is set differently in BSP driver. Fix that.
> >
> > Fixes: c71c9b2fee17 ("drm/sun4i: Add support for Synopsys HDMI PHY")
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Thanks, but I figured that this change is not the proper one. It still gives me 
issues with my TV. Proper change is to fix current and voltage settings below. 
I'll replace this patch in v2.

Best regards,
Jernej

> 
> -- 
> You received this message because you are subscribed to the Google Groups 
"linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an 
email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/
linux-sunxi/
CAGb2v64BpizczmSJdompGosFwWWayNscWvW-7oARLgwNNo%3DteQ%40mail.gmail.com.
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
