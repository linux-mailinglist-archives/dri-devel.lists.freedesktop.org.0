Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T0tBDzJJjGmJkgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:17:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2101229F1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A87410E0FB;
	Wed, 11 Feb 2026 09:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHBPn6Py";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5Xl76X6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0795810E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:17:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61B97RgF170311
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=sOvJ6FChpp5sD+ZrIanvgz
 u1hubSgXdK+y6O5OIIiNs=; b=BHBPn6PyqHSKyjCaKCizbaFhzYsUUGpwiwuieH
 lkGa7derpYpGSc0fXhKEOnXbuWa+KhyWE6ifNfJOm6sKW5UJ0VojKHjqoAuActQU
 /u/oqBVY6ot7NdvS30YOdUP6uyqDAg10Qt4PNnuiOdqokTUYnnDhROJu9/2wXIXA
 HaO2BEBueC2bSSgcMl8kXQdyX7eGxUY/ss13tkJ/lg3ZdOZWXQntfrzjT8FzHS+B
 lypph/05BDviPjXOoF9aOn/pZv4eSEAO/2fvazSzxlYX0uaiLI80iRW1CyuSitKJ
 SK8Ho0Q6sXfu1JGC6ANEPz755SjDCPO0agQ4BWrZSIeSKXJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8f879dj6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:17:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ed6c849so1780818585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 01:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770801452; x=1771406252;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sOvJ6FChpp5sD+ZrIanvgzu1hubSgXdK+y6O5OIIiNs=;
 b=N5Xl76X6GmkK9C864ICq/qhUeyGvFeq983zEroVMsl9hBs5MLMuuQma3EvbOskMXw8
 N98LwdUogMCdpMgDjUwJNrdQwx57RNpB4uOLsXBpx1dJGW0T05tFPaw9vkIlDRMgb4i3
 n/SsoLnVle5Uc8NVaw5ekPpWG4wayNuCvStlauR0UbN/7hgXmMpHoH9qSmvSaYBg9ovt
 sSRxlLp13ykhxy41nG3gLrCU+W3THrg6WXpQaQUiziHVu9tcHbepVCxtHGIEx0feRrX2
 GsmG36jU9cDuKQSAPvSDqBugravEq3ilcLdGLrfzgdoqxDyze4G51n2X+s7/IuiImw4z
 Xr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770801452; x=1771406252;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sOvJ6FChpp5sD+ZrIanvgzu1hubSgXdK+y6O5OIIiNs=;
 b=FwNoArPD0LACKgGoafR7zAEPUQEvcwLAZHcIaKIhZZ0tAiBNApItWEZf3+2C2KNkKv
 Sv/vrjmSVg+ybmuPzC/AS/bGsRwIODsL+rnUspt7yScYOXVIMT3fq+F61KSLk207D95A
 aUctVEMF6er/V4QR0JBbfQA0oOxzS29Rd1oOQVNgwhk41N0wDlz5rHVlTVa4d0sCNYZq
 XVBcgOowPtnpMtE4I5zUp14qNCK/eKueCJcCWM0dDSldqxa21YD+OomsEXJK6q1YDi9m
 QzD4cOtlSWljqEs6nq+npFZf7vPcPWdqfeMcLTc3zsgpSqEsda7zsyKEvSOiDHn2SgoP
 LMfQ==
X-Gm-Message-State: AOJu0YwyDhEXgMwEMbu/ihUdV6bjHmPZGePxs4Gty8uKw88b9hbnyneM
 BDKf+jRSU43zrtK5jydcTfTgSnCJHDiOehzvhq91wxaNq3TiboIxZx6xUDqZ+U5z0Zpv+SzqSOI
 8hBOrj6qvDhlE14MXz56EhmCQvDc0GKcJvqYsPrsWaOjR7JpjYIpRHWZoOQTc+2YWE4lgaBw=
X-Gm-Gg: AZuq6aIsfVxKhKOvPQsOdDqiEDcqZe7CyMw1ns2+mHN1Jxgb2Lv8OzdiKkUgf1qQNaA
 Gczm/D0F/A2ha59/ynPOLD0Dlae2YeU6gH8iRXeiT20Ltc6+010OVtvc4OmSKp30gjfZFWZJ7oZ
 CfMr4irh1MjStmP1jyOJ2tCxoKafsaJOqFxQMTM1fnMREHfv4fr8qVJnkmS9XFsfDnlk49A1ckt
 bCw92rZnJJaluU4M5zm/WzIWZF0dzbad2wTFRSiqgNqV7JwskhODkHcCEJGSd2s6Cx3EHQtvPqS
 MwA54tkpFCb+QFDpyyYT7+uP3AfW2a1TD0SKq/dvcVTzGaFj10SSSp8ziCIcPDLf6uSsOxdrq9F
 z9/XyftY2y1IlUg47nATzjqsdPfmt62YTr0+BKhbElQrAMDg6izl7xif5qETI6w+IIY3IjPVwyZ
 NU1JD5ksX72760DvNixdrtHDLaUIhw2Kc3NuY=
X-Received: by 2002:a05:620a:4606:b0:8c6:a373:c4a1 with SMTP id
 af79cd13be357-8cb1f65b939mr646684285a.24.1770801452179; 
 Wed, 11 Feb 2026 01:17:32 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:8c6:a373:c4a1 with SMTP id
 af79cd13be357-8cb1f65b939mr646681285a.24.1770801451640; 
 Wed, 11 Feb 2026 01:17:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b2239sm213865e87.81.2026.02.11.01.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 01:17:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 11:17:27 +0200
