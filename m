Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B0D22D11
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C7110E6C6;
	Thu, 15 Jan 2026 07:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbrCK9ZV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8Mldktr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C122810E6C6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g7t01991898
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=; b=XbrCK9ZVG6sPso6b
 podLlHPXhlYsskfIWbGb88R2vd5i34c+U13kYGtKjECK1NXj5+Tidg8CyyIW+k16
 yJLdnpYpoo+r+Bo+gfLagCIV/7GTjh3Ul0PBl4VICbbTUpOB7dDXHL4ONu2sMQzn
 NSt0KZNQZ+usczQ682TQf4C7+NOrJI2ucwou221+mVDRWxBJxp5AEb+sTDQo81zP
 x3yaWndkWenG9DMA0XDGFMHttnwxHYbUJgi/JPwArzZ0hf2O1uCH9HssdWO/OoVn
 aKeQ8ppktB+Ja+gnQzvTr4s0DxTM+UcwigqSxm5+Bq65BzmiWUX65ww9lL0NRSja
 YO1PAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbu1cb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c53919fbfcso175760585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462160; x=1769066960;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=;
 b=b8MldktrmMfopD0shYFBPqX9iWVRXUnFIkOLbSM+goaetgGE+sXZ5EYcB9Fcj0agnj
 tcw4yQ6uoIFqwCC3Lx6zAKMF0MZeY90x2AUWsrJgDIe2TmYTZNFkS9c/okze7enOrgBb
 csFm2jYfp9hqWxthDxGxHKGtknlTrj+2zoxLaHNQhxvugDiX46SgjfegZ+tnARBzaOP1
 TnZWlc4EY1O1nj7irxs/4waGyQPM/KQyy+Dfm90K6poKPe5t+N3bwKDvuXT2IWuul+rs
 jADLLwcRvCSd/v9HmLGlKRJTJTvxJMRL/2AXMceLhSHLfuYA2aBuhBXfLnkHNAhIt5lK
 lPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462160; x=1769066960;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=;
 b=fcgcPzoUjxxiU8Z6JU/j1YezsKPJjvDjaIqliXVELG6AssXXj849kzTk0EHIBeu8sQ
 CfnpRxRZc+Z5MVOD5vOSBWyvR3cqymhfRxebf0ydSnkzAIEckb9okLxqHFbVXHJm8btj
 sXUq/HyzXT0fqp+Ds9yIxHXx5yFJoZ9jsxBwYsTzmLlCA0BQNCQze5fTEVGfThc7Czc8
 eibhgZUjNxELjYcFPKo94MryGnJucL/vi2EMyOK/MC824AkXBvNaG8loiGuQku9cEGmM
 CS50xXCqNdzjbZKQuXBGN1M+yt+nmeK3ow1o1xM+qetE/hstDgsT3KYwJb3amffyyBX6
 Fung==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1aCNo8yn4fsbvhiNV0BF4crKTnN1uTbjDpxH4kcQ8pyKuqj++VpH55LEZhJMPoLinx+oZkk6tflA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRJNpBDPxHBkV4e1UzawLTDYddiN6L4SN6YBv/3WXxGfldRQeT
 Ja7c4IP4tcZqCAXHBPCq1n9HoOe2z9KcX6JqtFLDGPldy73rZZ2hSGGO/2Mn7OeIbktL/fopyBg
 +B31yiA2fSlVse3ZZrT+FvmNY/mawxCUHXNKKK8JFZ6Ft23l9wobbcrxvS8XPhs09VudG42U=
X-Gm-Gg: AY/fxX7v9M3uOrlapAfMQb641GdInWcHjvT/Trb8KRQFIUx9jESi+j8zSzuAb6lVSG3
 8X8XKBLaQKoqQMaUCY48DsSNKrHGrcdqIejzI+L6ntnGD92/LfoPvCIjKVYrVq9hRaroRoM+CQN
 pmQGWNMD1pPlo0HDr/PntTu8vHMOKgxQVffWkdVAY1Y9E0ZMw0opgjIyR6ZwJGT7Qu4IbaQDax0
 ep3vWN1GRtMDjnYgUe5jWkNdAvqsnSsG5pjlxf/qeKDK3JTiqECi006YVdWbpKO3HAI537AqkGm
 /IKrxZCfziicc+fYcbVYutUSrM5RTQU1fyGOWr6Dpshjz2TWHkAIGNuxrtwH+x2XaClQ0ishtEA
 JMSpdNxivheEA98I0zriJuneSwuJrBBoZtsb1vxez+aUj/43Mp39NwzJ6SyBSfv5mHgbvTqNyxf
 XtvLcrmsnZCwGYFZLDKTGTBi4=
X-Received: by 2002:a05:620a:2801:b0:8b2:e6b1:a9a6 with SMTP id
 af79cd13be357-8c53168e2e2mr697694385a.17.1768462160358; 
 Wed, 14 Jan 2026 23:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:2801:b0:8b2:e6b1:a9a6 with SMTP id
 af79cd13be357-8c53168e2e2mr697691685a.17.1768462159882; 
 Wed, 14 Jan 2026 23:29:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:09 +0200
Subject: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A24Zcv2uqnzPLcAnjjMP6FyreuR3QcbbpXIfNz7XoM0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdOfGXwslW28onuq5O5NRjC09bGp2/i5G1zm7wjUb5
 fwPS1h2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiO8LY/3uaGXYzfmLf0nws
 K5VnybzAL9LMTSuvd9rpvD0p+MWzYHLlut85e67kh9SbzumxLDv8IDVPQzl7/mkLXqt/tpWrczX
 S1V/+/hmhVn5uUojZXP3sn2uZGB9I6qz3a+gxOm2xcV5wpnxo5scXiqdqrasLeHzTsxz2LnvVOf
 nC23MBO5d05SpyXJBX7DvPvy5+i5t7zIv8a8fMmXOnX7WYK9v6uuqFxzv/TM9fc2rC7k6szmi7z
 CCe8vnUydSa05LtbnnfzqfYTytbHKPx4754d9OBBfvk8v5zZld/3SwmZfP8QOnfsvBZZvxVTbGB
 M+Jvn+yL5jzqmmvfJhZ9oXnW+edcTc/zjn0/G/0ll70RAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=69689750 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ZIdwECI-nIsH_e6RROlSDegvkabJw7Bl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXw0Q6RftmXLMo
 FJ3QQOO+7NqLoDnBKyuJ2mzW8g4+GeFIUaDXwwa+anAwE+gGlavNfFGxnfXM3bu9AoxT8aQlMJ+
 n/CnYq/D1ljosIAGRQNiwzVJMXceZ0KX8yLdEcNuEQr+c7yCk40q22ZZfD2AhJoY9TL/oXMxty1
 Kae6aScXiaBybBwoTEouGJGPYycWGBGmR3W61x3sdhdv4MFQ3QnkGw8V+Q+xc4oyLG2igzHVbbW
 UpvBFpQVrrDJzFqEtFaRqIEr6fli31aL2OiYGBlagfFjgs9AxKX7R6B5+iOnIK/vDG/dcQqUZKx
 LIeUzWwjf8Pbr/gA+KMMvh9wFDh2/WGFpuonILlBfOxTGSHAGxUm5HAOfgQq5NyfztBuPUeU5wr
 nXzswdojCylCCkwm10xZWASnwT/yAZGwN6Rlku4hRBFmVP1+vrKfFTTYM1HE721m6MyMRbnRJOv
 EZkoylQh4OifVDkcgHg==
X-Proofpoint-GUID: ZIdwECI-nIsH_e6RROlSDegvkabJw7Bl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..3184066adb15 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3

