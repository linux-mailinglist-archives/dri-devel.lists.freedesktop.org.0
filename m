Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBEE63EE05
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA5C10E130;
	Thu,  1 Dec 2022 10:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566F10E129
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:38:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d6so1807784lfs.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 02:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
 b=sDiCfmTwLAL+IKSK6fOyjJI03hKdZIxAwTN23mUq3iwImjKp2FQBCLSi5GOXxBPsHz
 BdYaxRl6VVlyvlU6jG9NE6ZG8rv3Yj0JnmFXHJTRlzsuIL78G6czmw1vTpU9BjChZF3M
 rmMJqL65R3fZNXf0/E6oOy/hBWLN3/iir5072tqA+HRaWY7fBEiO0FbK5YJ6YijcnQ8a
 +mTJELLZsdyHs4cGNDjena94bfmGvZYxnw5jMqOsrOF0BvuaxqpN8pcLqOkR+sqcjRqy
 tsqki7IGeJr9MY0ED0VxJTG89l+ku1voRYszZZ+iJsbbJXKsZ69oEGGy6biAIZwn2wYU
 wjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
 b=KAazfOJukLb6abM27sw3nsQiblmx4iymGO7J5uFy4/ZrdTj0IZZuVRySfZNw1ayODF
 IVtr62c6f62idENxNQmkzvB1pIDD3/HvKTcxDlpvNhUgrpmF/lFYwHvEdjO+ZMjPyFuv
 TEFXkdVc0Ri6LNhFclaxj+3aY9SjsEQmBuVlgcG3vNYtIEkNOktn8XYX/Ut2MRogFVDP
 O3M4hIhcAoQDi6YWcRxiJeEFd9uczzT5e5vwLEbe0aZyhA2ITBsPWxQfSfZVPO2k17EO
 PpDh7CfmI8hIz7lzx71eHv620Y+1ICD+wIHSEJVeMgkY0Osufc9ozCygoRO5+PfDnJ0+
 xQmw==
X-Gm-Message-State: ANoB5pkVaGv8qrcOiVogJY3v3aT7ITk8EY6JBkOn81vxJXR4XDHZWs1o
 z5opzUiwmT8lcf0CgWlBRVPtMw==
X-Google-Smtp-Source: AA0mqf5fOBE5NhPN7Xd+BTF4xDsWEodGVKp8iN4/HOQ8OyxhgwJEhznyaRqPwZeYHiXu0T46gbRvmQ==
X-Received: by 2002:a05:6512:3983:b0:4b4:f88:90d3 with SMTP id
 j3-20020a056512398300b004b40f8890d3mr23278296lfu.37.1669891098347; 
 Thu, 01 Dec 2022 02:38:18 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k29-20020a192d1d000000b004b5138d82b3sm601559lfj.76.2022.12.01.02.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:38:17 -0800 (PST)
Message-ID: <382df687-c535-4dd6-125a-5f3b6022cbd2@linaro.org>
Date: Thu, 1 Dec 2022 11:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sm6115: Add WCN node.
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-12-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-12-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 21:09, Adam Skladowski wrote:
> Add WCN node to allow using wifi module.
> 

A nit: Drop full stop from commit subject.

Best regards,
Krzysztof

