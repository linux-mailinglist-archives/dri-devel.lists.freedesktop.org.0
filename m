Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2B73ACD9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 01:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E2A10E023;
	Thu, 22 Jun 2023 23:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4076310E5B7;
 Thu, 22 Jun 2023 23:04:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MN4aLl006637; Thu, 22 Jun 2023 23:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gEVNUB1zcKbvjNqD3ckCwvagRn7rUtsTyD/VLkXlut8=;
 b=oe656xEn3clCXA6ZoZTwkx6OHK7jBOaRKuRo8Y2Y1jsvtX5BLQMDeMYnJUp7RfYsD0G1
 dUOwtVijU0xW40tclEEh5dyOflghG7BXUj5PMEGYvM70qMCygA33f9iO4d0hr/XrI7gP
 LdQrlTHWbcv0DKM0q376owAppKtwtjwmV+YUT+EKKNwPqax0bL/i82WLu1GVG0JyMtTp
 xjy+BZRHNE19z8vwkRe5xE9zR16PYD/+tcu+WH7G7NE54Bu5vj4rbN/cdw4CESRHLADU
 rU06kVOrMkrnVi2xGk6pkt9PFZyimq+bSCELT+mG1BjExQA+TAEpEMzxL+zeFwwsys8U iA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc359kxc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:04:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MN4Z6D010733
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 23:04:35 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 16:04:34 -0700
Message-ID: <e594fed4-fc01-477b-1e7c-d1d58e1a0dda@quicinc.com>
Date: Thu, 22 Jun 2023 16:04:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <3a6cc492-6b54-2c70-402e-995c0b003c01@linaro.org>
 <mfzmioovf54lcuiuzvk4fuz26elag6iw3ohbdhgym7k3qzirhx@dd7vu7ms6azz>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <mfzmioovf54lcuiuzvk4fuz26elag6iw3ohbdhgym7k3qzirhx@dd7vu7ms6azz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LgExeXWfvtnKZBj17sv02QKilZNuLY4w
X-Proofpoint-ORIG-GUID: LgExeXWfvtnKZBj17sv02QKilZNuLY4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220198
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
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2023 3:03 AM, Marijn Suijten wrote:
> On 2023-06-14 10:49:31, Dmitry Baryshkov wrote:
>> On 14/06/2023 04:57, Jessica Zhang wrote:
>>> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
>>> 48 bits of compressed data per pclk instead of 24.
>>>
>>> For all chipsets that support this mode, enable it whenever DSC is
>>> enabled as recommend by the hardware programming guide.
>>>
>>> Only enable this for command mode as we are currently unable to validate
>>> it for video mode.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>
>>> Note: The dsi.xml.h changes were generated using the headergen2 script in
>>> envytools [1], but the changes to the copyright and rules-ng-ng source file
>>> paths were dropped.
>>>
>>> [1] https://github.com/freedreno/envytools/
>>>
>>>    drivers/gpu/drm/msm/dsi/dsi.xml.h  |  1 +
>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++++++-
>>>    2 files changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>> index a4a154601114..2a7d980e12c3 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>>> @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>>>    	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>>>    }
>>>    #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
>>> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
>>>
>>>    #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
>>>    #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 5d7b4409e4e9..1da5238e7105 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -927,6 +927,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>    	u32 hdisplay = mode->hdisplay;
>>>    	u32 wc;
>>>    	int ret;
>>> +	bool widebus_supported = msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>>> +			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
>>> +
>>>
>>>    	DBG("");
>>>
>>> @@ -973,8 +976,15 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>    		 *
>>>    		 * hdisplay will be divided by 3 here to account for the fact
>>>    		 * that DPU sends 3 bytes per pclk cycle to DSI.
>>> +		 *
>>> +		 * If widebus is supported, set DATABUS_WIDEN register and divide hdisplay by 6
>>> +		 * instead of 3
>>
>> This is useless, it is already obvious from the code below. Instead
>> there should be something like "wide bus extends that to 6 bytes per
>> pclk cycle"
> 
> Yes please.  In general, don't paraphrase the code, but explain _why_ it
> is doing what it does.  Saying that the widebus feature doubles the
> bandwidth per pclk tick is much more clear than "divide by 6 instead of
> 3" - we can read that from the code.
> 
> Overall comments have been very good so far (such as the original "to
> account for the fact that DPU sends 3 bytes per pclk cycle"), though!
> 
>>>    		 */
>>> -		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>> +		if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) && widebus_supported)
>>> +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 6);
>>> +		else
>>> +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>> +
>>>    		h_total += hdisplay;
>>>    		ha_end = ha_start + hdisplay;
>>>    	}
>>> @@ -1027,6 +1037,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>    		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>>>    			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>>>    			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
>>> +
>>> +		if (msm_host->dsc && widebus_supported) {
>>> +			u32 mdp_ctrl2 = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
>>> +
>>> +			mdp_ctrl2 |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
>>> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, mdp_ctrl2);
>>
>> Is widebus applicable only to the CMD mode, or video mode can employ it too?
> 
> The patch description states that it was not tested on video-mode yet,
> so I assume it will.  But this should also be highlighted with a comment
> (e.g. /* XXX: Allow for video-mode once tested/fixed */), _especially_
> on the check for MIPI_DSI_MODE_VIDEO above.
>

Sure, we can leave a comment.


> If I understand this correctly DSC is not working for video mode at all
> on these setups, right?  Or no-one was able to test it?  I'm inclined to
> request dropping these artifical guards to have as little friction as
> possible when someone starts enabling and testing this - and less
> patches removing artificial bounds in the future.
> 

Noone was able to test it. Like I have said before, we dont have or have 
not brought up any DSI DSC panel with video mode. DP will be the first 
to validate the video mode path for DSC so even that time we cannot test 
DSI with DSC on video mode.

I think we should find a panel which supports cmd and video mode ( I 
believe one of the HDKs does have that ) and bring that one up first to 
validate this.

I believe we should keep this checks with the comment you have 
suggested. If someone tests it and then removes it, I am comfortable 
with that.

Till then, I would rather guard that configuration.

> - Marijn
