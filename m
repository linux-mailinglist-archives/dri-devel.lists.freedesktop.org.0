Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC35A88E0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 00:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF4510E4FC;
	Wed, 31 Aug 2022 22:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE9710E4F6;
 Wed, 31 Aug 2022 22:17:15 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27VLo3Z1007109;
 Wed, 31 Aug 2022 22:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0AWZK2JritVLOwMklM8b3UUT3+DXka2c/qsVayHyR18=;
 b=Wbs5HnXXbAumTeP5kZSIoCvZXrryxZ85jcI9r7O7kxdwPjUzbtpolJEQ8Ln5Ia1MPLvH
 Yj/OcRwhlLoFHKmsxH4YivPg2qLBZvt4OhtPGZrcJmU2bVmDMGIapxvnHlRTeWDzHe7A
 vPZhlhExF1DVzUBoMxf3na5ttV8VfEOpur7AxA03frJlOCt64CyrD+FtraZEfvHpGzdn
 NY2gLLMkgd+nQdAmMwDHZ4cY3r34RVKbeWwiP7kzJq5NgYzZSuB+M1kP+mMS140/xqaN
 tHBY0+/NDKdYJ0UX2gdodNwQZSJeKl5lPtW484b8YWCqBqZFWeuO0JU89tixkWC9QMQN ig== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jaa0t1ghu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 22:16:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27VMGmTK004273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Aug 2022 22:16:48 GMT
Received: from [10.111.165.88] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 31 Aug
 2022 15:16:46 -0700
Message-ID: <d0dfbcd5-0299-3810-9cf1-e2d0a19ce321@quicinc.com>
Date: Wed, 31 Aug 2022 15:16:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
 <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
 <CAA8EJpogK9BbrSzgJp+Rb_Op2+JBFsTdQHxpTFz28c2biE8AUw@mail.gmail.com>
 <7bdfc4da-740b-9e4d-647c-a349b0bfa1f9@quicinc.com>
 <047e1001-754d-0913-fcbe-a4747c5df8b8@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <047e1001-754d-0913-fcbe-a4747c5df8b8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9K_xUvsr2BSShGym20kHecIUr_b9n4wp
X-Proofpoint-ORIG-GUID: 9K_xUvsr2BSShGym20kHecIUr_b9n4wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_14,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208310108
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/26/2022 7:23 AM, Dmitry Baryshkov wrote:
> On 24/08/2022 20:20, Abhinav Kumar wrote:
>>
>>
>> On 8/24/2022 1:29 AM, Dmitry Baryshkov wrote:
>>> On Wed, 24 Aug 2022 at 04:25, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>>>>> The rest of the code expects that master's device drvdata is the
>>>>> struct msm_drm_private instance. Do not override the mdp5's drvdata.
>>>>>
>>>>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master 
>>>>> components")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> Is this just for consistency across mdp5/dpu drivers?
>>>>
>>>> What issue was seen if mdp5's platform data is overwritten?
>>>
>>> I think there was a crash in mdp5_destroy, but I did not capture the
>>> log at the moment.
>>>
>>> As you can see, the mdp5_destroy() expects to get mdp5_kms pointer
>>> from the drvdata. However the msm_drv_probe sets the drvdata to
>>> msm_drm_private instance. Boom.
>>
>> Yes, I see that msm_drv_probe sets the drvdata to msm_drm_private.
>> But I also see that mdp5_init then sets it to
>>
>> platform_set_drvdata(pdev, mdp5_kms);
>>
>> Does this not override it then?
> 
> It does. But then the mdp5_pm_ops use msm_pm_prepare()/_complete(). And 
> these calls expect the msm_drm_private instance in the drvdata. Maybe I 
> stumbled upon this. I don't remember exactly, unfortunately.
> 

This explanation makes sense to me. Understood. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


>> Also seems like the commit which introduced it is present since april, 
>> this should have happened even earlier then right?
>>
>>>
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
>>>>>    1 file changed, 9 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>>>>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>>> index c668a4b27cc6..daf5b5ca7233 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>>>> @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct 
>>>>> msm_kms *kms,
>>>>> slave_encoder);
>>>>>    }
>>>>>
>>>>> -static void mdp5_destroy(struct platform_device *pdev);
>>>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
>>>>>
>>>>>    static void mdp5_kms_destroy(struct msm_kms *kms)
>>>>>    {
>>>>> @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>>>>>        }
>>>>>
>>>>>        mdp_kms_destroy(&mdp5_kms->base);
>>>>> -     mdp5_destroy(mdp5_kms->pdev);
>>>>> +     mdp5_destroy(mdp5_kms);
>>>>>    }
>>>>>
>>>>>    #ifdef CONFIG_DEBUG_FS
>>>>> @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
>>>>>        return ret;
>>>>>    }
>>>>>
>>>>> -static void mdp5_destroy(struct platform_device *pdev)
>>>>> +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
>>>>>    {
>>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>>>        int i;
>>>>>
>>>>>        if (mdp5_kms->ctlm)
>>>>> @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device 
>>>>> *pdev)
>>>>>                kfree(mdp5_kms->intfs[i]);
>>>>>
>>>>>        if (mdp5_kms->rpm_enabled)
>>>>> -             pm_runtime_disable(&pdev->dev);
>>>>> +             pm_runtime_disable(&mdp5_kms->pdev->dev);
>>>>>
>>>>>        drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
>>>>>        drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
>>>>> @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device 
>>>>> *pdev, struct drm_device *dev)
>>>>>                goto fail;
>>>>>        }
>>>>>
>>>>> -     platform_set_drvdata(pdev, mdp5_kms);
>>>>> -
>>>>>        spin_lock_init(&mdp5_kms->resource_lock);
>>>>>
>>>>>        mdp5_kms->dev = dev;
>>>>> @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device 
>>>>> *pdev, struct drm_device *dev)
>>>>>        return 0;
>>>>>    fail:
>>>>>        if (mdp5_kms)
>>>>> -             mdp5_destroy(pdev);
>>>>> +             mdp5_destroy(mdp5_kms);
>>>>>        return ret;
>>>>>    }
>>>>>
>>>>> @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct 
>>>>> platform_device *pdev)
>>>>>    static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
>>>>>    {
>>>>>        struct platform_device *pdev = to_platform_device(dev);
>>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>>> +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>>> +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>>>
>>>>>        DBG("");
>>>>>
>>>>> @@ -985,7 +983,8 @@ static __maybe_unused int 
>>>>> mdp5_runtime_suspend(struct device *dev)
>>>>>    static __maybe_unused int mdp5_runtime_resume(struct device *dev)
>>>>>    {
>>>>>        struct platform_device *pdev = to_platform_device(dev);
>>>>> -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
>>>>> +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>>> +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>>>
>>>>>        DBG("");
>>>>>
>>>
>>>
>>>
> 
