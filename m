Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB15BAFAF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CF210E4A3;
	Fri, 16 Sep 2022 14:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4AB10E48A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 14:56:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oZCld-0001z7-2s; Fri, 16 Sep 2022 16:56:33 +0200
Message-ID: <94e054f61f287ae1bd66a2d27fe4b3f16b67bde8.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/2] drm/etnaviv: GC300 fixes
From: Lucas Stach <l.stach@pengutronix.de>
To: Doug Brown <doug@schmorgal.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Sep 2022 16:56:31 +0200
In-Reply-To: <20220910202939.31010-1-doug@schmorgal.com>
References: <20220910202939.31010-1-doug@schmorgal.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Samstag, dem 10.09.2022 um 13:29 -0700 schrieb Doug Brown:
> This series contains a few special cases for supporting the GC300
> properly. These were found in the drivers in the vivante_kernel_drivers
> repository. These changes were tested on a PXA168 with GC300 revision
> 0x2201 (date 0x20080814, time 0x12051100), which already has an existing
> special case in the driver to modify the revision to 0x1051.
> 
Thanks, both patches applied to my etnaviv/next branch.

Regards,
Lucas

> Changes since v2:
> - Dump canonical address in etnaviv_core_dump_registers
> - Misc fixes from review by Lucas
> 
> Changes from v1->v2:
> - Move power register address remapping to new gpu_read_power and
>   gpu_write_power accessors instead of modifying gpu_read and gpu_write.
> 
> Doug Brown (2):
>   drm/etnaviv: add missing quirks for GC300
>   drm/etnaviv: fix power register offset on GC300
> 
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c |  7 +++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 31 ++++++++++++++++----------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 21 +++++++++++++++++
>  3 files changed, 46 insertions(+), 13 deletions(-)
> 


