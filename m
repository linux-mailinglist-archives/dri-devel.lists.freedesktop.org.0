Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C9621139
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7B110E27D;
	Tue,  8 Nov 2022 12:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEF210E27D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:46:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so9012198wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIQ3u/huOf4z9jf0jf8kWSgTP1/QU5AOGn1ARoDQeg0=;
 b=fWDgETyypYOc1gL0Y4RbTqbIiUZjuIhpIKjNKu4S+sZcyvPAKsmZV6mh+gKWcbWauE
 2+U+9kYLsqPF97ahGm2w2l8rqq+RxVjS+aIOpe1i/rfXGdaHCPpv25jJxBogaQQgJmFv
 TW2MGPQo4ArbQvCCu7c/X7UiWcdHHTwx5oXHE+kibb/5WHpGYOqBv164DWKWUPxEF2cG
 bdSCcC4aYsD/2yOfkgKqsdRehjDYK8/jvylQp9T87ZXnNRBplvuu7KKaE8IKrmRv8nsT
 2WMLkggWxVgV9wGE3495gzdDeDf5Q8H98e1hU3ebvAIu/9VuScQ6cDyVzMBCfMNHlJM6
 bI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIQ3u/huOf4z9jf0jf8kWSgTP1/QU5AOGn1ARoDQeg0=;
 b=tcfF0KdxBUoRF++QW1qmmB0LjQmIpZLovyKo2scTK2dytivdCx6mUptuIEv37Q5kvm
 gar3e+hQty7m84iVEy/qNYml2dzIJ9hs8SmsS0reJXSuFteQ3bE54zRmls6n+rv47Hgn
 Asa+y9q5MY9s+TokRDUF5aOhdYmiD/wwAgno4Feaoyf8ggvtAJ3wf0NSJfLav0+/ifWJ
 LULMMAIhOSNeV54qg6uGRaSSjoJcs5CbKgV6i+feWLHR96OaAAbu5F/xQiWQX63JVcu2
 uulGyp00hbnNRH+ueL3MKCWVt7sUZx0TW+XGg1anwgYWWNVnucmrMCMTAebGokDI2LkM
 LU+g==
X-Gm-Message-State: ACrzQf2GcmL7VpYZQqBMOW1yE2F7uo3H15KRLbCnYFNx19F0kXcWR5WF
 b0WEZJn4N5BqQywPgx9FIYROrg==
X-Google-Smtp-Source: AMsMyM44z2U/h+ehijFYZ/5qViV4YPBFnGfwbHys7xmuID6S4pCbrFGbASlzwGGFG0zW9x1S5a7Bsg==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e78:8e89 with SMTP id
 26-20020a05600c021a00b003cf6e788e89mr33447753wmi.46.1667911558976; 
 Tue, 08 Nov 2022 04:45:58 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a1cf318000000b003cfb7c02542sm1937720wmq.11.2022.11.08.04.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:45:58 -0800 (PST)
Message-ID: <162823f6-9fa9-1d69-5421-d77d37b6a0d7@linaro.org>
Date: Tue, 8 Nov 2022 12:45:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/18] dt-bindings: msm: dsi-controller-main: Document
 clocks on a per compatible basis
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-9-bryan.odonoghue@linaro.org>
 <d10bf67c-c21c-5096-d774-ff924bf1dd41@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d10bf67c-c21c-5096-d774-ff924bf1dd41@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 12:43, Dmitry Baryshkov wrote:
> I'd prefer to have this part squashed into the previous patch.

NP.

Actually I'll add you as a suggested by here since you sent me a patch ~ 
similar to this.

---
bod
