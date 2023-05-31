Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF5718956
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35310E505;
	Wed, 31 May 2023 18:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABDB10E505;
 Wed, 31 May 2023 18:25:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VGNCUv003007; Wed, 31 May 2023 18:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ok49jhaPjd+G0yNitqyT3jCqd7H8ut8cxORfilIuBIw=;
 b=F7Ei5DyHj13yknMOmVi0jslmaLE89eTpdsfU/NAEip7kjY76zzfnXpAl5wZ5aq3nbgeZ
 N3x393vQ7/PfVMaxvI8GRA6isrBLg2BH56hJJmDOarf4JhDRmqBVjNZ4pt3Ft/co6ALb
 qgwtwUDHWR0rT/bJ+kd/QehaoqvqD7OVJn07rXiOri96ndLHtblOCqAkRZx9CwRrEkJQ
 CY3kD6cNWjq0CDVdQL/+Qy+YhOXkPN7UpA1EIT0+gTu6Z/uU5gavSOd7saSHD3v+YM8G
 +siT/uSZxkukwZpqj45oDVSvBa6Gz8bZoucOPbXPpWzKmjaYH0GPZyqU0C7daQ6cVWOV jw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qx1yk1g96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 18:25:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VIPiwk026670
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 18:25:44 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 31 May
 2023 11:25:42 -0700
Message-ID: <a0b7a9fc-eb3c-3b26-b11d-fe1fb47b2c51@quicinc.com>
Date: Wed, 31 May 2023 11:25:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: re-introduce dpu core revision
 to the catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
 <CAA8EJpryw0h8TgpJ+SFJ7s0=LCjkQ6oqAjCKsm60dk_Q5e+wWA@mail.gmail.com>
 <0af4df3d-8048-98cd-6c91-7cd553f4f65f@quicinc.com>
 <98e4bda7-19e9-09b6-f008-383adada97cb@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <98e4bda7-19e9-09b6-f008-383adada97cb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9d1xuQM_Mt54bpD55u7xkN2KInV7jXbL
X-Proofpoint-GUID: 9d1xuQM_Mt54bpD55u7xkN2KInV7jXbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_13,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310156
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/31/2023 3:07 AM, Dmitry Baryshkov wrote:
> On 31/05/2023 06:05, Abhinav Kumar wrote:
>>
>>
>> On 5/30/2023 7:53 PM, Dmitry Baryshkov wrote:
>>> On Wed, 31 May 2023 at 03:54, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> With [1] dpu core revision was dropped in favor of using the
>>>> compatible string from the device tree to select the dpu catalog
>>>> being used in the device.
>>>>
>>>> This approach works well however also necessitates adding catalog
>>>> entries for small register level details as dpu capabilities and/or
>>>> features bloating the catalog unnecessarily. Examples include but
>>>> are not limited to data_compress, interrupt register set, widebus etc.
>>>>
>>>> Introduce the dpu core revision back as an entry to the catalog so that
>>>> we can just use dpu revision checks and enable those bits which
>>>> should be enabled unconditionally and not controlled by a catalog
>>>> and also simplify the changes to do something like:
>>>>
>>>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>>>          enable the bit;
>>>>
>>>> Also, add some of the useful macros back to be able to use dpu core
>>>> revision effectively.
>>>>
>>>> [1]: 
>>>> https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 
>>>> ++++++++++++++++++-
>>>>   14 files changed, 43 insertions(+), 1 deletion(-)
>>>>
>>>
>>> [skipped catalog changes]
>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index 677048cc3b7d..cc4aa75a1219 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -19,6 +19,33 @@
>>>>    */
>>>>   #define MAX_BLOCKS    12
>>>>
>>>> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
>>>> +                 ((((unsigned int)MAJOR & 0xF) << 28) |\
>>>> +                 ((MINOR & 0xFFF) << 16) |\
>>>> +                 (STEP & 0xFFFF))
>>>> +
>>>> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
>>>> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
>>>> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
>>>> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
>>>> +
>>>> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
>>>> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
>>>> +
>>>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
>>>> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
>>>> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>>>> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
>>>> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
>>>> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>>>> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>>>> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>>>> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
>>>> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
>>>> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
>>>> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
>>>> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */
>>>
>>> Instead of having defines for all SoCs (which can quickly become
>>> unmanageable) and can cause merge conflicts, I'd suggest inlining all
>>> the defines into respective catalog files.
>>>
>>
>> Sure, that can be done.
>>
>>> Also, I'm not sure that the "step" should be a part of the catalog. I
>>> know that this follows the hardware revision. However, please correct
>>> me if I'm wrong, different step levels are used for revisions of the
>>> same SoC. The original code that was reading the hw revision from the
>>> hardware register, listed both 5.0.0 and 5.0.1 for sm8150.
>>>
>>
>> This is one of the things i noticed while making this change.
>>
>> Before the catalog rework, we used to handle even steps as we used to 
>> read that from the register and match it with the mdss_cfg handler. 
>> But after the rework, we dont handle steps anymore. Yes, you are right 
>> that different step levels are used for the revisions of the same SOC 
>> and so with that, i dont expect or atleast am not aware of DPU 
>> differences between steps but I am not able to rule it out.
>>
>> So are you suggesting we drop step altogether and DPU_HW_VER() macro 
>> shall only handle major and minor versions? With the current chipsets 
>> I see, it should not make a difference . Its just that I am not sure 
>> if that will never happen.
> 
> Yes. The goal of this rework would be to drop generic features and to 
> replace those checks with DPU-revision lookups. Correct?

Yes thats right.

> I think that from this perspective having to handle toe step revision is 
> a sign of an overkill. Having to handle the step revision is a sign of 
> paltform feature (or mis-feature) rather than a generic DPU bit.
> 

Not entirely. Lets not forget that at the moment even dpu_perf_cfg is 
part of the catalog. Even if in terms of major HW blocks steps shouldnt 
change, there is absolutely no guarantee that perf data cannot.

This is what is the sticking point for me which is holding me back 
against dropping step. Thoughts?

> In fact I suppose that even handling a minor revision would be an 
> overkill. Why don't we start with .dpu_major instead of .core_rev? We 
> can add .dpu_minor if/when required.
> 

No, unfortunately we cannot drop minor version for sure. I am seeing 
examples in downstream code where some of the features are available 
after a minor verion as well.

>>
>>>> +
>>>>   #define DPU_HW_BLK_NAME_LEN    16
>>>>
>>>>   #define MAX_IMG_WIDTH 0x3fff
>>>> @@ -769,7 +796,7 @@ struct dpu_perf_cfg {
>>>>   /**
>>>>    * struct dpu_mdss_cfg - information of MDSS HW
>>>>    * This is the main catalog data structure representing
>>>> - * this HW version. Contains number of instances,
>>>> + * this HW version. Contains dpu core revision, number of instances,
>>>>    * register offsets, capabilities of the all MDSS HW sub-blocks.
>>>>    *
>>>>    * @dma_formats        Supported formats for dma pipe
>>>> @@ -778,6 +805,8 @@ struct dpu_perf_cfg {
>>>>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>>>>    */
>>>>   struct dpu_mdss_cfg {
>>>> +       u32 core_rev;
>>>> +
>>>>          const struct dpu_caps *caps;
>>>>
>>>>          const struct dpu_ubwc_cfg *ubwc;
>>>> -- 
>>>> 2.40.1
>>>>
>>>
>>>
> 
