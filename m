Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB58724E54
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA48A10E3C7;
	Tue,  6 Jun 2023 20:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678CB10E00D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 20:53:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso25857255e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 13:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1686084809; x=1688676809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0m+lF3oNRbibaULctRURBTLM7/OQCKTGA5USRR3mja0=;
 b=B7HP7TOyKoW+Ir4YcAb+Yb/1Vu2sg2I3jOXLOISA0Ky9RYuvYSjig14i2bemDCMZlE
 np2sXj/8itOTnRS9BAxpMe+AaEbUNmhE/HtYGLMOTEnZSWS8Fp5jrKU0hcVFvCB+jPie
 BStMJFXHA5D9NLRnVNo9p5UXqdw5A7rrNmPjdDAnidFu6TMXd7r7PwrgOL84QbbcCa7a
 MGNvD32L7zb3E9dfnDQgKs5SeqRmGK1Wd5hCNFJzgFOl2Q3YaPHxGMRv1oRp56U4b2zX
 ssfpJzvnRhyvzvwaTyktjhZZM3Qz8PXwgsxoaS+yDNzLU5SBMWzSF5xrQ1ExUtr4H7e6
 O4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686084809; x=1688676809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0m+lF3oNRbibaULctRURBTLM7/OQCKTGA5USRR3mja0=;
 b=CuAAZ3DI9izwtYjJlziG63aGWPpli+oL6sQF48Kjme5+vLjnWd2vgoAg5JUuifBAxw
 yKrqQAnbZxIMRH/vanWFM6bdvZDC4wJpRSN7RC6Sqj/gVUcavsAoX1RIX+y3h98AwkJE
 WDa4On/+61ANdHprRq5AwLF9VJoph4maotKvm29QopxCGrQeYHIJwBf9KWxvr40EPJ2L
 ZID4VTmrWbOpRGUcg/2IyQl6YghYBJxcyMu4yTeGGisHHddrjxClWylYhQFwgzDrDQzS
 V8BiXU+2CFTMiobnVMfz5TcirkAhxuwfJKOhKkExyF2QJJTjVZkMnkBMz9ivtKXHybze
 bnNA==
X-Gm-Message-State: AC+VfDz3ryC5gVSMRFGjQqMLF1W+kWrIpf9F3jODDP2uGBj2EdyGFVai
 UrYb8KPQPRxbR5wQj5Q4zYprsQ==
X-Google-Smtp-Source: ACHHUZ61fijkk/eh3yFtKehYpBkjUy9TTqhHYRcB4bLUheB9jIGIRKTCYGAsldQK7SrlZMNe5G1mvw==
X-Received: by 2002:a05:6000:11c7:b0:30a:ecf3:c9e9 with SMTP id
 i7-20020a05600011c700b0030aecf3c9e9mr2755953wrx.5.1686084809276; 
 Tue, 06 Jun 2023 13:53:29 -0700 (PDT)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adff787000000b0030af1d87342sm13651983wrp.6.2023.06.06.13.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 13:53:28 -0700 (PDT)
Message-ID: <ddce402f-5c7a-2837-fda1-4379816dee0f@froggi.es>
Date: Tue, 6 Jun 2023 21:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 00/13] Enable Colorspace connector property in amdgpu
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20230606202607.122914-1-harry.wentland@amd.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Harry. Looks good.

Reviewed-by: Joshua Ashton <joshua@froggi.es>

- Joshie 🐸✨

