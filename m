Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D4B34355
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE3910E4D7;
	Mon, 25 Aug 2025 14:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmyMyYsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EDC10E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8eow9015247
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=; b=OmyMyYsxaNVhE307
 VKRUCTs+csDQ0SSOZ7TiMeH2g0q1DNmMWjWWeB3sflyPqHQMnkiWlCnryiouQAeZ
 HETpXNyIiIiHXCWumHNX3jPBZSfKk/9QNzz2xV9SloZBaZSXRtBsNZ/fl+rHtgJt
 UYe4Hx//SNXvC0T6ViYrLbsmlI2wwWzF01QeOSyWNBJ7+7glXjcyh6e9D+o0XjAE
 aG+956jmL1lBGp/XwH/O4VzSpNdJm0MiCBH+baLumtlKVO7KAQe9pLWX2MF6nrYO
 rSxPxxIIPQ+wnnTaR0AryxvUkLs8CQzBID06KSV30tbZ1cmHY/DBX9DugQ9re/iB
 E/f7tA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-771e7d00fd4so1151351b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131588; x=1756736388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=;
 b=oR54RhLR1KAUgiV4/v+8rJrkYvBgjrsyvT1mpM5RGm/c7+84MKjMbLGIFO5wiDAwqG
 Lo7xSInY/gFWzTSW2rL0bnllgtIb7Rdtopv+FD9EeADcOR3pyneu0Ksl410E49bJvn8J
 gea2p/wgQOGkSI5w6e279PEazoKrtuwCGCmMkTotKW9KHl118N7LrzPm22PF+tv75vP2
 xh7pezBTczWSKiXvokGrEMt2lw+17uaOscNfNk0ZlQrnKQqtm9kX04ORVpuotjqZSsy0
 IY86bJ/iRjpnYGjp1R6tf8d9Ln2IKPRFMxdMghboRYCPryr7Dxn/svryifE6+RZ2d+5I
 C46A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc3feUez0rNWYX6C0/4Nc0CzmiBMnKHlOX4g6y3U2gJiY6653suloZUZXTD3d0VLxSiwfNR0JZiZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtIFqGZAua5UydmCezkHFu7BkCqr5WDFVAmTgyIX8gv1+BimU+
 1juPBZaIjs4lEV1RFxV3dKhPv1WTAfWYRUlKrIHoqHOFdzm0N7IEgetMbpuQi2D8oZAzxEoLGsj
 VF8dUp+J/wQGjeXXUPEyLli8VBqi6nU1eACcFjwhTg5rRbSGtBR9K3MLCyAK4GrDnzBgMhBU=
X-Gm-Gg: ASbGncv4Fx5cifD4vPR8H6ctA8+JOtClzfTe/53R+1NhVPDKNf3XifKECLwm2Wp4egE
 /JbY03zSzGZMHJy1TiE8yZbidGZYHF/GRzidXuT0XQ7OvwxQmUc88cfl84p1LQjvHZvmrOpwu8o
 peV8Mc15OwVCRBe9tnmXsWb4deJ0PnqCch+mcaN8rDh+EzfGCUpjf8QpMQOH0Az4cvxqsAjfQtS
 N2MYveiTpKWXJWh16LQdDiCL1nWWPIgy7+A79mcC5e6/0N9LYzaVeF/UJtEp0+a2rJj1XjIwWCO
 ytKhl/iBWUlHayacmtaid/9LlQ6TlLKaldhEwziqf1U2oDY4iytd+jNxbul6BRRH/XCYGCY=
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr4641822b3a.6.1756131587884; 
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYxL9Zri7v/saIwgivMP5c3D/nLe00nBqbIJBm10dVOoGEqQhvu2/5xZ+AWaA4jkPkIzp30w==
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr4641792b3a.6.1756131587467; 
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:24 +0800
Subject: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P DP
 controller 0 and 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131425; l=1377;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=EPPzpsOe3GMV6W9LzMO4nrdD0eyL/NlLhoDKFXKKq2Y=;
 b=2glrjFiAbHnVAab9xXUirWQWDuGwWCuaCdROVriPR5omW4VgCxP0xsBuM18ARg6ihHRK37Aek
 lpHHx5bpe0MDUSf1vG4PwfFZhJlTArs1xWVTxpTCadMkOIgUKiwlJDv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: odQD45Ff7ga1bw5Rgfe3SGx9EniknMBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX02iKuJWesjIn
 YBotpkHY+enjjLNvSmxEl8f4GOwLLodPGWR1JIrEniCuqbFSggYMjUgWtT0znBZJ6oPxPwk6htk
 Cr/3QxJGJQDIz00FWmPCPlH5Qht8pl1IWF3wZXJCWJXXK+wa2FKdW4bPM6C9iK4xq5bK6McoV41
 NGfxhFIMS7dpD8s/LqSF2LImjX8w221hRMXgBRqWFlsPVdvzGksSOcyLH5HPDHSMWC2sk1aLKrS
 0UpOvyhEYcSim6yM+IS+JUg8c/EdKvr2gpvjlteKfUzyLJaleDYZXG+KrQ4mDLFM0MN3Sa13U1+
 sQKEpYr7LIMSpO8cw9JSvPPbJRBtgiMeGHc1BBRIc1lRjMvDXkLXd6NKFpa68V+sCFkRl/EssID
 TfUfKmxn
X-Proofpoint-GUID: odQD45Ff7ga1bw5Rgfe3SGx9EniknMBB
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac7104 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cZ6T0uJ2ZX2uJOstinUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

This change enables SA8775P support for Multi-Stream Transport (MST),
allowing each controller to handle up to two or four DisplayPort streams.
As all necessary code for MST support was already implemented in the
previous series of patches.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,8 +108,10 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 4},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}

-- 
2.34.1

