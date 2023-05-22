Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05F70C553
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBD410E1FD;
	Mon, 22 May 2023 18:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EFC10E1FF;
 Mon, 22 May 2023 18:38:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MIQcgs023090; Mon, 22 May 2023 18:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UEz1lUlshOosLPZ1HNDgWpxltrj31N+9nYNjETbjGNs=;
 b=Ls518YX8f3xIVq7ZvrAGzWpNSb05Q4A8f26kTAc+Z3qkoMBj0w5M9RDZJvrRkuw5eoIq
 f3yeB9c/LZ8342huq17W7CEzS7LNqASV/fU/wjJIfGMrGumYJN6X69Gy03sO5LFLzDmr
 8wMDiXI+75AkTJPkMDLb7E5TfxDWtOLZUzyAKj2qE5+zrChooslAScAjf5PdgetSQ46L
 BLj//uBB1v59Jl7/q9Bhjiul5Z7na8k77Dgs6vVy5e+rmt/Lf2Ec2A+gQ3tz4R07nkdt
 bkikQsdP3hUIrZnO22uF9c1fLnQ39wUudoGSs7cuy2hLu2EVRjtVx/s708FvpJyIkJLJ lg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qppkdmh3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:38:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MIciGN003423
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:38:44 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 11:38:44 -0700
Message-ID: <373d74d0-808a-15a9-b800-3dd40c313b85@quicinc.com>
Date: Mon, 22 May 2023 11:38:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/5] drm/msm/dsi: Remove incorrect references to
 slice_count
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
 <20230405-add-dsc-support-v3-5-6e1d35a206b3@quicinc.com>
 <1e77e954-570f-e995-ce79-99560fde8d34@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <1e77e954-570f-e995-ce79-99560fde8d34@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IQEkr5z_PzramIYIn3pdl5DV3Fk-45ga
X-Proofpoint-GUID: IQEkr5z_PzramIYIn3pdl5DV3Fk-45ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_13,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220157
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/20/2023 5:32 PM, Dmitry Baryshkov wrote:
> On 20/05/2023 00:17, Jessica Zhang wrote:
>> Currently, slice_count is being used to calculate word count and
>> pkt_per_line. In downstream, these values are calculated using slice per
>> packet, which is not the same as slice_count.
> 
> I'd say the reference to downstream is not correct. We have seen cases 
> where the vendor kernel contained errors. So it should be something like 
> "Instead these values should be calculated using ...."

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>>
>> Slice count represents the number of soft slices per interface, and its
>> value will not always match that of slice per packet. For example, it is
>> possible to have cases where there are multiple soft slices per interface
>> but the panel specifies only one slice per packet.
>>
>> Thus, use the default value of one slice per packet and remove 
>> slice_count
>> from the aforementioned calculations.
>>
>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>> compute word count")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index d04f8bbd707d..8c8858ee59ec 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -866,18 +866,15 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>        */
>>       slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>> -    /*
>> -     * If slice_count is greater than slice_per_intf
>> -     * then default to 1. This can happen during partial
>> -     * update.
>> -     */
>> -    if (dsc->slice_count > slice_per_intf)
>> -        dsc->slice_count = 1;
>> -
>>       total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>       eol_byte_num = total_bytes_per_intf % 3;
>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>> +
>> +    /*
>> +     * Default to 1 slice_per_pkt, so pkt_per_line will be equal to
>> +     * slice per intf.
>> +     */
>> +    pkt_per_line = slice_per_intf;
>>       if (is_cmd_mode) /* packet data type */
>>           reg = 
>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>> @@ -1001,7 +998,14 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>           if (!msm_host->dsc)
>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>           else
>> -            wc = msm_host->dsc->slice_chunk_size * 
>> msm_host->dsc->slice_count + 1;
>> +            /*
>> +             * When DSC is enabled, WC = slice_chunk_size * 
>> slice_per_packet + 1.
>> +             * Currently, the driver only supports default value of 
>> slice_per_packet = 1
>> +             *
>> +             * TODO: Expand mipi_dsi_device struct to hold 
>> slice_per_packet info
>> +             *       and adjust DSC math to account for 
>> slice_per_packet.
>> +             */
>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>
> 
> -- 
> With best wishes
> Dmitry
> 
