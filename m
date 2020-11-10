Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98412AD3B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 11:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EC389993;
	Tue, 10 Nov 2020 10:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E0C89993
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 10:27:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAARPX2002362;
 Tue, 10 Nov 2020 04:27:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605004045;
 bh=eji6r1q0SEBke//VSYTwi8vqdh0wx+Rh4E9+DzXc0pg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Xme7a4JabNLKSBJg5X5Zb+/Aezx4So2aDMSvr6VeITsWnFtp0wpioLiDJ5rdBoukK
 gBkjzcZOqlZh7dHX/IsLlsbYyIKKJY3ZYoHx/wbpRjqUQd8IEEYb801TT/sArLkCrv
 t72/J8QLd6jWyEUhFcxQ2XRnPd4EAuPcFiTDPh1A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAARPYh110818
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 04:27:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 04:27:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 04:27:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAARNvC107452;
 Tue, 10 Nov 2020 04:27:24 -0600
Date: Tue, 10 Nov 2020 15:57:23 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
Message-ID: <20201110102723.mgtrq5gznvvbpop2@NiksLab>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
 <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11:21-20201110, Tomi Valkeinen wrote:
> On 09/11/2020 19:06, Nikhil Devshatwar wrote:
> > When removing the tidss driver, there is a warning reported by
> > kernel about an unhandled interrupt for mhdp driver.
> > 
> > [   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
> > ... [snipped backtrace]
> > [   43.330735] handlers:
> > [   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
> > cdns_mhdp_irq_handler [cdns_mhdp8546]
> > [   43.344607] Disabling IRQ #31
> > 
> > This happens because as part of cdns_mhdp_bridge_hpd_disable, driver tries
> > to disable the interrupts. While disabling the SW_EVENT interrupts,
> > it accidentally enables the MBOX interrupts, which are not handled by
> > the driver.
> > 
> > Fix this with a read-modify-write to update only required bits.
> > Do the same for enabling interrupts as well.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > index 2cd809eed827..6beccd2a408e 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -2146,7 +2146,8 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
> >  
> >  	/* Enable SW event interrupts */
> >  	if (mhdp->bridge_attached)
> > -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
> > +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
> > +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
> >  		       mhdp->regs + CDNS_APB_INT_MASK);
> >  }
> >  
> > @@ -2154,7 +2155,9 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
> >  {
> >  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> >  
> > -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs + CDNS_APB_INT_MASK);
> > +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
> > +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
> > +	       mhdp->regs + CDNS_APB_INT_MASK);
> >  }
> >  
> >  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
> 
> Good catch. I wonder why we need the above functions... We already enable and disable the interrupts
> when attaching/detaching the driver. And I think we want to get the interrupt even if we won't
> report HPD (but I think we always do report it), as we need the interrupts to track the link status.
> 

I read from the code that there is TODO for handling the mailbox
interrupts in the driver. Once that is supported, you will be able to
explictily enable/disable interrupts for SW_EVENTS (like hotplug) as
well as mailbox events. This enabling specific bits in the interrupt
status.


Nikhil D
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
