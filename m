Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB81KF+ncGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272955107
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60EB10E745;
	Wed, 21 Jan 2026 10:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgLoGsDJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djATnXEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84CB10E740
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:51 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L9Zhuv3991326
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4vcfsLd7iQ6cPaiGJNN7blnxYZsf9LKmcSLtSOyoSjk=; b=OgLoGsDJBqXucNAA
 2SgXa5MRxCXbB2r5pGEYabLOnGiKug/k3e3c1QSRMQGgcJgFZkj4YYy2BzPfF+aM
 EDgYGZI9dgKCSHuRPrPV9elXr1ae1nJmELHogeZUMIHaKYHBTaZR6EhzisryJH3u
 hfIwcV6sOZPfeZrS6TWH/6lnx/ZXWw2LY90wyfys7VQNPdV+fj95YHRJBs+hgZuF
 9nB9Bfwpjxakcwlt3ey2GiOtoU+/kKbM8Hr4jGeikGn+dWNMgSlX5j8fzIeailGO
 4/5bVFUnK5Pc9HbgweaLY8lGHXXjLWFTx8VbuizOVWmUO3st1leVZIWmwFslf6W6
 yW3oGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm41qjj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:15:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52f89b415so376214385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768990550; x=1769595350;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4vcfsLd7iQ6cPaiGJNN7blnxYZsf9LKmcSLtSOyoSjk=;
 b=djATnXEp1S6UuUH7gmqGmwi+aWKpQUMMJGGeHjLf6rmD+L4ktjYPGe4762SFaBzhzo
 EbGuK/hSW+QVX/A4MIucU24dx/XAIMoRb3guAYD6vE8gxIxggfIHOkaX2thp/f0RlGai
 7dtXMf+afv0UwbvZ1bqpo5F3HCWh4KDrJzFELzbrKo+AALqoAibGIvLs0q7I0evGl0xR
 6tsebPaB3vffbmrOjgww7OQ65KIKboFMqurBZ/Rgp6BspznbmD4QiLIUo9qMgvaIY76A
 4SPCNxVlD479RQhSfUXXvvW6RCU+7Doze+idD5OjPRLJp0UlkpeMPDzpr2GSoY9XkHu3
 BDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768990550; x=1769595350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4vcfsLd7iQ6cPaiGJNN7blnxYZsf9LKmcSLtSOyoSjk=;
 b=hThlKoI95fhK+50VLywD3GdHDpH+IjeaZN4zGyu5Z1vnAItIReInGUO9PPvwPM01xA
 /5KmXr7N6tKgfo8+pA7YkAJBJvEn2pi3TKIbB/4qk9KdqIlYHmUVAbo0WzMfivjIowzp
 421Nc+NFS3nKK2KsLLw/eeZeELs9IbTnoVi1tsj6pdNeDhOT9XpgB5OFhKH9JTF6dIo4
 9O2BDP12wDYcRfnLLYearRSqXHBYWAJJTceja6yQKYhEfTWPp9IVvqm8fzNc4b5HZaZX
 Ntvxv5HAYAIkzSNDkrXBkSac8MyvghkCpiMJHuqBQQO068kw86owX4246RGY3c+0Kl3o
 Gx0A==
X-Gm-Message-State: AOJu0YysZUqu3Z9JqsZ23NjQTfjUTfMJnkgPuGk50V6Fnlyp2oKaNHVo
 bFRww8xWzkEdLPnX92PFtj6A4+Oc9ZcbqSrmCQeGPvlvkO7T/fz5oFPpd8gl68txBTl0L56y+Mm
 63+TYAxdGsjeJDndxmmC4ZXFzCjTsXp4NDVM7OrXLxHi/h9MkcKAsjB2tmTRYOQSe9p9Slzw=
X-Gm-Gg: AZuq6aKsf1w3DUJH2zCoKU7wW3DI6PRAxubvUtuH5eB9HdM1Zvnp6LkYe2ZsIggiCov
 KlXEU/TV3sskdk68wfFxlOqkyq/url/+u+xkQggphkw6qoLQi7Wd7PgL6eHzmUAaRs3ZcGYBsmF
 lOTkVbFqZcOLBSzHakTzRbmhYlirx0ahsE8qJKwGDFuds3BejilRUWyrDRHK4vURhp+r1N91WN/
 boKduwl/1Nks+7oB5Do27qmWLaUQd8W7bZMl3Hs6QJtFJ03FHIDziPoTX4wQNXdoFy4aw8dD5tq
 WTlRNFrDf2t24yEbuCFYbUVhjkwpshxn1AaswFn7FKyep0d4YRR9fCbB7InTNpBF773e09eHgSp
 FVxBHagLun3acAfIwuy9R5Q9DFPyE3OtlaX9+muB7IJibckCuGZjsmcwvJ+R4uCjuN9Xub2yFWI
 /lZF9K9xgr8Kk2STL6jrCY3SY=
