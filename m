Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD42AA5191
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 18:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAAD10E7F3;
	Wed, 30 Apr 2025 16:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ampATIP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D0E10E7F3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9IhM8013706
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=; b=ampATIP5DmHRxSg4
 iPiUpHLI5jzJ7/fxepbhbJZcUsMEd6i0GwAfIXQZluBqewvvfU9RM7xeKlcEes1G
 8hXP1aRm15zFAG0c93TFyfxq7g+UKgfR0yz3zgSmFMLpVfscFDFBxHkauEHOsiYp
 Pt70VYRSsdHJ2yqrjBjSb9WTrvxWOOxnlqZQIazV1yEz4B+TnsYWZUbkFQqpeXA/
 H91sOG7BC9t3RVPbEUfkqbbSCS/Bry8mbjnzRV+g6ZAR6Z0Nf8DrnBYrU3qZLSeO
 xjIrLVC8HRXDEQe0CTNNRMMS/YZjrVn0TGgW7znvyqrGA/9ooDHUe42+W434pSgf
 Cy8qLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubjuxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeeb7cbd40so121826d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746030327; x=1746635127;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=;
 b=G6n8js5jRFCxwui3lP+5rIYg3yqyxYe47gL4bafqAorym/87u/CIyiOnAkb1piaVGc
 ho21RqWGN8ae3pL8Klx1AYJCO3XgPs/QZzV5CIK3gja4JdjaGqXTRPCJqcbjWBGibif9
 lLm96d/e/LmKdFX1EZ9B4pgUwm3NoVjQIs5uCgABQ0ogbNM/hxwEdZH3X/o57vdFY+Pa
 X6/kfLjPVk02Xnx/p2DUI0BxxyEHjPVrUr4yplK/Yh1L8EKA+d9bHy+MNe8EwY5Jd4Z/
 AhZmyui+mlBNDgvneeY0Ec2W6nzgZMnQ8vzMSvTy0MhRErMOwHpMMpBOsNEp0h53lCyQ
 BN+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7335hr8mrfCks5s4Gu/N7BI6+cLecT/D/QYmx4ugCtJMUhdeVAAA1OpDAJwpJcAzEDGE2i82sZY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/YLoVaOaOXjbfeOIbjoQNPS0dLr0Fm0tep2W6GJEzwv21H2fY
 nUGcTzy3HQ79tXGjQ0u9QJeQhoZ+LII92f0N+BOMH3ktatNq6OwTq7buQ+TPbrv/jfss5R/QQnW
 oeQgK/CKm8F+zDA6mlkkJPNN/ovFyU2m+vd7GRwWh62r9JMF5anEOyeE6Ck7KeJj+0tY=
X-Gm-Gg: ASbGncveWeAnO49tYhaYn7LrUuK12/U5OzoiYIeKYg3EnksKjntJehWJ5Dhp6T657t5
 j7DByN++12ZOl7CwQ3YyQRH48dofxD44j2NuIluiw/D+wbOQIiBhSbTUBZSUNkE1m/z+7ZnXGl+
 V2SY6vxWyAw85iwOS3BSBhSgXuWCJTIdd4Uu5aVOGV4RvFREZKijKAose782MlA5BUHzWh1fb5E
 pckDCUldoLMXCT2jZSI6/HZ7WfPJrL3MZRZ99+ea7wd6M0zOt+V15h6k8VcpHx3bfv5TLCcorSv
 QM3gUcbRUfDnAw5CYzuXA9FtNfcUygste7uG0rIIXO9t4enBZWLP7PI7ReKmWdSnmSk=
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id
 6a1803df08f44-6f4ff2d2924mr18870046d6.1.1746030326706; 
 Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxD7HkUdqpnN+OfcCIzsrbn5QNU9jNDG0l1/EVlSKXcQll60BAsotjGUkxYzwFZKHAhPp+vQ==
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id
 6a1803df08f44-6f4ff2d2924mr18869466d6.1.1746030326152; 
 Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f70354633asm8799526a12.55.2025.04.30.09.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:25:25 -0700 (PDT)
Message-ID: <ee44260b-13cb-4901-a073-2b9bfac2a794@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 18:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-1-954ff66061cf@oss.qualcomm.com>
 <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UtDYzuEoDhxQ2o98BiC7U9tvaCWy0Mn4
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68124ef7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=h3lbVRRyGfeKgUivn1YA:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExNyBTYWx0ZWRfX5z1ZghDPg1VZ
 8vX3PaPMUQNGZdXw/ZKkZIJYCP/lw08Z8QBd0zh60yEBpGNQl8b1L8Z7g6u/L3lv8YF0+bUKf4A
 U58VjpuP64ulrI9OSGA4y78VkaApGfmB7MQ3u3hmNVoIaXhso9X9Iac1FByR8X8xqrLTcTpMXX0
 BHoGZHuC3WjEE2aQt9EUy4ep/0bOGJKv3nXqNoXNeKrjYTTyrNnp3nxQYTntsFSrnqmF3rg16Ou
 TKkLwVua6+3Z1YZ6hVd8P+EMlWpi59jDXcId1NITL91h0S1j080PdA9gUuhJBGMGb6eBFQjOGG0
 0wyt35fhKGX1sysAAIQlNSTPkeZrMpM2jWBrSGJfKsjaa3+NYvdFlBU7DiQr+Hr8Pbs1NSFhXy7
 3A7eA+RDUg+nxYdOb56kB4r+2sRvHoQ9iftBlZguh1YqrNNwaBHiep4ZwYbRRmzRSEVPgw+Z
X-Proofpoint-ORIG-GUID: UtDYzuEoDhxQ2o98BiC7U9tvaCWy0Mn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=870
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300117
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

On 4/30/25 6:20 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> 
> This should be SM8550

No, this is 8650 to signify that this holds true even later
Looking into it, I can even say 8750 here now

Konrad
