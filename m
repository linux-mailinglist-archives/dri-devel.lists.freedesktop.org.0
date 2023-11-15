Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA17EBE12
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 08:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032310E4FB;
	Wed, 15 Nov 2023 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1710E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:27:04 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-da819902678so6623016276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700033223; x=1700638023; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
 b=IOE0eA3xTC8sdtt1MsPwgTAPktXrBwsgIC3K/EFKLyXTCtlLnmozNHmzrfDqPkUKmX
 TQtYhm62h9g1dV6dEhHpHuLIlgR+G6ZwW10qe5LmR6G+sCiCgst7MvxFB6mkDI4Gd26u
 gWOAfOsJe9c98E0V5hcelBnctbuI/MD8FTvT1ZjaRUBukpy95tpYEq+z3FiysOn2A3G6
 Skm31n8qqYxUNksShA+3FM9ovTnNXJtn8VYT7pI0K4su1p2im10BFw2IKgjavEP7dIEt
 DDOEK7vojvohZEYe2MUYXR8sUltPL4zij42pkEFh882gV6IQ9T9C9cJVSIZEDwfEQUgy
 /48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700033223; x=1700638023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
 b=fgtfHY0jUt/SPNmjDBdsYpcOOPse3EN7Upvc2VmBtXNNc5CQcPUY+/53jSzUtySTAU
 r6oEIKCBy+hHMRSYAVznCUA0weLaFpFUATgQ4rjXwQAR7SSAvGAxovmW0aXsjg++ZpS7
 TRl0bD/ItJeqAFUnL97yiGBFzuwvUEvDZOIfTRBEkVi07wln18+0egLmfG6W3/KQJQ7l
 FANxR+Dcr0bkc1szoQ07HNjufoMXoy2+2g9TaSxuKDD6BCsH8dyW1/vp8L/HOdJZDn8e
 UfF1FP5qYtjiRU0C+UrBIPDoLkhuqxZl8FniWm6TfM1X6ZupNV9KsIRYR0ZO/NMXUk0Q
 H4YQ==
X-Gm-Message-State: AOJu0Ywo5vhkaLmwwbfyGEOC8qDHzoMdJJxbG3akzkwf/op5WRX7Vpdv
 5yPWt2tfSBhwGkGV24Pa89CG7lza629boJ9ZkObZXg==
X-Google-Smtp-Source: AGHT+IFg14cjgoXzSIT4pD+JIPGzFocy5oWeTNMHBVe/p8YI7kp1xT3oW6AV6W2ZE8rVTAhJZNFOUYyiR/qUPm+7sR0=
X-Received: by 2002:a25:25d6:0:b0:da0:6876:a8eb with SMTP id
 l205-20020a2525d6000000b00da06876a8ebmr11431431ybl.46.1700033223136; Tue, 14
 Nov 2023 23:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:26:52 +0200
Message-ID: <CAA8EJpq-bdb_ue1LAXjM+TH97os4eeHyUeNy+51wh44M_J2TKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
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

BTW, could you please push this register to mesa?

>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000000
>
>  #define REG_DSI_VID_CFG1                                       0x0000001c

-- 
With best wishes
Dmitry
