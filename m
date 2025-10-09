Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF3BC9239
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D901710EA31;
	Thu,  9 Oct 2025 12:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLRg7YqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E8710EA31
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:54:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998V2f2031782
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 12:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=; b=SLRg7YqFiIrQ1lPE
 HxPLUZq3yZZj8Q5DeiJi5m6x4PXLMRRhEwrZcCpl3ttbOdGECbfQMJBE5QE3VsxA
 iCKo8lcK/4cCCC3y4P8yBOC3F5VE7F+IIjWaJhGMAH5jv/QPyiXaAerm6HXkVuh1
 51leb8oUthYCfIVHO+Ez6G5i1qwMotkesJOZ/kHyJ0RAZ0h6dirMFKBIetPLCzQj
 yqbwqUsDpgGf8i5CE9/wRO/5ozxn6IYAHlSnhRLr1kd8WEutwtv0LeJWFpZRV6Yx
 Ca1dQOsm9kB90uHfgq0OjPp0mOQCy2d9EoHtYft5SprMcN8iYvJ04CAkOy8vdOlv
 JkRBcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0rrbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 12:54:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e015898547so3194861cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 05:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760014497; x=1760619297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=;
 b=Lc/q1O9OYG6dz6tJIAaNW+E8iEMXCdNFpDNxXi/yKyhNk3nG0WyAmhOGWjpHinmtuM
 KqAC0PwRxiUNxViLLNQ0PKf3zkvpSPqsaGKsB13rmF90PBrFe+qiCzbWveoco+u/ySb7
 CBymWVWMkybN0Gt2rYgHu9zADQacXS3Pg43EDa55Ue+nDdMcGMZSx3dNqn9qI4kRYB0w
 YE6eP9f2N8vMZWpgbkmrcnSSwHhamb/Fh2vcCrpCgKNawH6ouKDfV+fSG8NS2Dou+wts
 38dcmONFJQEOgbKULaQb4HeGO4SigDrSjFjmcmZH5pWGb5/fjEL0acwhkAcBXTODQGCs
 d5sQ==
X-Gm-Message-State: AOJu0YzHLOjnYYpovCq195yBEX1SePPscLsyKOhb98v6FnMtyQ2zUuWg
 kApahAmDZjURJWzibAT4cTEse021vnbWMR0SlgnNaJCLwcXUC6AxGciQWt5UqSFUUUFIMvT0Zkj
 m3KoK+aO8NjJj0wDo2pmb1RgtD44KI1fZcashcQXJbBip1BLnmojS/05BHgMFQk69NbpS5Eg=
X-Gm-Gg: ASbGncvmT9sJx2SsHzaeZSKHXH4BR0d//5ityzHp+MuPkOUHlXnHr3IH5ZzYJBKEzNT
 iXyWhD5h1rrwKxZ3WrQwDQ8oPtOAGT5Ny/YaZ/ZORx0q/jPwsIofz/86MrM1rG2SAV5gAgRREFB
 Sv0110RbM2mMV3VDzUXqZHBhCMD/QPgOSjg9IlcZgCumdYrTWURtooTrKK8A82bXDlWAXDJSlhF
 NHuEpGEB/H4ZvGUkbNMhK1r43Y10P6nbNejfIvIGSU9RPNquXjh6j2TsbUYLCLLLB2Rc4K56KFk
 YGR7eiXm8zBFKxl6hNg1B3VJXzEmvrcx+lSM20JFxMMoOEwEluzolQaGLZykt5EFRDAQ5IeCHbo
 CI90b400JEcb7AtqseQrs4o5KeRY=
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id
 d75a77b69052e-4e7046278bbmr3443501cf.4.1760014496719; 
 Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5/sWgll0CtsSoWnbnw8OuK/4gzjMQpFI0vobMt8d6Sm2EXkMS+OFvldQCCANHXNk1w5jSA==
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id
 d75a77b69052e-4e7046278bbmr3443201cf.4.1760014496195; 
 Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa01esm1926375966b.2.2025.10.09.05.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:54:55 -0700 (PDT)
Message-ID: <6b9ae65c-08f0-4b13-94cb-b899764bfc8c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:54:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7b0a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qaMgwUmbLaqo04ox7REA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0K3IDg_L9OtnriIhDFZwlIJsm7ZDffyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX5klRl1UUODPZ
 rmkLFRRsbiTDENQLOJtfHq6VyoCKjvZ0F+lbIZE6K3OyZq7M8RDug65ZDJC98JJ+E8ctdjt4QV+
 Sxw/N0y78v+yuX3Ne+77/UHoEPZric0+9M8M/UCVmae/VTWI9Xm8b1/7IaQ1Rz3raifGWzcYHsO
 Z0mTulKlWp97cfsbo2h53erN0Zc8lVyXo5hbXFBwTUbHsI+IRdIYSY4yr/q2UEWHcC4cvsSSsTA
 QRZR3UbiqSu03t8B5CmT4VQuE6VLbgvBXygy+D8Wt9wxAfWVAfhgRwjN0LLspYQnnNMnKyIMOdV
 ue/01cM+r9rzcp+rVoXI74ZtCJbmk7pQFziLvGbdUBH0+6qORwMSx7J2HvV75uPt0lUogvSvwzg
 Fih57jM3aFbpKw/iQbihUMpb3dlhzg==
X-Proofpoint-ORIG-GUID: 0K3IDg_L9OtnriIhDFZwlIJsm7ZDffyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047
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

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
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
> index 1cf03047dd7ae..75989b377f8bc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Wait, I just noticed nothing consumes this..

Konrad
