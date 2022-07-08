Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E456C125
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65510E3CA;
	Fri,  8 Jul 2022 19:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAECF10E3DA;
 Fri,  8 Jul 2022 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657310373; x=1688846373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z3S8LBSAP0HBukacXxi+GtrkoslT8kcOp4684YGHXQg=;
 b=ErH8j7uErDQ8QSNqoopF3AJHVYdqmQx/zjnLJGu80HRmD4mQhZP7uUyx
 R39wNeEP9KWgfH2mdJQgPlFeVozxumvhcHJB4QDM81ApVzyyg5aDtVRNK
 BGAy3SwBLMyhi/YRU+AhbzSWOizBFjWEVXiCUUncsX8sZB2wBZE5hgGEJ A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 08 Jul 2022 12:59:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 12:59:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 12:58:51 -0700
Received: from [10.111.160.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 12:58:48 -0700
Message-ID: <8480c85e-b428-78a5-932e-cdf32dffc07a@quicinc.com>
Date: Fri, 8 Jul 2022 12:58:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>, "Bjorn
 Andersson" <bjorn.andersson@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
 <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
 <b8ee5a03-1168-d5ca-97fe-f82a9d7e453e@linaro.org>
 <CAE-0n52YGDOSZpL+3d=_APsOwVvrJG7uR-x1AcsBej5KrDct5w@mail.gmail.com>
 <eb22ae44-b347-1566-939a-4ca840688f07@quicinc.com>
 <CAE-0n51YV7Oo1HSsoyL-9F=h_wVZh210cScB55qLDD9CM2vXKg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51YV7Oo1HSsoyL-9F=h_wVZh210cScB55qLDD9CM2vXKg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2022 12:51 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-07-08 12:38:09)
>> + kuogee
>>
>> On 7/8/2022 12:27 PM, Stephen Boyd wrote:
>>>
>>> Yes I see the same address for P1 on sc7280. Maybe it's a typo? Abhinav,
>>> can you confirm?
>>
>> P1 block does exist on sc7280 and yes its address is same as the address
>> mentioned in sc7180. So its not a typo.
> 
> Thanks!
> 
>>
>> Yes, we are not programming this today but I would prefer to keep this
>> as optional.
>>
>> I did sync up with Kuogee on this change this morning, we will check a
>> few things internally on the P1 block's usage as to which use-cases we
>> need to program it for and update here.
>>
>> The idea behind having this register space listed in the yaml is thats
>> how the software documents have the blocks listed so dropping P1 block
>> just because its unused seemed wrong to me. Optional seems more appropriate.
>>
> 
> It doesn't sound optional on sc7180 or sc7280. It exists in the
> hardware, so we should list the reg property. My understanding of
> optional properties is for the case where something could be different
> in the hardware design, like an optionally connected pin on a device.

Ack, if thats the purpose of optional, then we should keep it and yes 
lets drop this change.
