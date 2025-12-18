Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31ACCC4E4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2310EA09;
	Thu, 18 Dec 2025 14:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mswjy1Vl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxbLZNKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF0D10E9FF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIB5N6r1334811
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=; b=Mswjy1Vlgde/VVMV
 PsnE/UvWUYz5E6XJaUWUl6XlpMDJDecx7hz4RFl4KFJGCIUxmvz7cYFfXJxYXPeC
 T11JnGIiplug1yP7+AhgW8OgmHkE3MdQn1Q2CL08e6dnj8YFF+U2pUHE3thriXiY
 CblQa865hk3i3341DnHYkfPnsneus0H+CVkIaBEfh2lke4cdxSxrijIg5TMjimn2
 Xw2RirzFdd1fcdHX8kXDRyHkQEHMtY/ZBN0qVEkOeIDoPQpYZQdJFFepIzdRPdfe
 GUvwwB77W+ZEyp8kZKU7uVEQx7x+bvm/uwNP3dDkw+Evuw2SuIY4B+qPYsP+nJsk
 6vadpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec0mju-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:38:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1d7ac8339so19960041cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766068711; x=1766673511;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=;
 b=PxbLZNKyO4LLi8nLCfxjBaC5/WkihJLg7hk+aRQWLrDziuWBojxRlTbG8JFA1Fst9J
 jmeEwBwLWEU5wSdzbwONqz6ha7d9a32HKGKwJs8YH+lagbb1NLJKYlZCmO0hiWW5+/sZ
 XiYhPbHoSg30f78t265JPtN+wn9CVnJgCWlGGoWvVK+jPvo+iDV+1RQbAg5p+RxY5jWU
 xrV1ZjvxzLcCcFZi7ptjSrGOZzfEVbuF2JspVaFzkRebOICZR/9Wsafu/BxZK9xdezJO
 8T/syfuRttyiUEKVC3EogD6x0R4p31BFj9RyBQSefUvxDxO6ys4089JWyODj2zSDavcZ
 83Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766068711; x=1766673511;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=;
 b=MWMkYQXH/j+XAL5jkKP7kUq/eayVA4UDZ9qAnveMOaRZNvSdWPI0rvNV7luFjCEiC8
 sXY0+EjYMoacg8tar2FI8p/0CDkXUZefuu28HoNb21jzOtHdCtJwKllzZ+5zePTMBVI7
 dz4U3l9LPrtA5tBaSeXyLu50D0QlxLxTmcenilNK0nwG39meTYk3bFQ2IG9fRH+qFRbJ
 zBXtDxuJQQzHNpESsxxRSBmzmOfGsHVFZ7DP113CKCEjc5+St9mP1nBeHVkOP69lyw5G
 GxyWJkXVsoxjbqOLM+/AuVaolFgT7ZSmIvq1p1LI5BBX8OTxvIpMgaM+gD4dGon6d4Hv
 k0sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2fkMI1ZxA6y3uBgC2RotlVWMKJEhQ5j/bXgq0om3wVqm+EEm8pbunRR7MfXOrGQCnbLPIYzad054=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw+Ud/5dnsOcKrVsBaKFq/GQNTL+gnaVVWsTWcCkqQufWzhIa0
 2Y9LIfISt/21Axvh6/o7qpF0vz3BOxNby0boVEBwMtLLHvuVP9FvmixeoDk4rXT14+rEMPvNlVA
 YoPR0you8/hOiWsNpKXWPvzn8w+++pp9iBXBIPkoBYAlTab4Saw6K1+lmhDiwcL7rdp8/zWA=
