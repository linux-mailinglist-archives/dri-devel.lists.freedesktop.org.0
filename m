Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353CBA96D8E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7C10E0F5;
	Tue, 22 Apr 2025 13:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVuA1Nzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF7510E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 13:56:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCfYj3011228
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hLX41ewAvawIzUNIg9oBBsNHTXaw2xrMEYTyVLovArI=; b=aVuA1NzguAoM93ku
 CIhcHBgukCzA6WsaKWpWm7zTDDaQU5hJxp/00tiSdcemHjFlZnphNdXwd02k1a39
 1zfQrHXLhRvG0QvoNGzT3tW2OHMaNd/WbQJzOJCJmP2MCD6YsA5JGCFFLy4j8Fij
 fFdR4th1s4BeY3ZdfYhQF1htr/ZnlHJIA2Q7AtZfyzCEbHqh3+vFOKjO3IURu9I7
 9ds1jJ8gCevsnOqoEyLAkJnk52GvsL4w0MqNqN8H2KnghKFA9pQDmCii8SsLGA+n
 5rWhXrtMsT+j1+WW4X/bSFhVA8m0EgHn/375M/6aCTNhRstl41LYWKIenJbmqdeS
 MoXbPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pfjfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 13:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c09f73873fso789926985a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745330212; x=1745935012;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLX41ewAvawIzUNIg9oBBsNHTXaw2xrMEYTyVLovArI=;
 b=X0Mdrsz579KRyY+J9bk1esNb1CK6dWtSNaKubQuDnimzqceHpE+tdaLGNlG5y4xr3m
 q+uSQeFMKVJ/zAyTeMLxGpnTmlarrRoK6TRmY1ZGcUWfB+EYwj/rZKx21FUnQyw2iQ+O
 BNp6RApcIhbzIozRCwjtpCoNAi01NitGckpLIv/I7YthQQnfRSqcCwOsWG2qYRNat9O1
 CfJ+OdYE2cw+9JVLqg5v0aoOVa+/tuTKqXsHVMvJpq/Ixh/RaXwH+S+7NgGbt9Sx92Fm
 gO/raPQq6CtRp8/FCXfL3RFauB7a4ALcrYFOql8B9eIsWcyEi4QekFqfcQbenkEO03wC
 395Q==
X-Gm-Message-State: AOJu0Yw8lgaCW5mU18OHjEpROXMnENeQHmigetCk2WjfO4Q2qS5eHGgB
 UT3DD3896ncdkvSYqTtUU7ogq5k5bNjO4VEt5YbWtbIOEOrAcekNGeNYDXvao06dZ8zoXsPnA5Z
 BL9/bRSsAqrzw9yE7IhTvL2JdBfaLz6Vl7tkt1RZtgvHt00se7YZNjtQD2WFnoJ1/HYg=
X-Gm-Gg: ASbGncttiW7ROl3lFhRyv4lWYLXNaWK+dg21sbdyTukaU0fGR+mAJgq5nBTEYlmNjCC
 tLVB7gNkCCQxCOuYvq/6OgN3tR9A2NNDEZeqdjIkpWPdogHklGbaooDWOO4lAUoxyAeOWHqF4DJ
 JYLcGaTeTJpchvXZxeMf3q6wJRRrSf8rFneiZR/i04pa3JBa/ugTpQmKzVzDGHTNVRZZGrloE6d
 xPiGU9gylzF2WZWGyHywMi4l6SjAods+Gnu8wP9AQbrVH7ZlxSLTQKlhWSNrg2KwwiP9FV0ayvt
 xKJQCF59Q7oQXdj4enx4vL7AgbqPWKOvLndzYy+mP8pGDAHokOz1EFMhdEJDNygAiRmoEdq+x3E
 =
X-Received: by 2002:a05:620a:28c4:b0:7c5:48b8:b4ac with SMTP id
 af79cd13be357-7c927fb6519mr2112159685a.34.1745330211897; 
 Tue, 22 Apr 2025 06:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0qRpkyBUKjUrD4kvThn3Y16KvvVTGoT6HNmzOB78uuI6p3Y6JljxDMeJUkjZNidRJE5DCFA==
X-Received: by 2002:a05:620a:28c4:b0:7c5:48b8:b4ac with SMTP id
 af79cd13be357-7c927fb6519mr2112156085a.34.1745330211573; 
 Tue, 22 Apr 2025 06:56:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310907829f1sm13930421fa.24.2025.04.22.06.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 06:56:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] drm/panel: make prepare / enable / disable /
 unprepare return void
Message-Id: <174533021057.807756.14047991918333049362.b4-ty@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:56:50 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6807a025 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=8AvdZQ4tI53xHl701REA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _AUNLJZ4cYpBdixdUYxdSxxytffPL_FS
X-Proofpoint-ORIG-GUID: _AUNLJZ4cYpBdixdUYxdSxxytffPL_FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=880 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220105
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

On Tue, 01 Apr 2025 08:11:32 +0300, Dmitry Baryshkov wrote:
> While it makes sense for panel callbacks to be able to return an error,
> the state-management functions from drm_panel API are usually called
> from atomic callbacks, which can not fails and must return void. Make
> drm_panel_prepare(), drm_panel_enable(), drm_panel_disable() and
> drm_panel_unprepare() follow the same calling convention and return
> void.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
      commit: b65cbfe0e1d8bcb74dbeb221d423dd926f326d05
[2/7] drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
      commit: 0ce432e18c932a7fd219b9c2bf1db623fb0f7840
[3/7] drm/bridge: analogic_dp: drop panel_is_modeset
      commit: 4fc72e1fc46b0dca74c1f8c94091e524ad5b9fdb
[4/7] drm/bridge: analogic_dp: drop panel_lock
      commit: 62ca1c3a146c73f8b8a381bf4461a82951defb8b
[5/7] drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
      commit: d5f34ca5df7c0ae075fdfeba20edd6f81c792554
[6/7] drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
      commit: 58a71d2bf103550f809987e16d8c1949be719040
[7/7] drm/panel: make prepare/enable and disable/unprepare calls return void
      commit: dcbd5dcc956e2331414fd7020b4655df08deeb87

Best regards,
-- 
With best wishes
Dmitry


