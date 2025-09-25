Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209CBA16E7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 22:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A5310E114;
	Thu, 25 Sep 2025 20:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXUzJHpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38C210E114
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 20:51:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnQw000846
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 20:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B1RTyPEbqMfs/M5EeZCCAWjw
 5x88kEh2vuNN32oz2GY=; b=FXUzJHpYu348w/mgaXf8/0uvnYFcbJEqSliTBTPt
 zTGCstM0WZVIM7M8GrsGavu+lwOCgZ/RF0wpVXNtVOT5x+r7/DEdr71Par6LH1Gh
 wKnwwtqE6YlVQ5A2LBbUaivNBJ/RMNq03Cn7ci2B/wK092g/UovboP903xs4Du+r
 K1v6KOiz0OvuvGVoYoHHTwiHSXjUU4VDbmTFSHTAihcks3Ly9BR4Yu2ksZ+SPp0v
 vrXw7MMUHizrjugYAkjEyWVBsYldc91QbYbqYPE5JyTayRa3fESYAyTzpz60J/xy
 rNFin6fnuwYKPWnqaWk+ml3DbqIl5q90wFYbde4byiqMIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0trbr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 20:51:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dd6887656cso1290601cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758833512; x=1759438312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1RTyPEbqMfs/M5EeZCCAWjw5x88kEh2vuNN32oz2GY=;
 b=FPymXBIj3C2Sh7xZpYbqHpbKNuUBppHP3CXS6lsPrGRV+XVUoFlJeztBEStWRNKwKh
 oE2kzdBnScYhKFb8WNlw0bZCmnMN79/NScKXvXbJf/JBFKdB3SS6FYaPuzAdQtsIlQHN
 VpmZ2sWTBxLfYhNQ7vjF3Jkfoh8P0Lo9qQcxXezBDTFWPnzyiz/gbEmska0HfBztKzj+
 eAalxdPAAzKE35lhwB21S+NreqYQxN5vqfnTx4PZCB0iEGCUZQCgRqc369QmzGWfJtUs
 cWTiNwJXH3Ppv1e/jgiIqgyhYNQ55lxQs3NpjcVBqbqELH5L5hU2ZVuklPv2GpnZPpQl
 OEYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpTQWxthDJncGsQlgPeLaXpR6eXesHjiZtoK6tRsEGeLzgL66N9yS6/LiKyGRa7LqOdNPVDG61OU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsfS0DTLDq67v17oqGokYnpwMu+UVgVO7GkdO3pxmAzpuDXLas
 B4R/ubvJkC4dPeWE0F0lm1f5a7E6w63IHtNAH8VSiooznB5AqUKd9PaRK0xHLgDFRDkuRRqJCZu
 23KlLH3bbuK5JniHzsfAfpdnWb5wAzBH90CP45fNiHUV4jhbOVDqiHE6PvZ7pgBpJnXaZ/nc=
X-Gm-Gg: ASbGncvJH3Ujj2AhVAL4G3tyhf2b6nHVY5rTyIxZw9RbaA65mmnwyxOUTQ6YtKvks37
 PBh9nPmyRSod10SbOszmG4pw1ZUfozc4QgC6HheOcnCi9lT0Byr8aY7+SJiRfskPZ1u58t9ud4L
 ixuxB+pH5LuE9cNaLIAiytPyAufPJMoNWgdkQuYgHjdkcuso9kGtec43mfqb7gJDPnwbmkhhBCf
 IX0I7Hy6MotFICFVPeAblYJeeBrcLCGeWqwJZJaiAO68zobBIW7u4gsJvpx+w0R/AhA4eDKTsgF
 DBxtOyO26ZROa43jtY9bcXezXQCDw96vh+8exqlZmbSN6ToP7AD8GtnVf8O89qvHy14IaUSpRje
 XVXk87f3gQSFuCt7W7qZL4pfXgNIfTuHkYO1PQq90hfa9C5vbHICD
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id
 d75a77b69052e-4da4cb59235mr61629761cf.58.1758833511678; 
 Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKR5yjoppC91j/VvrgzF8NVXXjanhDCZEwgkr9/7TQbyr8UNZPPV3fhtTNkrc+EffTq5DWqw==
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id
 d75a77b69052e-4da4cb59235mr61629311cf.58.1758833511042; 
 Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a31e48sm1076929e87.110.2025.09.25.13.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:51:48 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:51:47 +0300
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
Subject: Re: [PATCH 2/8] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Message-ID: <mdgdqm4qurstamxyt4nvkrabf2k57sf6so7qp7plmhtpqh4qtk@vohj4ofwhyt7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d5ab68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RREAxZkodCCEBgaENwQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6FvH-S8x9RUXMZxv-ECt2HZ74-8b9d-F
X-Proofpoint-ORIG-GUID: 6FvH-S8x9RUXMZxv-ECt2HZ74-8b9d-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+RtKxAs9xYWC
 /boF1EpoBYd0IG6pzs0e0uZILUG03M4vGhKJnL64aPfLgNykM6G0m+iOsBQXixaDubIi0Ivlu8L
 AiQG9neigtwg49K51b3kdP+KGS4MhBokkO+xRjxaec9qbWlxdm8N2ywtEKo8re4SrK7pASO9tN6
 9Tuj9+Gdf412QAU8s0RrapYWJDE2U8x/BV+71gqis4WQi3r8BsSAEFrzv7OV69luTNIRa3C9rpo
 OZNyxImh23kYjzGrKCvvEZ5yPEQAFc7DEGFKKzd0f4foxX88GBwbg7rlCG3Qkpli7tMCfg2In87
 QW8nrnS9QFpS6FdLeej3uEudB6ZjWZkmfRsmsZ8lwH2vctCb4imhuIu6DVeVcj7+hPCkUPc7j1s
 qh7vOwCYE/NARO3qM99aFUwaPvsFsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 11:12:48AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow up commit introduce the proper device tree definition for the DDIC.

And the reason being?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 9b92a05791ccf99061ab7a1e01937bb832a96fe6..6c1249a224c8a170b33fd3f331f985f16914cb2c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -56,8 +56,6 @@ properties:
>        - panasonic,vvx10f034n00
>          # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
>        - samsung,s6e3fa7-ams559nk06
> -        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
> -      - samsung,s6e3fc2x01
>          # Samsung sofef00 1080x2280 AMOLED panel
>        - samsung,sofef00
>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
