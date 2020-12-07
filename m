Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC62D11D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B396E573;
	Mon,  7 Dec 2020 13:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66D66E573
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 13:25:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DPbJn098420;
 Mon, 7 Dec 2020 07:25:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607347537;
 bh=e5qgb5EQR058USE76Q5GgQAF+CLIHazcepJ6UkDipy8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bUiQx/BdZGTs7QxvffG1sssaJ73gCtqybG598LYjIjkzXTSnlKsSzHSo/ewv8Tj1I
 KJsMYDGUwnvQDRde/8rjeRZiY9Qg+vXa/LwJ3uMTW/xXjv56n1+VyAp5izN7+RhSgJ
 UBW92zw4DQuYNEmL0TmpkVAFK6FxP1XXVhPYfU1c=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7DPbH1092257
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Dec 2020 07:25:37 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 07:25:37 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 07:25:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DPZfP121770;
 Mon, 7 Dec 2020 07:25:36 -0600
Date: Mon, 7 Dec 2020 18:55:35 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 4/7] drm/bridge: mhdp8546: Set input_bus_flags from
 atomic_check
Message-ID: <20201207132535.5jisket6jpij7ybz@NiksLab>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-5-nikhil.nd@ti.com>
 <20201204114244.3754309b@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204114244.3754309b@collabora.com>
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

On 11:42-20201204, Boris Brezillon wrote:
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
> 
> I'd go even further and replace the timings field in
> cdns_mhdp_platform_info by an input_bus_flags field, you'll then
> have the following assignment here.
> 
> 	if (mhdp->info)
> 		bridge_state->input_bus_cfg.flags = mhdp->info->input_bus_flags;
> 
> This way you no rely on the bridge->timings presence and can
> get rid of the mhdp->bridge.timings assignment in the probe path.
> 

Okay, I'll update this patch

> 
> > +
> >  	mutex_unlock(&mhdp->link_mutex);
> >  	return 0;
> >  }
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
