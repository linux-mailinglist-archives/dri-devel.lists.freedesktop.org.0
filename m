Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8EFA949EE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 00:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ECC10E156;
	Sun, 20 Apr 2025 22:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXg2sM51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8636610E156
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:55:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLgDbq025444
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=18GmJcn6aeR/AFeji1S+mQX9
 A5J0DZGsqXTXSspaYAw=; b=nXg2sM51t1OC17M3K2PLSY9mQNTisFallNJZCPk8
 5tfSDxF+C277sjd2GjqRlSMxe6DPOrBZXG0F3lsj5EyjKKfZZMTMvcjXVOZE/cJZ
 vzfFaS+QKuUyliIgHH5wTluxTJdLamMPNDyhRiwwK/f/mmvIr3MplQoxr7ZXWmN2
 g1v1IidhTLlK1ct8s3tvmd7GYLu1PLPR7b/oia/srqt8CG0fhkmrhGeq4Jpy+Ud4
 UnH2e3GDTi9Al07A9MgdNX75L/uzMUBJhe88udsDtCxfDp+ePQoqsDg70VIzBpVn
 LcftKm2cspFI7MSGwPHny2MrSBhK38z1y/+KePQ+y2rxqA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643e1agvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:55:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6ead629f6c6so58255436d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 15:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745189742; x=1745794542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18GmJcn6aeR/AFeji1S+mQX9A5J0DZGsqXTXSspaYAw=;
 b=VyxxGhQRVwKFLmC4sPJDuM6zaj6wVPmJmNrew3AUzFfyNNc3RCOT4x1fq+D05U9XX5
 W2fj/6NwhJUYa+NfMoTZQ1O/BWycaQM/xd+0cqjHSX2ame8/gtjY+DTxDTRDRlCNf3+E
 krl5/70d2WcZQZb4AvNKjDdv7iKScJOkvMVfoIfg47BbP3E4L3W98WIMQIdammmVZJhi
 kU4mB0/NH2RmaGmGUb0T+eH79m0V+/EetDrplqADg8pBgcko5oBWSJTahz2kScqKzpa7
 HGJrdWy+6hh9jhPv238vDGPzgfArPrJdLfA0kHS1z0muNLRxi6JcejSMhn1sI6gak/uE
 uybA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlj1UPc7+PufTAXidkFHh+c697/+xbLrPzoWABvRWMZWo3icQZCXIPnwlGjj7Tv58zwtzsa+3lRng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpOLaGFaUaAAGgGoVpKRpoOFWkwkDiiLGT+9wAuqURqt7lqtX0
 rOv1QCfVDQbGpN58Pq/deM5GrfKCyYXyBzuZmeZpjCMjLdDG9rn6jqI8lo+TWC6ins7OGRoRYxW
 gmXUYJXgK/5xLSeWMm1ASBQC/PW38/HD1zopw2SlPgwDnsAAlTmOMoEEA6g6Tw6z1s4o=
X-Gm-Gg: ASbGncuzuSGh7lnp+r2XPd91cqpnyWCSaNu7SuB3tj2Mftd3MRYiy99qK6u1Md02OOn
 ZOBE4r79YI3ojqfXclVETLhkD9jYQDesywXsJJJ0amGlO86xzqXQ6stA9VIAVfMhMEDlJ5y1rmA
 70CB2Pq3j8sifNKfJq7EKipC/byI61r0p9vQsBrT1fA+kCI726PMP1kbzEydksEZKPiKUReTFIS
 aiRyfYccEeGUuAXTxekPynaKdXLi1yeCI30zNQuP2wnsn6lQbX3KYEe7lo2XTRtvR2A0PLJhcbp
 461TN9sgcaZd/wwXoOJKg+q+mQEWuS2NVfp0xtBM81zEprWxjnufpX1Es9R6tgBmPTdt8SuNGDM
 =
X-Received: by 2002:a05:6214:20a8:b0:6e6:9ce0:da9d with SMTP id
 6a1803df08f44-6f2c45c16cbmr195964676d6.27.1745189742763; 
 Sun, 20 Apr 2025 15:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYHiGuUL7anzQP+hRVdRIw1exJtNoZHjg7PsuBTXU0sOzexbcuqptDxCR2/PMYgAyo7hG3VA==
X-Received: by 2002:a05:6214:20a8:b0:6e6:9ce0:da9d with SMTP id
 6a1803df08f44-6f2c45c16cbmr195964376d6.27.1745189742375; 
 Sun, 20 Apr 2025 15:55:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e5cfc2asm774587e87.136.2025.04.20.15.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 15:55:41 -0700 (PDT)
Date: Mon, 21 Apr 2025 01:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
Message-ID: <r7xoe6tuj2njktvfx67yd4dfbtt2tawaj7xh26rcmjunpwdvzm@xktz3jbz63th>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
 <d16755ba-8a68-46fd-a92c-9404512ae6c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d16755ba-8a68-46fd-a92c-9404512ae6c2@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZOrXmW7b c=1 sm=1 tr=0 ts=68057b73 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=OVPB_bV0BH9eLidssw0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: _3j7TMU5o6DkafutFX9IGoB-gM6THNQm
X-Proofpoint-ORIG-GUID: _3j7TMU5o6DkafutFX9IGoB-gM6THNQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=907 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200190
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

On Thu, Apr 17, 2025 at 05:47:00PM +0200, Neil Armstrong wrote:
> On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> > The dp->panel_is_modeset is now a write-only field. Drop it completely.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Neil, it looks like you wanted to respond with either a comment or an
r-b tag, but none were present in the email...

> > ---
> >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
> >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
> >   2 files changed, 1 insertion(+), 11 deletions(-)
> > 

-- 
With best wishes
Dmitry
