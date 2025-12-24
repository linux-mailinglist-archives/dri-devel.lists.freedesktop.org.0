Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E671BCDB0FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B0F10E2FA;
	Wed, 24 Dec 2025 01:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcFY6khT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFKDVFhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0E10E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO17WUi1597811
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=siMNefyG9BI9iI6gWwtF2XoS
 9bl+uVDhfgsJb6uiow8=; b=HcFY6khTfP3CoVQbJI8ELcEm7O0YtAD7ZYBegION
 HrgUa9q9sU1ojOJHgBCDV/bIXldagp7xd+FTLn3O2m92YOkUVuxbsed3aK2Pra87
 GQl1bipKcKr1FjHXVEfi6XYgnCXXtUlSEuGkrEeZUBqjsTm8tVK66m1BBepyIM5A
 qsWZTEjIkNb8gn2QOttjJf5KsdyjjeHFooMOWuBkHnu97zvkc1HDKEvNEVAdco7y
 /vmmZPrzavi0/oehMbYSvt76pBOhZexkhjV0Y7Fy6OWGRZ5vVYHBOq4WF+NI7W4d
 AFXcKF/9FcOzFvB+PpeZqCKr1gVo6aCW4xWfACgVhg4N/w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683g0m4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:16:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-93f5d18f105so3765421241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538966; x=1767143766;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=siMNefyG9BI9iI6gWwtF2XoS9bl+uVDhfgsJb6uiow8=;
 b=KFKDVFhmUaFHOt/qkeQbQep2A8PIiCpzEPWcxTOik6LZxrbOWWViBSQWBuJRdXwHGO
 zwKRbgpFodpWl3tvvdd/sQKHBc1asEhsCuSNtkTqB26Xzg0Ea8gEJI59bV5UjDJcoWQ+
 pxSsP+pc15n4AMH5zCGrbX3Xg3q8utcLV7jPvdZHe+nxAQVkXO38lDIrFXP8Z285twte
 xJZRDFfCvxohyimPEIvbGYf8Vz78lw8kvcogyliref3TGVXJLhmtkUdXP9AMdBZ5cNTz
 GEPxg4YcZdrwJQ2lbthykHVVGVZPTRIv+NjKCrDXqikDSnvMsBTRSEEvenlUIUoJ63zW
 d+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538966; x=1767143766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siMNefyG9BI9iI6gWwtF2XoS9bl+uVDhfgsJb6uiow8=;
 b=ksQ+rA2EHrwpfHxJBR4MvqXzCfCt+IWhPoLY3SBPQwJj9gjLqMrWpSpwlOg6lZ+oUm
 f7KrzTBh1xz3VNMh4Oncinc0u/OssCYnb6oO6Co4pfBxgp7Y6GsGnkOPeUH9tK2cO24r
 3sGBz2IcFeBsHlm7V7PArfbS7GtzzXY1dOfRH8toE8+x6t1uQ5CMA7yP6EM0za6Eppda
 CBHo/YH+yACt3Zi8vlzSNYXbFiFEOdl6ZwQWIPTNeJjSNJ40c9qDr65W2Vy8rzQvilWR
 sZx3Eg7lkSA+rdv/GsJsMe1ioGrEQhCg4pnwzUZ1pua5iiBCRQ1DsxWznt9zs1facpw+
 bfSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Cub3qa7RaYTrW8SHm/DeSb3e/XiQSOrUAq/UJfgIhDkNAEv0wWYKaz4MThFRTWkI0R/Ao7F2klI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYWFjJrJJOoUzz6q9gQw8oHFqnddOQj4s0GXvZCp8xbkW1RUHi
 BfzeKlfzBpyhnU/Twp/9TA+wtJcDucyR0Gw6UH0rArOCb7/hlz5crr6XVAKkja1k+Prl2ED7eJu
 Uk6QJkLejDN8TVlRkM+M6RFJo4SnwMstzlvremxsaVIJM+KlzWzrxTBKcNPjMzRPAQMkz8/Y=
