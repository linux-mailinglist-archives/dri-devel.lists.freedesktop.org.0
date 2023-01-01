Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4C65A8CE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 05:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817D910E05A;
	Sun,  1 Jan 2023 04:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259710E075
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 04:18:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y25so37269097lfa.9
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 20:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=69gDuhyvyskPxkoiJfXY3XwAwa6ovH+bzxQjyk8p6KY=;
 b=l75jACFlTzZ9CieQRawrOxUg5PWkxRFz+86CrBn677QHCKCfG2gPbyJASTfn/6+uBm
 BM6oD3FiM0qTj8qhD5xcn6xRGIvWhmCt5PGXYOpQUEiWbNKDUgTnZOca63a9Q/xqQf0E
 PNyLL15uP4oXeFivahExuqn4zvti81uw7NUuUfILsnzXclFaIi6aijc0oBElIYhzih5/
 KXqmS5ZFpxkKDOAsK/n4QERCbvUalyKmWjagkcbRmJb4hyaRQUJktAFBwrYAzy5V285R
 Wdp3OCprWRMEOYj8OgHJ9cz/tX/eglUbOmoN8/oGWtmttI4p1GoF1mBKdRPGnqf574Cx
 Uy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69gDuhyvyskPxkoiJfXY3XwAwa6ovH+bzxQjyk8p6KY=;
 b=HCEwyWwYlWAK9e7IjkqhSLDeFa5SsEQrHFKhHvM2hvNgmpK/pIbBRBsHse4WQzkuxS
 cZ7oAOFZa+RIGLbFCVSqFdVbYgLcQ0MeFGDBnyrdxp0xuBisg0IdM7y7NC6zMqalcxeh
 W9VRCNIo0nOTXnsbTZ//h1EGkjSD++llrSFzJlsIL2uDoHMmoVIHyBdfbxUj02xNHhte
 OFBeV/Rx00C+UygLEBDjGwvq37dZCCNRPAh83Hx2QhugLWvwJEvVbQGmXzlEUPyliTJB
 4wgRr/UfQ4/OVBM3gxFrMNxa3YpCRwXPg2vX+xz6zzM+anrOMxkDODChkH5YrVB2Ud6v
 jmYg==
X-Gm-Message-State: AFqh2kp2qNInmPMPilY/pRmf675T44V1dPK0O1lgQiJcua1un/jAR3HV
 7t15h/+RoVlx+W1PLqES08SlHw==
X-Google-Smtp-Source: AMrXdXuE4021vfsazj1mMsaa3Yx8JAAGxKmqnSmp/m8F5gbAZyIiSwE+7HkewlYDM12pbtMgJpxSuQ==
X-Received: by 2002:a05:6512:2385:b0:4b5:90be:33c8 with SMTP id
 c5-20020a056512238500b004b590be33c8mr11384536lfv.48.1672546722649; 
 Sat, 31 Dec 2022 20:18:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p2-20020ac246c2000000b004b5a85e369asm4047378lfo.252.2022.12.31.20.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 20:18:42 -0800 (PST)
Message-ID: <1f887a99-8184-44f7-204e-ff0a2dd98ec5@linaro.org>
Date: Sun, 1 Jan 2023 06:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/7] drm/msm/dpu: Remove unused INTF0 interrupt mask
 from sm6115/qcm2290
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-2-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-2-marijn.suijten@somainline.org>
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
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/12/2022 23:50, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

