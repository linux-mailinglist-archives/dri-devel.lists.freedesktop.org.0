Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9C5F8DAA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 21:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216DB10E53C;
	Sun,  9 Oct 2022 19:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428310E53C
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 19:14:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id j23so11018827lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
 b=D3znIKzXKwQaxB7Ox3lpizhW7NS6r19zfvTiJftlw02OF9QCPjt9kbEIllwQSDwAZm
 bbQd6AGAx4o2TTHo7hE884uCEcGqpp6G4Ny7jvmIBpXYmT2rwz0rUyxYHHYb6xXZLDHc
 E/DV8n9stU9dLyYaAgvDlJFsbnUibYlnZ3lQiZYIXY6gD7JTWs4L3E2890nEcjUZGl/p
 uegdz2Z11CjMAJ7dwVkfNE9BlNRrCClWYLW6o+2UaccXyf4zJIrbSLQt8/GNaAY2oQap
 k8xV2eGWsUXni6SEBMXVz/OEX8Xxc0HYD+ZcLhdkj1uBQdTp3VrXeNoO6jBsfp9PWNDD
 kUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
 b=YVqvlFTPVvA8QvfLqq2+jQF6XXRjVefBSs0zylRFtXRPOuauE86Tj+Mi+KobiAdWL8
 6vWsiBQupmGChK814qi/r1Ur+bs4Q+MEJo/uqzf0E/ZVniSV32/HnN1scOV5qDxxfYpZ
 s6X+hl1YGlyZPDUbKRRvKuxpLvhwZ8tKd9w/hTf7Zmv/ZRqtIQ9q8fyvURXeh12AvhjT
 ftK2AtZ5ZdxjeKmTCv5e6t3gKkNr1LpuA9Yc1UE7PO8KUOtTRwit4+YVOG1aY1uLb2fN
 V5rSmuA6iBJxg5bTwyWVemxa/R/ggkjfuTexQKvnn6hpgay2TekJ38ZN4z6/AiHlghDj
 ZqhQ==
X-Gm-Message-State: ACrzQf18bwF1PoFUh8eNC8pMTh5z7SUuuwFWtjq1ps4umFdOl459wTxF
 3Wh54mHrsaxxF0nbfcpNRueciA==
X-Google-Smtp-Source: AMsMyM4a9wjRAHNMLggg3ZrR/45pdnYmZIpeoXCdgpM946/5KOUGeLQrsUAwlMweZbXSn4hMmZKK0g==
X-Received: by 2002:a2e:a54b:0:b0:26c:72ed:b758 with SMTP id
 e11-20020a2ea54b000000b0026c72edb758mr5535281ljn.245.1665342857092; 
 Sun, 09 Oct 2022 12:14:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056512368e00b004946c3cf53fsm1117170lfs.59.2022.10.09.12.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 12:14:16 -0700 (PDT)
Message-ID: <408bf6a2-47fe-3eaf-7235-578d33a576c9@linaro.org>
Date: Sun, 9 Oct 2022 22:14:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 10/10] drm/msm/dsi: Prevent signed BPG offsets from
 bleeding into adjacent bits
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185316.462522-3-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:53, Marijn Suijten wrote:
> The bpg_offset array contains negative BPG offsets which fill the full 8
> bits of a char thanks to two's complement: this however results in those
> bits bleeding into the next field when the value is packed into DSC PPS
> by the drm_dsc_helper function, which only expects range_bpg_offset to
> contain 6-bit wide values.  As a consequence random slices appear
> corrupted on-screen (tested on a Sony Tama Akatsuki device with sdm845).
> 
> Use AND operators to limit these two's complement values to 6 bits,
> similar to the AMD and i915 drivers.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Side note: the DSC params tables are more or less common between amd, 
i916 and msm drivers. It might be worth moving them to the DSC helpers 
from the individual drivers. This would mean such masks handling can go 
into the helper too.

-- 
With best wishes
Dmitry