X-Received: by 2002:a05:620a:4709:b0:8b1:5f62:a5d5 with SMTP id
 af79cd13be357-8c6cce3b4e0mr597666685a.62.1768990550001; 
 Wed, 21 Jan 2026 02:15:50 -0800 (PST)
X-Received: by 2002:a05:620a:4709:b0:8b1:5f62:a5d5 with SMTP id
 af79cd13be357-8c6cce3b4e0mr597662985a.62.1768990549420; 
 Wed, 21 Jan 2026 02:15:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397785sm4720733e87.51.2026.01.21.02.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:15:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:15:46 +0200
Subject: [PATCH v2 2/3] drm: bridge: anx7625: implement minimal Type-C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-anx7625-typec-v2-2-d14f31256a17@oss.qualcomm.com>
References: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
In-Reply-To: <20260121-anx7625-typec-v2-0-d14f31256a17@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10293;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=030jphXscriwHQLoSXlSrjsNzVEBqnZzXewHZtj1eL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcKdRCnJSOhd06BkSPaadnxegpK2SsA4X9ebla
 xUOOgLTGMeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCnUQAKCRCLPIo+Aiko
 1df/B/9GadOcj5rVesVEmUuaeq7OBGGnx3B4o4bnSgVAr7T0tZCtDH8AUvJEhtb7nhBsYY/1R5a
 Cw5uUmkNSg+Zsn45P+9gG7RCYoktkyHRuNPhUUG9bgx9znTgAm7mdO+5B9QfS+1SnPOafAXsFl+
 0YCjlEyuLIary/SyNLUUr1iPVFrjA83XOihPUZlgDSrfLr2rlLjBvbJzJP9w1Pwt21BPlzv2eIX
 oZ0leHPbtMsoq/yF1MdCL7MtaVrmWGAB+RKj5hjCM3xXIJswXxlW1MJLQVx3/2ec9+EKNHq0dOu
 liCFl/BISeYNs9gUdo0mB8JEaofQ3KyWyTBmkUd5pMVTEHL+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970a757 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bbNUuHX0AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=N6laaNus9HEbtwgti6QA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3b-t3vAtY4IUXy2q2Ylb:22
X-Proofpoint-GUID: 470_G8gh_CI4gkyyzkkdZcNb70UhEzoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX7j/CVg+i037H
 Du83vfT9MT1wmNiOlVbaeL0Ov7VAhrZY2Zt/xYvOUQablpdqlirBSg9wPkvyXHjIPRQnVEKic//
 Hp4HjySIEpO3EXtWAURVAo3cXDd3ET0ZfoJ0DxmfF6C6oPbcVJVrYMNvKYa/PeVKNZXiU1ZG1FY
 1s/zx+0BpbLHhVhpnTl2zo0I5UmvV8UrBxruAJAn1FVHMdVomHEKI6O1o5qmPvyX/QS+ChoDf0D
 g2r0u78J7Ooq06RAFHuhrzaaWwCC3Cjm3LmVHiWbUud2j+oJG6RtnuKmWym3aJZ3/W0XYa9bSIN
 7OFwe/acCwL4UAy8g+8KOu4Mr2qRBJNrl/TSfKNGQGoWFaWRPb3bBQOxs8COBExrBSfwj7mfmIq
 l8Y64LJL9OsR7vvm9HNjspfx0B9ptbJH6wWokcPLhmBON+AsiR4otkoGyRA03U1Ik7pvQhbAFvs
 rLYrz1bOW9kJ1cpDe7Q==
X-Proofpoint-ORIG-GUID: 470_G8gh_CI4gkyyzkkdZcNb70UhEzoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210086
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
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xji@analogixsemi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,analogixsemi.com,linuxfoundation.org];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,analogixsemi.com:email]
X-Rspamd-Queue-Id: 2272955107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ANX7625 can be used as a USB-C controller, handling USB and DP data
streams. Provide minimal Type-C support necessary for ANX7625 to
register the Type-C port device and properly respond to data / power
role events from the Type-C partner.

