Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593133BDB65
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 18:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8436E52C;
	Tue,  6 Jul 2021 16:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8C06E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 16:33:45 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1m0o10-00050V-GR; Tue, 06 Jul 2021 18:33:42 +0200
Message-ID: <678b4197893029819040781305d87d2cc566d293.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm/etnaviv: add GC7000 r6202 support
From: Lucas Stach <l.stach@pengutronix.de>
To: Michael Walle <michael@walle.cc>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 06 Jul 2021 18:33:39 +0200
In-Reply-To: <20210618120433.14746-1-michael@walle.cc>
References: <20210618120433.14746-1-michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: David Airlie <airlied@linux.ie>, "Lukas F . Hartmann" <lukas@mntre.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 18.06.2021 um 14:04 +0200 schrieb Michael Walle:
> This is the first step to bring GPU support to the NXP LS1028A SoC. It
> features a Mali DP500, a Vivante GC7000 and has one DisplayPort output
> which is driven by a Cadence MHDP controller and PHY.
> 
> This was briefly tested with glmark2, a patched mesa kmsro driver [1]
> to support the mali DP500/GC7000 duo, fixes from mesa merge request
> 9255 [2] and using ETNA_MESA_DEBUG=no_supertile,no_ts.
> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11419
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9255
> 
> Michael Walle (2):
>   drm/etnaviv: add HWDB entry for GC7000 r6202
>   drm/etnaviv: add clock gating workaround for GC7000 r6202
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  |  6 +++++
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)

Thanks, I've applied this series to my etnaviv/next branch.

Regards,
Lucas

