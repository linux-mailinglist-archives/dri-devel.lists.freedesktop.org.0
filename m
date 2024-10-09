Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A8E995FC6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 08:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03E310E65B;
	Wed,  9 Oct 2024 06:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVHJAG9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683910E653
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 06:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728455328; x=1759991328;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NpVZhGublLuG7zTfV/TZOwA1MxlqCmJX95nLM2X1hSA=;
 b=jVHJAG9tmn7tL9NxBkByYiX5+b6SWHaUhFdf+1RxZ/700YO9cstmU2W1
 0oyzEiV8tvgk6fQ70NJA0GMXE8pnL3YmrLJTkkNMual/RY3bOqa8GQVxC
 33f9F6F2QsW6Nfsx+Pq5N6nkXQZuKz8Jy73uOHUzrkQVd6wnJTKDPyrFr
 I0meg5A4524lPRtqYF/hH8cdqPCZ/H6UwWeul9L6/XV+fnxYs9b0xcKhW
 DW/7I10z4RSs/OqzM7/PfNsfipGpZNRZo3mBezp94yLWM2MDU91tVmHcD
 R2F6/LvyLKUInhHrzN/NOPBWnpo9ye4MNsElNpM2QpzIUPL2KvEVDzW8g Q==;
X-CSE-ConnectionGUID: A1OcEhxCStq9wg898JeVtQ==
X-CSE-MsgGUID: /6ILGdyuR2GPj3DAFmX02g==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45199659"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45199659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 23:28:48 -0700
X-CSE-ConnectionGUID: TssQdR4fR0ewSxTdX25BsA==
X-CSE-MsgGUID: MpBsx4+qQi+LbT3G/n7nyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76255546"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 23:28:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Oct 2024 09:28:44 +0300
Date: Wed, 9 Oct 2024 09:28:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: radeon drm fails to load on v6.12-rc2 "Bogus possible_clones:
 [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)" ( Thinkpad
 T60)
Message-ID: <ZwYinD22dTiBkCh8@intel.com>
References: <20241009000321.418e4294@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009000321.418e4294@yea>
X-Patchwork-Hint: comment
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

On Wed, Oct 09, 2024 at 12:03:21AM +0200, Erhard Furtner wrote:
> Greetings!
> 
> On kernel v6.12-rc I get no X and dmesg (via netconsole) shows this at loading radeon drm:
> 
> [...]
> [drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
> radeon 0000:01:00.0: WB enabled
> radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x0000000008000000
> radeon 0000:01:00.0: radeon: MSI limited to 32-bit
> [drm] radeon: irq initialized.
> [drm] Loading R500 Microcode
> [drm] radeon: ring at 0x0000000008001000
> [drm] ring test succeeded in 0 usecs
> [drm] ib test succeeded in 0 usecs
> stackdepot: allocating hash table of 65536 entries via kvcalloc
> acpi device:06: registered as cooling_device2
> [drm] Radeon Display Connectors
> [drm] Connector 0:
> [drm]   VGA-1
> [drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48 0x7e4c 0x7e4c
> [drm]   Encoders:
> [drm]     CRT1: INTERNAL_KLDSCP_DAC1
> [drm] Connector 1:
> [drm]   LVDS-1
> [drm]   DDC: 0x7e60 0x7e60 0x7e64 0x7e64 0x7e68 0x7e68 0x7e6c 0x7e6c
> [drm]   Encoders:
> [drm]     LCD1: INTERNAL_LVTM1
> [drm] Connector 2:
> [drm]   DVI-I-1
> [drm]   HPD1
> [drm]   DDC: 0x7e50 0x7e50 0x7e54 0x7e54 0x7e58 0x7e58 0x7e5c 0x7e5c
> [drm]   Encoders:
> [drm]     DFP1: INTERNAL_KLDSCP_TMDS1
> ------------[ cut here ]------------
>
> Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)
<snip>
> Bogus possible_clones: [ENCODER:48:TMDS-48] possible_clones=0x1 (full encoder mask=0x7)
<snip>

Presumably something like this should fix it:

diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 0f723292409e..fafed331e0a0 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -43,7 +43,7 @@ static uint32_t radeon_encoder_clones(struct drm_encoder *encoder)
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_encoder *clone_encoder;
-	uint32_t index_mask = 0;
+	uint32_t index_mask = drm_encoder_mask(encoder);
 	int count;
 
 	/* DIG routing gets problematic */

> 
> 
> I applied "[PATCH v2] drm/radeon: add late_register for connector" hoping this would help but it didn't make a difference.
> 
> Some details about the Mobility Radeon X1300:
>  # lspci -s 01:00.0 -v
> 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV515/M52 [Mobility Radeon X1300] (prog-if 00 [VGA controller])
> 	Subsystem: Lenovo Device 2005
> 	Flags: bus master, fast devsel, latency 0, IRQ 16
> 	Memory at d8000000 (32-bit, prefetchable) [size=128M]
> 	I/O ports at 2000 [size=256]
> 	Memory at ee100000 (32-bit, non-prefetchable) [size=64K]
> 	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> 	Capabilities: [50] Power Management version 2
> 	Capabilities: [58] Express Legacy Endpoint, IntMsgNum 0
> 	Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit+
> 	Kernel driver in use: radeon
> 	Kernel modules: radeon
> 
> Regards,
> Erhard

-- 
Ville Syrjälä
Intel