X-Gm-Gg: AY/fxX48QZ54AddcFjREOASdJHFthg3QO03J681VPsBfTXI2w6RIa3ypWsn6lkgT3vb
 Bd41D60tyhbk/yiRqKxeEwnYBBCGdf9GfN6Rj2D8YmMQASBquki15YgLsDtG54OmNSZJbFPLmLo
 D9fYDshbvyzfki/8rqMcVd/lQvKocntT1U30mQGJmmDIReLoI+cdgUghqOKNRjm76fFkduOiNNr
 3RsFMy5zrM7aYqZWz4dssKhnYH/dohSTHYG2/sPPPQyuz8c+onIE7aHjc1v89zUotsWaqQwMChy
 UBYg2NpKVKbec2ZLxpV93yLd8IsecEVTGLiJwqGmQXgy/G5kQ8XHBn+6sHGxUOyeAUdBUUt4Y6g
 VmkqZqOuZhSQLYTDGfnPnH4Qlk+OPZnVD7bhL6iincQgEY+mp+U8TGJCM6qQaYXHrNH9nzcrEtI
 VdXNEYIiYyQc/0CK1GxDMUcrw=
X-Received: by 2002:ac8:7619:0:b0:4f1:e99f:7d74 with SMTP id
 d75a77b69052e-4f1e99f80a7mr178650591cf.12.1766068711206; 
 Thu, 18 Dec 2025 06:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlEjQv+ygaBdqph3ve8a6YaNgg6UhxtXDrabzkJXxuxcFj1Fh/AECTZrZvFwrReoNsFEU/Mw==
X-Received: by 2002:ac8:7619:0:b0:4f1:e99f:7d74 with SMTP id
 d75a77b69052e-4f1e99f80a7mr178650211cf.12.1766068710573; 
 Thu, 18 Dec 2025 06:38:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:38:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 16:38:25 +0200
Subject: [PATCH v2 3/3] drm/msm/mdp5: drop support for MSM8998, SDM630 and
 SDM660
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mdp5-drop-dpu3-v2-3-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10672;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ArL2dpKAJjAc+7mXNblJNDmtmUpgtot12YPCAF2ieD4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHh76SAH27gYa/CXPaY+ut8tVW+Fwu+alavP
 YH4oSO/buGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4QAKCRCLPIo+Aiko
 1SqWB/4rPUw4X7Z10ue2JgU45F0EcvH0czjZ37NeLdgRLPzEAt85KbAar2zJSe/MRX1cAQ9GLFM
 eq/DhzphJhGxxnSqvGkGxwVPs2qMTRjl2LAbX8mGhSrKsYZBUeDS+WzfVJ5ZVeqCuIDmNz/YD++
 Ea8SVWRLTeSMzZCKiqPf5Op9Omwt1ZT+CrvC+V6frFocaEfizf0E7d1GVQhaKAlrhaVMAelEHd5
 Hny7NV2JZ4p2U3fAfN22RirB9nYq+1EoklwoOEq0Dd4nZqy8XOAXF6NPiNC92UV9DyxvfhKQbp7
 4uJvmtJeAqJJLHPhPaLvi1A+AK46JXIoeiJWwXSLNcmalzAu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WKhGzt4ZT4UUGnMz--7xXRoAyi7ekmc5
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=694411e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-7OkC1N2hDg87y89b1EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX1jlr8TfqS6/T
 EwbhnGvprA1TC5lqI4VFT8iSHMM4xyPbKnshvdNQuMKY1Ba7YdBaz9+3gUyCZs2K7rSZEo0lR61
 mSmll4vqYaKtRReLzPVm2JW6I+woeZlDJjK6yA8i9GEsH38DfbCtaZXnFDee1FV0hTN/k9xTBJD
 u3wqSuHEPFBaplh/y9g1zaSu53BdWAteSNEzIAa5xEdRks0gyJ9vnba2dV4cj6Dp/hdfHTNZimC
 Y86oTrvfTjUNgcR+gt9wU1B4m1XWc6dH0syBkID5HsU3Y6UsSyzodR9nc6zkMm6Cof5dHOMEmcj
 zDf6Dm079se7ZVR+Qhi3zzgkYiHFrxovYGAezrpV+rWHAyKmPHusk2PhRZqOsWwY4QZWBgs8fV1
 GBLwUNIjP4lY+QkXkP9QAJsI6ailtg==