While ANX7625 provides TCPCI interface, using it would circumvent the
on-chip running firmware. Analogix recommended using the higher-level
interface instead of TCPCI.

Reviewed-by: Xin Ji <xji@analogixsemi.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/Kconfig   |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c | 155 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  22 ++++-
 3 files changed, 168 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c..f3448b0631fe 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -34,6 +34,7 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
+	depends on TYPEC || !TYPEC
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4e49e4f28d55..8dc6e3b16968 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
  *
  */
+#include <linux/cleanup.h>
 #include <linux/gcd.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -15,6 +16,9 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/role.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_graph.h>
@@ -1325,7 +1329,7 @@ static int anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)
 static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	int ret, val;
+	int ret;
 
 	/* Reset main ocm */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
@@ -1339,6 +1343,11 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
+}
+
+static void anx7625_configure_hpd(struct anx7625_data *ctx)
+{
+	int val;
 
 	/*
 	 * Make sure the HPD GPIO already be configured after OCM release before
@@ -1369,7 +1378,9 @@ static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
 		return -ENODEV;
 
-	anx7625_disable_pd_protocol(ctx);
+	if (!ctx->typec_port)
+		anx7625_disable_pd_protocol(ctx);
+	anx7625_configure_hpd(ctx);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
 			     anx7625_reg_read(ctx,
@@ -1472,6 +1483,107 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
 }
 
+#if IS_REACHABLE(CONFIG_TYPEC)
+static void anx7625_typec_set_orientation(struct anx7625_data *ctx)
+{
+	u32 val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+
+	if (val & (CC1_RP | CC1_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NORMAL);
+	else if (val & (CC2_RP | CC2_RD))
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_REVERSE);
+	else
+		typec_set_orientation(ctx->typec_port, TYPEC_ORIENTATION_NONE);
+}
+
+static void anx7625_typec_set_status(struct anx7625_data *ctx,
+				     unsigned int intr_status,
+				     unsigned int intr_vector)
+{
+	if (intr_vector & CC_STATUS)
+		anx7625_typec_set_orientation(ctx);
+	if (intr_vector & DATA_ROLE_STATUS) {
+		enum typec_data_role data_role = (intr_status & DATA_ROLE_STATUS) ?
+			TYPEC_HOST : TYPEC_DEVICE;
+		usb_role_switch_set_role(ctx->role_sw,
+					 (intr_status & DATA_ROLE_STATUS) ?
+					 USB_ROLE_HOST : USB_ROLE_DEVICE);
+		typec_set_data_role(ctx->typec_port, data_role);
+		ctx->typec_data_role = data_role;
+	}
+	if (intr_vector & VBUS_STATUS)
+		typec_set_pwr_role(ctx->typec_port,
+				   (intr_status & VBUS_STATUS) ?
+				   TYPEC_SOURCE : TYPEC_SINK);
+	if (intr_vector & VCONN_STATUS)
+		typec_set_vconn_role(ctx->typec_port,
+				     (intr_status & VCONN_STATUS) ?
+				     TYPEC_SOURCE : TYPEC_SINK);
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	struct typec_capability typec_cap = { };
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		device_get_named_child_node(ctx->dev, "connector");
+	u32 val;
+	int ret;
+
+	if (!fwnode)
+		return 0;
+
+	ret = typec_get_fw_cap(&typec_cap, fwnode);
+	if (ret < 0)
+		return ret;
+
+	typec_cap.revision = 0x0120;
+	typec_cap.pd_revision = 0x0300;
+	typec_cap.usb_capability = USB_CAPABILITY_USB2 | USB_CAPABILITY_USB3;
+	typec_cap.orientation_aware = true;
+
+	typec_cap.driver_data = ctx;
+
+	ctx->typec_port = typec_register_port(ctx->dev, &typec_cap);
+	if (IS_ERR(ctx->typec_port))
+		return PTR_ERR(ctx->typec_port);
+
+	ctx->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(ctx->role_sw)) {
+		typec_unregister_port(ctx->typec_port);
+		return PTR_ERR(ctx->role_sw);
+	}
+
+	val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
+
+	anx7625_typec_set_status(ctx, val,
+				 CC_STATUS | DATA_ROLE_STATUS |
+				 VBUS_STATUS | VCONN_STATUS);
+
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+	usb_role_switch_put(ctx->role_sw);
+	typec_unregister_port(ctx->typec_port);
+}
+#else
+static void anx7625_typec_set_status(struct anx7625_data *ctx,
+				     unsigned int intr_status,
+				     unsigned int intr_vector)
+{
+}
+
+static int anx7625_typec_register(struct anx7625_data *ctx)
+{
+	return 0;
+}
+
+static void anx7625_typec_unregister(struct anx7625_data *ctx)
+{
+}
+#endif
+
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
@@ -1566,7 +1678,7 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	}
 }
 
-static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
+static int anx7625_intr_status(struct anx7625_data *ctx)
 {
 	int intr_vector, status;
 	struct device *dev = ctx->dev;
@@ -1593,9 +1705,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 		return status;
 	}
 
-	if (!(intr_vector & HPD_STATUS_CHANGE))
-		return -ENOENT;
-
 	status = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
 				  SYSTEM_STSTUS);
 	if (status < 0) {
@@ -1604,6 +1713,12 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=%x\n", status);
+
+	anx7625_typec_set_status(ctx, status, intr_vector);
+
+	if (!(intr_vector & HPD_STATUS))
+		return -ENOENT;
+
 	dp_hpd_change_handler(ctx, status & HPD_STATUS);
 
 	return 0;
@@ -1622,7 +1737,7 @@ static void anx7625_work_func(struct work_struct *work)
 		return;
 	}
 
-	event = anx7625_hpd_change_detect(ctx);
+	event = anx7625_intr_status(ctx);
 
 	mutex_unlock(&ctx->lock);
 
@@ -2741,11 +2856,29 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	}
 
 	if (!platform->pdata.low_power_mode) {
-		anx7625_disable_pd_protocol(platform);
+		struct fwnode_handle *fwnode;
+
+		fwnode = device_get_named_child_node(dev, "connector");
+		if (fwnode)
+			fwnode_handle_put(fwnode);
+		else
+			anx7625_disable_pd_protocol(platform);
+
+		anx7625_configure_hpd(platform);
+
 		pm_runtime_get_sync(dev);
 		_anx7625_hpd_polling(platform, 5000 * 100);
 	}
 
+	if (platform->pdata.intp_irq)
+		anx7625_reg_write(platform, platform->i2c.rx_p0_client,
+				  INTERFACE_CHANGE_INT_MASK, 0);
+
+	/* After getting runtime handle */
+	ret = anx7625_typec_register(platform);
+	if (ret)
+		goto pm_suspend;
+
 	/* Add work function */
 	if (platform->pdata.intp_irq) {
 		enable_irq(platform->pdata.intp_irq);
@@ -2759,6 +2892,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	return 0;
 
+pm_suspend:
+	if (!platform->pdata.low_power_mode)
+		pm_runtime_put_sync_suspend(&client->dev);
+
 free_wq:
 	if (platform->workqueue)
 		destroy_workqueue(platform->workqueue);
@@ -2774,6 +2911,8 @@ static void anx7625_i2c_remove(struct i2c_client *client)
 {
 	struct anx7625_data *platform = i2c_get_clientdata(client);
 
+	anx7625_typec_unregister(platform);
+
 	drm_bridge_remove(&platform->bridge);
 
 	if (platform->pdata.intp_irq)
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index eb5580f1ab2f..a18561c213af 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -51,9 +51,21 @@
 #define INTR_RECEIVED_MSG BIT(5)
 
 #define SYSTEM_STSTUS 0x45
+#define INTERFACE_CHANGE_INT_MASK 0x43
 #define INTERFACE_CHANGE_INT 0x44
-#define HPD_STATUS_CHANGE 0x80
-#define HPD_STATUS 0x80
+#define VCONN_STATUS	BIT(2)
+#define VBUS_STATUS	BIT(3)
+#define CC_STATUS	BIT(4)
+#define DATA_ROLE_STATUS	BIT(5)
+#define HPD_STATUS	BIT(7)
+
+#define NEW_CC_STATUS 0x46
+#define CC1_RD                  BIT(0)
+#define CC1_RA                  BIT(1)
+#define CC1_RP			(BIT(2) | BIT(3))
+#define CC2_RD                  BIT(4)
+#define CC2_RA                  BIT(5)
+#define CC2_RP			(BIT(6) | BIT(7))
 
 /******** END of I2C Address 0x58 ********/
 
@@ -447,9 +459,15 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct typec_port;
+struct usb_role_switch;
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
+	struct typec_port *typec_port;
+	struct usb_role_switch *role_sw;
+	int typec_data_role;
 	int hpd_status;
 	int hpd_high_cnt;
 	int dp_en;

-- 
2.47.3

