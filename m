Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F87734C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 01:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31910E04F;
	Mon,  7 Aug 2023 23:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18D10E04F;
 Mon,  7 Aug 2023 23:17:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377NHUCx014259; Mon, 7 Aug 2023 23:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=haSdIhLP1n0o22iUyQvSxYEe4IEa2zpM2Fu5jd9vnpM=;
 b=n/+/FQR4rPVmR6FUPEEHHODK67P7nFqGUE8Xa1KbuMb9gq1tQ/ygv8mrRiG7YYogV6oH
 yhFDTPLxfT+wagk6AmnDZOTjv0x2fsnaXxx4ao5IXq/qxt89/2M3HoQWmEziJK/RHIzr
 qhYHrj4bkH5Vo3QSIWTMlOMUaAzJetak0WWQAWwyYqyp5eI38oZBvQXUQvgQkaP8sWX+
 bOeFAkI/KdVxsyclZCHIbjhGjkE+drM1R1kRQco84rhbAl6xl1KoUEOPFEHSYcQmYgbL
 9B5s33KoZ3PW/fIsMoIP3aU/X7tv7k0YCDn+RKVV+hW8cG8xaHKfcRMJDOQM6E/Fh5nR iQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sb9pqr1er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 23:17:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377NHTTQ027199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 23:17:29 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 16:17:29 -0700
Message-ID: <9918624f-184d-3ddc-189b-35b162ef5b18@quicinc.com>
Date: Mon, 7 Aug 2023 16:17:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/msm/dpu: Move DPU encoder wide_bus_en setting
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
 <20230802-add-widebus-support-v3-1-2661706be001@quicinc.com>
 <mdmxxxs5atqtunsast542fucmoewpvjjqj7bdhbs2yuzgv52ws@qbrdltjo3734>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <mdmxxxs5atqtunsast542fucmoewpvjjqj7bdhbs2yuzgv52ws@qbrdltjo3734>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PDO5iLTJru58BUDOHxWly-9v9KkB7aSC
X-Proofpoint-ORIG-GUID: PDO5iLTJru58BUDOHxWly-9v9KkB7aSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_25,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070209
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



On 8/2/2023 12:32 PM, Marijn Suijten wrote:
> I find this title very undescriptive, it doesn't really explain from/to
> where this move is happening nor why.
> 
> On 2023-08-02 11:08:48, Jessica Zhang wrote:
>> Move the setting of dpu_enc.wide_bus_en to
>> dpu_encoder_virt_atomic_enable() so that it mirrors the setting of
>> dpu_enc.dsc.
> 
> mirroring "the setting of dpu_enc.dsc" very much sounds like you are
> mirroring _its value_, but that is not the case.  You are moving the
> initialization (or just setting, because it could also be overwriting?)
> to _the same place_ where .dsc is assigned.

Hi Marijn,

Hmm.. got it. Will reword it to "mirror how dpu_enc.dsc is being set" if 
that makes it clearer.

> 
> I am pretty sure that this has a runtime impact which we discussed
> before (hotplug...?) but the commit message omits that.  This is
> mandatory.

I'm assuming the prior discussion you're referring to is with Kuogee on 
his DSC fix [1]. Unlike DSC, both DSI and DP know if wide bus is enabled 
upon initialization.

The main reasons the setting of the wide_bus_en flag was moved here were

1) to mirror how dpu_enc.dsc was being set (as stated in the commit 
message) as wide bus is related to DSC,

and 2) account for the possibility of DSC for DSI being set during 
runtime in the future.

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/patch/543867/

> 
> - Marijn
> 
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index d34e684a4178..3dcd37c48aac 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>   	struct dpu_encoder_virt *dpu_enc = NULL;
>>   	int ret = 0;
>>   	struct drm_display_mode *cur_mode = NULL;
>> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>> +	struct msm_display_info *disp_info;
>>   
>>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +	disp_info = &dpu_enc->disp_info;
>>   
>>   	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>>   
>> +	if (disp_info->intf_type == INTF_DP)
>> +		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>> +				priv->dp[disp_info->h_tile_instance[0]]);
>> +
>>   	mutex_lock(&dpu_enc->enc_lock);
>>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>>   
>> @@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>   	timer_setup(&dpu_enc->frame_done_timer,
>>   			dpu_encoder_frame_done_timeout, 0);
>>   
>> -	if (disp_info->intf_type == INTF_DP)
>> -		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>> -				priv->dp[disp_info->h_tile_instance[0]]);
>> -
>>   	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>>   			dpu_encoder_off_work);
>>   	dpu_enc->idle_timeout = IDLE_TIMEOUT;
>>
>> -- 
>> 2.41.0
>>
