Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHbfHUZEk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:22:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB0146100
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBD210E3B7;
	Mon, 16 Feb 2026 16:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="wzpY9zrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF4D10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=NKTLKp3nWhZDwjOkHRJTFj5kVkczUXVF/iVpKSDYRWw=; b=wzpY9zrj9WAxSHlWXxWbYSnhz5
 AaehbjFO6gx6LALpnAEVjho9vUmSmI7tuHat6SGQR8yYzct8zKu39JEyG7ALK5J/AUXDoKvkhZ9Qd
 l57eRi9VdCcebfBeOzYG6G/SM6CrLyVUvGnRtZXk7kQ56spDKHYA5ljzI7EM2hh5n7rQeNYzWS8Ho
 AyGTPyULJedEa7ddTXoEbqu6EHKM0ifzVZ3oGGDTR2g8jOHsIH20bWlGHo8ehLsgABLqqaAWqWFtV
 yUuApxi4zI7b/Fhdl48Rr42JZLi5cbRXN+Z0MUKfXTzTQnBUEmjY9RcFNggl9J3NExA39opSSKn3V
 MsI3OBDg==;
Date: Mon, 16 Feb 2026 17:22:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "Kory Maincent (TI)" <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260216172207.1b34324e@kemnade.info>
In-Reply-To: <9D7424B6-2022-4B03-9B8C-455CD3E3FBF1@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
 <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
 <20260212174718.7daccb70@kemnade.info>
 <719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
 <20260212231907.6120a2e2@kemnade.info>
 <9D7424B6-2022-4B03-9B8C-455CD3E3FBF1@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kemnade.info:s=20220719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[kemnade.info : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:hns@goldelico.com,m:kory.maincent@bootlin.com,m:aaro.koskinen@iki.fi,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,goldelico.com:email]
X-Rspamd-Queue-Id: CACB0146100
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 06:33:46 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi,
>=20
> > Am 12.02.2026 um 23:19 schrieb Andreas Kemnade <andreas@kemnade.info>:
> >=20
> > On Thu, 12 Feb 2026 17:55:43 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> >  =20
> >>> Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.info>:
> >>>=20
> >>> On Thu, 12 Feb 2026 16:49:43 +0100
> >>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> >>>  =20
> >>>>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) <kory.maincent@bo=
otlin.com>:
> >>>>>=20
> >>>>> Allow overlays to be applied to any DTB. This adds around ~40% to t=
he
> >>>>> total size of the DTB files on average.     =20
> >>>>=20
> >>>> Is this unconditionally enabled or can it be turned off by some CONF=
IG? We have
> >>>> our own defconfig so I would not worry if if is enabled in omap2plus=
_defconfig
> >>>> and disabled in ours.
> >>>>=20
> >>>> We have several devices where the boot loader can't handle overlays =
(never touch
> >>>> a working boot-loader :) So this seems to only contribute to build a=
nd load time
> >>>> without benefit.
> >>>>  =20
> >>> As long as you do not add overlays, the bootloader does not care. I w=
ould
> >>> like to simply carry around the 1-bit mmc overlay for one broken boar=
d.
> >>> That would help me. So I think there is a benefit but nobody forces
> >>> you to use it.   =20
> >>=20
> >> Well, it does not force to use the really good feature, but it forces =
to add
> >> ~40% more file size and some more compile time, if I understand it cor=
rectly.
> >>  =20
> > Compile time, hardly measurable even if you just do make dtbs.
> >=20
> > Size on disk:
> > a) if it lives around in a /boot partitions with kernels and initrams i=
n it,
> >   then we are around 1% more space needed. =20
>=20
> Ah, I see. I was too focussed on the "adds around ~40% to the total size =
of the DTB files".
>=20
> For the Letux arm distro all DTBs are around 8.1 MB at the moment so it w=
ill grow not that much
> (there are non-TI devices included).
>=20
> So you are right, it is ~1% of the total if the kernel image is counted.
>=20
> Therefore, space should not be something we should be too concerned about=
 (although I remember
> discussions for driver code where every single byte did count).
>=20
> On the other hand this increases load time from (sometimes slow) =C2=B5SD=
 for a specific DTB by 40%.
> That should at least be discussed.
>=20
so also 1% of total loading time. And symbols can be stripped away during
e.g. deployment.
fdtput -r some_board.dtb /__symbols__

I am not strongly against it. It is just we are doing something unusual her=
e.
Are there reasons why it is unusual I do not understand?
I think it can be useful for every board in some situations. For the
ones with can carry a head, they are the most useful.

What was the reasoning to have it enabled for k3 for every board? K3 and Br=
oadcom-64bit
seem to be the only arch doing that. Broadcom mostly many RPis, some router=
s.=20

Regards,
Andreas
