Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86479C338D5
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 01:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B922710E68E;
	Wed,  5 Nov 2025 00:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7bZM9HY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqL6+oX3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329810E68E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 00:55:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4LA2W33090437
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 00:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/ADOlbA/MeXRPk9nFlkw4G84
 15r9Bnyhb0LknOuL9V0=; b=I7bZM9HY10F5/GmUHmO4M81orXypz+0HnoGDjVke
 xukl33suuLsKLPZVAhzwXstnM65gkGDZ4p/ZJOvdJZvb2UtX7fiyG1oTr93fqr/T
 /zfRT6jE0ZcvZ6uBiTa7Qc0S0HL2+wG5mxPHPHPResg6SNHhOBeFL+wqMaLiegf/
 YW5geElDoK7n1j16WtdjJK+kLIAZ8NmkRtsW42Xcc8xBmBCoLgKiHa8u3WGJ6iPi
 a9CeyLMAch9cWC/gP+deVxRE25TwEJuuyQkMbjHQLnSWoNtq1w73Ca1fiVoX+YV/
 tk72Sd0cwkiP2AGz7TTQAnaL3IWz38lt4QfdStI7ctXu2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5e8kgs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 00:55:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-89f80890618so2516341485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 16:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762304106; x=1762908906;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
 b=VqL6+oX3BHpxaAzbCWGP1cbJqMJquca8tcUpcwheSGOgvE48m+0eAWBK8u+SiESmSn
 /kFSPnekbSBgPVN6bPuv2n0RniQ0t8dnMO2mGNDzwPjs4WR5vp4p+OSUFdrhXElWsmfG
 jjld4DsAPBNxhzPNvYQIeR1VOIJ+TVyi0G1hBU3nyPsj+gJFguVFLLsbjmZVXVmP2bIq
 x4S5+oGwvrKsW9+FMKcyfKCcrOoZGCd6OPG6/H2W4cava2VwbOnRwKzupti70cPNbeQw
 DuBXb9ytL+iGMbjthasRyNMvbGYbhg24EldUGLbwcI36T4Jj6YOon3thhK3xAlzY0bcp
 +/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762304106; x=1762908906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
 b=V7U85QB0wEZnwKFIvBRMIRjp/3Hpl02PpuRo+e2e8jntieuNZ31Fq6m1hKz1+cIzdZ
 mb7DIRJ/FibNnwahDoWpWCVt2HvkSeUTa7AT9VuqVBfP1FgIrZtbpiln6LLSxYLA7SrK
 jcnlCrOpHCWp+924QbaiKfQWRLMjPeJ8EcyRwXHFVCrXlNKDxELxtjQq6AIHr30VIfIs
 vPDm2/ccE7e7d/MCbhgtCuQiSr3bDuvp6lCG+4GPq2w614QGrxmLbsmJFjfFM1rXmwd4
 QJo4depljj2VJHm/Jn3jN3z38/aitlew9oFVOwl409HPH+Mae/xEwu0dwi6zM3y8Kxs0
 d05g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn7gSDaMvl4kXVvfXVf4Yra6CEfNoKL96uy8/KaFwvEcZYR/mxWKm0kky/9lo/7p4JYAwTj7rODks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGtjQRNZO+FiddbRvZvlTVFNwGHNekI9Jnbu/HkNw5aWgGJtCj
 Hcn5QUnjcF9dIWwxqkkN3UrCkW/Qi44xPhGMYVs23oDK8WCCJ5aCFba5S2agiHAe3eEG/LJeHL0
 x1HSw1eVwfZiwPIsX1Q54bDf08TmvyG6w0xuCY0EQ6gJFXucRzEmfHidZDXWK0KovTJtRHw4=
X-Gm-Gg: ASbGncsSenl+E1KsyJdtrVsta6lyuNEAHUVWW8lOe7XUAblhLyARcYcGfX2+qxo6Dl8
 188pO/8itxSChRZSr5ytr2HE6ZVTVKpGZTA4FqJSLGF47g8/89uEdqOi1WUz5zZseb1tdfIQVsn
 NhfAcKrkvTULrVO0QHEsVSaTEihD8w3Egs1BLxB0I+hWMDe6vkw60uh/LHhznid2DmjlclTCDT4
 PpN7ng3TsqZNv1YB0zh5itz9qYKuy5C9ytPT5eCXWQifdz7XciLY4gIregq7BA0rLw03r2IOWqP
 Mv5BZdvRR3RP80Z54heU8FcEmpWU4rbuCsaJffIzcWk5+6BQGpFKHCOH9asy4WocYbFVr47fQdz
 1/cvBX7CRNIaqVfd4Z9Oc/o4LuCuVoOILZyS53pxOFkicIdc2zInIPMDWCNpwsBgPplre4KQiUp
 LEv+hAmH78nhtD
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id
 af79cd13be357-8b220b9566cmr215544685a.59.1762304106164; 
 Tue, 04 Nov 2025 16:55:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl2T8MaBy02VcjmjrLLsEC09nXbRPXngYX5Uir3OVPaxk5ZvRsK2epgIV03aGzl6YxHlPzXQ==
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id
 af79cd13be357-8b220b9566cmr215541285a.59.1762304105532; 
 Tue, 04 Nov 2025 16:55:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594343911bdsm1169861e87.33.2025.11.04.16.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 16:55:04 -0800 (PST)
Date: Wed, 5 Nov 2025 02:55:03 +0200
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
Subject: Re: [PATCH 02/12] arch: arm64: qcom: sdm845-enchilada: Specify panel
 name within the compatible
Message-ID: <neykh5ldiksowcyqomqlx7wwdo3jrofpn7cyndgsic5ckcemik@gngyem6bmdsy>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
X-Proofpoint-GUID: JS19CvHGl1g8zt1Ytd3OG33C9fxtk-iK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfX76/UsLQLSwwZ
 w3xE/xsaJmHBpCFOcrfBA9IqaLxZuV2mKF46RPulT8q9N/dc0dd2wn8pS+Tw0BCR8CwUi5xRsAH
 Jtc+6sYRTvI5THv0Yn0cTzcbwgmHrPhHRczXpzWc3ctTXpMCtDTtb/VPf3mKvwJRQ5YAnsTWa7Y
 XbLh9aRX7wb0ajiKmroKVApJ0Jvc+m2Nc9AbCsK4YdNrGfX8e3lh8Hax/ezaWUeEorvNhB0uzTZ
 OoGHKEYKAoriRxVW5yJCCbqxcTHOG+XxiD+39pWa4q559oKHAA/CP5T8ECRuIAKoUVjGGWoWZSJ
 8eiDEG7b1UaHG1/YrDz3gd6ZkdDFniM9WEUSkgrmjm+316vfhmSV7e1NPBwrGlj45kldL91AhNV
 W1x2S7Y4QBXt96zPH1LVwLWTVWSMkg==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690aa06a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QsaZCVNBrwfq_IZkOpQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JS19CvHGl1g8zt1Ytd3OG33C9fxtk-iK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050005
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

On Tue, Nov 04, 2025 at 11:16:10PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> cosmetic: sort the node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index a259eb9d45ae0..8aead6dc25e00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -31,9 +31,9 @@ battery: battery {
>  };
>  
>  &display_panel {
> -	status = "okay";
> +	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";

This breaks the ABI. Please describe, why it is sensible. Other patches
should describe whether the old DTs will continue to work or not.

>  
> -	compatible = "samsung,sofef00";
> +	status = "okay";
>  };
>  
>  &bq27441_fg {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
