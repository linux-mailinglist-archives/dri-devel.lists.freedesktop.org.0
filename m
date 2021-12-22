Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9478047D7DF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901E610E1A7;
	Wed, 22 Dec 2021 19:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0994510E27B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:40:04 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1n07Sx-00053n-LH; Wed, 22 Dec 2021 20:39:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/22] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
Date: Wed, 22 Dec 2021 20:39:58 +0100
Message-ID: <8156864.jFcTpQmkuZ@diego>
In-Reply-To: <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211222104736.GZ6003@pengutronix.de>
 <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 22. Dezember 2021, 14:52:51 CET schrieb Rob Herring:
> On Wed, Dec 22, 2021 at 6:47 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > On Tue, Dec 21, 2021 at 10:31:23AM -0400, Rob Herring wrote:
> > > On Mon, Dec 20, 2021 at 12:06:16PM +0100, Sascha Hauer wrote:
> > > > "vpll" is a misnomer. A clock input to a device should be named after
> > > > the usage in the device, not after the clock that drives it. On the
> > > > rk3568 the same clock is driven by the HPLL.
> > > > To fix that, this patch renames the vpll clock to ref clock.
> > >
> > > The problem with this series is it breaks an old kernel with new dt. You
> > > can partially mitigate that with stable kernel backport, but IMO keeping
> > > the old name is not a burden to maintain.
> >
> > As suggested I only removed vpll from the binding document, but not from
> > the code. The code still handles the old binding as well.
> 
> The problem is updating rk3399.dtsi. That change won't work with old
> kernels because they won't look for 'ref'. Since you shouldn't change
> it, the binding needs to cover both the old and new cases.

is "newer dt with old kernel" really a case these days?

I do understand the new kernel old dt case - for example with the
dtb being provided by firmware.

But which user would get the idea of updating only the devicetree
while staying with an older kernel?



