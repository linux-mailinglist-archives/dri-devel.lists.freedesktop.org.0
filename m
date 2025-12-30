Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF3CE8DF3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 08:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DBE10E837;
	Tue, 30 Dec 2025 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8ePar5P";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ91mazb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722F510E584
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU3jTlX3555683
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=; b=V8ePar5PZas27O0N
 XepAp/AYHkQaYpj8qJVyocRxKNWb+EsapEwSKeSVwf8KGX6vmK2+C/duGaqbD4h/
 78Hi2IzDJT2YJ6sDNIae5006SZdFGy7UoXUTV+UpHU7OzZNlm0iqKtyys41VswVJ
 zuMjqL9DUHpna0nIsafXXHKM9vqn73uIYkpLwqS/Y/8K/RVZ5v3eJAUaITb7564a
 VzoWIey6iPgoY7vCqvfgk80vSi5AEuqRGjnlY0gs1eIgUYozd9seWWktdqzm96W0
 jKnAkyq63/wT0m9ZTlCAjFj2tHVP9yfA8hHHvP56zWDJxutkMAZ6+ncaPMDeqR1C
 v4bAag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460due-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:18:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f4a92bf359so219930921cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 23:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767079082; x=1767683882;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
 b=HZ91mazbXNeke7CVDhuPWf59s6g5sBqpnNR28Dx/DgEBurRx3i2B/6UycZI5Q6uzof
 2kB5aQL2Qo6qWHaLnkF9IKTiRY3stW3ieLDrWTBou3GgRYJS+Wvs5q90N6vr2mwxK2JY
 JTBnfJQ4H/Hvxv3DU9p1fPrIL+Ok+LntE7PO43AI3bkvTOtTJbO3q+gh5OPQs8DB9G7/
 a77LgX1/2fNoWgknqR+0dQS82ZZm/WqfyseI1P145hgS9GKsA1W5SwaA36aieb51+zFj
 3hn7pm36lpueiF/FoZTr1B+rvHtZSfPaQqxtrPJlPc7F1nRnXJngi0FiWzUINoTfdjyb
 Lqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767079082; x=1767683882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7IWCWQHb5RZkH9xPpsD5CAr5iVUdZiuMhuEQ/RcAPNY=;
 b=rZDuuep9Nb1eZiMqrpSsjuOzOyTzsD0CaKJC2lZo3m/A14QfW8MM/8kKe3QyWKPILB
 BTdKvAAjNSBIBE9kLr6rDHaQsOkBVFXZLGplkKpn8jLfj1TfhgrepgW5T65YGpGPYSad
 f2QlsRlzc1DhswANC7XF5+zZ+qn0R3NMpyYSa9vb8MwgAAVLhc04JzXvTt7ra/3J6Z7K
 /bTdyx0/uwRPRcNsWsSuFMLXpIFmR532fNpGVh39GKlHsUaRTrOzb4r6yBmRhGqz+TVb
 RmkPaeBwedjhskdDtG/3LXyOgoAlLQWxbexEAPiNZVZ9sgtT/Gp7hW0oc1tloI1F/PD1
 H2Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+a4q0pBQXe3vmUz/QC/nd/gxd4H13xtw3uYZejT4Thi1WJaICeHtjNAScv19eAwGuxxgcuN0xPds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwegSR+19n48ofJugevwqesM+/KrckBLf5/0jhzm8/PRR9vw+bv
 o/F76sk6SOV05G7qI57UxGarNVTZXcCt63fAUxQv1uGV1XS1sdxoCgsY+gEu8TTAetH5M9IZWYz
 NT0m3/AevfsFeCiN4FDMk6yMYGYJXVtNqn6lfi+GW467Vv9YqBQpR1+tpYm0ocmFmqJeeNuw=
X-Gm-Gg: AY/fxX7FPRXwupSUlGBvcnPDPczCv/YK2vV6wSDpRvwct1zNQ842/dO8iO4OArKp3Hk
 /1McfO3BBAeElEmXg+gbh6zdxxZZDg+COI0YHYDoutY8CO5Jpqxm/VYQFr5Q9TfgEWJqjZzJUhY
 mRFZ2lSuentySvwf5zgHikCEHWN8CS0Wv6HdkjdAgSoVKKS97GX/W1IWHyiUjbPUyi6STcdXtUI
 YM+XEfYm9SxxZc/kNAZMRHwZ39jY1reWlePC4CCUr8ZwVmTky3nB47Fh9n59hIfUg/IqvDGubBu
 Ae8Qsq7zT6M4poDZMfPJabZNzTB6bn+X5kxpufn4uoQRW9JDPIWMoJnV7dkZlX5qAtYumJ7JbBN
 JmAjF6bpDQSdcNWftvS/hbaXKiz9bd1xXmI+Sx2SAptCp7QuGroDxkZ16cl9QQoCeoZdKUH3kaD
 EIv5eKmC82/gtrljCCJGFx8J4=
