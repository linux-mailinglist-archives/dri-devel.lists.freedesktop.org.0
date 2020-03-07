Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AAC17D09E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 00:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8716E27A;
	Sat,  7 Mar 2020 23:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A539F6E271;
 Sat,  7 Mar 2020 23:20:39 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53D3D2075A;
 Sat,  7 Mar 2020 23:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583623239;
 bh=3pXo/e2y+8dXfxkw8H6vyOq/NFxi08Vq0VUbYfAhWAA=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:References:From;
 b=vhTEAeDbPbgOaR3WM/c8fMHiSRqzpJGx2J0OIKNptwf7x0DycKqNf7+FNWhgwwrFi
 6t4ByEpzB8yDvdL7mhsRqUJ2ufPjSDWqMmLEw5OAkYoEbka07cYaZAQuzMys0RAg9s
 QC+1r5U4is7SjjbqWEi9iW2MKAsdmvoakLHptXyY=
Date: Sat, 07 Mar 2020 23:20:38 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Sean Paul <seanpaul@chromium.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 01/16] drm/i915: Fix sha_text population code
In-Reply-To: <20200305201236.152307-2-sean@poorly.run>
References: <20200305201236.152307-2-sean@poorly.run>
Message-Id: <20200307232039.53D3D2075A@mail.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation").

The bot has tested the following trees: v5.5.8, v5.4.24, v4.19.108.

v5.5.8: Failed to apply! Possible dependencies:
    65833c463886 ("drm/i915/hdcp: conversion to struct drm_device based logging macros.")
    667944ad77f1 ("drm/i915/hdcp: use intel_de_*() functions for register access")

v5.4.24: Failed to apply! Possible dependencies:
    65833c463886 ("drm/i915/hdcp: conversion to struct drm_device based logging macros.")
    667944ad77f1 ("drm/i915/hdcp: use intel_de_*() functions for register access")
    692059318c0f ("drm/i915/hdcp: Enable HDCP 1.4 and 2.2 on Gen12+")

v4.19.108: Failed to apply! Possible dependencies:
    04707f971636 ("drm/i915: Initialize HDCP2.2")
    09d56393c1d8 ("drm/i915: hdcp1.4 CP_IRQ handling and SW encryption tracking")
    2f80d7bd8d93 ("drm/i915: drop all drmP.h includes")
    33b7f3ee6e00 ("drm/i915: Add CRTC output format YCBCR 4:2:0")
    340a44bef234 ("drm/i915/icl: program MG_DP_MODE")
    342ac601df64 ("drm/i915: hdcp_check_link only on CP_IRQ")
    47658556da85 ("drm/i915/dp: Do not grab crtc modeset lock in intel_dp_detect()")
    667944ad77f1 ("drm/i915/hdcp: use intel_de_*() functions for register access")
    668b6c176c33 ("drm/i915: Add YCBCR 4:2:0/4:4:4 support for LSPCON")
    7b610f1fbed2 ("drm/i915/dp: Add DSC params and DSC config to intel_crtc_state")
    9055aac76589 ("drm/i915: MEI interface implementation")
    9844bc87cb7a ("drm/i915/dp: Fix duplication of DEVICE_SERVICE_IRQ handling")
    bdc93fe0eb82 ("drm/i915/debugfs: hdcp capability of a sink")
    cbfa8ac835cb ("drm/i915/dp: Kill intel_dp->detect_done flag")
    d3dacc70797b ("drm/i915: wrapping all hdcp var into intel_hdcp")
    d5acd97f5571 ("drm/i915/dp: Use a local variable for intel_encoder *")
    d78aa650670d ("drm: Add drm/drm_util.h header file")
    de25eb7f3075 ("drm/i915: introduce dp_to_i915() helper")
    f106d1005ac7 ("drm/i915: Pullout the bksv read and validation")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
