Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D0BA5736
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 03:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D3E10E137;
	Sat, 27 Sep 2025 01:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdIx6sZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8946810EAFD
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWu2e010158
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=LdIx6sZj+ysPxWs+
 aN8ZqXfUmgPGSOE6GN5IzW+BuvaToG7k1rUG1kxVNaxMSak90s8eOIeyZRGALhtg
 NrXV44rRYOIrzabDeXmEOOplrponsj+F3ZOUZ/TYElX4db5Wv6PYlQbHpi/AuLXA
 wsXfGaIyOhwXJsJnazyCBiqHsIji3scs06UJlu1Pz1ahLz06N2EGBe17F7hf2HW0
 INHvVdGIi7/GolvWKG/FWC4QIFrR5TYDkt36LVIffpTPO4GHBJd6lDZT5xFyMF1R
 mR+E+DsZBd0DCZEL/1FcMlfOhiUHnzOJptbV7xVmO7rRnazUnBteLsSVhcJzEyI2
 C9hfdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwj5m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d6a41b5b66so65063671cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935101; x=1759539901;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
 b=tOHfQeAza72a9HolDQVNnPMMbrpec+Bu014SwYDZN39yp7SZNvUUa2PtfS4+vDwZZh
 Rcb/H2Jfw+teM3dHbeuHdiFl79FuAtJR2WmcOdn2dpa2a4NaHCiMR4oziraoyFX6xAG+
 OzsFzEbta5F8iQqus5547OOblS0r4yX2YA2ahpHkDvyOMtie2iJ7p31W6k/XjhAahVdA
 O0OaMAQ+Dp8mI3SJo5REWbuZq6MYvJb87PiZPkVnw2Q146+Pv8271E62RwxaNeCMNBxG
 A95FO0dklkj/EzCrbW59cH4n+clfBwIIgZLggyuPNemGQYL2b6CoswHDIZ5LJfNlPaPk
 k1rw==
X-Gm-Message-State: AOJu0YxZ6SGxiWEV7qfrkVZwPTZxixrFBJoWJ3VpoiNRcHS7HGL7S/z7
 MFgd1iH22Y5OntXcB/jGwBn84luE5ZBMqReNMIwiPM9njYKElWVTf5u11OQy3FkGz9FazQfL8aW
 jLKALmQwlsnlIyMdDybwsza571kpQbk5I5VmWl6I4fE+yIN5aQ/Gr4rb5qFCpSJmEFZBkd70=
X-Gm-Gg: ASbGncvGrxv6VPLzyljc5ChahUWlFMWdwNEnKtaFTZmmwg3JPFGm0qpxHiAVIwZDQi+
 rGnaYanbSA8HTiqt6/Lf26BXI5yxhmIAE3A7FFmfXyy8J7u4iJFi+I9VxI0Igx6119uzvgdrieS
 NGKH/vMgJL/0wzNev24lP4O/Xvn6DJcKAiqBrAihhh8RQ3jJ9xV7kW7ep126P0dowTWFf2IT+wd
 ACDWBF7nImaHgNEbaq2HbHK+RE7v3Cvj/thZcay/0BeG9vOPFa8DBSZEPFv8rpvJ5ylniTFDZfC
 KQjFj07wJjwv9z4rrA6BQqBfC1HDwhDeHOmHVY3Qv6V92cNGuQ2qiVKjfLp1K3pX638J2gm3m+3
 /TRRkDNFvLfzTNyFZQ5JAyGjWk6J6Z2T3szclin7UHHQ++5slbqyS
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id
 d75a77b69052e-4da4c39b711mr133233261cf.65.1758935100664; 
 Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLqabjcVMfWczs/hM1RvjoXYZ24c8DWutZ4s//N20by1dgwDTIo6bz/phU73Cx2EjElCUJg==
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id
 d75a77b69052e-4da4c39b711mr133232651cf.65.1758935100057; 
 Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:35 +0300
Subject: [PATCH 6/9] drm/msm: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-6-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
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
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggmZpcbiYkQjpVkexHgZEXDSvw0DXxRboAe
 D0A9gHSrqSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1feTB/0YC+4rnr/Hho6lqvJBXm+BTduk/QVw+LVH6sijEBUHa8/pAnfAaeAOONR4ag7YUWkgqQX
 sgYuRV8cKAwLMlemd/JbVaBZrG/o9/asI/Htr0NYQ7+4VOs05tz6Dsn8KdQyvOYmQAkgK8Iqd4D
 ZcHUMCLjgTxgzcqwaBQ3dPdBKq9WyqgKY0F98RDFCXyVyrihsR8FbdCEv179gCtv1TrW+cUkfaj
 NtZdhMr+XUBpzAWVE7lE+r04YwywRVSUR8Kqq1/TkiOL8Ywc9Er7RyXwyYmKZiLzjDuNA7m6mfK
 lvktPPCBln5IT5K/Oqv+Aj1Qi29ArDZfpGZ0XxlheSJCAr5R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: v7y_Rb_FmdwY_02j5DEzhuVuUILlGzW0
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d7383e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: v7y_Rb_FmdwY_02j5DEzhuVuUILlGzW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX/KpUElGgdQ8g
 2vPp4L0MQsTspsibp9OrTb0AthKKU5ZfgZqc5YvLNeeKL5Nr60YgFWcrGKd0FeWOJ9+9YS/xdhf
 Ymi7vdjiA8aluFfNj4V8RHLBUet5JUDn8mspW3wC2lDcktPnwB+LqTrZ5vzp6MfhfPZzzJlyujN
 Nzrzcs9WTbDTB4G4e6Lr76tREI6NgD6V4vER3DJlXFXuRf639Jy9szstjgHidQ9xQxW6WsX5vhD
 Y+VV+ctWCbGzrnlQUBehzDW63doSV9bKqou32Ax8Hqp3+aeH+dodapQDULOV7nlvA3SRxAfDG6b
 +3dLyvvmMkIdHkiHr5K9vZDAUeHSxJg23mgQPa4jc/8oX0ac3mGW9JI0wU02xfDyuL+IwCri/kV
 bHZT8O9yzH904buQ6do1n9vrBnnliQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

