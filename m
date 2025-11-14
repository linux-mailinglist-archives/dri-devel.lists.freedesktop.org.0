Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3BDC5BAD4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 08:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF2110E229;
	Fri, 14 Nov 2025 07:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Yd6vZtKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A21B10E229
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 07:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763104032; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jk8AIvOvE/8LILOk2DAILmhafD1+Kg+0XgQZHPcvLjJXSs3Qx5wAXkzN5cm/OxTZ51kk7c6QgLrcFAGR355r+9xNXVNZGIu6GDQVIA47uKMXSlZKpaZhKMbG/skxbQxmTi+2HJww9siVp6dDOOeh9j8biyYC5chBoMAyIPdjZ6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763104032;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=; 
 b=SMLZwHprsnx3D00elMkDAh13b+oJs8sHl8Sm9UQlfTbjAYanSRGYNDvHwmvIar8Xa2ELh6OZExv8bnPxCVP/6IwacTlLs4UK7BQU36CdBlIc4xsUH0clvzNVfXIdd896rin/1aX4hZYouTbL9x13nknClax0wwN6HugVdoTvRcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763104032; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=;
 b=Yd6vZtKPbUx5vWV+zNJtZtt5NR9BWsRdyN8Gw4lNM4SwZ6FAE6/Rk7VRnLKUT/v6
 sELB7aNzp5H8Z2YbspkYpXkuvsQF0W+fkXmB0JYpIRUgf+qRhxpew29OIpCi3HhxdkX
 29DoCJAuPPZrDkrzlUJ9d7fQ4kMo5WOC+XUgfn6jPLk1o0EFKcak8CiZg4N8uL8jPRE
 K+UK2V5lb5YkC2rdGSGEOYgfgsOMvc/j8YCVjYgN7Cddi7uua0UDXan8YvpIHlX9J7w
 ctZax5B1yJ9tck3DyVIfWhhgYo9KBtNBD1JKLOTnYrE47mZreU0zMzkvSRqIkpFDLQ6
 74JW1oXADQ==
Received: by mx.zohomail.com with SMTPS id 1763104029433118.5268080863134;
 Thu, 13 Nov 2025 23:07:09 -0800 (PST)
Message-ID: <0109a90fc464e3cc63dd6c11e699db0143906256.camel@icenowy.me>
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add
 vout-subsystem IP block
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Maud Spierings <maudspierings@gocontroll.com>, 
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  linux-riscv@lists.infradead.org
Date: Fri, 14 Nov 2025 15:06:55 +0800
In-Reply-To: <20251113-irritable-unfold-da619d52026c@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
 <20251111-massager-twistable-1e88f03d82f8@spud>
 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
 <20251112-skating-robust-81be8dee0a8b@spud>
 <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>
 <20251113-irritable-unfold-da619d52026c@spud>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2025-11-13=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 19:44 +0000=EF=BC=
=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Nov 13, 2025 at 08:48:33AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-11-12=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Nov 12, 2025 at 02:34:39PM +0800, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2025-11-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:36 +000=
0=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> > > > > > On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski
> > > > > > wrote:
> > > > > > > Add the dt-binding documentation for the StarFive JH7110
> > > > > > > Video
> > >=20
> > > > > > > +patternProperties:
> > > > > > > +=C2=A0 "^display@[0-9a-f]+$":
> > > > > >=20
> > > > > > Personally I'd like to see these being regular properties,
> > > > > > since
> > > > > > there's
> > > > > > exactly one possible setup for this.
> > > > > >=20
> > > > > > > +=C2=A0=C2=A0=C2=A0 type: object
> > > > > > > +=C2=A0=C2=A0=C2=A0 description: Verisilicon DC8200 Display C=
ontroller
> > > > > > > node.
> > > > > >=20
> > > > > > Can you add the relevant references here instead of
> > > > > > allowing
> > > > > > any
> > > > > > object?
> > > > >=20
> > > > > I don't think that if you did, this would pass the binding
> > > > > checks,
> > > > > because there's no "verisilicon,dc" binding. I think I saw
> > > > > one in
> > > > > progress, but without the soc-specific compatible that I am
> > > > > going
> > > > > to
> > > > > require here - if for no reason other than making sure that
> > > > > the
> > > > > clocks
> > > > > etc are provided correctly for this device.
> > > >=20
> > > > Well I didn't specify any soc-specific compatible because that
> > > > IP
> > > > has
> > > > its own identification registers.
> > >=20
> > > I still require one because I want to make sure that clocks etc
> > > are
> > > handled correctly. You can ignore it in the driver if you wish,
> > > but
> > > when
> > > the next user comes along with one more or less clock, I want the
> > > jh7110 one to be forced to use the correct configuration.
> >=20
> > I don't think for those generic IPs requiring a SoC-specific
> > compatible
> > is a good idea.
>=20
> I disagree. If things are complex enough to end up with different
> numbers of clocks or power-domains etc on different platforms (which
> I
> believe GPUs are) then I want one for validation purposes on
> platforms I
> care about. What you do in the driver is up to you.

Well I think Vivante GPUs do have such case -- a "shader" clock that is
only present when 3D support is here. But that binding still contains
only "vivante,gc" and the maintainer of etnaviv rejects extra
compatible strings.

In addition, as the addition of SoC-specific compatible string and the
real DT are usually written by the same person at the same time, I
don't think this introduces any more validation (because when the
author gets things wrong they will just make it wrong at the two
places).
