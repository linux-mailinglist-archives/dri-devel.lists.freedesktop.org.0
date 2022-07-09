Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A549656C82A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 10:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193610FF56;
	Sat,  9 Jul 2022 08:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93210FF56
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=gs8KDmhlNILcqnUdnit/VGq/nXBrEPUEnhWCQD8FeIs=;
 b=bmF/IMxAjnXDRuQ3Dcxc6gR4dANeUF5ACmpcsOmWh9UuQHms6+O4U5vwEWaWrcLl6GQfIvMQSS2jg
 cq8psRmKdZ65ZDRs7y54rXhHX3ws8sxbXGtnThh2l2tCTKJNrg7xqJonnpMiJFiWjyVi9BEzmwWl7T
 h0yUo9KSb+BruHjp0mLw10DPXq6zPEsHjKwU2NLq5IrwPdX86pdsJu0y1VzhPo3w7mfzfiAFE5iIjQ
 R/Qz+MfHxTfYvLctdcfiq02Ltm86Hm20+Lqa4RkVKl5nTPqcEFgGEHISwmNnWXuoH9rCUd8jfgYqib
 dXGSg/twBzLpoSwXAJultec8JmiEnKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=gs8KDmhlNILcqnUdnit/VGq/nXBrEPUEnhWCQD8FeIs=;
 b=AnCp4W94Flg0SH6/23lt0UAXeESaD/wz1vmTrXIpKW+/6hBXLOV9qFxY+jU8tyHFeXycJ5NmeYm19
 GWI7+tLCg==
X-HalOne-Cookie: 78badfdac9c01378d6bba2482b7622648e92dd25
X-HalOne-ID: 3f61f2c4-ff64-11ec-a917-d0431ea8a290
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3f61f2c4-ff64-11ec-a917-d0431ea8a290;
 Sat, 09 Jul 2022 08:50:57 +0000 (UTC)
Date: Sat, 9 Jul 2022 10:50:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 3/3] drm/mipi-dsi: Make remove callback return void
Message-ID: <YslBbzfNQgNwUcIm@ravnborg.org>
References: <20220708094922.1408248-1-u.kleine-koenig@pengutronix.de>
 <20220708094922.1408248-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708094922.1408248-4-u.kleine-koenig@pengutronix.de>
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
Cc: Ondrej Jirman <megous@megous.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, kernel@pengutronix.de,
 Thierry Reding <thierry.reding@gmail.com>, Purism Kernel Team <kernel@puri.sm>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 11:49:22AM +0200, Uwe Kleine-König wrote:
> All implementations return 0 and the return value of mipi_dsi_drv_remove()
> is ignored anyhow.
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed and applied to drm-misc (drm-misc-next).
While applying updating panel-ebbg-ft8719

	Sam
