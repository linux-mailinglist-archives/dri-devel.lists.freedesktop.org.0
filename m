Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B552A6D971
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 12:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9710E2EB;
	Mon, 24 Mar 2025 11:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnZsxhrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666510E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PLQa025871
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xs5rT/RGnzQe0TKC8aJ0U0f62LNypMaSbN5UiwapTF8=; b=fnZsxhrJWHOJDsOb
 BEl0L6oQxcSVq87aEnmkJEl/T74HUpNOfHcOC96nx9r9O6uqBSudqhpApYdoIp2d
 HzLNMhTTf5X4t1J3/0Nqt82p5tv4udEQvNheQrcy7KO5RPgTXYaB7dNPxQe0qPPb
 qNWTHbCSFTaIFF43fBS7YbkBZXjd9LUqhJB25886uCOARHNdEoSVNSYEIk9yq10L
 qq7cW4x++RekV0xbPlVQhst+m3CIrYli8pfwl/KPmHA8z9h2yvzz6YmP21ZktnvC
 YCCTlpX5RbrHwWVAjzkUrAexRNjWD7Xg9QnZPFLdd9xDgVzwSWG39J6BHWpSd41O
 HH2ArQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnmey6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:51:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ead629f6c6so61936556d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 04:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742817098; x=1743421898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xs5rT/RGnzQe0TKC8aJ0U0f62LNypMaSbN5UiwapTF8=;
 b=cd/o4bd4P7GY4T9yPdxQ7IBLSOL2oiJz/14WKSiZU3+ch/vFA/tjzNPOuucMUBVBMY
 H5TtE5ZJhZNn+XUl5qyD2MMb0NzTmt7KYKman9ucK3eb5xjT49No/tWWV+/tQOXvEaXm
 i0eSRZuKapVhwoXPyEpTZRbmg3zrIFPXXhWb0Wz9a9XwV+WiyxtpYmfqeSDgYOMJraaf
 ZvjhM78u3W0GcDtYpzSm11NooXytCLU+qoWujPb/k+qaa/487eAiBHfN50drqiCbN0ZS
 V/aeKNO/Adcw6jMpTeEEO/ef2gBpo73/a/TLrEksGHUsqqnK2rhQExiunZoFts5h/XJH
 e9GQ==
X-Gm-Message-State: AOJu0YwaeeUdDUMsHlVRukF2iB2OsKGNhdUs0EF6VQDdF8gLpnfHk5km
 VzL9kRVLpNzneRG4nKPbnhsVcpQtFc6oKQRxWIrsE1fvitRX65H8WSPnd446KNg4Wv19pY+6/Qp
 +yThi9E+0ASbidkIJb25pRCCI9wV05n5pWOJoLjgAWYUoBhMdsuydVKmLZ8OKth6FAAs=
X-Gm-Gg: ASbGncvnD0NGtDa6bePprlOq9Qhd6ukTVW9G994H+wwmwbvlRrcP3B2oDk/WqGhYXHs
 CU6Xxk96Xihjib+FzbuVNZ/HcgwM3qnn+bMWG9jctsczIOQYVpoXX/9sg45ZCr351s3zHDq2Fke
 spuOWDhIwEwoSV7LBacroezz69QCi2oGChDDqQzyr/8SiO8zqJxqZqRQQp2m7Za8cmg1prUjR/Z
 ZGD9sHS5VGBFugERoIppmMvcRpst5K8++Quh5PEk1XsHcKk/0OTfHfhCS6tKjJFqJUUoiR5CzRQ
 sDgm+1tQGq/E3SrhBk9w7eO7omlNu1SNF21+oMdJ9YazRpbA25AAow3tSgdGxIlnMi56kLdoPnP
 LHhnghZBsprExk9LZHMDwngxQGSpm
X-Received: by 2002:a05:6214:1bc6:b0:6e6:6505:ceb2 with SMTP id
 6a1803df08f44-6eb3f34025dmr231784446d6.36.1742817097278; 
 Mon, 24 Mar 2025 04:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBwQw92ZPyWINOzWzui1m9ITHbL+0DAXpzT7H8qy4kqRnazAtvro+a6KHCt5kCZMxuG7ILTg==
