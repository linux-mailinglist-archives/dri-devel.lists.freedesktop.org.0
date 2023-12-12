Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF880F43F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044110E61E;
	Tue, 12 Dec 2023 17:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6C10E61E;
 Tue, 12 Dec 2023 17:17:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCH62MV023003; Tue, 12 Dec 2023 17:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=hBDbpoMatSnLVbcj80k8t1w+6Q2nyJMKgtB38AzFUJ8=; b=R9
 dtzSGB918gdNNjh7e5vfwqSH2I5593BV68g1/cCSt+WhY23Dx6ExIUzCIeAkTtN6
 yw7MgNlAzHGdcYihvu+k7jii3HE335E/+YRHCRVv4i9nRaEqH+dH4taK6DrmfGLD
 gLo1S/lOGaP6FaiN9H1zk22vGIQJTjuhrymWU5dlouRtwFa96KUXg4a/rFn+eut8
 FNzYdlCHTHoigctMiqX5FWXVKlQ5HrNtW3gfeLON3kL0/wf2f0p65lBC16L8Lcqi
 auWR8QxnwOvBGeaHgUBE7Yb4qed3tVFyx9icznWWL8Zs2tUa/zxRU7u9cgPygXvu
 Z0YFHCnAssWNNpNPlUkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxru2ghtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 17:17:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCHH1hJ001880
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 17:17:01 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 09:17:00 -0800
Message-ID: <59304cf8-33b7-bf27-f9e2-a15e323c869a@quicinc.com>
Date: Tue, 12 Dec 2023 09:16:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: add formats check for writeback
 encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-2-quic_abhinavk@quicinc.com>
 <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PTGBhOdYEvx3Uwk0MYpCvXsN3SXwF_db
X-Proofpoint-ORIG-GUID: PTGBhOdYEvx3Uwk0MYpCvXsN3SXwF_db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120133
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/11/2023 10:40 PM, Dmitry Baryshkov wrote:
> On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> In preparation for adding more formats to dpu writeback add
>> format validation to it to fail any unsupported formats.
>>
>> changes in v3:
>>          - rebase on top of msm-next
>>          - replace drm_atomic_helper_check_wb_encoder_state() with
>>            drm_atomic_helper_check_wb_connector_state() due to the
>>            rebase
>>
>> changes in v2:
>>          - correct some grammar in the commit text
>>
>> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index bb94909caa25..425415d45ec1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>>   {
>>          struct drm_framebuffer *fb;
>>          const struct drm_display_mode *mode = &crtc_state->mode;
>> +       int ret;
>>
>>          DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>>                          phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
>> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>>                  return -EINVAL;
>>          }
>>
>> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
>> +       if (ret < 0) {
>> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
>> +               return ret;
>> +       }
> 
> There is no guarantee that there will be no other checks added to this
> helper. So, I think this message is incorrect. If you wish, you can
> promote the level of the message in the helper itself.
> On the other hand, we rarely print such messages by default. Most of
> the checks use drm_dbg.
> 

hmm...actually drm_atomic_helper_check_wb_connector_state() already has 
a debug message to indicate invalid pixel formats.

You are right, i should perhaps just say that "atomic_check failed" or 
something.

I can make this a DPU_DEBUG. Actually I didnt know that we are not 
supposed to print out atomic_check() errors. Is it perhaps because its 
okay for check to fail?

But then we would not know why it failed.

>> +
>>          return 0;
>>   }
>>
>> --
>> 2.40.1
>>
> 
> 
