Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB549E7A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 17:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCDC10E157;
	Thu, 27 Jan 2022 16:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 590 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 16:35:29 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A12C10E157
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 16:35:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20RGPWNV122864;
 Thu, 27 Jan 2022 10:25:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643300732;
 bh=BKF0oYN3z6h33xfjg1fmAjSM+i6C6XjS9xLZPqddQ24=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jFkSlvQO8e8NHCaTf7W04TvFwPHhd0g5jtAX8Own8OopclXfqQFHBZiZrHmlj89dC
 M0tbWA4DgWMYVVuA4BVnS1hShZjpPCOP/oA0RYCYX/DOG0RvgJEZl4q/cyZJ1btveM
 Aj16FPZzx46ki052UlcYAIgyBp8ycM0549Px7NZg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20RGPWhL067686
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Jan 2022 10:25:32 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 27
 Jan 2022 10:25:31 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 27 Jan 2022 10:25:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20RGPU3w108915;
 Thu, 27 Jan 2022 10:25:31 -0600
Date: Thu, 27 Jan 2022 21:55:29 +0530
From: Rahul T R <r-ravikumar@ti.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: simple: Initialize bpc in RK101II01D-CT panel
 descriptor
Message-ID: <20220127162526.ubg6nyah2zw7mxe3@uda0490373>
References: <20211028115242.28539-1-r-ravikumar@ti.com>
 <20211108163340.tafx6tug7wkdii7e@uda0490373>
 <20211111120714.74luy3cksxyeuk7h@uda0490373>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211111120714.74luy3cksxyeuk7h@uda0490373>
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
Cc: airlied@linux.ie, nikhil.nd@ti.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17:37-20211111, Rahul T R wrote:
> On 22:03-20211108, Rahul T R wrote:
> > On 17:22-20211028, Rahul T R wrote:
> > Hi Thierry / Sam,
> > 
> > Can you please review this patch
> > 
> > Regards
> > Rahul T R
> 

Ping

> ping
> 
> > > Initialize bpc while creating panel_desc structure for RK101II01D-CT
> > > 
> > > Below warning is triggered since bpc is not being initialized
> > > 
> > > WARNING: CPU: 2 PID: 47 at drivers/gpu/drm/panel/panel-simple.c:614
> > > panel_simple_probe+0x1b0/0x3c8
> > > 
> > > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index dde033066f3d..32f775db5cb7 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -3027,6 +3027,7 @@ static const struct drm_display_mode rocktech_rk101ii01d_ct_mode = {
> > >  
> > >  static const struct panel_desc rocktech_rk101ii01d_ct = {
> > >  	.modes = &rocktech_rk101ii01d_ct_mode,
> > > +	.bpc = 8,
> > >  	.num_modes = 1,
> > >  	.size = {
> > >  		.width = 217,
> > > -- 
> > > 2.17.1
> > > 
