Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4DB127ED
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E38710E45C;
	Sat, 26 Jul 2025 00:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShqQ6KY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D542010E45C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJFwiT018836
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Wc7wbesunn622E6lhLM0ZKBY
 dN3sWZP6DO3RHiTM7ok=; b=ShqQ6KY+EvXQdv+pJtp207j/oBCI6PI91JG+xF4K
 ENbUXrQUsRqAImbFnEwjKPynhDig8hIXtaqX0Dsu9OWjF0Qg8waVyefba1Uje4Di
 VN55T/vSLEfn6JkUM3LcMG9BlQuIpotnjVBTiaKe86e5Q8JAJ2zxwZ5n1yuHfyvS
 pUSrAnAYTobW88AWgrAkeh9zycMsi7Nm6W25wPprgLQ15uHBXVGnKA3o47zFrcCf
 Bq+RKgMEz2qaN9SJZZaLxrbGM2H1xEoiGX+NrqlwMUD8WafEgrklNZiUR1fGknOh
 PpGRPXoSvX8BqZ6VO3oOc9xnZPO3oI4l8Wh8vlVFJFTmZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s3rf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fab979413fso48796106d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753488922; x=1754093722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wc7wbesunn622E6lhLM0ZKBYdN3sWZP6DO3RHiTM7ok=;
 b=jdmbHpAeOceb2ktPzUeNiicq1C7xPJui/WOQR512n9Ynn5NOg9A4zVuRAeZE7ZxEAb
 MM6Lqwa50EIhC5adWYNzBRbFB0/4RIZ3sGJykLKcinAzOSbmmFyjRaYjY18uuPbyvtfL
 zoy81C4PG+GSlU1ZXpE5P5AUo9jSBWrEJsHSYholfK6pF+UXSLiuwGApmz3t9C3pv4pi
 xaqfwOczwDF8wmf3SA8NcMeiUz+LkHLKpDZKhXrS8kJV018apQrmGX8f9444t1Smjr2K
 sLrkCbXO4G2sHt59Pf22ioi0URw2WOyHWhpygtqhqldKJqw7YM/kwSHYzZrhj5HO2LAq
 6MGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0NVE59b4ZX+DteRJXDNBB7bhaREivoWXJfNGVsV5AkXjPiRSRpNqKNJbuF4x3Zp+LdkuE2fOQ8hQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpQWI0ukU9jl2l7swQQp7FUlVwPnCNkzCjaiwbp4V+MF4ycSOF
 Cf/wg2TTYF+pu8c9icA8ns0lQ8WsB800vjrbJKSfuZh14BcwjYaQ9fPb4UYu2I+hMi42yILzgly
 1LvbkFidO/Xcyylq75v8HIaB9Fy6ZXPQpxCvwQv3xIobjen7DaSDpCRxmVPeRCx7NYMt5DM8=
X-Gm-Gg: ASbGncvpGlFPHe5dmDIbR9P3gjGXv4SqFuL0zgWf9UsGr7Cr52ulciYPKeJpX3dZ3W8
 x22dfZO+ly9s29hbBC3TDj10WvBR/NyK/YzHV8/FxUnFP5Hqvu68MjtzjymksCAFpivUOqJzA6f
 ojWtyB0kSY0rBEQQoeAcUjFVdxvvn0wTTdVrZ8VO69aJeR8QS2b5SVOzkvoExbiRW4r2USFzKwD
 uJLOP6csqgs8tj+BsbaF5EGCq3zqutKJ97Exq04KmT4LLi63ZJi71Z4BJTEcqD3EEaIhccG9/fK
 e7T0IdgapC+sVsCzl5i2YsvD1mN93FQRu1rGx5EW2pbJKtcV9j7r9H0tegV8/cVhGJWcD0TpJlK
 8meLQ9vTEdwfBfOIO8beCb9AvQl04u/PcPoWry+aWv7MezBFNsoTc
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id
 6a1803df08f44-7072053c3b5mr42704346d6.15.1753488922022; 
 Fri, 25 Jul 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKX4spzgAgy045riATOyKNu99U7axrHMs7Vy4UMZ91CFAU7dGAREfsaxr4wy+fd4nCMcT2A==
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id
 6a1803df08f44-7072053c3b5mr42704086d6.15.1753488921541; 
 Fri, 25 Jul 2025 17:15:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f427c501sm2101441fa.77.2025.07.25.17.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 17:15:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
Message-ID: <kmgosc2oboburyxrk6drvfghqg3eo3z7pbeywlui523aoqyuqv@uyog5cv2ijq3>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-5-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: -pMYRwNK9p6KHqydjtTeOfJBe1GYaTuO
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68841e1a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Ui6KuL_mdHivunMvz7MA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: -pMYRwNK9p6KHqydjtTeOfJBe1GYaTuO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX1RqKWYJ80qPD
 2CuNjLvnTLTqhbFQowDnTTlhBnb2Z4pxy4/UrhpwoV0ZNuMhrqcsKEEcNRGt+SzY+YLojaES8lB
 WCllkhBm6YWOCHtO661g2Y0pOVP8i/CmxjXamczACJrZ+ml7HMwhoQE8W7iX1BQArkpGRGmHUYm
 Rnnll9BB8+ihiFa6HIlvy0zn7cE7SUpxdLsOvPPp4mGVvLkwc93x5VlDOPWw+d0cMGUVFHxlCqb
 kKEh/qu0TJUZ27msRghmBiQXviQ74hi4MH8qTEVXM6Fiyn7nLdWVDXllSrzB8Rxj5GOPuRiHHve
 K0/OCoZ6HwHBTh24nuCYUrNq9362bfgHZ5+qoeY5sjo2FA/+/s5ExbJX+dAxz0rHVFfHf+vtIs5
 KLwhX7qNxEZ9TOanBW4CT9woVEz04F7K9N0buvygbTv1ZFZeCMAfWaWHm/9Q2+pYyz38DVYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250208
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

On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
> In order to move the parnel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *bridge to platform
> data struct analogix_dp_plat_data.
> 
> The movemenet makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
