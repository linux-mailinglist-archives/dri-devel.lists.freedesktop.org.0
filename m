Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1564AF81
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 06:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD47310E1A8;
	Tue, 13 Dec 2022 05:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FB510E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:53:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so7439860wmr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 21:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JD7lR4jOctI/rduJJA9ZmTaNEOz6cl5prmlujN0KJ8I=;
 b=aNViv4bSPd82rVXAUKG5YALVbYJ2MNPZH4DDQ4x2EjeJMdKD6wfGRsJnKTSfdmqytO
 L16G89mpAl+TjbdZnPljKaI91YAyDKSQQrV8MKU1iZLv7qB0x0uIt+mgb2/927QzhR78
 OxMf+0zimv0IXuDen/eiDUzHEz+njVO/0S/TlyuNCMZtojB8I7/xAniAB4/V17IvPDcK
 3HpI9UVJMLSyta2OhC/HpVtasC2PmmCfb1qU6jHnK7a02O3YyT2bYS43rq1hE9MOTKAw
 MV8i6fDgBEej2EHA9eBXHT5Zb3P6aDwE1ljFuX6FDlkWUIwxhXhXQfLpQltlXIfz502s
 LO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JD7lR4jOctI/rduJJA9ZmTaNEOz6cl5prmlujN0KJ8I=;
 b=FwZKt3VIzW3opwmTx1uGJQ6+8gP2Wzqu433S+Eqr05/jBMotLkeKjbSQF7shkS/+Tg
 kFmoI2dFrvvHbbU3XeWRIur1ArfgZ7FaefXiWGD5yGfadF5lcI4fdWCI6aGZsTNR/0x8
 Y8/O8STq2eyULWDRuugkOyQc3aQrfU5F7RaAZS/rRq4rse05/IfApnPaLXbwP1/kvaoA
 bUZYYt70OhLfoKcGPbF6JCuaXvmV7eWwcRuyqaMiz3hr9gs/6y7Pr7Ia+Fd7IzXxtjtd
 qiOSTJAGp3enfi8cvzMmoPIjr61pqfqgUU+h/Xubp+FSCq6zOY+M4fG2vezkXd6VsNg+
 yqEQ==
X-Gm-Message-State: ANoB5plLVU6x4G2ndjnBW90/wimrq/0jqDny/8IiYNYjO1AjkyL0Te4t
 XKvb5R0IxEd9+jJdwiHmvppVmg==
X-Google-Smtp-Source: AA0mqf5TISVKDE81h9YRIaPL5VPqWOKN2aEiKA6K8qdfxIqLVolCeV0weidSsG2hqMQUCZSGgKFiLg==
X-Received: by 2002:a05:600c:1e18:b0:3d2:26e1:bd45 with SMTP id
 ay24-20020a05600c1e1800b003d226e1bd45mr5117173wmb.29.1670910828287; 
 Mon, 12 Dec 2022 21:53:48 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056000008800b002366c3eefccsm10576204wrx.109.2022.12.12.21.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 21:53:47 -0800 (PST)
Message-ID: <e5c20e75-354a-c8e8-f7be-3de29df6abaa@froggi.es>
Date: Tue, 13 Dec 2022 05:53:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 00/16] Enable Colorspace connector property in amdgpu
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221212182137.374625-1-harry.wentland@amd.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this, Harry!

I tested your series with https://github.com/Themaister/Granite + 
test-hdr with my KHR_display + HDR Mesa branch and it works great.

The code also looks good -- I was already fairly familiar with it when I 
rebased it and debugged things previously. (Hence where my random commit 
comes from).

Once the documentation comment is fixed in "[PATCH 07/16] drm/connector: 
Print connector colorspace in state debugfs" this series is Reviewed-By: 
Joshua Ashton <joshua@froggi.es>

- Joshie 🐸✨

On 12/12/22 18:21, Harry Wentland wrote:
> This patchset enables the DP and HDMI infoframe properties
> in amdgpu.
> 
> The first two patches are not completely related to the rest. The
> first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
> unknown in the kernel.
> 
> The second one prints a connector's max_bpc as part of the atomic
> state debugfs print.
> 
> The following patches rework the connector colorspace code to
> 1) allow for easy printing of the colorspace in the drm_atomic
>     state debugfs, and
> 2) allow drivers to specify the supported colorspaces on a
>     connector.
> 
> The rest of the patches deal with the Colorspace enablement
> in amdgpu.
> 
> Since the Colorspace property didn't have an IGT test I added
> one to kms_hdr. The relevant patchset can be found on the IGT
> mailing list or on
> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorimetry
> 
> Since I don't have a DP and HDMI analyzer I could not test this
> end-to-end but someone will test it in the coming days. We'll
> refrain from merging this until we can confirm the DP/HDMI analyzer
> shows the correct infoframe.
> 
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> 
> Harry Wentland (15):
>    drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>    drm/connector: print max_requested_bpc in state debugfs
>    drm/connector: Drop COLORIMETRY_NO_DATA
>    drm/connector: Convert DRM_MODE_COLORIMETRY to enum
>    drm/connector: Pull out common create_colorspace_property code
>    drm/connector: Allow drivers to pass list of supported colorspaces
>    drm/connector: Print connector colorspace in state debugfs
>    drm/amd/display: Always pass connector_state to stream validation
>    drm/amd/display: Register Colorspace property for DP and HDMI
>    drm/amd/display: Set colorspace for HDMI infoframe
>    drm/amd/display: Send correct DP colorspace infopacket
>    drm/amd/display: Add support for explicit BT601_YCC
>    drm/amd/display: Add debugfs for testing output colorspace
>    drm/amd/display: Add default case for output_color_space switch
>    drm/amd/display: Don't restrict bpc to 8 bpc
> 
> Joshua Ashton (1):
>    drm/amd/display: Always set crtcinfo from create_stream_for_sink
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  86 ++++++---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
>   drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
>   drivers/gpu/drm/drm_atomic.c                  |   2 +
>   drivers/gpu/drm/drm_connector.c               | 181 ++++++++++--------
>   .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>   include/drm/display/drm_dp.h                  |   2 +-
>   include/drm/drm_connector.h                   |  57 +++---
>   9 files changed, 261 insertions(+), 138 deletions(-)
> 
> --
> 2.38.1
> 

