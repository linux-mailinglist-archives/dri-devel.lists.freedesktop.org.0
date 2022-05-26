Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7918534EA2
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9110E0A7;
	Thu, 26 May 2022 11:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F191E10E083
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:52:47 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id r3so1484766ljd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MVQ54/b1Bl5zWRXm8QvTFiSCRNNAIcNHd+D1lpI9ZC4=;
 b=UmO31J8nUxjp24jXb9Co3KN+CJRVqgMArHtMvcSuJO9jKWXYfcw9VbrPq5AxzeSKve
 XwfqJ/YWWzlM15YQ7L2Ar4pTSJS8dStrVzFwMFmeJMwAmPVRdVZIWB7lXBbtMiRV/L8u
 29u8sVAXQFS16oufZNyiAaly3L2FSIJ1ztnAN8iBfmvpauGpqCbbqKEzm/2gYtzrNU6T
 8zgAjq7HS3lwy70SilPNTgXtbtFb/g0QQ3CWw0wjAWNdSVwWw05wn4fSVjMrCMyN+SZ/
 /WUfUezYDuuF7PU0JAQylw8BVe3pxpyp/5CEh9LrIjr7sHcFRJTrpqgKZsPsaeHdQa4h
 dxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVQ54/b1Bl5zWRXm8QvTFiSCRNNAIcNHd+D1lpI9ZC4=;
 b=U7CuBioFvQtD+zmFchdx9oLnv09SDY1rjzaf6AxZ/osk10YWLpE3qFcCozidMnZ255
 K+ZM9poGw1ft2K3Hrlyn9ayBvanfgtlpx6o8pzqrswMulfmhxLH2mDcz6rK1qanA841K
 gQiQEmASXbiherczNx5aTTJPrOewm+6HYQFsLMOEqZMSQYjNTA6AJC9CC5HVWyxWbm5z
 z+BMo1wQDXdfRxvE9TPSQyIoZ5zsBgy9AS2yG28YmR6rezBP4a/B4o0NItl2kQ4z8rgD
 FHyZ243J/BEMSAsEXOuXGZnxUogOIGAosUj2FGcuDfNih9NcizNPci2cYFSi+h9CLWnJ
 N84A==
X-Gm-Message-State: AOAM532CIzmpT/rHVPft/OqCo5S2Vj9rP3oVv1i3Ld6YVIequFshlkMz
 /8TwPE7bjhWmEHdSzSnMBU/dAQ==
X-Google-Smtp-Source: ABdhPJztaBE9q35bXW9bdbc3Uh0AoR+2BUwqLHJO3rjZrvvCaUtOnyrtI6FYp/7+up8Ee6UQVdXDxQ==
X-Received: by 2002:a2e:a60a:0:b0:253:dbf2:cf with SMTP id
 v10-20020a2ea60a000000b00253dbf200cfmr18285606ljp.498.1653565966201; 
 Thu, 26 May 2022 04:52:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a199104000000b0047255d211c8sm308410lfd.247.2022.05.26.04.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 04:52:45 -0700 (PDT)
Message-ID: <fbbb223b-c0cd-6cd9-ca1f-1c1ebaa5f6ce@linaro.org>
Date: Thu, 26 May 2022 14:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [GIT PULL] drm/msm: drm-msm-fixes-2022-05-19
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>
References: <b011d51d-d634-123e-bf5f-27219ee33151@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b011d51d-d634-123e-bf5f-27219ee33151@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 19:21, Abhinav Kumar wrote:
> Hi Rob
> 
> Here is the pull request for the fixes for 5.19.
> 
> Just a few more changes on top of msm-fixes-staging.
> 
> Mainly it has the foll fixes:
> 
> - Limiting WB modes to max sspp linewidth
> - Fixing the supported rotations to add 180 back for IGT
> - Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
>    in the bind() path for dpu driver
> - Fix the irq_free() without request issue which was a big-time
>    hitter in the CI-runs.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Thanks
> 
> Abhinav
> 
> 
> 
> The following changes since commit 
> 947a844bb3ebff0f4736d244d792ce129f6700d7:
> 
>    drm: msm: fix possible memory leak in mdp5_crtc_cursor_set() 
> (2022-05-18 11:05:21 -0700)
> 
> are available in the git repository at:
> 
>    https://gitlab.freedesktop.org/abhinavk/msm.git/ 
> tags/msm-next-5.19-fixes
> 
> for you to fetch changes up to 64b22a0da12adb571c01edd671ee43634ebd7e41:
> 
>    drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path 
> (2022-05-18 18:32:03 -0700)
> 
> ----------------------------------------------------------------
> 5.19 fixes for msm-next
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>        drm/msm/dpu: limit writeback modes according to max_linewidth
>        drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported rotations
>        drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path
> 
> Dmitry Baryshkov (1):
>        drm/msm: don't free the IRQ if it was not requested
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 4 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
>   drivers/gpu/drm/msm/msm_drv.c                 | 7 ++++++-
>   drivers/gpu/drm/msm/msm_kms.h                 | 1 +
>   5 files changed, 14 insertions(+), 4 deletions(-)


-- 
With best wishes
Dmitry
