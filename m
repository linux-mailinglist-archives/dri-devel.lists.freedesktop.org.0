Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFUyIk2SrWlH4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:14:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACA230D9A
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3035A10E04C;
	Sun,  8 Mar 2026 15:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq9PsUjD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJ8Aw5tP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A8F10E04C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 15:14:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628Du7gT3989068
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Mar 2026 15:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=c2gyX71uGOT28R9wcuomHiWX
 Lz5+YgMpzvWecME3waE=; b=Dq9PsUjDKP9naiYiz+d9Vz/2JoYr6nlEJGAp1XcR
 lxdAODUmeg+c2fgqPQqHGu2Ir3huJKmNtVQSVkFzc4lzOkhSQQcE3FxHGuJAyzag
 nmbFS0jkiOyg31ij+JWcry41BVSXaj2riZWn5UnB3UxmHS9PAvoRAFr8Q0oWJRS2
 pmLFjViwOIcJKWeV3fGk8OkQDeL26M8tdcv5xdYECosHaH51N1aP84/yBErHRfK7
 KywoUWqJIQpw5xU5cdKKBTLzZc5P+i2ykSsPXtRA3PPDeZDJ22pGk/1qsXtZRHGn
 C4aX7TdRCcHnoA4FsqUtQw/NmIcKUsZWxbhzUPzSBkWZ1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse2m8d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:14:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cd7c4ab845so408548485a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772982855; x=1773587655;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c2gyX71uGOT28R9wcuomHiWXLz5+YgMpzvWecME3waE=;
 b=VJ8Aw5tPAnwgLwPHqS+8nL/Tt+h6yIGYIzCVtEFUxCPGcR14mxiuFsmLI6nEy1ixD8
 f4OspN47jh5dKtA7BUgmIIpFmnAE3a29cduhm/TOcEOdh+B4MLtO6064P/9yAo+rAIN4
 +ne0mVCCC5+jzZEVFRGpPgtZepNWGg8Sns/iyEsgHq/LZVskRxLQ1nIkOvbKHLlCOcmv
 9h5weBI6PT78+pz7R3lRh8JZZK8CmOzDur6RaBO5FV6nbsv4IkvUhZlpc+QS9Pc4jacR
 0jvFap4H+Xs6fc1NFfAysOLEQ/NhYS+DfkiUTGdcuhAQ6oYhG1KnCYUidlr25obxKpPT
 uljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982855; x=1773587655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2gyX71uGOT28R9wcuomHiWXLz5+YgMpzvWecME3waE=;
 b=r4RcpjNSyJBTbTQusER7FSeQvNpRWqOrAd+X8rrUnfUTA3cMYvfOgMYuNpiqDmbHIp
 m1VYwdb0cs1s1d1pqEM/MpmeAWOoGSAIj3Jvbdu6lT/6MqmoXmtgGtT7La3Tj9+fr1zY
 3gsua0OX41Iz4OAV3IE6GTzIoQgdxOs9MfogXgk0fs7WJoJTz9xXFsnF+/dIqHeDKtaP
 N89g9Wzy1Uf+7JVLFCYmhZp7YeczHl5mxHRMtmn0TukBZqi8fsDN95ILn7W5JeY44aY4
 Szj/YSB+8qn2YCNMezx5R2ZgWDogVx4A0qzjhEqtlHdiQw6dlukE8GPtwqxnEanfvLZS
 kFUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVowbDzNkqyoe3gb+J4ztt3p/loRZ5xjpoKRMHCqcs8qiSflMu/3zT11M13D+HYUQEzpnsfU9ohndc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQz8/7ZuHBp6rYcElwNHuHjIqtsxn+EB+4Uy/lVqbGc4EpyGC/
 mFLFRre3AZw1fz1LMHcygi5bKKCBzw9ZWaXvHDMSMzvmK+GAPOSe7Y5Z6N7ULcFA+TRPf1JvNL8
 oJ7B67ZTu4p8g3FOy0dJ5E9LuRNWsg9Cx28Y63pT8epKjQDQte35UzblCJfPYJZwv55d61us=
