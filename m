Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28238817A31
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538510E363;
	Mon, 18 Dec 2023 18:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88C10E399
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:51:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AF511C4EBE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:49:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD407FF80D;
 Mon, 18 Dec 2023 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702889335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEjNyui8dpICoN03Dmtc/o7axfHFy2V2/ve4imiJSQY=;
 b=EfxGBHupUDheNnjomSJdSFxBQyn7KjPnJ87Dukk7wAEypxePvm+GJYd5W0WeQ8bKMIrLsU
 chq/IgWlXZwksnhFYshwV74+dNMUfgRFUIxG3mc+DysLRL5xOFctbqtCo35x8ezYLvi2LL
 FQZTSz0O83/lP8BlyMPRjLkoS2cyRGrrDVbXijwphB4PgF4ScLXm+WExn7WLFP4WnzdJU3
 jUWF2/dgr5Riq/CUvbP0YQJo1hEoR00BJmxbU3p6vj2S93oT1IPe7xHEWyit5FnKEYo/5E
 CMH+6dJYBJdSuKvaKaBJc5ojCo5uo9iIKKG9owtN+rhZtTUl0LKECkoCqoXbFQ==
Date: Mon, 18 Dec 2023 09:48:49 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20231218094849.4aa15a97@booty>
In-Reply-To: <20231218023655.GG5290@pendragon.ideasonboard.com>
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
 <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
 <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
 <CAHCN7xLHMGcS2-QTneqqpHYU66JwuEG4TyR0j0riFGqO6RC8ug@mail.gmail.com>
 <CAOMZO5B2bWVciDEwSh+YQWu6b_Hp5ijk6Jq-bMePPTDRJ-vHFA@mail.gmail.com>
 <20231218023655.GG5290@pendragon.ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandor Yu <sandor.yu@nxp.com>, Adam Ford <aford173@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 18 Dec 2023 04:36:55 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> On Fri, Dec 15, 2023 at 05:09:41PM -0300, Fabio Estevam wrote:
> > On Fri, Dec 15, 2023 at 4:01=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> >  =20
> > > Thanks for the list.  I was able to successfully build the stable 6.6
> > > branch with those patches applied and I have the HDMI working.
> > > Unfortunately, I get build errors on the linux-next, so it's going to
> > > take me a little time to sort through all of this. =20
> >=20
> > If you need help to figure this problem out, please let me know.
> >=20
> > I haven't tried it against linux-next.
> >  =20
> > > I am thinking that it would be better to consolidate all these
> > > together into one series instead of piecemealing it.  However, there
> > > are some items that can be submitted right away without significantly
> > > reworking them against linux-next.  Do people have a preference? =20
> >=20
> > I think it makes sense to re-submit the "easy ones" right away. =20
>=20
> Agreed. The more we can merge quickly, the easier it will become to
> rebase and upstream the rest.

I agree as well, "release early, release often". These patches are
around since a long time and lots of people are using them already, and
tracking all of them from different threads is time-consuming. I will
happily test them early as soon as they are sent.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
