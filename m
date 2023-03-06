Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614226AB8DD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D6510E1A0;
	Mon,  6 Mar 2023 08:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE810E19D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:54:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i34so35303955eda.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678092893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLAhqnNFboMZ3Xspb0HEH0L2QkUdVCAZTGMLZDTo/AI=;
 b=jczTpg4zXHb1ZQneDL/piIaCwC5Mr18d9VYx8iHeFhWIhnuV4wlFycQOhptE/+OUf5
 rmR4fXrJzuHTIxI5k2HLJ2iQY/r1ZomAhCjBOL7w2vVguAg/NuPpOuBqyQoLUGaKOSqa
 10uGpZ8NjOstj/WxKtZ700TO0vzwyX66VvCmxiF7VC4yforcMxQ96jDi7Po7n+8u5o9n
 iAR0l28grFRon15ZCjmeDxZoqaR6psgehevlGDPfG9gFJkg6dqQsk4nd0Fm+zPJExFX6
 QbrXxWa08Os3KE0V6eIoyAXU7PzanR95PNpvXtD8Oz1Nvv3R3oTI2G898drqhtt7hRsP
 wbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678092893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLAhqnNFboMZ3Xspb0HEH0L2QkUdVCAZTGMLZDTo/AI=;
 b=4FvGStDL+rhdPvllxIzuj2AUB6MTKfftcXjZxN4l2puFmauQyxaOyQJY6/DQvc71N7
 aklR+++8iJE4a1J0LhrEJloCPgFnhPcsx50CNiaRoqFuJ8WWas6S/UJYv3vt3xscjtBX
 AmM5l7YrXFeS9qeAzpupkVU47GhjT/1wMshXKOdSI9MKBUuRLmF1O0Hk8fu+Jau3b3mK
 PUBAKjiEPEqfrji4+dQAbTdmYxW/f2IdD6Zpdt9nD26v1A3IQeeeX3unTJ0jjEKwUAwK
 Xum2/Ba46a2BFbbPZ43BhR11ITRWLL8qWFsmesDdgVpBw61ciAcmcsHopyfiDsDDzpa9
 xIGQ==
X-Gm-Message-State: AO0yUKUvfZvXoI99Y6hzcfFK6spkY+r45zODjS3B13L2p/M8SiO/y0RD
 xyfiupi3BeQC7EssXgd0F94Fng==
X-Google-Smtp-Source: AK7set/zYZbv8I8sb/J/hGNNCCXKArT9QRhK0vtY2AqjURZK5qxhyca6vR86eJgWBZt8MJTCfklSWg==
X-Received: by 2002:a17:906:32d9:b0:8aa:bf4e:7b2c with SMTP id
 k25-20020a17090632d900b008aabf4e7b2cmr10892941ejk.21.1678092893196; 
 Mon, 06 Mar 2023 00:54:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe?
 ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170906640500b008be0b7242d5sm4317499ejm.90.2023.03.06.00.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:54:52 -0800 (PST)
Message-ID: <67d51c44-7599-39d2-9616-573e07194550@linaro.org>
Date: Mon, 6 Mar 2023 09:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2023 16:55, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became

s/property/compatible/

> undocumented instead of deprecated. Fix that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

