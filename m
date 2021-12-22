Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA647D334
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 14:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5259510E16B;
	Wed, 22 Dec 2021 13:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB1910E16B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:53:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3876DB81C4C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE904C36AE5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640181186;
 bh=/KzC2xyljtBoaNohEViyGh73ITduqs9Zk/DPszDRrQU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ia0pPt+rlVudpSPeHSpHCLgV00gTuEfnWtKEjzAFbb6CM9b0qDILrebPBuXhlNuak
 wGvfSvBs57gdp/KhjOStDSWAgqqMrnVAdsbH/LXwLeFRwfsYmK6zLMDlNZAEemRiJS
 ax6V+Wi2KgPrXWXJJUBTJIJcIimLzYSDx5ijlmM1FGEPxfkXTd8QHqY4NXF/bBz14v
 3pKjq6AoMlGOTfH1GsIe69/PNgOG9DXTQZx/WLys7AVjLZZXcl/28TmHI6ahLeInOw
 rf2+BdwkV1FYd9yEax9JV6MTi7IJBrHfqoDgFsHvvW5aRU1K5dVJ0hDkDARC2lc/8a
 ux5/LJ5+MMpGg==
Received: by mail-ed1-f52.google.com with SMTP id j6so8878990edw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 05:53:05 -0800 (PST)
X-Gm-Message-State: AOAM533HYF9k1DQFiBhnSufUoey80dl1DUg/V9WOgHnbiqvdsCYlFkCw
 S8LMD8DH4JJLtSKG/WPlLxI/N72LKdlDpgiMgA==
X-Google-Smtp-Source: ABdhPJwLfi+vd0gUpA9WEffP9MKdcCMUgOls/PZATt71sVDW2zlwKzs9m5myZYELczFdRRkgPlO3+bbg0IhlzRSpnbM=
X-Received: by 2002:a05:6402:350a:: with SMTP id
 b10mr3000857edd.89.1640181184247; 
 Wed, 22 Dec 2021 05:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-9-s.hauer@pengutronix.de>
 <YcHlO/m/tGEEMnX9@robh.at.kernel.org>
 <20211222104736.GZ6003@pengutronix.de>
In-Reply-To: <20211222104736.GZ6003@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Dec 2021 09:52:51 -0400
X-Gmail-Original-Message-ID: <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
Message-ID: <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
Subject: Re: [PATCH 08/22] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Dec 22, 2021 at 6:47 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Tue, Dec 21, 2021 at 10:31:23AM -0400, Rob Herring wrote:
> > On Mon, Dec 20, 2021 at 12:06:16PM +0100, Sascha Hauer wrote:
> > > "vpll" is a misnomer. A clock input to a device should be named after
> > > the usage in the device, not after the clock that drives it. On the
> > > rk3568 the same clock is driven by the HPLL.
> > > To fix that, this patch renames the vpll clock to ref clock.
> >
> > The problem with this series is it breaks an old kernel with new dt. You
> > can partially mitigate that with stable kernel backport, but IMO keeping
> > the old name is not a burden to maintain.
>
> As suggested I only removed vpll from the binding document, but not from
> the code. The code still handles the old binding as well.

The problem is updating rk3399.dtsi. That change won't work with old
kernels because they won't look for 'ref'. Since you shouldn't change
it, the binding needs to cover both the old and new cases.

Rob
