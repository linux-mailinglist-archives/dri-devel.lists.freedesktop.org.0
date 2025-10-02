Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39900BB5A57
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 01:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEE010E85F;
	Thu,  2 Oct 2025 23:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrWQ47R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5F110E85F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 23:57:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592MTwRu012212
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 23:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PWeX3pwFQajV931yQ8BTkc
 33/7zopEsdK/riLLlmelc=; b=mrWQ47R7piAFE+oAXbyOprIKNRFSpSsulfDU6J
 m02E7BDjNnGccIUWtEOsamyFzuRA5bzM4b7E2WZKxtaqShRz5C8lNJizKSgJq9xP
 HMTxNeBMXXC42akbNZcaQDrsxzwH+g8eKjzFENGfA3YnnnPBkJGITSM3KXRLRO2L
 CyKLSKcWmfoduKOlhPNTS4NiyyN33+r5IfZhXjNzwjFF4Jj1yArImQlRaPudgKMr
 kx7NVmS7ilJvGlncEol4ISklkf5laxDkTQ0Qk6KnLCdteGHSZo+wEmTpCU16UnDU
 5VKlKoeSHiayoRll/x+e0Nn0p7v1geU0kIS4Mfeui26ayocQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u1gff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 23:57:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-28a5b8b12bbso31963115ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 16:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759449468; x=1760054268;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PWeX3pwFQajV931yQ8BTkc33/7zopEsdK/riLLlmelc=;
 b=KgP4SeNCmcVSWqkKV3d/lVmi6j38pqAhG4eThMtLK/BP5MkssFRlyU7QSIeX8kqfU8
 6cLbAsVZujD3nraZfH/fbPYg5F11IJ2exfNWcFVid/60J2inrdoNfLjgfdkBpBF2wwt2
 Ddi9vJJu9DFnXb0MKVLe+3dgZ+y2A6hdcicM4O6VnVhxjNQQ44s/vvRGGb3wB4Wfu/k3
 /AlPGjeCTfNFrz/JajjB00XI+T4b7kw5Q1fZosN1U5kA/dyWol8+gb1BH5+tQs3B2ELC
 doHjk4tTK3g80SViLbtewQdP335ceZlJVyTuo9z1rHehLHgUAzGyt0Eslzq9vfhfho8r
 SKdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBuPWaPFgol/rH4SDaX18YL9yvdYz6c6/PQQyZcIWKMAbeDpSrPi0Cl/EfKivQV0LzF1jQMBBuqSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgaiP0aca9glyESahjgKRABMTbWfv0lRtavYUccAHjg/Vh3oSW
 w+CtwZqbFKhoEmV02xQCFwqH16Y/ke8GDRuQ2JcbVDBSxve2dXWvSas3zReOHZSAjqOO8t3hDor
 BFl0BfzPHhRSVZl/hzcUsatrtj/3vcam3CjKXWhrcLTyhQ8+qq5Jf/KySmNm6zQlB6uxDVMjMbC
 nViwE=
X-Gm-Gg: ASbGncupxUGud9QuRJpDhTXZ2JC75cX5YUVCo23teja1G3NtQGd9g6WYwO73QqnJmZ1
 +eegW+FNLwfub6xTr0fPyFaVJ2x/rLh2dRZDGqTWIO6wR8zlPERhH9SqzpUWNc0AKNFBfsi4wCI
 m31f6sSAKKxQL40ZKeynjdBvOq7u2Uz9Ie/20Llg++0MV6Z/eDijoCDJhoNCb5Xq3D/ICKIHheD
 v9UEW+FVu0ggpOFEdZ2XuRIGmOZUzB0DRqWMFrSWpuwZ2Sx1Qe//KFP2d6Hsbwl5FAsxBfdhRPX
 kBH6nxp7pLWEEnUs+76EPTiQ0/2DN1vN6VEuafuqkgO6JMFLFUbE8ogtqVjOkgGxb0dzTqH60M7
 7xSFUsIfV8bSgsPD+f1W4le2RPX4HbA==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id
 d9443c01a7336-28e9a656975mr10213345ad.32.1759449467809; 
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt+w1yH8tjJDlpzM77QlJgNO6+lvwpEnpefV0xzKNfgoby5Ecn/s4spLV3aQXIHkcWmUi6rA==
X-Received: by 2002:a17:903:b46:b0:28e:7fce:6685 with SMTP id
 d9443c01a7336-28e9a656975mr10213155ad.32.1759449467361; 
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1b845bsm32064985ad.79.2025.10.02.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 16:57:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 16:57:35 -0700
Subject: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG4R32gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMj3cLSzBLdwuT8XF1TQyPTJDOTRAuzxEQloPqCotS0zAqwWdGxtbU
 AfC2RVFsAAAA=
X-Change-ID: 20251002-quit-qcom-5125b64a86aa
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759449466; l=1286;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=bgT3hSLAPpI6ylw6xIFQ0tOWQoAvzGbHmZph6BNaMVI=;
 b=l8iBum1BMYFVeRyUUElwyPpEZN2AqzHaItOorjlKbFsSKPlE/Wlbl3eMGu6V4Bszw4fBeLeAO
 FXoo6kQLfstDYB06w7tBX7xdwDLo2BfVlqwff9d5pHGZxwUF81ZnY8P
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX9+AJsamZ+95W
 UZOOwfMOLVNiLz6BbQe50/9Nw66tCvKN/HBz/tsf52fZWYFNG6oR6JQuxy7SUGQJGcebScto1y+
 CZvyqv/1OCDrm0jmEXs+IbSOUdatzrL3geCsuSxUlRFcZhF5RgmEr106WCdXwqGbRrB36Sd6FGq
 XyMfbt/aYce5WbHxnW4uzR5a50ZTLqVGD88wsdhId6+bQAxPrrGdpUCosBkeGscdqIG0DQYsZ8O
 myLbEuJxhhqMgWQCngkmIfQoGAc0XJ1fEDbZPW6GVJyQbA0acGTBvoDsDrbyx+vD/2l7d80hDWT
 FotyVuoSJowtQN9fk5DfKV7lDi7uKxS6DfXlitML3lMemsVtxZAT17NxJLubD3jG5SW6wVzVuac
 fKgUZdJ0fkFqJih/ZIPMiTI1sZovuQ==
X-Proofpoint-GUID: 5RAh1E9uYypxNmH_BotpZ34jtloeK2U3
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68df117d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=KKAkSRfTAAAA:8
 a=69LWc1rl86c1DZQ69rIA:9 a=QEXdDO2ut3YA:10 a=2MHBSq50hwYA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5RAh1E9uYypxNmH_BotpZ34jtloeK2U3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

My current email will stop working soon. Update my email address to
jesszhan0024@gmail.com

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7515a412e9..7a712ded8f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
+R:	Jessica Zhang <jesszhan0024@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251002-quit-qcom-5125b64a86aa

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

