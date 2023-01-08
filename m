Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD1661B10
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E5010E221;
	Sun,  8 Jan 2023 23:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C7F10E21E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:23:57 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bp15so10446971lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vb1YtbYSknpUZJ7taGZJai9/UTm81zSKRw9ScghBwuI=;
 b=fSQifwdN0bWp8uieWo5bqmziJqqydtl+a1YUYcE6IiF98/drVb2LRKbEPFU51n1u1J
 tYkcLEvoCABv5Ks5O3Pzl8LNBtIgyhJacU3hkjLilrfvc2/8MjF/19aI4Ckr0QN32xj0
 r5R47ciOEfo58JQuZmMH37lCzx7Z2/R8EWxSxPcJ5vG4qHFNcIttBnG9bEy+3FUllTKG
 7uryRLP3TTU6SZSQtE9r2bfEx8WHjus6OPo5obxciRqG+T+VG1Ze63Zh0kQ0sgleEX5N
 yChw4EwqOEnkcXQeQFUcHkZgYoYsGBDdHqG7J3Kgi+ZoAOZwdBMT5+DoSN7WvnzOZmxb
 /tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vb1YtbYSknpUZJ7taGZJai9/UTm81zSKRw9ScghBwuI=;
 b=ZfMeOSKUdl1hKOAUJ3Z8J7/+HxigpQ80lKoSAUkjKmF1aLn7sgnVp10hkuktX7zDSx
 NcQD3jYhhD5FwPtplvcGcqX2g7RE4agx+cfo+QI8tG1KUGgO9n1VHHLWVrb95QI4Rr5N
 oEc+v6kKmTAf6dQg5cooOTAQ8RPmdbbVz7cnOzQlSyb/U6PXGydB2aDikgIOGqbMgrcy
 z4nK7iVFDh21wRa9gvvX7ndo1VaRlkLyDmZF2VcjRUMUHWY10BTb+7KCsy7Y0kHCLSXj
 kpywIDVxhGQRXeU5/q3vjZscaPaIF5GyoTGjDm1/ce2lWqFnFBbHBAueah3znAdYxvh9
 o3vg==
X-Gm-Message-State: AFqh2koUiZgI+3yVcKlF0KQaDWCU7fCB/4zsg1iVAPqTzj4Rs06UNHb4
 iBoFNAYzmsb3hFdODnRJw/e4WA==
X-Google-Smtp-Source: AMrXdXv/HATGy+NUozlcwwF4SbLVOvtl1Sm77XfQlFbdyZrpwOZ3MaNXumdn5iaXjBcdh/HQwjKKtA==
X-Received: by 2002:ac2:5307:0:b0:4a4:68b8:9c4e with SMTP id
 c7-20020ac25307000000b004a468b89c4emr15251767lfh.54.1673220236191; 
 Sun, 08 Jan 2023 15:23:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac252ac000000b004aab0ca795csm1280794lfm.211.2023.01.08.15.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:23:55 -0800 (PST)
Message-ID: <169840b1-0c9f-fa14-a904-68679671bdf7@linaro.org>
Date: Mon, 9 Jan 2023 01:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: Wire up DSC mask for active CTL
 configuration
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-2-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-2-marijn.suijten@somainline.org>
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

On 22/12/2022 01:19, Marijn Suijten wrote:
> Active CTLs have to configure what DSC block(s) have to be enabled, and
> what DSC block(s) have to be flushed; this value was initialized to zero
> resulting in the necessary register writes to never happen (or would
> write zero otherwise).  This seems to have gotten lost in the DSC v4->v5
> series while refactoring how the combination with merge_3d was handled.
> 
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

