Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D77CFF582
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F73B10E642;
	Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTI+JdNA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vf69HyA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A51E10E5F8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607HO6Kh2593315
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=VTI+JdNAvshkdlek
 Yfh5hok2VL+Ruv93fw7t3nX3JTZAOcnt9yVVeRWzxIrMrpZlkehYKArntaZh4Dhs
 py6Lp/1rh389bEb6TO0Y+qlxVSCg2M/0T8nIrcc9kP8/orpoqquwDZOkto1AWxb/
 cEICWw743ZtkcFMhW8qvlQ9DH1/Cd1MfDCaYRGvFcInihEn1//0v7/KskZESWGo3
 Y69JP2reux4mxVQZ3r0Lqk9ULcvavssUs4wagaNQHwAX5YaN1Dx+U04imhGQi0iP
 4UE/I2Koa/YNC1rzxkWL1UO7K1dW95kL0fNUN/pRltO3ShXQHw2WkytmT//QMryO
 taMxNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn291n38-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e2342803so615477785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809708; x=1768414508;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
 b=Vf69HyA5e/s/gDoi2TctpRsrwXhItCmhLUVwSJb8o6D/EG9BqtKOiev+ydvMsDKqt0
 325lskuT2JqwNrFjzWVgtVa76Nh9459e4/CTqSPMMmbGZv28ELodQ3U+LlKuNEDDD+L0
 bxe8gHScljUjLdwp+ZON1KBXqdNFtnSnLF3JmbRSZjdwGpVWDGH6TDoKR/m8Vcy1Ufpj
 GqjTZiNALhFLGns/gHKiiDL9MPDZivCuTPh7yNRi1CEYLYovHYSNKJ5a9XIpLpuE7uTi
 tNKuiNVacXACq8RQj33hQkjzHcYDeH3Wpmxxb3zcdWQ+FMfK3TZAWYOAw5TcjaZigH4p
 Ecgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809708; x=1768414508;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
 b=JyhEMY9YKHno0RhjbnGBUi9Mts1AqleIu9zR3jl5Mh+zFNPU97hq0CF7Us4/bYcc2q
 BA5WXaZLo90BCcRoTxx5bO/gJsvJT2zv23AV4m86LaoLBZ77qHWUNazc0Y5pnYbT6SXH
 Fvl5wUuCm3J02BuAPLNQdmz/VpQxQbOfci3Orr1j1N+BXQRYH4gWVofRZp+6S9RsxzPS
 HstT3TOd3ntdoLT8mwmYWdDjajIKQK505tZ2svJaSoFr1Kg2gTw7bjuUFGZ/QYqNH08S
 +mVjebe11TVPUpyfqAthvKdXefIwMoX/Ym4aatFpQJTT2Fn+U6ZQzgkgF6EJqSgg9OCf
 +hWQ==
X-Gm-Message-State: AOJu0Ywqy1mE3jvfWy4FVLm7LnGeiC6QLAFRQ/3sEByb9iC815buVz5n
 PgzLpxhnELbrbMp4nSvGQnWwXyUtDUyZKViPmlxTaX2E/gCQH8Z3lfyYee3MQ312qhKfKT+Dgjm
 Tw/6hHKEkHmoEkRGNJRbrNMtH2b7YWr285okgP6FNcGqIzmUx3XlcDC4pmiQFuUVVX4QwmMM=
X-Gm-Gg: AY/fxX4v/PQrs/kJUcIwYK0UVqFC2dWsj0Z/CmxN7L+o1Fp6078sU0os/+trBeOPY/r
 cL4y5eh9Ll2rUsZIn5mzzNVp+cq1zg1Ks1LnOUGN3Ov5yz3EBTOH7tPtC0W2g6wLy+AJhqckaAP
 FG2bWGVXpKlpGc67ZfmC6nBSZ83ovCj0udV36XZ862+tDweqHBoGzGFXcshBMS3th0onxkPFrlV
 QkJCxCqucNW7U1Nthk++2fHAhd8CjJlu3XCmOTXtbFDX4I6PQrFBTSHqzvMjE7W1JNl0fcawYnt
 wcRCyCPpVGQS7fIZbCMkRJ59Car+N8kbNoWAy1mRAnURffn8HGQiZsowuwUXpRDJJHvaJK/O0Pi
 uU/1VOJdYvAq1no54VYVkwCkx7Q8gpE24SJrt+yeOa2cZj1Y7RlgzzFD+PIojzx87SRdZzOspxD
 q+jcB+j6dGYwWH82cuk9JBpRA=
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id
 af79cd13be357-8c3893f7d8cmr453747285a.61.1767809707652; 
 Wed, 07 Jan 2026 10:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQiBI0nmEwHGDiwmCMtLl/jayFaEU1m0Axo7cKoiE+2HfeOqOTLbx0TrveKVWGZFW8ipORjw==
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id
 af79cd13be357-8c3893f7d8cmr453739285a.61.1767809707118; 
 Wed, 07 Jan 2026 10:15:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:00 +0200
Subject: [PATCH v4 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoiW5J9/tWb3J4tHugrKAs3JeyiZt4rWpsWICpksuC
 jCtyXnbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiH5k/1/oclnK/Zz/ja8L
 v6t7HOL18cg1yeBbaeqq8pOvrnf+XBOj/s8szY+lzvBERUkLGakuejhjjs20u3oewa9eNacmbZf
 ZErVva/T+iCPe/yKqIoU+z/jzp+2KV28zo9cVjnoraUd13pIVM4oiTrkH6U3OTdOSsJwVt8L5h/
 /T3zkX1/bOvsVXv8vj+1+jxyrXD8c0ec7+2mYVenlOTuTBvsSSQqvGuY38Xj3Tv9TeX6BzUVOlc
 4rNlrpcI3a1MhGFq3s68l8oMFjf+RBpdHu3yN9MrYxg6YlHexbMklnWv1mXiTVGP2Lax/1P8qs4
 j9ptzHJSW9Jgcn/7ST4zM4W/whffsC+fsnRj8rbPKZ+zAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: tNtqt7lHlLBYTpNiJPyH-RauaC_CG_nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfXxPBuhVvXZQhp
 o+rt3b6z2n6ddjc+ZSapZmcQM61WFqLvRJ4OZddHMTyQsyB4TLB8hfTUXPpY96bdPSX8IBVCFrx
 mqPlM+ZOB63r0eDOBqbMUbe1/CyqCo+mQYRk9GU3JwEhN2U4GAqO81TdHcos5Fy08Z94dgNRqc3
 +tu5MITR/W8pct3aGQPkBAKitUh7Jk38D/gAR/rX8nnZjXdAwXX75Wdd4J+aaEhd4a/BUfhz//h
 OWtXfhlcNpMccqTnTD4exCrjNrwgdoZNC25b7tn9eH2Qpa8yhg4jlwVqZShDWEI9REkB9lVgMWs
 0tIa1e27PIgyZ4J++QU/8xbcTyAtmVp943Hzm+QzZdsMgX21uuaQToL6Hkp45iVycmmhlVtMav5
 ewOCreiC2uuxH2qGwXmooHvsGe7h/KIKclXHFL1WkT1TlG19/JXKR8w1nal5o8jrswOfE8IwJHm
 NMk2nayM7j8OKJ6ASPg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tNtqt7lHlLBYTpNiJPyH-RauaC_CG_nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144
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

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3

