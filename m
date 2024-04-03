Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC16896BB6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E111298C;
	Wed,  3 Apr 2024 10:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WF0tvUzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C6C11298C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:10:16 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so5205864276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712139015; x=1712743815; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rx+/ODJmMo86rpamIh1rOudX2tVZC9qd0xdyuh7u+G8=;
 b=WF0tvUzCnZiqOk8+HWMNmhIXSjwwGisCg2gIvb5+VHz2ofjDLY0cOWgUNnkHgrBrGY
 6feJ1tA+nuWu6UOI/Ph3AglFf9RcEUvUSkR4IxbrLAnV/20LKHG1DjZBUCzZxQUdGxYR
 ikhPc/3wygiOGPRcx2XeYzwDwAlgEMnOSE8GfkfvM8d5aORSzoj4KxBIuHEdf/J7fBy8
 iGXhEcVjwk9m/AX8G/O9bETnlS5ckcOL26PbOBAm1beYHzwlOUGU56hG36inOQDbjMv4
 GK6nM7CSDYrNn7V2mr/wSEwg3pCYKoIbrXOnaZqaQma2OQU+khNRup+5B7TNSXSDud52
 tMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712139015; x=1712743815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rx+/ODJmMo86rpamIh1rOudX2tVZC9qd0xdyuh7u+G8=;
 b=YYWvShEYszPJMGvno2n5bvFxLq8GB/zK9v9+4tsQCLLtamuF81kRXLL12RVT8nxW7h
 tq4I1OppsIVmwfx3mugWbXbOum/hKuCBxFR0TpcFUkfEKENEqud0nF5tvdnGbu6hP+hQ
 jpiz43UV9rvk6dkeHsP3mpnvHnUQzbVMP3I0VnVKW10/0ShWd1QorpgkuQMtafTo9Yyx
 NPd2lmsyKi0qW+xGpqMnRB9mb2h6PmjMsrnjoamoS048LkuWhYXF8F1CCfP1ACTi+jVJ
 V7eQ4QdHNik4JwV2yCIqO4F/WFu4aGWEhTWFx7IwbX3v/aS2I0F0GnW/VYZPJT9wTCE+
 ReXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM/mTy7Iy3c0a8KhoLmnHyEoCP3eGe6rDWwotdkchU9UoMJcaFUJSysLgusmvgivh6UYoOJ+fYEExjg4Gdl2PUqfnxtrw/2zXKgdq/YYVc
X-Gm-Message-State: AOJu0Yx+owEtnv22DheTkAdDBEj54HEH38VT/yilbwri7Ha8Nh3WbzDE
 qPFB9vqIguLe1SzMSlOmuju6o4dsKNmWVzxhcldSx4W08t2TGneHjPAsWUlpGAsbP+onBPCVZ20
 KHBWiXrTE9mg6EpGBE7U1Cg+PCPAc5nyOVGqezw==
X-Google-Smtp-Source: AGHT+IGjh7gnnBb9kNyO5PIPLl2Il5vz8QX1R3iBfDYBjyvguAc/FohIsajpw5mGOtCvkRWDwc/PlH4RwAJFT54eBCo=
X-Received: by 2002:a25:ba42:0:b0:dcb:be59:25e1 with SMTP id
 z2-20020a25ba42000000b00dcbbe5925e1mr12992717ybj.30.1712139015113; Wed, 03
 Apr 2024 03:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:10:03 +0300
Message-ID: <CAA8EJpo-tZSOD+B+4znyBmFPVOjc6yocsVwYMXPN5d3WQfbr=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

You have ignored all the review comments that were provided for v1.
None of the tags were picked up either.

Have you posted this for internal review like I have explicitly asked you?

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 2a7d980e12c3..f0b3cdc020a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
>  #define DSI_VID_CFG0_HSA_POWER_STOP                            0x00010000
>  #define DSI_VID_CFG0_HBP_POWER_STOP                            0x00100000
>  #define DSI_VID_CFG0_HFP_POWER_STOP                            0x01000000
> +#define DSI_VID_CFG0_DATABUS_WIDEN                             0x02000000
>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000000

From the top of the file:

/* Autogenerated file, DO NOT EDIT manually!

>
>  #define REG_DSI_VID_CFG1                                       0x0000001c
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9d86a6aca6f2..2a0422cad6de 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>                 data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
>                 data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
>                 data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
> +               if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
> +                       data |= DSI_VID_CFG0_DATABUS_WIDEN;
>                 dsi_write(msm_host, REG_DSI_VID_CFG0, data);
>
>                 /* Do not swap RGB colors */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
