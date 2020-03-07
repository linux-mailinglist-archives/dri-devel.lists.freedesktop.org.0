Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F01D17D09B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 00:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318E6E279;
	Sat,  7 Mar 2020 23:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492036E26F;
 Sat,  7 Mar 2020 23:20:36 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F021120801;
 Sat,  7 Mar 2020 23:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583623236;
 bh=eCTUpsMfTNp/F/Z4/97/GxUY1bCezRStSc75bRCgP4A=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:References:From;
 b=1CcxNSb88AclHgnkuNXqH6PHntPYHd6iizeVZmXkwH6qqXkKuKaSykve2ZzzStKhu
 z8YbLyvrs9PLYj+V42PSi69Ais32wTqYPrS7q9Y6TZIJeODdjFO130bCz0YvV6FOyr
 zuTWZF9BSt9/pvFxjZmpa41WebqHP1/7WGcFgq1g=
Date: Sat, 07 Mar 2020 23:20:35 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Sean Paul <seanpaul@chromium.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 02/16] drm/i915: Clear the repeater bit on HDCP disable
In-Reply-To: <20200305201236.152307-3-sean@poorly.run>
References: <20200305201236.152307-3-sean@poorly.run>
Message-Id: <20200307232035.F021120801@mail.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <seanpaul@chromium.org>,
 stable@vger.kernel.org, juston.li@intel.com
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1565232856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1565232856==
Content-Type: text/plain

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation").

The bot has tested the following trees: v5.5.8, v5.4.24, v4.19.108.

v5.5.8: Build failed! Errors:
    drivers/gpu/drm/i915/display/intel_hdcp.c:780:2: error: implicit declaration of function ‘intel_de_write’; did you mean ‘intel_sbi_write’? [-Werror=implicit-function-declaration]
    drivers/gpu/drm/i915/display/intel_hdcp.c:781:10: error: implicit declaration of function ‘intel_de_read’; did you mean ‘intel_sbi_read’? [-Werror=implicit-function-declaration]

v5.4.24: Failed to apply! Possible dependencies:
    692059318c0f ("drm/i915/hdcp: Enable HDCP 1.4 and 2.2 on Gen12+")

v4.19.108: Failed to apply! Possible dependencies:
    0e39037b3165 ("drm/i915: Cache the error string")
    16e4dd0342a8 ("drm/i915: Markup paired operations on wakerefs")
    39e2f501c1b4 ("drm/i915: Split struct intel_context definition to its own header")
    408bd9178666 ("drm/i915: extract intel_hdcp.h from intel_drv.h")
    52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
    538ef96b9dae ("drm/i915/gem: Track the rpm wakerefs")
    692059318c0f ("drm/i915/hdcp: Enable HDCP 1.4 and 2.2 on Gen12+")
    6b048706f407 ("drm/i915: Forcibly flush unwanted requests in drop-caches")
    87f1ef225242 ("drm/i915: Record the sseu configuration per-context & engine")
    95fd94a645f7 ("drm/i915: avoid rebuilding i915_gpu_error.o on version string updates")
    c0a6aa7ec2c3 ("drm/i915: Show actual alongside requested frequency in debugfs/i915_rps_boost_info")
    c2400ec3b6d1 ("drm/i915: add Makefile magic for testing headers are self-contained")
    c44301fce614 ("drm/i915: Allow control of PSR at runtime through debugfs, v6")
    e0516e83640e ("drm/i915: Move sandybride pcode access to intel_sideband.c")
    e1ef734eaec5 ("drm/i915: make intel_frontbuffer.h self-contained")
    e6154e4cb8b0 ("drm/i915: Skip the ERR_PTR error state")
    eb8d0f5af4ec ("drm/i915: Remove GPU reset dependence on struct_mutex")
    fb6f0b64e455 ("drm/i915: Prevent machine hang from Broxton's vtd w/a and error capture")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

--===============1565232856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1565232856==--
