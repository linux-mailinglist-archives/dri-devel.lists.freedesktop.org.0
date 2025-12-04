Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071BCA3CFD
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337F510E974;
	Thu,  4 Dec 2025 13:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiQ/TYI6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTznLwM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC0110E964
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:30:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AErgD1179124
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=; b=QiQ/TYI6APScS+NJ
 niD/QTuZM9Dopbgfnswavv00ciOyPZMwn1dj6Nl4L5whp4ls1c3Z+jVp7Lk/abd9
 89bn90gp3fulPEPZ6kZ9A/9UT81Lj7/8/m9sSc3WwONjqLTWM71UjC7kSI6cPxx1
 EIriU9m7leaaWO/CuMj2FP/gQ7zf94YBCfKKSaU9WE4knki37X5Rdki2fRz7AJxj
 PTY7R9A8T1Q27B5Vn55IzcepLKsYZEPhG5UpPCItC1rTu1Qe8AzcdGb72IofBaWt
 tFQ5uMNkYEnIgSfmQHc0f1/sg43/flis4NFCMJotPGALrPbHUcl9CbUXSL9jf6ZX
 qpSA6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6v1gw38-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:30:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b23452ec2bso4923885a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764855043; x=1765459843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=;
 b=CTznLwM5y+hryGnNsth1R0tMS7KeI79Zxrkq8jHj0jti5NVm0eS7+dX7UN1KSMbxe3
 tncGyzAkNMKsvIeTtXLkeMitfJyAuc5gB9DCF6nOLcj98WF1vLBZbbdIbiZ+ljQT7Int
 aQETsAtZooHROIWnr5vtKFyCOcd+oLkVqXZg7Tp9jEEOjrJkyhTtUYehw+FUiLkE9FJm
 QdZOxJkcd9QvCzCx9M4qXcrhta8diKmRMuHQN2MI/eKkojKYyGSfocsqxXIbiWjRnofN
 cLWr/rmLmrsapa9DVOGpJIU7bsLoCCLxFgcKrdUda7bTeq61m6b/fAaFHI5VZ6on0rJg
 QCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764855043; x=1765459843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=;
 b=v4rdk9CQZCqGde6fliih393RKM7t094hnbuGkaQXT/9bZ9UT2/iaxwiUbCwVRjiqVj
 9FrRVGyuLVe1arC6+3NTAhY9tHrDOX79UFd/E0hpO1i44yM7uppUKwfv9rnFGlbmPhwr
 HHDHadXq9lF/X5b20rlbtkAd9hp5+S/BCk+Bvm4ekn1B/9YeFmEA6DOr0h6z0IM3JV1T
 YPZ8qrOtJJXj6jI9YArjFmtcLWDRy5IlCKjaGQQl18ulGm/n11u7oFw2nYMUDJWJAgUF
 Yq18YKxQsSaNqLptVHEryaFm/IMnyJKK7Ur0liHjkf4pMjN/+5YyRZSmqgtVoEr8x93b
 EeNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoPz4hK/xaOlg3P6UnIkCBqUXlWcwvqBzfcy5H/PvCOAJpv92yaIeIWVAQMrj6TgVwffX2Jdvt+8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysPlt30MTN7HeBMK5LfXAFY3Sf2xL8fO/WTt9TQ+TlkK0J3lid
 wR3cDKdtfkL4jTlJd9xv9sviPHpNoZ/O/0FJr3wzqSBu8OCJoc1pQht0eAtnqJbhNGcNcafzV7+
 ZOyKqiYhmIaUSMYO5oukS0xRwWJJdzXgBrldP72508ZEDoA+15n+a05jCNM6jNKgiRSD8jM0=
