Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D564CF8B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768510E449;
	Wed, 14 Dec 2022 18:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CAD10E449
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:40:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so11905712lfb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84PVzy06Jez7WrqpA7scvmaFQfIAuLwwfaDiUooPlFI=;
 b=gR3RUbdtP2h5rhjbu9ETN1ccQZp6hk7IaSQibahbKZZXwXTSnp2ECnJDrlylJ+3Pss
 3v4rTXnsLW1NgvfHGi1LkaSvMo65xG1F1zka65Yiszsmd2AePNGZH1GkKM1OgvbKJ/1t
 oGmX0Fy5dluJbI+LK9yOhT2hO6h36iaiuPHxXifUHvV71nucTO83hZChn6a71Z6sgeVz
 SW5u/8R2anqRl+qwBkF44JOBU9ewze/ElC2l5Vu8BXLv7wXLhOqpU0USfBkxVO1O67RZ
 cKyMrT7oGQ6jCy0oUw+B2UuuoJ753yzWd/JI9P7frzi9p9xwfUY0x7zNAeyulvEFyeDu
 Ewzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84PVzy06Jez7WrqpA7scvmaFQfIAuLwwfaDiUooPlFI=;
 b=Agcmfv0+4Og2Colv/V0fYxPTNDlpNd3kj31/J36ugPPvglFTPrSWTid1ddT12aWHBM
 N7kKfcS60+9OkNxB8d20FyTcVMhW8/vO0E3b8xWFZbkbvXLsWss+mMkIBnLwLWwOr06H
 dKQibNKhbQmNvGIwaSSTPKefj/7IEcDgVoYBEGZss3QK1V2+2IOiDvmgIkdS3hwkt21o
 gxHMuNKYDvym9khy4nW1NZ4s3fyFjH8sdXuven0X7Zr6NwOqniLUDpYYSfQpzaLtRUMi
 6TtLOWZU7ecT2tyVL1NMP+WHQKVVxMsksb/b7MYaB257qTRFTTxyQ+aKm4StRvDGv5gr
 K5NQ==
X-Gm-Message-State: ANoB5pmgdpTdsnNmqTCnH8zIGRflQ6a5cKr1Lh8MnvXFjyDhuVKSWkyn
 wCLllw9uhMAQZyvV4DZ3LcDkyg==
X-Google-Smtp-Source: AA0mqf5huwxvJLpqWw8CtVjdxW1TVZkauT4Q4In5DVwTzyMs2NKw3KRNjJwviMs2hFfphsK4vzn7Pw==
X-Received: by 2002:ac2:4f0e:0:b0:4a4:68b9:19e1 with SMTP id
 k14-20020ac24f0e000000b004a468b919e1mr7586088lfr.9.1671043207234; 
 Wed, 14 Dec 2022 10:40:07 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a19f817000000b0049465afdd38sm901628lff.108.2022.12.14.10.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:40:06 -0800 (PST)
Message-ID: <154b2e08-25a0-c8b7-1dc8-2d41b8787f05@linaro.org>
Date: Wed, 14 Dec 2022 20:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 0/6] drm/msm: DSC Electric Boogaloo for sm8[12]50
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-1-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 01:22, Marijn Suijten wrote:
> This preliminary Display Stream Compression support package for
> (initially tested on) sm8[12]50 is based on comparing DSC behaviour
> between downstream and mainline.  Some new callbacks are added (for
> binding blocks on active CTLs), logic bugs are corrected, zeroed struct
> members are now assigned proper values, and RM allocation and hw block
> retrieval now hand out (or not) DSC blocks without causing null-pointer
> dereferences.
> 
> Unfortunately it is not yet enough to get rid of completely corrupted
> display output on the boards I tested here:
> - Sony Xperia 1 (sm8150), 1644x3840 or 1096x2560 pixels;
> - Sony Xperia 5II (sm8250), 1080x2520, at 60 or 120Hz;
> - (can include more Xperia boards if desired)
> 
> Both devices use the DUALPIPE_DSCMERGE topology downstream: dual LM, PP
> and DSC, but only a single INTF/encoder/DSI-link.
> 
> Hopefully this spawns some community/upstream interest to help rootcause
> our corruption issues (after we open a drm/msm report on GitLab for more
> appropriate tracking).
> 
> The Sony Xperia XZ3 (sdm845) was fully tested and validated with this
> series to not cause any regressions (an one of the math fixes now allows
> us to change slice_count in the panel driver, which would corrupt
> previously).
> 
> Marijn Suijten (6):
>    drm/msm/dpu1: Implement DSC binding to PP block for CTL V1
>    drm/msm/dpu1: Add DSC config for sm8150 and sm8250
>    drm/msm/dpu1: Wire up DSC mask for active CTL configuration
>    drm/msm/dsi: Use DSC slice(s) packet size to compute word count
>    drm/msm/dsi: Flip greater-than check for slice_count and
>      slice_per_intf
>    drm/msm/dpu: Disallow unallocated (DSC) resources to be returned

General comment: patches with Fixes ideally should come first. Usually 
they are picked into -fixes and/or stable kernels. If the Fixes patches 
are in the middle of the series, one can not be sure that they do not 
have dependencies on previous patches. If there is one, it should 
probably be stated clearly to ease work on backporting them.

> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  1 +
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  1 +
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 ++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 +++++++++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 10 +++++++
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |  6 ++---
>   10 files changed, 77 insertions(+), 9 deletions(-)
> 
> --
> 2.38.1
> 

-- 
With best wishes
Dmitry

