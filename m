Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGc0Nk6OhGl43QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:34:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FEF2941
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1B710E882;
	Thu,  5 Feb 2026 12:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOp7JVSZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPc0kA8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9BC10E882
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 12:34:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 615BAuKk3237295
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Feb 2026 12:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyP
 GInl8cyg=; b=MOp7JVSZY/ALykkCyYWDZz/ODXdG1ET69MWHRNxZhJeXQEEKPIz
 V24qCaEps6qOBJOuKMNUITGUAYCKbuHtBrkHac+0BaaW+pDqFL8NNCIgS7pIxYav
 VrKFV7uK8dUoim52hYQaLWd7WGoZkIKOQWhTSyiZpDZgQljjtVxXUmpvknP96c2z
 jJt8s2T+/tWlq10vcUUT/x2/gV8V8wB9OC8DvwdHUGP84vn/Shr8/7xgUcBqB0tQ
 bhrJEWP+5z6lotXkUQuSH87g6V+ewjkxkG6kKtXfuhOC9rbfik04LXIDNbVWGhjk
 SjFy2SnO2szd93aUTMf2x2CIGRem//g1vDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp52ks9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 12:34:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ef98116so235641285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770294857; x=1770899657;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyPGInl8cyg=;
 b=bPc0kA8mKCIs7nNBwdOfl0Z1YYi+w1SHpk1IEBA8xN1bi9UHiGm0/knfKqeT45YNxt
 zaB7MJMFesF4qvsUL9T8KkWsmYMo9L+ALeptdss45Po4wsXQYpELfn3n03P7uePQWRG7
 mO33GV8Jud9iLXF/i1KfDJFYA2xT9N2Nzpi23k0WmuR+pwauptBgIWxnfcXwmYC6//UL
 tjVKQQU2wadd6JXWFr2S+B20aLBbGXKlbANNwlm4WkaD7FTOvBNVIvXDUltI9cFgZbiI
 VNK+vzJQ/WKNHNtp+3875AZiyu66VtxWqhG9RcQGbUHplFbFLstccgpd67bva1GKhdfK
 bz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770294857; x=1770899657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCIkIyIVQgCjzCaP74H8XCjUPg5PtHpNeyPGInl8cyg=;
 b=b3yqVO6FLOsz/DDVSMplDwsuxUEbaiUR8KFDmJYo1DlyKZlJOHlc4Rcu2WK3RE9xss
 wlvUXCqP6NTIVctEuiR1S29e4r9LXJlV8pXnXaenet6M2DBCm6hZA0YoIuonxUaVhUwz
 8ACvG24hffc2nITjIsmYe0xAMKOr5wrv4OMY9ucA0XsPTNMPxr1kDnLEWEdChNYKgu/B
 HRSimoqCWYi+4vx7071V3QuhDOvnV3Cl8pW44qkAAJicssydS/3ZxJo9JOLaGFbxBKsZ
 JB6T4Q75pVj8hOCVAIjMdDsHjulTsMaOq9OQ6Ci5BzsO04H5/kCMeqiz3iWU/LW/moPc
 6lrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKBuuVkACcME1RDPon5/Ws63vqjztv0TvfZaX1fq/CJAgEvAPVSbCJa2GJQ6xjZjaO/2rBinnBf5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxTwV1zgIjfacl/OWCYSRLntP7I0f/jYcDFCcg9R0qtOho1f1b
 +f94u0mLWsRlGqn0mFCc7Jn/zsgkygmF9wIrEFX4fMNeAzicLKCA/54GB/KqBPuI+Q0qSxxYF4Q
 beyGqc/IXQOo4Sc67cR80YYb5chy7VwTS5EvRvS+WC9aGVsMob5zmfwTfQrEdQxlB5p7pGqM=
X-Gm-Gg: AZuq6aJyI2b0FSwpWH1/u+faVxlvUC4fgootuqUwirCIfcYI0st8/pxmzyLG3SjvNT+
 M5LnLTsrdOlNyTtxkmNb+kbeetB1KvPrLLtHau8GVpQtAnJeX+TsdLlnG/2PCAveh2qbCZuJyAH
 hwci3g4lftOVQRRYpWeuSRAxS4yAwxmb7Rf+F9fgPjrXNbhH/u05zA4PN9W6zPzhfrwccYjT5lO
 EKYr3lbqiIndaWpEFZDSa3iLqlBC3Hqro273HkVH3KCRD7lv+du7bXdWgFGTroRVRjo3FQAS6Zy
 vPD2uyhrfOhQcsD6mQB1QHP561yAonrluGy4wa51ssyUd11n9YViGk5oeBHU+TkPV94eE/nAVVI
 D+gnlK5N6Au9rXxg3n4R0uIPymn/2+2jGjeu0ZzZsu5we8Lye0w==
X-Received: by 2002:a05:620a:6ccc:b0:8c6:ec8f:c8a1 with SMTP id
 af79cd13be357-8ca2f9b7089mr803568585a.44.1770294856647; 
 Thu, 05 Feb 2026 04:34:16 -0800 (PST)
X-Received: by 2002:a05:620a:6ccc:b0:8c6:ec8f:c8a1 with SMTP id
 af79cd13be357-8ca2f9b7089mr803564885a.44.1770294856085; 
 Thu, 05 Feb 2026 04:34:16 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d8e8d4sm52190035e9.15.2026.02.05.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 04:34:15 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] accel/qaic: Handle DBC deactivation if the owner went away
