Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAL8HeFNoGnvhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:42:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB11A6D54
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56D810E92C;
	Thu, 26 Feb 2026 13:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YM2Gmehu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaS2LxfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADCB10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:42:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QALB531681173
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mmocMQWZq5yYptuHvoeMtpOG97t+hI6K9VjP1aVHnTA=; b=YM2Gmehuq7uJgepP
 Bv/g/Mrz2EuZAn2b6DV3ZEB1mGRn0Byudnrd7Dgi9Vk/QUxUem//F7B3YsRX92o6
 HnRgL05Q1+NUmMruZryF4c+FDSc2DX0JB4Vc8+mKl2iuBXYFX1phyQlJfAo92YOV
 CXfS6Tm4t29YzdUgek240A4va32c1cGgaPtSMxtj3WzWMItQKYAtqdGHXRqt6z3T
 kE6xUL8H9vK+iM7Gffcs8cq+CmcB0Bq4PGI65U8d6KRaaRVArk909p+UplWVTyQM
 rA9ZwANptcuZSKXtQex0fxkO+NqPz79k+NzVHaRpF0GrG8kM71uLwLt+g67+crvJ
 zRnFJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4ueur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:42:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb4025302aso60433085a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772113372; x=1772718172;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mmocMQWZq5yYptuHvoeMtpOG97t+hI6K9VjP1aVHnTA=;
 b=gaS2LxfG3CPMdraaB1W7JcPrqgF+1NoPJR/1kDtOIkP/Qx3GPR0x7BZyYsLNxaaAFB
 Cshv6YgPjbhRcBT1KM6Ui88apf7naf5MltN/IwtlK5F4FWvM2OJUJU8XBLTfa6xqpJBZ
 XY/7yOFLQ4wFQQHdwZzhAtne3/5kQ18XQBO/EIc3Z7lOEUDPy4WYGUNl7RU5+1/NKu+9
 MT6xKyUhvfVra1oIe7BGjLq9L59S4CBKKWpO4eBbFXZwalTUaC40D6Ugyomz/4Ts+mDA
 4CiPOuuj1VzbJHcCrEqHMMl5uZnikABmN043mRbJItsy6vxis6Hzl4VJF+DBWqgGfn+V
 v96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772113372; x=1772718172;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmocMQWZq5yYptuHvoeMtpOG97t+hI6K9VjP1aVHnTA=;
 b=T0z5guHzpHAv8kLRgRzSHNu24b72QjOu3tG29OhXsMF62iYhA+sZcUFRIoS2DqXc2Y
 sNW249Sww/0CaASA+7Y6mwlQX28rvt9r3/E+PzqkmDrYYCAt/+yqisIxFq2wFrAQulGF
 bSMHiQI8ljF5CeGXUsOTDWh9+CdTLQCCmgQyoDReiASBbYudwuzYFnSFsYDv7trlYoQH
 GUeLetnjX7/Vaqid32q2LYGwtA/x7uIyGHcx5RPpAedzYZyujIeL1NwdJMw7ujiV4W/M
 zCIROqgVli12GNJkcsQavh/GzaglmOFMG0ZAYodWcl9B1AlDxIiuhzjT88dNcuLsVJ4U
 sErg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi1hVGXkTOf70tBEK1LB6ucf8u3Dnc/VPejC97EKEUWsleSMNY3z9ZpGpTnVbFCZ0qEe1fWpaZTjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxQOB8Zfg4cKAB9RyxfiVeqHR7OhDQPjEL6ZUUWk5GIp2RXT6c
 FYefYgSHEWvBMvjwdPnO987hvxhSSdCNhzJEvWRZrJkH5bB9y5PxzuMJ+h6HMfeoxd6aT0+k4mJ
 742P82nq5tW/3pqV0tYYXMzhrMWQc5/7gz9+qxusknHeYbsvRFgo5n+nY4b8uqRO2mSPar2k=
X-Gm-Gg: ATEYQzyLkaknQcFGvOfH9wFJ84Qau72hNT6V7WEp/51zUFB5I6yrlsspxKHCvxBpYkM
 R2TDgRmUE0KFQDCA1ZzJfenUX2kbVPLGrbmKf6Dls2KSGKBtIZx99FMf7qVRehkFtZ/fUn1qBh9
 H6IP9rEjEQfJSC1h1fk33uP4GC9GzkFQBAcn1KvqGFNMBvU5x73mKSkI7ZSCqUsj6Y5mihRwhCp
 UNNpuWyxXjhk3Q0eoxGKRXE4UlbF6EdHcela6tKCP1k66SnQBwXVcXqqZPtqUU9On3iyB/PQas0
 q+QEy5MZ7UdOrHyJu7LIcKfyV9L++1mOQeeG62qyU3JFK5Lr4G+xi9QZVx5y8LOrfnZpmz2L9gS
 Nk/T2gQkJoLkm7Wg2NWKDcIAQ0sxzVRh7CwJg/xo6YWVrXfzvNtziy31YbCkSMvhPJ9N/tbptQD
 4PQyE=
