Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D538D148A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 08:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D210FFE0;
	Tue, 28 May 2024 06:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zNT2MujQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5C10FFDF;
 Tue, 28 May 2024 06:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716878247;
 bh=64dMvMmm8Fi4MRdxRzrJ+rcuWcYvX6bVZjII+ePKUNo=;
 h=Date:To:Cc:From:Subject:From;
 b=zNT2MujQeNFvRRD9788LgAWL8aM/FBHQbc1xFfZPUixfs9y5pLYDFK1aqPDMPLBpZ
 o8jU4agXQs4KVIv0GMpgicM+qy/mhJCqMf5V1XT20zaPCOd3cTYZxC0ANW/r5pXChk
 irpp6ZOE1G62+Y8c56eo45RNxk4IpsYB65WfRln8VWViXEW95Hbz/W2pLqTOQSGUMi
 5Xy/y7I/VHqCdt/w0+OzeBT2yXBXmKNLA6uyy66FdW9P2EcXFe5flHurdW3RmhkgUq
 HX6o2cGB7vHMedMS9XsDSkxaCMjhS1TWQDBKcz5KBrjMNwY8l3cipE9ONf3lTyQQ2K
 QVD+R52Ak7IeQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8041B3780BFE;
 Tue, 28 May 2024 06:37:25 +0000 (UTC)
Message-ID: <af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com>
Date: Tue, 28 May 2024 12:07:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for i915 driver testing
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

There are some flaky tests reported for i915 driver testing in drm-ci 
for the below boards.

*)
# Board Name: asus-C523NA-A20057-coral
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
kms_fb_coherency@memset-crc

*)
# Board Name: asus-C436FA-Flip-hatch
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
kms_plane_alpha_blend@constant-alpha-min

*)
# Board Name: hp-x360-12b-ca0010nr-n4020-octopus
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
core_hotunplug@unplug-rescan
kms_fb_coherency@memset-crc

*)
# Board Name: hp-x360-14-G1-sona
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
prime_busy@hang

*)
# Board Name: dell-latitude-5400-8665U-sarien
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
kms_pm_rpm@modeset-lpsp-stress

*)
# Board Name: asus-C433TA-AJ0005-rammus
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
i915_hangman@engine-engine-error
i915_hangman@gt-engine-hang
kms_async_flips@crc
kms_universal_plane@cursor-fb-leak

Will add these tests in,
drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
