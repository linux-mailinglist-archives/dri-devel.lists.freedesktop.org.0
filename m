Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OerF2QZcmnrbwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:34:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAD66B22
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 13:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A8A10E997;
	Thu, 22 Jan 2026 12:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZdHrDWQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ar+Jzed1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1966710E997
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:34:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M7tN3G4057909
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=; b=LZdHrDWQizJ4LLzp
 vVK1EXsUnbwYu5JNptjC8GrH7eJw5ac5hf1Rr1zwghL/Xzl5StnxgyZXuTQ1Ov8i
 V9yqEapCqIPtX4KmHMfuv4PevxOrnjXtsoi/VP7ytkkwzz1WuWaNTVeH2skQsfb9
 BjW52hRFr86Us8bb7C5NKJ7oqkF+Tcau00T2NtI2mksLtv61C72Ang1CtLmC/dEP
 f+9mLhkXHTW+Y4Xb9ntJFvPHQqFLJ/AcRFujriKdbha3+5olas6h3iV86W+C7WfJ
 MWyQY14hNwlm1Rs7K/UT82kfCpBxYWfWO1hjqVsZyVz51Bo+jP4H1KGwzLGhOnRP
 LBil0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbt8c0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 12:34:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c523d611ffso14350785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 04:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769085279; x=1769690079;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=;
 b=Ar+Jzed1T+D5dGir/BCdNLg2jInG4HosdNCRvh/821GtdAFeBkHABJ8MsDbRMOMd81
 aDzRX4r1R4EYquTTNZBQCnkb/+vQiGaovzW/OrOH7K0z7XzcNs4O0DzBzBtGQ+y2MNlR
 EkkRH+Zceo6ATufEWy2pPfqtI4QGcpwcOQZtMWmLsuBVZsqjQIxY2rzp/95t2EibDrNm
 dpaMUHCFiu8u9x6frqEzUoBdM1PdMY06v3GxsT7n9+NsjkPR7pSadOmZAG2OpoMaiZp0
 3C+OFIC4OR5atMjYivbljupQyp3gTntfTvy4U1sMf/27nE7XEHMSuCibb9Rhfd+t40Eo
 FpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769085279; x=1769690079;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQ9Hp0YXE7x+HtzPq+22mdatg3BzC8x6q18ktloaVtA=;
 b=Y71ejNfMw727Cxj+gMLJUfC4m+T9jXxTQfN7labOiQgOK09RfJ6SY1uIkENt+gHQip
 YJdcQtw7aHGBRh5yUyVSx8o+NaT9KBBWC6/KDtcS/pAFeS4aflKcLuWz/iKMfYpB/jkz
 q1g0Koj00128cnbArSy/AbZ0vaqLVyZX5LwHv/TinegfMTGvQFcUvq5PW3jIhg7LCK8E
 LK8ON50WJ7gihclUbnXvaRsql4YDIYCBkw8XcgkDmDWBL7igUChLryXdKB6er/fcudzk
 49Wp6H2sDTof2aAiHR30e+tMSAYwbZankQ6HwVsRc5fsTWcNithPhiQy+p6cNKH7dZC1
 y6ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfSnUBehwOIDlCqnPFoAQvl/W1D9BAvZNoTqTKN+CnKvuJoGDOPT6s/CxoQPSMRRQdw+La5mXZlwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHcIeQ2vEj8uzeXDxsNPxvBRxh77k8/tY55JbCzr68i4L2eoBT
 qEV8IISiwPPzRXeS/ctO5FRQJ8DKg1q4N8cFiROSG/DtVYztVaHewQEFC92KdlqF/C1xRTb5oQd
 QFiOSwZxnAYc8Qhi46FD7+/1VV/+BAYoIssvXA2IbcxS1HKcbQSpyWTay/yh5PnAVwmN3Tks=
