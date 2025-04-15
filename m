Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E00A89750
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A3B10E310;
	Tue, 15 Apr 2025 09:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqOpzx74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363710E094
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHYq002259
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=; b=VqOpzx74DYeT39j4
 IPfoYHGjfM8ZDyDmQKnuleirjPOxyXlgWQ6xpEd/P6QqBaXZqfnhudoB9gPvBIxW
 1bX9/y2cbXRHL772rXQelfk+AwStp3BoD7NALIvNVLo5c2wsC4dr36IgyJBnPgh0
 8QM4WvT4kIAJb9EJlQ5grJ32Kkc6dn+PLOvh3MkwIBZKcvOmEBT6PK+fB58mqAKd
 x80lW0mfYPrg9FZwDReJ1fKr/8uyxiINA+zaLeXHEjyRj4c+VtYf/nVx8TpwcT6O
 nSYNmbVQOW4DOII+F1FR4KI/vBptvY+EuWoEAaQIZx3oIGdrPXwzZsQtX7euEbK+
 Htydbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfgcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so962017085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707602; x=1745312402;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=;
 b=ZUVGnSfspimlL+w8qYmcZ/cspcm8T5wzkmsGSdO7TuX1B5HNHS/NZjJG0jC70ig4Xi
 2ZM3jzkzb/oT0jpDBniRz8f7wqcE+YiqoAQ+cwC0Ff0DdS8T22FSgWKl86wGTSGo3Ke6
 kpzmyPtaZpQcKZD3/kkYZtz0ezpRfzT/9E5FzRdyryKpZVrguZIglw5hPI+32tI3uwYl
 3VF8nZlMGcEdl7cT0O6ezKTFXxWJYdxJaq+RUsVTqj/MhEMILnp8crqWm8ampok+ymYe
 bs9kpHzmuv9ehtF1tAebotOOjh5AD0AXxEJyjQg8alEzxuIu8tMlJ8Oif/1Umvurs/fT
 jZeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkzPTq5MnL7neAbBBCboP+cldLdp4JWWUdLNMvbIXeAuIJEuLLRJd9X/u6dkiDBmjzHFTHROpqdXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTEMuhHH7jUXzKru8djXMWjF6ziiajtpDuZQJiP39ODD9abn3c
 oS6eegoqwvmvcy6wuad8nPScbPtUd6ScOZcBf/3z8wJ//yGbDtlF+pk5rOT2vqm0RBsZH0fKiq1
 i6d9X6BbtZRhyV5plNSxiMhyBEN4x+UPaD+K1dMbrUo0tbqQnD0Yn4XpKukjTyGkC4gI=
X-Gm-Gg: ASbGncvHDnKFVnkT4Rgc3gUjdjc4XbR7Jy3MrCUm4qBEYor6PCGME2GPWWSpbuzIVyV
 Y4TJGAWP5ypJZ+ZlAbBJGEO06n+0DCOCj10/Ie9slrkM/IjpMR4i3iwQyN60rt5Q9ENJ+DaU9Zz
 qgsRlfCcJ674cpfA7NKClzQEfJhYHodEPgcy6vKsZEbuklrrlwGWTtOsT3elNcjoP3/yfGiKQ+O
 de68FaqaYuyumaOnTrfwm7XukWj4NFdSjvnucr1n1lzsHoCT1lM7hnw585y+yLtKCczvNQvBQyy
 Gf5h0AeEEY1IKaP73BXckHWES7PX3i+EV4Ju0O2azBtxtTUVkZqdOT6kZn35GY8f5I29aiOvLDp
 minXbgiEqfvDWMJAX7+ocWMZcw1q2jfJCZ6JG2WhnYen5NJr3Vd5/i1Mz+ex7
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id
 af79cd13be357-7c7af0c0e77mr2367828085a.7.1744707601962; 
 Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESAyXoVLPjZgJIbP3L2JUlerT+JWqD6z0UX/136WNz5T6IEY76btFrfuYKR0NSWX/Mfql5Zg==
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id
 af79cd13be357-7c7af0c0e77mr2367822485a.7.1744707601439; 
 Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d239708sm1356448e87.85.2025.04.15.01.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:00:00 -0700 (PDT)
