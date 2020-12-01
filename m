Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF22CA095
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F66E4EA;
	Tue,  1 Dec 2020 10:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC936E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:57:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1AvrZG036342;
 Tue, 1 Dec 2020 04:57:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606820273;
 bh=lgx+walQugzAWTVCzANibRhN9Ek+l0J4YjDnVBUDDDU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CtoDzN8qki2dFsBYCd9n0hdaPh9SJKhFEWESsTX1IiRphxutsgrwaSouK8VLIo7wy
 WzHByXZyYXqECgEWUZZ41Ht5MKj+qQL6Aqi2/JfANfplTc254eewhWz/X+mQNjLYMP
 ytGtVZLyTR6+9MBLu+Ge9pQCuAOmZAg4jYA38x90=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1Avr5R122937
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 04:57:53 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 04:57:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 04:57:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1Avpxp005933;
 Tue, 1 Dec 2020 04:57:52 -0600
Date: Tue, 1 Dec 2020 16:27:51 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201201105751.zdvurlaainaoss52@NiksLab>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
 <a36967dc-ca5f-d231-198b-1153c9720d65@ti.com>
 <20201130063503.phivehin7l2cx53j@NiksLab>
 <20201130094617.GE4141@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130094617.GE4141@pendragon.ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11:46-20201130, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> On Mon, Nov 30, 2020 at 12:05:03PM +0530, Nikhil Devshatwar wrote:
> > On 14:51-20201125, Tomi Valkeinen wrote:
> > > On 19/11/2020 18:01, Nikhil Devshatwar wrote:
> > > > Remove the old code to iterate over the bridge chain, as this is
> > > > already done by the framework.
> > > > The bridge state should have the negotiated bus format and flags.
> > > > Use these from the bridge's state.
> > > > If the bridge does not support format negotiation, error out
> > > > and fail.
> > > > 
> > > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > ---
> > > > 
> > > > Notes:
> > > >     changes from v2:
> > > >     * Remove the old code and use the flags from the bridge state
> > > > 
> > > >  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
> > > >  1 file changed, 14 insertions(+), 22 deletions(-)
> > > 
> > > If a first bridge (after the crtc) supports two bus formats as input, how does tidss choose between
> > > those? This patch just picks bstate->input_bus_cfg.format, and it's not clear to me which one that
> > > is (the first one?). Also, we don't check if tidss actually supports the bus format.
> > 
> > The selection is done by the framework in
> > select_bus_fmt_recursive at drivers/gpu/drm/drm_bridge.c:810
> > 
> > My understanding is that currently, the format negotiation logic does
> > not negotiate all the way till encoder, it stops only at the
> > first_bridge.
> 
> Should we then implement a bridge in the tidss driver to model the
> internal encoder, in order to support format negotiation all the way to
> the tidss ?

I am not sure. Scope of this series is to enable tidss with new
connector model. As of now, there aren't any bridges that report
unsupported format, so nothing is broken.

When the bridge drivers start reporting unsupported formats, we can
evaluate if it makes sense to implement the internal encoder as a bridge.

Nikhi Devshatwar

> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
