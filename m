Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAA8D1433
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 08:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BBB10E034;
	Tue, 28 May 2024 06:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dNBwFJwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE54B10E034;
 Tue, 28 May 2024 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716876568;
 bh=pp09qwZRTGxYxhAVR5DrkACVfVN6ijEh4V9kP4xD9gY=;
 h=Date:To:From:Subject:Cc:From;
 b=dNBwFJwOy28io1NQIQaA8PUPGhDMyTjvdNWOpjlwC9Y3UXaFmLsFlri3eJWdLEoXK
 y3ByqFn8OZJumxYtvdzboe1Owp54Gv9hMkyrNayqRIc5rfA1obQfknEI9QvrbgUH6N
 fObR3x5LJfFjbuDsi8hSjaIJqKjY9tKMwgwPHPWC1griMxNI51jvEvY7NlrWUBlVbm
 TNj4ceN0dItNXtj322Y9SoC7F1CHU9qhREyozoM2E5Rq7TOUF0XaP6aUP5ZZ37c6Fz
 jSxzuxRFS+JuAKVt6S3t0qNLilKvESHRNE12Hr08kxb+N8WFZ04/DSI7/y1PzeTtEJ
 p4z1hRHuKJRcQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 494C63782151;
 Tue, 28 May 2024 06:09:25 +0000 (UTC)
Message-ID: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
Date: Tue, 28 May 2024 11:39:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flaky tests for msm driver testing
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
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

There are some flaky tests reported for msm driver testing in drm-ci for 
the below boards.

*)
# Board Name: apq8096-db820c
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
dumb_buffer@create-clear

*)
# Board Name: sc7180-trogdor-kingoftown
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
msm_mapping@shadow
msm_shrink@copy-gpu-oom-32
msm_shrink@copy-gpu-oom-8

*)
# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
msm_mapping@shadow

*)
# Board Name: sdm845-cheza-r3
# IGT Version: 1.28-g0df7b9b97
# Linux Version: 6.9.0-rc7
# Failure Rate: 50
kms_cursor_legacy@basic-flip-after-cursor-atomic
kms_cursor_legacy@basic-flip-after-cursor-legacy
kms_cursor_legacy@basic-flip-after-cursor-varying-size
kms_cursor_legacy@basic-flip-before-cursor-varying-size
kms_cursor_legacy@flip-vs-cursor-atomic-transitions
kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
kms_cursor_legacy@flip-vs-cursor-varying-size
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
kms_cursor_legacy@short-flip-after-cursor-toggle
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
msm_shrink@copy-gpu-32
msm_shrink@copy-gpu-oom-32

Will add these tests in,
drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
