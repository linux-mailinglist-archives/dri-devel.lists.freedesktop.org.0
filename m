Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76B7D89EC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 22:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7810E8AE;
	Thu, 26 Oct 2023 20:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2385510E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 20:59:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so938284f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698353956; x=1698958756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
 b=FzMF9LRGTw6NYUF/CKX4/baMfzJ5sNitzTwcULLzEyDfhbfYA4qrZonx9HAV67iyJe
 fqW/l1EHV/hQC9dXHe50gJ8Ydif4A062q+IuvxgHMMjga8eczwPYKCtp/w5ZQ+Bk5ZjE
 uvU0OSenwIEY4wKC1jYenuWnXqlPdpZ6+g67r4oh1FaYgNE6/VQcoeB0GPjCzLR+SgUP
 9Z2T4nYBXlZ97yDFf/eKSDXrcWAV8+AfRdX0QQgzJWyAtxiReY7xrPf3V4aBhAAPA41M
 L9Ty1ZXovne5Hb+E1yAYLSrJewOFEmGq/R7oZHcLLyXm3ASyA+/mxUsmBzTuLw7vgw4R
 CHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698353956; x=1698958756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
 b=M58WvoObGvxOpbLD2T23Q5a3ak5ZhkL2bzCDqOAi6gnrNDiSo88YkVXiK4sh0thP0b
 01bogDuYLdsDfdxF7tdsmVhFlQvNO86kB7g4RXMUrrd4gQIdUqGDXdL7DqfXJ1/1ckwB
 IAITIUyUfwlVbYsGhgI54+iMrv3Xy35EiXqvRgd/OlLAf4p+Avk8N+gRnvwbXmNKYwle
 2brK8e9Nj/MVftM8lyGWEX/SJckegbWsDlazF7ZaqyplQPqqYZsAcRsfQS+TWYP1kuQY
 oSFF8tSqdsd/jOde8MfzmTQLDvf7FRYnOZX4Ys4byWktS4jWcg6+YMQ2b3/umsUeUdmO
 elYw==
X-Gm-Message-State: AOJu0YwmzrYcmQZKyg4sJ7iC3o1Ndv0ow0Bu6q3FRApgAMpwaFcUYWOs
 U0grFCx609f2IvmZmRQf8pOJkQ==
X-Google-Smtp-Source: AGHT+IG1m2LzUjFEXtZczRmxlxINkHg+Jq1D1mGg5ZDH5g7+z7SoUtG5Oaey8r/7wyn/lWQrriixAQ==
X-Received: by 2002:a5d:62cd:0:b0:32c:c35c:2eea with SMTP id
 o13-20020a5d62cd000000b0032cc35c2eeamr519578wrv.6.1698353956213; 
 Thu, 26 Oct 2023 13:59:16 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.13.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 13:59:15 -0700 (PDT)
Message-ID: <753148f5-d68c-49fc-b1ef-0f65eefe6e4c@linaro.org>
Date: Thu, 26 Oct 2023 22:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] drm/msm/hdmi: switch to generic PHY subsystem
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
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
> Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> drivers allows better code sharing with the rest of the PHY system.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like this will require some atomicity with the phy changes

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
