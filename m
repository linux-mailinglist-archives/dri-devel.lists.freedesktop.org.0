Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30775C7D182
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 14:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACA410E0A7;
	Sat, 22 Nov 2025 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV7g11Gd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hueHt7ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57FC10E0A7
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCbjvc2189686
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=; b=ZV7g11Gd+9rmY05K
 Su2jZxirLh8vfnW/m3N+LbhJOcNCIFtogtCQ1g3f13VLkv7QpMfJOZN7/f3s88dt
 7TtCDpLP3KgeyiH/+Mf/W7ScefB6Uk7F1a2RRioeUQHh9Jrgf+sTJA6QWJl7amab
 Kw8gFR/7/AO9gIrW0dnehX/FWY0mkKj+vIbFX+NeiTb66LaFNR2dZGpjTdFZgAnW
 gZO0g646BZuHVeVPDh6aWO88NpI9IZn3k0yIAZhO7RjBKV+46nIugWvu6GEVEn0q
 Ptt4ca5egQ2gDx03NTGvs6ET+Lpd+mBwe73inbnn4XGWVQGfOppTs6H9G0KWXAl1
 g2OEMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6f80p4p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso9938671cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 05:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763818009; x=1764422809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
 b=hueHt7phZ1l37Fx2+WTn7gvRsOj1L/fyzW+fkVTP+0iJvI9b7hrpdebF0sZiVXWUnM
 zL3H1KHqQ2BFEM4baC3yXo8BNjpDkubePWDG/JkSvY94wCQNfW1oYveWFPUq8Vb1rUiC
 wwjVK2TGFTSbbG9jwSc/GIxDslYndEyOwupiLKzp4c95lFNMpMbx6In9h+ya3L207T6Y
 8dTRCZEM7bWsdK1eUILYuHGtzKbtkEketjXZB2BTUuMgkQQH5DaslO+KSAdHsFTq0Wau
 71dCvPCI8i28k2vVMZM/qauU4dcNHxc8HORYmeWA0OwtQBu0H0s52rNzz4pRpQ6wDe1K
 KCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763818009; x=1764422809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
 b=ww9X168WrKhQFGYRBBDrBnck4a2oTd5f/ZUa86WzNST9qUPsQSpcNOpLCC/0zmJK4G
 rUwj8Aq84kzUQJ0+uxTrJco6ewl1M4IaKDFwDX8LqjtusNuAfiaIZqGSNlL75kajv34t
 sP3rzj7Nl3eNN6pjNxCPlsu1q8zN8vS4z3zKlSYhSwG+Y/sqEwsW2sKAIv8veqxkViZY
 5laV0IUJ7p72We1DCYyMIUGtDmweLSf0qnKcPKaKzYsn+n5MxmpMJ8qqEWKr55sekidq
 kVfUJJFLMLYXDwIqERTSZ5vbQsDlDGCOytEZG7Nz1S5nXgOlzm4egsvLj+Iu8wgeXY5m
 DzDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrhykgck6jLu+pfruFi3nCLKXPZuKkaAh7EXPbfB8BnuYUCwJyx/cfvY1kyj+znf+nBzfVmBavad8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2L/xtGTXmFVmRDldJTWANnp5b++N++ZGLXrGTu38YcDfoVQbz
 pVr8HkTqm90Fk6W7BArK3rZJ31TrhVYxhwKHnV3LJf9arM1OCUOr3Ecfe3/6O586MPqiTqty3O4
 Bv/EWNAGfL68l+bC+aL7/jDYdJUDaMc0nq8AXxJQB+FCVxVDv+VXySD9lRi9GXFGa+Xjla9I=
X-Gm-Gg: ASbGncuJQayP6curYBUCST/PafMATjXK9Ffwt1nkhvm7uyUKfB46TlS1tci+KrwHh/O
 j32uHzLhk5KJbFGpJPoe192QdK8eyemV9mXfn5M0Qe/SrIEtqlwuQUJCHmlM2yclPGKhYg406hp
 I4CnIem/87G8/5D+Yd0zZX5nLW+upfZKAkN4n5kz3S3dkwgQDsktMPniww32sClZC0RrxY4F/LU
 Nr4HyrkZ9xi8SN4MFi4RcYEaOuYFa8cwYia2heTlLBu9RqORA+BNSaLVzZB/z7S3wx1H4UCCeQ3
 yMfojkQGcwv7s8RPWqfAojEpkpQrtVUhIS019jVSorHqAMJOEr7BZbpWGRSycG4ql4bRvYfT4Ca
 k4BrnMRqaLtVoNiVg6JlzHKN6wpd+8y1XkJuP1Tzo+wRDblBfu7S7QUqjtONSmlUfNkw=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57035981cf.10.1763818009060; 
 Sat, 22 Nov 2025 05:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzKrHFfiXLL3t7qcXOYH/9ZjJQXSKkuyZ5Ow/HDShaOvGBaRejHnuNettlr7Wma7Iu0SLb6g==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57035771cf.10.1763818008664; 
 Sat, 22 Nov 2025 05:26:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d7cbebsm733074966b.29.2025.11.22.05.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:26:47 -0800 (PST)
Message-ID: <a4a487e8-4dd3-4187-980e-f77e97d0e85a@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
 <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VTeYhSeIunfRpD0VFpQSHZszC_Veph-5
X-Proofpoint-GUID: VTeYhSeIunfRpD0VFpQSHZszC_Veph-5
X-Authority-Analysis: v=2.4 cv=SINPlevH c=1 sm=1 tr=0 ts=6921ba1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=75Q4ZoG0bmdH4YrKQGkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfX3/FkavSLVPUp
 8vU8Umcx82lx7dP/NGqDlVBvGB6+aZlWvucXU55IA9Mf4PlDo3yy5yFaSVigrCyeIvvlqiK3fjM
 3FZt2PIv8yzVhv+LXUoh40cNwBL3ZzKU0DhDKynaXIhLB2/gTo/6/tBaT/jwH7h9XedrqVAX01p
 UFioGqeLxKAr6MPomcra5efpgADfwqhjMCpSQPf2FZ1F2WEqRZYSezvkf8/zyOTt3fzQ66zaOZK
 tv+XQUcwWqSyPv4kDZVYRpZxfkVHzBkMPVbVR0+tM+KvDRPtK/y1d1QH4o/T+yRhQCbJqcPw6aI
 P1NtseibCZbrX66/EahU8hIXViJTK6AV8MmKFZpcPbiKp31JdTJBQRcGw3eZ6OH1OQA7bW96MK1
 E6SQhrmYi0CE8aJoFNvB+SodmsvsVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109
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

On 11/21/25 9:38 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 08:36:08PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
>>> Add two remaining bits necessary to enable Adreno A225 support.
>>> Note, this wasn't tested on the actual hardware and is purely based on
>>> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
>>> require adjusting PM_OVERRIDE[12] registers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Dmitry Baryshkov (2):
>>>       drm/msm/a2xx: fix pixel shader start on A225
>>>       drm/msm/a2xx: add A225 entry to catalog
>>
>> Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary
>>
>> https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c
> 
> Yep. msm-3.0 does some other things for a200 / a220, which we don't
> perform. I don't know which parts actually apply to our stack and which
> don't.

Right, this patchset at least fixes up the obvious errors and those
interested can poke at it more

Konrad
