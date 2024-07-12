Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F178792F536
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 07:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152010EBE6;
	Fri, 12 Jul 2024 05:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b9+cBwOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEBE10EB27;
 Fri, 12 Jul 2024 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720763537;
 bh=hb5c4dOKAmQLW7LLgSL/Gn1wgorD0XBHAWs0v69N5f4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=b9+cBwOaY0INMU+YQnzx0kOqZDiw1R0BIlAfjjUbQCn7CdDWNODHsfk6XjkcZBrgn
 NvP7TIXt5eHal+Zdyop8oLdBDyaT/s6pU0QvmD2/Lss3Kl7Sm/idU5RTethWwxAXY6
 vq/4YQr9IOpaOXqe0dfp0tTn2D/IBVoOPkTgliU5s6i9IWE4AlRxp3CEhWhQTqXgA4
 EXlxZyXAnohtnLKODFQLrH1Uk3+mtI05Y9IVtfDqMFDM0BfUTxneGHlFXdt5V4R+I3
 APtG33P8dZauTJGr8sjv0edx9NG0AutdcyycU4ebuxbjKR9BDzyGf4JTOayXCamSVJ
 c9th+Sfj8uUYQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B28F37821F1;
 Fri, 12 Jul 2024 05:52:14 +0000 (UTC)
Message-ID: <48fb86a9-b863-468e-ae74-35423b22b76d@collabora.com>
Date: Fri, 12 Jul 2024 11:22:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for i915 driver testing
From: Vignesh Raman <vignesh.raman@collabora.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
Content-Language: en-US
In-Reply-To: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Maintainers,

On 28/05/24 12:07, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for i915 driver testing in drm-ci 
> for the below boards.
> 
> *)
> # Board Name: asus-C523NA-A20057-coral
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_fb_coherency@memset-crc
> 
> *)
> # Board Name: asus-C436FA-Flip-hatch
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_plane_alpha_blend@constant-alpha-min
> 
> *)
> # Board Name: hp-x360-12b-ca0010nr-n4020-octopus
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> core_hotunplug@unplug-rescan
> kms_fb_coherency@memset-crc
> 
> *)
> # Board Name: hp-x360-14-G1-sona
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> prime_busy@hang
> 
> *)
> # Board Name: dell-latitude-5400-8665U-sarien
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_pm_rpm@modeset-lpsp-stress
> 
> *)
> # Board Name: asus-C433TA-AJ0005-rammus
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> i915_hangman@engine-engine-error
> i915_hangman@gt-engine-hang
> kms_async_flips@crc
> kms_universal_plane@cursor-fb-leak
> 
> Will add these tests in,
> drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
> drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
> drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
> drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
> drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
> drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for i915 driver testing in drm-ci 
with the recent IGT uprev in drm-ci 
(https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)

*)
# Board Name: asus-C433TA-AJ0005-rammus
# Bug Report: 
https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_sysfs_edid_timing
i915_hangman@engine-engine-hang
kms_pm_rpm@modeset-lpsp-stress

*)
# Board Name: asus-C436FA-Flip-hatch
# Bug Report: 
https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_atomic_transition@plane-all-modeset-transition-internal-panels

The expectation files have been updated with these tests,
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt

Regards,
Vignesh
