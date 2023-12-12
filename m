Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D41580FA2F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 23:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6271510E6B4;
	Tue, 12 Dec 2023 22:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B810E214;
 Tue, 12 Dec 2023 22:21:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCMFUNC025319; Tue, 12 Dec 2023 22:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=jWYvq0lPk1O+dbwc4Fr/alVnAmWxr57RBysJceZ7SaI=; b=a4
 8kClVEVybgUYlDXCHN6R6rbU813FuET103gXh3BiSnoRNLTwTNL4mfg/pURsmMAm
 0IpSyjQVU4Rf+hEoDC9g5MqvRVjA3IUoNxiUwgoOgLhePc5UO1ktc6qKzdE4xaXT
 sWrNi0Lp9C7RQoWTmld0PaAauNL3k4H33/BW5vf0moIb9cwqYArbcwN+84IUUf3E
 T75VKb4+jHF9olAJ3/cM2mKxAxM/kfbzW+66xrsXFrDvX8Ti1TvdaVHWUKF09n/i
 AfZH/QPNA8r9nN2F6IyMHijWr68zL7QdqBkWbSpyTbqAhiS8n5SIVvC82kBRhmRz
 mbi3ninQrn6h1Ec+AO4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux6533n4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 22:21:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCML24v013131
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 22:21:02 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 14:21:01 -0800
Message-ID: <80ac821a-bc7a-b293-cace-f977819e707a@quicinc.com>
Date: Tue, 12 Dec 2023 14:21:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback
 encoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-2-quic_abhinavk@quicinc.com>
 <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
 <CAA8EJpooSO3vR+Kp+XHgwOwQy43CKdUsOJOD3LiQ1LxbyW_39w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpooSO3vR+Kp+XHgwOwQy43CKdUsOJOD3LiQ1LxbyW_39w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: N_u7Wl7siR0Nrd6T482Jbvt7zLhsBn1F
X-Proofpoint-GUID: N_u7Wl7siR0Nrd6T482Jbvt7zLhsBn1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=993 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120174
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



On 12/12/2023 2:03 PM, Dmitry Baryshkov wrote:
> On Tue, 12 Dec 2023 at 23:30, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>
>>> In preparation for adding more formats to dpu writeback add
>>> format validation to it to fail any unsupported formats.
>>>
>>> changes in v4:
>>>          - change the failure message of the API
>>>            drm_atomic_helper_check_wb_connector_state() to a generic
>>>            one in case it checks more errors later and moreoever it
>>>            already has debug message to indicate its failure
>>>          - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
>>>            other atomic_check failure messages
>>>
>>> changes in v3:
>>>          - rebase on top of msm-next
>>>          - replace drm_atomic_helper_check_wb_encoder_state() with
>>>            drm_atomic_helper_check_wb_connector_state() due to the
>>>            rebase
>>>
>>> changes in v2:
>>>          - correct some grammar in the commit text
>>>
>>> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> index bb94909caa25..4953d87affa1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>>>   {
>>>          struct drm_framebuffer *fb;
>>>          const struct drm_display_mode *mode = &crtc_state->mode;
>>> +       int ret;
>>>
>>>          DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>>>                          phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
>>> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>>>                  return -EINVAL;
>>>          }
>>>
>>> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
>>> +       if (ret < 0) {
>>> +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);
>>
>> We already have a debug message in
>> drm_atomic_helper_check_wb_connector_state(). Can we please drop this
>> one?
> 
> If you don't mind, I can just drop it while applying
> 

Ack. Thank you.

>>
>>> +               return ret;
>>> +       }
>>> +
>>>          return 0;
>>>   }
>>>
>>> --
>>> 2.40.1
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry
> 
> 
> 
