Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E13B3433B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AA10E4BF;
	Mon, 25 Aug 2025 14:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn7sQ+IW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2AB10E4D6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P91EF0020343
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=; b=hn7sQ+IWfBj2jg8E
 HMgZxSbjSW88vsHP6pfIWCVgFSP6ELlszyyLF6DAzUxZNXSLxIoxSu/X7QHEd9cj
 S6Xedbwbe3aMAKRqBBcM7gGTnb2fvNul/w4iDGd+/icl/7TA+bf1ZOFfJ426B6xz
 D3IbU0jwHyneq+sgJyF6GHUAnCEo2WQzRonngsZTSEeG9rbUbW0/31d4MmH9y+uF
 aWkoVuT3X58zGlOm85m0GCeK+OQN05aiDj/6oy3w2wqfnTx+SnAy2O3/ugQr3DaC
 Uv7rbphZshuRd87s88YVgwRzQ0HzauZQwLrjB6inOhivHZbQHjSRu2WsrztkxgAd
 lhUdzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77053dd5eecso2902803b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131542; x=1756736342;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=;
 b=Z/HZF+uovd3bryzNtCiruUvY8/92xAKiB211sGB6A5WFNTRhxh5L9+o6cSdSkrTKrm
 wj2VRHne1pCBs+KoUm5hZizDX6O7+Uq0jnXpWC0rmDCjAx7yOpwAbtdVvyocfihRl3CD
 4KjsarxDCNVxXVjgJM+dC2KAoRpTFbnuaEKZ2VmTy4vxsnr27SiU8WEYboyZ8vr4LF5t
 A+OgaSbtIE7uoOwq+mtoINyxE0t7+eN+JfXG5j16w4sBAYCN2YYJY3KNZAvECwrfjLFJ
 AGOz8mj1lgXu6t/jdiD7BYPGVKZScwvp2YTrPTsTYF/vijrKbxOXHQ/kHviI82GqpWb/
 S2fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUwT5jGRBknUFAREj5UhQkdNyX5QNZ99WyFHN2wDNrJfuWrUPJPQxaxfOAVxzp5jn1kBgP4PBE7oA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3YYnDPVJ/jEEiN7hHWwrfVLRNhHj7/aXMDWOFJlUe2aRYKRLl
 N0MMTYdYJA5migOJu3RY5ThHwDaIN4C4FhPZTDsfqsQzhLMcr+9lmFT4DTEPaOTTyjo+NZJYtbS
 198JpBKh3jnwPsUf0PON2bbluBxBTl+tduNfV4a//0mvPLxDKXZbazGI2la9MMdC0zzh63xo=
X-Gm-Gg: ASbGncvXCq8/Q95ou5Y6xl08CyU+JdBpFNxu+zwUz1TWtNnNMPvY4b5NxQyr8LdPrpk
 Px1UkPxARo0Bpjsjfnyg+Sx86wAG6y4kCIvQSpTQDUB9HcHD9BioE3zlffLHD/fH4qK/nP8QoOR
 CDny3GHvuMWxZ8FmFViMtLxoHZUz59iqLQt8h7rOcTTPOoA/p7KvFmFTnkA/yLtgFnRgkU5EJCm
 EoTfoLuEkSl0PNPjYRecffgzxi3lhF0j6db1/BnwAwu1UaL5qi8Bn35GShgwWyOHLcrFyRIIveg
 m5k5Du24S1pwaK97RV1b6YT558BWnyGpea2AiiRBTG3Bky3QmhTI/31Hozy3e8SDqZL0Xhc=
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-7702f9df069mr13576461b3a.1.1756131542171; 
 Mon, 25 Aug 2025 07:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSPY1HtSJ8tKKojzOATDlJlkBa+IcBpDR1Y1au0tLWU6lqQsO/HxxDw/4m60LXZ6fiBBdK9A==
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-7702f9df069mr13576414b3a.1.1756131541613; 
 Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:13 +0800
Subject: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=2282;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=TSQ0bYxvwSdSGTKkoBYhDKBWe3uInELiHmXnk72zRV4=;
 b=duMBgo0ElFERIwAsvUqi6eTSil8TrCpytGdMUtwvdCYzvbKFkhAt8aEGrEl9QJIdII6AXu1ut
 3dsERUkZHWDCiDyny5YNcGzsI0szfwwtzR8XmZ/2ISS4ozrDZKG7WH4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX1mwYmZdZw96Q
 UCzw6wtmZQhvpoWTutyVYDajSmABIIZRTfkoyAcXcV5NNP5BtGbcdqMoz9f5vDeGgt7KcAWFekY
 yOkG3KQ89saDFw+lCxDjHUn1vLq9n6USn9/tv6dNb1fDimjZgOnI0ory76GRBGxAXMaLnq+/Y8K
 wLCbG9Vb42swUSPYuTmPhr62XxPykWSORnovSvLiDXRLBB4cON1hEfKgFdz3PndmGJGK9nMVa4n
 2Xfk/ZaNhcpiU0aSjSuXbQyeGqLCJBtJULRWHc+lcy76gZ4w/IZjbaTngEoMexo9KAGMEGbn1hK
 mGaXHrlBDKb9fLDXa/p/Yxqwg9euKjUT61EnLMXan1lmSBde/M5kfQoOhxYlritGv1YRu01+snV
 VTEoHEru
X-Proofpoint-ORIG-GUID: vIGsU6WxrQepLqCViItb3KemPqYR-6VL
X-Proofpoint-GUID: vIGsU6WxrQepLqCViItb3KemPqYR-6VL
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70d7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
+			       dp->pixel_base);
+
+	if (IS_ERR(dp->panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
+	memcpy(&dp_panel->link_info, &dp->panel->link_info,
+	       sizeof(dp->panel->link_info));
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
 
 int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

