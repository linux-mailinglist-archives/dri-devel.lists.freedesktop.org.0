Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C449FB28DCE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 14:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4D410E37A;
	Sat, 16 Aug 2025 12:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqLHGpE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796E110E360
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3FVE4016593
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=jqLHGpE0SrHzaNJq
 HvY2s9Lj//kd9ayUo5T8OPj3AhPzFYl9txS7IMbRPU6RzZqt7+fOMKaxzl4F0JL3
 Md4gtCfPBc9J/5TRiTPEEM+9mGTQrg/qRYFui3MXwYXZxi3zPK8yoYlCfZb1HEbg
 XtlcCpSqyIK9ffm6ojJhBnZ5mo5CX+YsJNiTP83oDfa0EJQ+gkujL1jHhB/KvTFB
 0+vgn93l7RW6eJDlAObxdXaXQcIRrCfblub6BEsh4qUsvOUhlSJl702OXvDC8O4z
 15EzQytH+vqquTtxAYCXYM/iv1pXpBhw7joL77Ui1p9iv2lFToHf+0EgAxEhtHNA
 +ErGiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf0udt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:41:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a9f5b078bso29590626d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755348078; x=1755952878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
 b=fW+zozSJIjbj0H7jFwS4wKiQH59oNVpI+w9UaZrdV9WU/IilBbssb5Mm81adeccPo/
 XAeQxB8qVloh5O//oENSeVZpriHFTsFJogQXHHAOGkm+Z2ttwcqDuQ1mwMnNrwX93t/z
 CfVZaFMGnKZpLO+3dEY5fgNYei6K7Pb5RCKxI3J2tCFG1B0Ph0OfpqgMf6m84pIAl+Tv
 fXwAL9wPRKVztrXrwZO+M47PyUaqakHm+ukUw39ExED0XZs6dWF+ayuKrNzOp/8AkMb1
 i3zaNXynAl3WDdBm3NoyzHf/9vpnNY1zaNp5clZuTQi65dhF+8iAN4/b0j0+qgibohpN
 9w7A==
X-Gm-Message-State: AOJu0Yze8ZYREc6xTq02ywxHHHXNXbpi0flax8zxiw8y+ib7dfYWDqSZ
 SQVn5d95spsyXvnZ4srO7p3xWY5nfKVtqFrPDHseYNzj2AF1lCMdcBzWlayhgyKzP5/UiM1/mSN
 L4hBVp5zeq3iBGuGT1L7pY7WxH7738CJaRaQbriY1LDHI81E7Fut8ysyL7u1Wcc0QL7Sp6Io=
X-Gm-Gg: ASbGncuSR5leJY8VDMMdagPcOPib17PAcs/4LjuVujePc4WtCY9AZxtAqu5IFzjJ15p
 nB9ISWTxVV9OH8XRHvRui8UlSpi2j5TvXMyzSptFaiStPGjxMC+S3tpkZ0qzwf5PSDmszKhrDqV
 vxaIinCL21sABF4sN1VYXflDjPpLPqciruxt+28q6JmozidsxpxWggIrxnM69fs2r62WMdr1t91
 jY3KzDlJ7hUhmpliEvaJN0HTqukJjBz3V6VYgNfo6/svLzFZAMywgZ9Y7dfq8j3hpM/0Wu8pr9+
 BnhWVPJL4pkPtoNpFBYL7ymTeSR4tXjNy8tBu32hEm6EDNjtROmtwHTa/udH3pS/Gf0HmjUf8kA
 YFzyxHzqidsaB5xiNASTBIW1xSixf4vdI2cy3Q/b5RD1ssDnl1Pwc
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id
 6a1803df08f44-70ba7ae7e3bmr68367276d6.11.1755348077611; 
 Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYA0jwLaGI60dgIdc5xLLC6MrgAPeHvs5XeZskw9tq2JN3MW49DplYWInTes5Xz+UumyLaw==
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id
 6a1803df08f44-70ba7ae7e3bmr68366726d6.11.1755348077082; 
 Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 05:41:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:06 +0300
Subject: [PATCH 6/7] drm/msm: hdmi: declare supported infoframes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-6-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxffZfdznR46omAz//o0FIm9ItgOJjoSW5dR
 tFCoAWaxwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1SJzB/9MbWkK1MsjNZOw3lcgrUqwdBEMotBk7PI88jIMb49m3q6pi1Ic+1OcZvMxbYHJ5ytFdOB
 99dkv7TMYuHpQwf5giIywYfwW0VuZrDAcFtTbCfvYKHASIQirPoDKIEhTcdtUUOtb2/ESl2OGr3
 yx1San5Qryx+TcnSV2oMfEjDBWqbisypv5F1qp6+85hJmN+eLfDeUNpy9whi3ZoY68pGFz7lzsi
 oCs8KusSv648XcZU8I8UwAZJVJBCPgNenSw72lah8u8Xd/o+1ZjHr39EmwY5SvvgFZNkRmzZSBy
 H/EjRxLrBHRVWid9aiI3/8ORFSsfpCh8JNlsgRLNo2FEBcrx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XgiLNzxnP75yNM56KtZFwQwQkPo694aW
X-Proofpoint-GUID: XgiLNzxnP75yNM56KtZFwQwQkPo694aW
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a07c6f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX6hUEbDNOUy0m
 j95Rjk4rurOFxcWiBhIRV9iSVcTA9cdy5EvRCvO1TViv0KlPOX/7URXI6U2Pico0iY4+drAWda5
 MRyqXDJeaPNpO7s5ha61sj88wTHiRUqKzBQzntd4TAa5IjnXt3jGS2QLwpd1X3bhCuPkeZuhWKk
 WCTgcIj41Qc19yTLWHpPBAOmmInMkc6u8AInWNck0P6qk1mnGHWDLb0R4HtyV7428hcvingEI9V
 LgAUglE2pT8nyBiqsTOqGRepR25f4Uwq6hAgrB0uYQkkJqOdLPKyebxtaIto4GwcjhnvINbt1LV
 McV1UgkFI3UQb+BARBc3oL9CKqzuL6M6mFMfsW4g+YQ/UFUPhsRPTgPEPXW9J5r/cY+g+mCX0Q9
 /m4ZCyfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005
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

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..aa36d203f38f0f5a197afa8493fafb20cdc43476 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -498,6 +498,10 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2

