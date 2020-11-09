Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE62AB55A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7399E898BF;
	Mon,  9 Nov 2020 10:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DC8898BF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:48:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06C3BB2B;
 Mon,  9 Nov 2020 11:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604918921;
 bh=zlUHVoOUWGx1rKdSviLG7dzZwgmtkT7iGapWHY4fBVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INy48GvkJCqk+f21b6KOe2TDBaduhhqOYSFqQnQ1aCm2YdvGIioqiGG43iDdoLxmf
 8ue4c3u/Uzft3VRiNKaa7Mwq14+luZmeWuqSWaWJlsK11g+V774UKPGwieRqyimoT9
 1eTGw4n/tYsiZdkjYEjxYsp+IR0/6NWlHZqEkBzc=
Date: Mon, 9 Nov 2020 12:48:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 36/56] drm/omap: panel-dsi-cm: use DEVICE_ATTR_RO
Message-ID: <20201109104837.GG6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-37-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-37-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:13PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use DEVICE_ATTR_RO helper instead of plain DEVICE_ATTR,
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 3668b3f0aff2..5159dd51a353 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -219,7 +219,7 @@ static const struct backlight_ops dsicm_bl_ops = {
>  	.update_status  = dsicm_bl_update_status,
>  };
>  
> -static ssize_t dsicm_num_errors_show(struct device *dev,
> +static ssize_t num_dsi_errors_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> @@ -239,7 +239,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
>  }
>  
> -static ssize_t dsicm_hw_revision_show(struct device *dev,
> +static ssize_t hw_revision_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> @@ -259,8 +259,8 @@ static ssize_t dsicm_hw_revision_show(struct device *dev,
>  	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
>  }
>  
> -static DEVICE_ATTR(num_dsi_errors, S_IRUGO, dsicm_num_errors_show, NULL);
> -static DEVICE_ATTR(hw_revision, S_IRUGO, dsicm_hw_revision_show, NULL);
> +static DEVICE_ATTR_RO(num_dsi_errors);
> +static DEVICE_ATTR_RO(hw_revision);
>  
>  static struct attribute *dsicm_attrs[] = {
>  	&dev_attr_num_dsi_errors.attr,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
