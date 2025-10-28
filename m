Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B362AC156FC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A03110E5EA;
	Tue, 28 Oct 2025 15:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVMbOC9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A9A10E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SEnkt51936769
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UGyfXeVKPbjgWlb4WeAZcL6J+OWf0aILgFM3g8oL4Ko=; b=BVMbOC9D3sepW2Gz
 QyriUPQIx6YZ6mfqu0R1PdP/cL6ilQ8O4sCloBogVKj6tivSpKqc0oongrCfRTQU
 ocpuN3XQFe9IB99fZEqxSiTeBsrA0nrLVJshw/d0DNtRvRrZw4NSDu+ULWp/aGcA
 MHKGBk4WhzYAlAFVUdfzZ/TF0vwYI0l34er+RN+5qhgTkxdA0HUZkVZA0WoSqio8
 rMWsTqon1Xxm/CfIszUik6zce/LcppHe/HzE4vU0fIwcubkYf/r9dkrrqNQpNjp2
 zLLxPbY3H5bBMs7XgUS9ygtqJyLUalKWttOOTQu7bGFL/NnOCsGiDZhhSZlQYUau
 kYhTzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf9x9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:27:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28c58e009d1so130925365ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761665233; x=1762270033;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UGyfXeVKPbjgWlb4WeAZcL6J+OWf0aILgFM3g8oL4Ko=;
 b=d2chRH9trVjQChhsJqNz8xd6LRKBTSPzynLiti5j1vNbaE5H5YvAYNy6jpuFAHS1j4
 PSliA78ghU0V0dZ9/0sMpYE2+FESyT/B8PsiAHCj++X+4mtCbc+6xtgYuPgsOvRkus2g
 Ju8/TSaVxUwIHdomPBazVn5gWi75rmoyWyrSj8A9GWb+eljTvTmmuhJvUylYB1i/VrUQ
 2iy4FH3hUDkJOivgW2U1qhbTHUIbWrFQj9IU1J7Wk+FcAycrVPvQ3ZxaR2Uu3zB/UbGR
 MCb5qKEsbTdgzpKayAmr4PFRj61h4XZz4cXdUajSQ/lsTvebziKsTxf8NpfSGFPNPPqj
 n8lw==
X-Gm-Message-State: AOJu0YzSRAiwZVuxoDu6PHKWja87I0JNqpG5bXeiIWm1Gz2i1qdgv4Uh
 VY+RMYVj9V7Y8ZYKfBu+VfqzjsIdLRNmDJvU8XUYLObu2ZbNRV3xFhI4WMZjmZ0DnLrtuVCxLd+
 c5vuOK3pokggtGiYDRdLncg19VhhNFdVClHjpGddA56iYOD8X8A1IpaI5UZlN5z0FK3tueK8=
X-Gm-Gg: ASbGncvZadJZBjWhJlplJZlVrSDkBlbhEa91X2gpCf8wNkGcg4IBuwzJlHXf0o/NhD6
 l3oNfOI+o467kGhkgOr1RaMAv/BrsVatqLDok1l1LDQxviL3KR/qRjULkAlykMG9VrdpGqyCS44
 Sv47KlmMEdPeenHmTcUrhf3XXmEFkgciD1U+vJAuumkRsHMu8CV9KuxxoKFsiV3RJsl9RqIv1xr
 5Mltp8Jlm1y9+gZt9EIgzR6H15DHaoAwR/b/NG+LYsTnWwGJIoAmnwAHaoU0LOJlcaQRXZK1tVN
 hHVbRtxDC95TlGBn1+PE5U3AqcSFx5QK9tCOffT9Dk6oUOFCNS0zeS3nqQ1IIc0BHr4e2bxHNfP
 9Rj/tVaybxOpvRTh0ZBMw2X487kWD3T494Es=
