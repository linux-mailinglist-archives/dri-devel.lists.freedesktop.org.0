Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A2B51BFD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E80F10E954;
	Wed, 10 Sep 2025 15:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzxcu9mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91F10E954
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:40:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgMAg011451
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pN4pFZtmgQrocgR3Dr7GVghq
 e/kLxGp7oEbuGlqoA2w=; b=Gzxcu9mFU7vszs5KdS1iPcesfAQcSQBrPkJQ+gzz
 ViLrnjgDYlrurs2dljz5lIRdfPMicFAjxliLXy4Lapb5gx8RASb0GbWEFuUuZgiY
 8bApGWGn9TiD+vhYiGIYYSWgupctEyhaN5qZrqVk6KYgNpnS2/Wnn8taaVNDYiJA
 DZWdlM6i3Pak8KMA/GJWsFh2MkWjpClUFOQecmyShkRp8Dv2ih6HuR+gO9rDkVh4
 hqc3AzmVwbOsB72drkgd0VtzQtmUe/7tHf89bUHyWJrYVJihfPhMD0hT7sXKCaUh
 W9r59ToeVT5YuxUXWw1znLKuWhZGzbnjP1BEUHbPA9426A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0v9e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:40:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-728f554de59so206840636d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757518834; x=1758123634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pN4pFZtmgQrocgR3Dr7GVghqe/kLxGp7oEbuGlqoA2w=;
 b=w5HYMj3iry9N8NjO4EB1ihYC7RyA2iJ7vNLqfB3rPi8ztnzTx3A7jV6ZzAYj9QBz00
 Ub9dNSBNKLFUJP7xnkqa2c+et82ZHUDCoIDMLiQj0DxQB8uLwvBB4kza53ZoxpHV4xUG
 8gNBgeGkWXo+8V7d8VUZ8fvenjDR6cT5fItZFT6EK8suUwVtmuMlXveQsYF8t1umsLnf
 0SabXy/1wd5HCieATXIWAxlF64C1jHJcmVnzRJ16dDIKC4qnQyCUyUu8/U4DEnRGtx0N
 sB2TahHDweOzoO7fuXezrkblbVHqpztjfr3OZddkCJhj1RQZjZX06Xj3GJ9FhLKELBWO
 RHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXByvoigSGPWfDeP4GsaSZnJNyuPXAULGJmjIwK17yFX/dMruf/rpx1cN13S/PFOzWZmFG7f1E0eaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpFLocKikQrxcJoVLg0J7+Po9npKrwV9hkFi38NnjiaWi5xxZS
 M87/LJwIN/6QIIH+LLCGU8YZKU/V1WYPmWrdmKKIAk3irSFbX0Aov8zcRH03iZtJqZ7y8Xp9C2q
 wRyzxukaYfXbDfv5iHDSaqkA5Fy8pgjyhgthRD6QXK5qGLW9rAImjsnNLQ1Uc11kJ6KS6Nd4=
X-Gm-Gg: ASbGncst75YtU1UYJoOAvrmf26BnXzRwULHN0gTpiWqr3Gkle+/5vD9rVJBZQbSjPYG
 WKxiJsjfqC12pb2YB2usO1Itr/q8f1f+PP7r/mVxdl6mkjTar1JiCKa4fPyUb6wp9gug42Gy0jB
 QMtgnKTOUvNAemkHGtZmNGfDZWn5P5UuAfO8q8qI+EyK/jcfL9r9oLDj0+kXXK26sJUw1o7rP0y
 BkvzE3HnrEepfbk1oydw/KFcTOLQ4Pbu8W3Pnk2yJ2frnEAO38SBMfH5wDXfH+UoYhUfuwj0AUd
 bsRtkhcVtfgKF11Rfi5mXjNSo2MiAYSsPuzq/cD1E/pFitdY90wMggHgbbl60fs91tKN/YtM7FF
 8DxsHd5TbtYVofKM3SbuO2jyHUFF9ft4wPWYAU+ehpVcw1ndTU00d
X-Received: by 2002:a05:6214:f28:b0:75c:3592:8c9f with SMTP id
 6a1803df08f44-75c35deda13mr49159566d6.2.1757518833936; 
 Wed, 10 Sep 2025 08:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF905L8VrU+MKuXIRfhtvAkXP6gqp4CpnfFHzrpoC1as4rJ6TJsh3mY1ibNxJn0xDJi+fHWeg==
X-Received: by 2002:a05:6214:f28:b0:75c:3592:8c9f with SMTP id
 6a1803df08f44-75c35deda13mr49158976d6.2.1757518833265; 
 Wed, 10 Sep 2025 08:40:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56818445507sm1319770e87.109.2025.09.10.08.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 08:40:32 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:40:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: bridge: lt9211c: Add bindings
Message-ID: <5ngac5vcgo6duvfalnplagh5f6eqsxbittntmltzer3kj2vkrl@o2fxfiudcj3h>
References: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
 <df3067e4-5597-4557-b61f-26afb7d731d2@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df3067e4-5597-4557-b61f-26afb7d731d2@mailbox.org>
X-Proofpoint-ORIG-GUID: 1hYgGZXuZUm2_cdWTXnal_jjtl-JYKON
X-Proofpoint-GUID: 1hYgGZXuZUm2_cdWTXnal_jjtl-JYKON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX05HwpR8UyMwa
 GZltsz50ODLCBmj/Fkt74RiuBNU60Q4e/74DZEB5SfNWcayo5eIvY/Gt90+COjoPSOxOAKOSeFC
 UJlSdixCRqQCTQmMHPBGP8ZWbV6ScJiuFG9ddLnOnjocE007N/H9Qac6r4H9VfFkaE1uo7uijfa
 BM4hgP3OAlfDhxyTqI+WKa8bgH2EomRULeY8u8q6IhkMAIwlwykvzTZ4BImpnfQ9UjDeYr/v2va
 2RNaQiOIqDNR5bV78mxGseVT4RrCu/H5PeC0h+5XRp54yBhVwyN7Phu8DPPNm69e8Xi83CvAECG
 TTpbfNQazoRSPskGFlm5eZr8L8O3lD+WNt5LDA73iME7nLdovnCXmi0PYsFrocATrBwtVutNiMZ
 vWGuO0VQ
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c19bf3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Keg3OKSH5Pxz4YLYaiEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Wed, Sep 10, 2025 at 12:18:41PM +0200, Marek Vasut wrote:
> On 9/10/25 9:37 AM, Nilesh Laad wrote:
> > From: Yi Zhang <zhanyi@qti.qualcomm.com>
> > 
> > Add bindings for lt9211c.
> > 
> > Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> > Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> > ---
> >   .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++++++++
> >   1 file changed, 113 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
> Can you extend
> Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml instead
> ?
> 
> How does this chip differ from lt9211 ?

And more importantly, do we need a separate driver for the chip or can
it be handled by the existing one?


-- 
With best wishes
Dmitry
