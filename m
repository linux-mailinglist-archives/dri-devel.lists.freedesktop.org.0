Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMh5N9LncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:03:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB666427B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ADB10E95D;
	Thu, 22 Jan 2026 09:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru4bBBOn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH7sCM+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFF910E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:03:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M8Tjbl3463810
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=; b=Ru4bBBOn99KE9MnK
 9dTMH3Wz7NgPcS++FYNCT+9T5OXRanrNdhFJAFQ+SjX1aVAeQIJzpcm+DdsaqX5m
 EBu5H/WbBvyHAWQMqxtJVwFy8+6K87PvRQGiYonOgi3EBvqki4o8O23nD64QbYBH
 3YcjfKq7RuVzCMK4B8q41suKA801uDhT2sjuseEFOQXbmFBfPTJb+5hiWdO0bQT+
 g767do/1dGEKbKEPRUEFs8o1C2CyPK1sW7k+y1C5wFGNAKXMT1JSpEAAydIw7TUz
 xWdJFPV6Mw1bTSjRlDIKO23LPFkOl7wS/qMtK7SIK159BeSMsNNymXa2wDXn5jIf
 Rungog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu06536uu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:03:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c53892a195so18672885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769072590; x=1769677390;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=;
 b=WH7sCM+eCI/tpeR4O5rXtyRcr9q+8KLgm2pdo2shh8zJCxPlmJ00WUCHASwGLbJZFS
 wFVp3Q/Yktuq2XrY+ydu685JN/E5TIMH4QsNFKlKlfTVSsxxDMg58dQykXNKeLQFsciZ
 On08H7epbawk/STdLRtrPOLQ8WeXn6MA+qt0F+B4j7v8+sRIo+YHFk9SSQhhfEiDFFTh
 ts9Hju6p7L2Gv85kdzyp3MYLSXUyRoaC1Grebo16o53+abUvoCK+MvHhexMWKgkQeYWS
 yXxr1ExzqyB/hp6tL6DMLkUZG9xYZvV5uYxuVsP2IwsG1gzlnRst20YbwpeDDfOuM/oh
 mJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769072590; x=1769677390;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=;
 b=Q1lPC+0kokoWoFTNHeSD/svtngBY1zQJMveCNAAFB4wwzra8bbJmyvz6F+4+aBLHy7
 a1nTMIOj8dnJCIU+BywCZjSxsAenyC69Jh54aR4JqQ14GveTCwgQZNnzcefqR9V3Wqia
 3UD6g6j5YnRI1Hz4Ih7Z9UxLkcSfnJeYGQ4V7/EavvlOzFpSZ8n1dllHriSNaDyEne/9
 u+cTGVzpxQ8c83AF3HcJRuZhyjmn58L/dlRm/GvfF51kNB45wzCzsqHg8P+v/zpzZLrB
 AEC4407RsxfGAub+iob91sA9XlM23/mHJE/aavwjmtOjNiNRNuebdCwpxr7zOyrY+1B/
 3Bpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDX7Lce3r+b4eQixaXwhiSsYfK2m+g8Yo3fSlzTiSYz1IlRQnXo8VDwQ3GEYrQYy+BnvZMkKJ4IyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJy78baRcKc+M0SCEjpPzL6Eyjj4RRFjaLR6/CIHSknD9e0UXv
 8J4jCZ6qGu37LU7WTIoMhipPrWycENa9SVeIRs0ioNSPPJy1XQCDfLLvmr/3lyb3VebmlLVXuZM
 2B76+4WJLd5jx47XNeHhGTBvcRs5+cizaq6GiVtJ0LpPi3y94C4wM7x2XviO7jLp9rdFSvfM=
