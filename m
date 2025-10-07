Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAFBC2180
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830A310E6E5;
	Tue,  7 Oct 2025 16:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrM1veyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15410E6E5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:19:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8fZ007920
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=K/W8W3/0EUILvvxrJjSwA/7Ax2aIlR0htR3
 Tzr1QAao=; b=hrM1veyE2WcuzXt2xg5JqDAQRM46v7yOXf8/18e/OnBqBNKQQll
 I+ADJx6VifwDxlr0tBLzQM50l+mEtDsxWcwEyIgjvx3uFQOxnJknKRj1ga34yTxu
 6k110atFeC8qlOcXPT7xAXYA8yRJMo9DzxDxSNwJlh+k5Kqpe8LWPCv6+jiX4SI7
 wyAHOocDoB3IsrUkkINUAnBX9jz9mURXH81ylfM87QN4W2Swf+Ou0ndg4ENdvcLv
 HrbZA9VJCN4tgRDc9X95+TMDazOiOKnm/OdynavE066/nCzaTbpvdrut3YBQGYjJ
 Fjf0lhrlg47dBwRWK+VSv1se5FbhgCVGdvA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7qr9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 16:19:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54a939c158bso10237421e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853971; x=1760458771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/W8W3/0EUILvvxrJjSwA/7Ax2aIlR0htR3Tzr1QAao=;
 b=bPVGYo2sUockmiToxlZO3kOdWHPvs5RzlJSDXQu77IpmQKqJ/elOodPVBXn3bLcu2x
 vZk7M/+bvQ8V+po0gKKvS37TZnUYaX1ChyzNEPxs+1CbyKRLXiE/Ak/+SlVlonY0zQZ5
 2y7VHWZ27SarAd0ZBzzIqiPmKWiaO8ZpdQ/Iij52vNskY1Z2UHd1aem3erW207KKrfzZ
 jphToRCLijn/wAPvMBufsnk9BYxitK9tf7Mhlk/EgJgmjBr9FOfKFAmUwveLId3ODmtg
 0O4pkz0l1hP05FN7JK0fmVSS0dWXvUtw33nDS5Oaygv0eFh9xCtQycH3U5qTjbgXIqut
 YH/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjxPApSg0htB3siJRhV7hOyVC9UcrU9hWEjh/x5iNaryK2A7CwUlshEthx12grAmMbMG+mqTT1iLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvL5Ikc5vUkAxETrDEb6ujtjJ7rql8Hx+p+32SqZZFnjhN7ckR
 wU1qWmkndXryiVfxbf+FiStQfFr5onRH5FO4W7w7ccLw3RWTL8s94ilrIII7wMyHplahr//6ICy
 sfagpk55TfkwsovzL/GvlPtf2dJ+tukPB/2lbOquxCCuyIME49UoIqkTKflC4oHePHYwSZJw=
X-Gm-Gg: ASbGncuGSCEZ9T+JsHfR2XHDz5RR73VHa6cn5EgYtQK4Zyety8o+bbb7n/ed1RX5LSx
 lgj6519qo+IhQ8faLxoijAwrfJUQozmntTE40+DuiwwYLgdQwyTyy+61x5Ct27cYMF6NkjNrBtW
 jXkX2KWCfV9cDa+whrpBbPcG4BCNa1gRzLDHHK1Ni+EX+uKmWUUpEmGNF9fzcnSSpOUEkSvnk4a
 3Qm1Z4rSY36QfQgS5MJrVBsAPUQ46Jw30/W24lzDOlPjXQ2AE0z/FszapQiccJIfSnwZBhHwBeO
 cXyqYfdsk0G/CAqWKM8kUMTMNwSuuHFxVpxWOqjD2DD31Xre4ugyLOODBWt30ItfcGNbTdiEfBi
 QGNERQTpXEA==
X-Received: by 2002:a05:6122:d03:b0:54b:d7b6:2edb with SMTP id
 71dfb90a1353d-554b8b42b9dmr96541e0c.8.1759853971080; 
 Tue, 07 Oct 2025 09:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6CIDr20wttQUFHuKoMRS1z88oWLbD18Uj+fbrWFmwKD20DyvsJJivv3KxooiNO7LmQC1DVQ==
X-Received: by 2002:a05:6122:d03:b0:54b:d7b6:2edb with SMTP id
 71dfb90a1353d-554b8b42b9dmr96503e0c.8.1759853970566; 
 Tue, 07 Oct 2025 09:19:30 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869b4e49esm1427128766b.72.2025.10.07.09.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 09:19:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add tz_qti_config.mbn entry for AIC200
Date: Tue,  7 Oct 2025 18:19:29 +0200
Message-ID: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX6KhCtHLP8wLx
 J71r/fua9zwTx5lrFr8KFaDhI2oALWJhLtFHdLcXBf4eBBXJzki8jNrkb3jrENXhTM8fE49SquN
 M2LyNxPfFwUAqvQK5SEO+hfmycMbp8fzFNwd4NxYK6C/xyTpbY6gZZR4KyoOfBtTK8CbYZMJmXk
 xWOH+3sC+5fsdVjtxnILj3wMqRhg5R9yFuoI8DzMVmien7Qh7yWRFRflyNmsV2p3jmZKmppay3P
 IV8NDyW4W98rQJyo9dty4qlLXLmE/6IcHng7mYPGhDf0r0hAyNI9TTDYMM87e0Gmm4BBMI2ztUF
 KKcYy6PAccsuIlcPgXr4qmP6Mi7EUWChEhU98TL+CF4KjwTIK5W3Emfa1h1qMCgL8hVfwclnCm3
 zNjtN1nYiUGRtZ2ezxM9K1vw6oNeYw==
X-Proofpoint-ORIG-GUID: H_3QMhAwRKz1cQHM8vbrRNCIOSFfErPg
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e53d94 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m9KQAbKLkPdkf-ZUn-cA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H_3QMhAwRKz1cQHM8vbrRNCIOSFfErPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

Update the Sahara image table for the AIC200 to add an entry for
tz_qti_config.mbn at id 76.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..2a7b3f725de6 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -214,6 +214,7 @@ static const char * const aic200_image_table[] = {
 	[73] = "qcom/aic200/gearvm.mbn",
 	[74] = "qcom/aic200/sti.bin",
 	[75] = "qcom/aic200/pvs.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
 };
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
-- 
2.43.0

