Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B716121B162
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 10:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E326EB9C;
	Fri, 10 Jul 2020 08:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0867D6EB9B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 08:31:39 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jtoRT-0000yE-Jw; Fri, 10 Jul 2020 10:31:35 +0200
Message-ID: <58ef264448eb3ea75f846513210a5430b75b44c6.camel@pengutronix.de>
Subject: Re: [PATCH 0/4] Add support for GPU load values
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2020 10:31:33 +0200
In-Reply-To: <20200710074143.306787-1-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Freitag, den 10.07.2020, 09:41 +0200 schrieb Christian Gmeiner:
> This patch series add support for loadavg values for GPU
> sub-components. I am adding a SMA algorithm as I was not
> really sure if EWMA would be a good fit for this use case.

1 second is a pretty long window in GPU time. Why do you feel that a
simple moving average is more appropriate than a exponentially
weighted one here? Note that I haven't given this any thought myself
and haven't made up my mind yet, so this is a honest question to
understand the reasoning behind your choice.

Regards,
Lucas

> Christian Gmeiner (4):
>   drm/etnaviv: add simple moving average (SMA)
>   drm/etnaviv: add loadavg accounting
>   drm/etnaviv: show loadavg in debugfs
>   drm/etnaviv: export loadavg via perfmon
> 
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 14 ++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 44 ++++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h     | 29 +++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 79 +++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_sma.h     | 53 +++++++++++++++
>  5 files changed, 218 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_sma.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
