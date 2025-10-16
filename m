Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBBBE5537
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7365F10E119;
	Thu, 16 Oct 2025 20:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWVAUeTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64810E119
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:09:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GAhlco022118
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2NnAT7GWs/EBXvb1WM+DOP4O
 7PmA83tdp8NxNf9Dzlo=; b=DWVAUeTXtA6xisChkPA3hZBUqlRaW8phfwhLioCS
 YEGTPw8kUQU+rCrlHir5p4lbIMl3W6xXKhp1QfSMSrHDhfBJ60YB52yM38UDnHGW
 tpsWChlYBouu+qlLWdP/w2t1QG3zZqohh7pnyHX10AxJrTZiWJEjFCnc1vGbVy9h
 7T3DC39FbkHnGO55QUMDG0SaEwM0NUMAL0kJO04Zc0y1Pyi9B2s54Cenn+KMgsIz
 8bfMgy5DzX32wpX+HedENZqKhXEOqyoAlRdcIZP2v33L/XdexOGa5zFwrsOpg6sC
 Ai2OfS8i5HPyogmuc6JgG/zKrWpZF/ePLLeEcFWSEnf64A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpk010-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:09:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87c0f8cbe6fso43966266d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645370; x=1761250170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NnAT7GWs/EBXvb1WM+DOP4O7PmA83tdp8NxNf9Dzlo=;
 b=RSedtzoRmonltSLtzhMLGPayxLo0TPeoCIUXV2Et829YJ0LkMJc4FBdD+pWO3hokFT
 foGC/BEk6IzplrS+rY1fbxpsxHR+EuQZGBi6i1OZKULaqz06rrS6XHzFg1M7JDfYysuU
 QDkr0oqqUVf0tgy2jkTlKknGLfFKzl2sn7odrQU+PBVviP4BZZMSzUlEuJ8+m/EbPZr0
 T7/cOz04SAxABY711JIWDktGVVE2Vu1TiGBS9f6onJt2pRWI2ZMgJMQQ4sfEDGd9FlpY
 j3k3teix1aNThQZRip+RcR7Ead/3Hj71BEMcUp+UWJn+X4yWIGUPIhTivMvUAzrDbPlz
 fmkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmensfTgQrNLIlBotu5t2kvkOATyKQfrFb2Gn69xHdsApKcQ+lALWh8LtGzinUHzXZoshBk7V6ldg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxXj9rRqKdnZQblbbWlJmkv6L4wF2XM3Qc4yjBeroNz/aV9muS
 7RIKXgZditQ3toL/9UfWILZ31NpDv6dk231Fbcqe/94W17SMHG8MPkLqql0aO7i0MSkM35WvAhw
 KCFwKGkvfvjPyKrqQsBXZPO5PtQ6pS0sx2obRmJ0ibkGVnmZaRaOXpXSCI6jmEPRGATCLoMo=
X-Gm-Gg: ASbGncsh5fwG8T7A6IxgrPQEk6G1QaEVYqG1/T9aePMoB+ncobBh2oki8jdzMktq0N0
 q5JILQSIJFZpGAWFEKy7OgdsnVWTyiGx8+ytBvxAyXyRmzMEWkIHkJicv6RUXGIeKoFzq5pdxUr
 hN+vPi2L2hwvNSxrUjcT+h8dlErX5O3Q2UCsjjBJvwxkgzcCvmIidx1a2doi/g4ufqzhXy+3Z9g
 +9mjCiEIOZQ0VjXIq6CA06sDMNz3KsZQsQciiGUeZqgmYumNaYAEDacoYCmifsfTuTuNK8uS10l
 hYuo7T3c6BbXtWwoWykCLppwCPhhUoAXBJe2KMlQWdbAnqCcHFZVwvsgWskGCLLH7Qun7SNlcao
 txXnS84aNdqAw13pZqXZZxhFkLRqbn9G8YrPg0ZgKSIxqTQAQSF3OblKtKJm4p/4TKgpBnqQy82
 /cyrM2pU++8Ow=
X-Received: by 2002:a05:622a:1a0b:b0:4b9:6bbf:7073 with SMTP id
 d75a77b69052e-4e89d35ad07mr19782671cf.53.1760645370003; 
 Thu, 16 Oct 2025 13:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Mk36Krk90BdLrHtrtotYSVU1GazaMBECY7mZhgRjNDVhbGp7eXIDACXM51k42VjlHR9fwQ==
X-Received: by 2002:a05:622a:1a0b:b0:4b9:6bbf:7073 with SMTP id
 d75a77b69052e-4e89d35ad07mr19782251cf.53.1760645369580; 
 Thu, 16 Oct 2025 13:09:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881f91aasm7364503e87.38.2025.10.16.13.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:09:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:09:27 +0300
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
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] arm64: dts: qcom: sdm845-oneplus-fajita:
 Compatible describing both DDIC and panel
Message-ID: <o4oe3bjrnzthgwomy4y6r6swtzkylerimtgir55fgpvhjbrlgb@4hvemz3q4ho4>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-3-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-3-ce0f3566b903@ixit.cz>
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f150fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=J8i-PDvN9eMQhD4ShqMA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX8I4z+C61JAYj
 Za9CA2vmSIAO9tkLkb6CbZIO8tXyTMTIF89V7gxGK4EhTieLFlp+oLLrhOOYxrtIlOQtopaml26
 sr1BqT/lqWXK8JZQekEWE61l+xCG8/i6pLACkQMtXmpDg1K9ctzUUREr8GpmrP5UW5z50A0U3V6
 kiOgBnyigFb+l+kYCXyuf9r1G2/jQeRFv/rV4VE3MSCDmtez+BAMD5nHq+LZBbudTpd+XNdjxBy
 EUig4S5nuhALI+U6ssoARaDQztNEpHtxDj/0ymMLS5smFX3yxFzC1JCPib2eUsTlpuPQPROaNOC
 7xAwG/KhXKfI2ZDhJL9GK49yWMgHE+TMKBtf2YZG2lbaIrjy0eLWBlE0W0TgjSs2Gq6/mzWEuAT
 AwDYN15HFVcAFrAOqP19fe9tHqIVDQ==
X-Proofpoint-ORIG-GUID: xHNiC9Be_qs3NSv-i3sV0NLKbBvYA9AF
X-Proofpoint-GUID: xHNiC9Be_qs3NSv-i3sV0NLKbBvYA9AF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017
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

On Thu, Oct 16, 2025 at 06:16:58PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Compatible should precisely describe the hardware used.
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMS641RW), which we have no way to detect.

I think this should be squashed into the previous commit.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 7e75decfda052..d6cd873aef0de 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -32,7 +32,7 @@ battery: battery {
>  &display_panel {
>  	status = "okay";
>  
> -	compatible = "samsung,s6e3fc2x01";
> +	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
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
