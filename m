Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6286709D09
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 18:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0978C10E54E;
	Fri, 19 May 2023 16:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37FD10E54A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:55:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3ac867f31so1402664e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684515349; x=1687107349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8u8Cffd9gh33GRz1/pbcBEqZLgNy2eMWL4ehBbFWLjI=;
 b=frBZC/4FCb2QlYrqMh5fSiI43wwxOHGZeClHqaQu1pT9pIifaaeOut2l5G5SeW5L5N
 DWg1O3ITeeYp2clN+vP0J6DApUwMDqFgJ9gcrEsQtRES3vtgwQRZXjoPa7H/2FSAJWH/
 JorcuryfBrDaMeDg4sttp+mazhbdiDF9HZpfK5o0EQNhBRF248NdPzl+UMvemqCozPqJ
 KJvk8AEw+/DytCJhQLO8O4LbZHrgmsXonnYgQCeutXT4+oUHrRGvlSnn20q6Ashj2rAt
 xkBlABn6tSf6yUFIKZHoplxKokwropWI7Eh1Ejz0BBtNR9Zn788YZZE9TM8n9hTDa2z/
 hFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515349; x=1687107349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8u8Cffd9gh33GRz1/pbcBEqZLgNy2eMWL4ehBbFWLjI=;
 b=kvrbhMyYtdSPpFKGtL3F+R/f01MDmShXJnzsEdsTOdb1AgAbiUr0y+svBtSaT8oi+f
 Nrk/bgaIxfbGjuLnma415/6PTEYyuF2KMeNkhuExllQ0pFRCNpgVtt1Ezq+36Vq9GbU0
 NYzfTzRIQCgXawwfbwlstx5dtjoFQ/90ttyFSHgKiz3BmtEvJ65Zna11NzYTrtpSQRzl
 R8aigKjT63x7pp/DgXQgLbGx+suARqXkyl0QMUwZ/eCUgYLxo302SzoA8PqNjAY3IT6U
 Z5bhkagbCjEAUMSTGR6xAbApqn9QKC9EAqa+L+noHY28N1AlXtuVntc66tWpPkzRBHZu
 r7EA==
X-Gm-Message-State: AC+VfDyIfXhAylkxiHcHb7yPwdGofmhBqKYZxlmbHhiigUNOeOReyq+K
 106i2dzcq0gNKM9fHqJ5qmCyT8VfOWqIpBC4EYA=
X-Google-Smtp-Source: ACHHUZ7f0Yd3ApLNEvVN4yist87EQ8Ddt29lyiXsuzgsN0hmwyzO5avMdxs62WPck07X7DVpNuW5Vw==
X-Received: by 2002:ac2:5298:0:b0:4f1:5010:4b34 with SMTP id
 q24-20020ac25298000000b004f150104b34mr1215390lfm.18.1684515349191; 
 Fri, 19 May 2023 09:55:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i5-20020ac25225000000b004f13ece6a4fsm656365lfl.101.2023.05.19.09.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 09:55:48 -0700 (PDT)
Message-ID: <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
Date: Fri, 19 May 2023 19:55:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>
References: <20230419154321.1993419-1-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419154321.1993419-1-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 18:43, Mark Yacoub wrote:
> Hi all,
> This is v10 of the HDCP patches. The patches are authored by Sean Paul.
> I rebased and addressed the review comments in v6-v10.
> 
> Main change in v10 is handling the kernel test bot warnings.
> 
> Patches 1-4 focus on moving the common HDCP helpers to common DRM.
> This introduces a slight change in the original intel flow
> as it splits the unique driver protocol from the generic implementation.
> 
> Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.
> 
> Patches 8-10 implement HDCP on MSM driver.
> 
> Thanks,
> -Mark Yacoub
> 
> Sean Paul (10):
>    drm/hdcp: Add drm_hdcp_atomic_check()
>    drm/hdcp: Avoid changing crtc state in hdcp atomic check
>    drm/hdcp: Update property value on content type and user changes
>    drm/hdcp: Expand HDCP helper library for enable/disable/check
>    drm/i915/hdcp: Consolidate HDCP setup/state cache
>    drm/i915/hdcp: Retain hdcp_capable return codes
>    drm/i915/hdcp: Use HDCP helpers for i915
>    dt-bindings: msm/dp: Add bindings for HDCP registers
>    arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller

Dear i915 maintainers,

I wanted to ping you regarding this patch series. If there are no 
comments for the series from you side, would it be possible to land 
Intel-specific and generic patches into drm-intel tree? We will continue 
working on the msm specific parts and merge them through the msm tree.

>    drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> 
>   .../bindings/display/msm/dp-controller.yaml   |    7 +-
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
>   drivers/gpu/drm/display/drm_hdcp_helper.c     | 1224 +++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
>   drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
>   .../drm/i915/display/intel_display_debugfs.c  |   12 +-
>   .../drm/i915/display/intel_display_types.h    |   51 +-
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  352 ++---
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c     | 1060 +++-----------
>   drivers/gpu/drm/i915/display/intel_hdcp.h     |   48 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  267 ++--
>   drivers/gpu/drm/msm/Kconfig                   |    1 +
>   drivers/gpu/drm/msm/Makefile                  |    1 +
>   drivers/gpu/drm/msm/dp/dp_catalog.c           |  156 +++
>   drivers/gpu/drm/msm/dp/dp_catalog.h           |   18 +
>   drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>   drivers/gpu/drm/msm/dp/dp_debug.h             |   11 +-
>   drivers/gpu/drm/msm/dp/dp_display.c           |   39 +-
>   drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>   drivers/gpu/drm/msm/dp/dp_drm.c               |   39 +-
>   drivers/gpu/drm/msm/dp/dp_drm.h               |    7 +
>   drivers/gpu/drm/msm/dp/dp_hdcp.c              |  389 ++++++
>   drivers/gpu/drm/msm/dp/dp_hdcp.h              |   33 +
>   drivers/gpu/drm/msm/dp/dp_parser.c            |   14 +
>   drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>   drivers/gpu/drm/msm/dp/dp_reg.h               |   30 +-
>   drivers/gpu/drm/msm/msm_atomic.c              |   19 +
>   include/drm/display/drm_hdcp.h                |  296 ++++
>   include/drm/display/drm_hdcp_helper.h         |   23 +
>   30 files changed, 2867 insertions(+), 1349 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> 

-- 
With best wishes
Dmitry

