Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8C6DFE98
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051DA10E92F;
	Wed, 12 Apr 2023 19:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F42010E92F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:17:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id n22so11316306ljq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681327048; x=1683919048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dRODDXy/BT0Gjum0+OFeyBhxWrO5XinOtxuRQcw/8ZE=;
 b=HZRbePvjp6po9F/X9fmsFkPogyhg5PUjdwGig9JFLn1SWeB2i1t/Bl7EQN6b5MPdpM
 Lnm44sEK+8HGuU8IcrzO9z9pzrMv267MBfjKQOJEQMgRkdBz3Vo5QstxxDYCKb9TUBar
 Mz3hQpxwV3MBIkXEs4m2nXFkyNN94xaaW9PCaWH8bRtqJSJ9SgQVSet9Mt8a3ZBlOor3
 CBXtCYTJCAokywY589e95UOEfFNlP5y1ysQ4Tg1PK3uEeCfAAFWd/XU7lP0s8GhH91bQ
 Pw4egQAZ2oiHRjcXzwe1OgqA/iym3hra1iUWKhUNjIfE+c1oLQUlmfR6SXX+PJ7VJhzQ
 dUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681327048; x=1683919048;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRODDXy/BT0Gjum0+OFeyBhxWrO5XinOtxuRQcw/8ZE=;
 b=HHQ8AU6QNc0JyF02Y4Q2uqf5OCFdKxR766BXkrm4I/hBCG3NhLobEof7K/Q1iCS845
 Lg8t47e2+/vsDkigcFFUyoOwylPTGAhCrjZPPQBcFXaXify3K4/6jonWRvb/u45fsCCK
 VWjGC/2o7ImB6CGHv8YYml2wVanPT0I/E8Pq+YgO0Z8pGObmsYZykm6EyD998nG7PqZq
 ChqWvAltfsg9Srji+tPluQKItUDyjVHLpUgybHV7EyrTlhPP4Xh4HU6LZVvFywLI3mhq
 +Dos1wgEw5J0hqj4kqWBkR5Lf37c895yB11Cupy8LO0kzJjab1n1wl88ggmJhRg6x1Fv
 A5OA==
X-Gm-Message-State: AAQBX9c5EpNPkdv5g5omXuGTRV7hdWPGqaZmuf8MC2GxW4aKd1ZJ2urO
 lG5KiHBDzpMu9jN7AOCua6mO2A==
X-Google-Smtp-Source: AKy350Z/uC6ywvX8543O0rMPaEZsM9dpm6pLBnycnKxum4DMfimLO2bGQEIj6Aj1skYL2+ZEmrergQ==
X-Received: by 2002:a2e:95d2:0:b0:298:acea:d261 with SMTP id
 y18-20020a2e95d2000000b00298acead261mr1088226ljh.21.1681327048099; 
 Wed, 12 Apr 2023 12:17:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a2e84c1000000b002a421ac8629sm3391473ljh.49.2023.04.12.12.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:17:27 -0700 (PDT)
Message-ID: <2c3c696e-fcf8-37c4-f112-0ba4071d307f@linaro.org>
Date: Wed, 12 Apr 2023 22:17:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 5/8] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-5-0108401d7886@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-5-0108401d7886@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 22:09, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Changes in v2:
> - *_calculate_initial_scale_value --> *_set_initial_scale_value
> - Split pkt_per_line and eol_byte_num changes to a separate patch
> - Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
>    block of dsi_update_dsc_timing()
> 
> Changes in v3:
> - Split pclk_per_intf calculation into a separate patch
> - Added slice_width check to dsi_timing_setup
> - Used MSM DSC helper to calculate total_bytes_per_intf
> 
> Changes in v5:
> - Split slice_width check into a separate patch
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

