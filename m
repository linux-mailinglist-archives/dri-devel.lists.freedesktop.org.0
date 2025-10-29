Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14EC19775
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062BC10E1A1;
	Wed, 29 Oct 2025 09:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nO/CMfSu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWuJ6a88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72F910E1A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4vB7n3755240
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=; b=nO/CMfSuJgXwZrsB
 YE+XH/1kPNG8FZ5xCpIE6LmWig76BSInQpp0cgV5alWrfp/5Wuuw1FXPBSwadAcr
 STCYgJbM8MAze1N/XVAjYSHHZn72PgbHkKrX06XB1rZaB8vLC0kclkOq29RhH9jp
 bOoZM4CkvHPzZfJYJruybBCPvDOVh1Vq8V7jvsljdmjNnzr0WDrPV+Ua6uHJ5tgy
 iZMNKcDbX7RsbEgsrMI6Ub4nd1a8Uj4ovZ0GM6RLFYIUs+ekSi6euimzvRUsC4so
 VicIKSzmvDWl7awoLeGR4TOjw74n7GiVfxIv5BZ2LLcsWp/juN7uHyxY3ExWYdGR
 QPKF/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a022pg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed0633c433so8359091cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761731318; x=1762336118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
 b=WWuJ6a881T4nXR2uAaSqliJRcvuE2kpLGrYDn2b4xkDcMA0iJgTGkZ2L8AsoTz15mW
 gbtCqn9peiyu6nda+H1DL62/kDFt2fvV5usHhn31eIz2Xu780UtE3te57dPl+4LNnt9u
 QEmFo2XnPzNwTKFpict5FGve+8OfrpNZm8CucZEifxPo3lH6nSSUSgR46pS08cOPpq4F
 vgkJ0b3gcuQCcKM4g3KOjAHyDiBScWBeB9uoXhtHNqHU4ZTKyZZ4TzLdWMfnDwDBDh9B
 AA64ugVGOXkKQa0LRXLJf2/Gv/BDgWK4FeKvQAYypDiXNFgwLi1ecF89jbocmWytVkWz
 G39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761731318; x=1762336118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
 b=f3mHCiWDYkLiXB5tCftq0yL/GrjT5k/DGNSMpU2MF3Phnrkv+ngJgVGNyK+dUENP3t
 meEXBGMTu1Y4dobc+SgUDyHR+aX8f8fi9xM9sBSDZSn+22KjLnlIl9C03YliyUjoh6sm
 nIBIgqX1KbL/4ghMrz2naCV2Yv4imY7hT20DhofafAoyyyQ4VLXY6xS5d7A83hnuUQW7
 jkin2BtIgPYi9DCoTYYdqLUL7cwb4vJnrPDTbWUoJQU6NEhnDWVLBZlv78DKY6h12DS8
 dktQW6kgWUhzqfNGBo+NW17yShUzCVVcrsfx0jNGPb7yZ/mUN6jRlsujmCiv7ypQYm3k
 yMGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdCAquMWawmTB6qtXRAeV1kF0xlq60Dpe1IM1CN16nt3SEDmh37O+EbwNxQpl+FrbvUqm9O0tmPbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk4/fU+28bsZ+4eey4+vwHCoWTeU/mzFbYtfzA/SDFoAxaBiiD
 nrvY9vFS/vPcYbjaX99eMifk4XDvWu1bfEOw3Hc/J2sgWk4whBF23hH7t3kfeNtQm71Z6kwlHHL
 l0RKZsZGC8rRmJmjGcLGQCrPIVCAikgK9mx1mr9w6at2kRdzXPZGvOVv8nQ501XFXxOjRmMs=
