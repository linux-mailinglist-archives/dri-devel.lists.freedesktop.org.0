Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7701013112A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 12:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172C6E25A;
	Mon,  6 Jan 2020 11:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED85E6E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 11:09:26 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ioQG8-0004XS-2c; Mon, 06 Jan 2020 12:09:20 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 00/11] Add PX30 LVDS support
Date: Mon, 06 Jan 2020 12:09:19 +0100
Message-ID: <2064471.Uj1soXtvLx@diego>
In-Reply-To: <1885398.klecWcqSHf@phil>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
 <1885398.klecWcqSHf@phil>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, 5. Januar 2020, 15:05:26 CET schrieb Heiko Stuebner:
> Am Dienstag, 24. Dezember 2019, 15:38:49 CET schrieb Miquel Raynal:
> > Hello,
> > =

> > This series aims at supporting LVDS on PX30.
> > =

> > A first couple of patches update the documentation with the new
> > compatible and the presence of a PHY. Then, the existing Rockchip
> > driver is cleaned and extended to support PX30 specificities. Finally,
> > the PX30 DTSI is updated with CRTC routes, the DSI DPHY and the LVDS
> > IP itself.
> > =

> > Cheers,
> > Miqu=E8l
> > =

> > Changes since v1:
> > * Added Rob's Ack.
> > * Used "must" instead of "should" in the bindings.
> > * Precised that phy-names is an optional property in the case of
> >   PX30.
> > * Renamed the WRITE_EN macro into HIWORD_UPDATE to be aligned with
> >   other files.
> > * Removed extra configuration, not needed for generic panels (see
> >   Sandy Huang answer).
> > * Dropped the display-subsystem routes (useless).
> > * Merged two patches to avoid phandle interdependencies in graphs and
> >   intermediate build errors.
> > =

> > Miquel Raynal (11):
> >   dt-bindings: display: rockchip-lvds: Declare PX30 compatible
> >   dt-bindings: display: rockchip-lvds: Document PX30 PHY
> >   drm/rockchip: lvds: Fix indentation of a #define
> >   drm/rockchip: lvds: Harmonize function names
> >   drm/rockchip: lvds: Change platform data
> >   drm/rockchip: lvds: Create an RK3288 specific probe function
> >   drm/rockchip: lvds: Helpers should return decent values
> >   drm/rockchip: lvds: Pack functions together
> =

> applied patches 1-8 to drm-misc-next
> =

> >   drm/rockchip: lvds: Add PX30 support
> =

> drm-misc-next is currently still at 5.4-rc4, so I'll need to find out how
> to get newer kernel changes in there, as right now we're missing
> the PHY_MODE_LVDS constant.

applied now to drm-misc-next as well, after drm-misc maintainers did the
requested back-merge to get that constant.

Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
