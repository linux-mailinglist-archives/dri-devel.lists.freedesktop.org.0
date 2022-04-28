Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40F513935
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 17:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2926110E741;
	Thu, 28 Apr 2022 15:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D6C10E741
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 15:58:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 107)
 id EADA968C4E; Thu, 28 Apr 2022 17:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_50
 autolearn=disabled version=3.3.1
Received: from blackhole.lan (p5b33fd5a.dip0.t-ipconnect.de [91.51.253.90])
 by verein.lst.de (Postfix) with ESMTPSA id D92C567373;
 Thu, 28 Apr 2022 17:58:05 +0200 (CEST)
Date: Thu, 28 Apr 2022 17:57:59 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] drm/bridge: fix anx6345 power up sequence
Message-ID: <20220428175759.13f75c21@blackhole.lan>
In-Reply-To: <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
References: <20220417181538.57fa1303@blackhole>
 <CA+E=qVeX2aU0hiDMxLXzVk-YiMsqKKFKpm=cc=72joMhZmNV1g@mail.gmail.com>
 <CA+E=qVdEtx8wVbcrMQYGB1ur1ykvNRp1L174mVSMkB0zeOPYNQ@mail.gmail.com>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, stable@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Apr 2022 17:25:57 -0700
Vasily Khoruzhick <anarsoul@gmail.com> wrote:

> On Sun, Apr 17, 2022 at 11:52 AM Vasily Khoruzhick
> <anarsoul@gmail.com> wrote:

> > The change looks good to me, but I'll need some time to actually
> > test it. If you don't hear from me for longer than a week please
> > ping me.
> 
> Your change doesn't fix the issue for me. Running "xrandr --output
> eDP-1 --off; xrandr --output eDP-1 --auto" in a loop triggers the
> issue pretty quickly even with the patch.

Nope, even that works fine here. Side question: how do you initially
power on the eDP bridge? Could there be any leftovers from that
mechanism? I use a hacked-up U-Boot with a procedure similar to the
kernel driver as fixed by this change.

But the main question is: does this patch in any way worsen the
situation on the pinebook?

	Torsten