X-Proofpoint-GUID: WKhGzt4ZT4UUGnMz--7xXRoAyi7ekmc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121
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

Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
by both DPU and MDP5 drivers. Support for them in the DPU driver is
mature enough, so it's no longer sensible to keep them enabled in the
MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
string. Drop support for the MDP5 3.x genration inside the MDP5
driver and migrate those to the DPU driver only.

Note: this will break if one uses the DT generated before v6.3 as they
had only the generic, "qcom,mdp5" compatible string for SDM630 and
SDM660. However granted that we had two LTS releases inbetween I don't
think it is an issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 314 -------------------------------
 drivers/gpu/drm/msm/msm_drv.c            |  16 +-
 2 files changed, 13 insertions(+), 317 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index df464f7c05bf..69fef034d0df 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1097,310 +1097,6 @@ static const struct mdp5_cfg_hw msm8937_config = {
 	.max_clk = 320000000,
 };
 
-static const struct mdp5_cfg_hw msm8998_config = {
-	.name = "msm8998",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf7ffffff,
-	},
-	.pipe_vig = {
-		.count = 4,
-		.base = { 0x04000, 0x06000, 0x08000, 0x0a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000, 0x2a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 2,
-		.base = { 0x34000, 0x36000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 6,
-		.base = { 0x44000, 0x45000, 0x46000, 0x47000, 0x48000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 4, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 5, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-			     },
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 3,
-		.base = { 0x78000, 0x78800, 0x79000 },
-	},
-	.pp = {
-		.count = 4,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800, 0x6c000 },
-		.connect = {
-			[0] = INTF_eDP,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm630_config = {
-	.name = "sdm630",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 1,
-		.base = { 0x04000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 2,
-		.base = { 0x44000, 0x46000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2048,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 1,
-		.base = { 0x54000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 3,
-		.base = { 0x70000, 0x71000, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm660_config = {
-	.name = "sdm660",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 2,
-		.base = { 0x04000, 0x6000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 4,
-		.base = { 0x44000, 0x45000, 0x46000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 5,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 1, .config = { .hw = &msm8x26_config } },
@@ -1416,12 +1112,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };
 
-static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
-	{ .revision = 0, .config = { .hw = &msm8998_config } },
-	{ .revision = 2, .config = { .hw = &sdm660_config } },
-	{ .revision = 3, .config = { .hw = &sdm630_config } },
-};
-
 const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
 {
 	return cfg_handler->config.hw;
@@ -1455,10 +1145,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		cfg_handlers = cfg_handlers_v1;
 		num_handlers = ARRAY_SIZE(cfg_handlers_v1);
 		break;
-	case 3:
-		cfg_handlers = cfg_handlers_v3;
-		num_handlers = ARRAY_SIZE(cfg_handlers_v3);
-		break;
 	default:
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
 				major, minor);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100..abee7149a9e8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -960,23 +960,33 @@ static bool prefer_mdp5 = true;
 MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
 module_param(prefer_mdp5, bool, 0444);
 
+/* list all platforms that have been migrated from mdp5 to dpu driver */
+static const char *const msm_mdp5_dpu_migrated[] = {
+	/* there never was qcom,msm8998-mdp5 */
+	"qcom,sdm630-mdp5",
+	"qcom,sdm660-mdp5",
+	NULL
+};
+
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
 	"qcom,msm8917-mdp5",
 	"qcom,msm8937-mdp5",
 	"qcom,msm8953-mdp5",
 	"qcom,msm8996-mdp5",
-	"qcom,sdm630-mdp5",
-	"qcom,sdm660-mdp5",
 	NULL,
 };
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
 {
-	/* If it is not an MDP5 device, do not try MDP5 driver */
+	/* If it is not an MDP5 device, use DPU */
 	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
 		return dpu_driver;
 
+	/* If it is no longer supported by MDP5, use DPU */
+	if (of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migrated))
+		return dpu_driver;
+
 	/* If it is not in the migration list, use MDP5 */
 	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
 		return !dpu_driver;

-- 
2.47.3

