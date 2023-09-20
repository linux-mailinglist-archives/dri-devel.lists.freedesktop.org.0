Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBAE7A8C1F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 20:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A010E53A;
	Wed, 20 Sep 2023 18:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6D10E53A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt9cmS1OYnqvPF2srfjhhS4oqufX6LSMU2kxOSUqtBY=; b=NNPE5yxU7A4HA6M8eH1Zfas8Po
 z2UgSalclfWy3W5fJfrGlaC1iPuAokZPb83X2VaNImAI4CaD6ICzwDjNJauJ0YGVG/jJBXcmfy5Cx
 x8Pml+bhl1X1roDHlOpr3JgG45AsgZitsDPhSYCPE6MqsI2du1Hkuqqh1ytFTaQkDCl0l6JECeVnM
 kXQhyhd2zU2IK0tfCboKxXvtLB9O6x6dplHOTMXl2Xh8XrvHCpkyjpd4FGu7AhWPaJw1L9ID1DaJs
 40tjGSuc3mLRiF77mXQLnJ6bGWMtH6VyoXRx0zkoJE15U789TiBAVvLpbhz89ArnJWXJ/oMOlMU4J
 0qrKY8vQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51398)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qj2Oe-0003cU-30;
 Wed, 20 Sep 2023 19:58:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qj2Oe-0002l8-RE; Wed, 20 Sep 2023 19:58:00 +0100
Date: Wed, 20 Sep 2023 19:58:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <ZQtAuKBwo+ue8QQQ@shell.armlinux.org.uk>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
 <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
 <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
 <CAD=FV=WSdp=5DnJinELOSncX=eqrN9y27kw=VFDHowzgnTS6Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WSdp=5DnJinELOSncX=eqrN9y27kw=VFDHowzgnTS6Qg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 11:03:32AM -0700, Doug Anderson wrote:
> Maxime,
> 
> On Wed, Sep 13, 2023 at 8:34 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Sep 5, 2023 at 7:23 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Sun, Sep 3, 2023 at 8:53 AM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > > > > Based on grepping through the source code this driver appears to be
> > > > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > > > time. Among other things, this means that if a panel is in use that it
> > > > > won't be cleanly powered off at system shutdown time.
> > > > >
> > > > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > > > instance overview" in drm_drv.c.
> > > > >
> > > > > This driver was fairly easy to update. The drm_device is stored in the
> > > > > drvdata so we just have to make sure the drvdata is NULL whenever the
> > > > > device is not bound.
> > > >
> > > > ... and there I think you have a misunderstanding of the driver model.
> > > > Please have a look at device_unbind_cleanup() which will be called if
> > > > probe fails, or when the device is removed (in other words, when it is
> > > > not bound to a driver.)
> > >
> > > ...and there I think you didn't read this patch closely enough and
> > > perhaps that you have a misunderstanding of the component model.
> > > Please have a look at the difference between armada_drm_unbind() and
> > > armada_drm_remove() and also check which of those two functions is
> > > being modified by my patch. Were this patch adding a call to
> > > "dev_set_drvdata(dev, NULL)" in armada_drm_remove() then your NAK
> > > would be justified. However, I am not aware of anything in the
> > > component unbind path nor in the failure case of component bind that
> > > would NULL the drvdata.
> > >
> > > Kindly look at the patch a second time with this in mind.
> >
> > Since I didn't see any further response, I'll assume that my
> > explanation here has addressed your concerns. If not, I can re-post it
> > without NULLing the "drvdata". While I still believe this is unsafe in
> > some corner cases because of the component model used by this driver,
> > at least it would get the shutdown call in.
> >
> > In any case, what's the process for landing patches to this driver?
> > Running `./scripts/get_maintainer.pl --scm -f
> > drivers/gpu/drm/armada/armada_drv.c` seems to indicate that this
> > should go through the git tree:
> >
> > git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-devel
> >
> > ...but it doesn't appear that recent changes to this driver have gone
> > that way. Should this land through drm-misc?
> 
> Do you have any advice here? Should I land this through drm-misc-next,
> put it on ice for a while, or resend without the calls to NULL our the
> drvdata?

Sorry, I haven't had a chance to look at it, but I think you're probably
right, so I withdraw my objection. Please take it through drm-misc for
the time being. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