Subject: [PATCH] drm: bridge: anx7625: correctly detect if PD can be disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACZJjGkC/x2MQQqAMAwEvyI5G2hStNSviAfRqLlUaUEE6d8NH
 meHnReKZJUCQ/NClluLnsmA2gaWY067oK7GwI57x0Q4pyf03OGmD14rhmh7JM/eE9jpymLmD45
 TrR9YgHK5YAAAAA==
X-Change-ID: 20260211-anx7625-fix-pd-792609132331
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IqxC+fDfJvofB7HPgQuP4gkjImzp0FHOVZc/ziGOgBY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpjEkqNlPFrg5gObDB7wYMnikVsy/c5WfpVDSej
 RmPDaCEDlOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYxJKgAKCRCLPIo+Aiko
 1QPwB/0QRaZ5Y3MvNrnOBPr5oIiEOcHydh5N7mz+PVwmrUVPV7AAJadnHfXMDmG5Zo0LdBg1Tdd
 FbjbntwkXXNXXeVxEtQwA7ewSeTAI3HpE6DsffK++uH6GRb2Hks/9a+HwIgCL3EQHz157EQspm0
 Mmb0rVuHcVeODiXFZD6MtJo4uzu4/KcgtJqcHnOsi/FwNHg6HHYmFrBdP2nDnr6YXNAmgc/+2V8
 z+GOTzbAn9Q1w0tpVKZOmjDesEcEB7U9UI90PzTyVXKD6Luwp5EKMEFMYQMwbRSErkaxnFmXJSw
 uerstw2lpW4TX//cyNrp8WESeLvodqzlaXLAXnCHx8ICAZyB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KpNAGGWN c=1 sm=1 tr=0 ts=698c492d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Pfnx8xPYPUE69FR7zw8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NSBTYWx0ZWRfX1cHqVpYjpD34
 DgFUOZoFhQgkxQsJ7vXb3rfgm7iFmM4AQvDoW4OpTM5Isz6qfAqXVnJJpMzU+12r8dQrzsecWTU
 wqurX7d+9nMUm8Hqetd8ACi4ZlXrSYzKUPfgkWkgLx3KZPPdGunBmrU25MCQFNk3x6a5smZP/HE
 BijemEh5OudKDwgH+IpB2gSRfMBSloe9sIFg3kQzWGQjCom9Dam/vjRLJLWw5YWNn31Tf8P/Qc0
 lSThJJdGn6tWx4Db/0mDH+PjYyjW6J7TRvd9R660BQlJShpBrXSUTr6T9UTLcOr3HzNMRkdeENU
 0cVWwxBdby7PzMtcg9ucxbsHeoO53ask8su9AkVahbMuS6C67UJvVPJwd9ZM9KJKrlJ3FWK0Yli
 tkqczHz0Qm7F4bfuHQsDgkqjcyjOssAirY2fZDUVSrO8WO2ln0gt5Mb6GI60tuVY1dmGZlzC3Me
 Zk2aIihUfQIPTUhSizw==
X-Proofpoint-GUID: 2Mh7fknKOqiSDCoTx5IdIMG6Zoq8vIAh
X-Proofpoint-ORIG-GUID: 2Mh7fknKOqiSDCoTx5IdIMG6Zoq8vIAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110075
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:xji@analogixsemi.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,analogixsemi.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8C2101229F1
X-Rspamd-Action: no action

During initial checks the ANX7625 bridge can be powered on before
setting up the Type-C port. At this point, when
anx7625_ocm_loading_check() checks if it can disable PD or not, it will
notice that typec_port is not set and disable PD, breaking orientation
and HPD handling. Unify the check between anx7625_ocm_loading_check()
anx7625_i2c_probe() and anx7625_typec_register() and check for the
presence of the "connector" node.

Fixes: 8ad0f7d2e6fd ("drm: bridge: anx7625: implement message sending")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c43519097a45..1157a58cf1b1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1363,6 +1363,18 @@ static void anx7625_configure_hpd(struct anx7625_data *ctx)
 	anx7625_hpd_timer_config(ctx);
 }
 
+static bool anx7625_need_pd(struct anx7625_data *ctx)
+{
+	struct fwnode_handle *fwnode;
+
+	fwnode = device_get_named_child_node(ctx->dev, "connector");
+	if (!fwnode)
+		return false;
+
+	fwnode_handle_put(fwnode);
+	return true;
+}
+
 static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 {
 	int ret;
@@ -1378,7 +1390,7 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
 		return -ENODEV;
 
-	if (!ctx->typec_port)
+	if (!anx7625_need_pd(ctx))
 		anx7625_disable_pd_protocol(ctx);
 	anx7625_configure_hpd(ctx);
 
@@ -2924,12 +2936,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	}
 
 	if (!platform->pdata.low_power_mode) {
-		struct fwnode_handle *fwnode;
-
-		fwnode = device_get_named_child_node(dev, "connector");
-		if (fwnode)
-			fwnode_handle_put(fwnode);
-		else
+		if (!anx7625_need_pd(platform))
 			anx7625_disable_pd_protocol(platform);
 
 		anx7625_configure_hpd(platform);

---
base-commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9
change-id: 20260211-anx7625-fix-pd-792609132331

Best regards,
-- 
With best wishes
Dmitry

