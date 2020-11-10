Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1612AD3D1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 11:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457C892A4;
	Tue, 10 Nov 2020 10:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C86892A4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 10:31:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAAUxu8003809;
 Tue, 10 Nov 2020 04:30:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605004259;
 bh=UR4+kn10kmcCMRQFvMUdXFGMoQ1m1eWNzECzbuUk6DA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=HoDBRkmaoVDGhJD01AfsVQshOnSjy/PatkijNwW7FAD3T+lUzp5FJGI7nh4LcIuey
 eepztNF96ymoSv+4FBpryAkxleY/5FIHxHyYT62romtGEgFfSuTcTWHPJ52L+dCtYW
 jQpDL8XVI0xLk3jRLUO2PPFlXwB0eudyntndomZ8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAAUxxv056388
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 04:30:59 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 04:30:59 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 04:30:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 04:30:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAAUvZb114106;
 Tue, 10 Nov 2020 04:30:58 -0600
Date: Tue, 10 Nov 2020 16:00:57 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 0/6] drm/tidss: Use new connector model for tidss
Message-ID: <20201110103057.uvs5g4ucihatfimr@NiksLab>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <090c939b-5da9-4625-b126-78dcd477cf2d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <090c939b-5da9-4625-b126-78dcd477cf2d@ti.com>
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11:02-20201110, Tomi Valkeinen wrote:
> Hi Nikhil,
> 
> On 09/11/2020 19:05, Nikhil Devshatwar wrote:
> > This series moves the tidss to using new connectoe model, where the 
> > SoC driver (tidss) creates the connector and all the bridges are 
> > attached with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > 
> > Since the bridges do not create the connector, the bus format and
> > bus_flag is set after the format negotiation.
> > Support format negotiations in the tfp410 and mhdp bridge drivers
> > as a first step before moving the connector model.
> > 
> > Nikhil Devshatwar (6):
> >   drm: bridge: Propagate the bus flags from bridge->timings
    changes from v1:
    * Check for timings
    * Prioritize timings flags over next bridge's flags

> >   drm/bridge: tfp410: Support format negotiation hooks
    Changes from v1:
    * Use only MEDIA_BUS_FMT_FIXED for output

> >   drm/bridge: mhdp8546: Add minimal format negotiation
    Changes from v1:
    * cosmetic fixes, commit message update

> >   drm/tidss: Set bus_format correctly from bridge/connector
> >   drm/tidss: Move to newer connector model
    Changes from v1:
    * Add error handling

> >   drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable

> > 
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 32 ++++++++++++++++--
> >  drivers/gpu/drm/bridge/ti-tfp410.c            | 33 +++++++++++++++++++
> >  drivers/gpu/drm/drm_bridge.c                  |  8 +++++
> >  drivers/gpu/drm/tidss/tidss_drv.h             |  3 ++
> >  drivers/gpu/drm/tidss/tidss_encoder.c         | 22 ++++++++-----
> >  drivers/gpu/drm/tidss/tidss_kms.c             | 19 ++++++++++-
> >  6 files changed, 106 insertions(+), 11 deletions(-)
> > 
> 
> Please add a change log when sending new versions of a series.
> 

Actually, I had added the git notes, but missed to add --notes while
sending the patches using git send-email.

I am updating the change log here manually.

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
