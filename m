Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4ACCF005F
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 14:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E958D10E356;
	Sat,  3 Jan 2026 13:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGewXUaE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arTr7g0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043510E353
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 13:45:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 603BMm6d3703062
 for <dri-devel@lists.freedesktop.org>; Sat, 3 Jan 2026 13:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=; b=kGewXUaEx8mqQl8f
 HXISwuBm60tPFJGv9CsceK1O+epq/MonQwxdY1P2x6/sGoyhdE9ClLTbsqDvtIRg
 ebURpTd8c+4c99J2zNA+xa7zJv1jJ+ofqWhNqlNhBGo9/OBxJfWmGwQPXJkfJf3X
 inNZwl9xqsaKLFvaUQPrTZF0Gvz/qO6XqbAPkTSA12ySyMy0iCkg3RBwHwEvVXmU
 O42OHDs1qLGIM7OI08hnCtiO7gumLxCbPf+khbwyXEl5hhsjtRYKwAimNYozgriA
 1EHGd83KkieQ29c+EkgkyjcwPIiQ0uhgPO0wjNyjmZfEhlnNT4/kJiND7rg3UjjD
 Jm0ydQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qrqc1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 13:45:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed69f9ce96so463415141cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 05:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767447910; x=1768052710;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=;
 b=arTr7g0M3jGzjvP9HKNw24m/JxymYcIGOkcu1C23pZmhZxVfC31lkmtO7OpOek5T3H
 uIAr0lT2d/60OEflPgMBCCo8wTb2VKURV76KELIJcO6j1THEMMjJZaeOnYOJsjfwOwHq
 Av/ijBFmUydsBP9wI8W0i3gNaZIbNImFPk7ezU0uTt4hMUkU99BW8SYsIN2fX3bIPYly
 GCTbybSc1mCJKD0xvp+MoIkYktqLSWD7kj9FbmS7hnRLS31kdi86ZeTnSAOorLX2vbSm
 NrYhk8eFs6TzHaw2eaNgKWkdLXHHWozoDSHIVzbwLFW2A2rg0ywODZfvB8QspFd2Uyyu
 GCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767447910; x=1768052710;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=;
 b=YhLqWYE9ZB3Tdl4IISWPOPECG8OpQUeRAm0AKCIgaEJotr3pCjq/mou/L97SvXX9lP
 1abvTPKE+UNGVwGvdwmceAfQqNOdG/MaSkU4gjbV+tGoHmh6HwsIuiaCcf6tsErzfAgp
 oyge7/8aS6IaYk0se3EHjINljMt/rL0gIPnjqR5pcS7h6/kRrxVB0Z9p1et+6RM+OlxP
 S1Y4v45b4c+d6kQWwKzZRZNXT8wIbV8nj/PIvNG32ZKcLvs6OmsU9lFy+PHEY89aMotf
 47i4sDanXH020hF12ryqGsIDbJ7Tl/wgHGFM1bF3qQ0MirXUeF2TYk0K6nxVj0l1o2H/
 +gBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6m67ovtH4yzIu+BjyejE8BgqcdXdI7qw/1lGqychzsAPXSLMeeAj9wZGdhTWlROCye1GE3gNXhcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywqutz407hOws76/xDc+Ih+F7hJ+FamyuWQY4NCGKLd/ztorwj3
 xx9RsBy0nhGlmIzafjUj+dIOHO0NabuWC1XBThaxjlu0w7hHYzCDX8ZrIEMyCdSR/KZ8ad7wcMH
 ao6qNauXx0g3LvcFgV13PSUNTGmM7WhyzpKPQXsxFXDMS2KwspcwjMwOJ2p30diNZO61LkAA=