X-Received: by 2002:a05:6214:1bc6:b0:6e6:6505:ceb2 with SMTP id
 6a1803df08f44-6eb3f34025dmr231783666d6.36.1742817096653; 
 Mon, 24 Mar 2025 04:51:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad64fbb51sm1142907e87.135.2025.03.24.04.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 04:51:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 13:51:23 +0200
Subject: [PATCH RESEND RFC v4 5/6] drm/display: dp-mst-topology: use new
 DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-drm-rework-dpcd-access-v4-5-e80ff89593df@oss.qualcomm.com>
References: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
In-Reply-To: <20250324-drm-rework-dpcd-access-v4-0-e80ff89593df@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8924;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lOAwM26QhsV15lYFaBEeUiZtWiwv6AIfNojc3p1iTEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn4Uc4CsdT4oLgNJXuWiGeTgVWGCRmDOsfwjDJk
 MvUg+taZHyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+FHOAAKCRCLPIo+Aiko
 1eUFCACOQPm/Ap8Q6wgW6g+eGGeGORthONobvqpz7PBMULuq9yKLbbvaXrh51tL+JwtxWfroe4N
 yuPiA2x0oWuQAyAo06ZIP5BpvUm3pZowocYjyTqxFwYQ2mPcJkkf2sY7DXwORxZylZvxwuCqHdl
 tFPH+dJFVGrSeqlfkRe/W26MikHJ3B/+usY5S4oqY4FwE6hbORlWZBtuTPn+GEQGr+k5IQhNZ9y
 X5DCMwom8OmoAs6U7Ut0yZXsdCv8sPDbb4RgbgTirLxyUsvBp+SuA9Ef88pxfkluMCCRL1ORuua
 l3ifrWLnGSG/4z8TqdRadnRZfuGIimIbwmjXjWOZhmYqoTFg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e1474a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=CIugonsnW1z_eXyUCzcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ErX2ZwNdX3QQ5dsLJz4GEWrl_5BV2eym
X-Proofpoint-GUID: ErX2ZwNdX3QQ5dsLJz4GEWrl_5BV2eym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240086
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Switch drm_dp_mst_topology.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 105 +++++++++++++-------------
 1 file changed, 51 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 3a1f1ffc7b5528b940485e7d96b1913bd85b0153..de3fc6090c906efce3dbaa8462d736ebf9094b34 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2201,15 +2201,12 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 						     mstb->port_parent,
 						     DP_GUID, sizeof(buf), buf);
 		} else {
-			ret = drm_dp_dpcd_write(mstb->mgr->aux,
-						DP_GUID, buf, sizeof(buf));
+			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
+						     DP_GUID, buf, sizeof(buf));
 		}
 	}
 
-	if (ret < 16 && ret > 0)
-		return -EPROTO;
-
-	return ret == 16 ? 0 : ret;
+	return ret;
 }
 
 static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
@@ -2744,14 +2741,13 @@ static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
 	do {
 		tosend = min3(mgr->max_dpcd_transaction_bytes, 16, total);
 
-		ret = drm_dp_dpcd_write(mgr->aux, regbase + offset,
-					&msg[offset],
-					tosend);
-		if (ret != tosend) {
-			if (ret == -EIO && retries < 5) {
-				retries++;
-				goto retry;
-			}
+		ret = drm_dp_dpcd_write_data(mgr->aux, regbase + offset,
+					     &msg[offset],
+					     tosend);
+		if (ret == -EIO && retries < 5) {
+			retries++;
+			goto retry;
+		} else if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to dpcd write %d %d\n", tosend, ret);
 
 			return -EIO;
@@ -3624,7 +3620,7 @@ enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
 		return DRM_DP_SST;
 
-	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
+	if (drm_dp_dpcd_read_byte(aux, DP_MSTM_CAP, &mstm_cap) < 0)
 		return DRM_DP_SST;
 
 	if (mstm_cap & DP_MST_CAP)
@@ -3679,10 +3675,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mgr->mst_primary = mstb;
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
-		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-					 DP_MST_EN |
-					 DP_UP_REQ_EN |
-					 DP_UPSTREAM_IS_SRC);
+		ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+					     DP_MST_EN |
+					     DP_UP_REQ_EN |
+					     DP_UPSTREAM_IS_SRC);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -3697,7 +3693,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mstb = mgr->mst_primary;
 		mgr->mst_primary = NULL;
 		/* this can fail if the device is gone */
