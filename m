Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF1D284B7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8098710E1B1;
	Thu, 15 Jan 2026 20:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mthU4qzs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kE4ZnI//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C561610E284
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYIdo2866464
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=; b=mthU4qzsZz5I+ucW
 iwOjZiK+6bpkiJYpr3K1jN9WMMhX0GecJZafQhvWcnZ4y6ISfXbi9LvyhwdwQzz3
 Zvceu9KKl+LjCe9Rc3jcikWQKWqjHZyEMe7wFmo+s2W+oOGfXF+9MPDMZI/ldXEa
 S96Q5CuUPAgJXooNYrSJB9cREwe8eDxYEArZb+UarrATR6qLpfXI9r3F4T2XRr2q
 5Hri9h5F6MQ2/U51rIj220xByDC603EDvNbUkYkOIHkOwOCQMLZZ9tLZ9H+hncxy
 APDmLubeRqOQaNVtUdE1IoReNmbLkrg4APq1jC4TC313JMgKt/mqEdNoc4hjBWv1
 hq987w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2japj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:05:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c52bb3ac7bso233495385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768507545; x=1769112345;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
 b=kE4ZnI//dIw9I2LnVgufC+oLlfMGtwDNM6xbF7kG164GNq3LBBf3ZRFlDYIrXFyL5s
 47TekVwQSQcupWS0dyO4Clz59xtbUEpYg7BolweFEwCcdXBoUQfahUnF9CTgGFlXjVa0
 wsPnaA0wJe7hcuA3EYzSGm5vSDjR5AdcGHIq/hkS8l6XM22hZIrPt84gKM+m3Hpk2/Du
 MSqQ+HxEjOj0iEXhcg7nWNy3zRovtRQ/79GGJSjCc3fSPBe8dj6Pp2XVNhtUdM1TwH3A
 2eRv1XhDrr5lKvgGWltr0wCSGhzPGpJmVydAO5wf3MzFqRCgum6VVCdoYZhpo7W70c4Y
 9ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768507545; x=1769112345;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f/enLxHnBBykrdCL+IaxgmW7qNcWXutcZNBdtd7FtnY=;
 b=DX+SRf76sxa//oQGJBCK0H//3+yfUgWI5WrhVrJqZVnpQpfFysgYRmjQqPt9p5LPcN
 WjEkNy5PwYYR/RW/YT7i+MMJq4oaN+PGGAbIN4bR0h6gYDMGDODlxPQL7DFLijwFHON+
 kzfM4se0W4VCVlxedF5OsrCQY/Ck2dLsTR4SUcKsqzzGJbKjSr8YzbeR6FgvxPduZupT
 AwcEGrN+XzH4ANh6vGSzEtSceDqmrogPQHUAqIMA9IjNAcOEOwlTxvDrsOrrzQ1j4bEQ
 D0NG7vmExOWjljRu330ZzeSYq9Axwjci8ZUjS0ejpcwF/phCa8OMNWPalsblNDGgae68
 lD9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyXTUs6OCxj7usb8DXhwiiaRFqTy7kB7U1f9jWDkyljGROyYSxKT8rwLsrP7HPBNgKqov3HZy0zd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz75re/88ELlHH9fpxLx3b4EC72lPJNmXUhCKjJ98CGXiEzb6nq
 hBJjuT6jtExDz6r36Hrxm79JFS5aUVp9Xd5dvX3NRA7pZctlqxlwV5f6pDd9AlOKQImMuIn9xhg
 GBfGI977bH0Wis27mj8P1a8sz7OLAi1JHdTfQrGvzGHP5Nudq5ksQtCVPV9ZNrPt0scG34qo=
X-Gm-Gg: AY/fxX7td0pzbuMFDoWBmCOfDqirg4c5FyS2W1kT6Z22iqlKJLA//sbhEvZNxQ4SCs6
 QD8WSM62e2Eg6jmkwonjSFz3/njcGgisJw1w/JcE/4yxwpCbk9x32u9Ry6uypuDPHcBJgY8j1ZX
 zSq4k0H5saGS+E9hgmWJ7ppSryvu0iD/k0q2eHQcHhpEgmnd5MMFqNzxBFzJ+7kwWHUd+mZv+dE
 7+2PDr/Pa65HPoeBhd9iGttbfaunXOQMeVigPLspxIpoCzLwmXW/Carv+qMOwHOJLmjAN085eID
 dHmlJPV2Ay/EnBs02s9evxSnwwFMoTh24sVs1JpCsNX6FywvH8AG0Sv4P4bsoDDlOVBc0zWtD0a
 RfiuB/QkfQJ/GKGuOrBRgfsRRYLh7NX3q7HbRbY/zDfTvHtMdPx85yls3Wz2AvLAwndg+k6eRH5
 Xc0tZqrDpyAQlOYU/g0QB+PlE=
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id
 af79cd13be357-8c6a678e8c1mr113035085a.47.1768507544908; 
 Thu, 15 Jan 2026 12:05:44 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:2dbc:6244 with SMTP id
 af79cd13be357-8c6a678e8c1mr113028585a.47.1768507544295; 
 Thu, 15 Jan 2026 12:05:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790casm1381901fa.29.2026.01.15.12.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:05:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:05:38 +0200
