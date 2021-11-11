Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B044D654
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 13:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA596EA26;
	Thu, 11 Nov 2021 12:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B502C6EA26
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 12:07:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ABC7Hqq015276;
 Thu, 11 Nov 2021 06:07:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1636632437;
 bh=RFY8vcAlJt3jAFzCZzexLytEhRxy/imNlg2DEtzITSQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bbNJUPJaZqxwAr588pN1xTiNdPOGocWwZ/7spRIH5XdBmfvSHXdVEkNb7hqlXRUtV
 O+AfwAZz4ovRAAheHos+w0WSOj24CJni0PmJDwuMtvT1z05JyHLkR3B7GunrsiJOjy
 oWYw1qZGy8B1w+kBbWfKfaUFc5WkXngksnybQlyU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ABC7Hg1091580
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Nov 2021 06:07:17 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 11
 Nov 2021 06:07:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 11 Nov 2021 06:07:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ABC7F3h027907;
 Thu, 11 Nov 2021 06:07:16 -0600
Date: Thu, 11 Nov 2021 17:37:14 +0530
From: Rahul T R <r-ravikumar@ti.com>
To: <thierry.reding@gmail.com>, <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: simple: Initialize bpc in RK101II01D-CT panel
 descriptor
Message-ID: <20211111120714.74luy3cksxyeuk7h@uda0490373>
References: <20211028115242.28539-1-r-ravikumar@ti.com>
 <20211108163340.tafx6tug7wkdii7e@uda0490373>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211108163340.tafx6tug7wkdii7e@uda0490373>
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

On 22:03-20211108, Rahul T R wrote:
> On 17:22-20211028, Rahul T R wrote:
> Hi Thierry / Sam,
> 
> Can you please review this patch
> 
> Regards
> Rahul T R

ping

> > Initialize bpc while creating panel_desc structure for RK101II01D-CT
> > 
> > Below warning is triggered since bpc is not being initialized
> > 
> > WARNING: CPU: 2 PID: 47 at drivers/gpu/drm/panel/panel-simple.c:614
> > panel_simple_probe+0x1b0/0x3c8
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index dde033066f3d..32f775db5cb7 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3027,6 +3027,7 @@ static const struct drm_display_mode rocktech_rk101ii01d_ct_mode = {
> >  
> >  static const struct panel_desc rocktech_rk101ii01d_ct = {
> >  	.modes = &rocktech_rk101ii01d_ct_mode,
> > +	.bpc = 8,
> >  	.num_modes = 1,
> >  	.size = {
> >  		.width = 217,
> > -- 
> > 2.17.1
> > 
