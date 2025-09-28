Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DBBA6B1F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BC010E1EF;
	Sun, 28 Sep 2025 08:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mp4uYkh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177EE10E395
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S1K1vN025201
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=mp4uYkh3my/rx1K6
 uqOwewezFIOGTfAWBC4LJiqXSiJqYkSyfHxq24uRT+mIf4ORRgXxNBO1vIH47rSy
 tykT0usK7356iAfJwZYeMFnpv/zxwfiN5BCYkgwenWnIQrDjUdM5DD9rwaYu+6Ch
 ZIDGImYyjvsPMV/ckGhwjS23Mfctwxrt9E/To+vfgSwYazOG6VG/JECbyWiP7v3n
 jwJIAGaAWGWZHrREK3bkxDZt2+JJWyueAGlml6EDioGbF4aiBkiFEP2jbhEKUTNU
 nQNFfiLxGlXw6ViWcpjGOMoK+m9MCrUa+ob3FPzOl4zoUkO9p3LJC285H4tXp7rQ
 Dtscqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d6fc3d74a2so109511001cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047907; x=1759652707;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=;
 b=Q9efJdnHVYlGvTz80IrcO4B4H1ci8OZfdMupn5LxrlVyzyCtRv2MvvojqRIHnuDsZv
 xyQJigTWHEGCFhFjYvOFOtNBEiHysvybt0QernOiYycbqyhw7AeknnFgzFZ6BLYx68pq
 15tqrFfseYtTU4i33zTbHs5cLeKvRE86D/5kazyeizgClcUzXSunTxYTCdl6+ai5Te0X
 Ii4NYpTXMHjmdEIf/7uKrJoL2bfERHPChThAKhJ84bGbrSwLvIOS5fJaxXpUeFmfc1me
 Qsda1LDnhGkr1070nNR4Zl0MHPlI76M4uETAoZ4nnnMb/b5B9qc7fh+1TOSgu6NHhw/+
 RVTA==
X-Gm-Message-State: AOJu0YwKoillWKJc3vS+CXDOrJ2jaoO3JJQmAe8LUHC8FwoU2hqzd2wQ
 Zo2L0qu2e4kXgGjw0NkHwKJrYSmiGiYWN20iWOwZ9sy0CsjQZawu/e1IQYs8eY/4MNTXH/rpoJQ
 y1Uf8wbzwdSh7uE/4jNknbc9dgHC1DXGXAlOTBvWzgn+yN8s0ledYQbrXqbES1uHOu0hoT30=
X-Gm-Gg: ASbGncvMibmzy+1PsA6dUjTcK87p2X2nEI2tpYyq4g8w/COpN19QhO8cuB5k56rymmK
 d4YU8G+UjU9gH1qKsU9ZAtxn02/tTx1Fl8fKdBngLVXKkU04eS/rN1eP7qmAy04eH8Fg5qW8X+3
 BeTOBOLJ8hqB7jNSHUSUpfZ3Xiz+Ln7BO3zPwan1/SU6ZudmdRvqGkNS85Xobf/A28t/AipNRAg
 0yvU55VIMyzgwYFR+sP+rpe4IwFWN4ay6AUCkc2/+O6SEGiy6h0vEOVKnef+9uQPp8R3rQ6Svha
 duok3C6EzJJpgrNqGliR16rujTAGUKSAYK+e6pVxsm8ricmjXJ1p/4AanLU48AORF1r1MLTT43Y
 /e+cnFh11kBaG3+d9VS9ejduSLROaUYKfzHNJ7Ag04Jn3YtPeO9WN
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id
 d75a77b69052e-4e03cdbd513mr20512801cf.61.1759047906684; 
 Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4tHD6skIRR3PjbcrlwIurQ9DEwp1HfbyW5F+wYqRDoVlCeVHGTwgYk18z8akZBkWd0ey2Ew==
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id
 d75a77b69052e-4e03cdbd513mr20512631cf.61.1759047906284; 
 Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:48 +0300
Subject: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1/mrVoFRRvpJKLVB9yIweMc38FlRgmbKvH5lbekmKJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTbRA2Db0kLZgBdJccCkRJyGWafvFK3UwlK
 Og2krTm2XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1XK6B/92TZdiTuBfCGlRC4tos6HVjULlKxbSlGenYR7KxEuZIHS4Dk0YnbH092fpCdLBVwu+HPU
 ujJ62abOk2Im0tkGhv2TcH17QXLGxsVHTeyqEaTyUrXZ6CY6h0NkastGwiYHf7g8QlADuFs1GxS
 lW1oQ+pI4hic2KPX/aJrg1zgAtNlypZ9RCJ68akVjorGwphcyKNLVN+zLiaMTr2sw721zRXl6Ds
 +du/mKltWJZ2dFgc9hP/NUj79ScuZN5JP25DmLz0AaFvVGCMmY3VVDSzl16zxQo/N0sdcQr0wd1
 8zhPxNihWZjFB9JMpn9yvj1d4yupQZF+el6CWN1CghvEARSl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7KmnZ2rUklaY4Ww1nQoQmD1P7JlAoJy3
X-Proofpoint-ORIG-GUID: 7KmnZ2rUklaY4Ww1nQoQmD1P7JlAoJy3
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+uzoKqyaQiLP
 sgZvhJGqF8wgeJdcZxjlqjZAlM75IPyscrpaLllpbIusKiZzmhU2buY2JqymGlm+rB/yk7G9N86
 IuKBtzMqGLYa5QAosn3YP5vSIn9k+gN/bAwTpru/dPw90EpXEQoZVyJuVzgb113NWFV+tAg0gaR
 iH3wJzL5nICDAx5SpJyZqFPc4oFpNVGaRxW8nkUjFqx48EkQgOBEYp1E4k/jjU5wya0dmr47qlg
 wfPI/JHx6fHmgAAQI1edfVBGUZComFKmhHCF7BYBiI98Y5xx17KR8vWxh7MsaDHEb20W3LcfBQP
 SvhOZETBftJG9L8CqH6QHcuBKGCtABMwOF1i6x7auvQAtyGQQgE/ZcPmbiHr8rtBKebizKVJ9Hw
 D63eCZ7SdexYkJAqRS+FZj96kSB1JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /* -----------------------------------------------------------------------------
@@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 			     ENABLE_PKT | REPEAT_PKT);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_check = it6263_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

