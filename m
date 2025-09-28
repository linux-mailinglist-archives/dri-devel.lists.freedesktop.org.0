Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33CBA6B0A
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B314610E30D;
	Sun, 28 Sep 2025 08:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bi83zbQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEF110E1EA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S8Nvdc029941
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=bi83zbQB9R2tgYEF
 wirUexUwjhpFfFY0UQk2OKbg0pVMZFaIrb99grgYfcAzxPSvuS60r2S4jS79P6ew
 0R/VReOT7NbN0H3G1n3K7mpCYL+XKXrWwaN3rzMQOEU8IBcy8wn7MmFRFJX0prEd
 yS8hCBa6zwhUIsrUKBIL26uwcTuQNcTJPuPlXnjQUPd/nL12+gJjIvhchXBf4MfS
 qQ2r+8Pm/T+XAhF1qOHAjhPKHEz2xKzcVJ3sh1GJVFCkugr41iXG51LxFmyjQcOW
 lhG8pk855rGtpRkxEJgf7NhWlCLGoaMPr6nXyhD/uF/3yDLw725E7DkNHD0p5Ecu
 88fO4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tjcuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso1951561cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047912; x=1759652712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
 b=TAcFfxrw3GrqJt+2mc1REEF43TblirWIy1m75iKmmaAb8ZEoKlk5pBcpHifCfNcB3r
 DyScN4d54/ssI05m4njPX/LlxImWKbFhX1+PCCHv0Nuk4ddFrs83/beemIH49xp/P3bd
 VovO8bPPOmiMUj3yZoZwNGiDbBBeJOm2/fh+076k7gUbY6e620TotP1tVSToiy9LQxz+
 p11K96+7Qm1mhSlkMNlzX2AlWffeh7D1Hb41yD8fmcDqMEyKvAmWBhbdkDLhTuLnRXE+
 2VhQeSB0Qsl4wBGxP/DYVU+sdheSj8VD6aQvL41U2sKxdFFjfifC8ISm3kAPlQ+fGu3S
 90iw==
X-Gm-Message-State: AOJu0YwhN2DYCfg3EpvfyY01lyMcKvQE3SoqXnzJ8043OY4xsRYXyLAZ
 NBE3VWI9U5OAI6KF8b6zlJKSjODwWzl7yf9SI4vJki6SBRP6WthM76xEEXP1G7m41Dt7OqzFRTU
 YxqPQWGXEOxqFAqgA3nT6DSwpYegqlX8wKqmQMTaGyTqY91lHHgSQ4oWFXhf+Ff0O2k8IM78=
X-Gm-Gg: ASbGncvKownBecMHorjubkhvt2OXScyCxI3k9EqJBWLbr1XrsI9OJKaJo7PqWRo0y3t
 tRqMTq9WoQakjYpYRuUY1ZKsLVu9xtM91dkIJSmcdgh/vedj30Y9YGtxRVNs6HMrgt56IsxTY+h
 I9G0RIG8gVCOVwUE/lK72bFedsatFh6e1UdagNHPGFDJmlpaq9E3RqxQsEnCBJ4eymVzsJQhWB0
 yJalG2a7Se4GLuCF919f3ioMdEJyofx6cUUeAxHRgPpKDUUkU/g43KLxT3JFTtk3Z6/LO1hF5Tp
 D6UGpAQ14Kn1dko551kHh8LSFj5GIK36JpJamU6SWP2YObs6x3yph9vudezTjxM+VVZkG9EQfaR
 X92ash/kHHsZyF3PnYvSnYH0HRUIvkpxBUuOqfLKnIZlHDOQvrIRu
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id
 d75a77b69052e-4da4735507fmr196313911cf.12.1759047912074; 
 Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsNIqfoWB2H+g3E1uE7PflKn+OGU11bpC3EG4TSX+tOi58fQrR/+PvIxxQkzsDoINK0iC3A==
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id
 d75a77b69052e-4da4735507fmr196313521cf.12.1759047911446; 
 Sun, 28 Sep 2025 01:25:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:50 +0300
Subject: [PATCH v2 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-5-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUEX9koGGtFlB4dr8wsaZ3M2TeNtH/F0ivG
 Ao7oOkToBCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1TBzB/9xRTCFLc/ONNr3oj8OOXRouw+QTYNOU5f3JvtCOChceyttupikcLtdeTwZUNnQ+LumCqT
 ile+f40xQ5vMYzvLlUmK/fUbPKvvn1ia9+k2z7R68rQDaok1yArO5t2M2U/Uf8yPEAqoHzA8EUz
 6YqzPUCnwBfY9zmldmLJfigddiCMVTu62ZV8uV2xtDXmlrDncAvjqgJb0swzc0biTVWhFqJVjmu
 oxMVUv5+94HI2TQnr6d/PdGBO0hh13mD/NANYX6ZDy6I0Mj3/W2mz2godBTL/jMTCBGzKQUI/62
 fzmbq0BI1/SRZVAezrileWo2gMjGLedsHYZbKl8m09Hph8sE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7MBLXdOOUWSr
 p+VcgIgQgmwI9obk7GKrhDP63H0BC4ifnnblphTBq9j7t4FrFfpC3PNlD9ym/mlm43nrip+l9PN
 T2IMKtqfBB/PQ3wfEwfxs4NsxA0p4O9fPAxGeoDCwnMQijfaCtPhrDbGFNN1ok6NYuADMd0F2ol
 zDjUftkjHUMF1KbEux9NRwoqvAYc5roO1PBr4Et55VdIQJ8PVwkq1i9YJM6OsMDFK+RKsb9+kLz
 Ddv4VpAscRhwMRpE9Us4ybHfxq0OHnKN3l6vqxgkddCTxsTGWF60WgKfGG+ikWc7uFUXBmZTNKA
 VrzuEtVyhwAvo2Py4o6dRJtfN05JWZ3qWEvO8eEk0j4SRsdCt+FX7ox/d0PpdcSzzyKCVG2irpQ
 aWLst0eVYxVk7o/vpTJgwErxCn53tw==
X-Proofpoint-GUID: LdzF5uQ0Kde7YfP537ZxG-nZVMlSllqh
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68d8f0e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LdzF5uQ0Kde7YfP537ZxG-nZVMlSllqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a77e880b7f58403691338ee8c22d24af570acbf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -935,7 +935,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 			       PKTSCHED_PKT_EN);
 		break;
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -960,12 +960,26 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

