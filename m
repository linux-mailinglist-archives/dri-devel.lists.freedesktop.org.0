Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A83CB1513
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 23:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE110E55B;
	Tue,  9 Dec 2025 22:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbODv0BH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnW29Gbs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A52010E55B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 22:42:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9GiXAh4093900
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Dec 2025 22:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3HJPJw8BnHwUDLYnlVfUA49W
 h43bJ9QOWXO5EKr1pEg=; b=hbODv0BHMkuKkrp767sq30bw1Gn5U7d1at4PVvCs
 YasKvHx+I7njVEZMV2MwANgOwWbWW7FX3wEAIeoT+33w8BKp6r1VCwEeuRupYHfC
 W9grVu/iZlbTcGOeGfO0+OqJ1uCVGK25q55e4KF4N1JpS6IiaOtyEo+MLEQb+l4v
 rGWFGIvtCgvfnPXF6Q5VLTqK9M4RVKF74Xrebmzs94kXHJ4ZGZUMwZyjBnr3nNcu
 oGESH1vn81Nx3Pmb2lC4fx5oXCtzBHp0z7mBPNiI6G9FJDgsTYuMdGHtcHp7Zv/l
 1nonYPz3bacffCtKv/Oy79WJ+x0AsJkP9+C5w+eleBYo2Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk52627-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 22:42:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5dbcd452924so3176400137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765320161; x=1765924961;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3HJPJw8BnHwUDLYnlVfUA49Wh43bJ9QOWXO5EKr1pEg=;
 b=hnW29GbsHH4yisFLL45a9LN1lTEqLbOVz2lqNQTDpcKQzfI3sqRWwTdxhvGN4QaBva
 7C2Mz5oHOCK0rZ4EX6P7hhiLcu8sDXtcbNfg/gX1ymphLhjQdrg9tcm0WM/Y1aqRuehm
 +03ZNCnF2iCx0VtgrdBSbeD9tVcW33gmWXK8zjBE1HG4qlR1p1bR4p7ZEH9Z/RXaMiEi
 y3iPn6zBE+Txn7mfUdTEUjhNAILQrwijJpIgQCGyB90PJ5VOnXwtXHxELaq5lyw++hNt
 FuiHhyuGh3XFpJVwoGVIn/GMehR92C6l7ltyJAP7db1us1beUaCDh215IH5VvstgkqDQ
 oDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765320161; x=1765924961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HJPJw8BnHwUDLYnlVfUA49Wh43bJ9QOWXO5EKr1pEg=;
 b=Ysl8igBYhoiShnks4uG/DBhaK0BftoRpwDs5AAmL0eOMGaME6M2GcysnIN2ah39x1W
 fX8sD6R0ciMzLNlm7pqs/9RyXfi378ZDEijWBM0W0lnOkevsRDF6uGCxPyWu4IRooB+J
 JtEK9+HSmamzmHV9kcoET29w9id6CjgFYNEXUFMKy2WiELZcx1brALFhAS/99/Y3oIa6
 lWZS8/hd2HMnZjursmRKXoFNEsmTKqEIMd3hIbTORGn1xM5B9wSpocWVDrH2mZVrVP2Q
 1PFNzJ3Yimc9c0FdlbuOPQF9azA3szi3Ug6Dy5llwCO99OmB+4ih0d0tkGEh0hJvyRbB
 3t0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUikr0udhNLFhR70DpLebLGFLlJ7rVH0/QkfbWK88W/YoqJpiGbb0dZFk/IHXPQD7ByLwJojIDUfDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydWQJMVV5UrgyPAJQpYnfacvujDmiNULlcUBK9KFAgXRf36kib
 tLfl3Fjs1dj0ATRLxRr/pRuTfeFsOUA45R0cibBD6Lr9ByCga8baBVGwFJL90lEafAd0ETjNXSu
 rl8kVjdGtphf2HUZidMJa3pzEuy/qltjhLcdnMnLVPFEfPQ4TB4lBUZ4oyx10Lz2CbnCYCCI=
