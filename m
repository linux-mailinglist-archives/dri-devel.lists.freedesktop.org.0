Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87657D892A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C6610E888;
	Thu, 26 Oct 2023 19:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9410E881
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:48:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5629fdbf8so18352761fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698349730; x=1698954530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2r/etm+lGb/c7igmaEGkdQXKHCNWHHVJlTP4t8HTdMk=;
 b=i/IRlBsuZDbufpQBeDulo6rtXUyzE7/osZ7Oifcl/EFSxQqb4PWBm6BrKjalZ0gWAG
 eadp9WN4MFNXFHKBcBDaPvGYP6tF1xPcx3yIoH4MyI2wc/rk135rjJU4K/uCX6uSQa3R
 kvg2vCbDr10GIYAGTEwuWMk7wKRcaBAfwgwYLmXbaCxaoUklUWWQNN5087nAL+O7qNaY
 ccYs9YpxOnRHYJSvRVkf9a7ayUUOEgUlFxlzC9m3g7lHY433ELtvrpV2Sa+aKYbqBzRt
 AIWwYajWO6RxjGhNMcfZRQETvEloZECP9e8z4e6mcqkszXLwR+5ho3t2hYc6+Q/4tbiX
 le6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698349730; x=1698954530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2r/etm+lGb/c7igmaEGkdQXKHCNWHHVJlTP4t8HTdMk=;
 b=ioLumRxYKd1rtLU8rrxTijL9SqeYiUkuLhFgF+qW/Yzt0HyK9jtWXS193g4TLKL1O8
 crmc2RnKyri5rMZTfO5VbFuq4hq0azGFZQCFRr7I1UJVMrEa9Ty2hl+284I1yvL56+xW
 AjyIHLaw/4WqxHcICYzInaiuiUXmj2nL9+XxVixSnZjbN7QllUMSvFqPYP49qaYvxMEc
 sjTXSL/gd4ZrC9jlyVpctwyjyStgeaSo3JYd3wEiqVQkdsalexDu/hXc+mzDXxdHl3vK
 72njnHdyq/bWNwIRP8YvaYVtqppj8hHCYphbx4IGNqC/j2BgJ9sH0TP90cDvgAWI/8yu
 vZvw==
X-Gm-Message-State: AOJu0Ywkc9hxFpnT2UkLQ4oiKUL0gfd4P1oogmypjrrmZ4AtSkwFtTi7
 M4pMd2UQHDp7itSfS6orkOcw2Q==
X-Google-Smtp-Source: AGHT+IFtutowcYecVvg+FvFfwTHyeYjPCWID/Y90bjxIQgePYnYiIzszx0treswzBdc4bCEGpm8KBA==
X-Received: by 2002:a05:651c:333:b0:2bd:d34:e1ef with SMTP id
 b19-20020a05651c033300b002bd0d34e1efmr446256ljp.3.1698349730076; 
 Thu, 26 Oct 2023 12:48:50 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 g17-20020a2ea4b1000000b002bcdbfe36a1sm3014040ljm.84.2023.10.26.12.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:48:49 -0700 (PDT)
Message-ID: <2eef6684-d0fd-4302-8444-cc5e5e4fa75c@linaro.org>
Date: Thu, 26 Oct 2023 21:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] drm/msm/hdmi: simplify extp clock handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-10-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-10-dmitry.baryshkov@linaro.org>
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
> With the extp being the only "power" clock left, remove the surrounding
> loops and handle the extp clock directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