X-Gm-Gg: AY/fxX4XoHOpqHNo83wQd3bl5nIERNfJ0TFpg7eflkS04u80GneZ6P5xHHejmiXLFXa
 O5l4QgqHpCU+N+lsu9g+ROFcTKupUmmXCryC1vnGJS46XXTy8GjbynYGE3c7G+G9XYu/S1y8e2J
 mkFRTe0Rd4qZy6VfoRP8n7gaQE1SF0DvBHzMMdLYPs66Bh3BzRb/n9vpG86RdInrYN06qj7U2Vu
 Fbm6H5wDIN2g20Vt9YLRcTW5xm+0yh6N7spdLl2pKqiVpYps+00Ea/dwJh8MqSn4N1IWvQKtK2z
 txXaJGDtBBFV2+/fUqERMYfYVlQK0FwprGtgohC6QCmw3zJfZ29rnKo9DD9Dy5oW5/c+UVkShd2
 cSSKOMT2g4+Dt84SLsothnP7rSOQf6KNzCUSvKTk6V/FF3Y0LcwR36Y0kYjzHS9WWXINMrIFvHx
 tGsHsrn0oWJgVVxi0vkM++vgQ=
X-Received: by 2002:a05:6102:6b09:b0:5d5:f6ae:38c4 with SMTP id
 ada2fe7eead31-5eb1a877d7emr4755718137.45.1766538966365; 
 Tue, 23 Dec 2025 17:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKCGCoS5VVzpCOhMi3YsvQN+bHSK43bHc1x7Oxom+xEyLQ+RlhYI5632JVxoNTI7WNa7SZPQ==
X-Received: by 2002:a05:6102:6b09:b0:5d5:f6ae:38c4 with SMTP id
 ada2fe7eead31-5eb1a877d7emr4755690137.45.1766538965944; 
 Tue, 23 Dec 2025 17:16:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de67csm39713141fa.9.2025.12.23.17.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:16:03 -0800 (PST)
Date: Wed, 24 Dec 2025 03:15:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 09/11] drm/panel: Add panel driver for Samsung
 SOUXP00-A DDIC
Message-ID: <unk7loohfu7f6eb5treqem3t4km3ngy3qnoobfw46hb43odypx@y3hc7bujxidh>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-9-82a87465d163@somainline.org>
X-Proofpoint-GUID: mh7qp3vfLx2XybCogaXXcb1oz43NBIJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOSBTYWx0ZWRfXwsEeqM+2DOEz
 rx2Lw7hvd4c2efGjQ0HlwsruDkeG9wj+gTejqLRK50HTd1PqsmLaKCZM8phpy1qC4SClTXoq+fh
 r4PYuCgY+zEXWymDrbAniMt1BbfI49Qb8TUB/63PNJzooRjeNMmNv1u4qUwTSTaokSgqW8W2T/I
 jXcTOc1NC9EE+tgJB1Lc+dScVOl4ri6PRsAU2bcpSxDW68G+fBhumkCLhs1SZ369JycYiiD2vQ/
 rZsvp+UoeQKueD+WrzZubSY9YJ0mjkB35AlnpfwU9w/qWdmhc89MVUuArjwRhsDsnB5g8NZDisj
 iL9900tcXNTUECbJ7NCvR55xo8TEWGonYATBUEfMsL7tPkeXzwLYe5z0mBSFxZveNrUOdF6KIBA
 xD3V0Wmk+XEiC17INjE8+mIp71vTZdCDIx3mH1l39lU4S23VGzyE0/e9neT2z1z25rs1Ztle5th
 Fojk9prHltEWFyxADPw==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b3ed7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=sOBjPdvQlbgG4MJwbfIA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: mh7qp3vfLx2XybCogaXXcb1oz43NBIJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240009
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

On Mon, Dec 22, 2025 at 12:32:15AM +0100, Marijn Suijten wrote:
> The Samsung SOUXP00-A Display-Driver-IC is used to drive 11644x3840@60Hz
> 6.5" DSI command-mode panels found in the Sony Xperia 1 with amb650wh01
> panel and Sony Xperia 1 II with amb650wh07 panel.  It requires Display
> Stream Compression 1.1.  The panels can also be driven at a 1096x2560@60
> mode.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  16 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-souxp00.c | 399 ++++++++++++++++++++++++++
>  4 files changed, 417 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
