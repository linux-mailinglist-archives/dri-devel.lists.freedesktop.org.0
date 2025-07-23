Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9CB0EF38
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A4010E78D;
	Wed, 23 Jul 2025 10:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPTTaDIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884510E78A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N90FB7024516
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=; b=XPTTaDIptBlmsY4D
 J3KoAXcU0LlrUtSSv/ydQYsoYVm4ubWkmo+qnBgCXqxasXzMJhFSIAFeq/juxEby
 YNTvni79dr3cmG9NkxPWuGZ6a2QXMmy0oyjUwCxGRGK1a3aNlBuYMNJUeV5PigvW
 VVicywIpxy7cYY08ZLr9JFNSdx4cFaGSS+VNevzxOr0OC7UdT5r0sXQ9Xcwym4c4
 kWO93xX9oX7roWNLHH5XHE/diJ+LGe7p5MHp2Y5hSBVgjewjT8hS4cld5eIASRu5
 OjrKvxXHS3OzWUsOXO9okrDFbR0ZO1kcWUXz7gfR4Rc1XnIiUAehS77/ElUOwNpc
 uO4WKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ub8s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab65611676so23237191cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265139; x=1753869939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=;
 b=VfjaQxTlBwKKJ0memWZ38ZAV6JwUZrj4h9cGRZPKPbhNrcKHfB6YAF+KRbc78rwGlX
 0NTgBhOqo2I6SdtEl89FWhC8SXwp9MAR8n4SBAmpfGOMLvB8GqTTkf8ti/VmYDU2qVOu
 cXwEOe5xbfWxT75ZO+p5un4YFjYFOZ/eH6p3TD+qTxRyVVGCloeBYjfCynNi2ozCgOfz
 aL8e0GkEz+5VOJskxZH1/6Vckeuf1ESQSNt21ufllUt+9RstK7I9IJQ4U6c7C0Mb3xgP
 VkZ5RgZ1Ei3ln80SnBfQ6vrtrNA43LrmQGGgPPDA5mH7REHY5UVilKAr3im10LQHKlU7
 5C8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0wHMkQrCklFppgew09ZZRXDvoJHy4aCtVFglhz872fxxSgJaq0fSG9cO4QcbPP76wzvL978l7jfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxS38QRZWgsp48H6a8xWJs0Cf8IshXozuSysJZ9MmT20hKmJ2h
 vVBjukGtGQXqvBuaGCCfOfgkerw1BZ2idqVZNdn5/k1wcD2tsrPrpWPuRhVR4Pne55vFHBZUCx4
 pDUajn7r4bAeb0r2oTA5IRSQW+UksfmzEMCdNu8qXIPaypMi6ujGPypnqtBVZTWZSiGsKprw=
X-Gm-Gg: ASbGncuHx93Y0wiL9Kh4eqhAuvf5t+bL2zNF264wSC8gDddYzIVJjF1sS6rhRknt2rw
 xel+MxiuBJY9aiTX2URXT/n5p+jmiAWkWmQMzu5UzlMjIhUfajuhi0+sLGbe1RKGe+hc8vqnha9
 IrOP/wvlLbgMMnfAYsjqYQJ8JilXmnvD1t9IZaxW95kkyU/plF/X5h+udbfivnSn/OC0StZUuX1
 njrSuGMMBSHK3rtyIFj9ZxVW9DPxXR0bqhDgu0QWHneqPShY3b6/vGj6FvBRTeEqzB0LtaRO8ru
 Aq4st397CWNbmsLlYdsuq5TedVx+NjQPKnI8co5FfuAI2xWhiFCp4vUkVX6gp9F/SeOvApp74PH
 jr4BSK244OwD1NNT89Q==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id
 d75a77b69052e-4ae6dc94975mr13062591cf.0.1753265138774; 
 Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7VWxyiO/uqaEAXmfUFM7818+WHuRXfXtfClF+Ol27/qeXk++n++ym4I/iG/5MBDbAN4drlg==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id
 d75a77b69052e-4ae6dc94975mr13062291cf.0.1753265138140; 
 Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f0afbdsm8405149a12.6.2025.07.23.03.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:05:37 -0700 (PDT)
Message-ID: <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880b3f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w1FpSeGnf3HiULV0hxkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX3iGA0/PpuOf5
 6yJbUYxBem0blVR04OrH2OrgkXxXwLZxTpu2s+GbZcfBM1VVBAXSl0fGcBsmZHm+f1zOBXIKr0f
 2MJmL1O/beWBWrpFuIjlYk8MLClRdsa38AeGqFx97Cc+tFXTr19vafuA3fIlkuh0ge/PNU4sWMH
 pKBOiBejYv4lwAi2S5C1TTzJR5vWCjnHKy9Cygxv6UXkAImluYmitpTtZv1dmRFfzZslrZCLyr2
 5TYTqZuxvdLHhA2gSR1CwbWJA7QXFqrp8UBVcrTexaBl6CL8izzzzJ8rIJAmCqiHbYR+Z2S93bp
 xQWFb0eTE/xrXlbwwPkipuTK0pXhApl39oW3fs0KERXu4AEjqnT/gOXzcUG3ikgeTBSX6lmdLj2
 tBdX871mI5ha8J9BS16xLhpHZUEq6IP5XHWNHUO1WQGnYa7ULYIJIs/7jM0AXNSY4I1P+sFy
X-Proofpoint-ORIG-GUID: 8T8AhgEas92jadYKNZE2SOgOeDn6xBY5
X-Proofpoint-GUID: 8T8AhgEas92jadYKNZE2SOgOeDn6xBY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230084
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

On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>>> Set Keepalive votes at appropriate places to block IFPC power collapse
>>> until we access all the required registers. This is required during gpu
>>> IRQ handling and also during preemption.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
>>
>> a6xx_set_keepalive_vote()
> 
> static fn! Why do we need prefix here?

It's good practice to namespace-prefix your functions, so that you
can more easily find them, e.g. in a backtrace.

For a prefix, adreno_gmu_ would be even better, as the register doesn't
seem to have changed across generations

Konrad