Message-ID: <9f64ea5e-1b59-4522-b55a-d9b11e412ee5@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:59:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
 <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OHb3ORjxkW0kepgj2DwfBjvMzZFY8ZiC
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe2013 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vNUryEpXin0155aUV7MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: OHb3ORjxkW0kepgj2DwfBjvMzZFY8ZiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150061
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2025 18:58, Rob Clark wrote:
> On Sun, Apr 13, 2025 at 9:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> The global workqueue is only used for vblanks inside KMS code. Move
>> allocation / flushing / deallcation of it to msm_kms.c
> 
> Maybe we should also just move the wq into struct msm_kms?

... together with several other KMS-only fields. I will take a look.

> 
> BR,
> -R
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>>   drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>>   2 files changed, 17 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>>                          drm_atomic_helper_shutdown(ddev);
>>          }
>>
>> -       /* We must cancel and cleanup any pending vblank enable/disable
>> -        * work before msm_irq_uninstall() to avoid work re-enabling an
>> -        * irq after uninstall has disabled it.
>> -        */
>> -
>> -       flush_workqueue(priv->wq);
>> -
>>          msm_gem_shrinker_cleanup(ddev);
>>
>>          msm_perf_debugfs_cleanup(priv);
>> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>>          ddev->dev_private = NULL;
>>          drm_dev_put(ddev);
>>
>> -       destroy_workqueue(priv->wq);
>> -
>>          return 0;
>>   }
>>
>> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          ddev->dev_private = priv;
>>          priv->dev = ddev;
>>
>> -       priv->wq = alloc_ordered_workqueue("msm", 0);
>> -       if (!priv->wq) {
>> -               ret = -ENOMEM;
>> -               goto err_put_dev;
>> -       }
>> -
>>          INIT_LIST_HEAD(&priv->objects);
>>          mutex_init(&priv->obj_lock);
>>
>> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          if (priv->kms_init) {
>>                  ret = drmm_mode_config_init(ddev);
>>                  if (ret)
>> -                       goto err_destroy_wq;
>> +                       goto err_put_dev;
>>          }
>>
>>          ret = msm_init_vram(ddev);
>>          if (ret)
>> -               goto err_destroy_wq;
>> +               goto err_put_dev;
>>
>>          dma_set_max_seg_size(dev, UINT_MAX);
>>
>> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>
>>   err_deinit_vram:
>>          msm_deinit_vram(ddev);
>> -err_destroy_wq:
>> -       destroy_workqueue(priv->wq);
>>   err_put_dev:
>>          drm_dev_put(ddev);
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          BUG_ON(!kms);
>>
>> +       /* We must cancel and cleanup any pending vblank enable/disable
>> +        * work before msm_irq_uninstall() to avoid work re-enabling an
>> +        * irq after uninstall has disabled it.
>> +        */
>> +
>> +       flush_workqueue(priv->wq);
>> +
>>          /* clean up event worker threads */
>>          for (i = 0; i < priv->num_crtcs; i++) {
>>                  if (priv->event_thread[i].worker)
>> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          if (kms && kms->funcs)
>>                  kms->funcs->destroy(kms);
>> +
>> +       destroy_workqueue(priv->wq);
>>   }
>>
>>   int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          if (ret)
>>                  return ret;
>>
>> +       priv->wq = alloc_ordered_workqueue("msm", 0);
>> +       if (!priv->wq)
>> +               return -ENOMEM;
>> +
>>          ret = priv->kms_init(ddev);
>>          if (ret) {
>>                  DRM_DEV_ERROR(dev, "failed to load kms\n");
>> -               return ret;
>> +               goto err_msm_uninit;
>>          }
>>
>>          /* Enable normalization of plane zpos */
>> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          return 0;
>>
>>   err_msm_uninit:
>> +       destroy_workqueue(priv->wq);
>>          return ret;
>>   }
>>
>>
>> --
>> 2.39.5
>>


-- 
With best wishes
Dmitry
