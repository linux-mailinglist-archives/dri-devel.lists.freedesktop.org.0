Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E7AD216D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8AA10E403;
	Mon,  9 Jun 2025 14:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWHB+n3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C362F10E3F7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:53:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598PRkQ004050
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E1M6ijwJW+Gd9T4ETx2mR2E40RSLTL8lBpW0rnVfE5A=; b=PWHB+n3kQ/cF7fcN
 uvRz7QeiwsrrGGl/pT/VCfMQLLDuQLHbAKmprUpPOUt8ss0tRBIs0HfHrkGdFI1V
 1zUQwZmqE1UWvHLLNHGY5XB3O8o2dQahzRPEkkpfBBm6G04kczI96W1CllXxXJL3
 oXFYLl/U8/pUvHSbHOUxJUbQ1PJt7Qnw00sBeM0/egDRQqS6YUtUVm+aC6N6fM/Z
 imtqq/QCwY6PphN0VdcvDdB7OAkXdnFPew13ErG5xo3hzGTUgMekJSGXD+WbqebQ
 +sJ92Kx9Wl1MvBzV6BAvwUdFcQ1o/aCPWsIhIP2lwZP/7/kMdxaWqahoHLgQgDv3
 7AnLMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y14hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:53:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caee990721so1127170285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480836; x=1750085636;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E1M6ijwJW+Gd9T4ETx2mR2E40RSLTL8lBpW0rnVfE5A=;
 b=n1V9TBLbi3LZIyyhzr1CwH+5Ky484LeVUx8+6zpfFUYnTUTJljd111cb7+7Y28d30M
 xscPR0atyxRRUKyMtt0wsv9ZlTSSnLqd40VozJSx5a8tgL+p4yVxJ1LMjRlui+E0oKIo
 ZE9Hxwt+X1GQ2tucqM/sanE+VKKckvGRUOel602ibCDd7M19YbB6maZEhx/sftOe3GAn
 kqeTByGu0igjW0QP3QhK3SGpxXYiIoxMhMz+HMxxb1bFIiABIwCex4eSDgg8yFgMG3BR
 YOFMt/4fkaCp3zKe72rbzH79Dej3SMBI3CtAiajMTbiT4hXxpGA1pacRfw2cFYU/eXdz
 YLAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDhG1iawYEH9Uikp2qpgffC2FWyiRCjr69aQZ9EfomB/E0km24cVFzMqvXtXtuA/L8UyfWXPPGYac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfmH4Nb/eN+G9glGL9InBvG9qMux+SlzazkSheCfUK0d1Gpg2Z
 3Afvn3YpnX3AGNJUxZ6iXfMZXQ+MuIZULNJdhZOJh/130p4mcgtaGz2suTAaoDwcQX8UET3iAuD
 rKzulZl/btwIVWFSqdr17Y2z7MSAKkrXhRB2S3QlN6j9Mp+FLZhyBZ4ihhb587ahBPIeuJhw=
X-Gm-Gg: ASbGncs7ZsE2xacxmpbznWxgbVMd+9Rj/yQhHB+W33FAX4Gvb9fHbcbeVwIXDxwXkC0
 2h7yhkdxTHAW/q9mTyAXmVhUHQbY6OpadYr5Hl6AGoe+MKMEvoGk7DEy6RQi7WyLx3MOqOz/tXU
 tnN8NyGZkk3WtoLsq+zoLF+3avuz2eW0P4r+UWl98/CZs7dHQBZ5mUTptBsHhMlb9QHoV9KEbiL
 DU7mJY1V6vWhRXVa9cyLbWRSfg+6J+i+jBLutRP1Ju8xnfunRNR3oS+e3YYQKhJ/0Sn4+lyaEwY
 /U3JbZ5ahuxBb3pWGZGz/aShgaLDnYMe+wqum3FUl7XMvLjqx1hGgiDqGh8u2adJZFWVR9WuIIi
 hi7HtpVS3FvM1BDxPUuFSXf8G
X-Received: by 2002:a05:620a:600b:b0:7ca:f40b:f44b with SMTP id
 af79cd13be357-7d2298ebee9mr2089959385a.50.1749480836005; 
 Mon, 09 Jun 2025 07:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb8djcfSHUYkhGhkFKlXy0yjWsEdhnsRRjWWLNkEw47WLc5Gb7W13oBbQa9G3Qg4Lp1K39iw==
X-Received: by 2002:a05:620a:600b:b0:7ca:f40b:f44b with SMTP id
 af79cd13be357-7d2298ebee9mr2089954585a.50.1749480835529; 
 Mon, 09 Jun 2025 07:53:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cab682sm10882151fa.70.2025.06.09.07.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 07:53:54 -0700 (PDT)
Message-ID: <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 17:53:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq
 name variable is local
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-4-shiyongbang@huawei.com>
 <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
 <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfXwP/iASk3aOlJ
 NXSD6XhHAKpI/ZrDknDf7QhT9sqHHOHlXRiXgdXD8K4S+tAxmIAtMDH+1r6atpH3shVrwL4pio9
 mUi3OYApTTDKpHYLzHxL27Kf/RlOC3XHndFB+OA3QtTjxV+a3qRZndJoX2xC7muUqU9xC1vnjsR
 IfB51gpSzhI7elNCLGGVIG1g/HJlmfFmstgFWmB+ytg3RC/kXoY8wAsbOM+tEQgtKoe8U/J2JNP
 TCjdEsmQ1dcLFZTewQ5xTz4gWfIotBGx8O/2laO1SVs4NmVgHkY5oNIDsUoGVf10yW0iDWtUBUt
 i9ZRng9UIazYt89Ap+EWIzrcDSdbry72fFpXfWu24Pvon76ID4OzYILUxQjuWLVa/2TrhcAWx1w
 cgtSaLbX/ceE/fPqqi9+Nbo6D9rTuifTOziiZSZji3xNBPFEgfx0HpK1RLB5IGsjBOLSUqA5
X-Proofpoint-GUID: iKrq-cHgPZnD06um8mGHDA20Gn8GzCY2
X-Proofpoint-ORIG-GUID: iKrq-cHgPZnD06um8mGHDA20Gn8GzCY2
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f585 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=-d6p7pKwPKVYLx0Ei34A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090110
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

On 09/06/2025 17:50, Yongbang Shi wrote:
> 
>> On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
>>> From: Baihan Li <libaihan@huawei.com>
>>>
>>> The local variable of irq name is passed to devm_request_threaded_irq(),
>>> which will make request_irq failed. Using the global irq name instead
>>> of it to fix.
>> This doesn't explain, why does it fail and which IRQ name is actually
>> expected.
> 
> The local variable is passed in request_irq (), and there will be use 
> after free problem.

This needs to be explained (in details) in the commit message.

> 
> 
>>> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and 
>>> requesting for HPD")
>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>> ---
>>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/ 
>>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> index 768b97f9e74a..4cdcc34070ee 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> @@ -32,7 +32,7 @@
>>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", 
>>> "hpd" };
>>> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc- 
>>> vblank", "hibmc-hpd" };
>> Please point to the corresponding IRQ names as currently implemented in
>> the upstream kernel.
> 
> Ok.

I was thinking in terms of IRQ lookup. You can ignore this comment (it 
makes me wonder, how did you understand it, if you responded with Ok).

> 
> 
>>>   static irqreturn_t hibmc_interrupt(int irq, void *arg)
>>>   {


-- 
With best wishes
Dmitry
