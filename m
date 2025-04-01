Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B48A773B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120A10E4DD;
	Tue,  1 Apr 2025 05:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU7+D20E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539CD10E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:12:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDKP4012624
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o6YZL2XT5oTD9JdY1E8WLZd4k+JqH1zW6qsQBJsA92c=; b=KU7+D20E5808f+KP
 NgpjbPbLXZFwqtRT2kep7hT1dLmTW5H9Lee/UHQrHgZtHTGrqPO8dslmzFvfbbOK
 x+/RcMp2M/ZW7J/U5z6qhl36QezoHP8npXFGm+fzLxriDzw/7C+vH78bdaB0Fard
 uLQg307W3SEOuMG8sqRxv5rdBZltybYEMvsr1LPQNbUweXQABg9yswfLrgb0Cqid
 FbC7v6rN4Dg4SsMmVIkkEK0F/B5CbWp+xgpYHBKyeetBgEBTZ+WKGhNoiNMBXpN8
 zbmmJD5eKSpxh3iSYapclqhfzxBsToFITqoKioLxXXX0fViF/O8VbNc7MhVsST+i
 R4eOdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjpe8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:11:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c53e316734so965087885a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484318; x=1744089118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6YZL2XT5oTD9JdY1E8WLZd4k+JqH1zW6qsQBJsA92c=;
 b=a+yCgJt0tCUpsYQoVZxlXHEsLAzqtluAzk3uu8Uq9nWzC9yLc+GEGTma4E1yV5mwKm
 WqlrkSJKqG0TFHtzO/LeGl4RyK3/hQllrHGRNXY2gqtVioDc1vvWhAoVooeo12Xq333C
 pt8Efq+s51odKwdQ2/OirQo9rqH0YQhTP7y40he6z+7cG8SPop2pj0ztposqEY8dmFYm
 cwz7VDgHXmQv4OieMxDrlm7Zoef513BOFwmICjNvv7Xhug+oFPomqek+iTV7X5ygqrkI
 AI6K4ZYFJdIqzc6/TpCw9fZ9Q8LmA6ISfrXbRTxGWATMwMlEAt+Vqf/v8OnEurjwMIPS
 VP9g==
X-Gm-Message-State: AOJu0Ywm6wWUQsIjhQfrueayZBrxWLdFXqXC1JVrgrwjXhs13n2VWKfd
 Ild4lzDF6eK0g/jEUdySTsZuxqnkDa8Lsb7Q2//PFZR8bY8onCIUZ2GxTHXEipGA5R6hklCV0/8
 aQYHx/ldOt6J10FheX/OtBuaYGZ3A7n3qotoC4R+pf6ob32hmPIA9nkFTaWTLpkMKaFc=
X-Gm-Gg: ASbGncup7aXVRvcM/p6b6ggiFjGt6Na3mYdRuzprwwP2gkZFPTT5ad5rmeodD5Qi74P
 KK5l3bd7rb5JbQ6ni+4B9Y8xvYT+zdh3q+IkQu+sL/inyzJY5B0v6hFvMCGCXsvw+aNB3bNLg23
 BnvoVRF/bDit+Ggc2QnF6KFmRllhqs2ec26Sjo++fEzFM9H3kC4fSgUKOjsbBIWxmQrZLM22awD
 eQQ2uyAjDPBoaKvtGjbc3O+07GA/e2ZdTbjPkjZvSPFPQpbBIvLGnWX0FlxaI5aMTxUglim57jU
 o1XEu0pJSACO8afjmKANTtRByBBpmJ6iczvGL04YH70lTDoAoCNhpSuj6SJJNCcuwAPmw+tO5Ln
 EDufbs807nMkId/M3/ZI2y8OLOjvx
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7c690875522mr1892741685a.43.1743484318347; 
 Mon, 31 Mar 2025 22:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkkyizkr853F+xZWRcueqn9rSKTA9DxTtGQrKq0tW8dXyPUtTl4nbZ/r8/KPTZYprk3ktRxw==
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7c690875522mr1892738885a.43.1743484318048; 
 Mon, 31 Mar 2025 22:11:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:11:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:35 +0300
Subject: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oOHLXQ/PS1QWkADzzpFvezZg/SQH0pidwF7pgTKLJlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQTU4MLspe5vr5E+cIuZXf5/aZyt03r8Xtr
 XhgS0FtIFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1VQYB/9GP2loEJeNChEDibweW7b8I4wmpDKXFgpsj8RxeJIBeBtu25iwzRmUaqfJHSbXL3O0KpQ
 VO2jff+Nmbppnt6MfZTXE/h3K4PpitqKfUnNqNR4Q1as1gcXR9us4WjxqoNdFNcKXjs4aj45Has
 vEHWRq2uV9h4u3MgmCdnBV17mLhqbIkurFSXG97KoY1FZL1bTZ3v/g/1QkTNlzyBSLfPon2MIxj
 CSvbitfJ3xjpftJ7Om+976ZQN+HOrO3a1BdMyf4Yq0qy0xqkCTxfyaeiTN66rDJdO3KOvdEnCgA
 ulTL3euYtUMGx5CQz0fQpwPvR0uR43i4YqwcHOLUZs6UZvk0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb759f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7AO8d6WWEX918e1AdasA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8yi-tYUWkaG3zE82rEOJXrmKVBkrrA4O
X-Proofpoint-GUID: 8yi-tYUWkaG3zE82rEOJXrmKVBkrrA4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033
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

The dp->panel_is_modeset is now a write-only field. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 82dc4b01806f9728dc882b0128171838e81f21b0..704c6169116eb2601d2ad02dc7294455ceff5460 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -964,9 +964,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
  * is false, the panel will be unprepared.
  *
  * The function will disregard the current state
- * of the panel and either prepare/unprepare the panel based on @prepare. Once
- * it finishes, it will update dp->panel_is_modeset to reflect the current state
- * of the panel.
+ * of the panel and either prepare/unprepare the panel based on @prepare.
  */
 static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 				     bool prepare)
@@ -983,12 +981,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	else
 		ret = drm_panel_unprepare(dp->plat_data->panel);
 
-	if (ret)
-		goto out;
-
-	dp->panel_is_modeset = prepare;
-
-out:
 	mutex_unlock(&dp->panel_lock);
 	return ret;
 }
@@ -1532,7 +1524,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
 	mutex_init(&dp->panel_lock);
-	dp->panel_is_modeset = false;
 
 	/*
 	 * platform dp driver need containor_of the plat_data to get
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 774d11574b095b093ddf2818ad5b84be6605c9bf..b679d5b71d276f458d905c936160f107225bc6c5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -170,7 +170,6 @@ struct analogix_dp_device {
 	bool			psr_supported;
 
 	struct mutex		panel_lock;
-	bool			panel_is_modeset;
 
 	struct analogix_dp_plat_data *plat_data;
 };

-- 
2.39.5

