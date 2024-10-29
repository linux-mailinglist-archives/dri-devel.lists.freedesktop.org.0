Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265A9B469D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AECC10E613;
	Tue, 29 Oct 2024 10:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="K4Ngk/wp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284FE10E612;
 Tue, 29 Oct 2024 10:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1730197297; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KYcsLYoQ/2GXGGmh9lStLA1zFi6RRLeT0UP0w+X2T5mH+/QxDbRHm3geTQS12Vp9CPOzRsNfzQ0hsdqLf5vgN1GMMZ+C+SSLmnNiFLtvsdPzhIotwpqgg6G6aMNJD8ZbeKs0oaV7O4exNOrF5t4JpPnp19OrkTtpBeO99TsZxAw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1730197297;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=U5Ti6h7kQHUkNr5lbUtKe3L2IZY7J0SKjp+bvuGgbOw=; 
 b=WeQc3IOH7NXn5f0ESH9MDd3rBsozGvIJtVLaTnEFoBrkSIa+eMHLadoRk6zwO3M7cfWbxk5FF2RfT5u73mdXGiXA9fIaRwaPMbs5bF2fEMDKZznnb8jnUmhlkh+Fe/0JwtR+AVglWldc6Fson6IfPU5qcdmmR/VqZbrmRUwlhMA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730197297; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=U5Ti6h7kQHUkNr5lbUtKe3L2IZY7J0SKjp+bvuGgbOw=;
 b=K4Ngk/wpeI5Z1EHhC5BeBokxllNfm/O/cg8Fej9yEqTIKgrNOnPvUql/Fu+UeXv2
 5gAXFm+mqQLZLGKav2C4qXWefTn3NMtRl7Xn6gDePlI8ZqFoUeN9HOS/LJ7Hgal1+nU
 tPZTVarO2s3t7FfGy0hhzsJEbDzrE9IY6/kqFlq8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1730197295528634.2252561603951;
 Tue, 29 Oct 2024 03:21:35 -0700 (PDT)