X-Gm-Gg: ASbGncsPASgz1V+gSBZII3UTyz1lBkJ0xSN+2sZmS8lXDNq/8A88nWCnIREUe8+vb3s
 SyNikw61cdXoHe6J7nT9jDcc5fufGWcdfyfVmS3FFsgzgRvZhjh5iL/KcVbrwXgWMelRCmoCT7O
 kHGb2BgjQoTEzTszhYj/ylMTXyXgq9IfaVNjTEjancgtgdpqGYABm/8bhOF8kLxaJdvjvPuST4p
 WIPacuplMR9XZHcjJwMmdqe7FAVgBUmOTfTwjwNeZKnu70BOyc8Wn4AsA7U58Heh8XW6/zFzH99
 nZuDH8Agp+XtVG/O4LoEInf8dPaO3PDiwc7s3BfGDvOf0dlgnxOiEKkjkawaj441ANaNN8lN1b1
 R5XGCKLKelpRJlJDtK4zypDe3GVngRLw4ah0m/7eKL7lYQ3tGqMMnCM+R
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id
 d75a77b69052e-4ed15b5b4admr21772761cf.3.1761731318141; 
 Wed, 29 Oct 2025 02:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYOEqIUpR3rqvcOHQdFhJnl6mL7OfMUA6zGCTArqO2LmMgBKniIZv31BF5P5aE2+XJqdUc6w==
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id
 d75a77b69052e-4ed15b5b4admr21772471cf.3.1761731317612; 
 Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6404de640fcsm757954a12.8.2025.10.29.02.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Message-ID: <c7c26f26-4e18-4f54-8c88-69ce97345e86@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MyBTYWx0ZWRfX441lDBtcHLdZ
 5EGrwVpHfaOgyzWgfAZSgFOEWIJLOOYM4d8wAt+95hPSfdHXenpDoqOx/jbrctXIpohPaVw6TXY
 yvpZTlsZ0F3bmjPVtV5r8LWuhLwij16ir6OQ3757GWCWp7fG9AImibem9JfO60NZ3hvkpPh9nQy
 4iO523h2qAB9Mwwtxc7fGe0PCBLAk/UIQ+B+5aJDRdEnZDs0267MZoCgF9wu2yOXBowXh+7CptN
 mtOb/hwXIjIS34hzsDDx/JvXybH87M/fZviJykZ2WzJFyELn+xW+zF6TQncLoqbpPLjQzwFRCOS
 m61Gqol44AQgq0QpV9WlXgrZdwGDNSfQjidfzzawNgFHfkKj97RpSvtzktUup7YlmEIs9EjwOOv
 ICPQwUqrMr0uHg7BNIXNiJw9uNkt1Q==
X-Proofpoint-GUID: USQHvhU_DTWoIuf1cpMpCN4dM_yFzFpQ
X-Proofpoint-ORIG-GUID: USQHvhU_DTWoIuf1cpMpCN4dM_yFzFpQ
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901e2f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fe0abWBLJpTHcFswpKQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290073
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

On 10/29/25 4:19 AM, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
>>> On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
>>>>> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>>>>>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Add DSI PHY support for the Kaanapali platform.
>>>>>>>>
>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>>>>>
>>>>>>> These two addresses are very strange. Would you care to explain? Other
>>>>>>> than that there is no difference from SM8750 entry.
>>>>>>
>>>>>> They're correct.
>>>>>> Although they correspond to DSI_0 and DSI_2..
>>>>>>
>>>>>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>>>>>> new features. Please provide some more context and how that impacts
>>>>>> the hw description.
>>>>>
>>>>> Thanks for your reminder.
>>>>>
>>>>> Correct here:
>>>>> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
>>>>>
>>>>> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
>>>>> just some register address change.
>>>>
>>>> Addition of DSI2 is a meaningful change, which needs to be handled both
>>>> in the core and in the DSI / DSI PHY drivers.
>>>
>>> DSI2 was introduced in 8750 already, but it was done without any
>>> fanfare..
>>>
>>> I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
>>> and an output to DSI0_PHY (same thing on kaanapali - meaning this
>>> patch is potentially wrong and should ref DSI1_PHY instead?)
>>
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},
> 
> Do you thinks this fix is OK?

The MDSS documentation says there are only two DSI PHYs, so perhaps one
is not exactly implemented. Let's get confirmation of which one that is
and keep the two functional ones.

Konrad
