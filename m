Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA7B57F80
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E34410E4D3;
	Mon, 15 Sep 2025 14:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lt8uy5TI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06310E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:51:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E525260244;
 Mon, 15 Sep 2025 14:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688BC4CEF7;
 Mon, 15 Sep 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757947878;
 bh=bma8GiY4yUzV27qSAWPGDFtL0k+HG+lI2FGJDZ+a/PQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lt8uy5TIMZvdWWoEVcsK6aGDdWEzGe8s7vVNvgTd8ZNu1QQjqO6SWmHCJ1Q6WbO5S
 Gz9lbP7gQbJJwWUMmpaY0xDTSM4Ck5MC8Ubwx7/bLfG7TviNkhu7mdLPAY4/mBqYfH
 3zvh1C4ulnfpd2PrkkGGiPXI7IBbH5HxfdD4DpPkHbPXXxjUIRiRaK1weTrIn7ujFN
 mH4Sgv5RVTwD1jV8B/IKNs6JMrnLOEpj+9V62T06Vkwn6Diz1nHaBEjHmQT/JmtKiX
 huJplgGSJNy+ewquR96QHCN2HVoGry4w+hsTnaqqpUDbXWHxUsu6H8sXECoENs8CUM
 8sXhYcx0pEoEQ==
Date: Mon, 15 Sep 2025 15:51:11 +0100
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
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 09/15] backlight: da9052_bl: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgn3zB9yigdlVrw@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-10-tzimmermann@suse.de>
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

On Tue, Jul 15, 2025 at 02:24:46PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct platform_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
