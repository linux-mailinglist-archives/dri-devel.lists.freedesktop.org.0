Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E81C0DAB6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E0A10E476;
	Mon, 27 Oct 2025 12:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPomL/Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE510E477
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8xIMa1164950
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=; b=KPomL/TuboAPo+sl
 OFjAhcmiPhBOLe+KzbXBZfPL1GnTUPWJxo3IeZghUFgrUJN8pOvrMZSuAReHdxQR
 wckDlE/ZATkF1VKg50GPZ4TkORxLDdZyjCnBB9/b6kHx1x1OUncnc9gSYpNLHxpo
 x7aTMuHYd1OW4Ftn8Ge1Mx1Gb7j5CpM14Bgi9tBOtneblcI6Zkv5edK367lv4MF2
 qJX2BOfmw9GhI6Q8f/Q2ZyEPeD1vjUXO0x9japLYzIltFG/BfZWeSDwZJEQoMFxq
 5uWewu7IIky6BmISPqHJJ1OTis7rfcSEVczyxtnKvR7/znZ390THbegPFAs1bEON
 JDPmOw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4ja7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:48:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-826b30ed087so14014546d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761569317; x=1762174117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/Uv8H0003TgVcInLi9IzeOjAS6Ozviq/41bAtMg430=;
 b=KhCpniZLyvlQMRkTjAPb9ttVHUb153zN0PqA1LLcb0Yz7RHjKUmKnCY+XgKRELAbd3
 Unpin667r4R3doIG+YpF6b6rEG3mnalB690X4NWDynHMqchDLBjrWbyc9wK3Z4webkwH
 vyAcVqpNrFl8GyB7Uop7pOWAPfktlbsCjx86CsCb/agic3t88EGzjGGwk7nF+bJxJSwm
 Ln4umeL81kx71Rp73FaGb63PDNZoT3jbm9DANKNCOSdqImQDGeledCOddQSFqlN4J/Lv
 kdqTfPZkNCqkoHODvS3QWidXfQcZ1vJJFprudkgV4PAAJcF9xwuqKZFY/WJv2O9C23ml
 rWDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5iGVwMUeSmKH5Zr+cyhK3JgzJmoQpgbbkGFcCmO7zUZtVI907xmLEoV0P3KoD2BsxWtEdcQFfjhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH4Tz/axQ9/adR6faWLfOwyy49+leb9DOl8Q35Gn5QlW0YlGZK
 9v+Dv0yba1CVdogy9jips9ju89Ev5gfyMqMDcUlKBKNIvPdDPSbJSXV1ajS/qIi5xg3ixncdEGf
 xJ1G/Ewib3/q5LbdYRn4nn9C7f/wLbMuJsNwdnPUv6OnXwerhpGGUlpq5Dwz8gD2IR/gOOyE=
X-Gm-Gg: ASbGncsMUVb1/zq9cMtUq2/zJVaVRxlB6nzBWIcu9cPaFa86SgPUEEXEjO4Md1DA6mq
 n5e4dJSGNN2wjtUdkOqLd//CCecJ4AcvvkXbBYUlp3GBkUrVmLzSc9jHXvRhLNCM3WlizZFGRCI
 6V6H6TP+C4ZDoSmW4C1KSlo5j6Ijc6juerZR7/QVSs5o1bu/kfmNQgrasO6ACYGrNaO1Kxz6W/1
 wp+PbgSt9lXJRobQKlz5Ah23j3RXU+q4LbEf4dujGLyLjtszByf+BZyP39N2QfbkzFmUPNjwoHB
 IPXvq23gbzNVuUJw04YUAqYHkOgMz2k6j9Z/+MZaKAwIh3afNLDqKCs4ZpcCCcBG8qgDLwu4vb5
 kQ+aNQPcU00WkGmpz0ivTnvLQWFu+PoHVl9XGPa6CS4z0noMGyPY0Ytzt
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id
 d75a77b69052e-4eceef16c1emr48423301cf.11.1761569317101; 
 Mon, 27 Oct 2025 05:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdTHwN9Gandf3Nr8idY1T2xhuzqElR3BXPKvTHU3HR+2RoVvlDvxy/LNpNChn+i95pgTzFOQ==
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id
 d75a77b69052e-4eceef16c1emr48423031cf.11.1761569316647; 
 Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8544f8eesm736062166b.69.2025.10.27.05.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:48:36 -0700 (PDT)
Message-ID: <c8cac801-574b-4e4d-b233-56dc5cdbaa26@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:48:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: onn57gBHy-EVnSASzzjhfyTj5teG6YS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExOSBTYWx0ZWRfX3MFIzvD+ZwXd
 Na1yGg21GDV04CLz2R5XVguIj0QOFvVxqIWhqLuSOyGg1o5lVutynaSqVayxcd766WRoWftNkwv
 xCgbK1YMA9LtW6Eow0Vmh41onwn06NtT+CKxhRBnr6pYQXMELCVJH1Y/mmK6PYt6k0fm4KH6mvZ
 jhbYlgfNiJ2kFRlVeCaRyvH4uUEFsJOWUtCMad4bgTqF1cndHMFH6Afmesv+81G0DkUIB9JQYea
 27tTIDOA8CkVVA+ZjmcxYbe/ocvBU48TUC9KkSJPP5CakjWSXCmaa2lMD8tl0RHRPKBWZOO5KH8
 b6+xRYU3eDfMsc3JyP8dWu0Kb0A1avJCR/kSrdLDBgy7oOK7zf1LEA4CP6hMcwAw/mGbSFLfkfp
 aX/y8skSiskXsu0zr+61f5NYa3SMtg==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff6a25 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f1DJfOMeYKxADSZecjwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: onn57gBHy-EVnSASzzjhfyTj5teG6YS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270119
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

On 10/24/25 5:27 AM, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>
>>>> Add DSI PHY support for the Kaanapali platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>> ---
>>
>> [...]
>>
>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>
>>> These two addresses are very strange. Would you care to explain? Other
>>> than that there is no difference from SM8750 entry.
>>
>> They're correct.
>> Although they correspond to DSI_0 and DSI_2..
>>
>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>> new features. Please provide some more context and how that impacts
>> the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Sorry, you're correct. v2.9 had a number of changes instead.

Konrad
