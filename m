Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7E22FB44
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 23:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB1A6E048;
	Mon, 27 Jul 2020 21:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E36E053;
 Mon, 27 Jul 2020 21:24:40 +0000 (UTC)
Received: from localhost (unknown [13.85.75.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B969B2173E;
 Mon, 27 Jul 2020 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595885079;
 bh=HGGzk78q0Zc7KredqssVjRcpr+bcpGarOh2uSbyGsUI=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=vOMJxw9VedQka+hmCdEq57UJvmTOQ3HxT8S/H2jKbSY3lFyVbOZrhxx1dFRg2jcUv
 ov+8dW39jeXVO+5aRFLU40gC/8hRNXzl2Cgm4g4RN0HhVlLWmgnXnOKUpTKCq/hZNp
 2riRLiOXLf31+g6ONLD7/G8qI2cCcYTwlTkRg1I4=
Date: Mon, 27 Jul 2020 21:24:39 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm: Restore driver.preclose() for all to use
In-Reply-To: <20200723172119.17649-1-chris@chris-wilson.co.uk>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
Message-Id: <20200727212439.B969B2173E@mail.kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, CQ Tang <cq.tang@intel.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: 4.12+

The bot has tested the following trees: v5.7.10, v5.4.53, v4.19.134, v4.14.189.

v5.7.10: Build OK!
v5.4.53: Build OK!
v4.19.134: Build OK!
v4.14.189: Failed to apply! Possible dependencies:
    112ed2d31a46 ("drm/i915: Move GraphicsTechnology files under gt/")
    1572042a4ab2 ("drm: provide management functions for drm_file")
    7a2c65dd32b1 ("drm: Release filp before global lock")
    7e13ad896484 ("drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count")
    b46a33e271ed ("drm/i915/pmu: Expose a PMU interface for perf queries")
    c2400ec3b6d1 ("drm/i915: add Makefile magic for testing headers are self-contained")
    cc662126b413 ("drm/i915: Introduce DRM_I915_GEM_MMAP_OFFSET")
    e7af3116836f ("drm/i915: Introduce a preempt context")
    f0e4a0639752 ("drm/i915: Move GEM domain management to its own file")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
