Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2012A862E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 19:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DBD6E103;
	Thu,  5 Nov 2020 18:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B686E103
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:37:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8D950804E0;
 Thu,  5 Nov 2020 19:37:45 +0100 (CET)
Date: Thu, 5 Nov 2020 19:37:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v13 0/7] Add support for KeemBay DRM drive
Message-ID: <20201105183744.GA95808@ravnborg.org>
References: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=0arIZ4qwRCrOfdWnULkA:9 a=CjuIK1q_8ugA:10
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
Cc: edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Wed, Nov 04, 2020 at 05:15:24PM -0800, Anitha Chrisanthus wrote:
> This is a new DRM driver for Intel's KeemBay SOC.
> The SoC couples an ARM Cortex A53 CPU with an Intel
> Movidius VPU.
> 
> This driver is tested with the KMB EVM board which is the reference baord
> for Keem Bay SOC. The SOC's display pipeline is as follows
> 
> +--------------+    +---------+    +-----------------------+
> |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> +--------------+    +---------+    +-----------------------+
> 
> LCD controller and Mipi DSI transmitter are part of the SOC and
> mipi to HDMI converter is ADV7535 for KMB EVM board.
> 
> The DRM driver is a basic KMS atomic modesetting display driver and
> has no 2D or 3D graphics.It calls into the ADV bridge driver at
> the connector level.
> 
> Only 1080p resolution and single plane is supported at this time.
> The usecase is for debugging video and camera outputs.

Thanks for all you tiresome work dealing with the feedback from the
community and me and thank you for the cooperation so far.

You have managed to convert this display driver from something based on
a wrong abstraction to a driver that not only are using the latest DRM
infrastructure but also now have the correct structure and correct
bindings.

There are still things we can improve - but rather than doing it
alone we are better served with the driver applied to drm-misc-next
so we are more that can help and maybe even contribute.

Patches applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
