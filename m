Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EFC01019
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BED10E3EE;
	Thu, 23 Oct 2025 12:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkYZzssF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE5F10E3EE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6VHlE014616
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=; b=hkYZzssFwV2Jk/VP
 Or1UkHDtl+OCssWsyMXSrss8YPIrs8IQNa/xSLaFxmZpL459R13jJTjsil/n4/gz
 qmDEFbNOVKHDFL0zZiduSekArgVsJVv7ingw2y1cM4EMdu8+8ziPdoNH6xKN6zP/
 1qKNWfZEcFQNtNKA1KDOaFxMbg5P9ke3YTC+tlWVVMyDQd7531vcA8Enxm2ElCwY
 8d/hsXzGHGtNMGvBtdGpzHqZjDUCj8TtGVvwUN8pFhcES70OEu6f+hgxgKWXb38Y
 0HK8lhn06ZCpJ7t1tqdsKB/6B4Cdosd6YQU55wSm3w/xWBjfeEBQ7O4n3LANeX2V
 +6F81g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0p8bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:10:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78210688ee5so174069b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221431; x=1761826231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0aZaieSuQfEQiaRXPzHRxz1LHJpL/jxRnElnXAHQ00=;
 b=w5CC1jmlVhFCHmgLZ1ayx3D7A21JAVDokKcqoeOFGD1rns3KQvnWnSezG83mMSnEHd
 gzqEm3fX4dGhrvicBNsx7IM6MPG4x1IxoSLpg74wslbZ6D7wDVFyQzj/JaYoX+G2IPvL
 clzKiYGokbcQHw92upCDa8WJX+kHgSG2p2Lxb+WkSISpSU5EpJxT/Y2nt5p+KT2+AE8H
 4sNVkf+s6wmpjFhiKJ+bRlB14CHlfMooOVN+3adAeOucPMGTeR8ZzJKQFRXiy1X8cHVx
 OC8YEntifAkevF1b3PB/ExhC2GDPXUDSJaXTE/6Ca+HDzkr9GP5fR3lBRD0i/sTcZ/VI
 lIYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLrWqDM/HgMRobKrZd6FhzW5zn/1qeTGvhempccUrVK+Rtb2ZyKQYeUgXjnbyzYO5u6lfUx95cD/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeCJYIFH21HTxn5Z31POo8xr5dz2riWjIvD90j6kYjOOurYSTK
 7KYbWShcbuet65115v23zR+ME6r7mEZ7/cNcZq+EgT/LKrX5nmTiGokquzcvRn5W+U7NpfCHG2D
 Xf4YWthQz91q/e7AKRQ8Q0sgazoJy/nrowFrxua8FI3l4g33rF1vEDzmlR4qFw6IL/lE2lV/B52
 6iy40=
X-Gm-Gg: ASbGncv8XtAmTYqBF1iNKimlqaOM3UTnKmAo2QgoRd7Sg+FM22sDDYVe0rfrabzqXLm
 6hSAhqv9UvbATfAB7SSHUaeiOpHo1XziCMWoNVwxW/470w7i6VbplavXpyfUoW3z4oEjokB1N67
 kTQLX4iGEFgts3UWDMnn169O3JSzZM/wV4rOTuVbonyC1n9gw5hqX3mGGsHxYTD2vMDCNC2YP6I
 QeplOzApVp78qbD9FTP/ZHqDwmAy9fWATwXUV+fjZkYEoISh3QpHdVJDJgaDR7SPkSbA9LmNVJb
 4cCG9nuJOsUo1N+Q4EmTv1/PKS5Dvd4qgm4UZQjdnqXVwmm5i1gsYlsKnBwwAJYZya/dMXL0sXR
 1m0VoDUmKt42CNFR6yMApeawGpZQi3IQb17Uoh7qu2kUnJUxUROGwy1XT
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id
 71dfb90a1353d-5568d9b7b78mr1297670e0c.0.1761220971134; 
 Thu, 23 Oct 2025 05:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI7NlxxiPR1mSCsIzjh6laRe8aVKmqjEwN4VIQypjOlNUn1ZJqRFIU7gS95HufUjGblo+7VQ==
X-Received: by 2002:a05:6122:82a3:b0:556:8d9b:70c3 with SMTP id
 71dfb90a1353d-5568d9b7b78mr1297635e0c.0.1761220970676; 
 Thu, 23 Oct 2025 05:02:50 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f322e30sm1526903a12.27.2025.10.23.05.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 05:02:49 -0700 (PDT)
Message-ID: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXwMbZtL8mIoef
 zmdfELQ/+pCpWHhnFCGu0tUAIOMeEfhs3k9gNzgo+jUJ68HHElX/+IhgJdjAZLV/KgF0OiNL2DU
 SckOhrTZ/mI+11oofXWDjg58KgPU7uY792VRTUKMrxZatIH0Vjwl0l3Jz9E9fetteK0xT9KQYzt
 7fyJ+ohvnToHi8nwmkgkddwl/jZYdK0RDMlWLI3lO5/m7o6agpLNjl/cWmNYkgkbzdTfrJG0AGj
 nwIM51zOBWOad9TDH9j9AE8mYEt3dOZwpL+9anqEstbrO+xHpWFrchWzNQT03nj1l1M/4UyJotO
 upswNSwhuMI1gO0aSzbB27NU1ZFua2voaPnboxDJF2oZuy/mVujVu2IQUZCPgW3l1vIuCXVh0Xy
 dtYaqoM045x9H+4noC1VuDZD0oJAgw==
X-Proofpoint-ORIG-GUID: NCaSWtj_ko83L4OzNWk4SKHroPlgvgAU
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fa1b38 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dMqN5BQ3aGG_qev9F4sA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: NCaSWtj_ko83L4OzNWk4SKHroPlgvgAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> Add DSI PHY support for the Kaanapali platform.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> ---

[...]

>> +	.io_start = { 0x9ac1000, 0xae97000 },
> 
> These two addresses are very strange. Would you care to explain? Other
> than that there is no difference from SM8750 entry.

They're correct.
Although they correspond to DSI_0 and DSI_2..

Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
new features. Please provide some more context and how that impacts
the hw description.

Konrad