X-Received: by 2002:a05:620a:46a6:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cb8ca7cff0mr2017705985a.6.1772113372001; 
 Thu, 26 Feb 2026 05:42:52 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c5:33bf:524c with SMTP id
 af79cd13be357-8cb8ca7cff0mr2017702385a.6.1772113371394; 
 Thu, 26 Feb 2026 05:42:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabd362basm474939a12.4.2026.02.26.05.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 05:42:50 -0800 (PST)
Message-ID: <de83847a-67b9-4877-a52a-ee1976d68ced@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Krzysztof Kozlowski <krzk@kernel.org>, Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
 <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
 <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com>
 <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
 <CAHuF_ZoEAT+91trLabyo8rc8afXW=Wd0Q9yxu_v53nXoRFJMTA@mail.gmail.com>
 <26dc41ef-1a98-4a16-a60d-c7654acba758@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26dc41ef-1a98-4a16-a60d-c7654acba758@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hnSaoLK9MjDYKEfowLhwBGR9iypxFntH
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69a04ddc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Uyhorv2uAAAA:20 a=8pif782wAAAA:8 a=VwQbUJbxAAAA:8 a=qMnUWKRm8hXzxSHbM24A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfX1gT5v7ye3hOE
 TOtCSYbg30HO4pCFzMQdq6JHiDKBEfZY6QY7Kf0LhOzs6XdD+xMBmRM1PhpRCaxRKeMrXxBVupI
 mwvJkxPOBWf5rFRkURUIN9tYz2mUOOEN/2KL4hLtCiErI6ikJfCMRmn1XYMp+v4SXvG9vGdbwv6
 1CE4T5LBuGk7xC9GYTAPBazOywIn1PU4pV0G1YyzcCLv3tgVrqbK1aqzp1iQwIpUzYi6wO5aYVl
 YXTqJCRiD9aldgcnZMPXNIAF9lNlv63X6WeHQWQNSUCkkixg1iMmLbSmOrTDf/tTZO22/o2U5iI
 +NdBJOza+VQpVqb1u1XuI53LmRqYj1//ln8XowZSmlRmMsdHukUj9Lgv3WqNQQT4+c7wXw4c2OF
 0KDujJScrL8MTxpLfh7C3gMGtb2xFX0O3v0AltyANz80LHx/oKq0ms5EgA3khF5M0Y/OL2tGf+H
 M8BkoMuAPojnCeKkoxg==
X-Proofpoint-GUID: hnSaoLK9MjDYKEfowLhwBGR9iypxFntH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedayaka@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,wikipedia.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D1FB11A6D54
X-Rspamd-Action: no action

On 2/26/26 7:55 AM, Krzysztof Kozlowski wrote:
> On 25/02/2026 21:03, Yedaya Katsman wrote:
>> On Wed, 25 Feb 2026 at 17:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 25/02/2026 16:29, Yedaya Katsman wrote:
>>>>>> +  vddio-supply: true
>>>>>> +  ldo-supply: true
>>>>>
>>>>> LDO is the name of the type of regulator. Why is it called as name of
>>>>> the supply?
>>>> Can you explain more what you mean? Do you mean to change the name of
>>>> the property? It seems that all the regulator properties are named
>>>> foo-supply.
>>>
>>> I just have doubts that the device has supplied called LDO, considering
>>> what LDO means.
>> OK. I don't really have a way to verify if it's true, all I have is
>> the downstream dts
>> which calls it LDO [0]
>>
>> [0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi#L24-L36
> 
> Obviously the regulator is LDO, so they called it. Most of the
> regulators are LDO, so why VDD IN is not called LDO?
> 
> This is name of the supply in this device.

Yedaya, in case you didn't catch it, LDO is an acronym:

https://en.wikipedia.org/wiki/Low-dropout_regulator

The vendor driver probably calls it that, because the input leg of
the panel's driver IC just so happens to be connected to a regulator
of this kind

If we don't know the actual name of that input and have no way to verify
it, I think 'power-supply' would be a good generic consensus, it happens
to be reasonably common across other bindings

Konrad
