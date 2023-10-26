Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF57D8A03
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E7310E8B2;
	Thu, 26 Oct 2023 21:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D847710E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 21:04:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32db8924201so858667f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354263; x=1698959063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A+WjwVDuEjfphxivxZ019Dx0u0fobKcWgfHyoUTG59Q=;
 b=yI7lgGy2mpRDLUGVtCLUHYq5rSHEGqR5S09X5YDgYqtJt06ji0/lm11f5+4eFNOSDy
 tHkTq3YTARD07WbM9T89z59dpp9DgoLwXXX129Ih7iexRLNkzC7qrHzDjFM2FswDoGZG
 CVg+MLcgtXwIpNNTE4S/B1uJjArAct3wCDL2pDuLG4OO5/ZXMODTHlErFLo+e5tDhtJj
 5eW3CnNl8+XrBK+uPU5JaCvpbtjCJDRyic3rlCLXug214pYgVa5qbEHyRs0/OMO7UUIj
 nWlILbFphAnpr3i5stxF6bwh4LMEwoJLS/88BGy3R4bOnwOl+sPgg36lkQg0yBWElxgI
 0IGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354263; x=1698959063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+WjwVDuEjfphxivxZ019Dx0u0fobKcWgfHyoUTG59Q=;
 b=FwIjA2Swphef/OQw0Ixn+XJ6U1qU4jwI8mcfdQ8Z1L+KvueGMRyR+/B1Mui1Xavpam
 3cdWCHij7arFDFvmrN8XExHiazBBJFJ/kDpNHI1p36uOqS/A1KryKwnf4Cc2LiZJ8CBN
 8bKYcXAhLYbP4AlbxP47eUEZu+t7Y2i6Z289nNTd4nJ2puOWoNey92D3pyAkdAB1sgYQ
 WI9dZbsCl6POQ0rex+SoSzSLOzZ3C8Oml783yIL7s2tulPJa6BzXPLFC9LkUUijLYxyn
 mxNaOD5DBxleW5GfMzOoMGtFPK+g0T+RNOu8WRugvLkNc/1gpLxqmjAFLX9qGvboQ6to
 iX9A==
X-Gm-Message-State: AOJu0Yx16npHohgLgcoby4Hl112YxRgY0OuGBBvCRH7SdEHj1Z3NtKwX
 1kBihwliBqyNu2+HrKQ4bkblwA==
X-Google-Smtp-Source: AGHT+IEDywECpnt7wzKwh/plP8K8CxNVzDQhhmdPRvs5IAb52+K0gslBi53+Q2RRbjXloa2XGGxWlg==
X-Received: by 2002:adf:ed83:0:b0:32d:a688:8814 with SMTP id
 c3-20020adfed83000000b0032da6888814mr679214wro.19.1698354263261; 
 Thu, 26 Oct 2023 14:04:23 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 r16-20020a5d4950000000b0032d81837433sm256158wrs.30.2023.10.26.14.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:04:22 -0700 (PDT)
Message-ID: <90c8b0c3-7f42-4d35-9cf2-d5274184d8b6@linaro.org>
Date: Thu, 26 Oct 2023 23:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
 <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
 <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/26/23 23:03, Dmitry Baryshkov wrote:
> On Fri, 27 Oct 2023 at 00:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 9/28/23 13:16, Dmitry Baryshkov wrote:
>>> Drop source files used by old HDMI PHY and HDMI PLL drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
>>>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
>>>    drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
>>>    6 files changed, 1675 deletions(-)
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
>>>    delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
>> Uh-oh, is the 8996 HDMI phy accounted for somwhere else?
> 
> Yes, it is the QMP PHY now.
Right, I realized that as soon as I've seen that you replied :D

Konrad
