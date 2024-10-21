Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B919A9A6EBF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79FF10E547;
	Mon, 21 Oct 2024 15:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aNfQkTjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93A010E549
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77A6C5C5562;
 Mon, 21 Oct 2024 15:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B4AC4CECD;
 Mon, 21 Oct 2024 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729525893;
 bh=8/4aoJTzSCYiAzLKs8b+N/pGj2ORTDbiLdb0guRvSRw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aNfQkTjjj/FOVbqBZAXuA2Aoa/2WByOzJCVi4fCuhNQJTSQp/QP6vfI4TNI2xVPfw
 5bQxFJpAtWtOv2ziazKqVLpiFP/XWkRfZnhzY/sYOe2Cgjn0fDM8htQ535ZXdrtgsf
 1C6hDLZIXFlo8ojwU7atkdYHEguF5/9E82r64HiupuS3EqiJiyvGtq21sQgrlEB4NI
 XItQzLIJQtQD2BgSx04ti4HJBcklRtcwJSWO2kGMup+EGas3i8cuzbi3yHip8lW4G7
 RD3yBTXXW8921faz0rhdWoArUYxVjzE0oEvTwiJStdHrun8uEQ/DaP1k36kn2aq8Po
 oc1BP2jVp3Vmg==
Date: Mon, 21 Oct 2024 17:51:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Lee Jones <lee@kernel.org>
cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, bonbons@linux-vserver.org, 
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 shawnguo@kernel.org, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between Backlight, HID and fbdev
 due for the v6.13 merge window
In-Reply-To: <20241001085540.GB7504@google.com>
Message-ID: <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20241001085540.GB7504@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 1 Oct 2024, Lee Jones wrote:

> Enjoy!
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13
> 
> for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:
> 
>   backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window

As picoLCD is the only affected driver in HID, I will be pulling this only 
if there are any patches for picoLCD submitted for 6.13 (which is not yet 
the case).

Thanks,

-- 
Jiri Kosina
SUSE Labs

