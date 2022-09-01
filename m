Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174335AA0CE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 22:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4EB10E225;
	Thu,  1 Sep 2022 20:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB80310E213;
 Thu,  1 Sep 2022 20:20:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281JHjfq011034;
 Thu, 1 Sep 2022 20:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7NdMKjCGr0VH2jWf99Ve+nXSQZagUgzEpQTAIP2HZc4=;
 b=N7MQ++j1zzlVZo+jZzD9xTnA9UPKT4OqxhshqBUvwERux2q0HtbTU0ySNxJ0pCRSmr/v
 NPjQPQNs4/1EiDFY9k5yj6VVTEsZJwhOWz+L8NVNHLIHcIHI0ECwT+noBQTLQXprShlL
 UPgAm0Ub+Nx/t4SPhs0Dpvk49B3uiGzo1g7TaZZLrWRDa3goP5C5sbRB5WnFXDyTUmTD
 kq/XDrr7L3V9bFS0SVL79vjEA467uo3B6s9KRzatXMFQ5aeLs5Gov6JEv2gZ5rcAxpyz
 0IPwNNaVC3L6hBpl8QU7tm9qzeVYRcjx3XlzKG+TOlqmMb1vvjGGQrAAhgkGqcU+otlt VA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ja79knp0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 20:20:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281KKGrn004976
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 20:20:16 GMT
Received: from [10.216.21.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 13:20:11 -0700
Message-ID: <2339be29-c35a-67a4-8e98-daf247dd77dd@quicinc.com>
Date: Fri, 2 Sep 2022 01:50:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v6 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
 <20220901102817.GB32271@pengutronix.de>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220901102817.GB32271@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RrxUfKEOlK-krrFliA-9F3YbRt6ORIds
X-Proofpoint-ORIG-GUID: RrxUfKEOlK-krrFliA-9F3YbRt6ORIds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010088
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2022 3:58 PM, Philipp Zabel wrote:
> On Wed, Aug 31, 2022 at 10:48:24AM +0530, Akhil P Oommen wrote:
>> Add a reset op compatible function to poll for gdsc collapse.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> (no changes since v2)
>>
>> Changes in v2:
>> - Minor update to function prototype
>>
>>   drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>>   drivers/clk/qcom/gdsc.h |  7 +++++++
>>   2 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 44520ef..2d0f1d1 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/reset-controller.h>
>>   #include <linux/slab.h>
>>   #include "gdsc.h"
>> +#include "reset.h"
>>   
>>   #define PWR_ON_MASK		BIT(31)
>>   #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
>> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>>   	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>>   }
>>   
>> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
>> +		s64 timeout_us, unsigned int interval_ms)
>>   {
>>   	ktime_t start;
>>   
>> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>>   	do {
>>   		if (gdsc_check_status(sc, status))
>>   			return 0;
>> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
>> +		if (interval_ms)
>> +			msleep(interval_ms);
>> +	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
> Could this loop be implemented with read_poll_timeout()?
I felt it is not worth the code churn. Currently, we hit this path only 
during GPU recovery which is a rare event.
>
>>   	if (gdsc_check_status(sc, status))
>>   		return 0;
>> @@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>>   		udelay(1);
>>   	}
>>   
>> -	ret = gdsc_poll_status(sc, status);
>> +	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>>   	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>>   
>>   	if (!ret && status == GDSC_OFF && sc->rsupply) {
>> @@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
>>   		 */
>>   		udelay(1);
>>   
>> -		ret = gdsc_poll_status(sc, GDSC_ON);
>> +		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>>   		if (ret)
>>   			return ret;
>>   	}
>> @@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> +
>> +int gdsc_wait_for_collapse(void *priv)
>> +{
>> +	struct gdsc *sc = priv;
>> +	int ret;
>> +
>> +	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
>> +	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
> Superficially, using this as a reset op seems like abuse of the reset
> controller API. Calling reset_control_reset() on this in the GPU driver
> will not trigger a reset signal on the GPU's "cx_collapse" reset input.
>
> So at the very least, this patchset should contain an explanation why
> this is a good idea regardless, and how this is almost a reset control.
>
> I have read the linked discussion, and I'm not sure I understand all
> of it, so please correct me if I'm wrong: There is some other way to
> force the GDSC into a state that will eventually cause a GPU reset, and
> this is just the remaining part to make sure that the workaround dance
> is finished?
>
> If so, it should be explained that this depends on something else to
> actually indirectly trigger the reset, and where this happens.

Let me clarify a bit. In Qcom gpu subsystem, power collapse is the only 
way to properly reset the cx domain. Power collapse is a bit complex 
here because multiple subsystems/drivers can keep a vote on the 
regulator which blocks power collapse. So we remove the vote from gpu 
driver and poll (with a reasonable timeout obviously) until everyone 
removes their vote and gdsc collapses.

I suppose generally a reset implementation would look like this:

reset {
         Step 1: Trigger a reset pulse
         Step 2: Wait/poll for reset to complete
}

We skip step1 because we don't have a way to force it during gpu reset. 
Instead of that, we just remove the gdsc vote from the gpu driver. So 
all that is left to do here is step 2.

Like you suggested, I think it would be better if we document this in 
patch 4.

Thanks for the review. Please let me know if you have any feedback.

-Akhil.
>
> regards
> Philipp

