Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61770CC52
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C15410E0CE;
	Mon, 22 May 2023 21:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D37810E07E;
 Mon, 22 May 2023 21:27:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MLOJLj016838; Mon, 22 May 2023 21:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XfMUpFmOjVyWxbr9dEJleDJVqrKp1LR2als40FWu/+4=;
 b=n9WVtxOKR9suDSbhhLupbhC36omj+tCmIxMNSFJDBfAzQ/D6upZ0eliJzLO9JaC2iGBt
 0TXjN732D1wkOc4l9od4rtuWoV0aSRp9Pagq1DXIgxOAcu4YRegmULXxyxQ7fgDjMy+X
 sMisvs4OlOnwl8WF1hT79gfEbQFQ+gL5VseOym607W/SbaMxtzkR4TGW6/szT0B1T1XT
 wPPhFN10cdCp96fZEatjJCgdDXTNo6OHZzKQoBe4CnLeVfigPuFJTrkI1R4K4yMLwNUZ
 ZzKIFDgjhcerCp0CRFepVZQXAa9rScqHil6RFe5Qke/B5c030atae6poxKok1uEBobdU Qw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qraasrsu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:27:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLR2Lf015531
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:27:02 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 14:27:02 -0700
Message-ID: <dcf308a8-2ba7-4932-9bfd-a019dc473fc4@quicinc.com>
Date: Mon, 22 May 2023 14:27:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/5] drm/msm/dsi: Remove incorrect references to
 slice_count
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-5-15daf84f8dcb@quicinc.com>
 <r3xfucsag7odjsmpdys2aibairgvocqrgg6inpcdr2yoz2ktkd@c24h7frzzzkj>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <r3xfucsag7odjsmpdys2aibairgvocqrgg6inpcdr2yoz2ktkd@c24h7frzzzkj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: M1oh7kCNJRqgbdNGSbQFhsfvGYN7gTWn
X-Proofpoint-ORIG-GUID: M1oh7kCNJRqgbdNGSbQFhsfvGYN7gTWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220181
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/22/2023 2:01 PM, Marijn Suijten wrote:
> On 2023-05-22 13:30:24, Jessica Zhang wrote:
>> Currently, slice_count is being used to calculate word count and
>> pkt_per_line. Instead, these values should be calculated using slice per
>> packet, which is not the same as slice_count.
>>
>> Slice count represents the number of soft slices per interface, and its
>> value will not always match that of slice per packet. For example, it is
>> possible to have cases where there are multiple soft slices per interface
>> but the panel specifies only one slice per packet.
> 
> As discussed in many patches before, there is no definition of "soft
> slices" anyhwere.  Unless we can have that, and reference it, this
> should more clearly explain what it means or leave out the word "soft"
> altogether.

Hi Marijn,

Acked.

> 
>> Thus, use the default value of one slice per packet and remove slice_count
>> from the aforementioned calculations.
>>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 26 ++++++++++++++++----------
>>   1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index d04f8bbd707d..2eed99afdba9 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -866,18 +866,17 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>   	 */
>>   	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>>   
>> -	/*
>> -	 * If slice_count is greater than slice_per_intf
>> -	 * then default to 1. This can happen during partial
>> -	 * update.
>> -	 */
>> -	if (dsc->slice_count > slice_per_intf)
>> -		dsc->slice_count = 1;
>> -
>>   	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>   
>>   	eol_byte_num = total_bytes_per_intf % 3;
>> -	pkt_per_line = slice_per_intf / dsc->slice_count;
>> +
>> +	/*
>> +	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
>> +	 *
>> +	 * Since the current driver only supports slice_per_pkt = 1,
>> +	 * pkt_per_line will be equal to slice per intf for now.
>> +	 */
>> +	pkt_per_line = slice_per_intf;
>>   
>>   	if (is_cmd_mode) /* packet data type */
>>   		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>> @@ -1001,7 +1000,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		if (!msm_host->dsc)
>>   			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>   		else
>> -			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
>> +			/*
>> +			 * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
>> +			 * Currently, the driver only supports default value of slice_per_packet = 1
>> +			 *
>> +			 * TODO: Expand mipi_dsi_device struct to hold slice_per_packet info
>> +			 *       and adjust DSC math to account for slice_per_packet.
>> +			 */
> 
> Either rename this all to slice_per_pkt, or rename the above comment to
> slice_per_packet.

Acked.

Thanks,

Jessica Zhang

> 
> After improving on that:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> We all learned the wrong thing initially, thanks for clearing up that
> slice_count != slice_per_pkt.
> 
> - Marijn
> 
>> +			wc = msm_host->dsc->slice_chunk_size + 1;
>>   
>>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>
>> -- 
>> 2.40.1
>>
