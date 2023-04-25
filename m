Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BB6EE9B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 23:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E506010E7EE;
	Tue, 25 Apr 2023 21:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700610E7EA;
 Tue, 25 Apr 2023 21:32:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PKOD8H028207; Tue, 25 Apr 2023 21:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qesPruZMwg/AWjJcdIXPKKRLXv2qzMPwoCTv5kuI/Zw=;
 b=ABndNEoDmukTPPPZP3W5lVVXWD11oPTuqnf+bWx3/3NF68Ok7seXT4RyrayedNexFGCe
 94Xpj51WHp8gqLI3xSKPm6hXBzGRisIlxirEuSkfZpBe316BbBe0vS1Bv+ENaUENIzMf
 f0a29El85kkswt85BIO7EysiqmeCcaDGxkJBqmZZwq+03d73+Md7Dob97s1lGgNzug5M
 0yfa7mOa1t/mXk5FBXvvQss1ztmO4HrkLoe+ruOEAtrQGghKfszohNvlmpIiAYUA+i9y
 oIo9jM0hqZufP+b8zja4QVtm3d3ryT6q/fZaBHxRELCb6SEc9CMvcdRSJx90TqMekWCa dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6fs2s4xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 21:32:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33PLWrTS025004
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 21:32:53 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 14:32:52 -0700
Message-ID: <fc3089b6-5511-7046-9c70-f0535d8f4ba3@quicinc.com>
Date: Tue, 25 Apr 2023 14:32:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 3/3] drm/msm/dpu: Pass catalog pointers
 directly from RM instead of IDs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
 <50d22e0c-84b3-0678-eb06-30fb66fd24cf@quicinc.com>
 <ymq4kstme55dm3j5kr6trevnwdelhjq7e7m4yky6zcbnf7auid@66l7inxz4oq2>
 <CAA8EJprYQUFER6x1+ucHX_Ze2uqWc6xoEaYDdJ1s0jgZjPJ0QQ@mail.gmail.com>
 <c809476f-74bc-0399-08f9-1bf26e7170fa@quicinc.com>
 <r2tndjr5jbjtrwwti6l3ag7562e53nqx2uk6vz6fx43yc7sncl@eypc37r2ey3j>
 <31f116f6-a6b7-1241-83bc-96c31e718f3f@linaro.org>
 <m5z5mv5hbdgpjbfo3mqo5s3egshnlu77nla4b7txddlsbk5fvi@jitwvapbr7wr>
 <CAA8EJpoCeCkucvb=a+1ken_yR=8FvcECrvajOk5MxgO-j2nD6A@mail.gmail.com>
 <2c3ef118-d7b1-83bd-f789-3e5c5212a6e5@quicinc.com>
 <CAA8EJpq8i4YxRc4yM-BGyV0uM4WyDOoFAgsU8bOoZL963wRMkQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq8i4YxRc4yM-BGyV0uM4WyDOoFAgsU8bOoZL963wRMkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Bp0mbnrXep2odjEcmwbt4V6F5V1xVuE6
