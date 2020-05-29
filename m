Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BB1E7489
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 06:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3626E235;
	Fri, 29 May 2020 04:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96996E235
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 04:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 75CD8FB03;
 Fri, 29 May 2020 06:23:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWWfHe7cer4i; Fri, 29 May 2020 06:23:46 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A09C644AF9; Fri, 29 May 2020 06:23:45 +0200 (CEST)
Date: Fri, 29 May 2020 06:23:45 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 3/6] dt-bindings: display/bridge/nwl-dsi: Drop mux
 handling
Message-ID: <20200529042345.GA2876@bogon.m.sigxcpu.org>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <9884c56219e9bdbeec179c27ea2b734dbb5f1289.1589548223.git.agx@sigxcpu.org>
 <20200528195914.GB568887@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528195914.GB568887@bogus>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,
On Thu, May 28, 2020 at 01:59:14PM -0600, Rob Herring wrote:
> On Fri, May 15, 2020 at 03:12:12PM +0200, Guido G=FCnther wrote:
> > No need to encode the SoC specifics in the bridge driver. For the
> > imx8mq we can use the mux-input-bridge.
> =

> You can't just change bindings like this. You'd still have to support =

> the "old" way. But IMO, this way is the right way.

My understanding is that binding stability only applies to released
kernels and this binding never was in released kernel yet. Does it still
apply in this case?
Cheers,
 -- Guido

> =

> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > ---
> >  .../devicetree/bindings/display/bridge/nwl-dsi.yaml         | 6 ------
> >  1 file changed, 6 deletions(-)
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