X-Received: by 2002:ac8:5acf:0:b0:4f1:b1f5:277b with SMTP id
 d75a77b69052e-4f4abcf1700mr411938081cf.23.1767079081967; 
 Mon, 29 Dec 2025 23:18:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG324K85m7yDjEZXYmsG5fS9ySOTai8im//gka+9/vEjIqBTgdbRhgCp3G1/uyWeNikKwr0YA==
X-Received: by 2002:ac8:5acf:0:b0:4f1:b1f5:277b with SMTP id
 d75a77b69052e-4f4abcf1700mr411937941cf.23.1767079081510; 
 Mon, 29 Dec 2025 23:18:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea2d8sm9924615e87.45.2025.12.29.23.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 23:18:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 09:17:56 +0200
Subject: [PATCH v6 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-intf-fix-wd-v6-1-98203d150611@oss.qualcomm.com>
References: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
In-Reply-To: <20251230-intf-fix-wd-v6-0-98203d150611@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=s/p//pRO52a+gehzMR/sFVop1oTXxVfxhzjK9LP7fJQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpU3ynsSsMlMuwtytXfGI1rhjTQi+MYEO3VVZBX
 HlRlgx3voGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVN8pwAKCRCLPIo+Aiko
 1ee6CACq3OfuJrvP77XQZe6UwVZrm/81YzJyAC5ty6b8U4ZvOX4WVCvZoCQCkfFSYJipc7NEHeB
 T+IrEw2xOsyFblk+ID3LPSXBsxP0M6CS8I0AoL9/tj+L12IctyNKZKRvVZ9qVM4RGBnBWmQA9er
 oXAS//or68Ynx772Qbso4w10bnJiUGFbBz/bFb4Z+zueUoZ58QLva4F+k2/nFbKY064kq2KZmgV
 3F31T3CQW4kjPkah3zNI7qgJhzE0Vq5kGLaAxLvnQf2WzCghGWQkgcWGHyMEpcATjfKp73RZMqz
 Pdjn72VrfqsKm8Q1MSi7ZeUsZhcs1kJn29z5G6VYaaFpvZ04
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=69537caa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=JyrEbUn3yN3s6GbRLFEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: ak9dxCVOGTyQB412g61CTToSwaPhEoNm
X-Proofpoint-ORIG-GUID: ak9dxCVOGTyQB412g61CTToSwaPhEoNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NSBTYWx0ZWRfXzHfuQDbkJynd
 Hck1uTjd5irJVIisXk3R1MVQSzU24zSV5cV4+O5Txv+lbDkNIxoaaB3uIubJEvFhY8PElD1fLPP
 74BVzNy83ZrEipT0ujTLExCe5Um5EHnulkyTqda4n3aNlTOtLpAOKrQTwJPckVkQjrmKV1/Ag7A
 2H1gGWr8Dytt58jANblRrYCpuLV8hbyIDejKRvqB9cts2O5ulpE3CGP1r6hVVnLji11nsxsmPcX
 ocj3LbHsbzxs38HLEy0wa08lOWXYY09B5hFaL7302Mqv+1gObO1KshEUUuO57pk+mD1vzoNhYpj
 J04w/R677dHspP6Jxt1C8bWyltGAe4GGDtdzFr/NNuQeLNrzGlh4aOlkK51I4tT+gNWZqTeMgef
 H9oEqQUk0sjFZmz5nvw67wLImeLA7cDy70HkTfcOjLKORYkBQZBKHYeGeMIbJQqGkXYSYpybbrw
 rGx9oOhq5JQpin0K75w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300065
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

From: Teguh Sobirin <teguh@sobir.in>

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks. Currently all code to setup vsync_source is only executed
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
[DB: restored top->ops.setup_vsync_source call]
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..3921c15aee98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,6 +774,8 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
@@ -781,17 +783,15 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
 		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+	}
 
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+							 vsync_cfg.vsync_source);
 	}
 }
 

-- 
2.47.3

