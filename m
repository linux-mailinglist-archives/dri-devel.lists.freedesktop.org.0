Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E638B57F86
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9955410E4D7;
	Mon, 15 Sep 2025 14:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mmS/Vo21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90E10E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:52:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C116442C8;
 Mon, 15 Sep 2025 14:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2EEC4CEF1;
 Mon, 15 Sep 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757947942;
 bh=ps5J/2DiZZaZALrpYJv7qOm8LVVHiYQgbB13On5S8hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mmS/Vo21BRD8mRQMpNk4G3zLBRL1lTZ+I8/bL1wg0v/acaTcjlwR1yLqPqOzn7o+g
 i5K8F8QFOxIMfCjUrvuIK7eLysVkrvP01pRRNVpKklxtCd9ydO8DAFrHznZxg9CTYV
 wtDkAFc35jVCWqqDs19gsP+Ab/j8IHtiw8vpNKdpZO8QGEyKXFANA/igYzR08SHJ7x
 OuP7FJrKVTpb9+zNxFo+0uieUv6+X6PrWE2hKtyPyOCUpyXjNZxsh83cxaTFB4Rh7W
 U6KP2nAyVpU+r/v0bj9++QC7zmWH0e66OPrvfjESyuoGl+vdwHLO4J1CtLSNT+LfSe
 d/OZQyDPYDsiA==
Date: Mon, 15 Sep 2025 15:52:15 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
 j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 11/15] backlight: ktd2801: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgoHwP912AEQcY0@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-12-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:48PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
