Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52569AB68
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE3D10EF9D;
	Fri, 17 Feb 2023 12:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B866610EF9D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:24:51 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id er25so3352369edb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRkSEUhCAUqv74wpKQpFMHAHpDnDB3DUCdgSs3cTD7U=;
 b=yrhtxWaVZlsZz8EAYHhKo7z7Qcf1xkV9vdz92vZLkg1+ezMyi9xaXJaWg/95UNi0wo
 RnfgOOSDKqYPcyICelGJD3NSH50xT9pbF0cS5bi89GeBAyl2U3Ju/+apjBqUMRMiKkom
 HARKsLb0z+pRqvzxeNzxDsyfRLuDWLcT7nGxjWtIhSquM9eBU6u5W3QuSJCIAwAl1AM4
 ZHSht6gdaLYv6YFVaF20yHxTVg52ihws/Ad/snpohhc6ZqWmtaT+WXlPsIhNPsoZs9AK
 ouTrvhYfy1IuV/5WWYkQHEhdp9mxPgkK2XtsL9q0+J65UjkmWbdQY/m9Y275kq43JDWY
 a0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRkSEUhCAUqv74wpKQpFMHAHpDnDB3DUCdgSs3cTD7U=;
 b=IxD2L6oB3iK3ymET/RLEhGb8TWsCL2ljc43tFIts71c58XUVkTSzlbwJCuzW3lDTXn
 mudTBJQEmeBt0l20DtcLTdQM7Tmji1sWeAsR7BSqg4d/3ogqRUwpunBPqRUn8yfLUmbD
 HXk66LBbCZdO4AZEHbGd/zu8OLZnWEZ6K6pFUMP+41jMEu6NUm/bc2yCDgLdEe2Vdtjm
 OzCbP/nXE4Cax4NLGtuzOmCJNZqtXM5xXuy3DvMI1cavcqXlI/CKM4DGhcnguGEXSTf1
 si0pgIazbOUWeEU5ZMdpuVOUi89wiG8KLtYVce25bnQu8nl0PKXv5ku07AKbEZgKo2Fu
 4xEg==
X-Gm-Message-State: AO0yUKXXWIsyVvkcn2rmpzK7PP+VQXAjU58sfcs7eMnpUmwpONefa9rr
 R+LVWcOCSnV2dIhj2lwZGgMtSw==
X-Google-Smtp-Source: AK7set/DBCXPYASdQ2V+puV5InoxI88AENgUj/1Lry6p1oLbNzI4+03pYsQYxh01xdrYlB9uSD988g==
X-Received: by 2002:a17:906:a451:b0:86f:fbcf:f30a with SMTP id
 cb17-20020a170906a45100b0086ffbcff30amr11172660ejb.58.1676636690249; 
 Fri, 17 Feb 2023 04:24:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906688b00b008b13a8ec56asm2074181ejr.110.2023.02.17.04.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 04:24:49 -0800 (PST)
Message-ID: <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
Date: Fri, 17 Feb 2023 13:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 12:36, Konrad Dybcio wrote:
>>>
>>> compatible = "qcom,dsi-ctrl-6g-qcm2290";
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm6115.dtsi?h=next-20230217#n1221
>>
>> I meant, that original commit wanted to deprecate:
>> compatible="qcom,dsi-ctrl-6g-qcm2290";
>> compatible="qcom,mdss-dsi-ctrl";
>>
> Okay, so what would be the correct resolution?
> Drop this patch and keep 2/2?

First, it would be nice to know what was the intention of Bryan's commit?

Second, if the intention was to deprecate both of these, then this
commit could stay with changes - make it enum for both compatibles (not
list).

Best regards,
Krzysztof

