Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B80BC2E27
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 00:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7510E715;
	Tue,  7 Oct 2025 22:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxHrejSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24710E715
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 22:40:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8Ob020406
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 22:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Qiin1m1CBtvO4kGGOogJESAVeg19/rEQWvk
 8bPwrc0o=; b=jxHrejSkN7j8o9wrGovAq9/p6W7SrqtvgfrV5DwBYyjTNdD0FnJ
 0uV4a38wLi1Ytwbbl8fQrr0kl4m4ZaBHuUwvF47oYWIfLjINPynD3T/3+Xa1T/Uj
 mlbpz58H7BcK4IJCeiLVNKg48bPF2q4Z7weVCgqKRaJGnO0gsAOfRWI5+OnVdU//
 UuWMkabz7QSBI7hJudGixR7ohf2b6vRW014kat0G/31aoPvrZvZPA5J+oohqq5g/
 rig2Gmz4ZI/O1EwloZc3dUyjUonjqZCVE6NyrkEq0KpxQP3G61HWxITrx+kHupPx
 3K2hFIouqcdGc4kkLcsQUPsSKq7dalwoO8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e0x2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 22:40:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4de5fe839aeso160421241cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759876847; x=1760481647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qiin1m1CBtvO4kGGOogJESAVeg19/rEQWvk8bPwrc0o=;
 b=RK4unybBQXpc+g0wbqTQGdwwzNFbG2+2KQxeaMmonuHtzObiFN8wzPXaPnMoSZQ6JY
 CdMc0A5WMnVvBpgcM80Eo4sDNUjIPQzw83wZ6DN10Q39pdFB+8Saku1wefzumBA+sGNw
 Sup0ydFyEEaMM8fZJ1iTxeuviDS56aihlVh3YXHntmevM0joTeGjDr2K8wwQ04MDKvb3
 +hfykSl7trTmWTLpdoMT+3FBEWXcZknjkfn/cDagvf/6lrepMwtrUDPjJiO1k2uSPtvB
 4kMxGBZMwB6dJJ4GarWgCHSbaTY6yWrepRucO/MZRGwsfLiuhQxbFYG7mbEuvXF3utYR
 x5ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW39M2Gsx1ky/c5SfsMa0f86fXo+ePW9AGQ6GZg86o7GyNtrAPeAVGabLWGHJrg9eCl3HlX0jIxDjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDCMGDGMHB3TDWl4OWoEZ/rpu+DwZ2Ygh99spIrgGYflJzCmUK
 gcbkwIx9HrPESbSEws6q9ryZsjuRIKRSyjmk8Kq1IHogZBYha7HeHETFZ9BXHYBZCMfz7wA54YB
 oU3mUT37JIalOhHca4RihgtcHdJpmGmmmiJilGGQ8u4Ivusm0MDnpoYtm7sT9/K0IY+3DOFs=
X-Gm-Gg: ASbGncssSVq2x4QBJrcu2AFdE5Wlo5MgRhlM8VZGJErzgbekv/F47xnXGyvfgR5ZOAh
 7saAdTrbKfh3SjZGBpsBRrqCsf1I8XPUyRIXsERlGt+CZVWSR1krKddE6WYjhMsGWbj+dj45Lh2
 EM1tx+Xxqt5D+DXlhbtalc1lr/0VftPRioyEU/+M9DBMim2KpxDTkwp45FwB4/3W1nTo4FazroG
 lYgI7jHjPB0WpZX76xXIH3psT6cH5nH7gE27HpbD0p/agvnlrPL2Tci1iuQuVk7yMH2l6Cuyn7t
 Y7XnuUSz8Eghzg7xUuvSbrCqTfVHq2/M2EVKOsMlAJWp+AA/VnzRxh87tYjRjje/pHYXCo3SueI
 rrt7ZzRyDIg==
X-Received: by 2002:a05:622a:1e87:b0:4dd:3948:3377 with SMTP id
 d75a77b69052e-4e6ead56717mr20439881cf.58.1759876847542; 
 Tue, 07 Oct 2025 15:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOhohxfGe5xAFLkK7T1NuD3nacpTnmj8b3yN/Xu9aX1OaKXncZkHHyhCiZ7qjSFCKs8m7elQ==
X-Received: by 2002:a05:622a:1e87:b0:4dd:3948:3377 with SMTP id
 d75a77b69052e-4e6ead56717mr20439561cf.58.1759876847057; 
 Tue, 07 Oct 2025 15:40:47 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e613sm1482195766b.81.2025.10.07.15.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 15:40:46 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
