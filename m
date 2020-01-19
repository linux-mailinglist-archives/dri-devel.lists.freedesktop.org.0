Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14842141EDC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2020 16:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44266E3F9;
	Sun, 19 Jan 2020 15:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B088A6E3F0;
 Sun, 19 Jan 2020 15:26:52 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BF0C20679;
 Sun, 19 Jan 2020 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579447612;
 bh=byF8nziAnhHwGujmv49UAG6diSrQkseDWMO+LLHGWgM=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:References:From;
 b=08io0Zi29F3XJdoWupS5a/1TI40y7nD5jnEC9fWu3IY6fM6zIuMY4/A7vwSdiU8O9
 IeaqXmb6DkyFvKscphsrrfjpqQCIL7m6y+ECq0NNyrAm5vVL/HU5BJSsOTX3EylC1l
 MvSp5JfdkFw/Jx8ecQSyigHF+9YaGHoG7/s90zS0=
Date: Sun, 19 Jan 2020 15:26:51 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Sean Paul <seanpaul@chromium.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 02/12] drm/i915: Clear the repeater bit on HDCP disable
In-Reply-To: <20200117193103.156821-3-sean@poorly.run>
References: <20200117193103.156821-3-sean@poorly.run>
Message-Id: <20200119152652.5BF0C20679@mail.kernel.org>
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
Cc: , intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation").

The bot has tested the following trees: v5.4.13, v4.19.97.

v5.4.13: Failed to apply! Possible dependencies:
    692059318c0f ("drm/i915/hdcp: Enable HDCP 1.4 and 2.2 on Gen12+")

v4.19.97: Failed to apply! Possible dependencies:
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
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
