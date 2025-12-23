Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB9CD9C7C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 16:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3793710E247;
	Tue, 23 Dec 2025 15:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOAM20OU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EfXiT0+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94C110E15A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:31:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNEN8q6913442
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPq
 ff6v6Mn8=; b=KOAM20OUgHdcNqJniN2eNCjI0K+WeZvY2AAJ1SwfC6wSJ0Ic+TD
 YyKLP2d6tgfs3gc2KWk+6JNFFbEHRelexnsMp4mKn8bLsVt1Uo5QKHcriCCqH/9Z
 MpeH3L2C1iifkmNDQmMer2BQddZ+LIOb5jJxPDF35R1EhKU1tWIxHuhwa/CSIFaC
 10WVCvUWBBGo3PNBWrCxtsDk6mIuW8LVs64ncL/GeG+gxFIK8NSq+wx0OVFG1H+G
 aAAq8y/U5EgaVOieHs+aN9sFmm1b9OSphtNSSO+oWQdPStcSdeQ65TV/alDj3/7J
 doHAmKfg8516Gk48b0RybjYuof0lOl6qKrg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2g658-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:31:53 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-787cb36b60dso66453917b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 07:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766503913; x=1767108713;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPqff6v6Mn8=;
 b=EfXiT0+DFAJF04r0YR/REEh0zi8fKfo40rAjGZtAXOasaqxToK5Gdm+Xo52z0ooKa8
 6I/cu0Go4lPUNtYAFkvisgcvpNuRJnEI3zJJY4U4h0cCvEz25L69G2Q14NwBvhieCkoQ
 1sJbgTlfFv2Iia7OaK7bit9OMsmMEnMWrD+IV/JRuUe4hTAFeNxNy29zbePnPJqICrtF
 aK8Rdx1h+fDli8067c1RA4VBDFSz4gk4WXpzo3cNZzQ4JohA+lzNmfeLKxhvB2TIplgL
 17a9kCCqQwkse27kb32FVlIpTJ3LQn1ItYQzBUJ1NDcwohuNjtqoCVvlA1sYTqeAACdS
 OVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766503913; x=1767108713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbONXNm+IJ7F2ekdkqPBXVenYQQPW3TJnPqff6v6Mn8=;
 b=kfhLKuu2+kFzZjoIjmkY03Qm79nc/RkPZWkMLro/EkCrlTjyCTR5qZlHtjkxLP5+Rh
 yBXvCmwQySkYHhCtEMMmWQ5YVyJzdcrd9BfwT2zFrLO6H2P0qpAJJVTPYYF+wTOpVRlo
 3liIXzEngYId9ekvqCeKAxR6NV1oim69YfM5tLQpGkqNxrLfUR+iA3e9hDx+SCJe6kQ6
 HpiEJbRdXHPiq5i4Gl0DdrzxE+7SnJ81LhWJgStMMSeNz5ysp2J8DokXUn0uZyb/VAJF
 BEXZiGmEpERlaFgaIiS/f6PjtjqLH2pZY7pAxhhK9dSn0Z5zzrAlUqhC99z0Ldt5gnG2
 /xoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbzvjScBg7ZelxPAgc2KOFw67EYSijj1GDj6SQkDJoRmwsipmS1zjzbhpc1KJS4g+HWFkvCyAr9eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww66//fnx+KxtQ8hK86JAOQDSqQ2rarKvf+4JOs5xQX0WF9pCb
 l4br7opIGEQXC/2KrI3JNLav2ZW73pDsQIpCeLERiZEZwo7Vq3ucQRwbL7NSX+78f1fTybIgc7v
 rWOEWg7+gkKZewXIGIg0D43eUHOSQgGZJyavjTcwwsYutCzb+WbWoDFrTy9RooZTbOVAG1RU=
X-Gm-Gg: AY/fxX63KWOPeHwdal9WDgsLWHm5GFhxevtDdyrQ74J7V306QIf3bLvYoMRlkzK1WKn
 oKVPlWytguulBFMAhtHtApT5bPnxUaMrMzknnzST0yLM0W5Suu7T7euifJJfsenY2IkE+M4ib2U
 mp3cJX2MhRLyXydk9PYFnOYwTd/zsoeTIyobTwUQxkCoTy3vK6gXGYeBahm13Bx9m55t64CxrgE
 nq0RYRtlUallLTj7pvbqCoA4IOa68TyQrvJeyYDrrZVHIoKMYzKdCs8kVNy5P1CdqkNsUB2ioLj
 R2jgktSVxFSKi/y/K8iedpdJu/sQjLi+Q2HNPJaJoGPWNyvwjGhzjKhmiQoAH9QQchbdQRjCP3A
 6qyGVSgkH0Mmv4TLMYjijixBQ+TzDl1cl3FLXRpe7fv69PjuS8Q==
X-Received: by 2002:a05:690c:4b0d:b0:78f:afbe:3e85 with SMTP id
 00721157ae682-78fb3f51e45mr264053277b3.24.1766503913086; 
 Tue, 23 Dec 2025 07:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDYZ/ypVkbjPVdKz60EJU5OhF3k5WjJVvfLWiQfiibbASy0/y73nBqB6WDkm4Ecqp5h0jZuA==
X-Received: by 2002:a05:690c:4b0d:b0:78f:afbe:3e85 with SMTP id
 00721157ae682-78fb3f51e45mr264052857b3.24.1766503912634; 
 Tue, 23 Dec 2025 07:31:52 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a604f5sm1459672366b.11.2025.12.23.07.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 07:31:52 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Handle DBC deactivation if the owner went away
Date: Tue, 23 Dec 2025 16:31:51 +0100
Message-ID: <20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOCBTYWx0ZWRfX2H5Ke50nRohb
 pSSDUm6pge0Ypls5abxBDPyRhaRGSROQrITSk7rBXTMeDMfSOaFgkqTuDKpdrNGtYtOCuQ+QeDi
 fDBhzyPCDeOxVttbr8fcWiNhlHDoswDTv7n1hduL70fheGaQKdUbCn8Vmn57CDzvC7eQYgOqrrm
 cF28dQMzU+S4kxPYO+DlQUf7jXsckNcDO7awsS2dEtijT27+C10GquRVW1NYaLV4MTKyInaMwVc
 6z0Zb3JBz6hHEsWE+yLH6mQ7ZJslsR22THHR6K7Xh/v0RDv98gPPZZcGkuYxm6gahek+zvnKxE5
 tcRESjQzo/APHGHOMBbc8HrUoZNGY3fHXWZPj5dzgX2szCgMyp8tnU4e4V24qvpi+bYUx0umqAx
 dKbUXgV/tlM3zByJgIPauyAXPK3NWC47mbRX2DfI/5S9ckI8A7Mjtk9vt4eaUykQrfB326AxDvQ
 jqhSX9ni8lFiyCaKRiA==
X-Proofpoint-GUID: zua_nkfitsBk_r2To7uJ6lmofAiJk6Qu
X-Proofpoint-ORIG-GUID: zua_nkfitsBk_r2To7uJ6lmofAiJk6Qu
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694ab5e9 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s4thIBPa2s14-dBPQAIA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230128
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
 drivers/accel/qaic/qaic_control.c | 46 +++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..16bdae028935 100644
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
+	else if (list_empty(&elem.list) && ret == -ERESTARTSYS)
+		ret = 0;
 	if (!ret && !elem.buf)
 		ret = -ETIMEDOUT;
 	else if (ret > 0 && !elem.buf)
@@ -1418,7 +1421,46 @@ static void resp_worker(struct work_struct *work)
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
 
-- 
2.43.0

