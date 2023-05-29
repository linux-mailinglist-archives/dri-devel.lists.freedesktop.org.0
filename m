Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA37149BE
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2219310E288;
	Mon, 29 May 2023 12:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6D410E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:56:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3b4ed6fdeso3380695e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685364981; x=1687956981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kMFfJbf4XWQRQofGy/2ExiTeQJT1aHojFUaBWm+VSo=;
 b=BcDC1g2wM+Hky7zS2L1tkWnaCDYLDXZq2kb6pZOERWNUGx4d4jTjMFTHA07E9ApWSs
 w+dyPzzFDF3mjciTlbZNFVMzL/VqivyhhPdPLFa3yzhOHRSao2rqJFFI8bD3+OYBthlK
 cq0H0qxoBbufK5TxSEmJmBpx8zfFHFOi9XoKYMSWvS22GfCJQRLB+Ff4jk+3MSMU5qY4
 slPIAevDm7tgAQ5UqsacisFeDInVrT4+dS8H3vtMsofj414q5j61MyW00wyoYBurH+bv
 y7HCbVbew2INxWhgZ3swJESm6zOzcDUMSK3Ixg87sQZFddSnkj1j3UTgIYdzbaMlDnMK
 aloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685364981; x=1687956981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kMFfJbf4XWQRQofGy/2ExiTeQJT1aHojFUaBWm+VSo=;
 b=lyUNrMRAzllJKYCWKHS26x9FAuDWQG+xUZdijQLlfkDPDswaTgF0VQi4PDgoibySqf
 QKzLnG2z4Wcl4WucWVjzGpZ1bi9SbYyy3aWWGT8eAsUgy/DOJdq1tTvQrXDILuuYYjkr
 Tq9Xri3RCKueP2EqmafLtj55WDCLaob2h1bNmA2+BmZfuVXauhQpzBKOyxX3DOzJ+rhb
 6tjWRqkYCfmivQ/iFNUBKR8UkIyseILUsyx+vC7bKiSk/uAmUkjrTOrKKO8BBOdzM5MC
 r9T4+VC3b1BXA9qX9HFVR8ks/y4gueBRCTkBdXKLZk1zyv7bXfOB52522qJfeHAg9rVm
 7RGQ==
X-Gm-Message-State: AC+VfDwhOSv9NKyzB9V22bn23AKqkIHeKbmzt9oImEPyT173IfFEBG2q
 v5xIkygrx7716WLF+iks7lWl0g==
X-Google-Smtp-Source: ACHHUZ5SDvE89GclIQVxV0l3jEskTCdcupX432GYZIWoRyUD9NsdvqkL1Ne2Cb1FwCZlHaWbxFlAnQ==
X-Received: by 2002:a19:750c:0:b0:4eb:18d:91de with SMTP id
 y12-20020a19750c000000b004eb018d91demr3416851lfe.43.1685364981202; 
 Mon, 29 May 2023 05:56:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020ac241cc000000b004f2529c71c1sm1959695lfi.260.2023.05.29.05.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:56:20 -0700 (PDT)
Message-ID: <8bbdc1c3-7caf-c189-9c81-a26efc79c4f0@linaro.org>
Date: Mon, 29 May 2023 15:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/mdp5: Add MDP5 configuration for
 MSM8226
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 12:44, Luca Weiss wrote:
> Add the required config for the v1.1 MDP5 found on MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