-		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
+		drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
@@ -3763,8 +3759,8 @@ EXPORT_SYMBOL(drm_dp_mst_topology_queue_probe);
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr)
 {
 	mutex_lock(&mgr->lock);
-	drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-			   DP_MST_EN | DP_UPSTREAM_IS_SRC);
+	drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+			       DP_MST_EN | DP_UPSTREAM_IS_SRC);
 	mutex_unlock(&mgr->lock);
 	flush_work(&mgr->up_req_work);
 	flush_work(&mgr->work);
@@ -3813,18 +3809,18 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 	}
 
-	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-				 DP_MST_EN |
-				 DP_UP_REQ_EN |
-				 DP_UPSTREAM_IS_SRC);
+	ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+				     DP_MST_EN |
+				     DP_UP_REQ_EN |
+				     DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	/* Some hubs forget their guids after they resume */
-	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, DP_GUID, buf, sizeof(buf));
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
@@ -3883,8 +3879,8 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		*mstb = NULL;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
-	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
-	if (ret != len) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, basereg, replyblock, len);
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "failed to read DPCD down rep %d %d\n", len, ret);
 		return false;
 	}
@@ -3922,9 +3918,9 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	curreply = len;
 	while (replylen > 0) {
 		len = min3(replylen, mgr->max_dpcd_transaction_bytes, 16);
-		ret = drm_dp_dpcd_read(mgr->aux, basereg + curreply,
-				    replyblock, len);
-		if (ret != len) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, basereg + curreply,
+					    replyblock, len);
+		if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to read a chunk (len %d, ret %d)\n",
 				    len, ret);
 			return false;
@@ -4881,9 +4877,9 @@ static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 	int i;
 
 	for (i = 0; i < DP_PAYLOAD_TABLE_SIZE; i += 16) {
-		if (drm_dp_dpcd_read(mgr->aux,
-				     DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
-				     &buf[i], 16) != 16)
+		if (drm_dp_dpcd_read_data(mgr->aux,
+					  DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
+					  &buf[i], 16) < 0)
 			return false;
 	}
 	return true;
@@ -4972,23 +4968,24 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		}
 		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
-		if (ret != 2) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_FAUX_CAP, buf, 2);
+		if (ret < 0) {
 			seq_printf(m, "faux/mst read failed\n");
 			goto out;
 		}
 		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
-		if (ret != 1) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_MSTM_CTRL, buf, 1);
+		if (ret < 0) {
 			seq_printf(m, "mst ctrl read failed\n");
 			goto out;
 		}
 		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
 
 		/* dump the standard OUI branch header */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
-		if (ret != DP_BRANCH_OUI_HEADER_SIZE) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_BRANCH_OUI, buf,
+					    DP_BRANCH_OUI_HEADER_SIZE);
+		if (ret < 0) {
 			seq_printf(m, "branch oui read failed\n");
 			goto out;
 		}
@@ -6112,14 +6109,14 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 
 	/* DP-to-DP peer device */
 	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&immediate_upstream_port->aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		/* Enpoint decompression with DP-to-DP peer device */
@@ -6157,8 +6154,8 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
 		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_dpcd_read(immediate_upstream_aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(immediate_upstream_aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
@@ -6180,11 +6177,11 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	 * therefore the endpoint needs to be
 	 * both DSC and FEC capable.
 	 */
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 		return NULL;
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 		return NULL;
 	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
 	   (endpoint_fec & DP_FEC_CAPABLE))

-- 
2.39.5

