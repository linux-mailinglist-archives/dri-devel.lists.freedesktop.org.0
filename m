Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382EBE5587
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B80D10E34F;
	Thu, 16 Oct 2025 20:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6uWQEdv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5906010E34F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:15:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GDqIUf024767
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9zBcpy2TVGpV6SdEbPYF0b4m
 pBJ4QckghSj4HE7U+Z0=; b=U6uWQEdvwc0Atp6F/+uCApeLSUsymXEe4pHLtXao
 i8NlEGgPilQYtDRy5RAmjrXbBMIRWy1dEEYOrvfitNOJvjF8ezUAohNAJQrIbxTT
 sGJj4JP47vIt1OZxxyPhy/baVufsqdQF9qwwPceQ0wgJOLKrL9WC+OxFPNlTW+4I
 HwnP9YgD9Yfun3o081dWWNpjw74Fa1qPOFSmckY6Qaq/wDCdgBUXJHQMmJRIjVay
 4JvNmf0BNXza2ZsheozKSGcBwzHJIjCVqhcBIcIGL4x/34q16diC0+XQ7T5Ll9Sz
 +lpQlgRhGLI4u1Ub0a5J72PhLOIozLPkYO25V0+a4S7jIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff11n5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:15:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c2085ff29so20986796d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645705; x=1761250505;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zBcpy2TVGpV6SdEbPYF0b4mpBJ4QckghSj4HE7U+Z0=;
 b=cRyHjOBgs85qoRMJeKpvxwZQnJ0472kGcapjNxbDjQHGDMIhYoy31yYaX201gXED/s
 wMDAgflCZVL4xdO3rAApHkvjmORbh8rooCKbIrTDP081jp3/pG7oDIm9uY7l36iKWqDr
 wITbRQZHsznocinF33Nzl+DbMrdEDwdBu/mE8rsoP15lZNdksBP3mKUUiISXJKJgcccW
 i4xWOcUsQBmlPAkmA0IxlQyNTdqUkm5CrzjfYUL6KUwAxkBLxjQstOcb+NfWwgbZOhtu
 LMhy7gGWCXfc/PzMeoTyEFirP3ubBtSzvwEV/k5phmzHoC1pS1jf3g5czZ0ODP+l+q37
 NYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeR4v1Aq+AdPY0gPUinI1rs670ZFJ5C5V1b/qBho1yhWtxPJw5c9Iz5CpAvsMNbL0zyWyo5AyCl90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdhpVr7DZFDndnSl12L5RjfwhiCAa5oI5JM3688RMJFFNIYFit
 asCikxOGrgsmd0pw898oY1rrrURQp48Y0lO2uD3k8Bc4An5mTGXUUUqhDCmAM8uzhl4pPjjxSda
 oA1x1upCI9QG1m0h1eYFICyH6mDKLVNIuUF6mlTprLHyBECA4fh+6a8w+wjeBhju8hD1/vXI=
X-Gm-Gg: ASbGnctl/ongi0c48vRWX3LFpaxue/2MYpuFoxoEknbLP7T3FHCUlafq8bqcM3+jwH8
 hAQC5QzkQWMMfpGzK2N3p8Z/t0DiPR4iVOHv1CpmYa2+ay4kGkbTkm11FJWmcsfCspbqz30Jiy9
 vrzwfVzu0AF1x3hsnnTQz6vqBnlPyiqSNy/DLLescCf6q0axv7bqicKOJenaSRyH2/SeoBpxjI9
 PawSatn5orZc8aps+cUZmuQS8z25GGMf3j3Xuet7OIdDs+jIAgXokF0Bh16pdVHIeXZnNJUOr/O
 weM+Ordby9jqb5E2P8wV/hl0I/kb3IL/GRrWGIBT0jp0rNV1wnVQxURt86ykNLs1INNv+goWFYe
 sy3kjhb38c4QY3WtiB40RA/5DExDBe7Ij/M3I3bctpqLQyAiFjpv6qceq5a70ArLPk608vwnWpo
 8fPrSRo7Ku6j8=
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id
 d75a77b69052e-4e89d273e19mr19028641cf.18.1760645705041; 
 Thu, 16 Oct 2025 13:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe5fnMVrV7X7OK0iMbXtKG9SypwzE4pSZ+g5Jctt4v8KdtBGL8mmMoU8EYU/SoOlRUrLoUiw==
X-Received: by 2002:a05:622a:1103:b0:4e8:9086:e6fc with SMTP id
 d75a77b69052e-4e89d273e19mr19028171cf.18.1760645704394; 
 Thu, 16 Oct 2025 13:15:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088580ae2sm7280651e87.117.2025.10.16.13.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:15:03 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
Message-ID: <rung7om2fvwmfyihgsnn7j2b6pak7sjt2ayzy42ovugroti4jy@wt6chj662llr>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/US9RPajbgeu
 oqMGZZq5wzn7yxhlbyEL3Gy4up0J5Z+m4O54fW3qN9BmXCjEBy5xJQmYiR5M5bUAyhkgFERIZmp
 IcQ+xsdXM8ScwD8styecxSrLiMjRpmmFc/OAToPKbBfbu29PT13Jvhut8rjfIXmmp2hcsWfrx07
 ntm8yIQNEZ12ovuEP+sKzHGOiNCwuq5sayBZSqtZ/q6dk2aylTI2q6eCKidsxVBilGkABzoTGDG
 a7hibpQ1I18Hvw/wUPqB6QJzUutjSFRmaALjV1lIOhXF/3MwFQh56LUvMxUSOHZNzThlA9Ce/PD
 T6VVvfp4mnp8hnfn/lVJDzWp3JkL+//Heg0im86WA==
X-Proofpoint-GUID: y6RhRKYG23Vlt-Fr2f6D4S6u_q31QKtX
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f15253 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=HryFia7_YQCGBQHkU4YA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: y6RhRKYG23Vlt-Fr2f6D4S6u_q31QKtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Thu, Oct 16, 2025 at 06:17:02PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe panel Tearing Effect (TE) GPIO line.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index a8e87507d667b..b663345de0214 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Isn't it GPIO 10?

>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
>  		pinctrl-0 = <&panel_default>;
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
