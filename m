Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9D8139C8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 19:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6110E205;
	Thu, 14 Dec 2023 18:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9410E1E3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 18:17:47 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ca02def690so107998921fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702577866; x=1703182666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V996eBYA2jf5xw2cGVFX9AAMXUTvaenYf6TgfjPDZHc=;
 b=q03Xx3wsEGK28tEhTbrMai9OEryQy5gLXRn0mcWwsdC/9bJqIfQ+GYO/UuHIEtC7bl
 lKeJWresHF909VZil6v0kT82xr7kUdqwIbx3fxnht5a4bYznbtaAUXAKwV16fZNDcMSC
 sm/x8rjazPQzZ5eQlPZFVIzexIy2TtEN1btTT6XucKu5vNq6qwZ59bp5e3zqfRTWN/OS
 ZcuLMD2/MU/RKX80xTF/RXHkibPs87p2vqa3rlTgTQ7z6NSfMZwh/8gMGBJAtYohfO1i
 3E82oMhZOb6wC5RmJlYSv/LmINP5/mk5mKXjj2U1BbD4CUmfdezNKj7aI1u93e2oQeJo
 1OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702577866; x=1703182666;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V996eBYA2jf5xw2cGVFX9AAMXUTvaenYf6TgfjPDZHc=;
 b=DFDP1y0BTJYzLw8fMEhYMU8JOyNQW4ONbt/00yWky/pNRDo7Ud5K6KDWvtUy1Wm4rU
 +3Gpvlw59eWXXJYPoEkxKQIT6/nGNG3GbcyyzW3lDfkGfcWsPV5C+zGxQNWBRKQkOyR4
 Lqih4snUKyZuKuNOiV6sHgeWLcS8NKbvyKqTpBphV9doegB7uU/qrGtBEtYS/jKCg8oY
 LS3+Z6zJB2sdlv9gIQYHwOT3KA0qF0aESmGm0ZQJ2QMwBsVUw1ZfXrv80W4Xu00cMCJu
 Y82rglNBC4zPu8KNh/qe+p1qDcJUu5AsNSVlGW6nE6voFRnbqnUm0ODZYKvIxLlhcfEU
 T1VQ==
X-Gm-Message-State: AOJu0YzanRHIFuHOgMiYj5z7kHJT7nzc/wVBHuCDgs+M0FAhurp/J/dA
 fzsOxwa+PgDHyZp+AXOIYmxgfA==
X-Google-Smtp-Source: AGHT+IF2DbL11C4WswCDCL18BClKmLGUaGi2aE5JR5xUyvvipdw8GT/iJuHXV8rRDu2pezFGZS6/hg==
X-Received: by 2002:a05:6512:b89:b0:50b:f351:6fb7 with SMTP id
 b9-20020a0565120b8900b0050bf3516fb7mr6979265lfv.0.1702577865694; 
 Thu, 14 Dec 2023 10:17:45 -0800 (PST)
Received: from [172.30.205.72] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a056512105000b0050d1a0e7129sm1659686lfb.291.2023.12.14.10.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 10:17:45 -0800 (PST)
Message-ID: <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
Date: Thu, 14 Dec 2023 19:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/11/23 16:44, Dmitry Baryshkov wrote:
> Add required-opps property to the display clock controller. This makes
> it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
> errors when enabling the display.
> 
> Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Only patches 2 and 4 made it to me..

Konrad
