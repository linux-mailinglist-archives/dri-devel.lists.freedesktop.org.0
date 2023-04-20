Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0556E966C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D186D10E053;
	Thu, 20 Apr 2023 13:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1310E053
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:57:18 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h4so2934265ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999034; x=1684591034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TP4lhXyKE5KTAkDMfdfy/BJbT2e3OFVGbEmy4BDp5gk=;
 b=rC9/9IWUTmoWs2lMq4duP5f2Q5wO1ZSMqOxyQXiWG7Odjz8ix31G2JT83QqwLLjbXK
 8atUiWASwss3zkgbMYud0bUjTN6ic89Gn0oM6AsaPra73UmyDa878XmQkO9/kZt8p7ZO
 7FPsoO8u3JdgF+ibY5MToJGd/Xw6ovJOow8Ayxco4sdpGsg1iwqKCFJLnwL8Ntc6XyWj
 //hFspMHTwZWQUloofdjCBtyYad4x0XFlxS5xRAZb9m9513VBYMLbdBd8KW0cIL1oDCN
 GOkOPQzm9FobHEfRfe3C3XxuwK2yvjLbsCwsl9SouLhEuZZtlZ3JZCuCz28SM7OPESdb
 2Y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999034; x=1684591034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TP4lhXyKE5KTAkDMfdfy/BJbT2e3OFVGbEmy4BDp5gk=;
 b=WLuLmGZ7ZY1urkuxagJwTxvvpkXHQiHh8XpJt36Ame2h4NkMrXXQS6kVhiDWUeNw/T
 8MIitOvHNo8sEUXwXKISH1e5PhEaKKT6zdqTDOOfzsFjHt1hTB3Dhj5qnEue23Dr6iyo
 L2AtTmzKFkMUWyPxSn8MQ1Xj1Q1VsxYrTUu2Oi8MGz1KPHWopXI7+pVq9MotxgT/MFu+
 UOQsTDP3+hNtwTFe3MpmRk3vUgspx57Ma7pFZvFbBD7n2CzxBm39fpZ5RqGvzlQbJFW2
 cewF2vQY/jT8d/L31RLUeyE7lHPA4hcDF2cyW9sNlGUEb0eMUQLHJjlvn8VbjxuLlLsN
 a81w==
X-Gm-Message-State: AAQBX9ePJkKmLME2/ytduTeKm1Phi4Y1TRaoZRrpaYcC2SisTJfyNNZd
 bEP81LkoFT3cpWMJcycfCxFPtA==
X-Google-Smtp-Source: AKy350bbrInQ8vcLAPDSHDfaUIBSaDalxHrdj5/uZoDKMnjxN0/nbHGpvT3D1EyWxc5tincgNn5nyg==
X-Received: by 2002:a2e:9d83:0:b0:2a8:bd47:caf7 with SMTP id
 c3-20020a2e9d83000000b002a8bd47caf7mr448315ljj.7.1681999034024; 
 Thu, 20 Apr 2023 06:57:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a2e7c17000000b002a5f554d263sm250062ljc.46.2023.04.20.06.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:57:13 -0700 (PDT)
Message-ID: <6d109e03-0a1a-fa3c-b1d4-7b64367fcc41@linaro.org>
Date: Thu, 20 Apr 2023 16:57:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display/msm: dsi-controller-main: Document
 qcom,master-dsi and qcom,sync-dual-dsi
Content-Language: en-GB
To: Jianhua Lu <lujianhua000@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230411143149.16742-1-lujianhua000@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411143149.16742-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 17:31, Jianhua Lu wrote:
> This fixes warning:
>    sm8250-xiaomi-elish-csot.dtb: dsi@ae94000: Unevaluated properties are not allowed ('qcom,master-dsi', 'qcom,sync-dual-dsi' were unexpected)
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

