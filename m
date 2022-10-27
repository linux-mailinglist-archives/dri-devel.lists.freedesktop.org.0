Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B765E610235
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 21:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9698F10E6DE;
	Thu, 27 Oct 2022 19:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C8410E6DD;
 Thu, 27 Oct 2022 19:59:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RIeTRf023257;
 Thu, 27 Oct 2022 19:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0NGXDm14CD3CSJAbvcKSD0ea0Gf24+q12i0K39i6Kps=;
 b=LXAU1jQ8yFvp+eFTuVTkaXf0o7KxAGTpqJ+rIpMxiDRP9VXLcP2F4cgaP6J+JmzqphbJ
 64jYaxr9oddcrE+q5nuYuZEiKH3ggKEfLf7u3yuM8nILI7oR35pBLI/fwNClifuj5qYb
 9L8dYjmsn/bHa2RhTpJUJne2Yde8/M9EUptUIzcJE7kBGsFQBSLLZBNRH2y6rPrBkxi1
 I2VMVHjswc1rx2zTuxfwLgNpN5uYQiCp4cMRvw+Ca3qebwz5/XFhKsjmGD1xWR9gCMad
 MOa1Bb4S00ENbdo2F//hiye6Rbz7bulJThxIifUoNSTqqgScW0KwqFg0jm+m5DDonLul RQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kfaj034a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 19:59:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29RJx0Jr015152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 19:59:00 GMT
Received: from [10.38.246.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 27 Oct
 2022 12:58:57 -0700
Message-ID: <0b6f8319-78e3-44fe-78ad-621a817ceaca@quicinc.com>
Date: Thu, 27 Oct 2022 12:58:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221024152642.3213488-1-dmitry.baryshkov@linaro.org>
 <481b99e7-9e97-0109-d922-0bba39d952a3@quicinc.com>
 <b6dcd614-1bf8-3b2d-cc7e-ee3a59564fc6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b6dcd614-1bf8-3b2d-cc7e-ee3a59564fc6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ghlSvIXENq8PO0DCaDH-W1wv2GFTjNwW
X-Proofpoint-ORIG-GUID: ghlSvIXENq8PO0DCaDH-W1wv2GFTjNwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270112
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/27/2022 12:56 PM, Dmitry Baryshkov wrote:
> On 27/10/2022 21:30, Abhinav Kumar wrote:
>>
>>
>> On 10/24/2022 8:26 AM, Dmitry Baryshkov wrote:
>>> The rest of the code expects that master's device drvdata is the
>>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>>
>>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Abhinav, Rob, please pick this for -fixes.
>>>
>>> This is an updated version of [1]. Fixed the read_mdp_hw_revision()
>>> function. PM runtime isn't available at the moment, as priv->kms is not
>>> set.
>>>
>>> [1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1
>>>
>>> Changes since v2:
>>> - Removed the clause checking whether mdp5_enable() has failed (it can
>>>    not fail, noted by Abhinav)
>>>
>>> Changes since v1:
>>> - Expanded the patch to also handle the read_mdp_hw_revision() and also
>>>    to move pm enablement to the place where the pm_runtime can actually
>>>    be used.
>>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 32 +++++++++++++-----------
>>>   1 file changed, 17 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> index b0d21838a134..b46f983f2b46 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms 
>>> *kms,
>>>                                 slave_encoder);
>>>   }
>>> -static void mdp5_destroy(struct platform_device *pdev);
>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>>>   static void mdp5_kms_destroy(struct msm_kms *kms)
>>>   {
>>> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>>>       }
>>>       mdp_kms_destroy(&mdp5_kms->base);
>>> -    mdp5_destroy(mdp5_kms->pdev);
>>> +    mdp5_destroy(mdp5_kms);
>>>   }
>>>   #ifdef CONFIG_DEBUG_FS
>>> @@ -519,9 +519,10 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>>> *mdp5_kms,
>>>       struct device *dev = &mdp5_kms->pdev->dev;
>>>       u32 version;
>>> -    pm_runtime_get_sync(dev);
>>> +    /* Manually enable the MDP5, as pm runtime isn't usable yet. */
>>> +    mdp5_enable(mdp5_kms);
>>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>>> -    pm_runtime_put_sync(dev);
>>> +    mdp5_disable(mdp5_kms);
>>
>> Please correct me if wrong here, if we bypass the pm to enable the 
>> clocks explicitly here, are we still guaranteed about GDSC to be ON?
> 
> The gdsc is tied to the mdss device, not to mdp5. So the gdsc will be 
> enabled, because for mdp5 to probe the mdss device also should be powered.
> 

Ok, thanks for clarifying.

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>
>>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>>> @@ -559,6 +560,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>       int irq, i, ret;
>>>       ret = mdp5_init(to_platform_device(dev->dev), dev);
>>> +    if (ret)
>>> +        return ret;
>>>       /* priv->kms would have been populated by the MDP5 driver */
>>>       kms = priv->kms;
>>> @@ -632,9 +635,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>       return ret;
>>>   }
>>> -static void mdp5_destroy(struct platform_device *pdev)
>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>>   {
>>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>       int i;
>>>       if (mdp5_kms->ctlm)
>>> @@ -648,7 +650,7 @@ static void mdp5_destroy(struct platform_device 
>>> *pdev)
>>>           kfree(mdp5_kms->intfs[i]);
>>>       if (mdp5_kms->rpm_enabled)
>>> -        pm_runtime_disable(&pdev->dev);
>>> +        pm_runtime_disable(&mdp5_kms->pdev->dev);
>>>       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>>       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>>> @@ -797,8 +799,6 @@ static int mdp5_init(struct platform_device 
>>> *pdev, struct drm_device *dev)
>>>           goto fail;
>>>       }
>>> -    platform_set_drvdata(pdev, mdp5_kms);
>>> -
>>>       spin_lock_init(&mdp5_kms->resource_lock);
>>>       mdp5_kms->dev = dev;
>>> @@ -839,9 +839,6 @@ static int mdp5_init(struct platform_device 
>>> *pdev, struct drm_device *dev)
>>>        */
>>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>>> -    pm_runtime_enable(&pdev->dev);
>>> -    mdp5_kms->rpm_enabled = true;
>>> -
>>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>>> @@ -893,10 +890,13 @@ static int mdp5_init(struct platform_device 
>>> *pdev, struct drm_device *dev)
>>>       /* set uninit-ed kms */
>>>       priv->kms = &mdp5_kms->base.base;
>>> +    pm_runtime_enable(&pdev->dev);
>>> +    mdp5_kms->rpm_enabled = true;
>>> +
>>>       return 0;
>>>   fail:
>>>       if (mdp5_kms)
>>> -        mdp5_destroy(pdev);
>>> +        mdp5_destroy(mdp5_kms);
>>>       return ret;
>>>   }
>>> @@ -953,7 +953,8 @@ static int mdp5_dev_remove(struct platform_device 
>>> *pdev)
>>>   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>>   {
>>>       struct platform_device *pdev = to_platform_device(dev);
>>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>       DBG("");
>>> @@ -963,7 +964,8 @@ static __maybe_unused int 
>>> mdp5_runtime_suspend(struct device *dev)
>>>   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>>>   {
>>>       struct platform_device *pdev = to_platform_device(dev);
>>> -    struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>> +    struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>> +    struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>       DBG("");
> 
