Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C3732FDD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97DB10E0D6;
	Fri, 16 Jun 2023 11:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC5010E0D6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 11:30:31 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b3424edd5fso7627251fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 04:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686915027; x=1689507027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hWaj8V26e6AndVXAhP1UnOZRtCJHb24nNyQJnL1KfpQ=;
 b=qsMcLbqWpaDKn5jJ3a7lh2l7ZEoQMihWU/D9Xl/C041+aVh8oEnvGGYPYeWgI//piH
 8RKB9TSLG+GDqdw1aeL7PACdlLO5VCCDB8NLuLoXYEdPbZ4PEHZJdfVMrU0ZPbiqmCPx
 VVQ15Kwq+qOIGF/AsyhY3pvyC1lFN4JqKcZuc7rkCxLRVEryb7uIJiyUtvBuGSw14hZ3
 KqgKogpwOPt802SJKBQty6rmzQBRW1InBZSIkacyo/IjUeRjU+SR995A/qgHZ2heQYqp
 mIQ5G6qeN0AlcwrWw9vGaDIdB0sLriKHrGiYMp8xxCMcztgfndwKHCBiWrGJj6Qq6CS+
 Adig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686915027; x=1689507027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hWaj8V26e6AndVXAhP1UnOZRtCJHb24nNyQJnL1KfpQ=;
 b=fAN77ePJuPmKRE4bcSK/nHoYtW0aw/O3tYszU6lOQDDTOLPKjmRjRNvOf67LcK0smH
 Um0/b5vY8FU/rQpwZZtU7Etz48TiGOdIK1QZKg9CfV7n+HESeybpT0DsezkMf6geHuZM
 EMW6PV5V0X1VCWsetLu8nlB1i2/eIjGZV+8cwmX+mOAhTsMbFVkcEhE9DPvEXZFT7ZAP
 FDDkQC6RfVwHlOFTPgKLVOmlGowd7Fd8YxCR36N24yHlE+ZXU98O2CAd7Be/JBkum0ND
 JCPQZON6ZzLyHIpib2Y8+FToc+Exyf4y95A2TPasSsZEkDRarfP2R4tkTmch0d5OxLMw
 Sx+g==
X-Gm-Message-State: AC+VfDyB4d0YN0pOcCEhVky2a5yHQ2YeP34TONB9i9wJcvRxwZAP4Ts1
 emCIOvGpW/rOCX6hLoA7+3/y6Q==
X-Google-Smtp-Source: ACHHUZ7fM7XuMr8WhrpLTJWyagGKaUPyrMK77XcC+7GWq+uy60ZRqPMZkECck0Zt0Hymekne24sv4w==
X-Received: by 2002:a2e:9206:0:b0:2b0:259d:f670 with SMTP id
 k6-20020a2e9206000000b002b0259df670mr1487873ljg.4.1686915027509; 
 Fri, 16 Jun 2023 04:30:27 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi.
 [85.76.68.127]) by smtp.gmail.com with ESMTPSA id
 j6-20020a2eb706000000b002b34f9cfc7asm1072257ljo.90.2023.06.16.04.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 04:30:27 -0700 (PDT)
Message-ID: <8d5870f8-e530-fa8f-444a-3d3ccf716d48@linaro.org>
Date: Fri, 16 Jun 2023 14:30:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/3] Add support for databus widen mode
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2023 04:57, Jessica Zhang wrote:
> DPU 5.x+ and DSI 6G 2.5.x+ support a databus-widen mode that allows for
> more compressed data to be transferred per pclk.
> 
> This series adds support for enabling this feature for both DPU and DSI
> by doing the following:
> 
> 1. Add a DPU_INTF_DATABUS_WIDEN feature flag
> 2. Add a DPU INTF op to set the DATABUS_WIDEN register
> 3. Set the DATABUS_WIDEN register and do the proper hdisplay
>     calculations in DSI when applicable

As I was writing the documentation patch, another thought stroke me wrt 
this patchset. Could you please add a check to DSI's mode_valid 
disallowing all modes if DSI_BPP > 8 & !widebus. Technically this check 
does not filter modes per se, but in my opinion ending up with empty 
modes list would be a better user experience compared to having a list 
of modes, from which none can be selected.

And if we ever get dynamic mode/dsc_config setup, this would allow us to 
filter unsupported modes via their DSC confiuration.

Abhinav, I remember, that you told me that adding drm_dsc_config to drm 
modes was forbidden already. However this looks like a valid reason to 
maybe restart the discussion: we want to filter modes basing on the 
corresponding DSC data rather than allowing the mode in mode_valid() and 
then failing it in the atomic_check().

> 
> Note: This series will only enable the databus-widen mode for command
> mode as we are currently unable to validate it on video mode.
> 
> Depends on: "Add DSC v1.2 Support for DSI" [1]
> 
> [1] https://patchwork.freedesktop.org/series/117219/
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Nit: there is no need to sign-off the cover letters.

> ---
> Jessica Zhang (3):
>        drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag for DPU >= 5.0
>        drm/msm/dpu: Set DATABUS_WIDEN on command mode encoders
>        drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
>   drivers/gpu/drm/msm/dsi/dsi.xml.h                    |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                   | 19 ++++++++++++++++++-
>   7 files changed, 41 insertions(+), 2 deletions(-)
> ---
> base-commit: 1981c2c0c05f5d7fe4d4552d4f352cb46840e51e
> change-id: 20230525-add-widebus-support-f785546ee751
> 
> Best regards,

-- 
With best wishes
Dmitry