Subject: [PATCH 1/2] drm/msm/dpu: correct error messages in RM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-dpu-fix-dspp-v1-1-b73152c147b3@oss.qualcomm.com>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
In-Reply-To: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xCYpyxz2Y++3bSOvFHpWng3+Lz48nC4C6QeLJXM/NFw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaUiSa+LQBrNcwNslYVUlAqVNZ9NlLmdtfWaaX
 ubVvRo2GlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWlIkgAKCRCLPIo+Aiko
 1YLOB/93x1oEBQn3+4s4f1V4tQPtT/OFmIEoQR9Ac8P7YDJB+7Bom8kDcNhCOQ4BpxRcqnLccuS
 P/vLOepyMeMebSCIr7TINb/ZkxAToBK4uhUIH1z/A/8AdAPh+hribG5/jifPfqM6kNGVGNI5jAh
 /zL4kS2z33raiR74Mdmkzy8K+XTpIu8tHIH8VhptRoyizb9ojl0iomwRbHTzx3Cy+x2w6HfSB/y
 TntlP5sesrUtoTOTLjlNrwLP83+TeJKmNc8Pxqc0BarIA2Mo0aMiR1QvJ84Jyu1zUVu1C939I7y
 y8UoHyMT1Jf0PBlphk6nxG3X3xpAopNPQ04vPFJ6pJNnE8+q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1NyBTYWx0ZWRfX6xLjKI0JPJqA
 XH0QVRa9t4nVAUwOiq15MlBbVyC9ZQ2D2y81esJOlyE7zfig7T3ZuhiBvH3Yny96i6dpaqkTA1v
 1wFXfXYXDwjtltNrXDB+C0eqJItrv20j7H0nLVy3bn0iux0Wx+ywXQjxmUhaJIKhcYZteftP0LW
 1IP1nrS/sOHq33LeMQ8oIbvma9IYyCaruIWiQ4qrv0WQflP1TW2hQNrmNDBWhoef/X6NW4aIp9v
 CcUi/hsZ/Mq/Xzx8dosX66qcmkYhykqXZP5p03tPDf9QWeGN8/6V7bEgTe/JWObpmFAAZ/jAvvE
 KdZP8p8RIp9wVgWvMw+6Pb0vCSKXhnIRvPPHfYwcYys3yEBRA2P4MrDQr2ocoxu1YtOrLxxp/0R
 QKuAKHeO6VmVmw3EHSF9WuW7xEmnVMSgfwuG81TIbeJiIj+cOhwV3jSOLKxg6Jq1RBumAqYge3k
 d7jmqmpWnJScQjaQ2nw==
X-Proofpoint-ORIG-GUID: K6QXJJoiXf-vo4QHiO5hvvup5LPJU_Os
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=69694899 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LiGtz_15ZcBlpgV9qhMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: K6QXJJoiXf-vo4QHiO5hvvup5LPJU_Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150157
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

Some of error messages in RM reference block index, while other print
the enum value (which is shifted by 1), not to mention that some of the
messages are misleading. Reformat the messages, making them more clear
and also always printing the hardware block name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f6568ed8375f..7e77d88f8959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -315,20 +315,19 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 
 	/* Already reserved? */
 	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
-		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
+		DPU_DEBUG("LM_%d already reserved\n", lm_idx);
 		return false;
 	}
 
 	lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[lm_idx])->cap;
 	idx = lm_cfg->pingpong - PINGPONG_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks)) {
-		DPU_ERROR("failed to get pp on lm %d\n", lm_cfg->pingpong);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks) || !rm->pingpong_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid PP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
-				lm_cfg->pingpong);
+		DPU_DEBUG("LM_%d PP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*pp_idx = idx;
@@ -337,14 +336,13 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
-		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks) || !rm->dspp_blks[idx]) {
+		DPU_ERROR("LM_%d, invalid DSPP_%d\n", lm_idx, idx);
 		return false;
 	}
 
 	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
-		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
-				lm_cfg->dspp);
+		DPU_DEBUG("LM_%d DSPP_%d already reserved\n", lm_idx, idx);
 		return false;
 	}
 	*dspp_idx = idx;
@@ -364,7 +362,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int i, lm_count = 0;
 
 	if (!topology->num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
+		DPU_ERROR("zero LMs in topology\n");
 		return -EINVAL;
 	}
 
@@ -468,13 +466,13 @@ static int _dpu_rm_reserve_ctls(
 		features = ctl->caps->features;
 		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("CTL_%d caps 0x%lX\n", j, features);
 
 		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
-		DPU_DEBUG("ctl %d match\n", j + CTL_0);
+		DPU_DEBUG("CTL_%d match\n", j);
 
 		if (++i == num_ctls)
 			break;

-- 
2.47.3

