Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6865E4B3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 05:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ADD10E6A8;
	Thu,  5 Jan 2023 04:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F8010E0C9;
 Thu,  5 Jan 2023 04:37:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id az7so10619633wrb.5;
 Wed, 04 Jan 2023 20:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V8n4KZU3ErLZb7D+5oV5JKZTvhpFWTfVUw/4LSSiqWc=;
 b=T1QBcW/bIgzKPnVeL59jcQEp1vZU40PnLLKdMX6yYF0va5o0MbdVKdVFMz9QrQdS0l
 Yt0Xs6/NsGHezhsriK5sZ4sYw2H/SuTxo5h8+6Bc3TcyQc8pP0TcjJBiYHJgX02FQan5
 rUYWSmhY+M0qbWO43UYTMqaCtiJAJJ8XIQkhbNF03YM37VN55TaeXVA7yKf+WjWwt2EB
 hMgMOj1eV4wMxwLCnSbJJ0hfeVFgRUBwUHuuYY08yHZaGuLomJ5ubCds7DiXUZiD5M/0
 4qG/mavSBdUCvfIM7arRtQjJP3UmFfsTkw6aKEx7d0xiVeXJi0lT8pKVf4aTJEtlYN/t
 vO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V8n4KZU3ErLZb7D+5oV5JKZTvhpFWTfVUw/4LSSiqWc=;
 b=PrdClMAlk6u41jJOAZB+IaJ+2iaCq84yM37KdT5kj+P451s2OWwa48IK8rv3YH4LCP
 MOMyra4RhvWMd2K7VNOynF87/zO/sHtPW4N8JupYEihs0Bigq2FMpt1LKb5xfinugEaK
 H+Zxz3uPI6rsreRblKKPF4yXSJf7ZJlgJ4uggXXmrv5AsbO6cbnXF9Mng24QEAhZHsFT
 yLUT1Wj02sDVoWMt6E49yxg9MnSJURJZa8pAPrP1J0UnzgkM5tXysjMvxJQV91tN2FEP
 dnMxYw5tnZjve/Oi/iIukxtuBU3oc/bt2gIfLzD/r0MZjmQFZn/uWqETQeu/TajQTo1H
 AoPg==
X-Gm-Message-State: AFqh2kpD6X8NrgeNXc2GgWD+5Vo/9OCGUjWYD1IvmvT6x5+UTggDyUFy
 1nBrXj/enSfBb2VuDSYx6KU=
X-Google-Smtp-Source: AMrXdXt/yqQWzK0JIKHjU/7CDgvchWlRfZKhJFMKPVJnTZ3cGXeN8hOkB/m/K6zF7kNjhTkMv6m3QA==
X-Received: by 2002:adf:e690:0:b0:2b3:f6f:293b with SMTP id
 r16-20020adfe690000000b002b30f6f293bmr335845wrm.47.1672893431502; 
 Wed, 04 Jan 2023 20:37:11 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m16-20020adffe50000000b00241bd7a7165sm39712107wrs.82.2023.01.04.20.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 20:37:10 -0800 (PST)
Date: Thu, 5 Jan 2023 07:37:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/msm: another fix for the headless Adreno GPU
Message-ID: <202301050715.xoGxiXQq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231022937.286491-1-dmitry.baryshkov@linaro.org>
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
Cc: lkp@intel.com, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, oe-kbuild-all@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-another-fix-for-the-headless-Adreno-GPU/20221231-103022
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20221231022937.286491-1-dmitry.baryshkov%40linaro.org
patch subject: [PATCH] drm/msm: another fix for the headless Adreno GPU
config: loongarch-randconfig-m031-20230101
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/msm/msm_atomic.c:194 msm_atomic_commit_tail() error: uninitialized symbol 'async'.

vim +/async +194 drivers/gpu/drm/msm/msm_atomic.c

d4d2c60497cfc5 Rob Clark        2019-08-29  181  
d14659f5de7d28 Sean Paul        2018-02-28  182  void msm_atomic_commit_tail(struct drm_atomic_state *state)
cf3a7e4ce08e68 Rob Clark        2014-11-08  183  {
cf3a7e4ce08e68 Rob Clark        2014-11-08  184  	struct drm_device *dev = state->dev;
0b776d457b9476 Rob Clark        2015-01-30  185  	struct msm_drm_private *priv = dev->dev_private;
0b776d457b9476 Rob Clark        2015-01-30  186  	struct msm_kms *kms = priv->kms;
2d99ced787e3d0 Rob Clark        2019-08-29  187  	struct drm_crtc *async_crtc = NULL;
d4d2c60497cfc5 Rob Clark        2019-08-29  188  	unsigned crtc_mask = get_crtc_mask(state);
91a514e50f1157 Dmitry Baryshkov 2022-12-31  189  	bool async;
                                                        ^^^^^^^^^^^
91a514e50f1157 Dmitry Baryshkov 2022-12-31  190  
91a514e50f1157 Dmitry Baryshkov 2022-12-31  191  	if (!kms)
91a514e50f1157 Dmitry Baryshkov 2022-12-31  192  		return;
0b776d457b9476 Rob Clark        2015-01-30  193  
d934a712c5e6a3 Rob Clark        2019-08-29 @194  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
                                                                                           ^^^^^
Unitialized.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

