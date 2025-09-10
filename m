Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF60B52160
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55810E9D3;
	Wed, 10 Sep 2025 19:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjYLx7WN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B6810E9D4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgFHs024541
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YLXhPL9FJVDyu6T4fbEau8ar8ycdMYElzWEHqqMo78U=; b=GjYLx7WN5XLj2V7C
 pl8EgH38N29bOv7WLwGL0N9OYxijUxefqMyNLPw0YgNa0E9tBHA4wEHMvjrreDdH
 Ld/pmFiUymLijafanjQTJM/UG88FZ4AjimW6B35xXwVnvly0iubeh/RWFVIstVhE
 YHzrDBo7w0xBweCQK5MdANnLfjOjG/MDXOYhSfNIKSEg+rxW/bPRWypkszIyA4yJ
 dRaGs1LcHCrKNkfllMeCNDkZPxJunAb7BRLSWn6xv/XXhvecVMEwpkHTD3ZzLnQt
 pwpvH2hdhMXYwtwMVKzFKiLZqgVz2tGCmjLfpPF5H5XD/AgtR4gZKdfBfShjlipA
 FE6IqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8n4w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:47:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-718c2590e94so25124646d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533638; x=1758138438;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLXhPL9FJVDyu6T4fbEau8ar8ycdMYElzWEHqqMo78U=;
 b=bimToYTPEGzqfo3PlOOfxI5YHXvOnT9n7PpqJaCvySgH5B58AHMsQ1Wd8d2tTc0i4u
 C5r90ismFnQITIC6tX0GQ/05fG8PfjZyVh0uOpk9WMH2V8CCxIGxgsLvRMpdG1Ezusgx
 j3+CKQNDJyGsW00pSHt5tMDlsU/Kfyr6BAN3UFjo9Q0VAAbVESyL0Hv/I+VTM3fuoL2L
 BD+ny7E0JVRuR8VpHesynr3jZBPZIIVCz+4qh/HJf6jf+jn+Eyc/fwA2t53BcGt1p9XQ
 0mzD49wq/dblksflECq3EfAfhImABIAtpmwABMnopfV94BKiOv6WBOkBjV60+FNTCxOA
 e1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOnJBuBeABK2/vEEFlkK+4g3LUR4D9co7wYXrVrmYE4TE66a7PJhAEXjHrRoqzIUAbZWu0jwFudxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQyekCfLlnt5Y0EgMeqIXsdB3YrfQAxZMi5OEmn33WYjYJD7wY
 t7KJGFCDtQ8zfYXW6PztsUouZYjgCyQ4iwvQrBZSIlek/TBy666eT1GfmAojhA+LvwPX6piSecn
 DqmnQOalx5LXVhyoAVXaFF8GEd5PMZ/1TNDlihLpRovJgVm3l/LxOpkbg05QRAU6o8nj1+lk=
X-Gm-Gg: ASbGncuHnNgeYj5UBhPw8mpLqQfupRu9QrDi9L/GvPxyxRw71lJlAeWP6yrMqzyAD6B
 +6apvIdOxKPmFhr+Ss8YSTqgni8LIb2KSYa4JSv/S4E8dM2/LAmksNnPqx8oLTE8GGxOZpP/hG4
 tZwWtgqLv1rIqigbkn+A96xnKKNG5KEf2iO9gY6rgFKJCtN7i68cr2+Y2TbYkOaHvzulGcvDRt3
 p5icGB/OdfxsVZf7Q5Q3Ju/7qpr+dXUYtb5601RlhNXfxxLpm7p+Mil2drD51QzjOcuhcjBHg/o
 7J+OgGIQl9NOhH/5u1DwGo6ZF1USdG6I0dlOdhF7Bp64exFTlmVz1ygCt5ALuNbUrwnzQIOCD6j
 xx01CB5FOS72q2wtecTTYRRlBjs+gJGiRl4o8Lt4mKqpuLA/NmLYt
X-Received: by 2002:a05:622a:15cd:b0:4b3:48f5:88b2 with SMTP id
 d75a77b69052e-4b6348b1c33mr10716911cf.37.1757533638385; 
 Wed, 10 Sep 2025 12:47:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgNXrsRUYzdbRq9wwySHuZY+rdXhThZXn2B/OhJ//KGcMcId9h/P8g2t2/gTV7ZLqZAlLuA==
X-Received: by 2002:a05:622a:15cd:b0:4b3:48f5:88b2 with SMTP id
 d75a77b69052e-4b6348b1c33mr10716641cf.37.1757533637954; 
 Wed, 10 Sep 2025 12:47:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db8911114sm57652e87.20.2025.09.10.12.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:47:17 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:47:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/panel: visionox-rm69299: Don't clear all mode
 flags
Message-ID: <memqypjg544vwevucbo3ot4yp2ooblbpjjc4vz3zj7exvjamkh@y2yj3effj2e4>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
 <20250910-shift6mq-panel-v3-2-a7729911afb9@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910-shift6mq-panel-v3-2-a7729911afb9@sigxcpu.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXyBiwCfqwl0Cm
 U0i98O27SexNyT2KHJDQnCo80c402IBAe1DyihgCI9AIxzY88KOYLdGsgkRn9gHI127vgSJCQkU
 VTKjRSJJEDQ0AaFexVp0DMGU9fVJgt3B0yk2fHgPIgBUBesdy/jVjD7sHtem1IkO4xgBeIm8TLn
 BYi9lry/g7yHkb4aPgWuAqCROkdbo2fBS9PtbCLYfNS7ArWCbcHjIKqDYIynFKf44JZdrTLJZ2L
 XoAJZICkHcuZFGsSo9wDSa14pvv7ZYLoViigKwTCXJ2/CPnqZQBWnaZ8MIYAeyxOl9qdvyQ74Wr
 /Yk6TG9BDtVvYCRrYdgmV+Mvu43sPKydIuEV0iTdFZIgtb2JQkxUijoZYuTZIIzoXh9nJklXPN7
 AM5xppKi
X-Proofpoint-ORIG-GUID: SsBXWBEgvE9KE3ibtgidvOKQEZiulKtL
X-Proofpoint-GUID: SsBXWBEgvE9KE3ibtgidvOKQEZiulKtL
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c1d5c7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=feprlWPuZVWlgCd5a1gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Wed, Sep 10, 2025 at 06:39:57PM +0200, Guido Günther wrote:
> Don't clear all mode flags. We only want to maek sure we use HS mode
> during unprepare.
> 
> Fixes: c7f66d32dd431 ("drm/panel: add support for rm69299 visionox panel")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
