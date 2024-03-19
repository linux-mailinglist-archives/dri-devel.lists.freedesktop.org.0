Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB088061D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 21:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F510E4BF;
	Tue, 19 Mar 2024 20:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Arr5SDYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209CD10E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 20:39:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42JJr4Xh032632; Tue, 19 Mar 2024 20:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=t1qE6+moL4iuSfPwSLEX2mbUHcHQ6A1uCNNElJU+66g=; b=Ar
 r5SDYa6ZXn6papoWdUucp1f/mwvxoqQdApI21txjMpigBmSwh8A+yZui8R0dvq+I
 5XcQqWLbYu1EFYoyYyDrWK2yFfqDZotGeaa7260ObFDQXShQeYuSpkrGXaHGe0GK
 WYfeEGz73HO9MD5CUShdXgzwfvwQEiBUUk9h+uTXwkZV8J/TAUq7H3EH0A5QfLrG
 aQjUjOSaVSB7SluaqnKpacOETpnkUGy5SGr4SOgCDbn/rCYUhCBqli+3sOAd5nBA
 ef7YfMTvqs0Z5u4ByvyykTYVohl8sngwDyLLftRllBc/HxPYKI3CsPudo9q+cB2+
 +/Og9I4tw5+h1BBtm4rw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wye5n8m6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 20:39:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JKd2Ou004994
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 20:39:02 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 13:38:58 -0700
Message-ID: <977f647a-fc30-d9c9-f973-fd8bd9a4020a@quicinc.com>
Date: Tue, 19 Mar 2024 13:38:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Douglas Anderson <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, Mikko
 Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, Jani Nikula
 <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com>
 <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
 <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gM8Liy4iHujsTpgr4gKQrxJDa7mOzlR5
X-Proofpoint-ORIG-GUID: gM8Liy4iHujsTpgr4gKQrxJDa7mOzlR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190159
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



On 3/19/2024 1:16 PM, Dmitry Baryshkov wrote:
> On Tue, 19 Mar 2024 at 21:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/19/2024 11:35 AM, Dmitry Baryshkov wrote:
>>> On Tue, 19 Mar 2024 at 20:15, Douglas Anderson <dianders@chromium.org> wrote:
>>>>
>>>> In response to my patch removing the "wait for HPD" logic at the
>>>> beginning of the MSM DP transfer() callback [1], we had some debate
>>>> about what the "This is an optional function" meant in the
>>>> documentation of the wait_hpd_asserted() callback. Let's clarify.
>>>>
>>>> As talked about in the MSM DP patch [1], before wait_hpd_asserted()
>>>> was introduced there was no great way for panel drivers to wait for
>>>> HPD in the case that the "built-in" HPD signal was used. Panel drivers
>>>> could only wait for HPD if a GPIO was used. At the time, we ended up
>>>> just saying that if we were using the "built-in" HPD signal that DP
>>>> AUX controllers needed to wait for HPD themselves at the beginning of
>>>> their transfer() callback. The fact that the wait for HPD at the
>>>> beginning of transfer() was awkward/problematic was the whole reason
>>>> wait_hpd_asserted() was added.
>>>>
>>>> Let's make it obvious that if a DP AUX controller implements
>>>> wait_hpd_asserted() that they don't need a loop waiting for HPD at the
>>>> start of their transfer() function. We'll still allow DP controllers
>>>> to work the old way but mark it as deprecated.
>>>>
>>>> [1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid
>>>>
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>> I would consider changing the docs to say that implementing
>>>> wait_hpd_asserted() is actually _required_ for any DP controllers that
>>>> want to support eDP panels parented on the DP AUX bus. The issue is
>>>> that one DP controller (tegra/dpaux.c, found by looking for those that
>>>> include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
>>>> doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
>>>> this work on tegra since I also don't see any delay loop for HPD in
>>>> tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
>>>> optional and described the old/deprecated way things used to work
>>>> before wait_hpd_asserted().
>>>>
>>>>    include/drm/display/drm_dp_helper.h | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>>>> index a62fcd051d4d..b170efa1f5d2 100644
>>>> --- a/include/drm/display/drm_dp_helper.h
>>>> +++ b/include/drm/display/drm_dp_helper.h
>>>> @@ -422,7 +422,13 @@ struct drm_dp_aux {
>>>>            * @wait_hpd_asserted: wait for HPD to be asserted
>>>>            *
>>>>            * This is mainly useful for eDP panels drivers to wait for an eDP
>>>> -        * panel to finish powering on. This is an optional function.
>>>> +        * panel to finish powering on. It is optional for DP AUX controllers
>>>> +        * to implement this function but required for DP AUX endpoints (panel
>>>> +        * drivers) to call it after powering up but before doing AUX transfers.
>>>> +        * If a DP AUX controller does not implement this function then it
>>>> +        * may still support eDP panels that use the AUX controller's built-in
>>>> +        * HPD signal by implementing a long wait for HPD in the transfer()
>>>> +        * callback, though this is deprecated.
>>>
>>> It doesn't cover a valid case when the panel driver handles HPD signal
>>> on its own.
>>>
>>
>> This doc is only for wait_for_hpd_asserted(). If panel driver handles
>> HPD signal on its own, this will not be called. Do we need a doc for that?
> 
> This comment declares that this callback must be called by the panel
> driver: '...but required for DP AUX endpoints [...] to call it after
> powering up but before doing AUX transfers.'
> 
> If we were to follow documentation changes from this patch, we'd have
> to patch panel-edp to always call wait_for_hpd_asserted, even if HPD
> GPIO is used. However this is not correct from my POV.
> 

hmmm I dont mind explicitly saying "unless the panel can independently 
check the HPD state" but not required in my opinion because if panel was 
capable of checking the HPD gpio (its self-capable) why would it even 
call wait_for_hpd_asserted?

I will let you and Doug discuss this but fwiw, I am fine without this 
additional clarification. So the R-b stands with or without this 
additional clause.

>>>>            *
>>>>            * This function will efficiently wait for the HPD signal to be
>>>>            * asserted. The `wait_us` parameter that is passed in says that we
>>>> --
>>>> 2.44.0.291.gc1ea87d7ee-goog
>>>>
>>>
>>>
> 
> 
> 
