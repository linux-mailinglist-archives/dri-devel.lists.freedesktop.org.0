Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8845463D8AB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCBD10E47A;
	Wed, 30 Nov 2022 14:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAC910E475
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:59:43 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id z24so21172526ljn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
 b=eg9BgddOl8Bn4tGtBcVcfYO7bUO8yd1eBz2ZBDcugmKd6hMl5F1Llxm5IXX9Dv37Qp
 4fNhHLmZBMoeGOrw9YHbvCeFDXo5jEO92pvUDdDbGWBdo7O7dkmmnp+L+d5eolfh4L2J
 0m1JJbT19p2jdk17CsxeU0zygr9t66ARMOIQ42/8xVeduVQLsoXIM3o9gbzsSgJKsF3W
 RiHtiLFF85+Qcjw/L2wh7IWX0xHh17uHZFqqpnbhi/BhjTaauIA2YfWmh9e9KMrU67TS
 2PCT3n8HR/0I1vzTCHssMYTdVB0opZqF+TTFcUHKetDK7FLcPMwZg/mXAVRlqUpq3Kq+
 pVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
 b=S1LOPRoBmyJWYhtPzxH2+4bTPONBJmzubmVznonrj1bt/I4DjEp41SYFkFnZInmIbu
 GntRKqC2WluKRN2yDkHgXNtt8muPz42rIfGBgXchHTZrWQB6k4taqusYG9mlwhlCuoSV
 PKYe8mT+YBJoW+ukVHj03F6lR8eM6RK7hKc4d2AIw0E/Ox69KLqpW3FyIp4i1mz+XGNY
 6aA79EVEv4HyPDC6tkGi6ViD20NextysBsMCc/mTM9dRpCH3k0Z5HIs/AoKYnulwzJVc
 erLKMcdtdRXnvP2/GJSywDYZiOmWVhsWuFklepz25JCLV0t02RzfiFjs2KO62DHE/w8K
 Hwhw==
X-Gm-Message-State: ANoB5pnjjST9WcBGuV3gt9GPQnutU8ENiPU+e5U8CwwOWFkYG1CR2bTN
 um+lTNpy/r7CHPWJDJyAVRwopg==
X-Google-Smtp-Source: AA0mqf4QWLRswl+fzVjdtAM1h2hdO9aXmxVDwI9Rklz7Of6iQt/IqJOKUAFZJPhb5iE093B2/PPRTA==
X-Received: by 2002:a05:651c:1101:b0:279:73ba:8719 with SMTP id
 e1-20020a05651c110100b0027973ba8719mr12448536ljo.294.1669820382117; 
 Wed, 30 Nov 2022 06:59:42 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056512202c00b004b4cbc942a3sm286091lfs.127.2022.11.30.06.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 06:59:41 -0800 (PST)
Message-ID: <99671b3a-e99a-0a94-38f2-1ffa70339a15@linaro.org>
Date: Wed, 30 Nov 2022 15:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm
 PHY
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 14:58, Konrad Dybcio wrote:
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

