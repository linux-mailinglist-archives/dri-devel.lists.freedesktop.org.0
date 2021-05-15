Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9DE381BAE
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 01:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2546E0E5;
	Sat, 15 May 2021 23:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2DF6E454
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 23:04:50 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v6so2781885ljj.5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
 b=ZAmyTQq+43IOcBhnWLVn47XdIoRwtk0gVIMI4rFsN3bPiDWhZi0EVmlO7HSPttROXs
 joJR8PNw5g5dkNHzx2vN4FneuEVxYh7/iFDB1j3VopR9p24h8Jy1blZvywqoYSl9NHwU
 gWL3deAvHtyMYomPNwfz0xLqIH40y4fNN5p7A05xbwpIuwkCRuJKtFpq7pGP503PGrlI
 ECG2Nzv2DNjX3F5P7om8WxfpqA6P5wwlb2AOWbkFeN2S9k1J1y2GO9MtvY1d16YROogM
 5iqsSS8NXp2ZwJllBvWrOJ4seW9iV7k6J+wos+KWRkP/qbBNsYZEnLsum6Pm3/VNDood
 Gxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
 b=DeQnJudj9ctHC6TU19iH91vn39czF1ry9X5H1gmASOaPSx9vKo38E6zBc0kJK3OH60
 4e9gxEMzPJzbt6+fI3gDl8ThckMmPQvy8HsBXwq8+eHiniSC7gxAqPQqBtFlG5m5RSgl
 /FrZct1h8WMQkbti2544OCgqImctlh9H57BtkFo11u9r1cSNtwESvonbPlDL/9BsHKQk
 219cJqRn/NRMNnQC3TKRD7izqmFSZklgmnvi7yM8liGSP/tjEs8gEp6bErZ5ONPG470/
 KyoFgLlfXWXTHjEQRL8XhKIRr80iHQFgbvvXPBHX0X4rgSKLNLQ5qrOij0a3kWHoy/u4
 q4Ww==
X-Gm-Message-State: AOAM5325o1s9ts+U20gvfP83P8PwyQ+ZdGeSvjm14jJ0uZuOzUkZnKQ7
 jp+PTBi1HkqcQDX5NPShDPQyBA==
X-Google-Smtp-Source: ABdhPJy1quJvaV/nck7SUQ5ex6Rk/kzi1csbr7LsYS9BiSb09QbHjGoll6VpORSW9HvLGlmtZIisWg==
X-Received: by 2002:a2e:8708:: with SMTP id m8mr8691010lji.383.1621119888679; 
 Sat, 15 May 2021 16:04:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q19sm1472998lfu.105.2021.05.15.16.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 16:04:48 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] Qualcomm DRM DPU fixes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ca8dbaa3-a510-d75c-e1cc-c4b964c90e5b@linaro.org>
Date: Sun, 16 May 2021 02:04:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On 12/01/2021 22:26, AngeloGioacchino Del Regno wrote:
> This patch series brings some fixes to the Qualcomm DPU driver, aim is
> to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
> finally get command-mode displays working on this driver.
> 
> The series was tested against MSM8998 (the commit that introduces it to
> the hw-catalog is not included in this series, as it needs to be cleaned
> up a little more) and specifically on:

Any updates on submitting hw catalog patches? If they are not yet fully 
ready, could you please send an RFC or DRAFT patch for the reference?

> - Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
> - F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode
> 
> ... And it obviously worked just perfect!
> 
> Changes in v2:
> - Dropped patches "drm/msm/dpu: Add a function to retrieve the current CTL status"
>    and "drm/msm/dpu: Fix timeout issues on command mode panels" as the
>    second patch was wrong.
> - Fixed patch apply issues on latest linux-next and 5.11-rcX
> 
> AngeloGioacchino Del Regno (7):
>    drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
>    drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
>    drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
>    drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
>    drm/msm/dpu: Disable autorefresh in command mode
>    drm/msm/dpu: Correctly configure vsync tearcheck for command mode
>    drm/msm/dpu: Remove unused call in wait_for_commit_done
> 
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 90 +++++++++++++++----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 49 +++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
>   5 files changed, 147 insertions(+), 41 deletions(-)
> 


-- 
With best wishes
Dmitry
