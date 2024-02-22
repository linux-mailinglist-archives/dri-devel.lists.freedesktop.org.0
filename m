Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD3E85FE27
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D7110E56B;
	Thu, 22 Feb 2024 16:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="oN71bRA/";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="He4/NDRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8257410E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oPosSnn8fY/rzwoj/enVOe6Z1lYkcpcW6DlSnIgh43M=;
 b=oN71bRA/GdVuiyK3Lm7p5ns8VDRbrxtghimDZZRESD8wDbM7vxVxGFYy4XOe8Na2eQyXH3I5QEbbg
 SpOqsNwjGFTrTe/uReYFWC+mXa1KFcR896X1z7u3nzc4hQVIzBDRxiPRo+0o4s8KEcf9ysR+AbyKiT
 37xW8Aai5fUpTe6k6PVtFWLpANxR9E0YEreOdwBmESjSmW5EoNtdckdDV181f6f6O07NB148fRUZGx
 Gw1w4FuW7cNhjGaxa8WYriqbERmdEdBFj1FA/ojC3WyEJ8EPdS/3hPtujsyKi0B8z2q/jgXAni9RZ2
 wb76wUoo7dl+fpYgr4MkkCPgvs9Kc8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oPosSnn8fY/rzwoj/enVOe6Z1lYkcpcW6DlSnIgh43M=;
 b=He4/NDRDpeD/qMSy1N3MbaIIOcwhK8T8p3QrJ/Cig9R6zIrylKCqOwmiHepFhFPGyxcheaHrFcZHL
 E5FyMPxAA==
X-HalOne-ID: 61dee748-d1a0-11ee-8c36-119507214a65
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 61dee748-d1a0-11ee-8c36-119507214a65;
 Thu, 22 Feb 2024 16:35:27 +0000 (UTC)
Date: Thu, 22 Feb 2024 17:35:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hari.PrasathGE@microchip.com, Balamanikandan.Gunasundar@microchip.com,
 Durai.ManickamKR@microchip.com, Nayabbasha.Sayed@microchip.com,
 Dharma.B@microchip.com, Varshini.Rajendran@microchip.com,
 Balakrishnan.S@microchip.com, Charan.Pedumuru@microchip.com
Subject: Re: [PATCH v8 0/7] Add support for XLCDC to sam9x7 SoC family.
Message-ID: <20240222163526.GA2576040@ravnborg.org>
References: <20240221053531.12701-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221053531.12701-1-manikandan.m@microchip.com>
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

On Wed, Feb 21, 2024 at 11:05:24AM +0530, Manikandan Muralidharan wrote:
> This patch series aims to add support for XLCDC IP of sam9x7 SoC family
> to the DRM subsystem.XLCDC IP has additional registers and new
> configuration bits compared to the existing register set of HLCDC IP.
> The new compatible string "microchip,sam9x75-xlcdc" is defined for sam9x75
> variant of the sam9x7 SoC family.The is_xlcdc flag under driver data and
> IP specific driver ops helps to differentiate the XLCDC and existing HLCDC
> code within the same driver.
> 
> changes in v8:
> * Re-arrange the patch set to prepare and update the current HLCDC
> code base with the new LCDC IP based driver ops and then add support
> for XLCDC code changes.
> * Fix Cosmetic issues.
> 
> changes in v7:
> * LCDC IP driver ops functions are declared static and its 
> declaration are removed.
> 
> changes in v6:
> * Fixed Cosmetic defects.
> * Added comments for readability.
> 
> changes in v5:
> * return value of regmap_read_poll_timeout is checked in failure
> case.
> * HLCDC and XLCDC specific driver functions are now invoked
> using its IP specific driver ops w/o the need of checking is_xlcdc flag.
> * Removed empty spaces and blank lines.
> 
> changes in v4:
> * fixed kernel warnings reported by kernel test robot.
> 
> changes in v3:
> * Removed de-referencing the value of is_xlcdc flag multiple times in
> a single function.
> * Removed cpu_relax() call when using regmap_read_poll_timeout.
> * Updated xfactor and yfactor equations using shift operators
> * Defined CSC co-efficients in an array for code readability.
> 
> changes in v2:
> * Change the driver compatible name from "microchip,sam9x7-xlcdc" to
> "microchip,sam9x75-xlcdc".
> * Move is_xlcdc flag to driver data.
> * Remove unsed Macro definitions.
> * Add co-developed-bys tags
> * Replace regmap_read() with regmap_read_poll_timeout() call
> * Split code into two helpers for code readablitity.
> ---
> 
> Durai Manickam KR (1):
>   drm: atmel-hlcdc: Define XLCDC specific registers
> 
> Manikandan Muralidharan (6):
>   drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
>   drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
>   drm: atmel-hlcdc: add DPI mode support for XLCDC
>   drm: atmel-hlcdc: add vertical and horizontal scaling support for
>     XLCDC
>   drm: atmel-hlcdc: add support for DSI output formats
>   drm: atmel-hlcdc: add LCD controller layer definition for sam9x75

Hi Manikandan

thanks for your paitent follow-up on this patch set.
Everything looks good and all patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

We are at v8 now and if there are additional comments we can handle them
in-tree.
I have asked Thomas Zimmermann to apply the patches to drm-misc as I
have lost my push infrastructure atm.

	Sam
