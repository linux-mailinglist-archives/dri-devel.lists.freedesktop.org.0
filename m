Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD0CB469F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 02:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24C410E655;
	Thu, 11 Dec 2025 01:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjbV9boF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5SMCi31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15CD10E655
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 01:25:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BALR6c4212644
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 01:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rASoLVyrBJXhrF0h1gSO14
 X7uGDfAWAuGu7uPdIWy1M=; b=SjbV9boFGKOPGU85sUP0uH1sXjWnDG0VWfsoYu
 8fYFcsHGel8CLm8EU3thVz8dKEsSDAP8lkwQFtfYLprd+HJnTP2sl6qzyn4/g154
 Ykc9sAVzzvng7Al5Nj3ISKMs23Z5ffVimUopNm9J0PEMjRKxGqHcwN9L1pQItUTu
 C5VphfdxnqtFjMmWdipoJWDMNdypLQCD78BLYzgRDDe3gLibbqaHM52ZfrW1bYzh
 etxRD+CkkG3IeVbIQx01ICYYM94jFR9IgSYWa/OWtObiPVNHRH0FrPH22fgkhpxp
 10bNwGrIKfNpFZvsGF6jCL7lzosfD9OyKRi7ObxfXmAVOYfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygr88h46-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 01:25:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4efef582d65so10538921cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 17:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765416339; x=1766021139;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rASoLVyrBJXhrF0h1gSO14X7uGDfAWAuGu7uPdIWy1M=;
 b=j5SMCi31a/ITIB050rJUDKBTFXTgzHPWkcneuLpLVf2XBYgtHivZQwX7uy7SIsduSQ
 McRTr978cg+rTR0ekAwpVCMv6NysNeiUt6/X+ml83NJCJgqd5GwtUqOH8CC5XgYw+zfR
 JlAu6f2vv9ORkRWXzdF9QRD0JUEwHuyAZr0xD/Ay+flFkcJXJs8J392/stsn6NLV0qcF
 ELrOJ0EcOOzim3hzVgAuOZ6HNdqGaswgNYvBcowDemRhdan4y8b6zzyyYhzHl6N4WXHV
 UYPu94n6v+cv+4bpW1wmGjed16VPKE7YVxRt6luAuxcwYoyfItfmLjMNlNExHxc/C88R
 sd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765416339; x=1766021139;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rASoLVyrBJXhrF0h1gSO14X7uGDfAWAuGu7uPdIWy1M=;
 b=IOnSepm7z0NGglxrlPbVLvZjDNVSQ81H+DzoeZ4IHKrm+QDO4OJuaqSL/aKPwGkokd
 neeY99bQWexafCo00HtJKem8zZiVtc2gqdVqacR3kySD2czbBFI0lawB5b3c0nDY0PpR
 A+rmo+Tavn6VMAxOwWJibNWyTDN0Z3vL2dYb+tLnAn1KBIVXNkNJASSWFrqQVRbUvHbj
 Vy3ibwfnuNBUWANoilrve+kYoyFDNaEDUkp5XDTx9pg0kSqKPA4V+CNmZoWJwiUq7qmG
 jV6rXKyV90Chxd3FF1IXwTU5ULuVw1xK8MfmZFbhTpJZLOeIXSX8nSWxcp+Isw8VZPo9
 Gaew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUasg7djNwcJHzTy12OMe9wX9sVLiHeB1cB2i58T+aAN2QRiWp6BsVDH34mR4VVaYoeNH2yF1ohYGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycRkg+KwiNe+BNk8YSA0R9vQeEXBtv21+/m/AjssFY6RPuAVe9
 7hzI0jF9NeRJJnwudcL8T/w0i160iza/8bPKSx6wLUfoI6HYpJZdngOu4/AvBXzzxYB0qAcTlhg
 AGZzgD1++XXk+C468NpLtUhvYP5WTJSI6p2pdgtbNPcnGext324LXRvwxF7MpZ66cn3D1w5g=
