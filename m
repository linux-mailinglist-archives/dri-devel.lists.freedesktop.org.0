Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF431AE47
	for <lists+dri-devel@lfdr.de>; Sat, 13 Feb 2021 23:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C0A6E88C;
	Sat, 13 Feb 2021 22:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746F46E88C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Feb 2021 22:33:31 +0000 (UTC)
Received: from p508fc8c7.dip0.t-ipconnect.de ([80.143.200.199]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lB3Ti-0006HN-Bi; Sat, 13 Feb 2021 23:33:26 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date: Sat, 13 Feb 2021 23:33:25 +0100
Message-ID: <7871592.T7Z3S40VBb@phil>
In-Reply-To: <20210213111957.3ocxgcyno6ent4vt@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <16789691.tv2OnDr8pf@diego>
 <20210213111957.3ocxgcyno6ent4vt@basti-TUXEDO-Book-XA1510>
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 helen.koike@collabora.com, robh+dt@kernel.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Am Samstag, 13. Februar 2021, 12:19:57 CET schrieb Sebastian Fricke:
> On 11.02.2021 15:42, Heiko St=FCbner wrote:
> >Am Donnerstag, 11. Februar 2021, 06:25:15 CET schrieb Sebastian Fricke:
> >> On 10.02.2021 12:15, Heiko St=FCbner wrote:
> >> >Am Freitag, 5. Februar 2021, 15:55:56 CET schrieb Heiko St=FCbner:
> >> >> I did some tests myself today as well and can confirm your
> >> >> hdmi related finding - at least when plugged in on boot.
> >> >>
> >> >> I tried some combinations of camera vs. hdmi and it seems
> >> >> really only when hdmi is plugged in on boot
> >> >
> >> >as you can see in v2, it should work now even with hdmi
> >> >connected on boot. My patch ignored the grf-clock when
> >> >doing the grf-based init.
> >> >
> >> >All clocks are on during boot and I guess the hdmi-driver
> >> >did disable it after its probe. The phy_power_on functions
> >> >did handle it correctly already, so it was only happening
> >> >with hdmi connected on boot.
> >>
> >> Thank you very much for solving that problem, I've tested the scenarios
> >> described below and it works like a charm. (With your V2)
> >> >
> >> >
> >> >Btw. do you plan on submitting your ov13850 driver
> >> >soonish?
> >>
> >> Actually, I have posted the patch already see here:
> >> https://patchwork.kernel.org/project/linux-media/patch/20210130182313.=
32903-2-sebastian.fricke@posteo.net/
> >
> >very cool to see
> >
> >> I currently review the requested changes and questions and will soon
> >> post a second version, but I expect quite some time until it is actual=
ly
> >> merged.
> >
> >could you Cc me on future versions?
> =

> Sure will do :)

by the way, you could also answer the v2 series with a

Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>

so we get some coverage :-)

Thanks
Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
