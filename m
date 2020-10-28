Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168629D03B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 15:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459C76E105;
	Wed, 28 Oct 2020 14:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2306E105
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:19:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SEJiGW121108;
 Wed, 28 Oct 2020 09:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603894784;
 bh=RCGyBMpU7Hl/iGB2FpHkNv9vbEegp+94GxJ83y+kKXY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GsDqRJmA/nXAegyjpxyf7MPmnT7PA7gdHnImF3uyCphrPXEc3oCaAYMs80SkLIXZR
 FxDc425btSNAHFuG8FIQfRRPavPbwdUrif7EfYt2GgXr94gewoEWK6hs8EoxkjB8ef
 j6lGe6T8N7El9vldRWiqPuZv4or9ho0ojeQ2gFyI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SEJi9W090461
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Oct 2020 09:19:44 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 09:19:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 09:19:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SEJhp4089998;
 Wed, 28 Oct 2020 09:19:43 -0500
Date: Wed, 28 Oct 2020 19:49:42 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 0/5] drm/tidss: Use new connector model for tidss
Message-ID: <20201028141942.yuxeqrgu22i7odjw@NiksLab>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <bce76514-897e-ee9b-e51d-76b40345c49a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bce76514-897e-ee9b-e51d-76b40345c49a@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15:11-20201019, Tomi Valkeinen wrote:
> Hi Nikhil,
> 
> On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> > This series moves the tidss to using new connectoe model, where the 
> > SoC driver (tidss) creates the connector and all the bridges are 
> > attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > 
> > Since the bridges do not create the connector, the bus format and
> > bus_flag is set after the format negotiation.
> > Support format negotiations in the tfp410 and mhdp bridge drivers.
> > 
> > Nikhil Devshatwar (5):
> >   drm/tidss: Move to newer connector model
> >   drm/tidss: Set bus_format correctly from bridge/connector
> >   drm: bridge: Propagate the bus flags from bridge->timings
> >   drm/bridge: tfp410: Support format negotiation
> >   drm/bridge: mhdp8564: Support format negotiation
> 
> I think the patch order could be a bit different. If you first change the tidss to use the new
> connector model, and only afterwards fix the bridges we use, then there's a time when the displays
> won't work.
> 
Agreed. I will change the order in next version

> Also, with J7 EVM and DP, when I unload the modules I see:
> 
I confirm the same issue.
I doubt if it is because of the change I did.
Will try to revert the patches and confirm again

> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
> [   43.245591] CPU: 0 PID: 349 Comm: irq/31-mhdp8546 Not tainted 5.9.0-rc5-00605-g08a291316f86 #4
> [   43.254186] Hardware name: Texas Instruments K3 J721E SoC (DT)
> [   43.260006] Call trace:
> [   43.262453]  dump_backtrace+0x0/0x1d8
> [   43.266107]  show_stack+0x18/0x28
> [   43.269416]  dump_stack+0xe0/0x14c
> [   43.272810]  __report_bad_irq+0x4c/0xdc
> [   43.276637]  note_interrupt+0x2cc/0x388
> [   43.280465]  handle_irq_event_percpu+0x88/0x90
> [   43.284898]  handle_irq_event+0x48/0xf8
> [   43.288725]  handle_fasteoi_irq+0xcc/0x180
> [   43.292811]  generic_handle_irq+0x30/0x48
> [   43.296811]  __handle_domain_irq+0x94/0x108
> [   43.300986]  gic_handle_irq+0x60/0x158
> [   43.304726]  el1_irq+0xbc/0x180
> [   43.307862]  _raw_spin_unlock_irq+0x48/0x90
> [   43.312035]  irq_finalize_oneshot.part.0+0x68/0x108
> [   43.316903]  irq_thread_fn+0x60/0xa0
> [   43.320469]  irq_thread+0x1b8/0x248
> [   43.323949]  kthread+0x128/0x160
> [   43.327169]  ret_from_fork+0x10/0x34
> [   43.330735] handlers:
> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
> cdns_mhdp_irq_handler [cdns_mhdp8546]
> [   43.344607] Disabling IRQ #31
> 
>  Tomi
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
