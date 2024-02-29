Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBEA86CABF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C30810E0BF;
	Thu, 29 Feb 2024 13:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+BK1lDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDBE10E0BF;
 Thu, 29 Feb 2024 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709214878; x=1740750878;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iBI0xnd7Mg37QjrQpGvQUFwvYvz/xUb59/vMsiBf7UU=;
 b=E+BK1lDK2HBJja7t8M9Erbeswzn6aN+LLCxSWtFaHgAEGaKwoUCDKc8L
 4llkBUIzznSaG+9Gbd9arEmi5YILJIYdZ7KDTFC7GXstTHSrk1IT8ZbQ8
 itAhJ3l6qs3Nz4StDRMxM1pcFnqNRneVAE9zw+pVY/r+1KvOssJM4YcHm
 0EgkLlHomPkPsOsdN8bPQsQhJOocnbpa7HmiKKX+Qfmsab2ZlTGugQF4p
 2d/zWgvd/D6vD4ybuZBu+QznV6fZ8ar+xyCXvHBnysnuitShUjisKxjCf
 ScgFmtZPdKvoAMxMtS/YRlxz5CK349Uc3/QNvJN9J6fJfcOHwx60ROX/2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6632515"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6632515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="45350095"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO [10.252.3.131])
 ([10.252.3.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:54:32 -0800
Message-ID: <455d1cf5-e885-42bf-9bda-4cf6d51b2de0@intel.com>
Date: Thu, 29 Feb 2024 13:54:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL] drm-misc-fixes
Content-Language: en-GB
To: Maxime Ripard <mripard@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
References: <20240229-angelic-adorable-teal-fbfabb@houat>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240229-angelic-adorable-teal-fbfabb@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 29/02/2024 13:37, Maxime Ripard wrote:
> Hi,
> 
> Here's this week drm-misc fixes PR.
> 
> There's two commits for files unders drivers/soc/qcom that don't have a
> maintainer Acked-by. Bjorn's Acked-by was provided on IRC, and Konrad
> provided it by mail after the facts so we're covered.
> 
> Maxime
> 
> drm-misc-fixes-2024-02-29:
> A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
> a use-after-free fix and a boot fix for a pmic_glink qcom driver in
> drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
> the TTM tests, a font handling fix for fbcon, two allocation fixes and a
> kunit test to cover them for drm/buddy
> The following changes since commit 72fa02fdf83306c52bc1eede28359e3fa32a151a:
> 
>    nouveau: add an ioctl to report vram usage (2024-02-23 10:20:07 +1000)
> 
> are available in the Git repository at:
> 
>    https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-fixes-2024-02-29
> 
> for you to fetch changes up to c70703320e557ff30847915e6a7631a9abdda16b:
> 
>    drm/tests/drm_buddy: add alloc_range_bias test (2024-02-28 08:03:29 +0100)
> 
> ----------------------------------------------------------------
> A reset fix for host1x, a resource leak fix and a probe fix for aux-hpd,
> a use-after-free fix and a boot fix for a pmic_glink qcom driver in
> drivers/soc, a fix for the simpledrm/tegra transition, a kunit fix for
> the TTM tests, a font handling fix for fbcon, two allocation fixes and a
> kunit test to cover them for drm/buddy
> 
> ----------------------------------------------------------------
> Christian König (1):
>        drm/ttm/tests: depend on UML || COMPILE_TEST
> 
> Jiri Slaby (SUSE) (1):
>        fbcon: always restore the old font data in fbcon_do_set_font()
> 
> Johan Hovold (3):
>        drm/bridge: aux-hpd: fix OF node leaks
>        drm/bridge: aux-hpd: separate allocation and registration
>        soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
> 
> Matthew Auld (3):
>        drm/buddy: fix range bias
>        drm/buddy: check range allocation matches alignment
>        drm/tests/drm_buddy: add alloc_range_bias test

Note that there is a build fix needed for this one:
https://patchwork.freedesktop.org/patch/580568/?series=130552&rev=1

> 
> Maxime Ripard (1):
>        Merge drm/drm-fixes into drm-misc-fixes
> 
> Mikko Perttunen (1):
>        gpu: host1x: Skip reset assert on Tegra186
> 
> Rob Clark (1):
>        soc: qcom: pmic_glink: Fix boot when QRTR=m
> 
> Thierry Reding (1):
>        drm/tegra: Remove existing framebuffer only if we support display
> 
>   drivers/gpu/drm/Kconfig                 |   5 +-
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c |  70 +++++++---
>   drivers/gpu/drm/drm_buddy.c             |  16 ++-
>   drivers/gpu/drm/tegra/drm.c             |  23 +++-
>   drivers/gpu/drm/tests/drm_buddy_test.c  | 218 ++++++++++++++++++++++++++++++++
>   drivers/gpu/host1x/dev.c                |  15 ++-
>   drivers/gpu/host1x/dev.h                |   6 +
>   drivers/soc/qcom/pmic_glink.c           |  21 +--
>   drivers/soc/qcom/pmic_glink_altmode.c   |  16 ++-
>   drivers/video/fbdev/core/fbcon.c        |   8 +-
>   include/drm/bridge/aux-bridge.h         |  15 +++
>   11 files changed, 368 insertions(+), 45 deletions(-)
