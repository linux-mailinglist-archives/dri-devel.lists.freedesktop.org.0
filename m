Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7882989E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C570D10E5AF;
	Wed, 10 Jan 2024 11:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CE110E5AF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:18:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd46e7ae8fso42743191fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885482; x=1705490282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NcNCnaauzUsUbaXyAc5ChLkL0thXS3/4//R1zfX9xcQ=;
 b=ZgAsVtX6u1l8MzwpvIpHBnkqy/4UQga/6+MbLYankhWq6JqMNrE2iseKf6Pqmthyp+
 fxstEk0DGJqTai2fo54IbSdAopkYtVpcRsnfiqzXWThtk6/jrc0jTfo1z9n6c6+4Iw90
 cY6M51I2VQ/Ds4nkUQqsHjlPjC7FEdfoWBs/9Z3xPec8D9JJPa6VlNs1QVqa1AwT7d3J
 U7ojVuX4sax0PMOg7CD+nNTeYn9H3xE6YB1VvAOp6nuXtFJF13ajamQVQPF755zwf7W/
 CI48egsr/vL9W9O1Q00Iv5Q0SUuuRBVXKsgJRdqssMJlXxA762QPgk3QbfY/xpMbIq3h
 /yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885482; x=1705490282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NcNCnaauzUsUbaXyAc5ChLkL0thXS3/4//R1zfX9xcQ=;
 b=oOoNQnkI+eFlWNNaZ/yaUe1DUcsvo+4sog3RXTgnQ2ejHDAe8mdE1jwUoVBuoB9IGp
 ZKMUZ+b0BkX/bYobX8SciYNaFRjorfAuz5SCZxnG7UTEz2/o7viAQr068ox3TmuFPsl+
 hI5SZmzoY9fVs3LGyPXSLflvvciA+mmS4oRCGuuCdVy9mHeOzS7Rdy0jugYgItsjQAnZ
 YuY9HX+bFBYk9G4gEmYGQJSVcnWHoBqslgEXn1ot7Crbndz695QxviGXyaETWr0U5ed1
 q3DVp8NnQTfQhVcEqQJDT0oHUyvsQMWWqt1c9Xxev8qAS8bMXjwztfU83OyffUbdW99Y
 CAiA==
X-Gm-Message-State: AOJu0YwF2p0gcB3uMtKxj6iGDh7s100RS96ZThqZbKetLdP2ulLmr5Ye
 42MISNSkeKPGDmExnjCP07CD6Z50+NdXGN+opj9dFQjTdRqhDw==
X-Google-Smtp-Source: AGHT+IEpNDoakfFKO71dz7YDEEON9o6gE2TjcVKZAPyhCEdRacTDIhFfpwOdps3PdWwT1A3jqUaB7g==
X-Received: by 2002:a2e:a0cf:0:b0:2cd:8ef:5c5a with SMTP id
 f15-20020a2ea0cf000000b002cd08ef5c5amr227117ljm.40.1704885482174; 
 Wed, 10 Jan 2024 03:18:02 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 7-20020a2e1547000000b002cd187bb0f1sm766479ljv.49.2024.01.10.03.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:18:01 -0800 (PST)
Message-ID: <e22be6e6-4018-45ef-8be3-ac87bc3c3463@linaro.org>
Date: Wed, 10 Jan 2024 12:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] drm/msm/dp: remove PHY handling from dp_catalog.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-10-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-10-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:43, Dmitry Baryshkov wrote:
> Inline dp_catalog_aux_update_cfg() and call phy_calibrate() from dp_aux
> functions directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

That's some hard-to-digest spaghetti..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
