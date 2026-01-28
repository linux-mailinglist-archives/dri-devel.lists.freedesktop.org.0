Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PvEEA7yeWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:25:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8200A0490
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1430F10E68C;
	Wed, 28 Jan 2026 11:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSBO5EHk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/jQDzX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9891610E68C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:24:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S91u0P3879263
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=; b=eSBO5EHkrk1kKvol
 or1hol6Sg/aspr2AtDwhhY13UR1eIqD9bG3gYLci7B0wSHjWtftBFSGdsPtlBcS0
 gmfF/12HMueS+9JgpEynVntlJQAX3IZHmC53Aw62zLMDKnaEOnZ5sOrLi1eHtUyH
 Ykvt1VM16nyeOAutu3YgEv8lwDvluq2erwKlrDXCusZtEpLw37JoP3mc/2JX5+9p
 urgyjMvOKOHg4uhwcNbnSSajZOeeZu7KmpeWa0lSs7nz3B+icVeL/OM02E68eTo5
 p6Qs6gzBK5OXPo3155SKE3LEKWsu7WxvCuzhwDXeCwO2tQzofTi0SOyubeXWeJYV
 fVl0Mg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv17c0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:24:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52de12a65so11198985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769599497; x=1770204297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
 b=d/jQDzX3Mop4pW4Z4BC5LE8fk/fdJ8PvDDN7bRNL1FnPhCMI8Q7MsE1QxFpZ9NsOW+
 +lmlSWCBJdd1uKojmgQndgMYP2eiEwllknSr5Hq1PeWbUU1VSwk6VOHLKPgm+AP+MieO
 bSshnWvak4TOHHEDrGHq4PUcWm7CkHdfNrhyteYpYni/97BjjzbgihULYiIkjSNbF9Tw
 4peGsTzT2JOEEqiJS35oH0QrC384fM/gssZZC/fMKitcKqZTA+nY1/u+TzE/pv4DQYTr
 wgDZgA0xYeVXfd0huTPB2x9LtMjJ5EWW1AW5rZS0gq5IntyQkng4gX/tHvEcUR34nuim
 mT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599497; x=1770204297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
 b=Z5NCHE9yA6XXBBvVkAK4T0jucfCNRQpWN9qXRHmJv5X7lrXsHHvs2TW5jcFFMG+cZ6
 ptH1jdJGViMQKX8Ua5tW63KhG1cSY7MY8+JKgKsDK+1T94BzS1EXjBdJT8qZiTezolkI
 ATGUmUCo6f+1mbXq6PqXoQFz9/YuIW6+raGvR8GEfL6QUosh2SNFCg7/gPWcPzW8MTCx
 93GBpdf4PdlBNma3q2lLGywirOAd9Y9P/gS/fMtwYQtiw2lRsD7GaRUQ5ZwrLnPBmjPL
 Cq0zv0GS1DmetOyQ5v5vTe0ySvBYWwbJL2WiTMOBlPkgoicVVndcnHhkkj+pnOpVXp8k
 xdQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVRTXVgMzy7b4I6fZRHjnei4j5H6WKsQaF7oxy016sk8e8pwj+9e8hQnVdZ0L74/mNePNgIF9DAS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4L6FJuF/CKFciLVZY6ifkpCvqbMgAZ0v54eUrf5q3xPmrrAyt
 PaYbKCEsMSq2D2PFAv+5ApgApkrmDUMKeCQaSN22toMxnwH1nVx56ivec1am1irVog1tB5A2YfR
 1oQkZq/ubYTqnbstTlmrHRrp1u3v/fptqnWvigR2iP0NXWpzKW5e6+m43a8bStAFaRYH/vIM=
X-Gm-Gg: AZuq6aJKa3tMznzDhGJDv0LyfSjfle9i+ZAB5qibto3s4femvCB63epvwfJkX/oyklY
 oZDooMa99XmTQ4BmXJPTD0cH7TmCa5QAHk5ds1+N/0wcsbvLq5xWu+RbDubV5PQTekG2TqWRSDf
 MU+nmdS00E1HdjhhKLMOjfMUrVAQ0zfP5q1SCTFh5OmbOKSbxkDWqnC4w02OM74r5vNzkTgSgi2
 xEJi+M2L82IoX5f2OoreNTJTKBpYwGIIn5YsxlsKsW8yBbzK+GEXWZq2C6qbxksevmcV5RnBbvI
 y594iw/vCrZP1/wNaxLZFywVDF2cAKSMV2YpYevqyN2oJBffclWoLlkhC0kOWOTyR3V5v0dRkIP
 OAqqGMZ4xQL7gjSOk9vnFqXRyWX/q2r7hNjtUGoPpiEDt0OE47x/FvTx7Orr03lTS28E=
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id
 af79cd13be357-8c714a67607mr122192585a.0.1769599496955; 
 Wed, 28 Jan 2026 03:24:56 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id
 af79cd13be357-8c714a67607mr122190085a.0.1769599496363; 
 Wed, 28 Jan 2026 03:24:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf1847f9sm117534166b.42.2026.01.28.03.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:24:55 -0800 (PST)
Message-ID: <de10c91b-f6bf-4594-8df2-71395ecaa893@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 KancyJoe <kancy2333@outlook.com>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f8kkh6WhCmnHqu32XajeqpO6QVpJg7Rd
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=6979f209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rO7Yge3HHgQ4wEOnkrQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfX1F3ESiGQFmbd
 qOGlJ8upinVBJRpfU1sDgcpc9U+yoimUAswurzu+aZBuuF2b3L/fhRi6c3lSl6Yzk8MJADibPUp
 FLvMz+vBfOcj4/7r6Jyz9io8kzEb3MqQvBFj4bMmsloL9nJ1fM2v3ThfzNja53NgLVzezHPEmfl
 B97enROSIVXxkIuJl/XP6yk9GLRCviXLHSTr+bU4iDJMNX7aN7PZL5q/edzRbfRCziL50N0Jg4p
 97oMQJIpdynzHw2aDJGWqv+6y93x+3/1r8JR7jJ3nIMxhmaJ+AtkkGuTyslxku2DBsc8WoV4wJZ
 Stxp5PgEsmbRJg52U/jGavVFY8S4lFq+/jWm94psEbSqQoEx4Er/OwOE8rJoZG17t/dWuYVnFYP
 BxjCKxyo7WwsBjvuiwylbUdYpHyG3YlPMQWLS7rtgwbivshU5B01hFBp2LrTrZvVKv93x76QFSv
 nEfWHI7AD8ZYm8vA2lQ==
X-Proofpoint-ORIG-GUID: f8kkh6WhCmnHqu32XajeqpO6QVpJg7Rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E8200A0490
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display panel support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dp-dai-link {

'd'p-dai-link < 'v'a-dai-link

[...]

> +&pm8550_gpios {
> +	volume_up_n: volume-up-n-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-pull-up;
> +		input-enable;
> +		power-source = <1>;
> +	};
> +
> +	pwm_fan_ctrl_active: pwm-fan-ctrl-active-state {
> +		pins = "gpio9";
> +		function = "func1";
> +		output-low;
> +		bias-disable;
> +		power-source = <0>;
> +		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */

This is defined in include/dt-bindings/pinctrl/qcom,pmic-gpio.h,
you can just use it

[...]

> +	upd720201_avdd33: upd720201-avdd33-state {
> +		pins = "gpio123";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You should be able to drop all the output-low/high properties
since the device driver that references these GPIOs already asserts
that

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
