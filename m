Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B148CFF5AF
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C1C10E656;
	Wed,  7 Jan 2026 18:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT98JyW5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYd6CoZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB1F10E64E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H7Z0v3672873
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=YT98JyW5oGIce4yx
 t62vyUO8gfpzGSWjao8mBdPTYJjg9dpxi69OPT+flXHjY6zvvx9HgiN5VBgBBE3z
 aP7KS2Ai0vJ/lJpU1dpDd0Wxd3AfpuO+r5VqXRzqZpaUaKyoi0LPozqGRblpfFtK
 8FFeJxxsq+wpaKuwqGiSnUZWk/S1M+hmWmUCx+hBTMfSwr6J6aj2V5QFdUUVf0kj
 CHLH4uqz3dyg/R1Bh8EhaSUJI/DxjitNH/wMuHLMhRLagS+uW1jOa4CUCDBGeaVy
 RdCTC2bWeHtpXMzHIcJEE6pFwJOYIGnHu5DTmubFL5Kv1LjS0Qoq4BlhHH+zqmpU
 l0KWkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum507ym-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso698741985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809716; x=1768414516;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
 b=RYd6CoZE4ET0sfUHD3dd46vvygLaHvG/N/txjl6YMNwAAyCxcPrg56slDN65WywGR8
 qk23VrUiAES4T067YUfC6PzJ4QroKGnN/MO22pgCUTZN20oFq0EXUb6n7oNSwD3h/62Y
 hzHs+Llz3PzPWk6Komx4U15AT9CVKv29Im/LC49mpFcRYz06SUScVf6t6TD4ON2vy8im
 5p42x4Zw0+taN1UvSlDxc1Irm8jU+Z66mbCQhI54mnEBGc1OxS+vgT6F3lWWuEkA5w94
 0p0ubZ+2DIb7cop6RWyOt+h6A/8PNxbGzqBMo3pDt6ZxN3IqulD+cQa5DYCRAzl5tuun
 /Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809716; x=1768414516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
 b=sBwpFC88gzjwJPAOGCHCzs++xbKOfLGBQKAeOxWiTZhCXtzAWDF4hoNwcgKXoB0lud
 najkCAgfgIPbVvSqip2l3/5cYuweQsXnU2gsMI1B+pQguY/nWcXik7QZzLZGbHGt//R5
 T5uVgx3cpLuzk2i4SbreMX+Euzn7jPzrSYZg4YaqmjDKXg4oUVql+00MLiDnBx9w6Yo9
 99vPdFMTNofuxSjvI10a4c32vq0PbkWnoioQyaXFRNukzp0dNp6ZT/LNHQCqVyGe8iwy
 zje3kljQM25Oll3S4no5Xd/jnQ6x1PuJ5l1NGU/U/SLz2NlyYvAS6h0m8ryAd7Pr1I8M
 iwDw==
X-Gm-Message-State: AOJu0YxktdW/K7ApLr3v44kjJEJSx2LXnKi+fRpXMg5nyf7c42BlH2Q6
 J9KrPuW36V/4mMZ+h3j+AQQO/EIAUdy3IJLBSyaGxCYNuVfET+xFLcIBZqJqxoFKZrrY4W+NxYo
 4xmb/Vyg1LMar3izKw0XY+zz1LVgCntymxOzTpfeMWaAxPkgyrU7RbSKHRF4LhpvMfvGfOc8=
X-Gm-Gg: AY/fxX6s0mtB0lE8nqJFqE+Di3qa3MkeiLFwtiTwEur48fxeThtv/2MAD40vWcZI9XT
 o9mK0qZxDuRSjs+WAbTHylAGnhzXHXCAARWUcfR1lVDFGjPGU06ANSnwxk7TpMsDLWSq56vWWad
 SYTssfD1h8d26UuLBJU/tGAsNb7/Ny40gupV4ehSkSRLq/7ZBCm/ytTHgfeaZwPJV5F7MAMcVCg
 4GxGO5EwgNfXjqb3F8+U8XzxBcHEEUxGplNI/zb+v8YNZYf7U9KyJUrX0QWveHgcD9SPx+acMg4
 Xlbs21Evow21vsvnPpLYo6DalWaU6+Wlb/nitSCWJBBwNpGHnuAztj9v3XS/6qN90ViyOl+9Bz4
 1rsArki6Sh7mNj4Jv+jqWqa/iYXYItKjcn36AXHsga0FbeUbOs2o1NH3XiRR0i+WFopf9GnIY4S
 4MYs+Ps8ypWe9FpIRmxj69MlQ=
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id
 af79cd13be357-8c38940cc79mr440811885a.78.1767809716466; 
 Wed, 07 Jan 2026 10:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzR6/I/M+rb+0CfWg9B2pwtmy0BCZ0528ZAW/PtSMTyk3JvUKmiud8K1hEOQV156GKBDOZmQ==
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id
 af79cd13be357-8c38940cc79mr440807085a.78.1767809715974; 
 Wed, 07 Jan 2026 10:15:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:05 +0200
Subject: [PATCH v4 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-8-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlLQRVN1fiNfBhJSnlQQ8yf8TEYh+A8edCs
 YWTlH3Bcj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1QOVB/oDjydk2pqigYtLHtwvNWcAKXJbbdPGQ26WTURthKMHJhz9rPZZV04J2QY5hTtypEXd//d
 nw5Vbwc0So6ysL8Tv/jIxpWqiL+ciHmVHitK6qOCEBS+i8W0MtTLVx1YAdnQ2gp8v5gmqGooPIj
 URRZkW/XopRmGOqd8hftr59SVEpUvh5HH5NGGNoX/Wx2rngOV+KmUfwE0HXApJlGUvk5kZ/fwRb
 bGSKspZn9xiu+96xWnVTNQqum/Ct/2q61VCFkl/XqCm0lDpae50DBapNsWOPBMIWt03yTjsHslN
 UvAY1W9Roxw/F/vls4Ff8wqqmvewupBjJYfykiyeu5Y2vHLK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: r-HU_RnhAS5YZh5K1PtHLDyxe6cDWp0j
X-Proofpoint-ORIG-GUID: r-HU_RnhAS5YZh5K1PtHLDyxe6cDWp0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX9Locy841XFXI
 lvermCOEZvQXZN6ZSYNxkUIs79bZnK+hqwvdt+HST4qYV7ydaMS3PhNmQQZFmZVMv3TfSFga70j
 PgUfarsAmK0c/SK8dk2yvS1LC5stF5kajOZ3ydUFOcuA8bpYzfPAQK2hTrpkJbKeDDHcGQiQuTG
 WjDci5Fry78puCcBY8zAw/TJ9SVfYWODcIECAMMJuLpFwXe/QkGvg3IpaPv1pFOLe7jb1w2rErE
 yu9A21l26kTiNDtE0wX1OFy3mCANyPZpaSP/rg/xki0biS4Wvqb7RgLvc/+Tgnlq1jFDCgax+Uu
 nHXhVV1Bx7kF57xFZpCBQkp8ETsxsYfNDnSIfaU1senLwDFc/ps3bvzqyIQq+bEWAdfA2Jdq/J9
 7gZreuI6t+r4ajaTBEXuJe5CapcPnGKEwJ470l4K9jX+yJVau1hPtjma8C6PUH44nranFv+lK3b
 J27bomndUiFALvMP7Rg==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695ea2b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=58UsvUJqJn8fpqk6aeUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
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

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3

