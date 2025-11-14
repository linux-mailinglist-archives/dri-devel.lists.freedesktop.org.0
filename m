Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282FAC5CDA6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ACA10EA3F;
	Fri, 14 Nov 2025 11:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvmEGhHa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJVFJnDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247E610E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:26:57 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8Mimi1699404
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=; b=YvmEGhHayMHB5uzm
 enctitrc46sCoSYts4Pd9jZjRcyEUid2Ik/mbTzm8syTdh4h4lXKq37hSw8lTm8u
 Yhy8xu/xdQxTek7UznfSUHnt7Unsi24CjmQHL3RP0QBVu7uPEq+iTY6nQGTFN45Q
 GGAap7UTFISWYeA7ukX5CUosV266vxpbLt6zcavgnyczJO7ANnJaxrfLwRCxQq9R
 u8ZYGBePYg0IyQ/Zzu1PDGTHB74DtlwOFi90Kv4Dh8PSZHso9CgSO+WOGtPeU+Rt
 3iD78ZHcicHcJHs4x6j/DiT6z8TlLjfXAuNPUfpaZR9anLgM/rs1mo1BsMjgydUc
 JJgxmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e20kf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:26:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3418ad76023so4569314a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763119616; x=1763724416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
 b=QJVFJnDbILmyvY2FZI2kp/bH4rOu/udr6/BZcVIm//AvzvngpvgON+JHdDyXF3FTIE
 J5bKdK/9W8dbMQ5MPijILq0cReK+3ZfJwrdk7p7Frecj335KMYtr5F5TaA+r4NQoLF4i
 UEdvFVsKQBrAcsWruBCGzhQ/+BulYxLbh0tHfXBcbXb+cQxMeiGQo0yaD6I0XJ9HtjBk
 E46Yl6zi2d10/QGt8D8ibpwaOGcR9zeBvqu3Qpfa3FVS2kyjSDlqmiux2hMBFelcOj1w
 Mkqf2Fh8zjlnrJthfetZ5u7IFt4RNVYWWEtfN3wLHio1zMBGUPJeJPW3TAwJqs2/IzQJ
 9+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763119616; x=1763724416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
 b=rr+EYUg92MB9hxDuZvC8Y1A2vj0r69AjImhESzuOmsGHhIfYBpY9uxOjIB7pDy6fBD
 yVSs6sL+VpeRqZmjKhupqJyK2gN/PyN1m/Hm1VGnvcdarGXiXJqLQcO5Ne9/JGcJCChB
 35f8ierGF4CZEeCNc8oqAaGQqcNHm+xjzJAGjU8X0dT1pWvyHO+oWA1rZbUVJm+SQMrs
 oKAKHWW5K77qmD+lSkFqLABPkWFUWNeAAzAvEEOb7AwAA4022V1s11mNfXdOrZfYyZ0v
 aUhkNGqMmaUcoQMd97pvj9MwWMB38G2yiIutlJLnrfFp3NTJ9Um8nF8smLouvLw10D9O
 byJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeD6F3PE1XZgClNBy3M+LP4uh/dtKWIf6q7TSdBq//IRY4B8B0D8fcJI+sLkKDlieVwcbU92te2ho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwllWMRpFUyzSZCsSTrIH1JDB1grqjxxmcHQjD1soa3rF1qJU3y
 lG2xL+y6wF9qUivu/twfSqNq7oZqot4sJvQ4dQusNLT1rnLWSvX03Dm0JHYg1kRvtCzUMYRNgti
 3h0n7kopA4V3fA9yaUewMwNNZXNJWjTk6AO+EzivlebHWta1S0ohDps1JeI67k7NtXnDuRlI=
X-Gm-Gg: ASbGnctzJD+o/1gfxDzIJPCm1Sd1+KrbPOVFAbtlmOge+U17cYkEg80JQqTqyvjg8Im
 ZEFbH8DoD0zzEdlcCWsvdJGPanpnOjB8GEOKUs7cxTfs+0lV0naMbGj3yyblbr792FWJHmmAgBC
 is8V1mdbDKdu2grH3vdycxXUiEffsie99C6NtSt4d37+tEdu8pllEkLKmH7Dyd8mdT1Baa5dKAI
 KrLr3DPtP8cSc1Z+j6y/2dbsgDM+BMc0nywmCVW87AdzWZU1mtmZ8AWWxFKPD9nL2fOcMHesFnu
 4N/x6BJ6vuhq2SgfRDgfdPjnfYICgQGq/LjjnMcW/mJlw/aM1xPvlJY7RU0pEKAv6XHcX6DccCY
 0vELlIfxxF2it0He4IYhA/kU=
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id
 98e67ed59e1d1-343f99c1cc3mr3251195a91.0.1763119615953; 
 Fri, 14 Nov 2025 03:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgKCyHJGBBYPB4qZv+EAl4Tx88PJN32VSjZcg29sFOWP5dg9DS3lwkBEwjYg2dmQ/BXtGF2A==
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id
 98e67ed59e1d1-343f99c1cc3mr3251153a91.0.1763119615473; 
 Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3456516c622sm167599a91.9.2025.11.14.03.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Message-ID: <76523142-b337-4a31-90d2-c8477ef0b270@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 16:56:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
 <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4_I5bZZ5x8L7e221Aqyc4NL0yx4LJ1zd
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=69171200 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lZFDvItL9zSOf8gjBGIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 4_I5bZZ5x8L7e221Aqyc4NL0yx4LJ1zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MSBTYWx0ZWRfX69xjEeUCct82
 wYM9K+HkRC/qppuLAvVSzlBaistTxSYsPVZZkzyB0pift2l7Sp3jxayiQ9WwC3z89J1d2Ibj+Rn
 eXNvVOrvn7cnG5hBhYnV8FdUirWj87+mEfQfzmZqsq2OSO8A1ubAYAp9rpeqmFskhtnVkJ09sxk
 RBNFK6DS6d2Fp8gXywK1aXuvJID5PXtLdVAC9czahVut2GdY6vYHSxWFuiypSh7JeQH6ie0nJDE
 uV6pSrKlycDTWPib9R2w98suJms8fuSVSD6ZNqnMGAxpeGNDOGBGySxtRg82ho1eTw08rTZTMVA
 aBFYBDzZ914zAC4oaXpjqgxx70AezfQlECdFLO9C1tRxXr421qw8mjyq0u8mNKfm6lOCgwS5MGw
 CwD+5eGk3PtsSHyg7eXqV/hU57tjeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140091
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

On 11/12/2025 4:29 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Current logic assumes that the voltage corners in both MxG and MxA are
>> always same. This is not true for recent targets. So, rework the rpmh init
>> sequence to probe and calculate the votes with the respective rails, ie,
>> GX rails should use MxG as secondary rail and Cx rail should use MxA as
>> the secondary rail.
> 
> Is GMU always on Mx*A* and never Mx*C*?

I believe the GMUs we have so far are always on MxA when it is available.

-Akhil.

> 
> Konrad