Subject: [PATCH] accel/qaic: Support the new READ_DATA implementation
Date: Wed,  8 Oct 2025 00:40:45 +0200
Message-ID: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e596f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=tTas10tDUONazNPxbeAA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1VJcU1CuE1Jlgv-OBr5j8ZsScaBVHjZ8
X-Proofpoint-ORIG-GUID: 1VJcU1CuE1Jlgv-OBr5j8ZsScaBVHjZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfXwCh6mSxMYZ+p
 DTsQsIXyx7A1xrxdPHLB/kyRg4mOQKrjyZyuUumqupwB7SMeDhb6K6v8j4A3sVFUKd9+7MskkBC
 VvpSnpy0QO0nlEf1gYs5z9SF7A4wtd7mjgwg45PVuZuJJRVs3JAtQI8xRytBRR0arsQHIB4MRHn
 eIYPaDAQ6sgAUWOHMcbcENK1EEFdbXiWeVb0Z3mIwNCa3SaFiH9aiw9VH9S6gfjlaRGL0wB3y7A
 LQ/Ko+vwv8fkiZkpqCrKfNAB9Bil/YOUOFcMJgcteOLN4NArHWqx0UzPonOIFt07OUwJ+tSiCRI
 jn8pwS0GN8x0hJgntDLTOskV/ahBuHz4UGaTr2MreToJQHLElGuRAFOFxdlotrs0dxT5QrYP3kP
 u74hKYNSlmIbmfJMCwp0qVDfsWv6tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

