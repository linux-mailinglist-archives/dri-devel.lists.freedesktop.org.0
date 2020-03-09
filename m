Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3BA17E7B9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57989BF4;
	Mon,  9 Mar 2020 19:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F916E51C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:01:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EFC82D2;
 Mon,  9 Mar 2020 20:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583780490;
 bh=3askrFT9roD6RevQvesKBOx5ZyVSN0CJpsyoH/s76l8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGmAR18cS0ilbbPcihmKmADKhDDfYLrVnyAmeM9Z8Mgk/mGeDg+kWRcXg9ygxkqZe
 /Rz77nvAkSMORo7JrRoklMwu1L+hNFb5SQ1+q/0vfADq7Dr+xw21UALQXd7PrjUbt7
 fS1NcaO1skxzcU/oNkUclbm6VYAm6SFGA1Ay+CWs=
Date: Mon, 9 Mar 2020 21:01:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: panel: Set connector type for OrtusTech
 COM43H4M85ULC panel
Message-ID: <20200309190127.GB4916@pendragon.ideasonboard.com>
References: <20200309184210.10042-1-laurent.pinchart@ideasonboard.com>
 <20200309190047.GA7543@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309190047.GA7543@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Mar 09, 2020 at 08:00:47PM +0100, Sam Ravnborg wrote:
> On Mon, Mar 09, 2020 at 08:42:10PM +0200, Laurent Pinchart wrote:
> > The OrtusTech COM43H4M85ULC is a DPI panel, set the connector type
> > accordingly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I assume you will apply to drm-misc-next - OK?

I still haven't got around to using dim :-)

> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index e14c14ac62b5..145ee05dcacd 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2439,6 +2439,7 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> >  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> > +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> >  };
> >  
> >  static const struct drm_display_mode osddisplays_osd070t1718_19ts_mode  = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
