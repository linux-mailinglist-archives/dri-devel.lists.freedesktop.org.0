Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13E8BB6E6
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 00:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CC610E594;
	Fri,  3 May 2024 22:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LizLuuvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026B010E035;
 Fri,  3 May 2024 22:13:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB92661E37;
 Fri,  3 May 2024 22:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21A6C116B1;
 Fri,  3 May 2024 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714774381;
 bh=lfmOGOZfhnCUlEiIDxBBf2bhFfZo+XWkOL15C/9q4gg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LizLuuvl3rIQpUP79UErjXcSkos8A0+bWmuon50exKaQxHHovPycNRnTPTY42cSdK
 tPk26zSCuLzBZBmwxgmvlxX4SJ+nUmpVGWJC9f7/vYwj9yqsa1Pd8/Z/td2Irvy8LU
 u26vNVtSW9V2MJPM2EMAMZCaLNiVRfP3k/NV1t6mmHVc6SYd7iZbkYK7zk5bhDEE4W
 dzMTBykNicvk4hvWRqa9jwQUyxPjCkYMtbaCd0opgAr2WdJU75sm4LkESwDbMraJGL
 2XSMKIhrFZSc+5Bs6hGpAfMTG0dHdow/2S95mJpAFgHi+Lo4RCvM3nco5D4wCcRYD5
 s0IILBeTsS96w==
Date: Fri, 3 May 2024 15:13:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>, Martin Habets
 <habetsm.xilinx@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, netdev@vger.kernel.org (open list:SFC NETWORK
 DRIVER), linux-net-drivers@amd.com (open list:SFC NETWORK DRIVER),
 linux-kernel@vger.kernel.org (open list), Wolfram Sang
 <wsa+renesas@sang-engineering.com>, amd-gfx@lists.freedesktop.org (open
 list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open
 list:DRM DRIVERS), intel-gfx@lists.freedesktop.org (open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS), intel-xe@lists.freedesktop.org (open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM
 HOST DRIVERS), linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX
 DRIVER), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: Re: [PATCH v1 10/12] sfc: falcon: Make I2C terminology more inclusive
Message-ID: <20240503151300.0f202c30@kernel.org>
In-Reply-To: <20240430173812.1423757-11-eahariha@linux.microsoft.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-11-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 30 Apr 2024 17:38:09 +0000 Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended

FWIW we're assuming someone (Wolfram?) will take all of these,
instead of area maintainers picking them individually.
Please let us know if that's incorrect.