Date: Tue, 29 Oct 2024 07:21:35 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "deborah.brouwer" <deborah.brouwer@collabora.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "quic_abhinavk" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "virtualization" <virtualization@lists.linux.dev>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <192d7cb9143.f422e0dc1041966.5693553392946213419@collabora.com>
In-Reply-To: <20241022094509.85510-2-vignesh.raman@collabora.com>
References: <20241022094509.85510-1-vignesh.raman@collabora.com>
 <20241022094509.85510-2-vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 1/2] drm/ci: add dedede
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Tue, 22 Oct 2024 06:45:04 -0300 Vignesh Raman  wrote ---

 > Add job that executes the IGT test suite for acer-cb317-1h-c3z6-dedede. 
 > dedede boards use 64 bit Intel Jasper Lake processors. 
 >  
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com> 

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

 > --- 
 >  
 > v2: 
 >  - Add gitlab issue link for flake tests. 
 >  
 > --- 
 >  drivers/gpu/drm/ci/test.yml                   |  9 ++++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  | 51 +++++++++++++++++++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt | 13 +++++ 
 >  drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  | 20 ++++++++ 
 >  4 files changed, 93 insertions(+) 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt 
 >  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt 
 >  
 > diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml 
 > index 09d8447840e9..d0bfe6aab58a 100644 
 > --- a/drivers/gpu/drm/ci/test.yml 
 > +++ b/drivers/gpu/drm/ci/test.yml 
 > @@ -286,6 +286,15 @@ i915:tgl: 
 >  GPU_VERSION: tgl 
 >  RUNNER_TAG: mesa-ci-x86-64-lava-acer-cp514-2h-1130g7-volteer 
 >  
 > +i915:jsl: 
 > +  extends: 
 > +    - .i915 
 > +  parallel: 4 
 > +  variables: 
 > +    DEVICE_TYPE: acer-cb317-1h-c3z6-dedede 
 > +    GPU_VERSION: jsl 
 > +    RUNNER_TAG: mesa-ci-x86-64-lava-acer-cb317-1h-c3z6-dedede 
 > + 
 >  .amdgpu: 
 >  extends: 
 >  - .lava-igt:x86_64 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt 
 > new file mode 100644 
 > index 000000000000..ed9f7b576843 
 > --- /dev/null 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt 
 > @@ -0,0 +1,51 @@ 
 > +core_setmaster@master-drop-set-user,Fail 
 > +i915_module_load@load,Fail 
 > +i915_module_load@reload,Fail 
 > +i915_module_load@reload-no-display,Fail 
 > +i915_module_load@resize-bar,Fail 
 > +i915_pm_rpm@gem-execbuf-stress,Timeout 
 > +i915_pm_rpm@module-reload,Fail 
 > +kms_flip@plain-flip-fb-recreate,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail 
 > +kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail 
 > +kms_lease@lease-uevent,Fail 
 > +kms_pm_rpm@legacy-planes,Timeout 
 > +kms_pm_rpm@legacy-planes-dpms,Timeout 
 > +kms_pm_rpm@modeset-stress-extra-wait,Timeout 
 > +kms_pm_rpm@universal-planes,Timeout 
 > +kms_pm_rpm@universal-planes-dpms,Timeout 
 > +kms_rotation_crc@multiplane-rotation,Fail 
 > +kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail 
 > +kms_rotation_crc@multiplane-rotation-cropping-top,Fail 
 > +perf@i915-ref-count,Fail 
 > +perf_pmu@busy-accuracy-50,Fail 
 > +perf_pmu@module-unload,Fail 
 > +perf_pmu@most-busy-idle-check-all,Fail 
 > +perf_pmu@rc6,Crash 
 > +sysfs_heartbeat_interval@long,Timeout 
 > +sysfs_heartbeat_interval@off,Timeout 
 > +sysfs_preempt_timeout@off,Timeout 
 > +sysfs_timeslice_duration@off,Timeout 
 > +xe_module_load@force-load,Fail 
 > +xe_module_load@load,Fail 
 > +xe_module_load@many-reload,Fail 
 > +xe_module_load@reload,Fail 
 > +xe_module_load@reload-no-display,Fail 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt 
 > new file mode 100644 
 > index 000000000000..5c3ef4486b9d 
 > --- /dev/null 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt 
 > @@ -0,0 +1,13 @@ 
 > +# Board Name: acer-cb317-1h-c3z6-dedede 
 > +# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12475 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.12.0-rc1 
 > +kms_flip@flip-vs-panning-interruptible 
 > + 
 > +# Board Name: acer-cb317-1h-c3z6-dedede 
 > +# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12476 
 > +# Failure Rate: 100 
 > +# IGT Version: 1.28-ga73311079 
 > +# Linux Version: 6.12.0-rc1 
 > +kms_universal_plane@cursor-fb-leak 
 > diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt 
 > new file mode 100644 
 > index 000000000000..1a3d87c0ca6e 
 > --- /dev/null 
 > +++ b/drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt 
 > @@ -0,0 +1,20 @@ 
 > +# Suspend to RAM seems to be broken on this machine 
 > +.*suspend.* 
 > + 
 > +# Skip driver specific tests 
 > +^amdgpu.* 
 > +^msm.* 
 > +nouveau_.* 
 > +^panfrost.* 
 > +^v3d.* 
 > +^vc4.* 
 > +^vmwgfx* 
 > + 
 > +# GEM tests takes ~1000 hours, so skip it 
 > +gem_.* 
 > + 
 > +# trap_err 
 > +i915_pm_rc6_residency.* 
 > + 
 > +# Hangs the machine and timeout occurs 
 > +i915_pm_rpm@system-hibernate* 
 > -- 
 > 2.43.0 
 >  
 > 