On 6/6/23 21:25, Harry Wentland wrote:
> This patchset is based on Joshua's previous patchset [1], as well
> as my previous patchset [2].
> 
> It is
> - enabling support for the colorspace property in amdgpu, as well as
> - allowing drivers to specify the supported set of colorspaces, and
> 
> Colorspace, Infoframes, and YCbCr matrix
> ---------------------------------------
> 
> Even though the initial intent of the colorspace property was to set the
> colorspace field in the respective HDMI AVI and DP SDP infoframes that
> is not sufficient in all scenarios. For DP the colorspace information
> also affects the MSA (main stream attribute) packet. For YUV output the
> colorspace affects the RGB-to-YCbCr conversion matrix. The colorspace
> field of the infopackets also depends on the encoding used, which is
> something that is decided by the driver and not known to userspace.
> 
> For these reasons a driver will need to be able to select the supported
> colorspaces at property creation.
> 
> Note: There seems to be an understanding that the colorspace property
> should ONLY modify the infoframe. While this is current behavior and
> sufficient in some cases it is nowhere specified that this should be the
> only use of this property. As outlined above this limitation is not
> going to work in all cases.
> 
> This patchset does not affect current behavior for the drivers that
> implement this property: i915 and vc4.
> 
> In the future we might want to give userspace control over the encoding
> format on the wire, in particular to avoid use of YUV420 when image
> fidelity is important. This work would likely go hand in hand with a
> min_bpc property and wouldn't conflict with the work done in this
> patchset. I would expect this future work to tag along with a drm_crtc
> or drm_connector's Color Pipeline, similar to the one propsed for
> drm_plane [3].
> 
> Colorspace on crtc or connector?
> --------------------------------
> 
> There have been suggestions of programming 'colorspace' on the drm_crtc
> but I don't think the crtc is the right place for this property. The
> drm_plane and drm_crtc will be used to offload color processing that
> would normally be done via the GFX or other pipelines. The drm_connector
> controls the signalling with the display and ensures the wire format is
> appropriate for the encoding by programming the RGB-to-YCbCr matrix.
> 
> [1] https://patchwork.freedesktop.org/series/113632/
> [2] https://patchwork.freedesktop.org/series/111865/
> [3] https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.html
> 
> v2:
> - Tested with DP and HDMI analyzers
> - Confirmed driver will fallback to lower bpc when needed
> - Dropped hunk to set HDMI AVI infoframe as it was a no-op
> - Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
> - Simplify initialization of supported colorspaces (Jani)
> - Fix kerneldoc (kernel test robot)
> 
> v3:
> - Added documentation for colorspaces (Pekka, Joshua)
> - Split 'Allow drivers to pass list of supported colorspaces' patch
>    to pull out code to create common colorspace array and keep it separate
>    from change to create only supported colorspaces
> 
> v4:
> - Don't "deprecate" existing enum values
> - Fixes based on review comments throughout
> - Dropped Josh's RBs
> 
> v5:
> - Add documentation that drivers are free to pick appropriate
>    RGB or YCC variant
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> 
> Harry Wentland (10):
>    drm/connector: Convert DRM_MODE_COLORIMETRY to enum
>    drm/connector: Pull out common create_colorspace_property code
>    drm/connector: Use common colorspace_names array
>    drm/connector: Print connector colorspace in state debugfs
>    drm/connector: Allow drivers to pass list of supported colorspaces
>    drm/amd/display: Always pass connector_state to stream validation
>    drm/amd/display: Register Colorspace property for DP and HDMI
>    drm/amd/display: Signal mode_changed if colorspace changed
>    drm/amd/display: Send correct DP colorspace infopacket
>    drm/amd/display: Add debugfs for testing output colorspace
> 
> Joshua Ashton (3):
>    drm/connector: Add enum documentation to drm_colorspace
>    drm/amd/display: Always set crtcinfo from create_stream_for_sink
>    drm/amd/display: Refactor avi_info_frame colorimetry determination
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  84 ++++++---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
>   .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 +--
>   drivers/gpu/drm/drm_atomic.c                  |   1 +
>   drivers/gpu/drm/drm_connector.c               | 176 +++++++++++-------
>   .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>   include/drm/display/drm_dp.h                  |   2 +-
>   include/drm/drm_connector.h                   | 129 ++++++++++---
>   9 files changed, 349 insertions(+), 134 deletions(-)
> 
> --
> 2.41.0
> 