X-Proofpoint-ORIG-GUID: Bp0mbnrXep2odjEcmwbt4V6F5V1xVuE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=660 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304250192
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
Cc: Sean Paul <sean@poorly.run>, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/25/2023 2:09 PM, Dmitry Baryshkov wrote:
> On Tue, 25 Apr 2023 at 19:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/25/2023 7:26 AM, Dmitry Baryshkov wrote:
>>> On Tue, 25 Apr 2023 at 11:55, Marijn Suijten
>>> <marijn.suijten@somainline.org> wrote:
>>>>
>>>> On 2023-04-25 10:54:47, Dmitry Baryshkov wrote:
>>>>> On 25/04/2023 10:16, Marijn Suijten wrote:
>>>>>> On 2023-04-24 16:23:17, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 4/24/2023 3:54 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, 25 Apr 2023 at 01:03, Marijn Suijten
>>>>>>>> <marijn.suijten@somainline.org> wrote:
>>>>>>>>>
>>>>>>>>> On 2023-04-21 16:25:15, Abhinav Kumar wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 4/21/2023 1:53 PM, Marijn Suijten wrote:
>>>>>>>>>>> The Resource Manager already iterates over all available blocks from the
>>>>>>>>>>> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
>>>>>>>>>>> uses an _xxx_offset() helper to search for and find the exact same
>>>>>>>>>>> catalog pointer again to initialize the block with, fallible error
>>>>>>>>>>> handling and all.
>>>>>>>>>>>
>>>>>>>>>>> Instead, pass const pointers to the catalog entries directly to these
>>>>>>>>>>> _init functions and drop the for loops entirely, saving on both
>>>>>>>>>>> readability complexity and unnecessary cycles at boot.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>
>>>>>>>>>> Overall, a nice cleanup!
>>>>>>>>>>
>>>>>>>>>> One comment below.
>>>>>>>>>>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 39 ++++------------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 12 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
>>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
>>>>>>>>>>>       23 files changed, 139 insertions(+), 375 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> <snipped>
>>>>>>>>>>
>>>>>>>>>>> -struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>>>>>>>>>>> -           void __iomem *addr,
>>>>>>>>>>> -           const struct dpu_mdss_cfg *m)
>>>>>>>>>>> +struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>>>>>>>>>> +           void __iomem *addr)
>>>>>>>>>>>       {
>>>>>>>>>>>         struct dpu_hw_intf *c;
>>>>>>>>>>> -   const struct dpu_intf_cfg *cfg;
>>>>>>>>>>> +
>>>>>>>>>>> +   if (cfg->type == INTF_NONE) {
>>>>>>>>>>> +           pr_err("Cannot create interface hw object for INTF_NONE type\n");
>>>>>>>>>>> +           return ERR_PTR(-EINVAL);
>>>>>>>>>>> +   }
>>>>>>>>>>
>>>>>>>>>> The caller of dpu_hw_intf_init which is the RM already has protection
>>>>>>>>>> for INTF_NONE, see below
>>>>>>>>>>
>>>>>>>>>>              for (i = 0; i < cat->intf_count; i++) {
>>>>>>>>>>                      struct dpu_hw_intf *hw;
>>>>>>>>>>                      const struct dpu_intf_cfg *intf = &cat->intf[i];
>>>>>>>>>>
>>>>>>>>>>                      if (intf->type == INTF_NONE) {
>>>>>>>>>>                              DPU_DEBUG("skip intf %d with type none\n", i);
>>>>>>>>>>                              continue;
>>>>>>>>>>                      }
>>>>>>>>>>                      if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
>>>>>>>>>>                              DPU_ERROR("skip intf %d with invalid id\n",
>>>>>>>>>> intf->id);
>>>>>>>>>>                              continue;
>>>>>>>>>>                      }
>>>>>>>>>>                      hw = dpu_hw_intf_init(intf->id, mmio, cat);
>>>>>>>>>>
>>>>>>>>>> So this part can be dropped.
>>>>>>>>>
>>>>>>>>> I mainly intended to keep original validation where _intf_offset would
>>>>>>>>> skip INTF_NONE, and error out.  RM init is hence expected to filter out
>>>>>>>>> INTF_NONE instead of running into that `-EINVAL`, which I maintained
>>>>>>>>> here.
>>>>>>>>>
>>>>>>>>> If you think there won't be another caller of dpu_hw_intf_init, and that
>>>>>>>>> such validation is hence excessive, I can remove it in a followup v3.
>>>>>>>>
>>>>>>>> I'd prefer to see the checks at dpu_rm to be dropped.
>>>>>>>> dpu_hw_intf_init() (and other dpu_hw_foo_init() functions) should be
>>>>>>>> self-contained. If they can not init HW block (e.g. because the index
>>>>>>>> is out of the boundaries), they should return an error.
>>>>>>>>
>>>>>>>
>>>>>>> They already do that today because even without this it will call into
>>>>>>> _intf_offset() and that will bail out for INTF_NONE.
>>>>>>>
>>>>>>> I feel this is a duplicated check because the caller with the loop needs
>>>>>>> to validate the index before passing it to dpu_hw_intf_init() otherwise
>>>>>>> the loop will get broken at the first return of the error and rest of
>>>>>>> the blocks will also not be initialized.
>>>>>>
>>>>>> To both: keep in mind that the range-checks we want to remove from
>>>>>> dpu_rm_init validate the ID (index?) of a block.  This check is for the
>>>>>> *TYPE* of an INTF block, to skip it gracefully if no hardware is mapped
>>>>>> there.  As per the first patch of this series SM6115/QCM2290 only have a
>>>>>> DSI interface which always sits at ID 1, and ID 0 has its TYPE set to
>>>>>> INTF_NONE and is skipped.
>>>>>>
>>>>>> Hence we _should_ keep the graceful TYPE check in dpu_rm_init() to skip
>>>>>> calling this function _and assigning it to the rm->hw_intf array_.  But
>>>>>> I can remove the second TYPE check here in dpu_hw_intf_init() if you
>>>>>> prefer.
>>>>>
>>>>> We can return NULL from dpu_hw_foo_init(), which would mean that the
>>>>> block was skipped or is not present.
>>>>
>>>> An then replace the `if INTF_NONE continue` logic in dpu_rm_init with a
>>>> check for NULL that skips, and a check for IS_ERR` that goes to `fail`?
>>>
>>> You can just drop the INTF_NONE in dpu_rm. If dpu_hw_intf_init()
>>> returns NULL, the rest of the code in dpu_rm will work correctly.
>>>
>>
>> The only thing lost will be that the loop in the RM will break at the
>> first instance of NULL so if the loop has valid intf blocks later, those
>> will also not get initialized.
> 
> No, it won't. There is the IS_ERR check, not the IS_ERR_OR_NULL()
> 

Ack, but isnt that an issue since rm->hw_intf[intf->id - INTF_0] can be 
assigned to a NULL hw.

>>
>> That wont happen today because catalog doesnt have such entries but just
>> wanted to note what gets lost with this change.
>>
>> Otherwise, I am okay with that.
>>
>>>>
>>>> Should I do that in a new or the same patch for v3?
>>>>
>>>> Note that there's a similar check for the `pingpong` "id" member of
>>>> every Layer Mixer.
>>>>
>>>> - Marijn
>>>
>>>
>>>
> 
> 
> 
