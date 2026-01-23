Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCA9E6S8c2kmyQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:23:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFF798D4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 19:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3753110E2E0;
	Fri, 23 Jan 2026 18:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQMVoNlx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1tnGtxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1510E2DC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NCinqU322639
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=; b=kQMVoNlx7hAtO97V
 8MA9n+nrQquFDk6KQKj2rG84pzAcoNkt6XYf3wka/T7fD5IL4w7WMg97ubWNqlVS
 +tbAexM027MM0yaTBNGO+z2XyEmWl3HGQ2iuBHyEI88ZayI3UPHkucR3ZbfJ7VcP
 72XKw9Z0zHKwrwPH7sXXGifAK122hDy93PQoN2+tawwgl9sFgVdY32KoHcgu2zAI
 eWHL/IAXkURS4w6ROPjk2YSP408u+n2vBEBkj8DlZgiheerzY8X8j3SV2wBXR8KC
 1j21tkxgEuZnrWYKfN4aGbvEb41wqBIqMAx5yM+3r4C8Phh2tpVVmtxOR4L3BIKR
 yPnbMw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mqad7v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5f54c51ec03so1047137137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769192606; x=1769797406;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
 b=h1tnGtxGB5rfX7nccfaCAsWS3lx6RK4FC7kSYOnBFYRIhFM9+iMd1pf+6CKuETjpVx
 fpAKNOt5l7H/NttEntamugLQDGiZ1lnjYgYWT9Gn4XHNeft99zJ7PyTNaWFCJAf+TcZc
 RxUbAG4ClnKTN5aPiDzBXMyf5kKInjKWWoN6sRFA2UFg68UI4TMJ1AHV0CNSM9gUeDFn
 LH8Tj69rzGf9xhnVLJO4wSIgB3WSL/UXXkFDgZkGwo8vvW1DDRiGh0NGsVqjChgqNjWO
 V69Gl81/PjMolTz8n0l4DYhne17UAEgaojKq2IgRngEBtMyBEPlmKVRFP5xf9utSaR2Z
 ohHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769192606; x=1769797406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
 b=ZNrygg6dJY2i+D1VR1twBU7DNLOI9qvYeHHLNYbwJxvPDnr6X//YFb2KmNx1ovzu30
 GD42AnYnJ1QrnsPeqtFx1mAobTn3SrTDFHwZZG1eV4Zzb36uK0qY1CIdseJyzwugtVWW
 B0u0Crbl9XS9gykwvi3UfArUDrIlZqb8Gqmiql5M095slXRavA9pO7sYZpO948ib9cJT
 5584OVyoPtgMwn5rKaofGw3pXE3TuY1MLh0sOlDPZXP2jYERb3f2dcwDK9euSXXWrr6O
 brOIg2kzir27jCwwwptlv4wu3L2QXYS/ammKbnfrirveETPu4HA5YNHcHT54KC/67pdV
 GRxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOaJKKJVHtSPEHQRMpy2ohV7XZZop4p+OZynjeldCAwQqtQRMabSe/R+vdX4gJ7thQ/d9XYV7dZJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaMyhRIElN9Gpue83NpQQIAzJ6ABJAcIHX/ECj5BmwTuLn7fGD
 7GqAS9GlNZG5juS8oRXA/kppqXCFjD91Dw5eQh1mGSqAh3XWivP2vhD5zKw2aT68+825vJGRu+7
 KaAA0hrxoUijw8Gajwduu0f6GOrKkmFnGQeLI9qLuql6RdLcsDOOABNBk4YeLRbHGr7TX6Bg=
