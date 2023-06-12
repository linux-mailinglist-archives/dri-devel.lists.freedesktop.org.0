Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8372CC77
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 19:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505F210E0C7;
	Mon, 12 Jun 2023 17:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809E010E0C7;
 Mon, 12 Jun 2023 17:26:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CGtBGW019445; Mon, 12 Jun 2023 17:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OHfuioKkw0sSpQtX9200zS3CjcWSpGjjyhgTtDXGPmM=;
 b=iproMTiiq2fmZRyz4/qPhZhdMDQHP6+3hw21rySefMHqodZjQzkZ4ythgEKN3z7EjZB5
 /aDvsUE5h05zCj4CJbkCrVNIFrMNAxLROlNp8RZB0hLUTF4tZblYaxx5F3hWLfbREdcq
 QsoxaaT4AM4JsFG5kAqAtlc7r/cbqKY77J6bvNQiThwwZd0rt02a8kStkU8BntMkWNlZ
 M0C+95mewJKzG0bnPEtD9qYRTf9xl78GVwhvEcH9418Ur1Be3wfHcaMDTpYVQbm8/tkX
 xdUV/FL0YWjOk1sQINwbFMRP6zkmuu0y11NkKfSwNFmu1smH6B/Wp5XCQOwdIOc6mr4J Bw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4ehtv4w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 17:26:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CHQhBJ030448
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 17:26:43 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 12 Jun
 2023 10:26:41 -0700
Message-ID: <ffdaddd0-4f2b-7846-322b-8efeadf7ed0c@quicinc.com>
Date: Mon, 12 Jun 2023 10:26:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v6 6/6] drm/msm/dsi: Document DSC related
 pclk_rate and hdisplay calculations
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
 <6uiyqgggt2a3gkcihtyzr4rvq5igbe3ojpeiqnji22663bhh2l@3jifgk7bw4u5>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6uiyqgggt2a3gkcihtyzr4rvq5igbe3ojpeiqnji22663bhh2l@3jifgk7bw4u5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: e_XxNZDwJDINU3TH43jITT2yedyJgZ8k
X-Proofpoint-ORIG-GUID: e_XxNZDwJDINU3TH43jITT2yedyJgZ8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120150
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad
 Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/11/2023 3:03 PM, Marijn Suijten wrote:
> On 2023-06-09 15:57:18, Jessica Zhang wrote:
>> Add documentation comments explaining the pclk_rate and hdisplay math
>> related to DSC.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index fb1d3a25765f..aeaadc18bc7b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -564,6 +564,13 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>>   		const struct drm_dsc_config *dsc)
>>   {
>> +	/*
>> +	 * Adjust the pclk rate by calculating a new hdisplay proportional to
>> +	 * the compression ratio such that:
>> +	 *     new_hdisplay = old_hdisplay * target_bpp / source_bpp
>> +	 *
>> +	 * Porches need not be adjusted during compression.
>> +	 */
>>   	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>>   			dsc->bits_per_component * 3);
> 
> I won't reiterate my original troubles with this logic and the comment
> as that has well been described in v5 replies.
> 
> Just want to ask why this comment couldn't be added in patch 5/6
> immediately when the logic is introduced?  Now readers won't have a clue
> what is going on until they skip one patch ahead.
> 

Both myself and Dmitry discussed that in this particular case, we will 
add the documentation as a follow-up patch and merge it together. Not 
usually the process, but in this case, just decided to do it this way. 
The series will still be merged as one.

> Furthermore it is lacking any explanation that this is a workaround for
> cmd-mode, and that porches are currently used to represent "transfer
> time" until those calculations are implemented.  At that point there is
> no concept of "not adjusting porches for compressed signals" anymore.
> 

This is a much bigger topic and goes out of scope of this patch and 
series and I dont want to explain all that in this documentation patch.

If we explain that this is specific to command mode, what would the 
panel drivers fill out for porches . Obviously they cannot fill out a 0.

Coming to transfer time. Even if current panel drivers use 0 porches, 
the clock you get should still be sufficient for 60fps or a transfer 
time of 16.66ms.

Transfer time was a concept introduced for some specific command mode 
panels where we needed to finish transferring the frame even faster than 
16.66ms like 12ms or 13ms.

Yes, without that, upstream and downstream math doesnt match. But that 
doesnt mean its going to break the panels or that upstream math is 
wrong. If you think command mode porches should be 0, then this will 
give you the clk for 60fps. If you add some random porches, it will just 
give a faster clock.

Porches can be used instead of transfer time till we add that math but 
again, thats only needed for panels which need a faster transfer time 
than 16.66ms.

So we dont need to call this a workaround in my opinion at all (and hack 
as you called in v5 is totally out of proportion).

One could even argue that if the panel needs a transfer time faster than 
16.66ms, then the mode->clock should also be bumped up. Panels dont do 
that today either.

Hence, I am going to consider transfer time as an enhancement and not 
going to take that up in this series so I am not for adding that comment 
here.

And as I have explained, this patch is not a workaround either. Its just 
calculating the clock based on what we have today in the panel drivers.



>>   
>> @@ -961,6 +968,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   
>>   		/* Divide the display by 3 but keep back/font porch and
>>   		 * pulse width same
>> +		 *
>> +		 * hdisplay will be divided by 3 here to account for the fact
>> +		 * that DPU sends 3 bytes per pclk cycle to DSI.
>>   		 */
>>   		h_total -= hdisplay;
>>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 
> Still very glad to have this, thank you for adding it.  Note that it
> only further undermines the pclk adjustments, as I just explained in v5
> review.
> 
> - Marijn
> 
>>
>> -- 
>> 2.40.1
>>
