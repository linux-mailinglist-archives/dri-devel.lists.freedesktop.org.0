Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBALLiMPrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3722B7C6
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8610E35E;
	Sat,  7 Mar 2026 11:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5xH9dh7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kU4qE3qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFE310E421
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6277va213757571
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=; b=D5xH9dh762LhVitI
 i83guZKqD15/hYO5iRREcmno9jDXEswiErwKSxmn+Ozzp9tu0YGwNhMwN/HgNS+R
 cNHsenMNULEOgzUurieZ1+EDPTLs1pvTTHwKV4i/diV3sdQ3H8qjyTEorsf+Cul9
 cYydzxd1Bkzz8KNd1htSVEpBTp3y8xArLNTTRaDHSk8ybNHLjL0eu7UrajEFIi8v
 0VPTZ8g5kTEtbXPU1T4HvDfihDLUtzkjJaHVguwAOQOI9ATEgLx/p4BAH2Yyc0cv
 PzPmlm+oYXFABJuPyWs6Ebh6gkd6XttAItuPkowZNstWTzXJo1wrdJHu4NcMZ/+X
 t0gaHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6f8jud-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2ae6961bff0so196224645ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883744; x=1773488544;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
 b=kU4qE3qnnkjpnGwdpxTPZQ8rI2l/QtCu0TTk/KGYhWseL/99/WPDtqN4MxoD0cugZQ
 sNSTTZ5g/IyZ2Zn0jXwQlMxMTmxuH9M5CKDmlIIGDOpUnoJhbAzWFNMH8k+GgQ4QlGGq
 z1asIRs7/+5ltZqxfdqAKuZTD95i3t6w39M839euSYWCnhCa1J6/SfVMuRlUj4yjn2n8
 X/y5/JI0oanHtBIm5F4zkyzmSsJnLcEWJ9ZY8niLRQFQucsvf1uEZfwdWZRB8avwRxTk
 RhQIPsRnpzbqFJnh+KViQYZ1IP4GkpdCTx874iBCm586b2rvCFBZNL7zfy+cyhyHIHAo
 ZiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883744; x=1773488544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DyQ60u+QKjNmq9e6aqhBdHEkIcuie4R8oY+qWU1KytI=;
 b=Alalq+TExxGkfLeQMpzbfN//U6/pcPxTvZ5t1KPSMvIAhMKp/okeGqQUsJPnN4HC4R
 RsP7i8jGFWYWPl89VS7fJAXUeq71CpKielS4YWAnMSmiipD3rmkfmrFC3ZtTJkZuMLss
 xhWiqOY/h6CQLFPyCY9OrlR8B5LaOYJM4MiBWv3BVYR92T+JSaosNCwjreBZmnwmp7TB
 4meRJE5sMAKj020hQ1ewyDsJsXd29NPdLldD2OuLcRa2FvaPtB6S3q+/KX/3hLt8gvLH
 yUKFxn3zrI5tkLz2+Rps1I9hPXsiSTNTNxlrr3wrHuK69HwHlWeKY4+IKibWrOKsh393
 o95w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj1nNPqIgwhopwJN5f4g+gBOhTlIe9kQ9yCALrH6SfuZAFX7ExFMtILijPb82sIkR+nsutw9wBOTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVRbZyBYq5uyyehKoaC4sQw+o9zcuuyix9yIz2uriGzZhAFtDE
 Jyq58HbC9awLc2hqtHOkbya3xTkDtIA8zzDNIzj9fLK61+kCPluF/Yf3oUssgUUGBmMq5oqKFlp
 7s6nu9HqntYyfnkj0w8KKZNxevWOoUAPztTAlCKrCxMqlaFhaa0biMwALZsvtKZpS7bsKHUU=
X-Gm-Gg: ATEYQzyPG5zLJz3MIktPdICHaG2kKJvXhbXIHz5WUjDmfM7+vJ81R/ay4sqxa8yToKx
 QCYamRDG+StxmC03NmHuBsqCxsnoLv0vU1xUvtOvc0U6AWe580LNiL5Owg52bkxbq4+TSx7Jc4C
 IlwDntBoMiZs+SZW2cjC/eRtesEqN0yWnozygdh3ysZaldr5C+WXVvtGm6ueMQUwzIF3lNPt6h7
 gLIv+Y18DDExTkrmRyN7uV0XkcBAkNAK5VX0sErHFgUBo0nUkDm1GmdlPyp7HGGsPNZ5OmI+Nxi
 d9ttx37FsNUbH6eOU7xKs/0hZNkXNiRP9kehPR8rYCrGLOPL/hwK6GL7tSkqDKqau3Vosee/ExM
 b4PkEJV5FIs5JjaPbdfCUBZ1FxLwTEok4XZtfB0CGVkV/gDrDhnU=
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id
 d9443c01a7336-2ae82266d9fmr51669085ad.0.1772883743682; 
 Sat, 07 Mar 2026 03:42:23 -0800 (PST)
