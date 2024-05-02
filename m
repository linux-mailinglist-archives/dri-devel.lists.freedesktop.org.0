Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE128B952F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BFE10E711;
	Thu,  2 May 2024 07:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qjrqIG4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A0010E711
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:22:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E583360E03;
 Thu,  2 May 2024 07:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45668C113CC;
 Thu,  2 May 2024 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714634566;
 bh=dYUwhMXgVlfaVtNX51nJ9f4iUba7AISPkGOpTHRC3Tc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjrqIG4yJ5hB09AEXtgo6cllzpZvQNIElLoebW08nYy8qyyUXovS8Q6TtTS9dNst7
 r/OSNYpewZ46C5wN0BjfV4zU0CqtdI5jyVnu3tvKKv5R7BSVkMgC7C05AJcwgJ5xZL
 EIoNyr75WetoTfYFH2F5LDleSQe+sukxjstj3wEB2LnomMykLUfz3KP1Z3j08zc0S9
 FBPgubsGBve6FWJRuargAwMXwjMMXTPUAdTNZauSnPIzHH/ogD7r8O+b9T9odcM3hN
 wiwNDImqn9nVcNiAnaWqADW/4g08dNGR/P6EwHUVT09ZvUt875HuoDC/z3OsMFEF9B
 QjBrj5HQLJa5g==
Date: Thu, 2 May 2024 08:22:39 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 00/19] backlight: Constify lcd_ops
Message-ID: <20240502072239.GD5338@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
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

On Wed, 24 Apr 2024, Krzysztof Kozlowski wrote:

> Hi,
> 
> Changes in v2:
> - Collect tags, including wrongly places Thomas' tag (which requires me
>   to manually edit 15 other patches to drop it).
> - Combine here checkpatch patch:
>   https://lore.kernel.org/all/20240414185440.288812-1-krzk@kernel.org/
> - Link to v1: https://lore.kernel.org/r/20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org

What's missing?  Are we good to go?

> Dependencies
> ============
> All further patches depend on the first patch.  Therefore everything
> could go via backlight tree (please ack) or via cross-tree pulls. Or
> whatever maintainer choose, just coordinate this with backlight.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (19):
>       backlight: Constify lcd_ops
>       backlight: ams369fg06: Constify lcd_ops
>       backlight: corgi_lcd: Constify lcd_ops
>       backlight: hx8357: Constify lcd_ops
>       backlight: ili922x: Constify lcd_ops
>       backlight: ili9320: Constify lcd_ops
>       backlight: jornada720_lcd: Constify lcd_ops
>       backlight: l4f00242t03: Constify lcd_ops
>       backlight: lms283gf05: Constify lcd_ops
>       backlight: lms501kf03: Constify lcd_ops
>       backlight: ltv350qv: Constify lcd_ops
>       backlight: otm3225a: Constify lcd_ops
>       backlight: platform_lcd: Constify lcd_ops
>       backlight: tdo24m: Constify lcd_ops
>       HID: picoLCD: Constify lcd_ops
>       fbdev: clps711x: Constify lcd_ops
>       fbdev: imx: Constify lcd_ops
>       fbdev: omap: lcd_ams_delta: Constify lcd_ops
>       const_structs.checkpatch: add lcd_ops
> 
>  drivers/hid/hid-picolcd_lcd.c            | 2 +-
>  drivers/video/backlight/ams369fg06.c     | 2 +-
>  drivers/video/backlight/corgi_lcd.c      | 2 +-
>  drivers/video/backlight/hx8357.c         | 2 +-
>  drivers/video/backlight/ili922x.c        | 2 +-
>  drivers/video/backlight/ili9320.c        | 2 +-
>  drivers/video/backlight/jornada720_lcd.c | 2 +-
>  drivers/video/backlight/l4f00242t03.c    | 2 +-
>  drivers/video/backlight/lcd.c            | 4 ++--
>  drivers/video/backlight/lms283gf05.c     | 2 +-
>  drivers/video/backlight/lms501kf03.c     | 2 +-
>  drivers/video/backlight/ltv350qv.c       | 2 +-
>  drivers/video/backlight/otm3225a.c       | 2 +-
>  drivers/video/backlight/platform_lcd.c   | 2 +-
>  drivers/video/backlight/tdo24m.c         | 2 +-
>  drivers/video/fbdev/clps711x-fb.c        | 2 +-
>  drivers/video/fbdev/imxfb.c              | 2 +-
>  drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
>  include/linux/lcd.h                      | 6 +++---
>  scripts/const_structs.checkpatch         | 1 +
>  20 files changed, 23 insertions(+), 22 deletions(-)
> ---
> base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
> change-id: 20240414-video-backlight-lcd-ops-276d8439ffb8
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzk@kernel.org>
> 

-- 
Lee Jones [李琼斯]
