Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNINL6PqcWl6ZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:15:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C81645EF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E716C10E963;
	Thu, 22 Jan 2026 09:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC4DZSlI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+GYL8bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAF610E959
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:15:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M8SYIx1407285
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=; b=cC4DZSlI+K+w/Kpn
 rDghF6SnzjfNcmklfxBJG/MSbuTl+6fTrAqJcc2hnZ5kSs0YdVIcHyR+BaE5vbJK
 y1hjw76tFBctX0vgr3T56YXH7VB+rYWgtibAvEobOuZwedevuBMFT8O9zRbgPn7q
 HFXiGIWTEmylsEP+sywf48qVbZACeJLnY68ZDrLFXYqs4ljlXW39/jUO5bBLVB2l
 9FfEutYNm+rVlk1+uDPDy8CNUYLpMO8k/yF+s4ZmjG0ocrj/3osLrR8bCliycfcS
 3HPqnbt2H170WkXFxGZAbSJPy05oJHAVBCbaSXP4X0neBSc1qZLZ86iiC2QKIIGA
 VV7kEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu802sn75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:15:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6b137e066so25117485a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769073310; x=1769678110;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=;
 b=P+GYL8bhxCdU3dvnWzydIh6htzSryAqmyQbCbW6CXy5C3uj4bYZ4TjYqaKwIkKVdCS
 A7fCfmiG8c3kwbnvj9tQq6Jx7NpocdNbwauISuUCQM2tIVrIOqo6AwfRCbNMgRrElRx2
 JbNg1RDiFQJsB/jP/uwCyDVkWLqBE3oa3jngrL6KDRm1Qdjn/XbGXkp3CYc0/O2cAZHX
 B84QmOsJ8P26XM1f+XioWHMxaeSOOCeFgUM8/s/RaIXXA6JY5VhPiYJa9NwRAftf2WVY
 sHYOzzL/nDacfemwVHLfwOvPhkJI6/on8RzV6H+mevw4Zmb9qr8UPEXXsRSGbczw8XL4
 bBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769073310; x=1769678110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hG2JmDsNT8t96Xwz5s7F3bBzVMBIxS6BhytG2Bt0OQ0=;
 b=Seb0AgVB17V9JxmsD9t+N+e/RcaGBQtdh9VSjP6D8BbyQPJTfihpE19gwePkjlTjyV
 BFCBRHsSXoQhysL2bxf1ErRcOPhBnzyR7mgP2ZOl+G2/Gj838DZg0qdZlq3f2hQL05Bf
 ecgzzjvV+3s5xQx2CQi+OSBzltzhvvPZH8jdl2tqGkmdMwYZGo1y2P3RUr2OVaMshOyZ
 kdC/oS0daT3foLI5KHyAR8KB1imdMndvDLREqBfvkQmN/reLTEyoVdqzHItDVCuRurPp
 PT2XIg4o6oouLOVF7GwtZRpNbQpDwm8bWUym6nsgaHY/2m2hk5FIA8SQQ6GF2G1BMGsW
 EfJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZypNwc5iKOSzo2aPzIheCKUbgckt4v3+aGZueuT8Q+dCL73ge9q8cYOfwLru03FpBCqBfkUH8U0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyboNACo8fAXGczAH4vlrBV5dwnGfyxyTKGsjxqsiLhJJdTcULW
 XSGQTqpTRY5MEaP0Yph6Q25UohtaGeT/dVXNFhaPSMqZAStws3dRen+OvURSycdkwIUadmJpFV5
 DKafMgGJrym3ig/EHE3P856mgjSqd8vwaoJd0Q3vBnP6wbkUm/gpEE+rcROMPyul1zxD9E9U=
X-Gm-Gg: AZuq6aJiFo0hRt4ICxIdsCR8O+nDS574s4GpSrgZPPzKRi/BIpYrghg5yGncp/e84Nf
 EeCEa29rfgwqP98GY1ns+Zu7WQYq03LQG5rqI7R5ucXRzY0rN8zJAfnBH1IieEqJ6ETtD3HzPtj
 K9Tr1kG4UqI/zFKGLAfhEDtxJ3f7ATenguGirVDn3Lhqv2GlqtjBaBj/dRv8T3EeD5Mrz7phBOM
 gg5+4A3pFM/SarB0SRh6jfX/EJ32oJ5xNuok3UCMZezrRQASqU8D9mBmN06k2YgIwsddGsE+ZYF
 vUQfbKM9vYAvq96TfDn51eSxqgIrdXWFpCR8B3UxKrZB1vRwvVDw3QYdPsupxPIYdPxIKulZ43O
 qbDcB/Iasm5PLJ9XfRX6Mkm4/5WlDYw5pUuzvxhfeIzjdqoRc0MnbbcBn6xv0Ov3tRXo=
