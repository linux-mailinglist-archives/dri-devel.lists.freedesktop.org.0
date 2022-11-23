Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6361E6369DC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4DC10E5FF;
	Wed, 23 Nov 2022 19:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFDD10E602
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 19:25:55 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id bn5so173293ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t1DObvPh+Rx+Hqegn0XLyYJdliwmlAQX29QBWofxvPA=;
 b=zusNWTQ0ZtK82/Ue7pGOHYNeKWcg2Ze4ZkbOTBvSyG4O9vOzVzpYdgtbzTQSADp2O0
 vYDxc7B4D1FK1U7DuxqIKxfpDF/Of+Pp7MPdvTk0HyTvUgWAKXEGrXxhNzeP2i+LyrUo
 BSQTTlJ5Qr0BSru3RYd2CIxZ0ApnHiuvpBLQzmCKW2/nUSkfyQCSMIcuYRUGcoy1kdAz
 8UsvIRYvXSnsnZC6brAQOvdNsqdrjnZ6InTX2p2yaHZORdrIC9HRRUGI99+eXjPu7sjU
 VUDluoan1yjaBrHZBnampED/dPUujN6SmSB7wjm13/mUqHHS5JN7cjH8tkSctlPYst2/
 U1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t1DObvPh+Rx+Hqegn0XLyYJdliwmlAQX29QBWofxvPA=;
 b=DGE07BXEaOC67w+97ZXLKZ6vo/G0mAh94e0pQs67ON/RT5OxBQJsDe828Fqw6fb6bU
 mQDpwcJj6HsZlQj9ODObK+9FhHyKSN2XJKbbUzdB2DD7v4w9bkn9lzzU/anm+sgjMnhx
 nBK+XmfeEBUrRWSgjQ4YctPoor5mSMtQbRvyfak3bYqvPXYV39tCYO/s8Hk8/6wgHl/T
 W6Ctafddo5yzOWOmqmYI2jN6GTRvWDvDCiwjiqfY7wsz+qibOSTV+Ip+L9ukwsY8rLQ1
 RedXxvAsjCkUcNYnb/5/Q2mHnP8n4esBflA8HKEF/8voZqK+bKIHConhSMOgYUOsygEH
 uCew==
X-Gm-Message-State: ANoB5pnJGGWt+pG9xAKAn70HB2iP2MMVfoDiPon3XUCipEpdQKJq+Mh/
 j/L3Wr9WdQapnuwjtT3BF9/9EA==
X-Google-Smtp-Source: AA0mqf6sCm6NBHdvo+56rXL7omxWiAryfayByRNrgP0gPV7565DlqGRPl39qHB5E1kDK52xUUGeikg==
X-Received: by 2002:a2e:a375:0:b0:277:7c00:e130 with SMTP id
 i21-20020a2ea375000000b002777c00e130mr3104784ljn.268.1669231553655; 
 Wed, 23 Nov 2022 11:25:53 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a196d1d000000b004a459799bc3sm2996182lfc.283.2022.11.23.11.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 11:25:53 -0800 (PST)
Message-ID: <879739ef-41a7-3470-da0d-6aa7c8654e0a@linaro.org>
Date: Wed, 23 Nov 2022 21:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 01/11] dt-bindings: display/msm: *dpu.yaml: split
 required properties clauses
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-2-dmitry.baryshkov@linaro.org>
 <3f796546-f9ac-353c-9f5b-870f77726da6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3f796546-f9ac-353c-9f5b-870f77726da6@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 12:15, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Per Krzysztof's request, move a clause requiring certain properties to
>> the file where they are declared.
>>
> 
> Commit msg could be a bit more generic, without naming me (there are few
> Krzysztofs), e.g.:
> 
> Require only properties declared in given schema, which makes the code a
> bit more readable and easy to follow.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ack, thank you

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

