Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4E2239BA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 12:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722B46E04E;
	Fri, 17 Jul 2020 10:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A0A6E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 10:51:03 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jwNxE-0003u7-5w; Fri, 17 Jul 2020 12:51:00 +0200
Message-ID: <c325bee7980feb3564de05a0a6d15c1708e2c7c0.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/4] Add support for iMX8MQ Display Controller Subsystem
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, dri-devel
 <dri-devel@lists.freedesktop.org>,  Linux ARM
 <linux-arm-kernel@lists.infradead.org>, devicetree
 <devicetree@vger.kernel.org>, Guido =?ISO-8859-1?Q?G=FCnther?=
 <agx@sigxcpu.org>, lukas@mntmn.com, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jul 2020 12:50:56 +0200
In-Reply-To: <20200717094517.layssf75bxe3ijs4@fsr-ub1864-141>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
 <3c03afff3256ec36e12b9d9408830fbb4853f982.camel@pengutronix.de>
 <CAKMK7uGsveS+cwxiTq7BGrB1OcE_ff9bAxgSFDMUSmS7gRLJ7g@mail.gmail.com>
 <febb665904a9c3c680363be8ea83f243ccd09cb7.camel@pengutronix.de>
 <20200717092758.GR3278063@phenom.ffwll.local>
 <20200717094517.layssf75bxe3ijs4@fsr-ub1864-141>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, den 17.07.2020, 12:45 +0300 schrieb Laurentiu Palcu:
> Hi Lukas and Daniel,
> 
> On Fri, Jul 17, 2020 at 11:27:58AM +0200, Daniel Vetter wrote:
> > On Fri, Jul 17, 2020 at 11:12:39AM +0200, Lucas Stach wrote:
> > > Am Freitag, den 17.07.2020, 10:59 +0200 schrieb Daniel Vetter:
> > > > On Fri, Jul 17, 2020 at 10:18 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > > Hi Laurentiu,
> > > > > 
> > > > > Am Donnerstag, den 09.07.2020, 19:47 +0300 schrieb Laurentiu Palcu:
> > > > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > > > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > > > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > > > > 
> > > > > > Support for the rest of the features will be added incrementally, in subsequent
> > > > > > patches.
> > > > > > 
> > > > > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > > > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > > > 
> > > > > I think the series (minus 3/5 and minor correction to the DT binding)
> > > > > is fine to go in now. So just some formal questions: are you going to
> > > > > maintain this driver in upstream? If so we should add a MAINTAINERS
> > > > > entry to that effect. I can offer to act as a reviewer in this case.
> 
> I can maintain the DCSS driver, sure, and the more reviewers the better.
> Thanks for helping out with this. Should I send a v6 then with a patch
> for MAINTAINERS?
> 
> > > > > How do you intend to merge this? IMO pushing this through drm-misc
> > > > > seems like the right thing to do. If you agree I can help you get this
> > > > > applied. If you are going to maintain the driver on your own, I think
> > > > > you should then apply for commit rights to drm-misc.
> > > > 
> > > > drm/imx isn't listed yet as under the drm-misc umbrella, maybe we
> > > > should put the entire collective of imx drivers under drm-misc? Or
> > > > maybe it's just an oversight that the git repo isn't specified in the
> > > > MAINTAINERS entry. Also maybe we should add the pengutronix kernel
> > > > team alias there too?
> > > 
> > > drm/imx was exclusively the IPUv3 up until now, which is in fact
> > > maintained outside of drm-misc in its own git tree. This has worked
> > > quite well in the past so even though IPUv3 doesn't see a lot of churn
> > > these days the motivation to change anything to this workflow is quite
> > > low. And yes, the git tree is missing from the MAINTAINERS entry.
> > > 
> > > For the DCSS driver, if it's going to be maintained by NXP, I figured
> > > it might be easier for Laurentiu to push things into drm-misc than set
> > > up a separate public git tree. But IMHO that's fully up to him to
> > > decide.
> > 
> > /me puts on maintainer hat
> > 
> > Much prefer drm-misc over random people playing maintainer and fumbling
> > it. I think the reasonable options are either in the current imx tree, or
> > drm-misc. Standalone tree for these small drivers just doesn't make much
> > sense.
> 
> I don't have anything against either method, though I have to agree I
> like things to be simple. Going through drm-misc sounds simple enough to me. :)
> However, since there is going to be more activity in the DRM IMX area in
> the future, reviving the drm/imx tree, and push all IMX related stuff
> through drm/imx, could make sense as well.

I think drm-misc is the right place then.

Please send a v6 with the following changes:
- drop the component framework patch
- drop the i.MX8MQ DT patch, this should go through Shawn's imx tree
after the driver and binding has landed in drm-misc
- you can add my Reviewed-by to the whole series or I can add it when
applying
- add a MAINTAINERS entry, please add me as a reviewer if you don't
mind

I can push this initial series into drm-misc until you've got your own
commit rights.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