X-Gm-Gg: AZuq6aIkeCG9bLzpvuF+MVxd4dFkvJNwvSu4uHho7JhU5lPuD0tNbxsLxqjV7qaq7ib
 ERJY0CGXYum0K0pEJoD616IgmCjL5Y0r1FyHYa32f0WEhjAH/748Ls7uEKnQdB99n0VpRpQd9QO
 aUCoXZDKxHYctB2lSUchRdTgGBpWLx3GwbXRmIRJj+Dj6g100ktN/XrLuEwTVeGIL6jPim374qL
 w+B+BGPEXnTyUhzd79Zn7WoxeQeOZzaCUkXCdPu3jXQCAUJgMyDFZUuUk3Yz775aEYjB55ut5B7
 IuBsBEk2I70y+UC72M1USC+1AjG1yIdrG9BN92coQmawuRGaJ3AkDGWpchg8Ird/DlzhSBEQ0sz
 lH9ABqzz9zVQVUMajeuSczrx6UROlRxRbrNv7Bf7RM6aP5vubXgGsebNej4xuQl7wMzs=
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id
 af79cd13be357-8c6a6606fcamr2126205385a.0.1769085279329; 
 Thu, 22 Jan 2026 04:34:39 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8be:6733:92b1 with SMTP id
 af79cd13be357-8c6a6606fcamr2126202585a.0.1769085278826; 
 Thu, 22 Jan 2026 04:34:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a2f1aesm1725477066b.61.2026.01.22.04.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 04:34:38 -0800 (PST)
Message-ID: <687b781c-dee6-4b8e-89b2-e082a860be3a@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 13:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Kancy Joe <kancy2333@outlook.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
 <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E-EgkUV8W0Wcd-ro7tf20eyz64AhVBTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA5MSBTYWx0ZWRfX78ZeNEh6L1nA
 BCU3kUlkwd1gSXLuDn4xkJ5CvDb9d6gOY004PZW1+UgxOsScGOfM0rZpLakQi4yq0ciBCFM6JKL
 tuG+e/9Onh/W4Fl1JURwxt35GpZi0wyip2wxNLL6i0Dma5I8YlFYfTvF8pHNHJBvxNI9YFjJpp4
 /7L3nq01A+cou2TEEp3y65JmIvwx0CRlFswNZjPPOZ2kAM4tLlLHzVbAsOiIbBzNWmBu9m3N0Mh
 6aw90Z6+3gWtfaAqd6yF5jTr88DP4bGsiKdHDQvJGuI0byXQ5MmkQbN50SyqEdax0hf/0AfeY63
 vp8NOAs9slT0zJift2bpBQIQ5X4J71UvOJIwtEEvPqmXk6SN2I/EZTmTK+mFl6hvIgVsLZyQ0A7
 0NsO17kndulQ1LYx30ZGMZgeauYs6IZ/RCYEfDWSlHcm0A4dxsEfhcfuVufx8fGzYCXOLTfxocQ
 6jqakJKw3sNnLDPCmSA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=69721960 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=xRqI7NLVZAYiWIq_3gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: E-EgkUV8W0Wcd-ro7tf20eyz64AhVBTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220091
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
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kancy2333@outlook.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,outlook.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 98AAD66B22
X-Rspamd-Action: no action

On 1/22/26 10:34 AM, Kancy Joe wrote:
> 
> On 1/22/2026 5:25 PM, Neil Armstrong wrote:
>> On 1/22/26 10:15, Konrad Dybcio wrote:
>>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>>>> From: KancyJoe <kancy2333@outlook.com>
>>>>
>>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>>
>>>> The design is similar to a phone wihout the modem, the game control
>>>> is handled via a standalone controller connected to a PCIe USB
>>>> controller.
>>>>
>>>> Display support will be added in a second time.
>>>>
>>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---

[...]

>>>> +        pinctrl-names = "default",
>>>> +                "sleep";
>>>> +
>>>> +        pwms = <&pm8550_pwm 3 50000>;
>>>> +
>>>> +        #cooling-cells = <2>;
>>>> +        cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
>>>
>>> Does this come from a preexisting map?
>>
>> Kancy ?
> 
> No it is not a preexisting map. I add it(and the thermal part) myself to get dynamic fan speed control work. Perhaps you can also use userspace fan control daemon instead of hardcode it here. In android the vendor control the fan speed in userspace too.
> 
> Following block is what the stock fw defined. I changed the granularity to make fan speed (or noise actually) sounds more "smooth".
> 
> ```
> 
> cooling-levels = <0 64 128 255>;
> 
> ```

FWIW the corresponding pwm-backlight driver has this
num-interpolated-steps property which computes a smooth map.. not sure how
many cooling levels are resonable for a PWM fan, but then I would intuitively
not object to having more as opposed to less..

Konrad