X-Gm-Gg: ASbGnctddG6AYgbxYOux16V7OXB1DBCv5sfqPV/Y7SCUdw1IJahA8UruD70GuHvsx4n
 IgGC51bw3OwhFAagVjpYXqOJI7k3hxHAeyYkwHl6hlgSI2lr/W+dZYmvIndWNuDgMcivZ0sapnh
 pjFQcdFFVI4GzrN3FQBsCXUM8fWGDv0TLX5wYyqgPuyAO9jYE+7lVWof59lxaN1p6pD4vcG6blf
 r2y12g4/djnVxO8wkLbi29t/AwWC21WWjSz2npyvRuqeQDKdS2oVTnM5gB4rcCoIIPau2ZtKWdk
 SQj5+UyTRlwWimwHL98EIsbDvb+7gpy9+3Qn5ADogC5oHP9juBi9tcscRi4jQ1xpKb44lb7dIJP
 97z+KlhoF8r+jd7QYf+hkW744OKnDuILnnMWhJHZIa7J2bTTm9YjDJxaq2dvb9abaoNoeMOHUW6
 WmIFGqm5SeCm4MxFgdHq1m+88=
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5e571f1cc97mr140208137.40.1765320160693; 
 Tue, 09 Dec 2025 14:42:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG29A2AD+KXPtA0IIwiku2hfP40ZWsH21yDI12RRxWKtn8K06eKpoAWm4hl2mHpkBLV34qYPg==
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5e571f1cc97mr140193137.40.1765320160271; 
 Tue, 09 Dec 2025 14:42:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e70595ff7sm50933701fa.30.2025.12.09.14.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 14:42:38 -0800 (PST)
Date: Wed, 10 Dec 2025 00:42:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Petr Hodina <phodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
Message-ID: <2eg7ef244ykfb73c3ztd4z6tqu647j5h3qaobdjxsxywdqtnun@lea2erzgtgka>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
 <20251208-pixel-3-v6-8-e9e559d6f412@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-pixel-3-v6-8-e9e559d6f412@ixit.cz>
X-Proofpoint-ORIG-GUID: PtRmmEK6u0GYSx1h2aHoqvbINyQzi-OG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3NyBTYWx0ZWRfX68xTW4iTAJLa
 /YJmjQPgWwx3+gi9vRkIOgR1CMpyzzVq1kd+AKwQXe4IPyMT1UxjLGsGz7ItFjSzLfm38uK1dW5
 YQwOoE+DU0oq1hLRRVUAaosFSLGkhBtiGq8y5HbLZcUJ1u2R5BJWM2ygQHnCvK4+GJYyocVOYGo
 Fh+dlQcC/xobvtYWBNuZjEou+/LJTzJtpqZXcGJG6UZEtKiUNlDoxAkQkwhGlOVrE5MFdLq7M+H
 wovYL5ZHY2qZW425/dAQ8ZY7yXROb+KFfUH1xJvLdLRRPM89CcrcSGfFCu6xLIK9I2xJY1LDpZY
 +7eVxPru4mVMXbijBAizvAHuvnGtnCeyXJb612UF7PJVdJtZEXjB3jeyGb5qy9Qo1w9V5bgbOL1
 A8CkZWQJ5JPFP7hit4PoXk2/3BkzOg==
X-Proofpoint-GUID: PtRmmEK6u0GYSx1h2aHoqvbINyQzi-OG
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938a5e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8
 a=vNBBnn9n697nUSg-uQcA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090177
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

On Mon, Dec 08, 2025 at 10:42:01AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>  - Debug UART
>  - UFS
>  - USB-C (peripheral mode)
>  - Framebuffer (both u-boot and Linux)
>  - Display (Pixel 3 only, and the driver needs work)
>  - GPU
>  - Bluetooth
>  - Wi-Fi
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  85 ++++
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 524 +++++++++++++++++++++
>  .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  33 ++
>  4 files changed, 644 insertions(+)
> 
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +	qcom,snoc-host-cap-8bit-quirk;
> +
> +	status = "okay";
> +};

Missing calbiration data. It needs to be declared here and submitted to
ath10k ML: https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html


-- 
With best wishes
Dmitry
