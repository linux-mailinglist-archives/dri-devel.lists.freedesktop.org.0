Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD992F591
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 08:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9321B10EC08;
	Fri, 12 Jul 2024 06:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hDaI+mF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D2D10EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 06:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720765841;
 bh=/rRiMoAAtktGB5nD4DAbJc/fdB2w6NmR330YGH2gU6M=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=hDaI+mF9zWjGR5DoE6uxIDy99II6RptK7afEFq95uJ4xjTF5P4rWoR6LG0DYWBtqs
 hNR4Vrwpe7eOfeRdcYBCGhTFARKO8i/7hAYwzG22pd0quYQCZqqTWoewnwOl5RcEnL
 nXfcrOr3Fzfx7F6ytQ7A2FypACVaADSjXSch6bjNZ1LUyiKmesXtVS67Ig7nRClvex
 rGHxlHCsKrkRTSCeOgXmcksHIr9GwNkPxGjY7JiYCJwWC5lVH7oJ3O6DM8F9kg1qwF
 sHt9qQAWZp+FaLD8fmCM6rvr0Wy9CzrFoKhe+7Far2eBXpVab/hNH/4mIF2X4XUi+J
 jWLcY8nTFaRMA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC3CE378220E;
 Fri, 12 Jul 2024 06:30:38 +0000 (UTC)
Message-ID: <34b44912-f16a-4d5b-b461-efc07a879e9b@collabora.com>
Date: Fri, 12 Jul 2024 12:00:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for vkms driver testing
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: mairacanal@riseup.net, melissa.srw@gmail.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 dri-devel@lists.freedesktop.org
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, Daniel Stone
 <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com>
In-Reply-To: <61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com>
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

On 11/06/24 14:19, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for vkms driver testing in drm-ci.
> 
> # Board Name: vkms
> # Failure Rate: 50
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic
> kms_flip@basic-flip-vs-wf_vblank
> kms_flip@flip-vs-expired-vblank-interruptible
> kms_flip@flip-vs-wf_vblank-interruptible
> kms_flip@plain-flip-fb-recreate-interruptible
> kms_flip@plain-flip-ts-check
> kms_flip@plain-flip-ts-check-interruptible
> kms_flip@flip-vs-absolute-wf_vblank
> kms_flip@flip-vs-absolute-wf_vblank-interruptible
> kms_flip@flip-vs-blocking-wf-vblank
> 
> Will add these tests in drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for vkms driver testing in drm-ci 
with the recent IGT uprev 
(https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)

# Board Name: vkms
# Bug Report: 
https://lore.kernel.org/dri-devel/61ed26af-062c-443c-9df2-d1ee319f3fb0@collabora.com/T/#u
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_cursor_legacy@flip-vs-cursor-varying-size
kms_flip@flip-vs-expired-vblank
kms_pipe_crc_basic@nonblocking-crc-frame-sequence

The expectation files have been updated with these tests,
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt

Regards,
Vignesh
