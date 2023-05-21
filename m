Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BDD70ABB8
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 02:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902A810E1A5;
	Sun, 21 May 2023 00:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D1810E083
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 00:03:14 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3a611b3ddso2714019e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684627392; x=1687219392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hzuHTgVFvJOcibg5XLms2snXPUj1XRLOS2dGHZrGZ9w=;
 b=de+9pEzv+V+RtnsauZw1xJ6xg3xowMNpYhR2hrMHrnN5DwuHS53a/6mYf3PqexfLDE
 RmrA2Q1Evv0OP57PG0lL7CptzD1/v+W6Ui+nhQg3eOzfYJi3E1B+Nl/i0L1ES4GWMT8f
 hKQ6Gny7a2IG1sUuaXzRAkjqj425vczlNPoNuYao4FDu0bDB6aHhHifRiA+cbZ6Dp5dL
 RxXrYhFBElafPjSMSfWd3B42NflJBjfdFsI70JRdiGFsK5LLXgQuRfj6NtUmJvfqTAZk
 8ZlXl8RV+FdQ5aW0+FzdsRL+MjC9E0sLOjKiSK+uc9xK5OjdQfAumgrB4VV3YZxgt4cK
 AIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684627392; x=1687219392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hzuHTgVFvJOcibg5XLms2snXPUj1XRLOS2dGHZrGZ9w=;
 b=QnsWUQ1BAthgnLhDrla0Z33v+k/ivGV7AiwHrFcf9CuAwqlQCRI+P/RRVKWcoYXAy6
 cGyc2bPVbLh/ijAg6iCAW+NVjk6iBAMmdkKE6ILFta1+OMRAefjyaeqfEpXsjJ7S9p/+
 bxVDUcqeNhwZLbfmPv80UzX3DlDd6VxPwzpin3TcNStJGBgCei6JfDG40kK5Qa/SE3wx
 8t8Kn6g/pp17xGqy2uqXSE2Uopme/CXdOHgUadfqEx9p3DD1WvP15NCkGMGmqhT/NdNd
 zZUo2W7OjXGg0wXck3yOca5WG830KDxT7oYlpSG/mRin2F8xbVfNKKH7ZH1nLquyPGI1
 5ZTg==
X-Gm-Message-State: AC+VfDxgw80Gy4Z5qDlnkNg4FQQS68Mzt9hqXoH5OVwD6CDc2K9+4dVe
 5tEOY07fJovvACluk46NgaOA8g==
X-Google-Smtp-Source: ACHHUZ4inqGzFl0yu2BA3Hvm7A2976kcqcOuiyRPVgeqFJjRLVRuHQcUW5BDIw84DZ989za7vayVVQ==
X-Received: by 2002:ac2:4c49:0:b0:4f0:74:61a0 with SMTP id
 o9-20020ac24c49000000b004f0007461a0mr2566610lfk.0.1684627392247; 
 Sat, 20 May 2023 17:03:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c28-20020ac2531c000000b004f38411f148sm418378lfh.84.2023.05.20.17.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 May 2023 17:03:11 -0700 (PDT)
Message-ID: <da1f7aa1-f560-31f4-6114-e400f35d325b@linaro.org>
Date: Sun, 21 May 2023 03:03:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 0/9] drm: fdinfo memory stats
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230515143023.801167-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Lijo Lazar <lijo.lazar@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Peter Maucher <bellosilicio@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 17:30, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
> 
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
> 
> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> 
> I've combined the separate series to add comm/cmdline override onto
> the end of this, simply out of convenience (they would otherwise
> conflict in a bunch of places).
> 
> v2: Extend things to allow for multiple regions other than just system
>      "memory", make drm_show_memory_stats() a helper so that, drivers
>      can use it or not based on their needs (but in either case, re-
>      use drm_print_memory_stats()
> v3: Docs fixes
> v4: use u64 for drm_memory_stats, small docs update and collected
>      Tvrtko's a-b
> 
> [1] https://patchwork.freedesktop.org/series/112397/
> 
> Rob Clark (9):
>    drm/docs: Fix usage stats typos
>    drm: Add common fdinfo helper
>    drm/msm: Switch to fdinfo helper
>    drm/amdgpu: Switch to fdinfo helper
>    drm: Add fdinfo memory stats
>    drm/msm: Add memory stats to fdinfo
>    drm/doc: Relax fdinfo string constraints
>    drm/fdinfo: Add comm/cmdline override fields
>    drm/msm: Wire up comm/cmdline override for fdinfo
> 
>   Documentation/gpu/drm-usage-stats.rst      | 101 ++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
>   drivers/gpu/drm/drm_file.c                 | 147 +++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  24 +++-
>   drivers/gpu/drm/msm/msm_drv.c              |  15 ++-
>   drivers/gpu/drm/msm/msm_gem.c              |  15 +++
>   drivers/gpu/drm/msm/msm_gpu.c              |   2 -
>   drivers/gpu/drm/msm/msm_gpu.h              |  10 ++
>   include/drm/drm_drv.h                      |   7 +
>   include/drm/drm_file.h                     |  51 +++++++
>   include/drm/drm_gem.h                      |  32 +++++
>   13 files changed, 378 insertions(+), 47 deletions(-)

What is the expected merge plan for this series? msm-next? drm-misc?



-- 
With best wishes
Dmitry

