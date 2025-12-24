Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD90CDC859
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CB10F7B3;
	Wed, 24 Dec 2025 14:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBX+zNDA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vqw51Kkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10ED10F7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:30:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOBWMkq461339
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAA
 pEKpbMJ0=; b=dBX+zNDAcbxfl150SJjWhSVXHGgisWl4Cdu5MukMPsTOQWD/qud
 Vt48XdJZjw9L1HD+BpZPV2cxpz5rGlZWuADq4NFdxnpUb6y7lWY7VKsigAdg3c3q
 tWnR8WctPBk43l6BjsqdX6Mac4w3gkX36nAh95HwlV6D5kTI3WQoPSrmleXFPwK6
 NzQk/9r4zP/MT5X/wI+KwJUxTZUUZVnTppPeWOMYVpZZ8WBWn383ILJVrOTFHDkg
 87wFnpTwsKoWdYu23glHd+WFfNIh5x9/1fBcGS9/nWz9SJhGGIcGt6rEaI/gNQ2X
 KvFdAand+LSHIZO2+XrxQP7WNWITc58wlIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fucru-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:30:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f1d60f037bso137538521cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766586613; x=1767191413;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAApEKpbMJ0=;
 b=Vqw51Kktk+XfeOsu+SljH6YfFaZS4oXaz/huAmsG+xcP7K1sOPVtZryzXvHdiAfqr5
 XJ9HJu1CQ9Q21h12L6CVxpGDIZLSTuwrKyRxAfqfozjG5aHN3WRfBGsix5jSpmqjPB5P
 H4COEpfcuY2UKiLl4iOc/aGnHKXCaerSlN5nwOoOeOaJwlgF3WKOaK5EegSPRrdfubYU
 QD2dXRC7A56TyWdGMfGL56Cwy4VJ/Jr6PVe2wLzJPOMtKV0jXUyiSmr4+O8qDEZwtHn9
 XXmnu+duV5w9KUghg65QZeYFMFBketKatgRe/Xt2OQW7jxJONFfsl4/EuI/1ZdDuG9yU
 w2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766586613; x=1767191413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uN953iS6eEmzv0omwG3U2PvRvqgZptxlJAApEKpbMJ0=;
 b=TJTcgOD4fiH7wBQnegplyXg2WMefPJvK8xm+kxbERp+20Icz+9KsmCAgvbVoZhCLBe
 m1wGj0/7gOY4DxNcJXeIq2Mcm8RExwubss2R/5MDO521tDSUdCLpCzc7+2z8L2xQ4ZIl
 AIuHLyM4fGme7GfuHaU+3T+3cA3KFfH5+XmEDqgMdTPKg6t0n+RF8qx/aboCeW8oU8BA
 kyNAsH94m+IvrMdHgiiP0qW9c+3G/RYCXPcolLSy2QaZIPVN0T5HgEYNNOHAcAPabvkR
 CfcLbL0uGSE79mnYpw3NLCWYoXRa4EuHYLSNDpjH2jdpYt5usPQgPq4kgT5OK49YJ9f3
 dxYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnUXLm3jJnCC6l4x0FYOjcXxUwkye2ZnxFCKPJWMn6Gwp+EOBasJiIih2QSErJ1qSOB8Baurkau0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypmaHl132V5B1ONsmv2gvrpVbHtp7+2g0pm63vNsSWo74z+Isi
 Pbo66j3eNa9IbpHOB8hej3cOAPgNBQC6GwQYhVw+3UnDAvfumPHYzgrWAPsqBYBOjZOz6f+vrL4
 uE7sabxYLw7+I0ZZwdTwpgo45wMtFEtvZBq1ZHW5VDByTipVjec+5yjFgi71L60n4uqinezM=
X-Gm-Gg: AY/fxX664icNHYRTD1ypAkT2WTKlm3nzTTp5kkMcOh9DxUumvr8H0l5HYEfkiSWNLi3
 WlMF7j7DaJcoKVSAdZX82sSN7sTiTKuu0vcJTw30IMXYU7jX0K/pQ5hQkjW//k15ORFRWaJLziu
 VtmkgOqhw41Em4x5uWYl57vQj1FCfjHaQgOf9J4XnIkpwnm5rpwbK2lFcuMcQ9qp5wB68jWD6ei
 G6Z/oqBDty92ox/nPoW3UixJVRyt3yl7NMmM/kbjhGek55gX5MQiyss+DHg5FyJzWGjxBjfnBjJ
 SbhcaNkVaE6JRvSCdSnzi46asn5lRf57YfzZ3/Zy48m/CTQC4LUAYaMrPY4AgK4U6Wd3J7VCwiQ
 nGoRaO/KzvajAXxPHCw49k7Mtav2RXqkjw5UIY2ih5IrA0Q70Wg==
X-Received: by 2002:a05:622a:446:b0:4e8:9ca2:b9ea with SMTP id
 d75a77b69052e-4f4abdb2ee3mr276576861cf.56.1766586612922; 
 Wed, 24 Dec 2025 06:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw9OC5D45n0ob5GBxamYvnr4jL4bzFeiezFrGRyPuTz6012F4z+LAd6Gn3ppgHBEYT1fr/wg==
X-Received: by 2002:a05:622a:446:b0:4e8:9ca2:b9ea with SMTP id
 d75a77b69052e-4f4abdb2ee3mr276576051cf.56.1766586612276; 
 Wed, 24 Dec 2025 06:30:12 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b5777sm18033649a12.33.2025.12.24.06.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 06:30:11 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] accel/qaic: Handle DBC deactivation if the owner went away
Date: Wed, 24 Dec 2025 15:30:09 +0100
Message-ID: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: elT-1St2js1l-tmb5GGzKfeyGyJ6JDBk
X-Proofpoint-ORIG-GUID: elT-1St2js1l-tmb5GGzKfeyGyJ6JDBk
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bf8f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-VEhWQ6g2OJpjJ3o7oYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEyNyBTYWx0ZWRfX7qTuEwZ9xfaG
 1MT4qPW5rcy8WJDxWuk0+ib0AojVVdlJxxf3DS+kS/uEGyLrSN8QtNyeMIjjhXJ+3TfvgH+9LBc
 2gPWeciP1dmKSeAg3ET2xxXSGrlHTj1VRYzub/ZVER04gtfeh7YB7CCCpQG66oJP/8M9CH2XBsN
 a2v6cKu9+LCPjZLoS9Z7XiFTWT/TTrNRzAjSgRXheLsi6Mzp1QQz4m6ddDi/SE9xP2Wylx1z9h3
 uaZON+QDiIIJQKGKv9/adHVaIhirq+I1oc0hJoT+V3z4AywcERHD3PeyW6BsHqbhgERpP1pSIov
 awqkE4u1cPNwVTmi9NlDzLpKinD4GmgpGzGWl8yp2wy5HhXbMrvZI7bTX4wGJDS0vtsXRY3+W4W
 32xX8bDSPxm3zDr8M9vIcIoo0HHooZ2W+2Pbc8XwTnIPZg5xnUzjS5TxxhU7j3qV9ZMxXTPImmG
 VShi/oTnX5LKTA6J5Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240127
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
Changes in V2:
- Add missing closing bracket in resp_worker()
- Link to V1: https://lore.kernel.org/all/20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com
---
 drivers/accel/qaic/qaic_control.c | 47 +++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..53afb647ecc4 100644
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

