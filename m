Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FD725808
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208CA10E0C2;
	Wed,  7 Jun 2023 08:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F97110E0C2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:40:12 +0000 (UTC)
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1q6oi6-0006LM-Ch; Wed, 07 Jun 2023 10:40:06 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Date: Wed, 07 Jun 2023 10:40:04 +0200
Message-ID: <3560873.iIbC2pHGDl@diego>
In-Reply-To: <20230606-geometry-blurb-1f0f07d4bf6a@spud>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <1991848.PYKUYFuaPT@diego> <20230606-geometry-blurb-1f0f07d4bf6a@spud>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Shengyu Qu <wiagn233@outlook.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 7. Juni 2023, 00:37:53 CEST schrieb Conor Dooley:
> On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=FCbner wrote:
> > Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> > > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> > > >> Add bindings for JH7110 display subsystem which
> > > >> has a display controller verisilicon dc8200
> > > >> and an HDMI interface.
>=20
> > > >> +description:
> > > >> +  The StarFive SoC uses the HDMI signal transmiter based on innos=
ilicon IP
> > > > Is innosilicon the same thing as verisilicon? Also
> > > > s/transmiter/transmitter/, both here and in the title.
> > >=20
> > > I think that is not the same, I remember Rockchip has used a HDMI=20
> > > transmitter from
> > >=20
> > > Innosilicon, and there is a existing driver for that in mainline.
> >=20
> > Yep, I think Innosilicon is the company you turn to when you want to sa=
ve
> > a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
> > Designware hdmi blocks and looking at the history only the rk3036 ever
> > used an Innosilicon block.
> >=20
> > Looking at the history, 2016 really was a long time ago :-D.
> >=20
> > > So Keith, if that's true, I think it is better to seperate the HDMI=20
> > > stuff and reuse existing driver.
> >=20
> > I'm not so sure about that - at least from a cursory glance :-) .
> >=20
> > The registers do look slightly different and I don't know how much
> > the IP changed between the rk3036-version and the jh7110 version.
> >=20
> > At the very least, I know my rk3036 board isn't booting right now, so
> > I can't really provide help for generalizing the rockchip-driver.
> >=20
> > At the very least both the binding and driver could drop the "starfive-=
hdmi"
> > and actually use the Innosilicon in the naming somewhere, so that it's
> > clear for future developers :-)
>=20
> Seeing "based on" always makes me a little bit nervous to be honest when
> it comes to using a compatible from the IP. Is it the IP? What version
> is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
> of "innosilicon,hdmi" would be more future/IP-silliness proof.
> Driver can always be generic & bind against "innosilicon,hdmi" until
> that becomes impossible.


what Connor said makes a lot of sense. Just name the compatible
after the actual implementation - aka "starfive,jh7110-hdmi" .

This is similar to what the rk3036 does with its
"rockchip,rk3036-inno-hdmi". That way you're nicely independent
and future proof.


Heiko


