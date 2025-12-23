Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB262CDA06B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 18:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124010E139;
	Tue, 23 Dec 2025 17:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Urd4RnoV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0b16euX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC02E10E139
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:05:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNFr1UW4134029
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9c
 TvEltMSQ=; b=Urd4RnoVkQlx11NsKa0G0kkqeCzxweAX/Ea8M+uDy3gFXdgKdxC
 8Jx//dnjna/AroGnmTBE6cbUeg1sHgVkw9OeHrJFVi12Rf6+j79ZdZSeXcPGqka4
 2M+Gye8X67eoh5Q5crmjDZEu8peWONqYSEKEDp7zkyMuez7vuHpksing+6ekORMS
 ur9Z6K7QDjpTGH1f2F+Y+MKa6m3osaA1u/TZ73UBj93HYujj/X/ECSjAsMSgkaDQ
 0K1AoWXUzi4iIsd5Zal8kkWU0Y1epsTpmLrOGT5BcKul6MB04COPVY9dgR4kronn
 m54D41mTNQ/Y/OD+QmeDh2Vc/pkHR8fyKRA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46r7t7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:05:13 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-787d4af9896so67726947b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 09:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766509512; x=1767114312;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9cTvEltMSQ=;
 b=F0b16euXM/fA2+zrg8jmy8yKCDBF8CN1R3j6mIRtbg7JnQ5eTb82onmCsojuAHoW3W
 8bYVxS+U0+lKB0k+6lAVB8XDQoTJfm9LIVoyZRdTzo0k7DjjLvOeCoU0Wr1Bf1p9pUdV
 w34LLko43a3BJxG16ixo/zMDck5I7clIP2XNgMcFnG4AtVF8rwz9OiwG9UyxndNL9Vn4
 Nrvmu8qNv9336+FGFHqc1xTSZcY1hQ5ADBe0KEdm8H9a9WqmUIPnhPsaimpRWxgXJ0Q2
 pjmu4LZ+g+mar/oK9oYLOEB4gyHcxcVQOc1zChKX4ZO3x6FrWDSGqH21+zTkEkaOgzD9
 XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766509512; x=1767114312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lty1BfgJdP1IThHGEg1Cx+1VlMQBelYL/9cTvEltMSQ=;
 b=Y5BTRc9AsTjFPOYB9STX/ZfPJwx4z0OOKU7j6F6phE4fXIZmfZmfCjQQrexCdMw9Fg
 DsODTx74m5f2gC4ftJDWCDZtpYPr7IYKBdn9bi9X7eIKPGUOCOeU9hqV/EQY3Yep9rRi
 d5kqXT6K+ra9LkE4cI8X6N6ePiqQ1HWJ8al/ciswP/dDo4WEQ1W40SVIn5xgem6x/kNt
 +wz5tpYlHkjnbe1zRN48LZ1Y8apb97cwomIOTpQAeaJZ+ZeTX4xK5M1EdZMJ/kcILiL6
 SxY/SC9nli5jo31jJTpXtrLIUhNaedAMC2s6gtd1Z8C04iHU/ZxrJo7qIP6IGE7n7G7a
 VaLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn7tIP+GHnZ/KmjCcOXIgDvZ6Phy3l2+xRmdvZeX98E1Pm3jbFfp9zlTowlJlJeePZHKyd5/58VK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqMmaXCu9TXwGwgKVk+mnQWSOWi74OCJcnJdtJFnVEu0PbXbKa
 HhXqHCChbisDlWnzwZd8VouSvFh0C+RNct1fVa8zWWgIR6dFsZnIWZf01PfpzlEVPqyITGvR1Bu
 6/Z3rcl/Vqy7cCiIpnFyQxgYZIC7asiLw4ydhYZMgIHg90jdauYJxoJ041kUnACbkZt+CW9o=
