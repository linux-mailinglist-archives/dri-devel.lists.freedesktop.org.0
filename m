Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C4455853
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9556E928;
	Thu, 18 Nov 2021 09:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2036E928
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:53:24 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id u60so16259638ybi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 01:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MSn2l1CqdA8yauQEkr9Er3RNk6u1ntHr6p1PYu6dVHg=;
 b=dDOwOtPhdIx/Z6wlXdmhq5eHw+zn3sTxhiwhM8bwK0qsSjMrv87LuWgGjB+hvBF1gO
 KAkU4dZQDEFk8bJ9kl6vT0RtgwW37qkbVh+eqDqShAqujemCxqj74rDSFOBDnmtMWJfd
 Wa59tfUQ5Xt1k1lQBQPszUiMcZ8ao42aLt6J7mAsB9DeGD6VmaRQyzfWXIkDmTKD0+A5
 HuGxufiKqxsqU7yk2T68PV36jEw8yr4m0iDPwjA/OGi7c47YWvqgmbA4uEu7zu55DZNI
 FNJyOcN0GkcuA17E+CIwIzaGXX2Jj3HFsgE8Oi1Na2jK+jRhYQUYpjc4fBnvrmcOh9cL
 tS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MSn2l1CqdA8yauQEkr9Er3RNk6u1ntHr6p1PYu6dVHg=;
 b=vLQ7NG4E8IHD5vI0FgkhhPEm6vGOsZG5A1EPYVcLNKXDY6NKMZTPMKAwGOOVe52wYN
 1KzO40RRDxGFhPrTJNiAWffuwrmv9EuallAEK/24w3QMImvofdpmoOQzHACP/uHqnTgO
 gagHBFiCT5sU5tAVT18lI+ubXSKZq4zNpKS7pWIxaz7V2rdGJtpg1dKGl8KEyV/ApeMP
 S4i7tmnn78MWB9K9LWaQhmHcxMbKrvBtcZk3/e6a3FyUYbxU8GQvhSpGHD4ERvVMOy81
 KTqDOvIwnL4tYyDtpWCvGgKFG1cA5p7EBZjvBETNtcrEPUvR6el/ICe0lCt+Ak3/cxuo
 2JaQ==
X-Gm-Message-State: AOAM530IV/qbK6yLOWZB5pX/Z4aDgBYTCW2AYZIr9uL2C7RBppUk57Jj
 Ok6CM7r7BtTMAcpJEHIs051EiCdR/K4yv25SvPdwtw==
X-Google-Smtp-Source: ABdhPJzWC+pD/mBRLS7w06KhnNT4hJCKzQOj9GIHlCC3obzrQKAOBWZGePiBMEvH6LBikSDUuXIczk0NDRtKOW5Pp9o=
X-Received: by 2002:a25:73d0:: with SMTP id o199mr24604313ybc.87.1637229203749; 
 Thu, 18 Nov 2021 01:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
 <4310886.V3yF0ifEZO@diego>
In-Reply-To: <4310886.V3yF0ifEZO@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Nov 2021 09:53:11 +0000
Message-ID: <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Kever Yang <kever.yang@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 18 Nov 2021 at 09:26, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Donnerstag, 18. November 2021, 02:27:10 CET schrieb Kever Yang:
> > I don't agree with this, we do believe you have do some clean up to mee=
t
> > the requirement
> >
> > of upstream, but all the framework and feature implement are from
> > Rockchip engineer,
> >
> > we have made a great effort to make everything work which block us to
> > upstream this driver for now.
>
> I don't fully understand what you mean here (language barrier probably),
> but dropping non-essential functionality in a first round is pretty commo=
n
> to at least get basic functionality working for everyone. With the specia=
l
> features getting added again in later patches over time. This happenened
> on the old vop as well.
>
> And of course, having a kernel that can "just" do normal graphics without
> the additional features is still preferable over having _NO_ graphics sup=
port
> at all ;-)
>
> > NAK for this series.
>
> As you might've seen from previous graphics related patches, there
> is a big number of people _and companies_ that seems to want/need
> to work with the rk3566/rk3568 with a kernel based on mainline.
>
> --> Most likely even in real products!

Yes, we've been trying to ship a real product based on RK356x. We
started by using the vendor VOP2 driver, but it is broken beyond
belief. The driver needs a fundamental ground-up rework, and all the
additional features get in the way of doing this core rework to make
it actually function correctly.

So, NAK to the NAK. I would like to see the VOP2 support start simple,
with more features being added one by one.

> While Rockchip did say that they want to upstream VOP2 support, there
> has been _NO_ movement or even information at all on this over at least
> the last year(!), so it's pretty understandable that developers will do t=
his
> themself at some point, because they don't want to wait anymore for
> something that might never happen.
>
> So a simple "NAK" without additional information is not really helpful he=
re.
>
> If you don't like Sascha's series, I really want to know _WHEN_ Rockchip
> plans on upstreaming at least basic graphis support themself.
>
> The kernel is often called a do-ocracy - the one who does the work, gets
> to decide. So if you really don't like Sascha's series at all, I do expec=
t
> Rockchip to step up and provide a solution themself - and in a usable
> timeframe.

Exactly what Heiko said. If you would like to upstream the driver then
that would be fantastic to see, but I'm afraid you do not get to
prevent someone else from doing the work themselves.

Cheers,
Daniel
