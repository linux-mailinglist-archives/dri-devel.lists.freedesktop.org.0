Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A2B44A0F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626B910E042;
	Thu,  4 Sep 2025 23:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxbgcgE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7412910E042
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:01:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUlCF018103
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=etXN28r9jaaYlfuPDpTiD3hF
 bcuxX5byMenXbqFORPk=; b=cxbgcgE19sPkiCfBgjxSL0gtQ/GF3vK/15azlZvP
 rMuvJB/9qEBN0q6sBcwnl9uFN+JtlDrdp8dp+rYhd2DCbtiVVBW/iwZF2CydTRPj
 L+67D9ejpUL41AaGRfS5mticXJ6YXt/avFmZAIzh//5kypz7QoTbbZoUeWGRGSb3
 Rc3bkJEE4pjCW9wR/q7Xyfx64s4CDG8JHeDFB9Jtz8EWTPcisFAlCOEAVDB4wTg5
 RE2zApN6d9drKEa3jXmknkDaQ3r567urujro2hcAdKSC1fR7s6+cvQ3WgzPj94l/
 3wtLGq4KUK0kJsmF3YLwmxdVqpse6Ts7mdmEdpuCPio5dg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yeburyvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:01:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-52adef4c5f7so536043137.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757026906; x=1757631706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etXN28r9jaaYlfuPDpTiD3hFbcuxX5byMenXbqFORPk=;
 b=gOAS3k+7OyDrS/evzzeoNYzrM2YWZ0k3QCskg3nF7EC7zRxpZBQblvdPz7CaFFsIlQ
 zOB4oDdVCa3YpVT9rRIRrM6URTUE1v4EZBHscNqdxQcpLYb9nc6xjNCWSv/wE+9MZwGL
 nkE1fboDy0m2ZdeIFdXPeJACPin1dYx3DfoQAOzekfRhDnF2vR0JqxZCjywOAQl9Dwxr
 a9S8MrFzo0ga+htmM7b2HGmpS8rTd2lkd2v94zdJkVm0+z1WLHew6/rfjDjoZC7aBkFt
 NjhbWTWbb9w8wR7iNsVbA9kr8f1aHeu1c0JNor/7RWz2tdhJABCmIAoYRYRjXelW8XQR
 f8rw==
X-Gm-Message-State: AOJu0YyE4OgXmUzk9wTIb7pbTm/iDv7Y8+Bq4oATIqtjx7UmduekA9ck
 nytnjj/o5ImgLE1FQG6WZKgH3MPTTM9LbLQW4IFn3vrtu3BL4UOsrCtiQqDlwgZ5plWXWuCPmEi
 AEhOEOOo0u5re7ZDML7xT6d/XvMZ7N7oWF80hcBG9J4XHj3RNU534t0y+zLSCxz5bzFrFg3A=
X-Gm-Gg: ASbGnctkFkmiATQ3jXQR+Kx2YsKrJDjVA2M6c2oyNvs66M5WA4OT5XqzUE+oYyhEWNS
 N1sMctKgX9GvsxghLEHsUzSesfsIgSNnbaixkjNjbIxWv6gZe3Qr0Ql+1rLIuNipYGIQ2yh1CcI
 TQz3TQpO6YslQyHjfu6YER4ioJ/obB1sYvU79LDl2C5gBKyr0KegxTgcj0D++kKCc96tGWZN61v
 Cye1vcF008wRubISdJQByrPy7py0YhMZWbcAsX8k3wjnhK3dayzS0SneOswkslUxestUjFl6PPR
 eFV7idersrMiXRKmV2ykKfVjddlXFrdZ+by6l7mj9wJAeqUjMTdao/0vO8fOAjCQk2pWpA+LGvX
 ElqkTgSxzhU56ANSQp1FmCV5F3DaKVsC2EQc8w/WQxa2/PA9aYY7h
X-Received: by 2002:a05:6102:4412:b0:508:aeba:ac31 with SMTP id
 ada2fe7eead31-52b198509ddmr6977179137.2.1757026905723; 
 Thu, 04 Sep 2025 16:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFTY0xHZC0fSrJeqcA/zXmLkbjpVOO2YoQKWjdh8znnPj9BanzEoFDRvnxif8pLwlmRxjVg==
X-Received: by 2002:a05:6102:4412:b0:508:aeba:ac31 with SMTP id
 ada2fe7eead31-52b198509ddmr6977153137.2.1757026905323; 
 Thu, 04 Sep 2025 16:01:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acea11fsm1477286e87.80.2025.09.04.16.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 16:01:44 -0700 (PDT)
Date: Fri, 5 Sep 2025 02:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn
 ILI9881C_COMMAND_INSTR() parameters lowercase
Message-ID: <tzz75sv4orkbydpd2wmqxvsoyhc6as3uusjmt6rcw45mjz74wi@r7wm7wibzaom>
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
X-Proofpoint-GUID: qaxZoZB8CpbWYL129MHjEX_m_z4wsPub
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68ba1a5a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=RF00TdSWAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=dCZUmJHuHaGrPOQQW1IA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXzKnzoFqkiphA
 j1Zh5wi2NkgFBROuUV7HuvNDU9bwTuOWg/IN2Tj6276a5m8fEv1PV7Ek97czItzdotja0Tmwbg2
 jYUZBwbb+VRFt/AL6EN/NBnINtNDNSSKBkQWwlBWsuoBCz2+fEqtE8ptbDEtQ2wWLBg9UsozygW
 Zi15uh02PzwG0f6EzC4s6gYDvhrOxAHdzbOf3HyOt5WI2sU6pidQVGZ77qrV0I7fcCoX38BMO+S
 yMT+Gfoz4bXVrb3xXVOjBVTi1nyB+9Ivh4prHmecx4N6irR5gmvjbOQDAmmaT4r7kf44+d3jA2q
 xfN5DU7IGa12ca0k2lNfpQcOeI26ab7MOxmn5RK3AplABJ53duxovXeoZth7KvxqTJkFwxsnXoz
 re5phgLI
X-Proofpoint-ORIG-GUID: qaxZoZB8CpbWYL129MHjEX_m_z4wsPub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Thu, Sep 04, 2025 at 10:55:15PM +0200, Marek Vasut wrote:
> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: Use vim :%s@ILI9881C_COMMAND_INSTR\(.0x.*\)),@ILI9881C_COMMAND_INSTR\L\1),
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 888 +++++++++---------
>  1 file changed, 444 insertions(+), 444 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
