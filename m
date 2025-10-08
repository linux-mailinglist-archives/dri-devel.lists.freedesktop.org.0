Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2135BC5E2A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530CF10E850;
	Wed,  8 Oct 2025 15:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkUW1Fc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EF010E850
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:54:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PNW011898
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 15:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LE2fUidSmHSribNBEy2MhkAI
 ghJZNhUt1M2wqROseQA=; b=SkUW1Fc0E6PkWi/DdQpY6g48sxwJZh9WRl5HWW4p
 W+FqLoUaxDgKwG0906XJW+yasUsYRPH+lDGkkRzBeGi9DiUWOp+FBmleAqJaCdFi
 fcd5CnyuTnhDnzAaqPfad2BrmewWDJ39C0jBrMVYaRukHcdZrFubcccS/38pu54q
 y1cEBKiTXvUb1VE+rV03x98gPyDOSY7ka+rM78snG8sH5MThNgsH7rbT+i7Pvzg3
 5ifO/abyPFXKhHPu7mUXHu6PZ8mpQI0Z9+pw0zZMBBUsx535ab7nLWZOSX1HezAL
 SETvrWnRK89Z6epwmClBXj1clF1+wf4HGmD4OmoLRlorjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpwyhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 15:54:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de53348322so307510681cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 08:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759938857; x=1760543657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LE2fUidSmHSribNBEy2MhkAIghJZNhUt1M2wqROseQA=;
 b=T6vamGRfnwT8NlE9reH3okwsYL3NZNSWO5IEb1K1RnCe1EkDJBCiZXRhVTjSmuuATz
 SXJux+9ASLAgoguGW6WUdsXCBEGYp+NpqpUxB/bK9sIV+b1+Hn1IYUWrtzov8ht7MSPr
 hTPz4n0EdAFiE1iSbbZq0FraKDEr9Ksm0nQG810CiA3J4J96GNuj/00IrSrwUkDBOYeC
 u0KXCQq8BpD8f7k/NeeJHXmM3cTPvNsFZx1Da3UJ7KVFO14NNdbG1xJd4H0VSNl0w3tO
 1D4YDHLMfl9n/A5B96Hq1CaWDLY30/VHPONd0ndE1y+0P6BIUxhgeDD8NTeVIwjDtjbu
 KhQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKwcy9DHJVfaeY5rCAEFV8vQrwQABfyUtwwvbUjMaHvGsVm2uvqFaj47Ri/PS/+Vl5jctYuF07f2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Om7FaPo6LftnFGQk26gQ3EziauWnf+4EvHQfTjgxwhR7Dxal
 jM5lkAnFpLu8WdkhkZG9xQA+AP0tznDZHj8do7EkFjWN/SzS4xGqzTS5Zt7n4QSQGAjiYwy3U9a
 D0zCWGfEZCKUezXoMNSQSHsiKZ3tqLf7ikcoEplFjAPg1uYPepmXYD7Sx8Rv6/jG0ptOzdQQ=
X-Gm-Gg: ASbGncsnTe3yUbsc7DdHwsUg6XnF6GbYZrbf2TGZH3zqqqGTk7W1eOMfk0/QmR5RcUa
 JA7mo2EVpycYeQOS++w+DV3A3p0AEJlp2g3af9nnnXUgaICN29Btiu+kKM/jvTwZbH9G/Uaiq+a
 FEF+cl5rQ8r9HrMQ3TwTvuXsFdOn34LWdDTvcO/cNinY6FMC8lnV7VHQm0ZVWgnymzj6eW10lbf
 stlh+jO13Hu264JfghiwcLku0hjCZNJeIa6CqEZUQ0cTcPF7ggxgu/swYwdOeFszTrPWNieMsBy
 DPokPOypA87zhNaBG3Pyrnfo1K2uAw+Hk0AA2cCW+9wDyoOnmIsHe6eOytxlPg38vIbVIEy9Xml
 iKrxNbk5lHEZxFCaMsN7EUBQe71gGaPIzEIpd7jWDm19tH2cpSUUzgQnq4Q==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id
 d75a77b69052e-4e6eacdacf4mr49493231cf.15.1759938857178; 
 Wed, 08 Oct 2025 08:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvpXymT2Zr8z/4eTOthDjqXP/fGceLamBVGehb/FzKKGCG3gKvNiaUfAY1peyOGsUvFX0bMw==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id
 d75a77b69052e-4e6eacdacf4mr49492571cf.15.1759938856560; 
 Wed, 08 Oct 2025 08:54:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac00a83sm120303e87.11.2025.10.08.08.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 08:54:15 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: sdm845-oneplus-fajita: Use the
 freshly introduced driver
Message-ID: <visvxwdwh2mcympwre6kx7xesvsysdjw6j33kewwibzfbgrbsi@dkcilnw7gk7c>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-s6e3fc2x01-v2-3-21eca1d5c289@ixit.cz>
X-Proofpoint-GUID: QJwYyxOW1as7IheRtDXhepruYBaxyxQP
X-Proofpoint-ORIG-GUID: QJwYyxOW1as7IheRtDXhepruYBaxyxQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX5bY//PEsBOWb
 upQGnF2eGFkpoJSn3OTpHVDnqqJSI9e6Z7OlBIoYSoYSHJNJhf4GqN2zZCwwmnKA6q67WiJvvK8
 CpVBrHQSTCCH1gut8NS9/HamkzAQfEB3JZHZZnKDNNDFq1i64eCNdtKGwd4WeGjGZaVX8jeA2jV
 wISFYMvZjMkXSifRAhOdKyStpCTFhXYxDs1WFSkwOBB0OWoNNkJQh6mPi0tEQZDnmtOj/WCXFcJ
 ggRmfZUNFE2oVZtIVtYJsRdhkMUSFR+GnFtX1BCb02+g1gbeBmTBogtK2sRc3aoT/s+7oRlj81U
 nu0nqbpa5FE8zMBOp4I4xGRmgvcroLsCTznBMhCA31HkAoPZ25faob0g0zubMBbS0G5ZnZ/jA1G
 mwdZ+xsnpqea2I9ZaQaLQrmNn1olcg==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e6892a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=DPUHggLApdFq0BbWEEcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
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

On Wed, Oct 08, 2025 at 04:05:30PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Switch from older effort to support different panels within one driver
> (which already dropped support for the HW) to the freshly written one.

Please disconnect the driver and the DT description. DT can be used by
other instances (U-Boot, OpenBSD, etc.).

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 7e75decfda052..55b3e94dd9726 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -32,7 +32,7 @@ battery: battery {
>  &display_panel {
>  	status = "okay";
>  
> -	compatible = "samsung,s6e3fc2x01";
> +	compatible = "samsung,s6e3fc2x01-ams641rw";
>  };
>  
>  &i2c4 {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
