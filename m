Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56DAC2B76
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 23:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2210E175;
	Fri, 23 May 2025 21:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnPppKdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3811910E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:43:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFe1Hp014592
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=; b=nnPppKdCeEdY/aTT
 gObDXhuTLh6YVJWaP+otBQmd9IyrT5JDAuLQw4AATwIcQnAyK4aqbcTZZLDU+ptg
 zHK5unRflPwBDMFaqjtUSsxAPdhbMEgRR63lQjKt0wDwsHhX2ZZTVok5KtPuDm/B
 Gqs2faL/o3bOZpUP7ZbBTHbwDPDx+Imb41at8U1PkC4OHNfmIU6Ga0/OJjQL4l5A
 ktfYgXe4HsQrOYxaicQYG+PW8adXCn3Wea1XwxDjZH+Gx34CUXENwREVOERKdGvF
 Rqt+VTZpJCaGdudCQXuv0X5JdyNN4CXpJyP6zm9UJBjPaTCB8emUVG4Lar19llVd
 IcHmZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4bbf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:43:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c8a36d8eso4666546d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748036591; x=1748641391;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=;
 b=ZdvKpo7jif/xW+CDS8uqUE2Zfl4VEtFC+GrcSu4AMykYS7zhgAjI4YzE2KYsGvyDPk
 uJSKok78zcXoK8Upg6TDvd5He0AlDU9YkyoUP5YmU8VkjhSHrVM5+YsyOWdgY9chB0vo
 L4Xj12uefU073AWg184dN8o5uGyoAVhvb3liG9IXlGC7KK1EjQ/JCOyDGxH24mklu7oS
 4TcxLhbw9WRc4OkMD9LzdRk9IevWwqVM+hpJi3/UpwNcrucXdttRhSdXuE4xLAH1Olb3
 edcqG8p64cLb49w0OXyYaxvMIx28txIuzaFWfxTm86vXK7CAyxlFIUY+3q7HBADGg6g+
 ZbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaCVLQu6BhV/g7WksQAKwckPVu9zXBeHtzZ/dIYedltz4RLi9gEnlNn1dT3C/c4Ude6V3s/Qy9Egg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4BJCqgdYyJ8AS37kSLtBqybuMgstOgmhq7S2Qqrfn7obbBYq8
 aFzq/81iCybSd9HxNVGf/Oi03BmJLrBW1EOegRNU4ACZWBo5ymRJ/6s8DzvALw8UmpOTQcXYcxH
 Q3TNMQygqeZiMqwb32k3PqXoCP/UEvE98VMKv8+Zly3FvSmc/WPg59rwlpiRhDEYDOGuvnxk=
X-Gm-Gg: ASbGnctJ1gr1n+LceYzd9iI8iSDRGMSz8asjWqgHdtZDHIRPbBik06qPQZLYlJqg+Hu
 mvyLOGrJJoRnC10SI/QedwmZA5J/sVB4RS1D92J12TTVLmBYboJHZUmPj7lyTefxSj1EFNu4dtG
 7oa5+E/nZYcOO3F2HWoCD1i5DdwmUcsVMwhFA+40rYrGaAugaNpbXbZ2q0vIIuxPNCbLdBsaKGR
 eQN7lcV8DSBpG/cf2tGdE7hRuuFJGskMBbRLZtAS5bGjE4Bmq1BRP81hQQv9uGq8nxUJo2AWt1Q
 BF1h+DPMU6HR/x5t5RRcFkK04Xo4VnJ4BQ98b8Dv8FUV6EWCwT54opGqFhknrXZb8VXNONZat4R
 T5l1If8aRgGqgZmpBJkuT3dXK
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id
 6a1803df08f44-6fa9d16bd31mr20049156d6.23.1748036591299; 
 Fri, 23 May 2025 14:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsIyi1DNeSV0ltsvQnqAPemiYB/XrfAMLNhKLi7K1DXufTbnvw9fGiXj1zZXip7xUmJkWnbA==
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id
 6a1803df08f44-6fa9d16bd31mr20048706d6.23.1748036590929; 
 Fri, 23 May 2025 14:43:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7018349sm4016945e87.142.2025.05.23.14.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 14:43:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <aDCdn9r_ZAUTRpWn@stanley.mountain>
References: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Subject: Re: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in
 probe()
Message-Id: <174803658983.3675779.2609702556913509168.b4-ty@oss.qualcomm.com>
Date: Sat, 24 May 2025 00:43:09 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OCBTYWx0ZWRfX+IUsESIVIYiV
 fOTr/tf/VpO8pvgcdEUaabXBJbivZKeQEB2tpy68F9Y7rG43jLogjYv2LX1IYCDQV2e0YMN97rV
 I+iN4iKVpkWeH18gqr9Tcl0c7b0Te5Es1hdRTp0bmpmiPmDrvbckj8VbHyh8lkDsc9KifAazlKy
 dDhloGs+OHk594aSh8A1SPyfAbn1Gt/+loW8FFss6VLlVCyBTFeTMK9RKUtAlMP+PmlGpSfGXeo
 5RqOmgvS2lKRPBn63qVXSazKLK+u4FBFrLlN/EwMVM0+IpKG4Ty0qrAhTKNFc9devQwi4H0+Uvr
 MKL/dKa4mj1bG3hT2G2XdTBRAmkGh7g9ccUCXBdc1++AjX7MbTp2xwSGhzuylNqFNgcJSfKmo0b
 nktL2FtO7S9IyOwqdr5CcJogxteAKlUtHwzlAFdfU5Vy4wu544Oih8XTQRkF7fmxkVb+jRxi
X-Proofpoint-GUID: tbtXFKKDYg8kyj6ozMBI9izu5O9bxhOA
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830ebf0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=cxelKPMm3W1_tlv-AlEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tbtXFKKDYg8kyj6ozMBI9izu5O9bxhOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230198
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

On Fri, 23 May 2025 19:09:03 +0300, Dan Carpenter wrote:
> The devm_drm_panel_alloc() function returns error pointers, it doesn't
> return NULL.  Update the check to match.
> 
> 

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()
      commit: 4673dec88da803fa23f1af9e04761683a30dd6aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