X-Received: by 2002:a17:903:1968:b0:2ae:8062:8362 with SMTP id
 d9443c01a7336-2ae82266d9fmr51668875ad.0.1772883743238; 
 Sat, 07 Mar 2026 03:42:23 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:22 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:27 +0530
Subject: [PATCH v2 6/9] bus: mhi: Load DDR training data using per-device
 serial number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-6-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3692;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=McPnRZC5WUBs06Eu6S+05ajVf/2AASOXcpXG+shgcL8=;
 b=/todAhtMbh8tFvxjx2w9XFXvnGlfpGJTYVN+29dh4Z3dq17sjAF3Pro6/6WgjiZnJeVmxJVQ6
 LqwCNEkdXMcCqIkt4DUmOEwvVVCLoyVZAnqiZwj2udbkqLxXIQnmFXz
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: MbmpGFrjmXmoBmYfkeaGSIbOVgg94ZFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX0V7oq75Jql8F
 WOiZKtVwZZG1qZ7Rts5oaME4fVSZtAS6gacmyeQO+svW0dK7yXxytv9az8H6V3AIZzJGkMnzpf3
 qUE10lE7AHRNwAV0UhBmlgIjNls/IrSLJIgNbZNGEUYuqnFYWVufSL9vrScXeDsZ+usf2yOGbo3
 Lc4kkhhVYMl2uTW7mJt5c87r/Rbg7CmrFPAbf0GyHJT7ewgV0Hd+ZKqN5GYXxeWvwXYKBowpPtZ
 s8oZDiNtDeADNIQ8+rdSc7SJlTSeqX9MDyH4NVGm5DCexy22Xihsija69qCk21CgFPeHwAqy0Hf
 oMVaACN9C6kFcJHreqmDC5sRAaUUdt1YUfMfxN7U9h3oOuaRVai4MLj9bwJv3FC2Grt65SoTk9T
 B50nfpj+Z05amuf1Eav9Ti+CPSH22kvIDvckr7F3vup//q3H1KGnfQaLoo9A1C/WS9+RtBYn0FI
 nIlmJ/7DbJu8eo1YMtA==
X-Proofpoint-GUID: MbmpGFrjmXmoBmYfkeaGSIbOVgg94ZFD
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69ac0f20 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ygoVp7MZ-9MK0Bp9ExEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
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
X-Rspamd-Queue-Id: 3DC3722B7C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Devices may provide device-specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
per-device training data is available.

Extend the firmware loading logic to first attempt loading a per-device
DDR training image using the device serial number. If the serial-specific
image is not present, fallback to the existing default image, preserving
current behavior.

This change enables DDR training data reuse when available while keeping
the existing training flow unchanged for devices without saved data.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 56 ++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 73ae722122a35b77760a4816bc60e6607aa53455..19fb9cb78fbecee047ba27674043c0940e749195 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -61,6 +61,8 @@
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
 
+#define SAHARA_DDR_TRAINING_IMG_ID	34
+
 struct sahara_packet {
 	__le32 cmd;
 	__le32 length;
@@ -319,6 +321,7 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -335,18 +338,47 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return -EINVAL;
 	}
 
-	/*
-	 * This image might be optional. The device may continue without it.
-	 * Only the device knows. Suppress error messages that could suggest an
-	 * a problem when we were actually able to continue.
-	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
-	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
-			image_id, context->image_table[image_id], ret);
-		return ret;
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (ret) {
+			ret = firmware_request_nowarn(&context->firmware,
+						      context->image_table[image_id],
+						      &context->mhi_dev->dev);
+			if (ret) {
+				dev_dbg(&context->mhi_dev->dev,
+					"request for image id %d / file %s failed %d\n",
+					image_id, context->image_table[image_id], ret);
+			}
+			return ret;
+		}
+	} else {
+		/*
+		 * This image might be optional. The device may continue without it.
+		 * Only the device knows. Suppress error messages that could suggest an
+		 * a problem when we were actually able to continue.
+		 */
+		ret = firmware_request_nowarn(&context->firmware,
+					      context->image_table[image_id],
+					      &context->mhi_dev->dev);
+		if (ret) {
+			dev_dbg(&context->mhi_dev->dev,
+				"request for image id %d / file %s failed %d\n",
+				image_id, context->image_table[image_id], ret);
+			return ret;
+		}
 	}
 
 	context->active_image_id = image_id;

-- 
2.34.1

