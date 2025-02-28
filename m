Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB60A49770
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31410EC35;
	Fri, 28 Feb 2025 10:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA5510EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:34:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1tnxgt-0002as-BF; Fri, 28 Feb 2025 11:33:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1tnxgs-003HHx-1G;
 Fri, 28 Feb 2025 11:33:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1tnxgs-005Gvf-0k;
 Fri, 28 Feb 2025 11:33:58 +0100
Date: Fri, 28 Feb 2025 11:33:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Message-ID: <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
 <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-02-27, Marek Vasut wrote:
> On 2/27/25 9:17 PM, Marco Felsch wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > > index 06fe46e320738..2504a456d45c4 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
> > >   ATTRIBUTE_GROUPS(panthor);
> > >   static const struct of_device_id dt_match[] = {
> > > +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> > 			  ^
> > 			 nxp?
> > 
> > Can we switch to nxp instead?
> We can ... is that the current recommendation ?
> 
> Why not stick with fsl , is that deprecated now ?

Nope I don't think so but I do see patches adding 'nxp' as vendor
(mostly external chips) and some with 'fsl' (mostly soc internal ip
cores).

My hope was that at some point we could switch to 'nxp' only and make
use of this vendor-prefix. Of course NXP should start with that switch
but this seems not to happen :/

It's more a nit but maybe this triggers NXP to make use of the 'nxp'
vendor-prefix as well once they upstream a new base dtsi.

Regards,
  Marco