X-Received: by 2002:a05:620a:1aa9:b0:8c3:9ae3:1a78 with SMTP id
 af79cd13be357-8c6a67cc5b2mr2004300785a.11.1769073309683; 
 Thu, 22 Jan 2026 01:15:09 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8c3:9ae3:1a78 with SMTP id
 af79cd13be357-8c6a67cc5b2mr2004298785a.11.1769073309034; 
 Thu, 22 Jan 2026 01:15:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795168b9bsm1693992766b.16.2026.01.22.01.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:15:08 -0800 (PST)
Message-ID: <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:15:04 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcWbdBQh c=1 sm=1 tr=0 ts=6971ea9e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=BfLt2Qf9Yghiec0bZR0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MiBTYWx0ZWRfX1Ip89nFhN0p8
 Uu4Om8FJyYWvYqbV0zputyHMEDtO+zxVDQ57mRsZO3HpL30JT57i4ph+8e3reG9dXDIFimKBmC6
 OKpqXVIf4VeL6NFR+IO92bA5WDGjMJJRzZBd2Std7wR1Mq5rlArcDbX94zQ1PoRmjIrmd3o0CT0
 HH7wgwmA9c38dDignUUhqMCVl2rutubM5pmGTGkGIFhke3PGNb/H56qd1jkbRLS15wKB9Z/tFrA
 UmwD0Ijz12WZiYKkcMVMnkMHU7J1+U/+VMoirZhS8ziubesrfldT6/ej2MOyNhjKaHU94c2OB2Z
 OZuTddPPhs97c/2uYIpKo6OF3m6Ntqj/VGOCb8TIIKncTtHtXTXoWFJnXEIY4Oh23xpHB8S1N9t
 XIBcVFhsBcmLG/DOVq1bd3eYESj2MhK0uRwfqdMAvCh+YQgm7TpTnRPgza8iytdmkzI1xFIZb1q
 gAFLms8nc9ms2scfBPg==
X-Proofpoint-ORIG-GUID: JmWL2VvjLfoQ451L0BSZQVUrWglc96aC
X-Proofpoint-GUID: JmWL2VvjLfoQ451L0BSZQVUrWglc96aC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220062
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 71C81645EF
X-Rspamd-Action: no action

On 1/21/26 5:40 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone wihout the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	fan: pwm-fan {

I'd call it fan {} but gray/grey

> +		status = "okay";

You can drop this line (nothing disables it)

> +		compatible = "pwm-fan";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended looks neater

> +
> +		pinctrl-0 = <&fan_pwr_active>,
> +			    <&pwm_fan_ctrl_default>,
> +			    <&fan_int_active>;
> +		pinctrl-1 = <&fan_pwr_sleep>;

fan-pwr looks like an EN pin of a GPIO-controlled regulator

> +		pinctrl-names = "default",
> +				"sleep";
> +
> +		pwms = <&pm8550_pwm 3 50000>;
> +
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;

Does this come from a preexisting map?

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_n>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8650-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +			self-powered;

Is this property interpreted at all by our setup?

[...]

> +	sound {
> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8650-APS2";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"DMIC1", "MIC BIAS1",
> +				"DMIC2", "MIC BIAS2",
> +				"AMIC2", "MIC BIAS2",
> +				"TX SWR_INPUT1", "ADC2_OUTPUT",
> +				"TX SWR_INPUT7", "DMIC1_OUTPUT",
> +				"TX SWR_INPUT8", "DMIC2_OUTPUT";
> +
> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd939x 0>,
> +					    <&swr1 0>,
> +					    <&lpass_rxmacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +	wcd939x: audio-codec {

'a'udio-codec should be way higher

[...]

> +	thermal-zones {
> +		cpu2-top-thermal {
> +			trips {
> +				cpu2_active: cpu2-active {
> +					temperature = <38000>;
> +					hysteresis = <2000>;
> +					type = "active";

This is shaky.. let's perhaps reference each thermal zone that you want
to extend with a label.. Or maybe a pair of labels for trips/cooling-maps
per zone?

[...]

> +&pcieport1 {
> +	pinctrl-0 = <&upd720201_active>;

Is this a regulator?

> +	pinctrl-names = "default";
> +
> +	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */

DON'T SCREAM! :P

> +	usb-controller@0 {
> +		compatible = "pci1912,0014";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		pinctrl-0 = <&gamepad_pwr_en>;
> +		pinctrl-names = "default";

Is there a hub connected to it? Or does it go directly to the
aforementioned (game) controller?

[...]

> +&pm8550_pwm {
> +	status = "okay";
> +
> +	multi-led {
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Would a label="xyz" be useful here?

[...]

> +&tlmm {
> +	/* Reserved I/Os for NFC */
> +	gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;

double space

Are they all for NFC, are they all required?

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 07ae74851621..fcd5a1a45803 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcieport1: pcie@0 {

pcie1_port0, please

Konrad
