Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591314B14A1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 18:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5ED10E8B4;
	Thu, 10 Feb 2022 17:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7564210E8B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 17:54:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nIDe3-0000uv-AK; Thu, 10 Feb 2022 18:54:15 +0100
Message-ID: <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>
Date: Thu, 10 Feb 2022 18:54:13 +0100
In-Reply-To: <YflvS007gL5mLa9k@robh.at.kernel.org>
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
 <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
 <YflvS007gL5mLa9k@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Am Dienstag, dem 01.02.2022 um 11:35 -0600 schrieb Rob Herring:
> On Fri, Jan 28, 2022 at 06:58:29PM +0100, Uwe Kleine-König wrote:
> > Hello Rob,
> > 
> > On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> > > On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-König
> > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > 
> > > > From: Marian Cichy <m.cichy@pengutronix.de>
> > > > 
> > > > This files documents the device tree for the new imx21-lcdc DRM driver.
> > > 
> > > No, bindings document h/w and the h/w has not changed. We already have
> > > a binding for the LCDC.
> > 
> > Just to be sure we're talking about the same thing: You're refering to
> > Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?
> 
> Looks right...
> 
> > I'm unsure what to do now. Should the two different bindings just be
> > described in the same file? Should I stick to fsl,imx21-fb even for the
> > new binding? (The hardware unit is named LCDC, so the name chosen here
> > is the better one.) Please advise.
> 
> Yes, the name is unfortunate, but it should be 1 binding, 1 file, and 
> unchanged (unless you want to add new optional properties). 
> 
The old FB driver binding is pretty insane. Except the reg and
interrupt properties it is very confused about things. It exposes
internal implementation details (like specifying verbatim register
settings in the DT) and other properties are just misplaced, like the
lcd-supply property that controls the panel power supply.

I really don't think that trying to stay backwards compatible here is a
win for anyone. Anyone willing to switch their systems running on a 15
year old SoC to the new DRM driver probably doesn't mind if they have
to modify the DTS to make it work. Can we please let the FB driver die
in peace and have a clean slate driver/binding for the DRM driver?

Regards,
Lucas

