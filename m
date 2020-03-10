Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9B180381
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 17:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310B6E343;
	Tue, 10 Mar 2020 16:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969D06E343
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 16:32:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EE9E5F;
 Tue, 10 Mar 2020 17:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583857923;
 bh=LDGHkAfH5d23kNQDEMaXhj0LDcCaEU6eUbcrj6AsYO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=isn3PnG/h+4stRz84oVn790HFiqHxikpeHRLdOQ1FO1Vk9xYcPAY0HSB+h60AgLF6
 hIln2lH2i/8WGpSXL129k1yIpQIITvHVDJgcXhU+h9P14rWTGrehsVxCQArIJhaPNo
 kns3UA14GtllPOUIx+oKX9rmd4KGF4Ymz/F4Hmcg=
Date: Tue, 10 Mar 2020 18:32:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 16/21] drm: mxsfb: Add i.MX7 to the list of supported
 SoCs in Kconfig
Message-ID: <20200310163200.GB4871@pendragon.ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
 <CAOMZO5DmVXjhFpHYp9MoRK2BaazYikJ9R27Sa_S9614e1tNitQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5DmVXjhFpHYp9MoRK2BaazYikJ9R27Sa_S9614e1tNitQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Tue, Mar 10, 2020 at 01:28:35PM -0300, Fabio Estevam wrote:
> On Mon, Mar 9, 2020 at 4:53 PM Laurent Pinchart wrote:
> 
> >  config DRM_MXSFB
> > -       tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
> > +       tristate "i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB LCD controller"
> 
> Can't we just make it simpler and write: tristate "i.MX eLCDIF
> controller" instead?

It should then be "LCDIF and eLCDIF controllers" or "(e)LCDIF
controller", as the versions prior to i.MX6 were LCDIF and got later
extended to eLCDIF.

> Otherwise this list will get longer each time a new SoC is supported:
> 
> tristate "i.MX23/i.MX28/i.MX6SX/i.MX6SL/i.MX7/i.MX7ULP/i.MX8M/i.MX8MM/i.MX8QXP/i.MX8M
> MXSFB LCD controller"
> 
> and probably more :-)

It's a good point, and I agree. I'll fix this.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
