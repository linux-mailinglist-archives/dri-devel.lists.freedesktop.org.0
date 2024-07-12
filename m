Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13992F54C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 08:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D382C10EBEF;
	Fri, 12 Jul 2024 06:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4sFKQdJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D8910EBEC;
 Fri, 12 Jul 2024 06:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720764332;
 bh=sE5ateBKu6nPkk+PxU1Z0qEr2527gv5KTx61mgKeTQs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=4sFKQdJlG1+OENc5v4NbZI8Z5AKFwfXo7PtwC1FShiBhL1dCgTusB7RS1hSJ8hlXS
 q4djMOYeIoY154lNj5rfRMSze3ZKJd+3RSrqIGuNWiSSWp/+yEZRxX/JSKM2UCZ/w3
 HA+PDyCa5d8V/EZIBnP+/hLIh7ezDX5JDwBohECmkBl6ggS2HYk7OT/QqzHVQYapov
 a27scYv7bbpa8NeB+mo3vknQl1nC3Yr7CnUIGtZcTTvMfwtyHYEeSg6xqknnWT0F1F
 GkqUjU8eIoIVlVyvbpPg8QIzxkQLYGxegh2AH8ng0FhnY19NUj9V71P5KSCiFgneps
 Z11nWzRTdDsEA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C99E737821F1;
 Fri, 12 Jul 2024 06:05:29 +0000 (UTC)
Message-ID: <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
Date: Fri, 12 Jul 2024 11:35:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: flaky tests for msm driver testing
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
To: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
References: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
In-Reply-To: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
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

On 28/05/24 11:39, Vignesh Raman wrote:
> Hi Maintainers,
> 
> There are some flaky tests reported for msm driver testing in drm-ci for 
> the below boards.
> 
> *)
> # Board Name: apq8096-db820c
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> dumb_buffer@create-clear
> 
> *)
> # Board Name: sc7180-trogdor-kingoftown
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> msm_mapping@shadow
> msm_shrink@copy-gpu-oom-32
> msm_shrink@copy-gpu-oom-8
> 
> *)
> # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> msm_mapping@shadow
> 
> *)
> # Board Name: sdm845-cheza-r3
> # IGT Version: 1.28-g0df7b9b97
> # Linux Version: 6.9.0-rc7
> # Failure Rate: 50
> kms_cursor_legacy@basic-flip-after-cursor-atomic
> kms_cursor_legacy@basic-flip-after-cursor-legacy
> kms_cursor_legacy@basic-flip-after-cursor-varying-size
> kms_cursor_legacy@basic-flip-before-cursor-varying-size
> kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> kms_cursor_legacy@flip-vs-cursor-varying-size
> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> kms_cursor_legacy@short-flip-after-cursor-toggle
> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> msm_shrink@copy-gpu-32
> msm_shrink@copy-gpu-oom-32
> 
> Will add these tests in,
> drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> 
> Please could you have a look at these test results and let us know if 
> you need more information. Thank you.

There are some flaky tests reported for msm driver testing in drm-ci 
with the recent IGT uprev 
(https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)

*)
# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
# Bug Report: 
https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
# Failure Rate: 100
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_lease@page-flip-implicit-plane

*)
# Board Name: sdm845-cheza-r3
# Bug Report: 
https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
# Failure Rate: 50
# IGT Version: 1.28-gf13702b8e
# Linux Version: 6.10.0-rc5
kms_cursor_legacy@short-flip-before-cursor-toggle
kms_cursor_legacy@flip-vs-cursor-toggle
msm/msm_shrink@copy-mmap-oom-8s

The expectation files have been updated with these tests,
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt

https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt

Regards,
Vignesh
