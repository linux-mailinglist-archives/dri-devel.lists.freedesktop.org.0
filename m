Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A22D11C9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8623B6E848;
	Mon,  7 Dec 2020 13:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6606E848
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:23:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DNglF097330;
 Mon, 7 Dec 2020 07:23:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607347422;
 bh=y26DUa68cjwTRuK4zv/j2DtueTkpR95PYKDB3yy5m0s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=YSXQpyTgcQz3pzXAOmkL9rvNstQAtmsma2eg2+af4sR9tXW/i9ipLvkDYSmslKHMJ
 CbzqN3PYvMcomqZZitxUQecQXzQPzngMnRictNYG6KMnb9OCpu35bytXWtVjwXbIuJ
 4PcAcGd23sziUfIV+ibWfBGCu2P8rAbpX/Gtqvt8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7DNgQB089031
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Dec 2020 07:23:42 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 07:23:41 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 07:23:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DNekc077880;
 Mon, 7 Dec 2020 07:23:41 -0600
Date: Mon, 7 Dec 2020 18:53:40 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 4/7] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
Message-ID: <20201207132339.xepu5jvfel5pkp4l@NiksLab>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-5-nikhil.nd@ti.com>
 <20201204113251.5a8c5023@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204113251.5a8c5023@collabora.com>
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
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11:32-20201204, Boris Brezillon wrote:
> On Tue, 1 Dec 2020 17:48:27 +0530
> Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> 
> > input_bus_flags are specified in drm_bridge_timings (legacy) as well
> > as drm_bridge_state->input_bus_cfg.flags
> > 
> > The flags from the timings will be deprecated. Bridges are supposed
> > to validate and set the bridge state flags from atomic_check.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++++
> >  drivers/gpu/drm/bridge/ti-tfp410.c                  | 1 +
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > index 2cd809eed827..9c17e4bb517e 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -2121,6 +2121,12 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
> >  		return -EINVAL;
> >  	}
> >  
> > +	/*
> > +	 * There might be flags negotiation supported in future
> > +	 * Set the bus flags in atomic_check statically for now
> > +	 */
> > +	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> > +
> >  	mutex_unlock(&mhdp->link_mutex);
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> > index 4c536df003c8..9035d2145a28 100644
> > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > @@ -245,6 +245,7 @@ int tfp410_atomic_check(struct drm_bridge *bridge,
> >  	 * Set the bus flags in atomic_check statically for now
> >  	 */
> >  	bridge_state->input_bus_cfg.flags = dvi->timings.input_bus_flags;
> > +	return 0;
> 
> And here is the return statement that was missing in patch 2 :-).

Sorry. I guess I messed up while rebasing. Will fix this

Nikhil D

> 
> >  }
> >  
> >  static const struct drm_bridge_funcs tfp410_bridge_funcs = {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