AIC200 uses the newer "XBL" firmware implementation which changes the
expectations of how READ_DATA is performed. Larger data requests are
supported via streaming the data over the transport instead of requiring
a single transport transfer for everything.

Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 138 +++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..b126cca937a9 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -159,6 +159,7 @@ struct sahara_context {
 	struct sahara_packet		*rx;
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
+	struct work_struct		read_data_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -174,7 +175,10 @@ struct sahara_context {
 	u64				dump_image_offset;
 	void				*mem_dump_freespace;
 	u64				dump_images_left;
+	u32				read_data_offset;
+	u32				read_data_length;
 	bool				is_mem_dump_mode;
+	bool				non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -216,6 +220,11 @@ static const char * const aic200_image_table[] = {
 	[75] = "qcom/aic200/pvs.bin",
 };
 
+static bool is_streaming(struct sahara_context *context)
+{
+	return !context->non_streaming;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -265,6 +274,8 @@ static void sahara_send_reset(struct sahara_context *context)
 	int ret;
 
 	context->is_mem_dump_mode = false;
+	context->read_data_offset = 0;
+	context->read_data_length = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -319,9 +330,39 @@ static void sahara_hello(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
 }
 
+static int read_data_helper(struct sahara_context *context, int buf_index)
+{
+	enum mhi_flags mhi_flag;
+	u32 pkt_data_len;
+	int ret;
+
+	pkt_data_len = min(context->read_data_length, SAHARA_PACKET_MAX_SIZE);
+
+	memcpy(context->tx[buf_index],
+	       &context->firmware->data[context->read_data_offset],
+	       pkt_data_len);
+
+	context->read_data_offset += pkt_data_len;
+	context->read_data_length -= pkt_data_len;
+
+	if (is_streaming(context) || !context->read_data_length)
+		mhi_flag = MHI_EOT;
+	else
+		mhi_flag = MHI_CHAIN;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
+			    context->tx[buf_index], pkt_data_len, mhi_flag);
+	if (ret) {
+		dev_err(&context->mhi_dev->dev, "Unable to send read_data response %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void sahara_read_data(struct sahara_context *context)
 {
-	u32 image_id, data_offset, data_len, pkt_data_len;
+	u32 image_id, data_offset, data_len;
 	int ret;
 	int i;
 
@@ -357,7 +398,7 @@ static void sahara_read_data(struct sahara_context *context)
 	 * and is not needed here on error.
 	 */
 
-	if (data_len > SAHARA_TRANSFER_MAX_SIZE) {
+	if (context->non_streaming && data_len > SAHARA_TRANSFER_MAX_SIZE) {
 		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - data len %d exceeds max xfer size %d\n",
 			data_len, SAHARA_TRANSFER_MAX_SIZE);
 		sahara_send_reset(context);
@@ -378,22 +419,18 @@ static void sahara_read_data(struct sahara_context *context)
 		return;
 	}
 
-	for (i = 0; i < SAHARA_NUM_TX_BUF && data_len; ++i) {
-		pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
+	context->read_data_offset = data_offset;
+	context->read_data_length = data_len;
 
-		memcpy(context->tx[i], &context->firmware->data[data_offset], pkt_data_len);
-
-		data_offset += pkt_data_len;
-		data_len -= pkt_data_len;
+	if (is_streaming(context)) {
+		schedule_work(&context->read_data_work);
+		return;
+	}
 
-		ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
-				    context->tx[i], pkt_data_len,
-				    !data_len ? MHI_EOT : MHI_CHAIN);
-		if (ret) {
-			dev_err(&context->mhi_dev->dev, "Unable to send read_data response %d\n",
-				ret);
-			return;
-		}
+	for (i = 0; i < SAHARA_NUM_TX_BUF && context->read_data_length; ++i) {
+		ret = read_data_helper(context, i);
+		if (ret)
+			break;
 	}
 }
 
@@ -742,6 +779,13 @@ static void sahara_dump_processing(struct work_struct *work)
 	sahara_send_reset(context);
 }
 
+static void sahara_read_data_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, read_data_work);
+
+	read_data_helper(context, 0);
+}
+
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct sahara_context *context;
@@ -756,34 +800,56 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
+	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
+		context->image_table = aic200_image_table;
+		context->table_size = ARRAY_SIZE(aic200_image_table);
+	} else {
+		context->image_table = aic100_image_table;
+		context->table_size = ARRAY_SIZE(aic100_image_table);
+		context->non_streaming = true;
+	}
+
 	/*
-	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
-	 * will request for READ_DATA. This is larger than
-	 * SAHARA_PACKET_MAX_SIZE, and we need 9x SAHARA_PACKET_MAX_SIZE to
-	 * cover SAHARA_TRANSFER_MAX_SIZE. When the remote side issues a
-	 * READ_DATA, it requires a transfer of the exact size requested. We
-	 * can use MHI_CHAIN to link multiple buffers into a single transfer
-	 * but the remote side will not consume the buffers until it sees an
-	 * EOT, thus we need to allocate enough buffers to put in the tx fifo
-	 * to cover an entire READ_DATA request of the max size.
+	 * There are two firmware implementations for READ_DATA handling.
+	 * The older "SBL" implementation defines a Sahara transfer size, and
+	 * expects that the response is a single transport transfer. If the
+	 * FW wants to transfer a file that is larger than the transfer size,
+	 * the FW will issue multiple READ_DATA commands. For this
+	 * implementation, we need to allocate enough buffers to contain the
+	 * entire Sahara transfer size.
+	 *
+	 * The newer "XBL" implementation does not define a maximum transfer
+	 * size and instead expects the data to be streamed over using the
+	 * transport level MTU. The FW will issue a single READ_DATA command
+	 * of whatever size, and consume multiple transport level transfers
+	 * until the expected amount of data is consumed. For this
+	 * implementation we only need a single buffer of the transport MTU
+	 * but we'll need to be able to use it multiple times for a single
+	 * READ_DATA request.
+	 *
+	 * AIC100 is the SBL implementation and defines SAHARA_TRANSFER_MAX_SIZE
+	 * and we need 9x SAHARA_PACKET_MAX_SIZE to cover that. We can use
+	 * MHI_CHAIN to link multiple buffers into a single transfer but the
+	 * remote side will not consume the buffers until it sees an EOT, thus
+	 * we need to allocate enough buffers to put in the tx fifo to cover an
+	 * entire READ_DATA request of the max size.
+	 *
+	 * AIC200 is the XBL implementation, and so a single buffer will work.
 	 */
 	for (i = 0; i < SAHARA_NUM_TX_BUF; ++i) {
-		context->tx[i] = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		context->tx[i] = devm_kzalloc(&mhi_dev->dev,
+					      SAHARA_PACKET_MAX_SIZE,
+					      GFP_KERNEL);
 		if (!context->tx[i])
 			return -ENOMEM;
+		if (is_streaming(context))
+			break;
 	}
 
 	context->mhi_dev = mhi_dev;
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
-
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-	}
+	INIT_WORK(&context->read_data_work, sahara_read_data_processing);
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -814,6 +880,10 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
+	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!mhi_result->transaction_status && context->read_data_length && is_streaming(context))
+		schedule_work(&context->read_data_work);
 }
 
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
-- 
2.43.0