X-Received: by 2002:a17:903:1a07:b0:294:cc1d:e2b3 with SMTP id
 d9443c01a7336-294cc1deb8fmr41726775ad.38.1761665232863; 
 Tue, 28 Oct 2025 08:27:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE14cBnmetdTEvip2AiuMPqbNocEUBhwvIQ30b1DCC6u6VkGqRobEtLNnL3qD4nV422vPonug==
X-Received: by 2002:a17:903:1a07:b0:294:cc1d:e2b3 with SMTP id
 d9443c01a7336-294cc1deb8fmr41726245ad.38.1761665232393; 
 Tue, 28 Oct 2025 08:27:12 -0700 (PDT)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498e4113fsm119490755ad.90.2025.10.28.08.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 08:27:12 -0700 (PDT)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 20:56:50 +0530
Subject: [PATCH 2/2] drm: bridge: add enable gpio for display-connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-enable-gpio-dp-connector-v1-2-2babdf1d2289@oss.qualcomm.com>
References: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
In-Reply-To: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761665215; l=1210;
 i=venkata.valluru@oss.qualcomm.com; s=20251028; h=from:subject:message-id;
 bh=HYWjIFO0ntFquQpHN0l24OI9KvjX8KR7IgwrgsomREE=;
 b=kZQ9dNvz5d07r2JVyT+l2SWfzUBeDR2/1r/VFgKtBPVDb02OA9jts1ZxG7kCK/+gfgkviLY6x
 tisl04gG8v4DpK/GIpDS7QDZ7hU6OoMaoKF1xlsuWnAogLAJTOP8PYh
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=KEpJdy7/I8HDmNSf6B83x+sFHUNr+mjMNJ2qe4G/zXI=
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900e0d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aOUc1jQm1-AEEL6HbbgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzMCBTYWx0ZWRfXxiefeIBRIpGy
 gnjkNPR1JRNnnkG1xLSKEELTxxOh8EXQ/F1RUdV4qkuMU2DCku6EpKcmljMknKdvEQp4YNT+5/p
 ShDPxy00+2RR0Fc0CLwH7b5AYlWyboX/4vheeOnPnGbFZAlXeNqVdRwkrNvKqkIDDO3azSYdzkP
 q18NMDMn7h9Py4C9WaI5S6rkbdA0exkBQN2uJ7+NjYW8FwqtCftBJqMxlmMqqWS5T39EzbmtwQj
 WKuiT8KiahRWIo1FfUEjGDxCQ7eKBFOhTpH1hxKNFYHlkz/U9H3M1fIG1G58xQJA7U/XgDN5QCY
 BlU0Hk7H38XW1/O388YZyHkTvGqglfezYs3vviX7CC2YHP51UhFz0/fXrbtGddU8pCK9aTQn+iJ
 38Ie5UIK2k8kcCg/n2A1bQFYYPAoZw==
X-Proofpoint-GUID: RA8SGlF5rOsLlxh5PuEcHJyW1rXwp8tC
X-Proofpoint-ORIG-GUID: RA8SGlF5rOsLlxh5PuEcHJyW1rXwp8tC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280130
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

In some cases, need gpio to be set for the connector
enable. Add optional enable gpio to display-connector.

Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index e9f16dbc9535..52f5e4175e64 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -21,6 +21,7 @@ struct display_connector {
 	struct drm_bridge	bridge;
 
 	struct gpio_desc	*hpd_gpio;
+	struct gpio_desc	*enable_gpio;
 	int			hpd_irq;
 
 	struct regulator	*supply;
@@ -298,6 +299,12 @@ static int display_connector_probe(struct platform_device *pdev)
 					     "Unable to retrieve HPD GPIO\n");
 
 		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
+
+		conn->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+							 GPIOD_OUT_HIGH);
+		if (IS_ERR(conn->enable_gpio))
+			return dev_err_probe(&pdev->dev, PTR_ERR(conn->enable_gpio),
+					     "Unable to retrieve enable GPIO\n");
 	} else {
 		conn->hpd_irq = -EINVAL;
 	}

-- 
2.34.1

