Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA62BAE8BC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1771710E629;
	Tue, 30 Sep 2025 20:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOGafGbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD010E629
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:32:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBgdF3009556
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aQIv8HbSGU/ItL07DFk6fn1p
 HIrebqBCTmh7KKahI5w=; b=cOGafGbMemrEy2Yp9eUfawzJXf6Q3VhICbNjmOkF
 ZQlv89/gJcQ7aiAnGhnt7WtH9I94mOdfDhXrfWQ7cYlIKq8ZwyhqFIEP7gxNScp+
 HKS1hy/sLSced/c5RpJZFqqrGC/XYZ0lcT6/CYa5dktC2CdtUeLXlnMATvI+iqKG
 7a/vhWiA+zZuxZU/vUq+EP6h2Py0g/SttYNjLwE95YkMubbYblZz3b11AuSF2bdm
 gVPCIpzCK6b9PyUK/v9b0XNC0L8tbhuo81DoZb85/IJVoNsainh6NwDE9gJi6dp6
 /+mr7+cL+r5c6nDDV2XPfMl+/jyVqfLWLlRceevEMNtY/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977t53p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:32:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d7f90350f3so6000651cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759264345; x=1759869145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQIv8HbSGU/ItL07DFk6fn1pHIrebqBCTmh7KKahI5w=;
 b=rZK/oWzrQ6v0gBri/jordI/U6htzwnI4X8tHg4DeckFFiQGe4eUwe4fvEfgtc+NCnd
 Q6OAJr+WRfr82ExAUYfAvW7PA+Ln8TJmIO0Q0dBjopgCuHTYZ4umywI4Om+V9vJUvyC8
 FL6oA66JeoepVDGmwRvnee50pFP3bnhuucaY3MLwyY4iO0stl/2M3XPBoaa8J4JbVu5v
 UYzkx2V0DAKocNAwc4LFMrd8nqdecT5VjU13WKFUj+UCwfNJZoScG9pcOT2sIgAfXEUc
 XLKtFJ25coOwR2w0MlLVIT2J2KRFplJZiWRHJRLixVnvwOX9JOn6MEMEhuLJQy8MSvYz
 v0VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8ORx7UsHCfxnNdH3y0/Otpj2WUhUfrD16mF//TIgfvUJHyHF2d6vTyNWre4fw2SsAwLdZ4DaE5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9ag1/SUCnowk1TDWJEPqq6LLZINhql5/0SVEX4e2qOH1BRwhz
 WetHGc8p8yTZF1N9A354qTiZjIbRX1i0kCJBffbK39Oajos2Sj4iqbqww3djE4ttb/wSkw8HQlA
 DMvhBrKz7cSCJ3LLEtFpqCbQzA1N36lCCah9Rwc8FpTFB3U+6U0yI+iwv7RfcjgPr1GHXdEk=
X-Gm-Gg: ASbGnctLgC2Y/3k5yCwRjJKM/Pizh+5ahJrL5FV4FQrmsnFEPXWmB0ygn0boWwPryIf
 GFNpOwoJPK4ZmB6lqNKumB9AfO1ntIbzulQRnEoa2sTM4ruAsmcefhYnpq19asHIfly3H8AAW5b
 kdRtLEz2vxHNMAwtm78323ilI/XFsilCviUSdQFGYjrfIgho7SVpQGROETd8BUvhaQALf+5+vuO
 ICMjPRWwAU8lq88PCztLTsdsoWmHn/mMZWsdGxIo5LFZQd08I7JSysyvJ5wVNzbdVLCbSxM3nji
 ZnKn4kymlyfXBj3Y6tFcrE2O8sxemW26dmtEaEWFn+VIrbTVIOVclFxi4zKbdhqUh06ENMWvX0A
 6jfH5GKkPsDcD1IVeblWIP93ozjAi9KYi3kJx7e7evz6jETNIjIMo/G+vow==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id
 d75a77b69052e-4e27d7c5f55mr67499101cf.4.1759264344562; 
 Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjMsa1KUO+Xb2y8JXrARVlbLY0nhFqxX54cw9WXubdWIf7Qf3oigc8c9WVQu/MUBv6yKFVYQ==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id
 d75a77b69052e-4e27d7c5f55mr67498601cf.4.1759264344072; 
 Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139fab10sm5324346e87.45.2025.09.30.13.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:32:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:32:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 16/18] drm/bridge: analogix_dp: Attach the next bridge
 in analogix_dp_bridge_attach()
Message-ID: <qqomsrix67lmx7rth7tg44bxjltw2d7s4dwojqd26duf45uf32@krpb756s6q6q>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-3-damon.ding@rock-chips.com>
X-Proofpoint-GUID: nR2VsdIDNRhr4KTL1aKKsiSQI7LhCY4g
X-Proofpoint-ORIG-GUID: nR2VsdIDNRhr4KTL1aKKsiSQI7LhCY4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXwLf6aDYB2Z9i
 0YxgyrBzH8CfK+VpMlwoLOy/As+OILjvD1vhwUYgd6y2ahKlHMOVZOCVBRuk7km7pK8MflHkOR8
 uXGdMtXAVNIOGzvGPA1MBl7Yy0VyCjWstjXocVoMNta3F6/bhmOAkqM1Eqn5GwAHbpUwlocI2Jo
 WSrqHx8J3dHP3Aq4RggAbSyHZpABYnvRCMttX4Sd0nAN4jg0XL6WaTJnSncCy8sDayzx5zNIw/m
 EfhidPUoSsh3Ixk3dScsJ66kP37SALp9uJvHMrjNUZjAu6gC3Q88EM22208dr8cXFlHo5YdewA5
 IEEyUj0drHLJaDEryfKGcG1yAfFpVPcZIW2dhsmIUhhh9B1Av8pMUEsZ/0TCPQu+yFymnRCrFyB
 wdPH8z6N1vD5Xs8qD1cXVddti3gwCg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dc3e5a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=z1Cm9R5qtz1vL6CzoToA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Tue, Sep 30, 2025 at 05:42:49PM +0800, Damon Ding wrote:
> Uniformly, move the next bridge attachment to the Analogix side
> rather than scattered on Rockchip and Exynos sides. It can also
> help get rid of the callback &analogix_dp_plat_data.attach() and
> make codes more concise.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Move the next bridge attachment to the Analogix side rather than
>   scattered on Rockchip and Exynos sides.
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
>  drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
>  include/drm/bridge/analogix_dp.h               |  1 -
>  3 files changed, 4 insertions(+), 22 deletions(-)
> 

So, here is the rest of the series. In-Reply-To header is different for
some reason.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
