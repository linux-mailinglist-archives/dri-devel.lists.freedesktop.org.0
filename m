Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB193AE1E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6510E55A;
	Wed, 24 Jul 2024 08:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1w430ibW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3510E55A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721811175;
 bh=9Q/j7zV2dHwZumpwXXSykRV+/pUuN3AcSk7kD6teegA=;
 h=Date:To:Cc:From:Subject:From;
 b=1w430ibWGDifLMIcp7iMYufETAQz3j2unkZ9rcphwozH9IA0WAEwmHKMp+WEYk6xZ
 at+DtXg3eQsFiNe/oCSILnVJiexazN4JKk6k4M0NtMW12syewpWvVxKq8rH8v3xTW4
 sKSydcrS7BZ186jQRgll0eGdE8JYqSg8VxH50qOZK4eGrvJr91+RkcvQhzxg8zBvNj
 mc9uuh/yPolxXaP1nFj2ONepZnB2RAgZZE8KSNGGSkNlNu8dtCv4EtM7YOuvQSTfsN
 oPN/LhAEFP1y0QrauZW6xbLUCZZ3EbBRWYkySlZvaKjt2RlBr+b87IP+ZPXrfeTlcf
 +5TCtvfyP1wcQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B40E83780BC2;
 Wed, 24 Jul 2024 08:52:52 +0000 (UTC)
Message-ID: <3e267d0c-fde4-4533-b001-6ab7d7c03546@collabora.com>
Date: Wed, 24 Jul 2024 14:22:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for rockchip driver testing
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

There are some flaky tests reported for rockchip driver testing
in drm-ci.

=== rockchip rk3288 ===
# Board Name: rk3288-veyron-jaq
# Failure Rate: 100
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_cursor_legacy@flip-vs-cursor-atomic

=== rockchip rk3399 ===
# Board Name: rk3399-gru-kevin
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_bw@linear-tiling-1-displays-2560x1440p
kms_cursor_legacy@nonblocking-modeset-vs-cursor-atomic
kms_flip@dpms-vs-vblank-race-interruptible
kms_flip@flip-vs-absolute-wf_vblank-interruptible
kms_flip@flip-vs-wf_vblank-interruptible
kms_setmode@basic
kms_bw@connected-linear-tiling-1-displays-2560x1440p 


Will add these tests in 
drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt and 
drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
