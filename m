Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCEDA79100
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13810E7EF;
	Wed,  2 Apr 2025 14:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="itjJPuQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEB210E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:20:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DGkh1023742
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 14:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QaHBoCu2plE0M+UFuQVndI6v
 xXKN8hJXQP76uM4bYAA=; b=itjJPuQF6B3qUNo7Dx81DozIs8xtaYSW0kC135JA
 SNbtWuVtK3hiUWqU7G/eeiX6BWxd0GwCoaDks75zRubQzo2PqRfc0w4fwoLseoHm
 U+REuRT5Tajl4lurMi0x22mZbe0o2Co7mcd3zA4FkTs437zxYpzpEOTa8eRPtsmf
 4IH01QkNeXRnFoieyDLagMCoahKlgiqU1rIPa2T3vK+qw9DER+JTEHEfLLAMfdqM
 3VPDQW/zZeU0YaZ2A7bbrUVSOaLQd+4/1XSloXIgdDC1E8gbIwmcwc/96kkGGY6K
 J0YRlkSdxU1eO9dH1LqEdiFfreCgAc8XtlMH+fBVm659Bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapsk56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 14:20:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so1227062985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743603648; x=1744208448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QaHBoCu2plE0M+UFuQVndI6vxXKN8hJXQP76uM4bYAA=;
 b=IvBK2IpdH1UlrGrrLMCvIDTdfsgu050jQCIwjNlvzLhsR52+iGb9xHS2ZCPzmmJ01Z
 hOT0yIHwoSFRbVwsJz6HtImMKZIvF/slkhBlFoe/tI7JUdusIpZYHG+LTvOonlKXQNQP
 LHUsJpoNSbdmYfUryH+huNmHbDyavVXKIz6AK5Hn0LQ1i0dGypFkRwseJ4wkMaSAkO8V
 bgJLwEoLgafL1YGD+TSc2Tk1ZNJ48WLZHI5YqEbRHGQ6aCkCFxanE1xC1HPvVYnB8Jld
 13zDRS9wOhnzJTE3k0QPdaWCHTJtt3tYNajWY/e3Uc2RL08IBTFrnLyk8RzFLrweekga
 rTJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6F0XVX/r+i47ymTiU45E33wa7dblyKOGbyR0KlOx6TpY/1TZ6geRMuZ/n1hcXXhZkmIOa4Wk2CGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqEcFLRFMKNAaFOEHbkjDS2WCrrkUccR0s1JhfTProP6cxERHK
 n7EPRMdB3sDXBrDCEZCwcnLCjW4gYnQw7Sro3MzvKSFrbL3mxtLQuhgbYN5B4Ks+/+TACZ+WERN
 85D/TSiC9rUaH0+UsoIkvOGMi+ROyUxGRro/ml58QqyXbNuixk/DRBafh6WCj+Xx4qYQ=
X-Gm-Gg: ASbGncvM4vQCDI7h/WEAHnKOZFkabx0m7+ISeiVGRWd4Iy0j26unoW9pWZxqz206MWU
 k3oqaklSqXnw0y1U6EkACKzeTswLLQwfwrChKimZ/W8hAIGR3gGVy7uhYkYoP3gdYJLZSl738o/
 WnFAbh7KvxVmv5tSyiSwzvK7j9daS6LJNb2/BpsJIY1Wu8hPqp0nP+cjm79NjodqKInKI3bAlVx
 7ZZ9XfE9HzPEWdqrsbJDYqc93OlhHpTzym7il9pj0uJj7NuXMuIeVDSmJEEmqCZ4iBLbQKXnJzP
 +7Yqcht6UCkBLqItLZ4tW5dJIyu9xv9oMvh/3U7prx9Oj2+unr/OxeaupUWFckxWA8QUfYjitU5
 wlus=
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id
 af79cd13be357-7c69072a6ffmr2301577985a.26.1743603647722; 
 Wed, 02 Apr 2025 07:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER6WrRBqjM3x6rtOW5O3fmd1tFkam6VMOs9xv543bktN2RGF5eKxROMpj0zYvG2nH7flGq/A==
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id
 af79cd13be357-7c69072a6ffmr2301572085a.26.1743603647316; 
 Wed, 02 Apr 2025 07:20:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0957fd8asm1639781e87.134.2025.04.02.07.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:20:46 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:20:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <qaihakhkbsgij7fvuutimfl6g3wgyt2nmrmrudef4q3oe4kluq@o5yeimais3dt>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-1-41ba3f3739d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-1-41ba3f3739d0@linaro.org>
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed47c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=3v6bRUsi6CVysc_G3k4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nw3ppJLnJtE7UzUuhDKx9M8b9utlnVue
X-Proofpoint-GUID: Nw3ppJLnJtE7UzUuhDKx9M8b9utlnVue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020091
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

On Wed, Apr 02, 2025 at 10:58:32AM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..b0dbe4eaa77e5a6f862fd0db2a3c91db2aab5030 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -975,6 +975,9 @@ &mdss_dp3 {
>  	compatible = "qcom,x1e80100-dp";
>  	/delete-property/ #sound-dai-cells;
>  
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&edp_hpd_active>;
> +
>  	status = "okay";
>  
>  	aux-bus {
> @@ -1215,6 +1218,11 @@ &tlmm {
>  			       <72 2>, /* Secure EC I2C connection (?) */
>  			       <238 1>; /* UFS Reset */
>  
> +	edp_hpd_active: edp-hpd-active-state {
> +		pins = "gpio119";
> +		function = "edp_hot";
> +	};

This looks generic enough and can go into the SoC dtsi.

> +
>  	eusb3_reset_n: eusb3-reset-n-state {
>  		pins = "gpio6";
>  		function = "gpio";
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