X-Gm-Gg: ASbGncuJIHFyvjiQH/VYaMvVim2FsaxmBj1KXv6aTG0kHPhDEpLYpaW0ZIvkHaPFFWz
 hHYlsQVbMMrJ6kUSrL+ziGz+0gRMPTIVhTFGXtiPswrHVk+tQky/DPEc0s8GEa/RTBdXIJgcpsa
 VFUgsMVq/Ol2hxrYTu1/JW8qqBkJMDGJJMLRm69YrVU50LI43+4ghN5x+J+Bv+VqhVFhfwF6ibB
 qWqvx4CG5omli0ODaUala3QkOLBtgcylgnMO7f46Tq19pwxpUZrC/tO2Hjmc/xd/0xMNYKKxHr/
 F1hec4nmyJMw80B2ZPhr68CtzwCvG0fi56rw+NpXO5rcRCZ4W0S1kLvFCfJkBiQEREHJSmip28B
 PlEsvezU5xUs245repVHUEcnlSWa1MBwJiyPGyMP9X7akt7IxZ9e8xAQr0OiehisCuzoF04XTU/
 igNLRfi9cCEHECq1yfvnHE+Mk=
X-Received: by 2002:ac8:5cc4:0:b0:4ee:ccd:7215 with SMTP id
 d75a77b69052e-4f1b1897abbmr64678511cf.0.1765416338825; 
 Wed, 10 Dec 2025 17:25:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYu4ciIQEllUx8HjhR17H33wdlV8uzobQylA7fUJET6grh8RA5hdohpgJt/Dr2N3rxhiElYA==
X-Received: by 2002:ac8:5cc4:0:b0:4ee:ccd:7215 with SMTP id
 d75a77b69052e-4f1b1897abbmr64678211cf.0.1765416338293; 
 Wed, 10 Dec 2025 17:25:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f44c70sm383122e87.39.2025.12.10.17.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 17:25:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 03:25:31 +0200
Subject: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIodOmkC/x3MTQ5AMBBA4avIrE3SP4KriAVmMAvVtCEScXeN5
 bd474HEUThBVzwQ+ZIkh8/QZQHzNvqVUSgbjDKVak2NO4UKKR4BKZwWbTPNypFzWlnIUYi8yP0
 P++F9P9RLg+dgAAAA
X-Change-ID: 20250926-mdp5-drop-dpu3-38bc04d44103
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10816;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kWKRDCJl43QsXqXvV30S0DLIHizgcKtZvlz0/nRqD9g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6aVbJ9Nc/uMWROqX3oGPm+4XZZgW1HspTtv48FnnzgX2
 LJXXdDqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEatnY/+lnaVuvO19d5N+v
 99Gk8EHN2ZuWicfytzw9xid9ok5NIFf5yna9qQyH32UmO35pOxaT9PPUys3KkS1/zO/F7ZHxDZ2
 ZmVZ7xUDx/7xDDj90VP5HBc/82/enOVU6paX/4cXDmvcvcJ0u9eUwr3TunXy8UHhvD8/jP2//e/
 Nl9OtVS9zpn5ri+kv2dnaVb2n4xj1aylddPMriruoaHznMKDhztu6fhSrvVeQPi99fytShd0fX3
 PrK8pufPizs1Ql7e/TG71rvjuJTK6scmo/1rE266egdsecvY6D8m+tBEzaKxq9iYpH40Be25M+7
 j+KzfxdHTeXTOSSaesSvJlbOqO6HKaPqkX6Pljqfyq5YAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=693a1d93 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-7OkC1N2hDg87y89b1EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwOCBTYWx0ZWRfXz1BKH+8avfgn
 DVNrtgsp6uYVFiP6TQ/o9pX04lBho67o6JnmzldNrj04yq4d7Kwra09PcDvy/56H0Ec1rg4079K
 cDI7YscW9V0FuVszRyJGwjmagkcDcLxBAeD22RxIvzWhTRbEUQbU6QaY69oKZj1yFxpI5tZ/Q7b
 MMZOuhsFlodHAeZOGbWedg89z5FxwFNoRY90UsbLNxPCmQ+YJryrPelTLL7EdLo76ofucUneXpA
 vkq2kwO/HeaUpcnr7buL13TV1iYdUjdCsbZYo/HdRcnAz/UEezJOUcoQ2IL0HEM/MQbktezyBLx
 Q3H+YvKlmtvS0g5Bcl7PxzvPO9G9RClSAyu7R7IXmozecZlb2W/utS31c9W0SHAIW1OUapcbq9V
 NAXm6PXzk/bBIeBs/2pL975U/0J8bA==
X-Proofpoint-ORIG-GUID: IadiN4x5CabiSexs2wt0nHtvpujsUWKE
X-Proofpoint-GUID: IadiN4x5CabiSexs2wt0nHtvpujsUWKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110008
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

---
base-commit: f2d03d96ebe8f6948cea9a47d11728f42d62d0f9
change-id: 20250926-mdp5-drop-dpu3-38bc04d44103

Best regards,
-- 
With best wishes
Dmitry

