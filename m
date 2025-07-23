Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B62B0EFEA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35210E7A4;
	Wed, 23 Jul 2025 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0yrZJWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083E110E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Kxs0005629
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=; b=Z0yrZJWeWkVSGRng
 ztzDGzJDZ7ad7CtObEmZZxE395gQXCp5/a/bKKALwUBwhajCf+C7sYP9mdJ5doP0
 8yteaZRW9EIKZX33NyvAm3XQ3yWjm8jwy0qCYwOBYf9kwu1oEAmsJLTMfKuguF7W
 SeiW4YJ08+ybvypPghMWMRPzqJmYh+jssS/HmL9yOkCxkHbw6U+ulUTh1A6AI7yK
 rcPWxFbQLcAZ2BZqakZI2qbqLdvX4OXucGtR6MdzQKaBSWh1FpbAeiqwtAowSiiA
 vKMbdQ1w4Zmoi4TnP9nEkbqixtLdFwvpaLRTF5G4DyvyzDFiSK6fhZWUNNmT8CpR
 BhARHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ubbrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fabbaa1937so13912336d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266832; x=1753871632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=;
 b=iebFWNhwlptPZ0AiV5gllo6PCtDx4zMc1aRnQvL0tH5XKYHPxDMQ7+4QjsCDDQYh27
 4U0MapsUE/TGhlDWtCmn1Mz/03rc9ab5j5pBnyNN2Y6MOovnNAZuZoqU0OqTFhgcmvrz
 B8qflWyRweK1mNW3ux5YI6I8zNVhkksYU5Wee/wTds/F3NJotaj4HeZZJe6PO9kNs2Fa
 8IE96Aj0hypZ+UjRTnwi9QAchgm0htsyObJ27gco5A1xeaAshB2HpeMNNGkTW9jBp55N
 1WI51Rc9FBZLjiw+sFzYsq/CSyWheRKXJaWwnl2M/PLNXb+LdyY75src7qvJPwGENkr8
 n+8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk1n1HwzRuPHO/MmMQYPUZhdfyRWqFligvYm0OoTIXSPYxyGilGjG2+OdXqiJJIMmKCDTlriZlN9g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD5RJEWTtOrakOzMU2FSOfNuXqf4lQgtsuI9eFW73OwARYXBpQ
 vRAKnohkIlcMM+hlm4LZv+zOo3CvMGv1cAh5FyIMz8LKQn8JucYDFJmngJL8fk19+QMsbxLk76H
 OaZkW9XWWzEejVyDyaNDGGFrNXMxl5C9D9G/aH3H0eqsIZb+G9OCoabiUlWxlOqCfH1qNykA=
X-Gm-Gg: ASbGncuTlmMYZ0DRzGDXCcxtbNbpWfSjNFXk4Y/CO818Yku7cjXCzDPaKK7g2rWTnI9
 vF7Qi6oUZ60jGcmXbChpeOflYrTTOYgQu+9L8AeFoBsT974uf973ehsIF1zx3rOhC9OISeRFuuY
 BsBR7dbSCLxehqnQXnfjhf6nlghtxAIUoKpRxR9AMP096tAljuhwpwc8pPnFNhFfoV5QJ3o6cg9
 XAziosxDw/S3Tl/AArpliT4btfOxZAqPP7QgU4Pl8bxj8gL6Zb3YpnVX2jdyyQWqvZJ/ybXn42B
 bbZI0kP0Wt/U4ib51QlqCzlVKkuuZzl95nvddhoBhXDXompDbTCEv8nWN5+FL0oaezr13DtxmWP
 J+tpseoQoZSJnmzNs4g==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id
 af79cd13be357-7e62a1211b1mr119488385a.3.1753266832058; 
 Wed, 23 Jul 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2NMUcGI464RrH7J7b4NwsfI3U6elRNVRs3V+eXGNIbBdAvL30yamLCKXZICj1j4UL5vBZ6A==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id
 af79cd13be357-7e62a1211b1mr119486685a.3.1753266831636; 
 Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d68a1sm1023903366b.46.2025.07.23.03.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Message-ID: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880ba91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KWxADXa3oT3Tu5R4PFYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX7iQQgXSSAicb
 hwjLLe4ixxWRZkScO5/GVp3GlyDPxg0AAwT+McJKc5oNkAMii/8cgKfqplf8zZ+Jdy5Qm/bfIAf
 C84PpN4o8IgxPRqK5rBCDjxc18RXDY7qYyDxTdh6UkShH+VkoXQKIyfkZ+9ZNf2JFhf7k812dfe
 5jGX3c8aM3h1C4TOx3JVsAIw7exPRmS6cq3R9T7UnG5ilNLjKeALvJzXHngTZlXyLjlXwl3OrEE
 96UDnfclUYDDuRzf7VxPKo4fNXmLJ7xMvxtkwgdKn7/PsfYEIvczT23lFuCy1fJjsfIVCZCgaZg
 LtKSZ6a6wDNHo5a0ECxkFh9dY4rVzMND1/imgxRLWWUEk6//bjNt7e5ZeB/LM1qfhEfG6KEc1G4
 jLUCjB3EZfHBet+PqSII8Rz+GwUMv1I6LX9sZPalxkZUdvPdrFkwDp5raMvws9VWy5balOtO
X-Proofpoint-ORIG-GUID: sIwnx_zOLmLJJ_pgo4UICQuNDUII5Eib
X-Proofpoint-GUID: sIwnx_zOLmLJJ_pgo4UICQuNDUII5Eib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=774 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089
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

On 7/22/25 11:37 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>> X1-85 gpu.
>>
>> Nit: GPU
>>
>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>> supported on those platforms?
> 
> Sorry, no access to those hardwares. But I can certainly help if someone
> wants to do that. :)

Let's get the groundwork merged first ;) 

Nowadays you can reasonably assume we have access to at least one board,
no matter which SoC

Konrad
