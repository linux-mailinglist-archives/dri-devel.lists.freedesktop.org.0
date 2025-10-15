Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B588FBDF6A8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED05E10E835;
	Wed, 15 Oct 2025 15:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToeZi931";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B89510E835
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:37:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAixiK002544
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=dZN1GMyJRm0hjQlF7gTjdyCVMbef56grA5g
 HCJDrtSs=; b=ToeZi931PSiK/IoAyhyzk6BaUaU35be1+sefPADmLNX8JWNW8Gd
 gJIqVvy9LMQXLGWSozn2CQ7Z9czesQq7d3wTrMd+BiMJsCAnbG0Rkzmk+Kdb4D7U
 wqzIvleOEyJoDGZWu1sceMeAMSppIqZswPfPUwTQnNlsu8hHoLM2ay4xYOAika1G
 fKHN74zs+RE77KZjcfmY1SuRL1NOuLccRMf6QRFqYziAMuEB2TIK7K4vaJw8T7k8
 GKsvGusC62wLU8Sh3hFdJRxcvYN9x91+TXsjbEuyd1vA/o55ZbfGGRSj74oXv98/
 KSPWeBcFyc0N6jjFf+de0Wm4xjCcHzt3Hmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8d07r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:37:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88e35354330so386534085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760542637; x=1761147437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZN1GMyJRm0hjQlF7gTjdyCVMbef56grA5gHCJDrtSs=;
 b=V3vZ8zpklMQfGVZc3/hNaVZ4soW2ikx0rMJIPVNPla89u4CvtHWOq8EhknK/JJq91Q
 MYBBriTZrlSO+NniHPvUx+Z437sk36YuqfcxVIklXGaBCpPbN6ExHg/iN+DlqHW34FD3
 lKW2hKCA0rovvr7ATbT7IWrkOo/r2uBz2Nue0dECMc5edW/uM2hoPPNQwZK9tu87fY/L
 rOpq+fkP+MtbFV7iCUclXBBEkLZyn6+xlQjFZ8zEbWs8+2LM9NW1MTDYozt5mtPYP8M+
 T5W/q/6G9RjtL9VpG6TiB9kpnX07VZvAzoi4VEE4tzxrN+i42PZDFfuKOq5NQoaLY33C
 xNqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb17PRFFl5Pamgm7MZULegfzkskgVakxS60dVOWG5yY6+aQIvgaUskjDpkEs4mEx7ml373hYMQHyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEEvp3QrX5XsDAZj4cxrTUN47kbInTVHfejqaRnRNVRly3dLJt
 f//GA5fAhXanOBOgniqa+GTdKSFm+w2lX2/HtOLlrFOSmc+8eP4uSluYmxnJv0tNSN5DAGhXdtF
 TAC8euBHFI8wo2z7oOq+c+0yLWwVF8AQCBAqAih9UWSvUMPxNhjN/A3fiJVGtiW2zNQg2C/WyOd
 faRM9196YV
X-Gm-Gg: ASbGncueQpAAR2RnRsi5DG4dPfzGmNyPpKs0rffx9bE4I1kUsiK9LjvEkPiTcqkYxWJ
 sFxgfFTx2lCvMtxW2CrzVwJV9WiNlouRfpT/Ql7IFDgyCf3JyBt0acSMQ9PB2NBm4k7gpZBuuG3
 OIfF/sCb/0Bs/Sy7v9ngK5RGZFhQ7Kyyii7VwZsQA6ZewF25cbWmz0LEBAoiVZQlmj2FsxvQKjE
 IVCgqLcvZMptMo2lQ8XO29PPM3h+J/tzYXDvpuMwSG1KCNlebQAoLRH1eDiLr0qWPG1DrNHnuGU
 X/0PJxssrBF+S5Q61MXzwKdYHVW8bddL/nzqqcMYsEyzgmBRH71e65UzyAsEWSCaOSZIII5TLQt
 AtYEM
X-Received: by 2002:ac8:7e82:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-4e7221029c1mr189799451cf.13.1760542637485; 
 Wed, 15 Oct 2025 08:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0IH0/ITMHy3s6jWGoCNn+SsmvbfoF3tGYx7cI41wDo+mWnIOTWBRCRq1frHt3u2Ipk+klxA==
X-Received: by 2002:ac8:7e82:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-4e7221029c1mr189799001cf.13.1760542636958; 
 Wed, 15 Oct 2025 08:37:16 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb965c599sm253136166b.11.2025.10.15.08.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 08:37:16 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix mismatched types in min()
Date: Wed, 15 Oct 2025 17:37:15 +0200
Message-ID: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oENA4St4Ai4RrKFrAKGjhXPgOx95JcUz
X-Proofpoint-ORIG-GUID: oENA4St4Ai4RrKFrAKGjhXPgOx95JcUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX9CqxT3z1arVO
 NIUyt+ZuPa81BbopiXHmFNYpu2Eg8B3OQzr9UKm0kUOK02zo+6B0TsHgn5GlVpFa/6LzLZsav++
 IlUIogEPWkNQX55TVenPT4GEy74H/bhRgFTcSQpHKlq1Lo5f3DGrFqrTPyF+VeMxHQMbNAM6f3N
 FAHduZxHLQYsY1nS+9AteDNcK4mr0S+H6WzBnMD/eoj9fW38f5/yA/ApQYCiK/40gciMwgdy1kv
 bY0Soy20HzF+Vqu8hIi/bh1ZRZ1mLVKyQOHrUw5PdL/CWD0wH9dttyYEDv0Yth5RMRiW51VONTD
 4KiuKiOdcyP8dO7xCWx51zP6MYsPQiYDOhBbiTzZqDoXsQ9qfNHx5Ots979+zFarvcztsHsBzYT
 5NYBF9nzw6g6xTMDPs/Fjjxfcr/IIQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68efbfae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=j6PT1K01a8H6cJ_D89IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Use min_t() instead of min() to resolve compiler warnings for mismatched
types.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..ed24417d4c8a 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
 
 	/* Request the first chunk of the first image */
 	context->dump_image = &image_out_table[0];
-	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
@@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
 
 	/* Get next image chunk */
 	dump_length = context->dump_image->length - context->dump_image_offset;
-	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
+	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
 	/* Avoid requesting EOI sized data so that we can identify errors */
 	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
 		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
-- 
2.43.0