X-Gm-Gg: AZuq6aL0epqlLyoX+uNZ1Ovo8dgfCq/VvL+G5DXMsX9KMXAoRv42PaOIJFn8nLWnSr+
 goGNNrfGbep7Fd9jleRu7UvK/ezEi3wP8xuCx42r5SH8HDXH+dreo2vD1I0tCIjQSGebgfH3oPo
 CoEZE0UC3kVKn2dBgzrsgW3qh5DfGtfEXZLu+XilaTdv7BhLu8DiDZVWGEZZfwumMBHQg9sLDkv
 chv0dXU9QmEhNUXL/yGFwg4x5H2dMruAF9Lu74aiUXH0pXmAnQtoqfm3iJMdZDzUJHppunwKEgY
 JFb2pC7fWD2b13hterc1Ob7t1vQeZdT0N6ZhUhN51k3ufXEkDpJMsWFJeDsnwBj9RaTjdDHc8XH
 bX0+F3DXDOrz45QEoH0Muh5RlYVgoLazr/v4eI7zCm9HX2Ouqg8w9BJXaeqXYxXUf
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id
 ada2fe7eead31-5f55874884dmr572404137.40.1769192606454; 
 Fri, 23 Jan 2026 10:23:26 -0800 (PST)
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id
 ada2fe7eead31-5f55874884dmr572391137.40.1769192605953; 
 Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi.
 [84.253.213.87]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df7e0sm836906e87.17.2026.01.23.10.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Message-ID: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 20:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TRpYBMrWMh7SPH5R_coX7o0C7H_m5yU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzOSBTYWx0ZWRfX52+zuns9vzpF
 Le3p4HSVYgV4AFLQqaW/JucHOOC3vi2EhwarlZkbTbdbt9+4H+jJuoIX/nHmo3JybjbedAI6+uG
 yMCZmRYPFT05tQSZIORChteqhj0olpQkjKU7gOrJHxvLgH4Ky/Les1hLqMY9iSiMJdcW6mOsOVO
 5bRtYnEzDWM+H+iTq+olhFX0D0BSt8tf44yQIV/nV6L637obOcMhQOCyJoGKHbSA4Hi/A4qqWHz
 MvS6h+rnl4Qk6D7UFJmwtxP2IFc+iNsyV3j1SyTtqSJN4MyyO9MGwfof3OLs4i5Agvp8t2Abc8i
 ta5eJEhN9eWumufiQQFeffV8SXWJwJ32Gtb1+kKsr3XYFqFgQrizMgNcNh8acPRi3HpAgFQtQ6M
 HQfmllJKrcJFoC/SJF+KZcGS8cDBDsnZXFGwJ5Mlk6ZhFQJJcai/R+iQHt5qOy3dFbltolFVfvw
 VZp1/6zdO/gPhIpm/2g==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=6973bc9f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=nHOJee6wh0HJpeXwZwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: TRpYBMrWMh7SPH5R_coX7o0C7H_m5yU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230139
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.614];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: E9FFF798D4
X-Rspamd-Action: no action

On 23/01/2026 20:21, Felix Gu wrote:
> Hi Dmitry,
> Thanks for your review.
> linux/cleanup.h is included in linux/of.h.
> So it should be included already.

Yes. However we should not depend on include files being provided by 
other kernel-wide includes.

Also, please don't top-post when replying to the emails on public MLs.

> 
> Best regards,
> Feix Gu
> 
> On Sat, Jan 24, 2026 at 1:58 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
>>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
>>> While there was a manual of_node_put() at the end of the
>>> common path, several early error returns would bypass this call,
>>> resulting in a reference leak.
>>> Fix this by using the __free(device_node) cleanup handler to
>>> release the reference when the variable goes out of scope.
>>>
>>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
>>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 2129d230a92b..0bc518d9fd65 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct platform_device *pdev = priv->gpu_pdev;
>>>        struct adreno_platform_config *config = pdev->dev.platform_data;
>>> -     struct device_node *node;
>>>        struct a6xx_gpu *a6xx_gpu;
>>>        struct adreno_gpu *adreno_gpu;
>>>        struct msm_gpu *gpu;
>>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        adreno_gpu->registers = NULL;
>>>
>>>        /* Check if there is a GMU phandle and set it up */
>>> -     node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>> +     struct device_node *node __free(device_node) =
>>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>
>> Missing include for cleanup.h.
>>
>>>        /* FIXME: How do we gracefully handle this? */
>>>        BUG_ON(!node);
>>>
>>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>                ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>>>        else
>>>                ret = a6xx_gmu_init(a6xx_gpu, node);
>>> -     of_node_put(node);
>>>        if (ret) {
>>>                a6xx_destroy(&(a6xx_gpu->base.base));
>>>                return ERR_PTR(ret);
>>>
>>> ---
>>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
>>> change-id: 20260123-a6xx_gpu-cbc095dbe423
>>>
>>> Best regards,
>>> --
>>> Felix Gu <ustc.gu@gmail.com>
>>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
