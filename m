Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B816047D80D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3171210E293;
	Wed, 22 Dec 2021 19:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50710E293
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:57:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3886461CC9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974FAC36AE8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640203031;
 bh=vo+ANnKfigzQzAo0jwVxZr3VvLPILGV+V4D2g0cDOJo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HHxrgtCPmPXHz+fCsXIxU9gvKpwFtUl+/sSit1hSB20LIHQ0CwUG3DRvyzyF/+Xtl
 azm9i3QIznjWoESMqSvLxexoV8svAkhCsYMXGAi8pOSW5oiuIAxNwdp1ec72dJVz8G
 MLrDwB1cidAo4xb9BWLkgAd3zHcnWF6FI/si3e/ldQGCmUms38Y+sPqNbIkRAlUPiy
 G2RKLFyVo5Q6wd19UREl48K9GCiAQl/39sD6uTfngJMKMGOtDtuB4pxLarScPqU3eQ
 XLvJxu9SZ9h7oJfIzvWhiMZEA0X3f7yHru9faCoNYn9F+kk042poC7ta0bMs4QQcvu
 XxSoT5DsqB9Nw==
Received: by mail-ed1-f48.google.com with SMTP id j6so12707305edw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:57:11 -0800 (PST)
X-Gm-Message-State: AOAM533qtlU0xzDnY4rmQaEub9JgXKWkW2850hbHtKmoQQJxVYazG+pd
 yyf8xegUfRnA6zPpnnhgrf4jos3C5m9S192tHw==
X-Google-Smtp-Source: ABdhPJzwsbCZWdVn8cOcu5PGCVl4Axi+Ni8kjsGL4ubCS8dZgY8gPy7zwXj1bZMZYLolMdf6vi/pSdQRIPwxu9a9uQc=
X-Received: by 2002:a17:906:229b:: with SMTP id
 p27mr3667056eja.264.1640203029841; 
 Wed, 22 Dec 2021 11:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211222104736.GZ6003@pengutronix.de>
 <CAL_Jsq+jhaE7DWNu1=n9JX+oNp8XRW7mNi--8moDU6RYNyBgBw@mail.gmail.com>
 <8156864.jFcTpQmkuZ@diego>
In-Reply-To: <8156864.jFcTpQmkuZ@diego>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Dec 2021 15:56:57 -0400
X-Gmail-Original-Message-ID: <CAL_JsqJqXHcSQEw9rz1PDk++WUf_Pgh7S09Z2UGOQUxvT6ftGA@mail.gmail.com>
Message-ID: <CAL_JsqJqXHcSQEw9rz1PDk++WUf_Pgh7S09Z2UGOQUxvT6ftGA@mail.gmail.com>
Subject: Re: [PATCH 08/22] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 3:40 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 22. Dezember 2021, 14:52:51 CET schrieb Rob Herring:
> > On Wed, Dec 22, 2021 at 6:47 AM Sascha Hauer <s.hauer@pengutronix.de> w=
rote:
> > >
> > > On Tue, Dec 21, 2021 at 10:31:23AM -0400, Rob Herring wrote:
> > > > On Mon, Dec 20, 2021 at 12:06:16PM +0100, Sascha Hauer wrote:
> > > > > "vpll" is a misnomer. A clock input to a device should be named a=
fter
> > > > > the usage in the device, not after the clock that drives it. On t=
he
> > > > > rk3568 the same clock is driven by the HPLL.
> > > > > To fix that, this patch renames the vpll clock to ref clock.
> > > >
> > > > The problem with this series is it breaks an old kernel with new dt=
. You
> > > > can partially mitigate that with stable kernel backport, but IMO ke=
eping
> > > > the old name is not a burden to maintain.
> > >
> > > As suggested I only removed vpll from the binding document, but not f=
rom
> > > the code. The code still handles the old binding as well.
> >
> > The problem is updating rk3399.dtsi. That change won't work with old
> > kernels because they won't look for 'ref'. Since you shouldn't change
> > it, the binding needs to cover both the old and new cases.
>
> is "newer dt with old kernel" really a case these days?

I've had complaints about it. In particular from SUSE folks that were
shipping new dtbs with old (stable) kernels.

> I do understand the new kernel old dt case - for example with the
> dtb being provided by firmware.

Yes, so update your firmware that contains a newer dtb and then you
stop booting or a device stops working.

> But which user would get the idea of updating only the devicetree
> while staying with an older kernel?

Any synchronization between firmware and OS updates is a problem.

Rob
