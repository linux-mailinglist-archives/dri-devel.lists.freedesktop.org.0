Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7D5B4547
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 10:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF09510E15A;
	Sat, 10 Sep 2022 08:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5836B10E15A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 08:45:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a14so2590425ljj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=P9E6EJOAjkihEVhh+VHXY0BL5/AxfW43uIcjA2GedNQ=;
 b=iVPhA7d5Az8rlbmvca1G2gC/MeeY9juG8dCTbIgYVWCUDRGFTqYJUnk3IA7ZCNWoaF
 ls7vqVUcjKPgvnmzpq3w/5bt+ntAiY/Wu3ZuLe4OcCKTb8JjTTr3J5m5u4FKKVjdRkLV
 63RIJleMQOrYi+o4EU9WbHPJKfYZZGMPMx2tPS3wqf86q9hPsCeD170/CFy0pJcpkfuX
 s3HMMz3kCpAntkSBiamVRVsfBlD2NHLEhrixMsWy83IGSMvdAcMukTihnz5Z3uGomS97
 ug4R+HRSGvh+XWgxba0hQx0Uy2q1mG8dvoZZa5qnJiHdr2vsZgk+uVXtgmNIxXGkO95/
 lVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=P9E6EJOAjkihEVhh+VHXY0BL5/AxfW43uIcjA2GedNQ=;
 b=L5t5G2JLqlsqVIgiXo+O8OmQg8535i1ITsH1/RS3U0gFnCn0JVq16pwt23S/zADXb5
 +jtPLHxMyTasCUCq7ghrniD6cMLq7Qoc7riMnlQknpij9imICxWmPkqezYlGAl8wK2hO
 6UhmKIq5Q2fkNOJLXpPitJrT+TSISKDP6+0GJM2LNEk2UCgy4FD+8eamgf7VKT/GURe3
 J6yGEvKFvHEtDWfcxJpOrL6ni/MvLIviN3580fD8T114RR6OChBlXXshzrf1drVSefXU
 uR3JcUlo8LqwcjG5ID831rIbl913nOsEnSC4daSyXLhbDC05ppEDzS5sAyvrPOh/4YIO
 C72w==
X-Gm-Message-State: ACgBeo3/5V5OuPjYoZLqk7pmYokFIlZNrmY1OVJuDmNy4MyLFH7hUUUM
 H1Ika4usX5HoKLqazkGFBsilGQ==
X-Google-Smtp-Source: AA6agR6xJmtXQZHTsaPv0yXAg2Xgwt41B3uhxvyWqB8zdnoZRUfTeBkz1VRmj+33lgWRIDrhrUpC6w==
X-Received: by 2002:a2e:3817:0:b0:26a:d369:ca71 with SMTP id
 f23-20020a2e3817000000b0026ad369ca71mr4359670lja.191.1662799528217; 
 Sat, 10 Sep 2022 01:45:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d29-20020ac25edd000000b0048a83336343sm183581lfq.252.2022.09.10.01.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 01:45:27 -0700 (PDT)
Message-ID: <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
Date: Sat, 10 Sep 2022 10:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/09/2022 00:23, Rob Herring wrote:
>>>>
>>>> This should be ref to dsi-controller-main.yaml... or based on previous
>>>> Rob's feedback you dropped it everywhere in children?
>>>
>>> I don't think I said. I thought about it some, as yes, we normally have
>>> done as you suggested. The downside is with a ref we'll do the whole
>>> validation of the child node twice (unless the referenced schema has a
>>> 'select: false') whereas here only 'compatible' is validated twice. This
>>> way also complicates checking for unevaluatedProperties/additionalProperties.
>>>
>>> So maybe better to keep with the 'normal' way and make this a ref.
>>
>> Well.. I tried using $ref in the previous iteration, but then I faced
>> the fact that I can not use it. Using the $ref the node gets validated
>> even if it is disabled, and we do not want to do this. The nodes are
>> usually split in way that regulators are specified in the board DT file.
>> Thus disabled dsi/dsi-phy nodes do not get all the required regulators.
>> And dt-validate happily dumps tons of warnings for disabled nodes. Thus
>> I ended up with the compatible rather than $ref.
> 
> Only warnings about required properties? Those are supposed to get
> filtered out if the node is disabled. Maybe being in a $ref doesn't
> work.

This seems to break regardless it is in $ref or when you directly
reference the schema.

I tested display/msm/dpu-sc7180.yaml on modified DTB when a required
property is missing (I removed reg-names) and:

1. When node is enabled:

c7180-idp.dtb: display-controller@ae01000: 'reg-names' is a required
property

	Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml

rch/arm64/boot/dts/qcom/sc7180-idp.dtb: display-controller@ae01000:
Unevaluated properties are not allowed ('interrupt-parent',
'interrupts', 'operating-points-v2', 'opp-table', 'ports',
'power-domains' were unexpected)


2. When node is disabled the first error disappears (so no clue which
one is missing) but schema does not pass:

qcom/sc7180-idp.dtb: display-controller@ae01000: Unevaluated properties
are not allowed ('interrupt-parent', 'interrupts',
'operating-points-v2', 'opp-table', 'ports', 'power-domains' were
unexpected)

	From schema: Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml


However I think there is no such problem, as Dmitry said, that ref
changes anything. There will be always failure - either from parent
schema (using $ref) or from device child schema (the one which actually
misses the property).

Best regards,
Krzysztof
