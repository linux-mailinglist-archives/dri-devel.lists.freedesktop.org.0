Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A993691A03
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 09:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9F110EC82;
	Fri, 10 Feb 2023 08:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073D810EC97
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 08:29:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r2so4235939wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 00:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6tE1c8DX1v8mq8zoUCAIlPkRHC7+cDeEHJZKSrjk8IA=;
 b=hHm3T8b07r++hVJS3bQDQPb8kda5vBpkvDme6ZbXdLqhcM9fDX5oFyYu/n6qlFQcZ+
 iYnatEhZBe2gJ2wPUQHlIp6tOWV+kFRO6IFOsML793dYvUdmykYe5h4kstTSQKQSctaj
 oCGaxEXxiwEUGjY3YtXmK+ClIf4Wch7r5ypjWXB0RjDIg+HyfTeRc0RdO8FR6ncCp1f7
 4anrFnVwmlc7tdaIo13VsLpIFr/SrIxAD/c8iMq7w5+CyAxHQnglEHkXJ9KBF4plk6Op
 g4bpFy0zj4RO/xfYfqVNoZeBhIXZH0VdUI6o1Y50ypaAjEohACrSg5Y2ZZbr35Ta6Ymh
 Rhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tE1c8DX1v8mq8zoUCAIlPkRHC7+cDeEHJZKSrjk8IA=;
 b=B9AbhByRaaIbMzyR70AHMHMcDnpzQIqTGEMm2O5AXU2WY8xmzGB3SwSih5PzQB1A+F
 zYP2/wjXsoWRgcgu125Nqwq986wGC76sy862khnVGBad7qYW/UUx7CrOxfgCmQWASOsf
 l/jhwDSPvXIhe5pQtLxB1At1MkbUojWoExJFVQU3plorHYDH9OOZ0A5idflxzsNTYBEQ
 W8fTT+TRuFi2nh+6p/VzXEvBKSl5gmjzFnqqB62loFPHAXwsGs0Ltx4jX8wA/4Gsx24j
 P0feaEPcCDPjiHWCVk1WWPgLsD2Gekhbn7qj0gj6UC7/6Cuf2jany3JjSy/XUpfNnCh4
 o/wA==
X-Gm-Message-State: AO0yUKWGQWWgQ0aa2/o1/qmrlXJBRBix2/6bVuXjmLptfBpU0wJvRvW3
 9lbzMJvEaR+VW+g5xG6vPXQFkQ==
X-Google-Smtp-Source: AK7set8CXKm1YKEByQG/0WbPGVGfw7alomSEHGXKLAfAg83bzNQrVs9gDjx9S1V0J6uUMIHVjvhQXg==
X-Received: by 2002:adf:f308:0:b0:2c4:242:1e09 with SMTP id
 i8-20020adff308000000b002c402421e09mr8851999wro.41.1676017743399; 
 Fri, 10 Feb 2023 00:29:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027?
 ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adfe410000000b002bfae1398bbsm2965946wrm.42.2023.02.10.00.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 00:29:02 -0800 (PST)
Message-ID: <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
Date: Fri, 10 Feb 2023 09:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK
 board
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 14:38, Dmitry Baryshkov wrote:
> Add A660 device to the Qualcomm SM8350 platform and enable it for the
> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> noticed that DT nodes on SM8350 are greatly out of the adress sorting
> order, so patches 2-4 reorder DT nodes to follow the agreement.
> 
> Changes since v1:
> - Dropped merged patches
> - Expanded commit messages to mention the sort order (by the node
>    address)
> - Rebased on top of latest Bjorn's tree

Can you specify which tree and commit ?

I tried next-20230207, next-20230208 & next-20230209 and patch 2 doesn't apply.

On the 3 trees I have:
d7133d6d25fb arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
b904227a4b69 arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
2a07efb8c086 arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
e3e654ced376 arm64: dts: qcom: sm8350: Fix DSI PLL size
45cd807de143 arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
0af6a4012b38 arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
1eed7995d9da arm64: dts: qcom: sm8350: Fix DSI1 interrupt
6636818ecf0f arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
f3c08ae6fea7 arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
1ccad21aa996 Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
...

Can you use --base in format-patch (or use b4 prep !) ?

Thanks,
Neil

> 
> Changes since v1:
> - Fixed the subject and commit message for patch 1
> - Fixed GMU's clocks to follow the vendor kernel
> - Marked Adreno SMMU as dma-coherent
> - Dropped comments targeting sm8350 v1, we do not support that chip
>    revision.
> 
> Dmitry Baryshkov (6):
>    dt-bindings: display/msm/gmu: add Adreno 660 support
>    arm64: dts: qcom: sm8350: reorder device nodes
>    arm64: dts: qcom: sm8350: move more nodes to correct place
>    arm64: dts: qcom: sm8350: finish reordering nodes
>    arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
>    arm64: dts: qcom: sm8350-hdk: enable GPU
> 
>   .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
>   arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
>   3 files changed, 1354 insertions(+), 1167 deletions(-)
> 

