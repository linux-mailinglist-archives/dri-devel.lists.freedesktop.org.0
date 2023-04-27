Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490616F0B53
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3541110E273;
	Thu, 27 Apr 2023 17:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D240510E273
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 17:46:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f109b1808so1682340266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682617568; x=1685209568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fTm8P/0NrUTJ/aXUbCQxsw1Cnuqf9wQlrWWke2Jv9BI=;
 b=DYsgP+b5OinukyTDU9scrGzHZYJRDEUrvszbbzyzCOTvqaqCOTGckH+CD5OOYKaNPE
 lQRRm3AC2RyAoS2NJZ11NMcPCxB0UfUurZReZje/4WareAQmTYepj7dN0tYkTxBGXvbq
 nCUWp+kRktI4xAVfNfBA1kCzCyizP1OYChqnEADzFL+itNoTZQxQxcseeevU6t1FvGZ1
 p27eY19T6e9cUo56sSJ7eTTnIFA/dThkWqFZ9YZkCfditn5sqBbp0mI/5qoycfoSLAqA
 y4IeC3XDwJUas3wYsOqA05hB8xCshQ5ENeyi0excJJ624vLFhKNBrlxJuWKyrsLrzpnW
 ldzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682617568; x=1685209568;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTm8P/0NrUTJ/aXUbCQxsw1Cnuqf9wQlrWWke2Jv9BI=;
 b=F0UWkaFhvQbtFeid0HMXEIcMNeWxXEg5d7E5IbbxhV1LhClbGKSVhyf5Zg7RXQxfZ5
 UCOdfb0reOETpeyDRun+5dLwb4PnfxIsMJwkOdtRUPCGTXMGYLoiBjKMNBCrILUsgIuN
 Gk2muVw7r7nbAbwHUIYoK4yd2B8QwIdpiyotF7QhjhCzhzqu2R1suFNGzlkV4vcvsR0N
 M2xOvr3DzeDQnTkmWDc/i2trEPWp+SisSAM0/NNnTuBzdHVl3JIV/X5LNQAuLXjnRUf1
 wemN/uTAFWsL25TtpJQo1aMUUTIpwcqBK2gPoOx8GAP5cYz8p5k+NH7TW2mGEy0jdXDx
 Uu4Q==
X-Gm-Message-State: AC+VfDye1DcgV2Z4JiTJpYyH3vft7Na6/nh4v6PFm8mx91KgQiPZrTUz
 K9S6iTzQvnyUd5EhBWjIrXXFLw==
X-Google-Smtp-Source: ACHHUZ6zNY1svjGXLpvCmJGQawfhTQZeKLDxcFukUsp4jHoUGvVvkSRJFYurhL+Q/r7uRnv9YWU88A==
X-Received: by 2002:a17:907:629b:b0:95e:e0fa:f724 with SMTP id
 nd27-20020a170907629b00b0095ee0faf724mr2990008ejc.39.1682617568210; 
 Thu, 27 Apr 2023 10:46:08 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a170906ce2e00b0094f5d1bbb21sm9907802ejb.102.2023.04.27.10.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 10:46:07 -0700 (PDT)
Message-ID: <c12fd2d1-4ea7-44aa-8526-3c766c8e9fa4@linaro.org>
Date: Thu, 27 Apr 2023 20:46:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 18/22] drm/msm/dpu: Describe TEAR interrupt registers
 for DSI interfaces
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-18-27ce1a5ab5c6@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v4-18-27ce1a5ab5c6@somainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 01:37, Marijn Suijten wrote:
> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
> the PINGPONG block and into the INTF block.  Wire up the IRQ register
> masks in the interrupt table for enabling, reading and clearing them.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 28 +++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  4 ++++
>   2 files changed, 32 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

