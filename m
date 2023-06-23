Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5773AD91
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511A810E5C0;
	Fri, 23 Jun 2023 00:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB1210E0A1;
 Fri, 23 Jun 2023 00:02:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MNuDkM021898; Fri, 23 Jun 2023 00:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=udIIYlI6EIvzHrY5eGLUj5OyqjSPX9bIwoP4FpcqHak=;
 b=cnXca3q8Kb7kNlaTkfbID6RJxao96PsHrsRdheFjcacdSpakKgRSzEl6sVqiVmrJASbc
 wAYHr0UrTe7gZq+5mhR10EdU8BDdvB54LCk1BagAymeqz754eDBeBtWaXWZDZNkLMbwd
 8ixD6mE3jSXZSK4o5N1wTJpy9yvFBRoIyHINklMWF4kh3KVcXnM/l+pOWIKoJ1bX7Vkf
 FMdR+VTrthj1xruZlBPhNi6OrPYhjKK3WT9luJ3kpcpxOdEdtNyZM00bIKwB19qrYwyb
 eZgTvioNOhw1TeNohN9UdhCcpJz0vVel5FHJ0cgebw0gWAg6nYir+XQ9a8UqoC4uR67y Dg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc6b2bgay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 00:02:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35N01aOQ015915
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 00:01:36 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 17:01:35 -0700
Message-ID: <cf968ab4-e4c4-dcad-f7d1-4edff6f08147@quicinc.com>
Date: Thu, 22 Jun 2023 17:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dsi: Enable DATABUS_WIDEN for DSI
 command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-3-c7069f2efca1@quicinc.com>
 <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ky7sgsaohak2pcdf6pbhedfyrwk4ea7y3ekfqlw7rn6cpk4rhe@rjuhb23n37oz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HP5nHhaseBcxF2se_bo6Vl9SfLqc38Z1
X-Proofpoint-GUID: HP5nHhaseBcxF2se_bo6Vl9SfLqc38Z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_18,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=923 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220206
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2023 2:56 AM, Marijn Suijten wrote:
> On 2023-06-13 18:57:13, Jessica Zhang wrote:
>> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
>> 48 bits of compressed data per pclk instead of 24.
>>
>> For all chipsets that support this mode, enable it whenever DSC is
>> enabled as recommend by the hardware programming guide.
>>
>> Only enable this for command mode as we are currently unable to validate
>> it for video mode.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>
>> Note: The dsi.xml.h changes were generated using the headergen2 script in
>> envytools [1], but the changes to the copyright and rules-ng-ng source file
>> paths were dropped.
>>
>> [1] https://github.com/freedreno/envytools/
> 
> More interesting would be a link to the Mesa MR upstreaming this
> bitfield to dsi.xml [2] (which I have not found on my own yet).
> 
> [2]: https://gitlab.freedesktop.org/mesa/mesa/-/blame/main/src/freedreno/registers/dsi/dsi.xml
> 

Thats because we havent submitted a MR yet for this on mesa.

Generally, our team does not have legal permissions yet for mesa MRs 
other than mesa drm because we got permissions for the modetest.

Rob/Dmitry, can one of you pls help with the corresponding mesa MR for this?

The xml file change was autogenerated so this patch can go in.

>>   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++++++-
>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> index a4a154601114..2a7d980e12c3 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
>> @@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
>>   	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
>>   }
>>   #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
>> +#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
>>
>>   #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
>>   #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 5d7b4409e4e9..1da5238e7105 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -927,6 +927,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   	u32 hdisplay = mode->hdisplay;
>>   	u32 wc;
>>   	int ret;
>> +	bool widebus_supported = msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
>> +			msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0;
>> +
>>
>>   	DBG("");
>>
>> @@ -973,8 +976,15 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		 *
>>   		 * hdisplay will be divided by 3 here to account for the fact
>>   		 * that DPU sends 3 bytes per pclk cycle to DSI.
>> +		 *
>> +		 * If widebus is supported, set DATABUS_WIDEN register and divide hdisplay by 6
>> +		 * instead of 3
> 
> So this should allow us to divide pclk by 2, or have much lower latency?
> Otherwise it'll tick enough times to transmit the data twice.
> 
> Note that I brought up the exact same concerns when you used the 3:1
> ratio from dsi_bpp / dsc_bpp in your pclk reduction patch (instad of the
> number of bits/bytes that DPU sends to DSI per pclk), but no-one has
> replied to my inquiry yet.
> 

Ideally yes, we could have done pclk/2 on uncompressed pixels but we are 
not going to add support for widebus on DSI without DSC as that is not 
recommended in our docs.

So this cannot be done.

We tried our best to respond and explain to all your queries both on the 
bug and the patch but i guess it just kept coming :)

I am going to try one more time to explain it in the documentation change.

>>   		 */
>> -		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>> +		if (!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) && widebus_supported)
>> +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 6);
>> +		else
>> +			hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 
> Nit: I wonder if this is more concise when written as:
> 
>      u32 bytes_per_pclk;
>      ...
>      if (!video && widebus)
>          bytes_per_pclk = 6;
>      else
>          bytes_per_pclk = 3;
> 
>      hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc),
>                              bytes_per_pclk);
> 
> That is less duplication, **and** the value becomes self-documenting!
> 

Sure, no concerns with making this change.

>> +
>>   		h_total += hdisplay;
>>   		ha_end = ha_start + hdisplay;
>>   	}
>> @@ -1027,6 +1037,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>>   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>>   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
>> +
>> +		if (msm_host->dsc && widebus_supported) {
> 
> Can we also support widebus for uncompressed streams (sending 2 pixels
> of bpp=24 per pclk), and if so, is that something you want to add in the
> future (a comment would be nice)?

No, we cannot support widebus on uncompressed streams on DSI so we wont 
be adding that.

> 
>> +			u32 mdp_ctrl2 = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
>> +
>> +			mdp_ctrl2 |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
>> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, mdp_ctrl2);
>> +		}
> 
> Same comment as on your BURST_MODE patch (which this'll conflict with):
> does this belong to the timing setup or is it better moved to
> dsi_ctrl_config?
> 
> - Marijn
> 
>>   	}
>>   }
>>
>>
>> --
>> 2.40.1
>>
