Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65457D0A8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 18:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91E10E766;
	Thu, 21 Jul 2022 16:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8DA10E2E6;
 Thu, 21 Jul 2022 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658419488; x=1689955488;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=yb4FZU2sS2ec3vg0Ki3FrlpdsmD+gWNYDrl+E3MSovU=;
 b=ZY3aB3P2f9yuLoBzPsOSM/gdwBrHbzoU3YApNen2ILyNBmk0DnUPjG+K
 wO7PheNIFU9ANpdZU5oGAwZprYOlDDKQCJhymZWm3Z1TQV3jvT5+stLQu
 fiQFQzWU6YYBTjXWjKVe6XhLw+RUT5x4t7l9yg6W+ysfPoue6HM1W3esh A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Jul 2022 09:04:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 09:04:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Jul 2022 09:04:45 -0700
Received: from [10.216.44.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 21 Jul
 2022 09:04:39 -0700
Message-ID: <1e39d008-f8e5-eea5-90f4-78293bf2c580@quicinc.com>
Date: Thu, 21 Jul 2022 21:34:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>, Stephen Boyd
 <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, Taniya Das
 <quic_tdas@quicinc.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
 <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
 <c022538d-c616-8f1a-e1c2-c11b5f0de670@quicinc.com>
 <e4dcdd8d-18a9-8da3-7ac3-6cc792139f70@quicinc.com>
 <CAE-0n52TG3hsytN5nRU7W=S6PffSj8yQDmuicN0-qxoW-jxiZQ@mail.gmail.com>
 <0c050434-27ca-1099-d93d-8ad6ace3396e@quicinc.com>
 <CAE-0n53J=dADDTrydVuNZzw38dW_-+Baf8cfn0Q6DSVX_6cLNg@mail.gmail.com>
 <b6ab023b-601d-1df2-b04b-af5961b73bea@quicinc.com>
 <698d3279-6a02-9b1e-a3bd-627b6afbc57e@quicinc.com>
In-Reply-To: <698d3279-6a02-9b1e-a3bd-627b6afbc57e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/2022 11:34 AM, Akhil P Oommen wrote:
> On 7/19/2022 3:26 PM, Rajendra Nayak wrote:
>>
>>
>> On 7/19/2022 12:49 PM, Stephen Boyd wrote:
>>> Quoting Akhil P Oommen (2022-07-18 23:37:16)
>>>> On 7/19/2022 11:19 AM, Stephen Boyd wrote:
>>>>> Quoting Akhil P Oommen (2022-07-18 21:07:05)
>>>>>> On 7/14/2022 11:10 AM, Akhil P Oommen wrote:
>>>>>>> IIUC, qcom gdsc driver doesn't ensure hardware is collapsed 
>>>>>>> since they
>>>>>>> are vote-able switches. Ideally, we should ensure that the hw has
>>>>>>> collapsed for gpu recovery because there could be transient 
>>>>>>> votes from
>>>>>>> other subsystems like hypervisor using their vote register.
>>>>>>>
>>>>>>> I am not sure how complex the plumbing to gpucc driver would be 
>>>>>>> to allow
>>>>>>> gpu driver to check hw status. OTOH, with this patch, gpu driver 
>>>>>>> does a
>>>>>>> read operation on a gpucc register which is in always-on domain. 
>>>>>>> That
>>>>>>> means we don't need to vote any resource to access this register.
>>>
>>> Reading between the lines here, you're saying that you have to read the
>>> gdsc register to make sure that the gdsc is in some state? Can you
>>> clarify exactly what you're doing? And how do you know that something
>>> else in the kernel can't cause the register to change after it is read?
>>> It certainly seems like we can't be certain because there is voting
>>> involved.
> From gpu driver, cx_gdscr.bit[31] (power off status) register can be 
> polled to ensure that it *collapsed at least once*. We don't need to 
> care if something turns ON gdsc after that.
>
>>
>> yes, this looks like the best case effort to get the gpu to recover, but
>> the kernel driver really has no control to make sure this condition can
>> always be met (because it depends on other entities like hyp, 
>> trustzone etc right?)
>> Why not just put a worst case polling delay?
>
> I didn't get you entirely. Where do you mean to keep the polling delay?
>>
>>>
>>>>>>>
>>>>>>> Stephen/Rajendra/Taniya, any suggestion?
>>>>> Why can't you assert a gpu reset signal with the reset APIs? This 
>>>>> series
>>>>> seems to jump through a bunch of hoops to get the gdsc and power 
>>>>> domain
>>>>> to "reset" when I don't know why any of that is necessary. Can't we
>>>>> simply assert a reset to the hardware after recovery completes so the
>>>>> device is back into a good known POR (power on reset) state?
>>>> That is because there is no register interface to reset GPU CX domain.
>>>> The recommended sequence from HW design folks is to collapse both 
>>>> cx and
>>>> gx gdsc to properly reset gpu/gmu.
>>>>
>>>
>>> Ok. One knee jerk reaction is to treat the gdsc as a reset then and
>>> possibly mux that request along with any power domain on/off so that if
>>> the reset is requested and the power domain is off nothing happens.
>>> Otherwise if the power domain is on then it manually sequences and
>>> controls the two gdscs so that the GPU is reset and then restores the
>>> enable state of the power domain.
> It would be fatal to asynchronously pull the plug on CX gdsc 
> forcefully because there might be another gpu/smmu driver thread 
> accessing registers in cx domain.
>
> -Akhil.
>
But, we can move the cx collapse polling to gpucc and expose it to gpu 
driver using 'reset' framework. I am not very familiar with clk driver, 
but I did a rough prototype here (untested): 
https://zerobin.net/?d34b5f958be3b9b8#NKGzdPy9fgcuOqXZ/XqjI7b8JWcivqe+oSTf4yWHSOU=

If this approach is acceptable, I will send it out as a separate series.

-Akhil.
