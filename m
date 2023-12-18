Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DE817AC6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2EC10E390;
	Mon, 18 Dec 2023 19:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921610E390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926927; x=1734462927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vyUvi4eMLv19jinC5Hb7fDALiHRXT1ejWph8UfeE2SI=;
 b=H/QsnWJZ9Q5SDl/0J9a68bzhX27qalvtuSEdMbk+dhudsHDxmqTfGalo
 wTZ5u3GfWrMhJF1euiLlENbU7iUaSma1h5sN1ctpSO0HFpTdXwqJKCqKI
 TnrsVHyo/7kOFmuDPQcjjGbCUtiRa4MZmm2H3sPnGKYZWcEvA6IybMvyq
 OhvCffWOxKhltTo3SdDTkBvfdafeFfZGQhjQMhNNTaQKqWB1k99mwBBJr
 hnv5PGU/61NHKX81mttftpIQKWu5Cq1Hl2CWvcjDwOg4ldKsAiB1YxnFL
 kf+0nuWFkkRZLyc10X8fbSJXoBkpEd2tvJKN3NjBLnCnL2J/fZ0bifanb Q==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34555724"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 09:59:13 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6106D280075;
 Mon, 18 Dec 2023 09:59:13 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Date: Mon, 18 Dec 2023 09:59:15 +0100
Message-ID: <12346986.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231218094849.4aa15a97@booty>
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20231218023655.GG5290@pendragon.ideasonboard.com>
 <20231218094849.4aa15a97@booty>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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

Hi everybody,

Am Montag, 18. Dezember 2023, 09:48:49 CET schrieb Luca Ceresoli:
> Hi,
>=20
> On Mon, 18 Dec 2023 04:36:55 +0200
>=20
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Dec 15, 2023 at 05:09:41PM -0300, Fabio Estevam wrote:
> > > On Fri, Dec 15, 2023 at 4:01=E2=80=AFPM Adam Ford <aford173@gmail.com=
> wrote:
> > > > Thanks for the list.  I was able to successfully build the stable 6=
=2E6
> > > > branch with those patches applied and I have the HDMI working.
> > > > Unfortunately, I get build errors on the linux-next, so it's going =
to
> > > > take me a little time to sort through all of this.
> > >=20
> > > If you need help to figure this problem out, please let me know.
> > >=20
> > > I haven't tried it against linux-next.
> > >=20
> > > > I am thinking that it would be better to consolidate all these
> > > > together into one series instead of piecemealing it.  However, there
> > > > are some items that can be submitted right away without significant=
ly
> > > > reworking them against linux-next.  Do people have a preference?
> > >=20
> > > I think it makes sense to re-submit the "easy ones" right away.
> >=20
> > Agreed. The more we can merge quickly, the easier it will become to
> > rebase and upstream the rest.
>=20
> I agree as well, "release early, release often". These patches are
> around since a long time and lots of people are using them already, and
> tracking all of them from different threads is time-consuming. I will
> happily test them early as soon as they are sent.

I lost track of the series well, but I do remember I had to adjust the=20
original series to get it running on linux-next.
Please keep me on CC so I can add my local changes if necessary.
I have a proof of concept for HDMI audio, which is based on the base HDMI=20
support. I can continue on that after merge, but I'm lacking an idea how to=
=20
add some kind of "bridge" into the audio pipeline.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