X-Gm-Gg: AZuq6aK7ROesn3/3K8uVewd8d2QNrapjG7qkNZ8xUGo2bcobErmdtAFMcqNcMyxNkvA
 EDSi9deVyS9/N8sxuKSmGVsP+kuTBTMA4omlUpM1K5pxLy0iwRb3f12jOjmAbfK/6TVFAWPZwV0
 ef6vtLkU1c8abXw0pEnUYAPIKaVtUedPc7eoutSiDh4ojv0puZRrsZtH2wAIrSfdchcbdTanOaN
 +t08sV09/Y9qvi4ZIgxobSDSCHLaDteyVdOzaIGZaOHKfpvo9FlwgDEiJxJGu1T7Rfc6NMRlOLT
 hvk7CUcQzyQBXNy2ea16clhZH6/eRZ+0DnBu25UYHphG2n39L+QaMxDkLIHauvXNDeGPHUXMqva
 5RqGL+3f/qFEKLaRrus0p9NPukpjRQCzAeayKswWPyK6G27ETpUBHpD/Mvk3wlw+R+FE=
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6dafed670mr212637785a.10.1769072589819; 
 Thu, 22 Jan 2026 01:03:09 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6dafed670mr212634185a.10.1769072589243; 
 Thu, 22 Jan 2026 01:03:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879cd85b55sm1586206166b.21.2026.01.22.01.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:03:08 -0800 (PST)
Message-ID: <e65fa35b-44dd-44c7-bda9-0e1ff5fd745a@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
 <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971e7ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=hk5onNUDdM5l80mYchIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZuBnEf2ks8MjQKqNK68Qv6KKoXcUrvDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MSBTYWx0ZWRfX0seSESDGh6gC
 WdtNirD+pf1H9btydCyy/TEvaTx8WsJT8mairtbphDRgRds97ivOFyqctYYRwtZRI8MIkIjFBAU
 jnAB+dYvoa1QQQfgva0mKU+p9gGeSryvUoqaHNJAeL3NmQHrOVYr0ubsNS1sP8B5ztShU/cU6hS
 VFdAKo3OoBeSRdWgvVrqcK54CVqeGSjfd89yE+rpvSS1SgCYia44aQHSItHRBIyUk4GEEAXDDH8
 5iZcLVwRvzzIMPfuev30kreNCUouEIkiCcLlwBjx90WkuIIrdgKOG3frbVoxc1uVayH38qdqUCP
 nNa0c5Cauz9YuxWpRgv0bF0dVfTUeRdi7SYsgxZJ/tW33OhQOyzv729iVx8VVJ5YXHvP0SJqeYL
 zZPD+j/RroW/Xtit/BffIfLORUrrOQyB4M7HVMQXzpSMrji30/+bH1TpHEHzocu9tuQdOxp+aHf
 H9HDpBQ3GWpmewyCUKg==
X-Proofpoint-GUID: ZuBnEf2ks8MjQKqNK68Qv6KKoXcUrvDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220061
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,outlook.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 8EB666427B
X-Rspamd-Action: no action

On 1/22/26 9:38 AM, Neil Armstrong wrote:
> On 1/22/26 02:30, Dmitry Baryshkov wrote:
>> On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
>>> From: KancyJoe <kancy2333@outlook.com>
>>>
>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>
>>> The design is similar to a phone wihout the modem, the game control
>>> is handled via a standalone controller connected to a PCIe USB
>>> controller.
>>>
>>> Display support will be added in a second time.
>>>
>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>>>   drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>>>   4 files changed, 1449 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 6f34d5ed331c..1ba29755e5ba 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8550-mtp.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-qrd.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-samsung-q5q.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-sony-xperia-yodo-pdx234.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)    += sm8650-ayaneo-pocket-s2.dtb
>>>     sm8650-hdk-display-card-dtbs    := sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>>>   diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>>> new file mode 100644
>>> index 000000000000..141d92933957
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>>> +
>>> +&i2c3 {
>>
>> clock-frequency?
> 
> We never did so far we we didn't need more than 100KHz

Let's at least make it explicit then

If you have the original vendor firwmare, you can read back some
registers to know what they're set to

Konrad
