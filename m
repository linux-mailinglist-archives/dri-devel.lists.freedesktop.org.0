Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4517A70D53
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 23:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51810E617;
	Tue, 25 Mar 2025 22:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6999KLI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE25D10E617
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:58:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PHTnTq032495
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j7cASkMJs9s2On5tUArhdk6ea7g1dAT8ajgqhRmsXi8=; b=A6999KLIQuhUfagj
 zVOaeZT3dEIs9v23e4X3+Hw8FMnorG94jymU+F9ImEMlsG9oXt9kCXo9j6uZ0ZLe
 TQ5I5puG0HECyQLY8e13dfRiUM9xJoyGQOy1dTW1iRchX9xelZrRHaPAx2ufHgbU
 ZJtcmv92b4P1/Q05wYhPAj5ul9xVrkpY/Cj9fpmTwNoOO3RPdwqzsEdrzJYuLg9n
 SqqV4xLpOc+iSa311mf0jj7mCoPRLHZEEU2sAr59kkRKmgPecLlm76BeANUv5973
 ou7ehhOk9Fbzv3r5A66rYMDtEeMhO7JPiLO2o/+2ELGVFa5rTKjR7iJWU29FcDKN
 t3x0Rw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdrmgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:58:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so42923156d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742943522; x=1743548322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j7cASkMJs9s2On5tUArhdk6ea7g1dAT8ajgqhRmsXi8=;
 b=OQZ0wdcFxVyCYAc6LdF0SsMwL4kjWMUXld+UQRz5NS1qebJr70hB+oPYWkJ9Kbv/5D
 uDv17D1Pbe7dVm25Ax9UDyBHFTK2E11AyHQRjCP9H+k7wahypnaZ8HYNRAMOYNTaW6mf
 svotC1MFRRtALgcUJZwY0AXWKoUcHxlRyvsRxA/6VUgaGF0Mc54Wyd5Ckpv5PAcd4yXm
 JWN+78jH+ad3OHXPlopNMVDvgDd9ONJwiDCZ54T6bbvaMH52vbp9Kfpc9KnaBlEaiGvZ
 nDjoj3fjWgfXm+37zxPW9oLtfwycqrIFmG3tt2P6P8w5iEHm/oxohlFMmlh4UACD+oOP
 cd0Q==
X-Gm-Message-State: AOJu0YxMByGWH4uVOCYRBP+5HOjONxUcZ6O6dUjpYZJ/5CU82Y7Wzi68
 igetXuDZRXfGZ6WmdMnhC9brcysF374lEj5/TB4ZhNzxCw9Ddz24qHmM/1q6IWqKz07gtu0HJZD
 e+nbgy8cAN7EsPbXayDp9CBlnB/lsaZwI4P7eTzzQFisNtfoDQm9cZD+BUQ3CzKd5jFU=
X-Gm-Gg: ASbGncspJOP3NAEzLzrMgBp6WqEVDkGaszomUDk1jHuxRek+eJqpRiX3riaP2HWJB3B
 OOvkY9jZ1HZBqS9h3iP3x2wxxCnQ26kYfItdAQASfoK6UHXG1ZSeyR0+q0qDkNi7Wad1frN6sGo
 205qDq4+NYlhkzwesKEAl6DdQEOQyZG6CzimsjQ0QDsueE7gv3ssEB4c2Y/sBYz+vhF0nqiNV3M
 a9l7wDKfAJwrpvvMSL4fTnyjI1u1lWazoIrkAeZXmgI94c00Yp3ZkfuHTFI4XlI1xx93excda10
 Rx6ga4dDLhakyMH2yVtC8zZroeplJ8DsZrpWTcIrtZhNcvjrcHnw4t1do7U87aEg0W4rIyjHSOf
 7+wT+H6nOmkTAu+LgBwqvNzZp97H6zG1KJ0wgtNZlWSwq9NsP2aVa39GReiuy9/gcS0Il+Xe4
X-Received: by 2002:a05:620a:29c6:b0:7c5:3e22:6167 with SMTP id
 af79cd13be357-7c5ba18485amr2798804385a.23.1742943522246; 
 Tue, 25 Mar 2025 15:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdhqOT+2PpPpIz2kYCxa+wKuV1xSTgF0K8M8p6Vt0yMIoOuFSU0fElZGTZMSysHiTifnZv9A==
X-Received: by 2002:a05:620a:29c6:b0:7c5:3e22:6167 with SMTP id
 af79cd13be357-7c5ba18485amr2798799785a.23.1742943521700; 
 Tue, 25 Mar 2025 15:58:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:112:599c:156e:7946:30e2:6502?
 (2001-14bb-112-599c-156e-7946-30e2-6502.rev.dnainternet.fi.
 [2001:14bb:112:599c:156e:7946:30e2:6502])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d7c1c17sm19276581fa.21.2025.03.25.15.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 15:58:39 -0700 (PDT)
Message-ID: <366202bb-2087-495d-8bcf-9fe05a9c7767@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 00:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-3-e9bc7c9d30cc@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-3-e9bc7c9d30cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: icwGVV320BqQ1Iv3UiHQkM9MoHFOjQoj
X-Proofpoint-GUID: icwGVV320BqQ1Iv3UiHQkM9MoHFOjQoj
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e33523 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Lw57bTjF4WcXWk72GT8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250152
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

On 25/03/2025 21:21, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   .../arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> index be65fafafa736a0401a5872c40f69cb20cfbbd90..753add73df41050565e71b9faafee62bb2031b75 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> @@ -10,3 +10,13 @@ / {
>   	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
>   		     "qcom,x1e78100", "qcom,x1e80100";
>   };
> +
> +&panel {
> +	compatible = "samsung,atna40yk20", "samsung,atna33xc20";
> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +	hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> +	power-supply = <&vreg_edp_3p3>;

Why do you need to repeat hpd-gpios and power-supply properties?

> +
> +	pinctrl-0 = <&edp_bl_en>, <&edp_hpd_n_default>;
> +	pinctrl-names = "default";
> +};
> 


-- 
With best wishes
Dmitry
