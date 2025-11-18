Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166AC6B2C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75810E14B;
	Tue, 18 Nov 2025 18:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eD1y3QWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CEC10E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 18:17:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F91060194;
 Tue, 18 Nov 2025 18:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE40C4CEF1;
 Tue, 18 Nov 2025 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763489436;
 bh=G26ClVXWETxoz3CRO4rAONJmSKqzBRQWYIkNvbFxDf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eD1y3QWCcWAcNqgJ3QcXmKj9xWs58zdkNSTOJ91Iu9ftV+eZHH+VFMTtSMTISRhCQ
 dnyRONMkkjcfeB7ViR7C24W//i2P3TJG2GhNGHIaROU1yBHg1/TqDUQN1U+zbtL5Pl
 bd9RP4x4SRPeA6TiJc42DHM1d3rn6ZsuMJx8rWbCTuNm4IBtDwGUs+u0kmWkKXbFJ2
 ByTMg/4zVNueEC5FK2RXVSBmdlaXzvgeDORWcOx/cdl86LX4Pq1Fsik7qQcv58Zp7/
 nNMZ+lGsc/nKs/64YG4yZFlTStH4xux4i3HVBIfV0AmMKFVzslvbYN3m11c3rib5sX
 VNAfXm20nCyGg==
Date: Tue, 18 Nov 2025 18:10:30 +0000
From: Lee Jones <lee@kernel.org>
To: petri.karhula@novatron.fi
Cc: Thomas Richard <thomas.richard@bootlin.com>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Message-ID: <20251118181030.GQ1949330@google.com>
References: <20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi>
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

On Tue, 18 Nov 2025, Petri Karhula via B4 Relay wrote:

> From: Petri Karhula <petri.karhula@novatron.fi>
> 
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
> 
> Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
> ---
> Backlight driver to control backlight behind Congatec Board Controller.
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
>     
> ---
>  drivers/mfd/cgbc-core.c           |   1 +

Please separate this out into its own patch.

>  drivers/video/backlight/Kconfig   |  11 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/cgbc_bl.c | 281 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 294 insertions(+)

[...]

-- 
Lee Jones [李琼斯]
