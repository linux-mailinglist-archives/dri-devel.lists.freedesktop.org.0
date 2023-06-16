Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3473378A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 19:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C26A10E122;
	Fri, 16 Jun 2023 17:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D892610E111;
 Fri, 16 Jun 2023 17:40:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GFpnp9009504; Fri, 16 Jun 2023 17:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=86D5yK9haAiJoVWC5YVv/Ei6Dy+jUUyFlwwgPuERXxU=;
 b=azTt0rrR6miSZO4mQUCTMrf2l91Sp4lEbdwMOok4EmEXG7U19cTDasqLEeyS56YxvUIH
 r7MCMXuXPHNfsO4k+DFpI1abxxmH/97QeHJ8aQZ6DA4pQlrK0GD8zE18Ur+NyEdYRomB
 rEG51x6GGFV8UUKHmQRK3flt3Om6Wexn8Fr9cyGvrrlsOgXODRtH+PEtNK2qlYGE47Cr
 UCaRy17E6eJF9v9zoDnok04D4HvG5Uagx9Om1fw1Y8f40m1AFQSEaedtcl89a55GwM5Z
 96p0xa3snawgRQeSY5lKkceC3SRFCsCu07R9LY3/n2D24bukUwusXDmL36QH4jHTPVkH JQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r8axuj324-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 17:40:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35GHeTrM001451
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 17:40:29 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 16 Jun
 2023 10:40:29 -0700
Message-ID: <1e1eacff-7859-e704-07e1-aec8379fa55d@quicinc.com>
Date: Fri, 16 Jun 2023 10:40:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/msm/dsi: Enable BURST_MODE for command mode for DSI
 6G v1.3+
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
 <o57lsyxwzz5ihqlzq4ewnlnevj36rrq44ohyaxm3htnxzmomxn@fuv2sa5frph3>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <o57lsyxwzz5ihqlzq4ewnlnevj36rrq44ohyaxm3htnxzmomxn@fuv2sa5frph3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 085KwEHL97kE7_p0XQRB9QJr4BsXhZzD
X-Proofpoint-GUID: 085KwEHL97kE7_p0XQRB9QJr4BsXhZzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 mlxlogscore=876 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160159
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2023 2:43 AM, Marijn Suijten wrote:
> On 2023-06-12 16:37:36, Jessica Zhang wrote:
>> During a frame transfer in command mode, there could be frequent
>> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
>> if the DSI controller is running on slow clock and is throttled. To
>> minimize frame latency due to these transitions, it is recommended to
>> send the frame in a single burst.
>>
>> This feature is supported for DSI 6G 1.3 and above, thus enable burst
>> mode if supported.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 744f2398a6d6..8254b06dca85 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -994,6 +994,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>>   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>>   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
>> +
>> +		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>> +				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
>> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2,
>> +					DSI_CMD_MODE_MDP_CTRL2_BURST_MODE);
> 
> This is not part of the timing setup, and a similar BURST_MODE flag is
> enabled for video-mode in dsi_ctrl_config() - should it be moved there?

Hi Marijn,

Sure, I can move the change to dsi_ctrl_enable() instead.

> 
> (There is a dsi_sw_reset() in between the calls to dsi_timing_setup()
>   and dsi_ctrl_cfg())
> 
> Note that that function sets up the CMD_CFG0 and CMD_CFG1 register, with
> the former having a very similar layout to MDP_CTRL2... is there
> documentation outlining the difference?

I see what you mean, but unfortunately I'm not able to give you any 
documentation about the differences between them.

FWIW, I think the macros in dsi.xml.h should give you a sense of what's 
within the registers and the slight differences between them.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>   	}
>>   }
>>   
>>
>> ---
>> base-commit: dd969f852ba4c66938c71889e826aa8e5300d2f2
>> change-id: 20230608-b4-add-burst-mode-a5bb144069fa
>>
>> Best regards,
>> -- 
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
