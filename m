Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5469D858
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 03:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58E210E089;
	Tue, 21 Feb 2023 02:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107E10E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 02:13:35 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f16so2818471ljq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 18:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AiW1Ta6IBbAqhmcXMDuesOeKjslnZyHw8cj0RcHsMpM=;
 b=q2n3pOcNSff0lmLUH6TzkO4y2Wbwsgs7VVt5p4KOyIs0+e00UIkUexaic4YPCWLnII
 QKdsQo0BQmEhQzFa1qX+A3zCO/El+bSe6gviIsJMUBJgsrNYhfQ55tsDYxt/iSgY3co3
 2sFb4wrYsu5UkgyaR1PC+OrvNduvWQM4kPY9v8zXoZAxQH7Gxeq+c2Rb59P0QVSdGfha
 DH8iOrM2WPmuazOee6skUPCkYk7zLrzTWL2Qt00M1/rJMWqdRkSmFsOCgbVSnrsmAyZD
 X99DVVLFvrGkFt8hbjjn2faV+BbxoiOqDtANNkWPW4w/R2OYzlQkkavOv1m4vyBtCv15
 27FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AiW1Ta6IBbAqhmcXMDuesOeKjslnZyHw8cj0RcHsMpM=;
 b=HZLEDTEBW0Ak5WlmAVbW0uWSnlxzxwNVAL/AN4UJddswungv2MCKoSaDGaLl438dWm
 j9XJ7RE1xeAV0fn2I2cqftqOzqoOdZOz22hEYazWswkp87yPVXH0capO5Q6KZXqEt4DB
 2BsXsV/ZgbXLzGsqKtSLNs0pkXtSqsUsMs09Ru85GmxEFpwNwurHoMrEiziTOZcma2H0
 XfZMjW7X9DR9WGhaj9EVr5LtNTiB56r3P/bH6evsko3VP9dfu4OyNgKsk2MNi2ZdumJJ
 mTuyuXAZ2PGWxto4zh+tItETET4lNj9mXnrGNcM1K6qRVdZux2xV88Lp/8hNOCyvHW+O
 /0fw==
X-Gm-Message-State: AO0yUKXGoYj+1xxLDRzsACyPP/VIupUtCExso3iFHHTSsrmtJDic2NjN
 qVAEZOgdKdU1ave/menB+tYeIw==
X-Google-Smtp-Source: AK7set8WttfIXgREx/DW//8k7URrt/2t6ghhms3MAPdLGVDin45jZVDbJmSbypfK9cYXpJfSL7m1WA==
X-Received: by 2002:a2e:be07:0:b0:293:4bab:39c6 with SMTP id
 z7-20020a2ebe07000000b002934bab39c6mr1533436ljq.47.1676945613642; 
 Mon, 20 Feb 2023 18:13:33 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a2eb1d2000000b002934abfb109sm170466lja.45.2023.02.20.18.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 18:13:33 -0800 (PST)
Message-ID: <d9173dbe-8cf4-c6e6-d37e-878219631333@linaro.org>
Date: Tue, 21 Feb 2023 03:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Lenovo NT36523W BOE
 panel
To: Rob Herring <robh@kernel.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
 <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
 <20230221020859.GA818929-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230221020859.GA818929-robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.02.2023 03:08, Rob Herring wrote:
> On Fri, Feb 17, 2023 at 12:29:07PM +0100, Konrad Dybcio wrote:
>> Add bindings for the 2000x1200px IPS panel found on Lenovo Tab P11/
>> XiaoXin Pad devices.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../display/panel/lenovo,nt36523w-boe-j606.yaml    | 60 ++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
>> new file mode 100644
>> index 000000000000..43dcbe3f9f30
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/lenovo,nt36523w-boe-j606.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NT36523W BOE panel found on Lenovo J606 devices
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: lenovo,nt36523w-boe-j606
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  vddio-supply: true
> 
> If only one supply, why not use panel-simple-dsi.yaml? Though probably 
> there's more than just an IO supply?
Display regulators (AB/IBB/AMOLEDB, not to be confused with LAB/IBB)
on modern Qualcomm platforms are controlled by the secure firmware
layer (yes, you read that correctly). Some panels require additional
supplies, but this one just has one positive, one negative and one
I/O regulator.

Konrad
> 
> Rob