X-Gm-Gg: AY/fxX6i9vTtp+rD9RmVu75gEdiL6D25Qz2zCPAYngLZ7THU5sL7LU6uddFFhUpInPr
 ptSN/MlRivmmD+HFFBaUjKSlb6tisPwXKqigqIM5zJguxnlirIp7nlr+H2R2MBgchn5ABJgXTMU
 db/f40bC4pe9/5/uL0nDGlEeok+IC7t21huJuTfz6gBQpLkdM6+9J+qpDojZwI6nPpVl1GesDVZ
 Q9yUhTciqoyrLwRs8U2IaYr2QRwUUemxdtGzzUTfp2Erwb5wP108MmvdYjBMO5VAku7Lawgx0eb
 49vVWNPq+6D21T+xyA+/txksiYmyH0G7ysMQF6KE1QR/+fllx94iG5bYO0d4dZvzjzAUnkHECYc
 YTuBkXcxR4cnhbNgm4txlE253UYNuuwSrSo1CpPWkwSm31kuuJgNzT0fboheJosgArNzOWQT8MB
 wYZbdK/Qh+JCeaOupzkuxmzaw=
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id
 d75a77b69052e-4f4abcb8e00mr548082661cf.10.1767447910495; 
 Sat, 03 Jan 2026 05:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXIHftH501Xcz7KCHVqf6NVsmLuQhDuE8GsYwFfscKWj1PNkWCl8PFicDVboZqEcS7QGM2Mg==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id
 d75a77b69052e-4f4abcb8e00mr548082441cf.10.1767447910092; 
 Sat, 03 Jan 2026 05:45:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 05:45:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 15:45:05 +0200
Subject: [PATCH v2 2/3] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-max-mixer-width-v2-2-ef5d3d246709@oss.qualcomm.com>
References: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
In-Reply-To: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q+6Hy5bqNCfkb+pfv9e+lklJAD+9trTQ+iZuAR312s=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlZHWKjI73KgwBmz7MJKjjT2qRFABHkI3AxrhBbXqNUR+fkN
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpWR1iAAoJEIs8ij4CKSjV+roH/0AV
 Op0fcJYg6gjaWvUXZmerJ/B2VkJLRxcC+tIPtrFMhlEFI5jwPPjvDHN5ZlJyi8GTwYjDPo61plB
 Jk+sO3wctRIbOh6NTCiV7cTwDRdJeQYdlZwj+hlRiSD9bpkiNtHOx0UU2TJItgIfrVaW3srE8hk
 WO3v6dsWHPIqDyiiu6dA+nt6D1uLVUa2muhPUrog6BlnP8A+dQqc+7K3D/k8HTNx7HiiQXVI6Ai
 FxBvuCWmDEpE/YaNwo5lRgn758jGluFf2VJF1nWBXR9y+1aTN+XOthQALDVV9SULNxDVeGHmKPa
 4MPFMWUeq2tXsfHhaj47aar/D0X6A40XvLQew/Q=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8txy9zRtCo11xVNjmHTybvZmIOJYvYGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNSBTYWx0ZWRfXx+znIM75Of9j
 XWeVupgCSNKKtgzeVNrVxJ7PHbTHBIBxbZlVf7HKs4YTkXIwDgzbgeOL7xkcytgMf8qoCCdvMsU
 r+i1XZo/esfTgBBSHwmeN2ycjQRbgFchVyS+Zov4z453Rsj2+4O5bDdS9m8yOsciKv7UAH919zq
 T5fykLu4ZJeVBCvoHvG5p8TEwWKDaVjLb1+bLQ4iu09KAB0Pvp3CHadjasnV5xy7We82h+JX5Jy
 hv3/0Huuz+ynm9rtQUEVhAi2nD2sWI3MIrG3uo0Jx6TIhkGNgt2RwNMmAZfGtqc4E4ykyHjsTqd
 jPn2vFQphokrm3FXgZDLg6E1Uru3eK7Pe5Ecz2vqVTvQGscUVfKA0i045jE1WMUOd0Jy9a378e2
 9XjAWSnqqTrcLrlBwYJ1zI9UqGR3fHsciezzHPPP8eKhUUNUVU/3Dlq6F+J8fO7kfSFerIqS9pY
 Gls/MWtCt5P02h9drfg==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=69591d67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 8txy9zRtCo11xVNjmHTybvZmIOJYvYGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601030125
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..209b1e27a84b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.47.3

