Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC40AC2ECA
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 12:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481F310E205;
	Sat, 24 May 2025 10:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopsFuCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156A210E205
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:11:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O28t3a015121
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Q5Ywd8CbRuq6nVjt49lYrhT3
 U7K9EU94H7oOTbzR8PI=; b=jopsFuCM3uH7xTo+LmcRutvUrKk8LvTQ4RzCmBBT
 Wz5jsSkBvvtseKSNOO6c0U9M6h4usQhgyFrm/nO1UGodVGOJewNzKra9ndhGIno5
 CAffzgMWOo/aAFroUIbYMUgMbmHcekJ5RpylhFA+6h52rRgTDlK8mCzQwYJeuNOo
 ++Jo+R/Tl4eh+ypL45h/NOnWao13fq+N4phxwPUHWCTDqLOyf9gd6Lv76aHiSNkr
 /1TLAuvwwNh102RQmDTPq0zmK0Vg/dSLSipkZYZqdBmEtePHcxIVqrwnsfIE0mBX
 VCikBpu61ee2fhcSgW0Yl2xdirPWfnAUQm/KMw35xwgpXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52urkmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:11:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so11124326d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 03:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748081501; x=1748686301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5Ywd8CbRuq6nVjt49lYrhT3U7K9EU94H7oOTbzR8PI=;
 b=IBofSphS6cWEOXp61X8Aq7PPBdCUBJceSEy20T4siAzCs311RzzU6FGmJJAffLgZxz
 aKqkJx0elQQkSzxzWKIFawh3fol3I11Sa7jT49umq63/eAw2qIp/UR32uLb90AiAdojg
 rLuodsNwR+xY2b1eZDFcyeopNlF9MbcljUltdsLp35K1I1wEtAQ6J+FCCvXXCHhj+fU+
 OkxIMO1TX+aH+N/OSQbhPR4XQ3lu0L6f+Zx98HFX0p6frks31kW0P/znajIASF+IrtHQ
 1BSHbw2j+JIYaKYiR8XMpWPPYxKXdgzDlKZChdCIcFWLBZKth7NIxl75NPZ1yNky5dMc
 BLIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEeDYLm2DPg4WvaHzoxOLx8p1tJE764wZPnXZvF7YQ4xgmz9GZB4S94LAwjN8yur3LKR5N2Pq60Yc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFWEVxwPDS2KsPOfITWDdLM/rPjdp8N2GpWSL+6yucXphd4L0Q
 9+Sr7K+iYkJH3v7GYX6DnrN/eq1v+0zp11S0q52ZOXn025nbP5zyil/atj4QPY19dCD38e4dtXF
 Ez7Nx+gJOHrfJ9jFRPMKc/EqHOZmLUxvNw58e9SfOXQTEuG2oANGscyZGDt191kyFUWSycgk=
X-Gm-Gg: ASbGncs9L26NuPLYiOfaBdTAfb99dheNqYE/VsQioxUKaKd9SGqELRxuTaE43mX4Jqv
 CPZXJhyPS3zVdHnReYmS0f4LX9fzdZYlBKVaenCqEtfFlrYzFF8mHUrP7kHbUnAC1wUBIOj4JKW
 p6TvDgQmRomJa8tgJrH10Vm9nGx3WHupwXqPds6xwPJQ7bHCfnD4y71WRKUZ5uBUUi3s7pV6xm5
 knsZ3k83GrrFUOGD/AblN0xlzyNoS8QLcgoc6ei0ZDnCJ1rDIS/OpPkO2QI3L/pLUVZBbqa2qly
 qXm/lkz/yy7aea6d4TmbAjshgi5mSFiLhCnXnm2fN5XrOZFDupTftG0LSKpTMCRIEWzDBn3pv7o
 =
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id
 6a1803df08f44-6fa9cfea4dcmr46563626d6.4.1748081501060; 
 Sat, 24 May 2025 03:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3xlcfUJq8nA48ODJlNUBRaEf9+7/QJQDSqq3iA7gxZrJiVGayzAZZZ+Q6hrv/sh+JeoK21g==
X-Received: by 2002:a05:6214:240f:b0:6f8:c284:45c5 with SMTP id
 6a1803df08f44-6fa9cfea4dcmr46563106d6.4.1748081500681; 
 Sat, 24 May 2025 03:11:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084c8c78sm39724731fa.36.2025.05.24.03.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 03:11:39 -0700 (PDT)
Date: Sat, 24 May 2025 13:11:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
Message-ID: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5MiBTYWx0ZWRfX22jLoLzbINFc
 j1+S16K5uDS++5MEjxUpNPgDsFdeGmYDnDocRTMMijLJ+Zd6/Li42lO97LKW1EyNQuj5LZ3mn4m
 BknGBPc1bbUyKnPSPjQ7ze03HDJ8D+hxALPIXb1z/fAvg+pkWncLuG68eKOhOZLfMiDfb2s+iwi
 URpUZ7me0bCnRm6eFBpxqhw9X6bcv6VyKJeGNGcKP/wxqaOzi9IxPT+bO+4XXnJxul0ZFAnTnhn
 M//xuaz8Qz2+fYlVpI44/KiT1o917n+zePe1EQ28t8pX/fydQWAhxor4ybIK1kgyBEJTAhGCKWc
 65gvF6tIUyzyEI63brf5pLCtkp6CSZJFuISa8Rl9qSnmzPgpFLPFieIL8EHYl8iL+yFmFwgvQnW
 hrsJSSQhfZy3ptYV3Ujdl4P/yO25u1GHFwMa/kMP7lPfDHTiYX5PYy1/9ZYIQJIztaKxGgwz
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=68319b5e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=cusL2G7gvvxGUya2EAQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: v0royPl8o39-1ML7ca5FHE01EKBsKZB5
X-Proofpoint-GUID: v0royPl8o39-1ML7ca5FHE01EKBsKZB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=887
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240092
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

On Sat, May 24, 2025 at 11:19:12AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Thinkbook 16 appears to be an X1 / X1 Plus only design.
> Add make targets for normal and -el2 variant.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
>  x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
> +x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> +

This will break without the next patch. They need to be squashet into a
single patch.

-- 
With best wishes
Dmitry
