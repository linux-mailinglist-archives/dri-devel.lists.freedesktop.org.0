Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB660588A10
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 12:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264E112BAF;
	Wed,  3 Aug 2022 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7482A12AB17;
 Wed,  3 Aug 2022 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659520919; x=1691056919;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1rVxQ4eqI3N9wCVO+tgYoYxdpipoicSFsvvHXjVF02g=;
 b=C3Cu6vOsuzPJuzImBkgFrMpA39OFtZBJnzHRhL1gPpYkCXFfM9ufo5Cm
 f7HrPkGh/Jr7QW1INMGoqqL18jJuppc/P1JvnOESosfsiwojecjjsT1f6
 iylDLVO+2Ny4jaDZ59bd4338xhctqw/rvWAMKsU2WR9bBE6LgbVmx+Eeu E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 03:01:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 03:01:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 03:01:57 -0700
Received: from [10.216.24.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 03:01:51 -0700
Message-ID: <0f90ef4d-4b74-2746-a37c-4a661cc0d5ea@quicinc.com>
Date: Wed, 3 Aug 2022 15:31:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
 <CAF6AEGv_cgPtaFpxSPCzWXeBcJvqE2fGucriRvMAJMbQ7ULndQ@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGv_cgPtaFpxSPCzWXeBcJvqE2fGucriRvMAJMbQ7ULndQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob
 Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/2022 12:02 AM, Rob Clark wrote:
> On Tue, Aug 2, 2022 at 12:02 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On 30/07/2022 12:17, Akhil P Oommen wrote:
>>> Some clients like adreno gpu driver would like to ensure that its gdsc
>>> is collapsed at hardware during a gpu reset sequence. This is because it
>>> has a votable gdsc which could be ON due to a vote from another subsystem
>>> like tz, hyp etc or due to an internal hardware signal.
>> If this is votable, do we have any guarantee that the gdsc will collapse
>> at all? How can we proceed if it did not collapse?
> Other potential votes should be transient.  But I guess we eventually
> need to timeout and give up.  At which point we are no worse off than
> before.
>
> But hmm, we aren't using RBBM_SW_RESET_CMD for sw reset like we have
> on previous generations?  That does seem a bit odd.  Looks like kgsl
> does use it.
>
> BR,
> -R
Like Rob mentioned there could be transient votes from other 
clients/subsystem. It could be even stuck ON when hardware is in bad 
shape in some very rare cases. For the worst case scenario, I have added 
a timeout (500msec) in the gdsc reset op.

I have added the Soft reset in [1]. But this resets only the core gpu 
blocks, not everything. For eg. GMU.

[1] [PATCH v3 7/8] drm/msm/a6xx: Improve gpu recovery sequence

>
>>> To allow
>>> this, gpucc driver can expose an interface to the client driver using
>>> reset framework. Using this the client driver can trigger a polling within
>>> the gdsc driver.
>> Trigger the polling made me think initially that we will actually
>> trigger something in the HW. Instead the client uses reset framework to
>> poll for the gdsc to be reset.
Yes. I should replace 'trigger' with 'start' here.

-Akhil.
>>
>>> This series is rebased on top of linus's master branch.
>>>
>>> Related discussion: https://patchwork.freedesktop.org/patch/493144/
>>>
>>>
>>> Akhil P Oommen (5):
>>>     dt-bindings: clk: qcom: Support gpu cx gdsc reset
>>>     clk: qcom: Allow custom reset ops
>>>     clk: qcom: gpucc-sc7280: Add cx collapse reset support
>>>     clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>>>     arm64: dts: qcom: sc7280: Add Reset support for gpu
>>>
>>>    arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>>>    drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>>>    drivers/clk/qcom/gdsc.h                       |  7 +++++++
>>>    drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>>>    drivers/clk/qcom/reset.c                      |  6 ++++++
>>>    drivers/clk/qcom/reset.h                      |  2 ++
>>>    include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>>>    7 files changed, 46 insertions(+), 4 deletions(-)
>>>
>>
>> --
>> With best wishes
>> Dmitry

