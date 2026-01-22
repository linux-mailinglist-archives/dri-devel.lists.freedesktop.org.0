Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B8eFrhicmnfjQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:47:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FF6BA06
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FABE10EA2D;
	Thu, 22 Jan 2026 17:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqpLPXkl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTt6NEtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23B110EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 17:47:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MG4rNF2582639
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 17:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=; b=OqpLPXkl7QjwA/IE
 Auj4O1MspLQEssHbFSoTM6f1oT2/azwukEpf5V3d3AYrqT1o2RFdgBe+pMQNwSES
 WiSjTT8+j84YdtMOVQydt1vOapXh0+AleLHSlnxjccyHHUh/B2Dd1bNtywTmtlBt
 EIt1tUgUugxUPhhlTnI+gO+Am6C+f+3tzQeVg0E6Qt+biwTmZIkfuIk1gflGeHoo
 BqzJY+SbGbPwza05l4rW/IkrZLjaAnyeLwr8GppO5tTV59gVgEt7Rr5jglFxzwYv
 jrumqxFXNvmvN+L+SbnZVjp4Lld81SkJXq6fYQsLESrlYdwEPsY1GKz0ipljjA+E
 6wNFkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buq3g8fj5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 17:47:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c536c9d2f7so34544685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769104050; x=1769708850;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=;
 b=UTt6NEtgXoxKjc/0PMksOQNHs5h6u/g6kmy35dqPJ+2usMzShGDmBetqCJAKJfmQv3
 f34RmteciOQe4uFFyPjtoci91NkzYGMQUrq44mg7qyEj3gQWC6TcHWfxS9sww4IIgq6Y
 V1ZegCaL87i+AXN7fYoHwpAO2yydUFogeiUU+JKGc2wLQ1Cg8EEyfkLt+bQkwQoo/VAp
 Xumt9ZBXN0cgFYGbBN7z2Heifm2MkS02Jzdacg8qms4iUygWJ5BmhUjm9wnHSv/psmzk
 yuWF3AzKKOsZddxQ+mL+UYpbLQw0wYOXfi76otMJ5/+UOxV7VzFKLXOnRgz1ZjU1Qaru
 zzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769104050; x=1769708850;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=;
 b=jf7Rc3s1be9oq62xH4bELppyFTmnq1tSaL+GP03AjYjoQ+NbY668sjykcNiMUwdDHd
 as3KqclyCJxav0One7Ah7hlr0OG/+BWTI6d5HnsL2q8k63hcngMU9yUk3/02YTeXJ0uE
 XeILycZ4ig6wsJUT5TtnCJuhT3DIsST5SXZ2P90AqhcZaj5ib6YtdSY2o6E3NhKZSPb2
 rXr9SI+uuKla7xi/xsILn1ZnvxzjrcVjMOhTlGzZ3pzuWs+KK9GUewWDEsOZ6D8w2M5B
 xTmxvw63EGNnbfQodHn5E1SAY3NFF4rxi0fxiyW72QmyQEhyWKCvxDiBJtkLGadEROEC
 jElQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvb40HPNF7fywlt2g5k7QUBoPAejjVzH984hVNCCIsjEtz76fXfmw3c1EIgapx/162m2DkZO7r0Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS6iNvbxWTw2bIN5/gDck5UYymkDaMdf0Iqot5lwcor15lttnx
 MnDK5UYpsx1RLtcvlqXifd19P9Cz4Occn3V8hceMTu18A+qqp1bOqvBilIuDILbyd7BKFyxECYa
 rorcgG36F1+lMRmj1rYmVonJVssLwEC9DUSb1ZsPAGldMvVs745Vui3a2r35/cK26m78wiHk=
X-Gm-Gg: AZuq6aKUZ/AgjscSWaQugZ+I04ocHOiyFerAPrTO8E9HmvgIKET2BENVMcLhz5nRxMA
 cy0K+VhNsyOXQboOyMLqbyhKOMMNFMQkkkMAOPkjdG2huVRkhv7M3cz2szJyR0P671T0Dw2q2QF
 jg662gm/IaV7iX3Ljn5P7/9uVOJgALdpG/VD/zdmnkPssEhP4tIac0kEhecaAzwx8WOt70J9oEy
 ifH6BjE8LjV6R3qTVwpnyLGl+4WqBQatmRfkevl78V13Ty92+fOkSCgz5sAtIH9GQembF6Zci42
 CZw8ndZiOViH92SG7sBQHoLeZQFMYenPkD9wJD8q5c0ZWkUdPfzwzPS1fVvyROA0KixD7H7ohAC
 cQ9JA+D+Je8OdtrdfZXBxZ2wTrO2N5j7F+4CX9v5l6XPkZB3n/lM3kbLn3ZtdFuoOg08=
X-Received: by 2002:a05:620a:1908:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c6e2d803e7mr32093685a.1.1769104049966; 
 Thu, 22 Jan 2026 09:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c6e2d803e7mr32089485a.1.1769104049311; 
 Thu, 22 Jan 2026 09:47:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c96f4sm1729814066b.40.2026.01.22.09.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 09:47:28 -0800 (PST)
Message-ID: <36533a12-9d92-42ab-9e5f-a26f538520da@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I9Johdgg c=1 sm=1 tr=0 ts=697262b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=ujkSvRmCcq-OA7eOwGAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEzNSBTYWx0ZWRfX9PyxWD57xf4Q
 kB8/rfKLMG20zMiEhYpL74AwCnuTvAGxunnDBdDsMdSykjEmFa9LCwivtkn/oQxFK5CCQWBb+jq
 XH7x9MPcFdYlYj6dKLusaxi7Bek0/4hwirD3XOgIpsPWuJKRodpWYyDhm50ZHf+Ram8hUktkElH
 oMs85I+mBPPyt4/BOnTHyVS3PCMtMx6IVn7no6utXxEoO9/Dm9JAekXaP79H6dsClnIBQZZyj9V
 AX6rp5KyYqJnY4DwMCwppbZk1LyziEJPVxu+G1DKph82HTV/TMk24U0LD30hv7yCe4dgrRTAaTL
 xlzU59l/Eo9JOvC34EjpZXiPxVgtZG9vvAseT5Boti/e8PGzZGiVTYmy6gdSVNVI9ou4EP25r+V
 D0hT4RvBu/so/jEd4LvY7zptfLeuWuyZx6rRxEjuBT/8VlpMEgNG2zcKEATPI9X25A90PIFNTCW
 wnSdSg9br0G27tvWbtg==
X-Proofpoint-GUID: dPK_YUeTrEDI5CGccPrFUpskD0vL1Y0a
X-Proofpoint-ORIG-GUID: dPK_YUeTrEDI5CGccPrFUpskD0vL1Y0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220135
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
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.533];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,outlook.com:email,linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: EB4FF6BA06
X-Rspamd-Action: no action

On 1/22/26 10:25 AM, Neil Armstrong wrote:
> On 1/22/26 10:15, Konrad Dybcio wrote:
>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
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

[...]


>>> +&pcieport1 {
>>> +    pinctrl-0 = <&upd720201_active>;
>>
>> Is this a regulator?
> 
> There's s 3 gpios, the 3 are required to have the controller to show up,
> it could be 3 regulators and a reset line, I don't know. The controller
> needs 1.05v and 3.3v plus a reset signal, but I don't know which one
> is which and if it's really regulators...

I'm not going to make you.. but if you would like to open the device
and poke at it with a multimeter while toggling GPIOs... the footprint
for this controller is freely accessible

Konrad
