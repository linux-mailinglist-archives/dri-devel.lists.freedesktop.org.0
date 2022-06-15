Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FA54C92B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785E10E653;
	Wed, 15 Jun 2022 12:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605D10E653
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:53:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e4so13176904ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rZJIbtFCcqW5LZyvrtvGRTza0kOPHpDYWoVZinEr7HE=;
 b=NrS9NRpe5o/bQ3lb903LO8dcj/qna1rKoR+6M72kCwOBfDqP12nDzar/jIizc9f0V3
 aBW9pgDpvxUVObm8Oxr30RBfDkr3F/0MTiOuwpV2f9oCi24oSevmvHraXgxIeSebtN2L
 2oX+cSxSSl1S6+xEfJhHc/PNawyEzs6ZZ8DaTRH81FXrTzYQY9mJYYTyrcl6rMPvpb4r
 6/Pm4J/fADNJZwgH3tbG+cYkv8dx7otU3lENgl2/D3X/yFNrNdPxo7ogXduApB8F/tFI
 hylI70/9G/vyE1jjs/Whrc/QKFhSwRYYhdl7Wo8m/IwC2hSASyc0xwIQF0y0knznX5wn
 YTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rZJIbtFCcqW5LZyvrtvGRTza0kOPHpDYWoVZinEr7HE=;
 b=exR5AsRlmNK29el9aq/QNHEZLl8HIcACAOX1JVRiAcH8WhDv904y8iEDeewBn0Xka7
 5YF07zbVnW1/0103smdgML/XPYu2SA2ouH+ouX+JbVQXln1HzCqhca1UO2cbJcOC+sDl
 a+ki21bBzKbiZXDRTIIH742sySCeAJpRhClbk5WJSUywPmGGNIHN2j3PtHtwoID+IItH
 RmzKefSFHsYqMPSu5qNJDI5O/4LCiLsc0CHtbrdvPWb70emPbzVY0JYR5BdjefUE96/w
 7HMWDm/mznb+xBwu6D4vg4Z2d0Hg7793sCsfRqg1iWuGmlOKag7d+f2MkHskultVPUlv
 rvMw==
X-Gm-Message-State: AJIora/e+28FRXjUXTMxZfqbSN9iqIp9+GGrTjpay7MGbC+/m2ak6ZJE
 2ehJbLKljYQbeO/NvujkgnFt5w==
X-Google-Smtp-Source: AGRyM1s4qlj+lIrSeBVgJpZxc2lRZyIpqY/3N4nxVO3aLTpjlxU1ZGI606Bxg9SdJ9MvROUjqADQKA==
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr5335649ljh.135.1655297583639; 
 Wed, 15 Jun 2022 05:53:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a056512314e00b0047dc488aceesm1709184lfi.116.2022.06.15.05.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:53:03 -0700 (PDT)
Message-ID: <7282608a-314c-b8ac-e225-a7f220be81b6@linaro.org>
Date: Wed, 15 Jun 2022 15:53:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Freedreno] [PATCH v5 00/10] drm/hdcp: Pull HDCP
 auth/exchange/check into helpers
Content-Language: en-GB
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, rodrigo.vivi@intel.com
References: <20220411204741.1074308-1-sean@poorly.run>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
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
Cc: markyacoub@chromium.org, bjorn.andersson@linaro.org,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 23:47, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Rebased set from November. Fixed a nit from Stephen in the msm patch and
> moved hdcp registers into the trogdor dtsi file to avoid differences
> with sc7180-based windows devices. The set is 4 patches lighter since
> some of the changes were accepted into msm.
> 
> I'm still waiting for Intel review of the first 7 patches. Rodrigo/Jani,
> would you please provide your input so we can move forward with this
> set?
> 
> Thanks,
> 
> Sean
> 
> Link: https://patchwork.freedesktop.org/series/94623/ #v1
> Link: https://patchwork.freedesktop.org/series/94713/ #v2
> Link: https://patchwork.freedesktop.org/series/94712/ #v3
> Link: https://patchwork.freedesktop.org/series/94712/ #v4

With most of the patches getting necessary acks and r-b, what would be 
the plan to merge the series?

We can take patches 1-4 (core) + 8, 10 (msm) through the msm tree, 
leaving i915 for the next cycle. Does that sound good?

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
>    drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> 
>   .../bindings/display/msm/dp-controller.yaml   |    7 +-
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |    6 +-
>   drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>   drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>   .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>   .../drm/i915/display/intel_display_types.h    |   58 +-
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>   drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>   drivers/gpu/drm/msm/Makefile                  |    1 +
>   drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>   drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>   drivers/gpu/drm/msm/dp/dp_display.c           |   46 +-
>   drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>   drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>   drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>   drivers/gpu/drm/msm/dp/dp_hdcp.c              |  453 +++++++
>   drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>   drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
>   drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>   drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
>   drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>   include/drm/drm_hdcp.h                        |  194 +++
>   27 files changed, 2582 insertions(+), 1328 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> 


-- 
With best wishes
Dmitry
