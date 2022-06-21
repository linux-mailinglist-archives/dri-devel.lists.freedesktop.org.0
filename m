Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A515539A4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 20:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EABD10E6CE;
	Tue, 21 Jun 2022 18:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E510E6CE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 18:40:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id w20so23803574lfa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 11:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uDyittP64vQtB3M07CJp4QeN+56SAqdK1J0XQGpRBNo=;
 b=fpcGPwaFqceX/cmFvUoJ5QF+vl0m5i9zqNt5QSuFTn+JjvEO+6alOPrbo19Jrl2zyV
 0+guPaVkW6yUcY9p7gw6o23WlqsmcEsVxMDwiU848Mshx01t24FI4QrpSf8ii6F9G1Dd
 5oJICdaCNpeFqaAXjtnZpwif2QeQm83p3uKl9S8qatOQZHk+LTSa5MR2N9kob6boDHYU
 YfXybzBaE/x+VTTjnlg4ShuD8hYBI92rGGRySxLtjzFVEw4PuF6wWKph74VOGVwy16wF
 QqWA75CvOZ0uFIJnefwC+cTQzIkYjDyQqLrLUsd1n83o1wPZYkUe7pDTa7M4XKWTIGba
 wnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uDyittP64vQtB3M07CJp4QeN+56SAqdK1J0XQGpRBNo=;
 b=TIXZtaj/fcmeBSLOv9HREJQ+k+CpLyycADHgtKbrTeSMF2Bs3Abqq3T9vX359nPF7j
 ekGs1V5Yq9qeLy+dh8X66foms5z6rAWIN/zFqF5g1w5gOyjfVWSq3qiSKsj988uSRfVO
 GYUZ5cg3Ecw9VQEV4qoBLcFiTz3/jnnI9UyweyLEn82nvBAZditNp2juousGvRgqXF3C
 Xro522WmitAOujMVaBZmy0jjTQjArz9GBa4RaKSjmh3KIP++ggOpHc8C0m8akHNqj+sn
 nWMN9BOpZmTT59jwtNvqmkh4IuWPWVXhipE50BePSF0ObZ+o9rLpE+hXcD1AFpp6MwqC
 Ehmg==
X-Gm-Message-State: AJIora9k42eCbX/Wk2pS/mX0GDFAJG0Gxfvg3ADrdUSwfZkyD/W1YbRh
 Ey8WwjXz8F7LJmphbZVqlB5zcg==
X-Google-Smtp-Source: AGRyM1uhpfmmJNlYBdq65hirTMs/vSoZDLblmci38dLR13tm6bWLAc5IouVaSgnfb/4mTHqgIb03JA==
X-Received: by 2002:a05:6512:515:b0:479:11a0:8132 with SMTP id
 o21-20020a056512051500b0047911a08132mr17892802lfb.344.1655836805207; 
 Tue, 21 Jun 2022 11:40:05 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 g2-20020ac24d82000000b0047dc46b466esm2262741lfe.85.2022.06.21.11.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:40:04 -0700 (PDT)
Message-ID: <33a9a76a-5f6e-b790-17d4-62869a04529d@linaro.org>
Date: Tue, 21 Jun 2022 21:40:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [v3 0/5] Add PSR support for eDP
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please fix your mailer. You've got the following headers, which clearly 
confuse the threading:

In-Reply-To: <y>
References: <y>

Also the y@qualcomm.com address (present in To:) rejects incoming mail.


On 21/06/2022 13:53, Vinod Polimera wrote:
> Changes in v2:
>    - Use dp bridge to set psr entry/exit instead of dpu_enocder.
>    - Don't modify whitespaces.
>    - Set self refresh aware from atomic_check.
>    - Set self refresh aware only if psr is supported.
>    - Provide a stub for msm_dp_display_set_psr.
>    - Move dp functions to bridge code.
> 
> Changes in v3:
>    - Change callback names to reflect atomic interfaces.
>    - Move bridge callback change to separate patch as suggested by Dmitry.
>    - Remove psr function declaration from msm_drv.h.
>    - Set self_refresh_aware flag only if psr is supported.
>    - Modify the variable names to simpler form.
>    - Define bit fields for PSR settings.
>    - Add comments explaining the steps to enter/exit psr.
>    - Change DRM_INFO to drm_dbg_db.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Vinod Polimera (5):
>    drm/msm/dp: Add basic PSR support for eDP
>    drm/bridge: use atomic enable/disable callbacks for panel bridge
>      functions
>    drm/bridge: add psr support during panel bridge enable & disable
>      sequence
>    drm/msm/disp/dpu1: use atomic enable/disable callbacks for encoder
>      functions
>    drm/msm/disp/dpu1: add PSR support for eDP interface in dpu driver
> 
>   drivers/gpu/drm/bridge/panel.c              | 110 ++++++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  36 +++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  30 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c            |  76 ++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
>   drivers/gpu/drm/msm/dp/dp_display.c         |  14 +++
>   drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
>   drivers/gpu/drm/msm/dp/dp_drm.c             | 166 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
>   drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
>   drivers/gpu/drm/msm/dp/dp_reg.h             |  27 +++++
>   15 files changed, 591 insertions(+), 24 deletions(-)
> 


-- 
With best wishes
Dmitry
