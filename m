Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE6580F9D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 11:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560E918A768;
	Tue, 26 Jul 2022 09:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5718A6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 09:12:41 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGGcB-00049r-Fr; Tue, 26 Jul 2022 11:12:31 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oGGc8-00058M-9p; Tue, 26 Jul 2022 11:12:28 +0200
Date: Tue, 26 Jul 2022 11:12:28 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: robert.foss@linaro.org, laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, maxime@cerno.tech
Subject: Re: [PATCH 0/6] TI SN65DSI83 Features
Message-ID: <20220726091228.nvvyzab7wyzrnfrr@pengutronix.de>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150548.1236307-1-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

gentle ping on this series since I didn't received much feedback for the
code.

Regards,
  Marco

On 22-05-30, Marco Felsch wrote:
> Hi,
> 
> the purpose of this small series is to enable the support for the reverse
> lane feature and to add support for reset controllers which can drive
> the enable pin.
> 
> Regards,
>   Marco
> 
> Marco Felsch (6):
>   drm/bridge: ti-sn65dsi83: make lvds lane register setup more readable
>   dt-bindings: drm/bridge: ti-sn65dsi83: add documentation for reverse
>     lvds lanes
>   drm/bridge: ti-sn65dsi83: add support to swap the LVDS data lanes
>   drm/bridge: ti-sn65dsi83: make use of dev_err_probe
>   dt-bindings: drm/bridge: ti-sn65dsi83: Add reset controller
>     documentation
>   drm/bridge: ti-sn65dsi83: add support for a external reset controller
> 
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 64 ++++++++++++-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 89 +++++++++++++++++--
>  2 files changed, 145 insertions(+), 8 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
> 
