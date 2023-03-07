Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C5B6AE173
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7C610E4A2;
	Tue,  7 Mar 2023 13:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65AB10E498
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:54:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n2so17115265lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678197284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aPmjHWuFuv6F58SfS5GxDfQIhMMuuYwG2pBnFif7yZ0=;
 b=srAh3UY2X3KYEtRhNoUJNsIrQDH4MKtAoQSMWOyGQ9+J9yhh6E1rNbNOegLd2Xy9qO
 iOcikU8KOQLt4BePPYM2r6pDvf9DUjhTjTp/Vpl7+RNgpGldmQPgGFO8VYDrUQaQ/Bor
 4lElfdkPTR31BgJO+cm2Hy1HdwhJvGpnnMIyDI7aCQ8h0/eHgYFLPK19weJyCk5RKf42
 BJ24ZBBU+ZBGz9wX6LyMKKuhasggHPa5SqbCIh2naFmay6qtL803A7QVfuAEuA89Az5z
 Xta002DhwcEhIatRtC8tL24u7YpJ2ZxqJixKXndSwTuNS5uK/vom3SF90yba8fSStgI0
 u6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678197284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aPmjHWuFuv6F58SfS5GxDfQIhMMuuYwG2pBnFif7yZ0=;
 b=1lkMzoyx2sYH3p485A+e7qtKgte6YP+XKfJeJpf5jGMfaUpQStLDP7WXRUNEZEpMjF
 lhL6C706IrvvtjmL/HQxgHHOlHrrPCBtVXiF5lRYE91YOHwwfB9/QWU10UYGVRstYcaP
 9hE6GVm4s/2AXCAnkbwctvPvlsyYpQsbqMTc2FqxogSO3g6S1Lz045Qf0ZDNNbwZCUIg
 2cga5TYWytmwM13oVGRA5vZeyXF2tt3kf641HDZYN0KuBCfWfQ+sjbwun3ce/4fhi+hp
 2EWzrk22n9BgaXHuFuX+QZksAzb18Do45ODZkpImffq342cz6IVW0AY0bd38cCCNzjMS
 jzuw==
X-Gm-Message-State: AO0yUKXe0ta4l1WH5QnwcEprZaJUM4TXH2YXc+SaqVdgP/gOs/J+l/f4
 EjY6Ko889Ub1DcS3VKYTlF6wWg==
X-Google-Smtp-Source: AK7set+rcXfy6mfYYqPaxyRmMJjEFrUAW5fRIvhtFGjTsQMKNImU//9d5pU6vay7STdcZ6FJNJgaHg==
X-Received: by 2002:ac2:46c8:0:b0:4e0:6e01:7ebe with SMTP id
 p8-20020ac246c8000000b004e06e017ebemr4171993lfo.36.1678197284220; 
 Tue, 07 Mar 2023 05:54:44 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q9-20020ac25149000000b004dda74eccafsm2054843lfd.68.2023.03.07.05.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:54:43 -0800 (PST)
Message-ID: <b3d3a70a-6f6b-e7ff-cf0c-cb0093212a3b@linaro.org>
Date: Tue, 7 Mar 2023 15:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v14 00/14] Add PSR support for eDP
Content-Language: en-GB
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

David, Daniel & other drm maintainers,

On 02/03/2023 18:33, Vinod Polimera wrote:

[skipped the changelog]

> Vinod Polimera (14):
>    drm: add helper functions to retrieve old and new crtc
>    drm/bridge: use atomic enable/disable callbacks for panel bridge
>    drm/bridge: add psr support for panel bridge callbacks

The first three patches are generic. How do we merge this series? I 
think these three patches should be merged into an immutable branch at 
drm-misc (or any other drm tree), which we can then merge into msm-next. 
What do you think?

>    drm/msm/disp/dpu: check for crtc enable rather than crtc active to
>      release shared resources
>    drm/msm/disp/dpu: get timing engine status from intf status register
>    drm/msm/disp/dpu: wait for extra vsync till timing engine status is
>      disabled
>    drm/msm/disp/dpu: reset the datapath after timing engine disable
>    drm/msm/dp: use atomic callbacks for DP bridge ops
>    drm/msm/dp: Add basic PSR support for eDP
>    drm/msm/dp: use the eDP bridge ops to validate eDP modes
>    drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
>      functions
>    drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
>    drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
>      during self refresh
>    drm/msm/dp: set self refresh aware based on psr support
> 
>   drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
>   drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
>   drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
>   drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
>   drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 ++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
>   drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
>   include/drm/drm_atomic.h                           |   7 +
>   22 files changed, 683 insertions(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry

