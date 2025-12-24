Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C422CCDB055
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026E10E2EE;
	Wed, 24 Dec 2025 01:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWR5Ojqm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6dJuQT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C9210E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNLtLCA702677
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=hWR5OjqmTENGCgZk
 I4zXeoe0FG7+9/6SD3mCvvxs8H3pccL8dmb/4n93hTOrhvZH9t3GbcV7sRBlbwqh
 j3vMtO15GjZ43NDH5xDBw1xydalP3nQJoi/cquWmGbTFSO0HIAKy7YEvhLkXqIlb
 dQJ62hwBdIBtDRmwviqI78iNNVhEH7JVIqEWs3P+GhpXvYZbEb2mskJsWiOFpo+9
 0w9HVSCBA6DhMLa9kwIXPMA7/MAnPT6hxcp69upX2RXhvAhyWGDr02JZGhZE7hrC
 /ZRv6AGGoy+yRGIjDtc/ZYrlLleHwBbYd2TR/74vUAOumKhok4evGO2QVUh5wiVI
 wbOeAw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jt5pw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8887c0d3074so144736276d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538215; x=1767143015;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
 b=P6dJuQT4GpDALPlkGSJBYLn4XdTFPi44ygiikhkWsN2wmodleT37nO1zXrjWNezJP7
 +nMuIM2ZUDvLr9vrlP9sic87VXDRG0Ot7hZ9vHrZlAufI1uxwMH58x1XfNWxHPpXikMo
 CuTCn8TvLNRIf9/+hWulogLiDZN+gi4thxzZCP9+x2e/JHzxALw7aohydshD9tbFil3t
 1hgGcoSHS3h6iRCBOMd9FFMtCqXEa47JR/KiG6FZ5N6/JBUmxJS1C3eTjuawT61xQnD/
 wVyBdIifLb7uojYvYjPPICNRBe8bJY+QVY7cjfxkKGZGXWgPysrmRf1ttNpym7mjmGiI
 j3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538215; x=1767143015;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
 b=EcK5fQ5zeSU4MjQs8hGt0UCHwoJfbTOYyF5w5WFDqII2TpU8ywTOTbftTtFq/BuYfR
 KL62Z7w+bJQl6h1u/rE7JOZkuk+nmf/DBS22+uCuIF5bIY+shnpmMwV7bwojTg44vkEw
 lPdDwyt6X6rTgoZVXU/l0BnQ2K1xHbY9a/sRxgoKHG+Pssshgo9brZFeioD12y9a74nG
 IE+Le0Eal7gudwrUBidEvY1LV1Yh1E8y1Dv2545BXIJp2nBb+MM2ZokXtauHVG7nFTZT
 JaLFSGWPF2RHBlUk9KVH4LxAnwzSLQCFlIcnu+c4YhFbwPNxeBhkUHRRiJTvvUl7g0dD
 sUkw==
X-Gm-Message-State: AOJu0YyeAChd0WNKJZ7TJllXvm6PTZccv8sx9H0pOGDd+osexCh9PxTr
 iAH7jXXZP7YeV6pNKJTUEzkdY4ZxHvQtmilNH29NUUzw+nB+obfw/+BnZQaLmpWNIUWupwPD7XH
 yNifpw0hFZ6r0n7cqWCf4kd89OXBMo7YKRMfm728Usf8EQaubPGAjHkxWaHYtEDMme8sQJ8g=
X-Gm-Gg: AY/fxX7JBQApZflqJI2+qaGxj8o921K5Beix7Oap1O09KQXhWOXNyD7LMpMyPpqm3M8
 ecXXD4Q99gI4MOG2hqa3vcWFTp66FcUAA4jrUN3LdD1AGN0fL6aOgxLOo526Sxc9rYfuR3m8iun
 sIY6voR35WtdJ6TgJETD0QOizinsnzFxG3GbJw1Q5lASCGkv5wJD8Ws7x2v9ZD4fJZVJsAxq0w7
 +BwmeeUczTNwUYpPRGHjStnpqlLjFuec5xC0b/pkA9tG536vc3OywHL6JeIjHuFjTQhi5vRQx2G
 3efKTnHyLnUUPqyi9VYDl0umSVXtS9QVLfHBIo0p2cx5ktAxA0UXYZFzX0bd4HKs72q99cUeaJs
 lS+/89hEiI4RnPYpvS4sCeVcS6uRreFKstv9cZx3B/2GyeJO4gKOVKCP0w+UhRCRHEnDp5KBlg/
 EkfRrQUT/A9Oje4vkujTcn1Zg=
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id
 6a1803df08f44-88d82234a02mr251739116d6.29.1766538215202; 
 Tue, 23 Dec 2025 17:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpKbGgnmym2Mtt5yWxfAHv9iuZOADyKontrek89W07BD34phYJfGyZ7WWcGGMKQLxabxO7ZQ==
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id
 6a1803df08f44-88d82234a02mr251738596d6.29.1766538214801; 
 Tue, 23 Dec 2025 17:03:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:51 +0200
Subject: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6a39fX0APvL2yu8D9Rc3hNQrCmR/DDaffohjZWMNm3TW
 qUDX0zvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEyqI4GNYH291ht/25OWpN
 +Vnmr+nWTHOc+k9sTsiarlmVcz3+bZnyG76iwxndrZ6Wj9f3RuYEOJzb6B3/blvX/q0ezEeTEnX
 Dnpb5/F56eOYGp4ml9wQ/ivtYRbm8EOP/EM/JY+69MHef7kne9Z5Zt1QKdvxjyT8+5acQa+C//A
 uiTqvfV1f8C7nQJzN7xfT91yIKVmyPb1rrFqV84Zy75YP+wD/rjPT4rZawrlHT9uq6uOhGaxCje
 WWdfpCJ7w9Z9vbZN8tfzJffEHu3lltStTXUXUTlbfaz0MQpGWsbFNULpWVswpb3nP91WtD11Kq4
 VOMQR0brUk6/yjc2PJFtDgf1l07Zor3rOPuy2bdnid8FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX6X657XCiIwoL
 wNHfqV6dmOnb2q0wCrtQo84XvDOVsP3VY3SzKqoKATjlBqOk6iNsORKWPJkjIYtHYc7dJWFj7rD
 UQXsTHrvlqD6DBfXpJoqJgkhm86sa0q5bzM/lyPFU/gYiGnYuw/7+vYz7LL6qnqhZngS2MpjZtF
 qgTxbVe8O6XM94UuHJ6WpyuuaSPX28j5NR3qVjWr0uP3WUL5NzqbGv4BtltcJcrCoWSzmKQ2fMj
 iKrTg4qzKjO9lZP5LsFsWr1HfTlbyltTJjKsRCKfU872bkCv1zm2chU2VZ9NCaafCwK3+1kmr86
 BnXBstaX4wz4P1hwsp6NNTUhMMG7Ti/ScnZuZWp968pEKJuDd9t+scwgdNy8IH69E/7teZL4AV1
 AZyMsqBScdFpPya4Yj2Vsoh3x7WrpR6LSI/C4GtagM85aijVJABzvk7QLQIS3WnmvxY0Ej7W2In
 8StUGbI6eeUwnLhQyyg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b3be7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: iAjzt6jPqPJdGytkVQb3c-cgZpE-kmem
X-Proofpoint-ORIG-GUID: iAjzt6jPqPJdGytkVQb3c-cgZpE-kmem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
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

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1798d1156d10..4cfb7ebc0c81 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 	return ret;
 }
 
+static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type)
+{
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
+
+	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+		    VC4_HDMI_RAM_PACKET_ENABLE),
+		  "Packet RAM has to be on to store the packet.");
+
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
+	if (ret)
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
 static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 				    enum hdmi_infoframe_type type,
 				    const u8 *infoframe, size_t len)
@@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.clear_infoframe	= vc4_hdmi_clear_infoframe,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
 };
 

-- 
2.47.3