X-Gm-Gg: AY/fxX7zI9mSwvrj78hjztLMD1ydy0Z3z85q/bZeZNdgOtaaDWqihBWCpnfR1vOqP0e
 JX/MLWVur9weVBSbJsiIm5ULpTDjQOL1LF8/p72AANLQv16gWNow/poWGiLURX6ArIvknipuABx
 z2kzzsxfLnEmBCyK5HUxKMUkqk7wgH6+c1yyRcPyHJD8HsckkMpPgwcgdpztSCqw1K9NVPBlbXd
 tlZYZOroFkxlpL1wlXMf7WmP0ltGoy+7RuX/fGjeNlNaOaq9lgv0t0+jnkznRZpfR+CYAJXSszw
 obiD6TwZl+7o5J+va9/844wi6zar9pf754ya9jQ3cI9Nh3yQmYA4rC6F+ZY5vHDYUe1IuYOgFRN
 KAv++8OqtQDk7mtlWeU033UsEzZexq6tlnpEIGpouMjGQmQ9ipw==
X-Received: by 2002:a05:690c:64ca:b0:78f:86db:bef3 with SMTP id
 00721157ae682-78fb3ec89bemr143585897b3.11.1766509512386; 
 Tue, 23 Dec 2025 09:05:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtal+VQw9moQgAJlGNQiOjoIoCovh6cf2uyp3l5LMuwTRUrIc3ALximy8LcYp/GcMIMVHb9g==
X-Received: by 2002:a05:690c:64ca:b0:78f:86db:bef3 with SMTP id
 00721157ae682-78fb3ec89bemr143585607b3.11.1766509511994; 
 Tue, 23 Dec 2025 09:05:11 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a5c4dfsm1460704866b.14.2025.12.23.09.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:05:11 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Retain bootlogs that overflow
Date: Tue, 23 Dec 2025 18:05:11 +0100
Message-ID: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uuYb1luuR3LkxPDHwK4JBhHJXy2ANShf
X-Proofpoint-GUID: uuYb1luuR3LkxPDHwK4JBhHJXy2ANShf
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694acbc9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6lPVHfNS1Hr4Jh8Zh9wA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MCBTYWx0ZWRfX/eBQGz6dAfcs
 RlKTHZKLvCQ8WKyxB56+nr8w7RWtYzIW6vOJiUhqDELY3TD6nDXur9gecr2PT8urCi2HpSvZyRK
 bgeZOu5kKbNVeEfCU5pn3RZpxzla/C6xJmtYGjgvBGVV0WsjYj7BGZyomF6rkXg5FqtkcAhf4hj
 GsOyaIuwD93q90Vakqqk6lEN8QPf6JmyR0qPzvq0s57eJDHqHON5S6Dg5rYi+UwYnRKoBLzjzU7
 vK/OLuuqk+rHpU/JcimwD0Q3V0yw26631FJOyfxxjGfrdTLTb2lOOGq5Z+Y5SPGrcOAzkfmOsdk
 oW0/ic32JF/zCAYsNkB03MoMo9V42u0TjkILUVogsObEvv0XTKH7DB4t54qhQBTt5rtemAj+aYF
 Ko33RZhOsuWoAHoT9YHKaoPcIlMW5OMFuse3xxzN4HBy8mq9q5vAlkjSOxtFJL9gwvYPd+XthHX
 8d9Yab9oj0Q73ePNepA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230140
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

When a bootlog requires multiple MHI messages to transfer fully, the
messages prior to the final message may have MHI overflow status set.
Preserve these log messages in the accumulating bootlog. Do not treat
overflow as an error.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..8623e8464c5d 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -265,8 +265,9 @@ static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_r
 {
 	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
 	struct bootlog_msg *msg = mhi_result->buf_addr;
+	int status = mhi_result->transaction_status;
 
-	if (mhi_result->transaction_status) {
+	if (status && status != -EOVERFLOW) {
 		devm_kfree(&qdev->pdev->dev, msg);
 		return;
 	}
-- 
2.43.0

