Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236A11C340A
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 10:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA86E343;
	Mon,  4 May 2020 08:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C46E343
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 08:07:30 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jVW8B-0007yE-Il; Mon, 04 May 2020 10:07:15 +0200
Message-ID: <bf758b2ce26ba8f1b94f1f8fbd1c506d84759a5f.camel@pengutronix.de>
Subject: Re: [RFC PATCH 4/4] arm64: dts: imx8mm: Add GPU nodes for 2D and 3D
 core using Etnaviv
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, Schrempf Frieder
 <frieder.schrempf@kontron.de>
Date: Mon, 04 May 2020 10:07:14 +0200
In-Reply-To: <CAHCN7xJ=srZxygtG6hW_+us=qH1heY-k=EosavYH9tDk-KG0Bw@mail.gmail.com>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-5-frieder.schrempf@kontron.de>
 <CAHCN7xJ=srZxygtG6hW_+us=qH1heY-k=EosavYH9tDk-KG0Bw@mail.gmail.com>
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Sonntag, den 03.05.2020, 09:49 -0500 schrieb Adam Ford:
> On Thu, Apr 30, 2020 at 7:46 AM Schrempf Frieder
> <frieder.schrempf@kontron.de> wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > 
> > According to the documents, the i.MX8M-Mini features a GC320 and a
> > GCNanoUltra GPU core. Etnaviv detects them as:
> > 
> >         etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
> >         etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
> > 
> > This seems to work fine more or less without any changes to the HWDB,
> > which still might be needed in the future to correct some features,
> > etc.
> > 
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > ---
> Since not everyone uses the 3D or 2D, would it make sense to mark them
> as disabled by default and let people who need the 3D and 2D enable
> them at their respective board files?

No, devices on the SoC with no external dependencies should be always
enabled.

The board has much less influence over whether the GPU is being used
than the specific use-case. While the board designer may not even think
about using the GPUs (because no display connector present or something
like that) people using the board may still find uses for the GPU, like
doing video pipeline color space conversions or something lie that.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
