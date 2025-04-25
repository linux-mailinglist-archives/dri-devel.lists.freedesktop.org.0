Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EDA9CC85
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 17:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A918110E974;
	Fri, 25 Apr 2025 15:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="MiecbeKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D9710E326;
 Fri, 25 Apr 2025 15:13:50 +0000 (UTC)
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
 by mail.mainlining.org (Postfix) with ESMTPSA id 4E4B2BBAC4;
 Fri, 25 Apr 2025 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745594025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECsaLysjp6B31lix5ePZqbR776k53fktpSr8Jb8kvHE=;
 b=MiecbeKSC9qPTxgyzouBu54qd4VjFtmkfHV/2qTsOefPU2eAaK5cBCTcImhw+T75qlqO2+
 xsNGxQQjX0OdP68jb2HZKFeV8do4HMOWxaZhIfySqXsdEKz5Op//pZWwxEqwnctK8A8rVg
 P2WjEybiUv3PnKk+10v9R9AGnDIaowzlxTfxSncUT2oXgzv8YLcXGPbJ5rn9brvr+KfYzt
 y9ZSgyOeTe1KRw4YfSE60ZQrWAbmyN8y261B96MCfrdyWbqrTrbHB4hEewS6ZzpxeAxnO5
 sW1MJRWbpDrguja+qwxdVjlEkU+50iOBR8LfCx5VBQuphi1fOseWw4tM2FcHfg==
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 17:13:45 +0200
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Baryshkov <lumag@kernel.org>, Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, Dang Huynh
 <danct12@riseup.net>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
In-Reply-To: <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
Message-ID: <5ccb39f9393b44761127717096a38a46@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-04-25 11:57, Konrad Dybcio wrote:
> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>> From: Dang Huynh <danct12@riseup.net>
>>>> 
>>>> Add initial support for MSM8937 SoC.
>>>> 
>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
> 
> [...]
> 
>>>> +            gpu_opp_table: opp-table {
>>>> +                compatible = "operating-points-v2";
>>>> +
>>>> +                opp-19200000 {
>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>> +                    opp-supported-hw = <0xff>;
>>> 
>>> The comment from the previous revision still stands
>> If i remove opp-supported-hw i will got -22 EINVAL messages and the 
>> opp will be not fine.
> 
> Right, I have a series pending to improve this situation a bit..
> 
> In the meantime, you should be able to define the nvmem cell and
> fill in meaningful values for this platform
As I wrote in the previous revision there is no nvmem for GPU on msm8937 
only on msm8940.
> 
> Konrad