Date: Thu,  5 Feb 2026 13:34:14 +0100
Message-ID: <20260205123415.3870898-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69848e49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-VEhWQ6g2OJpjJ3o7oYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zlsc_Apu8wTYpjMW9zV-57JCpWp6_AO3
X-Proofpoint-GUID: zlsc_Apu8wTYpjMW9zV-57JCpWp6_AO3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5MyBTYWx0ZWRfX9PRwEv0VVY5e
 2xVPXYIwV66mA9VTsx9UbwytYLLwN9jw9OOI7IoWwwvJpoXn4kLLrSOhL8tYQXKp64KkpYl7KjW
 drfA2mEHwGPhUfCN9zD0yp93fBycRXw0D68UQ/dD53EeKjTgtJkhqWWw00+PfKnbGpIlq/rG+1f
 otDDul2/7QtG9JM6g62XZBfm9bT8Ilol8LK00sgzmgZYwFucD9q4n7mR/Q83vHESAknWIg+H6UC
 OKZIRl07zv4O7QVohkdPA7ep/6nTqsxW5H8kwjhPCBwU5tiqeLyxMFDPwIwVAluZTbqA3vGLvHG
 gZI4cju2BfGHK4H4XY1XgJgNYp3UxaXPepW3w8uufbuobB+3tJEwlYcTc2XLBOna+gxBrjC4qHy
 AGyrCz92mUnbYRsvTmu3x3wxJ+OgOfzMHJH7HOBi2e8tyAgGTZlz/G/LLyajEXuGdNZ8Z9bwo85
 hyqPmBfDbYe/7YvCNzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050093
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[youssef.abdulrahman@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:troy.hanson@oss.qualcomm.com,m:zachary.mckevitt@oss.qualcomm.com,m:ogabbay@kernel.org,m:lizhi.hou@amd.com,m:karol.wachowski@linux.intel.com,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 327FEF2941
X-Rspamd-Action: no action

When a DBC is released, the device sends a QAIC_TRANS_DEACTIVATE_FROM_DEV
transaction to the host over the QAIC_CONTROL MHI channel. QAIC handles
this by calling decode_deactivate() to release the resources allocated for
that DBC. Since that handling is done in the qaic_manage_ioctl() context,
if the user goes away before receiving and handling the deactivation, the
host will be out-of-sync with the DBCs available for use, and the DBC
resources will not be freed unless the device is removed. If another user
loads and requests to activate a network, then the device assigns the same
DBC to that network, QAIC will "indefinitely" wait for dbc->in_use = false,
leading the user process to hang.

As a solution to this, handle QAIC_TRANS_DEACTIVATE_FROM_DEV transactions
that are received after the user has gone away.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
Changes in V3:
- Remove unnecessary list_empty() check
- Link to V2: https://lore.kernel.org/all/20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com

Changes in V2:
- Add missing closing bracket in resp_worker()
- Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..3842e59291b9 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -913,7 +913,7 @@ static int decode_deactivate(struct qaic_device *qdev, void *trans, u32 *msg_len
 		 */
 		return -ENODEV;
 
-	if (status) {
+	if (usr && status) {
 		/*
 		 * Releasing resources failed on the device side, which puts
 		 * us in a bind since they may still be in use, so enable the
@@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	mutex_lock(&qdev->cntl_mutex);
 	if (!list_empty(&elem.list))
 		list_del(&elem.list);
+	/* resp_worker() processed the response but the wait was interrupted */
+	else if (ret == -ERESTARTSYS)
+		ret = 0;
 	if (!ret && !elem.buf)
 		ret = -ETIMEDOUT;
 	else if (ret > 0 && !elem.buf)
@@ -1418,9 +1421,49 @@ static void resp_worker(struct work_struct *work)
 	}
 	mutex_unlock(&qdev->cntl_mutex);
 
-	if (!found)
+	if (!found) {
+		/*
+		 * The user might have gone away at this point without waiting
+		 * for QAIC_TRANS_DEACTIVATE_FROM_DEV transaction coming from
+		 * the device. If this is not handled correctly, the host will
+		 * not know that the DBC[n] has been freed on the device.
+		 * Due to this failure in synchronization between the device and
+		 * the host, if another user requests to activate a network, and
+		 * the device assigns DBC[n] again, save_dbc_buf() will hang,
+		 * waiting for dbc[n]->in_use to be set to false, which will not
+		 * happen unless the qaic_dev_reset_clean_local_state() gets
+		 * called by resetting the device (or re-inserting the module).
+		 *
+		 * As a solution, we look for QAIC_TRANS_DEACTIVATE_FROM_DEV
+		 * transactions in the message before disposing of it, then
+		 * handle releasing the DBC resources.
+		 *
+		 * Since the user has gone away, if the device could not
+		 * deactivate the network (status != 0), there is no way to
+		 * enable and reassign the DBC to the user. We can put trust in
+		 * the device that it will release all the active DBCs in
+		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
+		 * otherwise, the user can issue an soc_reset to the device.
+		 */
+		u32 msg_count = le32_to_cpu(msg->hdr.count);
+		u32 msg_len = le32_to_cpu(msg->hdr.len);
+		u32 len = 0;
+		int j;
+
+		for (j = 0; j < msg_count && len < msg_len; ++j) {
+			struct wire_trans_hdr *trans_hdr;
+
+			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
+			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
+				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
+					len += le32_to_cpu(trans_hdr->len);
+			} else {
+				len += le32_to_cpu(trans_hdr->len);
+			}
+		}
 		/* request must have timed out, drop packet */
 		kfree(msg);
+	}
 
 	kfree(resp);
 }
-- 
2.43.0

