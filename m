Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C57691D98
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40E710ECD7;
	Fri, 10 Feb 2023 11:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B70610ECE0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:06:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so3825659wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2WvpRgQ5G57ZVVIXe90HxYTqDFLqMAg8mVODJJIxPz0=;
 b=su5RrBm5J0w27beGGlwu3ZBRmemdAQK34dOchCFhr9NawV1+xxmVSRw3duJLVSUO8f
 EMAOVcgkaIo8vBAv67Lz2wxJORawdCNiycTazvv+rYxDt+u/F/e9g+bsox8Kd+cHBQZh
 rQJqZTSseabBUt79qwFOug1wcCEvqS8SBVzkGqA2hdKtb5RrqTxbSEiMkbVB71qyO5YZ
 Mo8L50D9typ9Q0vzgs6XYvJL0JZ3xogO0xPHIE0IdS5gh0TvAgvQXzigNJ9CZ6SqkQdf
 im0B2zmV0gnd4NmY1r/1OAe+GvZ7KmIRwrrLrg9ywrGj2gW859klqki1ziX/Ho8qZV36
 2NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WvpRgQ5G57ZVVIXe90HxYTqDFLqMAg8mVODJJIxPz0=;
 b=qdV3exIRpA84encWog6Sp7IJf/Mvk13s25P3BJOyal4NMCiinqgGWdrVlNGKjkDGzM
 5OWw9K1GsmQkdEQpV6s12StvyAqJ2tzptPypAKvgVu5KlprEUoZ2IpscxJinnvev3OoT
 x9ABZHVRLvMtcyLVTbLizmgTaaRHGJdXg/PPuHgMPe8YAnhfRS3th6KqNrZh5NTSGodJ
 aq8CoUcLZ/KH+yNrf+HS0h0iEoJqKJZcsGmIDap3k03dfK+Qdjgx5+6TG5TDO13rgz8L
 idkrI84b4Sri/yqrsH9QEs5xCtoLhHxg0LOYYaQcjPX5wi53fVXGHP/OmMZ+O3UHHaVs
 UPqg==
X-Gm-Message-State: AO0yUKVnSha3kaiaQ0/JDS0EVBbkUIfe75xgDJU/IJ+Wjyc6Wf1KTutZ
 Q8/zhakiSXvn7det1J6ikivZATjVZHuzrto4f6Y=
X-Google-Smtp-Source: AK7set9nxHUCh600t17pI1QTvig9xgZDV3bVQ1xlGacP+eH2UbMIBpJZA4xDZzI0iljFP0d/J4yhjA==
X-Received: by 2002:a05:600c:996:b0:3df:f85a:4724 with SMTP id
 w22-20020a05600c099600b003dff85a4724mr12562446wmp.39.1676027217663; 
 Fri, 10 Feb 2023 03:06:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027?
 ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c439300b003dd7edcc960sm4443046wmn.45.2023.02.10.03.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:06:56 -0800 (PST)
Message-ID: <076acc27-6a76-2e65-8f12-1e1e51d5a8ff@linaro.org>
Date: Fri, 10 Feb 2023 12:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK
 board
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
 <CAA8EJpoj3xepq032n1q2UmKGAk5k0q5DJPe15UcJz+tkrwNWNg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpoj3xepq032n1q2UmKGAk5k0q5DJPe15UcJz+tkrwNWNg@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2023 11:32, Dmitry Baryshkov wrote:
> On Fri, 10 Feb 2023 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 09/02/2023 14:38, Dmitry Baryshkov wrote:
>>> Add A660 device to the Qualcomm SM8350 platform and enable it for the
>>> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
>>> noticed that DT nodes on SM8350 are greatly out of the adress sorting
>>> order, so patches 2-4 reorder DT nodes to follow the agreement.
>>>
>>> Changes since v1:
>>> - Dropped merged patches
>>> - Expanded commit messages to mention the sort order (by the node
>>>     address)
>>> - Rebased on top of latest Bjorn's tree
>>
>> Can you specify which tree and commit ?
>>
>> I tried next-20230207, next-20230208 & next-20230209 and patch 2 doesn't apply.
> 
> It was crafted on top of Bjorn's tree and as such it applies on top of
> 20230210 without any issues.

Ack, will rebase my DP stuff on that,

Thanks,
Neil

> 
>>
>> On the 3 trees I have:
>> d7133d6d25fb arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
>> b904227a4b69 arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
>> 2a07efb8c086 arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
>> e3e654ced376 arm64: dts: qcom: sm8350: Fix DSI PLL size
>> 45cd807de143 arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
>> 0af6a4012b38 arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
>> 1eed7995d9da arm64: dts: qcom: sm8350: Fix DSI1 interrupt
>> 6636818ecf0f arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
>> f3c08ae6fea7 arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
>> 1ccad21aa996 Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
>> ...
>>
>> Can you use --base in format-patch (or use b4 prep !) ?
>>
>> Thanks,
>> Neil
>>
>>>
>>> Changes since v1:
>>> - Fixed the subject and commit message for patch 1
>>> - Fixed GMU's clocks to follow the vendor kernel
>>> - Marked Adreno SMMU as dma-coherent
>>> - Dropped comments targeting sm8350 v1, we do not support that chip
>>>     revision.
>>>
>>> Dmitry Baryshkov (6):
>>>     dt-bindings: display/msm/gmu: add Adreno 660 support
>>>     arm64: dts: qcom: sm8350: reorder device nodes
>>>     arm64: dts: qcom: sm8350: move more nodes to correct place
>>>     arm64: dts: qcom: sm8350: finish reordering nodes
>>>     arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
>>>     arm64: dts: qcom: sm8350-hdk: enable GPU
>>>
>>>    .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
>>>    arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
>>>    arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
>>>    3 files changed, 1354 insertions(+), 1167 deletions(-)
>>>
>>
> 
> 

