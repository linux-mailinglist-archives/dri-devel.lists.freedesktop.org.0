Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A5E859D05
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 08:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052AE10E181;
	Mon, 19 Feb 2024 07:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NKkohN/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E193C10E178
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 07:34:54 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a3eb1f48fa9so36107566b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 23:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708328093; x=1708932893; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yZdPEIb35UuoFivHycym2ongSZton05QwV9BQzdhVvs=;
 b=NKkohN/MYpQWfdxXQzM0SjxsRkum7+wyc9SocGkbYrTf3GSF4H6t5Cw4coU7xxWnaN
 LpWbSOBeQdk7wyEoA2d/XSusz6biGtrcbTQq8p8VoSqOWgq5WIM+fdlQAi1/t/+qcBHI
 +gZWVVQLf9L0PsSxXACQIpfqciFt3ZGBXAZdZIRwZZ3yD7ZolaUqD5+N3HgBmps9v6XX
 S2Pqji/bbUC1/r0DqK1M1w44JkqurruNj0aNBFUkZLoEojzS+dief2LlIPKvkrn+fcWs
 IzgmvrJeHCDfLPHOeLK6LXvKz3BiwWpU8mfxXo+jVcZkz802zv6H6s49wbhU0bTefJVA
 valw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708328093; x=1708932893;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yZdPEIb35UuoFivHycym2ongSZton05QwV9BQzdhVvs=;
 b=YBvXG55di+iBF00KKu3xjnA5z74IZIFqUvUmKwlBkp0BxN/FEnJYoOfJ2HzKWo4vM5
 ElRVIHI38omT17XKf/WiGstXGuRarC6xi6E2IoczNCtPpg6k4ODNG0/qztYNnlOe5MHe
 6UNBbQNCmlgZ/rlcgcdc/CDzPyvwaJERPKpvaMSWK0JX4lyhHHEHMur+p1NTJF4/qVch
 U8C1z2+rVIXoKuGKOrslsHon4l3pilDl3ISRP63adHaV7JuwLJSBg5k9RRO2peobsvoJ
 RIVL2rbH3HfErpkgCCnWQfQSqdFN3QirhCohuczvBg7+9uWXMryFpBvim4IX8U8TbWFs
 pRqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF45CD/qe6MaEnqxHsMPvlIjiF0hzWpG5AIuqTtgNaTJJ3AOeGHF8DICaBinYmsqQfdzp2T/riCGJrJO+hevRGZjZAXfURYoNseDmvhiNf
X-Gm-Message-State: AOJu0YygK2NQluR0je83aG4Yra3yCJqyA7K/eUuSI6GCohUFOOpJNTfl
 2a6xPP6TAgJCfGOJY/5VzEdvmVb6cFMgCFwqoK4voCStxO10P7IBozG8oj7T6wo=
X-Google-Smtp-Source: AGHT+IGZe0dPY4IFHv5xvW55FAa6Fo25SafsKR/YJek9/gS2eBa0lk4mV/4J9jO0qFSs4PAJEQMjMA==
X-Received: by 2002:a17:906:3b94:b0:a3d:26b2:94f4 with SMTP id
 u20-20020a1709063b9400b00a3d26b294f4mr8043246ejf.73.1708328093072; 
 Sun, 18 Feb 2024 23:34:53 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 u13-20020a1709063b8d00b00a3c7fb8cc74sm2644221ejf.154.2024.02.18.23.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 23:34:52 -0800 (PST)
Date: Mon, 19 Feb 2024 10:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Uma Shankar <uma.shankar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 16/28] drm/i915/color: Create a transfer function color
 pipeline
Message-ID: <103c8a84-3423-45cf-8592-6e47ef2700d6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-17-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-17-uma.shankar%40intel.com
patch subject: [PATCH 16/28] drm/i915/color: Create a transfer function color pipeline
config: i386-randconfig-141-20240217 (https://download.01.org/0day-ci/archive/20240218/202402180310.gMdIXaJx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402180310.gMdIXaJx-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:3867 intel_plane_tf_pipeline_init() error: 'colorop' dereferencing possible ERR_PTR()

vim +/colorop +3867 drivers/gpu/drm/i915/display/intel_color.c

5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3852  int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3853  {
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3854  	struct intel_plane *intel_plane = to_intel_plane(plane);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3855  	struct intel_plane_colorop *colorop;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3856  	struct drm_device *dev = plane->dev;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3857  	struct drm_i915_private *i915 = to_i915(dev);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3858  	int ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3859  	struct drm_colorop *prev_op;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3860  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3861  	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);

No error checking

5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3862  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3863  	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3864  	if (ret)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3865  		return ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3866  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13 @3867  	list->type = colorop->base.base.id;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3868  	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3869  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3870  	/* TODO: handle failures and clean up*/
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3871  	prev_op = &colorop->base;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