X-Gm-Gg: ATEYQzyhU2z+wpXDcjEs9DbsTKFeQdAYgPswbktRJrnJ28LqxnTABs0G1YDHy/6HPue
 DSg0CuRnMH3JkxxFjRvwPh+pJh5Dv7DoyVqVUMkUx53rq1A7wufCM5WsLbgRgOjXaLlR65Y3/bF
 dNDLzz2HrTrBa7l9q1vFWNub8EzEUPDmz8n/2Vm8wrmf99lGKeRQWCefKh54ALhDKiXbsUvTpLU
 wh7gvH6E3ZBM+Fthh1Oy9H3R+NqVYVARXCg7pzq+a8S4ctrlNeDPqDZiXIxXuEYt+vuUcda5EPf
 B5lOYJJ+SKn3idKAO2Z1F/2kpZ0jmyAFy0xLdV0HYuaOrM/MO/BuxgaUf3SHLuNMx4WYd0Mxu4V
 xUdWMyAg3dTi05y9mIVUwHkIppglRG9V2qjgzZ2TOtnOnqk+MkgugK9N0yEhKrRdPv5mAIh/O4V
 Zd9wQxwHdYNGwlLg/dpqGfQEqYS5ZzOQ9Mtss=
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5a8 with SMTP id
 af79cd13be357-8cd6d36dc58mr1185478585a.21.1772982855087; 
 Sun, 08 Mar 2026 08:14:15 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5a8 with SMTP id
 af79cd13be357-8cd6d36dc58mr1185473185a.21.1772982854653; 
 Sun, 08 Mar 2026 08:14:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38a4203064csm11602251fa.32.2026.03.08.08.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:14:13 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:14:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
Message-ID: <qwrl43rbj5p7oj2buvt56shf6apmuottf7f6tkl56utaqowtaq@yfes6ilfp36j>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-6-aa2c330572c0@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-6-aa2c330572c0@protonmail.com>
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ad9248 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=sfOm8-O8AAAA:8
 a=irybvU1nrzm0wZGzBgQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: CHnTE0rvOzaOluHx9JCvQWrstffzvsZ0
X-Proofpoint-ORIG-GUID: CHnTE0rvOzaOluHx9JCvQWrstffzvsZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfX6fUB9uTKJU+E
 yuxc+ZwkxH0K/c4lim9/1sjjhpNeCPM8hUtNdGf8bC/9B3leXlSOhi7SxMThskk9NHoRcPb0tVh
 ca44qJX7hsjHhXH1KYD9vLgzBFzwujl7tyKetJHI5GzbodxFjK+2ri/l9CvvxhGJUzCtaKtEW4H
 0uTJh7DLIWaS8q6arGhzF61/BXR/UHWWvmgF882GVDyXMfPmJ7d3hkLQ5nHPRNr5+vqIFEUY5HA
 RHqpIKH20Ex2iHxcP7rV/MMfPVNpaWkYsp7QkKb8FQIwxHDaNKsdrp6wEbnZN4rUxDKssjW3CLu
 mDogeXm4qyyi0GVMmQbrhldDCgeJuAbr0EPqTqR1wC94r1uBFgt/Udlu5aSB4ZP2fKpI6lycfy6
 +DCluxhGF+ZpU9G+Cgyxub4ntv+RFjOoukExOA2d5TGb6K4xVQdhTqoUi/58wD+TwnMoRrxVeb3
 Y7cY6ikZuGzRvJ5oV9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080140
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
X-Rspamd-Queue-Id: DDACA230D9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS(0.00)[m:cristian_ci@protonmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[5.93.78.104:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,protonmail.com:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:46PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index 709ea6fc9fbb..83812050a0a3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -44,6 +44,24 @@ framebuffer@90001000 {
>  		};
>  	};
>  
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";

Is there a reason to have a separate device for it? It can be squashed
into the following gpio-keys.

> +
> +		pinctrl-0 = <&hall_sensor_default>;
> +		pinctrl-names = "default";
> +
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> @@ -335,6 +353,13 @@ gpio_key_default: gpio-key-default-state {
>  		bias-pull-up;
>  	};
>  
> +	hall_sensor_default: hall-sensor-default-state {
> +		pins = "gpio46";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	mdss_default: mdss-default-state {
>  		pins = "gpio61";
>  		function = "gpio";
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry
