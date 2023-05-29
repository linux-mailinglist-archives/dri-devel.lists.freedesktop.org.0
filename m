Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6620715230
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1B710E30D;
	Mon, 29 May 2023 22:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D61210E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:55:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so4037381e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685400923; x=1687992923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=erb1mT4gxBfvr6bhVSpCQkfJxjOnYXNjx/AzFex9rao=;
 b=vfM/4roU28bxzHL3YHgezlXFGtHkmoymMUAt7C7C7eUZJMqzGCbKBqUP1rA+44aveN
 FgNive4EI4JKkxnPztfsIPtq72JjsiQZxXyhpkjavq6qQVnn2u6JKZj6MU7rW0oHP+si
 h/XgVNYDqkrr2E0KYdA9n+S96P7xfC6/oigcrOUnEdu4eKsDzMWP9pwKvcWlRlZAaGsj
 umzlrja8UJkIFJ5DXoiNmpHyCZSAZ5RxWbFNn5yA4oBeGBe9uH7083Q+HZxq627v+GfX
 1L//YKTObAEQXyt6vCJ1wE/Yls00L8oJN5TzbjCqUOKyZj/pSrLnFGPsbnzkyjQxplMh
 wwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685400923; x=1687992923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=erb1mT4gxBfvr6bhVSpCQkfJxjOnYXNjx/AzFex9rao=;
 b=Q0LhMsG2aDIzAblF7+/KAFFOaR0BnHzLLkZ0/qVC+naTSutSXzfSa+ZIZVM9xx+lqL
 ktwkjLR4fGz2f9Uv/BkF9aLf+iDfM9tZLJblNzdBqf+naaN/2UqbAB7i+jPCazp4wlxv
 Uqh85vLDKEJP3lTx7fhSOeWDyRkywS9fSk7WMHUS74TXjaXCeEtiQfO5Z/FwRXywUlbO
 zJs682ClOzmoxfEaoxqJjsVcptNw49dadK6vAucdjkg18tc1hQlQxZu6OsD/o+0NQzuv
 81FCQW9kCluOTJ27qJHfrepWIKyy7/wcRrWS1rElXE/UjYl54JnyZxFwe5E1pb2rPoCn
 grAw==
X-Gm-Message-State: AC+VfDx3a0+rPc52CTGUhoj8d2U7/0dww0unafjPdMBhIo2L2TlP/NmI
 b1EekVhROJ3KIT/pSm5c22oXLg==
X-Google-Smtp-Source: ACHHUZ6yBG+U0n4l8SBmlpDgsHF6xTUrbv7N3+XfzyJJzM0/mlNjaK7nZJr2jDTfm98MXQI/puoQUw==
X-Received: by 2002:ac2:4c35:0:b0:4f3:79af:fcb7 with SMTP id
 u21-20020ac24c35000000b004f379affcb7mr50149lfq.26.1685400923082; 
 Mon, 29 May 2023 15:55:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u22-20020ac24c36000000b004efe73ee01fsm133154lfq.306.2023.05.29.15.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 15:55:22 -0700 (PDT)
Message-ID: <7e385b28-f418-52b2-71ea-52347ec6a819@linaro.org>
Date: Tue, 30 May 2023 01:55:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 00/36] drm/amd/display: add AMD driver-specific properties
 for color mgmt
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
References: <20230523221520.3115570-1-mwen@igalia.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230523221520.3115570-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 kernel-dev@igalia.com, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/05/2023 01:14, Melissa Wen wrote:
> This series is a refined version of our RFC [1] for AMD driver-specific
> color management properties. It is a collection of contributions from
> Joshua, Harry and I to enhance AMD KMS color pipeline for Steam
> Deck/SteamOS by exposing the large set of color caps available in AMD
> display HW.
> 
> Considering RFC feedback, this patchset differs from the previous one by
> removing the KConfig option and just guarding driver-specific properties
> with `AMD_PRIVATE_COLOR` - but we also removed the guards from internal
> elements and operations. We stopped to advertise CRTC shaper and 3D LUTs
> properties since they aren't in use in the Steam Deck color pipeline[2].
> On the other hand, we keep mapping CRTC shaper and 3D LUTs (DM) to DC
> MPC setup. We also improved curve calculations to take into account HW
> color caps.
> 
> In short, for pre-blending, we added the following properties:
> - plane degamma LUT and predefined transfer function;
> - plane HDR multiplier
> - plane shaper LUT/transfer function;
> - plane 3D LUT; and finally,
> - plane blend LUT/transfer function, just before blending.

This set of properties sounds interesting and not fully AMD-specific. 
Could you please consider moving them to the more generic location?

For the reference, MSM (Qualcomm) display hardware supports 
degamma/gamma LUTs for planes too. One of the suggested usecases for 
these degamma/gamma units is to support colorspace transfer functions.

Thus, at least some of these properties can be implemented in drm/msm 
driver too.

> After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> therefore, we extend post-blending color pipeline with CRTC gamma
> transfer function.
> 
> The first three patches are on DRM KMS side. We expose DRM property
> helper for blob lookup and replacement so that we can use it for
> managing driver-specific properties. We add a tracked for plane color
> mgmt changes and increase the maximum number of properties to
> accommodate this expansion.
> 
> The userspace case here is Gamescope which is the compositor for
> SteamOS. It's already using all of this functionality to implement its
> color management pipeline right now [3].
> 
> Current IGT tests kms_color and amdgpu/amd_color on DCN301 and DCN21 HW
> preserve the same results with and without the guard.
> 
> Finally, I may have missed something, please let me know if that's the
> case.
> 
> Best Regards,
> 
> Melissa Wen
> 
> [1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@igalia.com
> [2] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [3] https://github.com/ValveSoftware/gamescope
> 
> 
> Harry Wentland (2):
>    drm/amd/display: fix segment distribution for linear LUTs
>    drm/amd/display: fix the delta clamping for shaper LUT
> 
> Joshua Ashton (13):
>    drm/amd/display: add plane degamma TF driver-specific property
>    drm/amd/display: add plane HDR multiplier driver-specific property
>    drm/amd/display: add plane blend LUT and TF driver-specific properties
>    drm/amd/display: copy 3D LUT settings from crtc state to stream_update
>    drm/amd/display: dynamically acquire 3DLUT resources for color changes
>    drm/amd/display: add CRTC regamma TF support
>    drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
>    drm/amd/display: add support for plane degamma TF and LUT properties
>    drm/amd/display: add dc_fixpt_from_s3132 helper
>    drm/adm/display: add HDR multiplier support
>    drm/amd/display: handle empty LUTs in __set_input_tf
>    drm/amd/display: add DRM plane blend LUT and TF support
>    drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
> 
> Melissa Wen (21):
>    drm/drm_mode_object: increase max objects to accommodate new color
>      props
>    drm/drm_property: make replace_property_blob_from_id a DRM helper
>    drm/drm_plane: track color mgmt changes per plane
>    drm/amd/display: add CRTC driver-specific property for gamma TF
>    drm/amd/display: add plane driver-specific properties for degamma LUT
>    drm/amd/display: add plane 3D LUT driver-specific properties
>    drm/amd/display: add plane shaper LUT driver-specific properties
>    drm/amd/display: add plane shaper TF driver-private property
>    drm/amd/display: add comments to describe DM crtc color mgmt behavior
>    drm/amd/display: encapsulate atomic regamma operation
>    drm/amd/display: update lut3d and shaper lut to stream
>    drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
>    drm/amd/display: handle MPC 3D LUT resources for a given context
>    drm/amd/display: add CRTC 3D LUT support
>    drm/amd/display: add CRTC shaper LUT support
>    drm/amd/display: add CRTC shaper TF support
>    drm/amd/display: mark plane as needing reset if plane color mgmt
>      changes
>    drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>    drm/amd/display: reject atomic commit if setting both plane and CRTC
>      degamma
>    drm/amd/display: program DPP shaper and 3D LUT if updated
>    drm/amd/display: add plane shaper/3D LUT and shaper TF support
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 125 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  69 ++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  28 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 110 +++-
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 612 ++++++++++++++++--
>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++-
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 213 +++++-
>   drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
>   drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
>   .../amd/display/dc/dcn10/dcn10_cm_common.c    | 107 ++-
>   .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
>   .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
>   .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
>   .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>   drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
>   drivers/gpu/drm/drm_atomic.c                  |   1 +
>   drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>   drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
>   drivers/gpu/drm/drm_property.c                |  49 ++
>   include/drm/drm_mode_object.h                 |   2 +-
>   include/drm/drm_plane.h                       |   7 +
>   include/drm/drm_property.h                    |   6 +
>   22 files changed, 1416 insertions(+), 140 deletions(-)
> 

-- 
With best wishes
Dmitry

