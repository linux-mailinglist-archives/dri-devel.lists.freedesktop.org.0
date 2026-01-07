Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA2CFF57C
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F18C10E5F5;
	Wed,  7 Jan 2026 18:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcvKs90c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl94fgG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3BB10E5A9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607I2JJF218339
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=LcvKs90co5qyoc2Z
 d/DIjr6T4wp6peOapih1HLy3dVAbvLTC7P2Kndnry/iEomJs8OzmIVngr3ixTOg4
 tVc0xZ0DdmPlAIFS82JO8PKad+Hq37EPFHDDYa0GXy6zgBOnPD7vJ+6HgBeCQiT+
 G8XV72EZ8iahnPwLPnscVkw1z9E1UZMXnq1dgZHv7GYsWAjoLBiC4TN5mTDh6g/J
 6uEGqMsEJNdB6obsu3FYwEUHg8rQ/O4SdEcPEIwhJuQIkWpFmUB31BYP1mcGpKNr
 8ZksV4agCherUaArKSC/9gV6QqRKNRz+GmwyFyV4PyNrFAU9PP6VNmmcPKTYAFYo
 Lf4E3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn809mg2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2de6600c0so611863685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809706; x=1768414506;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
 b=Hl94fgG8XDc1caiM+DOgFRTYYEspagCOaB4C1ZO6wyFgiKs3Mka1d3p3uOvr86hNi7
 hLUYG53gYS2+EGG6piHvBFY0+2DhbHFVD0nnHu1fjT1psf36PW1vxTK+Gq6QEk3T+aLp
 ajtG+lgtYnCKvi2Ar3h/QbxTkduyFqoGKik0AmqG/xFVrEXCrtW0eSK7p7BmgS1olX4F
 ILZj/ffhRPBIqljYgpFte0bfAvX9vAVrCoeXFZwX4kSYRQfgDg9UAlVgAE2g0srkra0H
 eiDW63S2+bi2qoX8T7TqKyS6shlZmpO2/YviILTJLQd0lKh5luCassJogUnqlHbPTizk
 XWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809706; x=1768414506;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
 b=efzpFVXJdsSkYQ1AGrsyauWL8/GkDEmOMbyhV59F0bK4FVbHZCDFmqM6yIoxDSkULz
 5IXMqWak8/IVHJTGpr4kJzzWvr70jArD35asXcSrstEtVh3dJBpfApJk7rc2+kWon+b3
 svjESwP1Jb5a9mOqI4NjH3UO/1JToFeT3BtAp4EwCqdBGJljeW4S48SGDVhZnLPCHoM/
 sa7rPnc/2bwShoyD2hPbzTNzTEH+S5FKMP1M+3ZEH0NOiVCVmt3eRMzRXgPQ76VdwmjY
 uRl5mnL/LLHVDRWOxYGuoCgEbOQRYnzsZLVkg+7q74JDcO66M94wCwCxq5uWaXx3HQI4
 vJ5w==
X-Gm-Message-State: AOJu0YwlZAZ7p/+DOcA31blUDeH0Epio2e6eXg7WrfaRQY2grmWj8H6q
 Pd4n5SVTQBfMqtf5HlVtngLWo3idcM6vpEqCEqAr8DkB5G7v8N8SXizIgiWoVCJGQHqYjTfTT2F
 bRHYjJtqIlNTR8CC/ibVfsK/Kpy/8e2q4I/ibwAb8W4W/i0CzWuUSYbNLqskuxZk3S4/CAmI=
X-Gm-Gg: AY/fxX70rSLvew1VsttgeITeHk7g+GobIyThNBjMMz6nnDo0xQ/lnXOYEOH6jgkrLTQ
 QJj1WJ5zFxvulcV5+m+Q68Zd79nK+rNhvInS/S7CIw0SAzWLyl83hlxTDj1PUcGBeKqfN+cbQiW
 Hu7CM/zoTuNQx5SCWdxU/CVV77lBrqp91BQftgRMQSNWttNlA1bYZinBqbkkIzPp3iaDvZJosbR
 Y748Jt7ivmHBz4TqHC0Dprr6m+TAidr6MNNv4dyCJrVKDJ99vr8ewldQ541BRmbsBXdvFGWoVDP
 aVNrk3+bJIuhSTYo3ZMHsYmkJhs567DWHvI2n1H84C7AcN/uXH33yuuqnlDHWwnz56bDpMQm1kd
 sMDv0+0W507z85V9iv1kLeKKe6JTlQQKtCtJgp9fTixQewlPmghJ1ViUFSPgCAaSubp9VINDS8y
 sCWRa9meEC80oDOrw5F3wLWNE=
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id
 af79cd13be357-8c3893751a1mr451570885a.17.1767809706374; 
 Wed, 07 Jan 2026 10:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErco6iIlONdm8FoPmBoVGT4sMle7p6Daei/gbTGJZ8AsHe90PS3UuyAzSsRgYRNtmFv/UWZQ==
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id
 af79cd13be357-8c3893751a1mr451564685a.17.1767809705824; 
 Wed, 07 Jan 2026 10:15:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:14:59 +0200
Subject: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjRxdH2GhgCXavyWIwCH6N3bsC345EISvDP2gtesFFg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkcDiQpwhgi0U0jf8JGOrxJBwtl/l5GypPK
 coPxI4tELuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1fRWB/92FTnBMUcYj37wwL0tkj2+9WhnXCNr6YaqOXhJHzBvMN3Ric79sLxWIk6V2x3r2jYCRTc
 BkdlD9X0pnL+Hq2degXIglnJH2gA1p7PGCVq8s0gm0v1ELu41JL4luLf8f6sJieWu1QXoaJk5qP
 79zPwaA5N2vB9hfx5p+R6t4e8pTVe1kMeFaRCUvqmAe1Kovi1sIZ1KaVq04n6rv6Vhjro5yFiFn
 LyRakv9HjVWBfthh1kbm1YCWTU0Rh+rmb3pMmr07+I6SSf6xRRJ0Yq6B0EcopvIhZhVA3ayoLhz
 savBzIEyxFTHux8IDyABCGHnOtOfh5srllF0nQkfQKf8sNtQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695ea2ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NLazEYTR18LxsLw3J9bi8Qt1ljyK5_Z5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX6ctcdvw6HNMy
 IYJiS949CQhTuG+6ffido7qLKMsHv/GtRVFyC12NNZVglJqHGFc/6A+ztTDz5l9VRjOTu5kKhB0
 oVpFOIwfDwd4yO7ux7tJu362smFlW9jmJ0wzgpYe7sxBeEAg2uHE/V3rInnPPwoeA+ytleLLXmQ
 G3Bj0lEWnYgfsw214tSHUHcdoKaocRGE8e18W+SsdkNWxHUfl9DAGFG+BxMz1fqnzitUXMIqTmF
 YK/PsNGNmEDesgYg1GE4EtZQk4c7DZa9u30t1E6XNugkJUa58Gkwfv3qywR52Sfq7FWwK/umruo
 VknBu33PR/VmhM5gswh3EfEzDFH0l5Lv4besgbfG/QhwO5GQxazuN695QKC6OAzdcCfZsAJBxBe
 yy7pn6h7L2EtZc32t/hfEua0UZpiKzDCJSYGQlg1rUZFZ1xX0mOArdKRgCYdd6l3kK2+WIa4hjl
 nWzu++sNShEV4v4hEUA==
X-Proofpoint-ORIG-GUID: NLazEYTR18LxsLw3J9bi8Qt1ljyK5_Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

Acked-by: Maxime Ripard <mripard@kernel.org>
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

