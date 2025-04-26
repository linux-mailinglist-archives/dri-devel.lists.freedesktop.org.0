Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AC6A9D764
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 05:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED2610E1AA;
	Sat, 26 Apr 2025 03:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Goc9kAwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548610E1B3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:32:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q29aca026741
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nfyu09oAgbKU/gPLd7QP+1Vk
 Px4Un+ZA36LVdMk4Ac8=; b=Goc9kAwOH6IG8xnEE/6to01Am56ENAyC5Pna4zcU
 pyp4N8Sa9DbECkuRNTyRZi9lSdmd/K8ddWD/TGF+Z5Bu3tY1yw9gN0QwYjkGc5Ke
 fjqAHpd0MIMAqUH2BmCgprEdPGoO6+C5TVtaaMfoFp8tgVFDxRyy+pBp2JpJGcEM
 K2rwR9FZdVkLf1kqAfbDiSolOvIGOjlnhB2S5naDlypqwjF8uKqPZ4woU3lAcDtV
 7eb1+aSVX+X2mum2cQrGCMQ5osCa1ipdfS99FqYQSPWP0r8V2sm7cG4tdt7f4Yy5
 6Iz0hoYZG+vGDGGvE3isImRh+FyrWzdX3ve2upW5TocQyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pev83tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 03:32:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c92425a8b1so487794985a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 20:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745638332; x=1746243132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfyu09oAgbKU/gPLd7QP+1VkPx4Un+ZA36LVdMk4Ac8=;
 b=KYXnIraZp5g6cVIzi8hvxXvd0MXeNlCvUyfs9/UCfb20fGncTFAltsv84WrnbO3L4a
 y8z/e21BhJs262aDIwQarP86z8G3iCSGEZ+qVgtAtJKZXZgvIomusa4Xahk8tqwW71cl
 Gf5oFxbaG9v2NpjGCl+6nMvLk1jDjzx+d2OdkvmZyhZc7EBR6OBFkEB7PWwyVu0KNhrv
 BHGNenl9M3ckAU8fYzevhVvKItGaGuakxLEY9ea6haw8phpMYIsial2/N8/clD1JeHh3
 xHdla0mBhOk8w+8NAgm00ABiWGfsXxp66Cm3rgN5V9QSSc1GGVBl79sKh/vq2T7Q5Gan
 xHeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NQhE8ZPzEIASL/9wNhpQq0Sn5VMAPa+JI4UKmAXuPn/Q8YaNljjY08dROhi96nwoMJ9b+LdJO3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpZSoRL655Q2Qtg7Pr3A7/QR0yoJXwHaV0U1GbKHGBLUL6ub1k
 rX4MNJTzgEYCf9xFYUs8jcykDhhwP9s1BhRN9Qh06SE6P8CQy7E716mWji+OooNrQPMVle2w/DR
 kNL3T83zTVSAZbjfl/YktLA4+vpk23w3FAooU1ChaJZwKR4WuPj48hl2d+I+yiIiQHj8=
X-Gm-Gg: ASbGncvFkaDXtSMalFtfFrr0ZLTLZiPUy36qP1HolN/V+3iWtNcPUky3lTAahLVRE0h
 edGQktkzxLvRYIxX2+glQukoPBS62xatzwNHx2OvN3os6y+V4kz4l7Lz5EUB5U+kGpTc1owVC1Z
 GEF78RUKOXZwMVK78YZEw8rT3MYvIfjvnQRDNKt7oGS+GN1eNH/Q0LnylAHX6Hi0+3nOUlZFyre
 X9lC5oP5adzAJZDUDAy6hUxR4OOzKIZVx4+vwKfKzyPGaY8fUTuuP3gMUOYHXkdVoAO5GC481aM
 GAsU2fD8aZujxDPqaZr6JOEncyEeL1QjFivVfsM2kQDJrd9CF6UWqbIlUmZ0WVOvHatY5WDCnZ4
 =
X-Received: by 2002:a05:620a:178d:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c95863e2d7mr1476437885a.18.1745638331926; 
 Fri, 25 Apr 2025 20:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiTnE7wXw/WRNe23TRP1vjz1M9fZlD6Qm9ywGKrXzfBKiN5UhJ9CjhuBM5F1+rwA5kWV/r5A==
X-Received: by 2002:a05:620a:178d:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c95863e2d7mr1476435885a.18.1745638331608; 
 Fri, 25 Apr 2025 20:32:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b96d45sm10174911fa.94.2025.04.25.20.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 20:32:10 -0700 (PDT)
Date: Sat, 26 Apr 2025 06:32:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 5/5] drm: panel: Add Saef SFTO340XC LCD panel
Message-ID: <oqmzruuepddldz52kggo7f3ndtzb36y5ztlu4gnmrnbcljqizi@fj2tafsi6umo>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-5-ff7da6192df2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-5-ff7da6192df2@bootlin.com>
X-Proofpoint-ORIG-GUID: n_mrh4tHtOtBaJN1hmDAiw8oDNz7EC5D
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680c53bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=l5tW5kQ7p0p1HK_25oUA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: n_mrh4tHtOtBaJN1hmDAiw8oDNz7EC5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX861EvgMguuwA
 T8Xy6Md0iuYJPax53F5ri532A5m3Yv25jmNJlcwX73E3sh4uSKU7NS2U1My5ndB0xnrtt3rI/rR
 7H91z83/2S7BjpwIddc+4E/8Ziy0HixJWM71OjN4xmryAhIwyHAHro9QNuubvb3d6sAjHGwvQRO
 dVYc5gexkigRgr1cZ5WtqBBzDm+cZHJwFYSet3xgnjweWvEsXQcYTRFzmB/GvQHBboDkm3Pcgfh
 mEGDsjZ2TO4ZnDDLL1/ZCitCG3aihvE9qhnUJZx2h4PwBSaSRLtJUUOfqBPrUHxX56RwTymdIpk
 /79sn+tDbeKE2RVUHf8WiAAKqu2NslsaFzy7T9jPeySLzAqZxTYRw7En8E5QvhG0Jh/BRJOHPby
 DpR6AipOcwMdkoTi+GlEn55ygR/6r4dE85c0QseUpEQ65hn/TVXNW9281f1nQRTnkX+R4EyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=779 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
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

On Thu, Apr 24, 2025 at 05:07:43PM +0200, Kory Maincent wrote:
> Add support for Saef Technology Limited SFTO340XC LCD panel.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 232 ++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