X-Gm-Gg: ASbGncsrIANBhUb0I/C+DYtetbmP6nqls04qjidMGOEaM9SYBFRS9h86/GIw/FUe8pp
 ySm69D2dN7NRvMVybiardDyMlGe6wNAVytTyqqjjOR3EgnSqO2NGp4gd84QfrynclqvoC8Xrwef
 IEM4OhlTKvmjUqxtumLCw9kiRxEPSXohUEs9J8b4CiDwEmZXaihnPar9rbPm6R6b71O4luzFwAB
 PmXn9PNKCo0d6VNvA0quzsrmY5opTP85hsH+ONKdKH61gRI2MF2Yfa7H+0309KqMmKHQ8UwRv/I
 iXIdmE2e7av0P/sv7nbZhJz/L7EzRCEGXgvLWrITuqOa97RAnTcrBS9F4Nrxe4jpt/kgBCTwvAj
 UGjxDl9bOHQ/xPDoP/zem6GNjyaUR66avinzrXzUq6OCBHK5j+O1Iit7Hjzn+UPk+og==
X-Received: by 2002:a05:620a:290a:b0:8b2:a3a9:f74b with SMTP id
 af79cd13be357-8b5f8c1fa04mr559435685a.5.1764855043085; 
 Thu, 04 Dec 2025 05:30:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQbVNCrVse/bjoDzfy1Fu+IxiNUu8UAB9MickHfd23NqRepjSCUo8+osnt4fnvQ4yhGxnlMA==
X-Received: by 2002:a05:620a:290a:b0:8b2:a3a9:f74b with SMTP id
 af79cd13be357-8b5f8c1fa04mr559426485a.5.1764855042388; 
 Thu, 04 Dec 2025 05:30:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975dcesm129404466b.34.2025.12.04.05.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 05:30:41 -0800 (PST)
Message-ID: <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfXxsVCmS8DxVFl
 WTki26733EkVgGlZLFvIv9Lo9ugWXLIIbsr6RnE8uvnYqlpkrjM0eeD01YFtdHCIH8czZoP9Z//
 N8nAwZjDcLy7jzpe6PTpp8rOFu4D4PbfmyEX1dcAf5gH7unGLr9QidrxqCT6xgcp4Qel2+hJp0h
 uytEeNpstrpYqNmpKgPkJnfXJMhci/TiugKN3po9sHOFMafOfWgPBH7e4h4TjCTOlZSNN9ZbpAk
 7WJkJrflQ79rHL2mYI/V/ydIY1WHSmav+fB1vwWCVIuI2oDSeFyX9HLkb0ZdWYROvGIcUKcIeQw
 jwjeKIpgrTNbOpijZCZ6kXcr1rFCFRD1z4vMuB71rUvzTb2cGmT054N+skvpyVDXDA5aIP+yObK
 VgE3s4fNI6alKgjXOLLfeBUAymMCjg==
X-Proofpoint-GUID: x1JgH3YH-jtAplm0cpc9216bUpoiSmWr
X-Proofpoint-ORIG-GUID: x1JgH3YH-jtAplm0cpc9216bUpoiSmWr
X-Authority-Analysis: v=2.4 cv=KY7fcAYD c=1 sm=1 tr=0 ts=69318d04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OZq_gVfAIbbHJCx-Pr4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110
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

On 12/4/25 2:10 PM, Akhil P Oommen wrote:
> On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>> Some GPUs like A612 doesn't use a named register range resource. This
>>> is because the reg-name property is discouraged when there is just a
>>> single resource.
>>>
>>> To address this, retrieve the 'gmu' register range by its index. It is
>>> always guaranteed to be at index 0.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 5903cd891b49..9662201cd2e9 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>  	return 0;
>>>  }
>>>  
>>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>>> -		const char *name, resource_size_t *start)
>>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
>>
>> Can we drop this and just use devm_platform_get_and_ioremap_resource()?
> 
> This API seems to lock the io region and fails with -EBUSY if the region
> is already in use. I am worried it may regress other chipsets. So, I
> dropped this idea at the last moment.

Is there any specific platform where this would be an issue?

Konrad
