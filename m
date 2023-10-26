Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF07D89EF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 23:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12DD10E8A5;
	Thu, 26 Oct 2023 21:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818CF10E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 21:00:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32dcd3e5f3fso915393f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 14:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354047; x=1698958847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
 b=Fm9p4+ENldoCBdmPrjCo1lBT1T11Pp94PedyoyFp/53nS4AaZSkm/ZRn2ldj5paBGc
 lPPD95O2QijqTe9xHKrvkrMNDx9B9h8zDKvaATti9x8jqYE33fPcegNRV933qxsgrnFz
 dFjtPLA8OX0Ck0Pz1Ck/3ySk7JX6Ti//h4dRx40WrDrYcPB/8JosW3bgcWbhYcpBKJ1Q
 9ou6fv+Rm0pf3w1YV8YuKr0giLjDC+gZSdcVAlbOxCvtVzQUuEsOR+o/YHduRZjDiid/
 1THJmJ15umc4h/OBxMci3kUBVpfw7RVKIv1ZgmRw0hlMKpJgI+UyPaLLY9EkLk7vyg9c
 TjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354047; x=1698958847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z0mjma84WMq9b/LapGl0vTYYJiWs1xZ6cRV2SXhERRk=;
 b=r9m7YOmdb2yrhK42HczJ/bjGnS1ajhHGFv1tc6nlJyPsTjLJmH34VpP614hmgYIYKh
 FmcIsaGpI7TydSPA4rtyvJ84dSNF5/RGjeu8YencZVv3/xeueeiywVzIZ+PW/Y65FWDE
 zQtxGCQj0o4qVcTGNhNtHd5F2BXiBL+40uwb+56k7ZfwrQ+ZEpQYcnH2VDKY9RlJ7sbF
 8HggGu0R0vpz7cG04GwkybRqxtHTnWkj9ha4csZjEM90r22m9KMrpa8dVN0jRkV9Bn85
 Zu4kV1vhgNt+iFsheEp7QzSgvtz8xTZ3S1EojYxfYErJtnR79/5cXj9DO+HN/Mgcsdu3
 2gXg==
X-Gm-Message-State: AOJu0YxqTqVBbJq5UFPjI2m4Du+jLeni9Q6j+3CzS/JODMr7DVpd+W0a
 7tq5VfBhhPTl3mQY5kHFu54TAA==
X-Google-Smtp-Source: AGHT+IEfhhLYylIduYkXq6MRvxYQEjqp5ZqhMAToFXaZMFHGlqgOi/vTtnPKL+amQAp6vTiD/WTufA==
X-Received: by 2002:adf:fc49:0:b0:32d:be57:795f with SMTP id
 e9-20020adffc49000000b0032dbe57795fmr545587wrs.6.1698354046861; 
 Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.14.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:00:46 -0700 (PDT)
Message-ID: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
Date: Thu, 26 Oct 2023 23:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-16-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Drop source files used by old HDMI PHY and HDMI PLL drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
>   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
>   6 files changed, 1675 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
>   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Konrad
