Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D699BD09BB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F75F10E09C;
	Sun, 12 Oct 2025 18:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eM2ElECy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E710E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 18:24:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9616660200;
 Sun, 12 Oct 2025 18:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE24C4CEF1;
 Sun, 12 Oct 2025 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760293472;
 bh=jNQMPq5aHPw4UwMfE4/hvuN3ivslT2Wdd5P0OwmUHgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eM2ElECya3orR0xr9EftJ7TQ9BqZoahTwmsb75SOFovYEf+NGbL+SOv5TLYP1+FRB
 cQQvCuihohSRFEHE3xmJBhExrUoXSDKxiVVqVDoS+1MDmsWZykLnwkCkOL54zz36Ts
 XLpgcVL/DhSQWd8wi2QEYtCF1TCRJmfaAanDEj+2q6yClkEtjKy2NSEP5AacYxGAUE
 R/nncmAyWTm5gEkmAntzn3XlmyNJG1MP1su8ont6UWlswqDkxMNb3lyLgyM5CMovQX
 vvCxRhHumAPLPixoIqeVvLyKw/TDh9EaJkggN9rdM/dMkvzyw2UTHNue5L4WxuWOc7
 Sze3A7+bpUUIw==
Date: Sun, 12 Oct 2025 11:23:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with
 a screen info check
Message-ID: <20251012182302.GA3412@sol>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-3-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811162606.587759-3-superm1@kernel.org>
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

Hi,

On Mon, Aug 11, 2025 at 11:26:04AM -0500, Mario Limonciello (AMD) wrote:
> vga_is_firmware_default() checks firmware resources to find the owner
> framebuffer resources to find the firmware PCI device.  This is an
> open coded implementation of screen_info_pci_dev().  Switch to using
> screen_info_pci_dev() instead.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

I'm getting a black screen on boot on mainline, and it bisected to this
commit.  Reverting this commit fixed it.

Please revert.

- Eric
