Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A72CA058
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1C6E4CF;
	Tue,  1 Dec 2020 10:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7541F6E4CF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:52:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AqE9T034860;
 Tue, 1 Dec 2020 04:52:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606819934;
 bh=pdYW9ARDhn1MLXl9n+HyHVWrZTAG5764RfujmXNitjM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bULYZ48wwWTSyybaBQeO4jwnlVk9gYZAo4jT6z5b7B1vuKzv8r1BcQOjAVCY4FkF2
 JnVNKXSpUmv6qcHYZlwGsIokSDD95etFJ5bCgHTeb4MMvVlX2YH2bUFu+W06ZK2pge
 BaK1FBIXzv0NOf9cDGbGFXw2FizFz+EP0e6WUVPs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1AqEIk024150
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:52:14 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:52:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:52:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AqCo4100171;
 Tue, 1 Dec 2020 04:52:13 -0600
Date: Tue, 1 Dec 2020 16:22:12 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
Message-ID: <20201201105212.de3loq5zjnicfsyi@NiksLab>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-2-nikhil.nd@ti.com>
 <20201130093600.GB4141@pendragon.ideasonboard.com>
 <39d7cf1d-d25b-abc6-a6c6-5d1d18a6b3ff@ti.com>
 <20201130094753.GF4141@pendragon.ideasonboard.com>
 <86a8d1a6-3464-245b-a08a-ad212ab0ae53@ti.com>
 <e8ca17ee-5a62-3944-825e-7066646c1db1@ti.com>
 <20201130185939.GD4141@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130185939.GD4141@pendragon.ideasonboard.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20:59-20201130, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Nov 30, 2020 at 12:04:27PM +0200, Tomi Valkeinen wrote:
> > On 30/11/2020 12:02, Tomi Valkeinen wrote:
> > > On 30/11/2020 11:47, Laurent Pinchart wrote:
> > > 
> > >>>> Hasn't Boris commented in his review of v1 that bus flags should be set
> > >>>> in atomic_check, even when they're static ? We're moving towards
> > >>>> removing timings->input_bus_flags, so this patch goes in the wrong
> > >>>> direction :-S
> > >>>
> > >>> We have atomic_check only if the bridge has implemented atomic funcs. And even if there's
> > >>> atomic_check, not all bridges set the bus_flags there. So we need to either 1) fix the issue for now
> > >>> as in this patch, or 2) convert all bridges to use atomic funcs and fix all the bridges to set the
> > >>> bus_flags.
> > >>
> > >> The second option is what we'd like to achieve. Wouldn't it be best to
> > >> already start going in that direction ? We don't need to convert all
> > >> bridge drivers in one go here, just the ones that are used by tidss.

I took this as a future approach to eventually start supporting
atomic_funcs.
I will respin v4 of this series with updates to the other bridges
supporting atomic functions.

Nikhil Devshatwar

> > > 
> > > I think that sounds fine, except that this is blocking the DisplayPort support for J7. We have
> > > everything in for DP except dts changes (can be added only when the drivers work), and the connector
> > > stuff.
> > > 
> > > The connector stuff includes this series (so that tidss supports the new connector model), and
> > > "[PATCH RESEND v3 0/2] drm: add DisplayPort connector", which adds the connector driver.
> > > 
> > > The bridges currently used (that I know of) with tidss are cdns-mhdp, tfp410 and sii9022. I don't
> > > expect converting those would be a huge job, but I'd still really like to get the DP working in
> > > upstream without starting to expand the scope of the patches we need to enable it.
> > > 
> > > That said, we missed 5.11 so perhaps we have the time.
> 
> If there's not enough time to address the bridges, I'm fine with this
> series assuming the bridge changes will go on top. If we have enough
> time, let's go for it :-)
> 
> > Looks like Boris was missing from Cc in this series. Adding him.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
