Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36865B0A6FF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7010E9E4;
	Fri, 18 Jul 2025 15:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxzhaWjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783DC10E9E4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8hOJh028094
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
 syUcZjDX5f8XV6NFySlbc=; b=VxzhaWjNb02Cs8EjdF4CxETxfROq7KxpJOKDej
 O6tpWw34I4DPlGeSwh4Qd1BIo9mDYr1T7gJRVU5YgWJ4kmPPioSGGcjIwDuzpu+I
 1e96n6+vXNBe8nSenamcEpnvcxsicaUPjkA49MnC7yU7PZP/bEuOns5LXepDdje7
 TRVsikGQJVp65LX162On9HMCJB4b6OJuCccRsW2hfP3Kl/qr0UZK1ofmZr+c4Fob
 dFJQmjF1qzZ/8AlltQzUMimLiLZeEfDHc+fuF1V7OdNweBDpW3VyMnn96TO87FiG
 Hcb8gLSt5ZxVeKkV6IWyMwNk2Q6Pu+5TsRfE71zFBMm51W5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh649ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e093bccd5eso339980885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852072; x=1753456872;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
 b=QIKbhGgMQkpEn2Or5Y7whsl/kcRy+Y6GLDl0k5fdBYeeSmGauA974pWbKnGu0kZRET
 srFszsoGCzgEE6XTyW+7iYedEeZwPkLlHgbmlEayvyd2j/DbiDHiBP/0pmyH3IEyHvO2
 /7DsZWkLdRQUT+WeI21SAFBNaeh2V6SCau/BLxOqL3CdsHR+gvXQTcz1B53MyslKb0yc
 WXawsn5yS8sVAa4Lox0EtYNdrPBOYNSjfwONhje0yJ/NDs+7spcjvdod79J6aBL3Ij38
 fMKEnTNyAFhfbVWtSdWeu3yXnKWBA1kWxQ52rF1ZQnkAZePduBCcGaZVPGFpD1yA+ugA
 dAAw==
X-Gm-Message-State: AOJu0YwtJQKYGMhl5xSRy9tB2jDXWCk9Rq0rDNQseHMEKglacrvLMdCU
 mewqT+drW8CwFzz/ZalMBxDM/FRIkeZeTbQplraGE3GYXIB0zo5+/JuvdddzpqYb/vjVgXdP2HC
 YilzWbaDVjqz7JIZ6PEyIDKW9lagmtySLb6lxmLLlkiEzXzojXEiQ+Vo6gkEeYeGYuQf3Luk=
X-Gm-Gg: ASbGncvruOjM1DAjqczMmUmX25+X6qEh7dI1hbIpTU3I6j7Ez8GOxza0rJi+3LbYWcb
 qSIHX349Z42RAHP9a2tzBC80H9/Uw+XUOEPJjRh5e/8Rcg7BXz2Zt1Yeh9frlA16R5pvPZkD+PX
 5uRqIB4m5Bm6/G9uOCKmRpTTAxHf1XrZonrtuhetJRRWjCtrHperLL0+WXO5JR6mdM5YnWBYwjs
 vcaWhoU0AiPdCF1wuh1kdsnD18v+yiN48JQn+uCiE5W+mcYAoyUkNXDDINtX4prNyyQNn88Ef/w
 /4fvGvKkb2ObT5Hal2kPHOhahcJJ79b8wpePeqZfocKVRjDUHiQrytybUHtAdIKIZUBXY89Z/kd
 2OD18AL99enJZiTQ2kg9nwnkCx5iOVn5bW5Gpqtesn1lerIrNqH8e
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id
 af79cd13be357-7e3555022ffmr475411185a.16.1752852072317; 
 Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGih5HUBirffAz2WZL4QKYwy08DDOZqNQMloXSzP16EApN9OS9U886pytxqNhKO8kzqfu4L4Q==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id
 af79cd13be357-7e3555022ffmr475405285a.16.1752852071615; 
 Fri, 18 Jul 2025 08:21:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Fri, 18 Jul 2025 18:21:07 +0300
Message-Id: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNmemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3ZwSSzNDw9KKZN2MlNxMXeOUFEszYwOz5JS0NCWgpoKi1LTMCrC
 B0bG1tQByS41fYAAAAA==
X-Change-ID: 20250718-lt9611uxc-hdmi-3dd96306cdff
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmrEL2Zztp1/d85i0Oy9Zc2oZaO+hb0CQUZ
 ZBKX+ii2zqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1Rd/CACs4rPc7tst3TZYIDDeEoQX9zKw6b34Lk1QY82wtNiwp1z7kv5KTqL+H5iB5gH9P1UDiSS
 nw3HcHcejQ5xrn5NDQRYCAtIh+Yk8v3MYHW1UHNxSPIHyMS8SbNufXY3ThYqJMcFkJ5OF+mVlVe
 3nQcukkkQUAj59qsqfWFJsN70YCDBUQIe9qu1Y9Sx6orOgASt4ws1mGKpBEx0TTwa/F5j8cSk1v
 y1NqCttIgJc/n5GDXUbDDzKXUJxU16RWjIDq+u8NnSu8N2+u1+mtGdsTKxEh89zBNGgpILUZhTR
 ybERI466cwrPMuVeppkJibCtOrWqkLHbQsc6qCw9J4KcJ+gV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a666a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: R8lmLRgJ9LZEF687rQW5VJEGDTPG2EWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX8NOf1TEOfgks
 8PW86BxlKS/b3jpJ0ItkZriRX2bl1VqWKvbQSyI00U3mIuSBaSigii64Z7mPFF2L4AwwJQY1Igb
 /HlHygewKe2Vewz4wazEiaxMfQQnTeB2/dpll18tqFy1D2I2y//6D1P/HQw4/K5rA+333U4BI9L
 NZNO7rP3wyb6YNIx+CyyFoTNeGV4f3o2j7Yw09Rh8yNXUn262PunSw2h4uHHxUmRTTMaQLeTIWR
 kb17vdG4Rr23MyepHfxYFx3v/T7ayrVcI+BFXG2jaRVbvHJfPuDY/zgkAnqo9kisi20nBuhjHoL
 tm8UGOvU3+FIyBeZOOhm76pGdxZ0j617FGP/b6rhi79iHAnaUBhdM3SA/b/XNy9tWPmPhNXUXJI
 weWLt0nrQQPCZb/Nr+yaXNpaYoQaIEYq+BZ7NtcWl/pEE238AuhRK3QDqbK5hLuHv6JFd/GI
X-Proofpoint-ORIG-GUID: R8lmLRgJ9LZEF687rQW5VJEGDTPG2EWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180119
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry

