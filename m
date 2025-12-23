Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E535CDA051
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FD310E222;
	Tue, 23 Dec 2025 17:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="llzGLSkb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heEwropy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AB210E139
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:02:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNFUgad4044111
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPE
 aVhISaLA=; b=llzGLSkbUO7D1EDztU24hH6X3UCSKSXjDmbRS8zgwFSrNp0rb6o
 pCs3zIvKBwmMCwuOU/1Jpd9DrLbWnpNK8rKVVvfJLGW/WMIaqIwBTVez9Cuq3ysA
 uupdDcp96L6n6sdjBzr55n2no41YDNTsx2eQyeWn3KxHrxFEsMGyWfuB7KPbt9vP
 kvc2vYoea8G8fXbUS26qMgQGI9nheOjjJ9nTgJE/tyJ4zjgSCYgyDO0ZN4YwOoXy
 V0oOsyOKFojZe9mbFAfzK5tOUfSYrkTiu8VAo++nlJxguqJrtMjen9Jhz7GEtK6x
 xjCzI9kZWa0PbcBwSPGzdalXp8k6hG3+QNw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbd8r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:02:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-64558391a78so7500150d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 09:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766509348; x=1767114148;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPEaVhISaLA=;
 b=heEwropya15HR5IyUVj2khMd0fWnW1FwMvI4CvVc1b5rXrx7AG7iBy7lc2E4yKS3yG
 tMx65jFSxAIDbEAcU2ApcinISkF4fc/3S9lCqRNx0SaaUjm8bIl61jQVeuuIwMSGRHwL
 HsHjhcOuNv6tKaNkb467BsWW6LnMZCjzps9NuVoVNbzTErZH2l8HvQD4ijn9xZowmbpO
 UFH6jxk4q79W+Z2k0SQ3WRRz7I1Rt06JiADgfgjTQLCQ/VmeYWSmm1hlF4JNAONxgws7
 1o2FTEDBjChBW4eoKlN6hArgoIPZzKAX6/GqR701dfrxjb4lB4cDcnUuncCUL6dFiCGJ
 mvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766509348; x=1767114148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEoNXLlw6C1jJEcLfcS5hFPgLGKLI5XaxPEaVhISaLA=;
 b=BwGpD8n6C276YH/oZ0rAXq+PcxoRF3HdNMzP6UCXBjfq0rrD+D7qEja9DB4vR0vXHk
 bGwqgXoiru2HFp1jDbUkJX3HI14TytegzRdGtM2pxp0CJNfPEFlUNjGY0DEpHISvNtI7
 4BJn0S2V9FIHrkF/n3v/E/k0QWuLgTXpXmUHpf30fdEDbvUBXhv+OO4EIi2cVAm5hjR9
 BSES95kgkPgu1sWaysDedNLprANstA87eVNUEimmRkOI6PIkz8waUH+8oyg8kNZ8zS6X
 eAXRGR9kYMoXHs7TB0REddihKj8sFM8FI9DHRY1GbBIz+IYXdGTKbJ/RRwBv618Px954
 pmEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRBrUymGMh+GURUzm793ThqnWB7v5XxPyRV9U0h8Ysn+HY0xXvFRK+eYwvHGWPcfBtmX6GIZ5WnZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwemGQRmfLPdPZKAZ0qd5sRnqnPGHLilthRx3I65Mxzr4BRTpyy
 a2oYDiM6IcMjovz+nYMfEU24TJM3FpKNqCWpCONkLP+GfgNhJnGOEqQDs+ykdKmAchXPYEjreeT
 mA+3G5AnrtSZf14WfCN7OcUkCjESznOe1wIxxagMFmXVZkOnUXNCvBYzAHBlsqmznycrpwZ4=
X-Gm-Gg: AY/fxX44tnL7PunNWtm26CRRh/znPdF02I7VtlrKksqKQo+jX2Q/lQtOm8Vel1pUTYP
 zCwPCMRfv0DQ+q6c3abejQud3woF7uEvXaseA1Rm2+t7FrBczFNMQ4H0SrswMAtxS8Hmi5wHHRe
 FS+tZxWip9/EyMCV+sHi9LYZ78z06f57nmH/UFHQ2hwWLi8rngCAaT5N2QOHDM4oOiWsfb6LFmB
 KS5x7YhZihxJYwWLAyZhR8Kug9E7eUqDnvNS3Kok3Qg9GAl3iSm5rQgsONsrhAJjNrqa14UALfp
 amf4OY0n8Y4tirux/iikC9Lh71Jm9BGhj7MnO/aPYTrJj57Zb6T8wZS6+G7pJwNmxfHxvETIXmd
 wsh7rpZVvpz6QyntZJmoUgvIcTr/N0Gxt3uZLUnTv0KeoMrm63Q==
X-Received: by 2002:a53:e1fb:0:b0:645:54a9:11b6 with SMTP id
 956f58d0204a3-6466a8a5f85mr9520289d50.52.1766509347885; 
 Tue, 23 Dec 2025 09:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsNqAl1dpdbis+UQMnk81hdxUKFdOJZ55XPKwAtlXwrh8PO+4xtuo9HzuujHlJVZmks77obw==
X-Received: by 2002:a53:e1fb:0:b0:645:54a9:11b6 with SMTP id
 956f58d0204a3-6466a8a5f85mr9520257d50.52.1766509347455; 
 Tue, 23 Dec 2025 09:02:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3ffbasm1479973366b.61.2025.12.23.09.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:27 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Simplify bootlog line handling
Date: Tue, 23 Dec 2025 18:02:26 +0100
Message-ID: <20251223170226.2275812-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h5Oco0ZM5IfmHyE5KbrHcRLHeCiqDPqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MCBTYWx0ZWRfX+AcNVqfhRSvM
 EG8454GEwu4A9uiE2t0aAkz+/AlUl1W1eIIU1354r7Y66DorKZwPmHtaBUFFi2pFwR3CGz4WSWa
 MFLNaD6k1p1AiVwhDLtokxwsnvqrXnmz5WC62UA2jiCdO/Wrc7kIUbQ/SHNNr6FIoWLuU6/dU8U
 zITTup5VCUsQ77wNAPgObCfUkMjEyawPAO1XSKe35+LSLNznt61OOTaaJ5eqGKpZeqjq/ghp0uo
 /5uDubZ/opc7TvEASO1vuf7p+2ngxqRrzHf0oktIDtVBaN3ACfbQBu5uLRLYlrqBsQ6p2JNOQDO
 ZJlua+QR7VLUpWG940k2HnILjimINJerP85OVYmI68LF/9F1prwobSEj2VoxabIX29Lf+nXTWpK
 1lQrMis6sgEVKdQigBbVnRRhwFWTrRpofTatgHILgWt+uz6BABcDVefj1I/OfRKqX28NMZdh3gd
 JCuDm7ycbcLLMB/3ycw==
X-Proofpoint-GUID: h5Oco0ZM5IfmHyE5KbrHcRLHeCiqDPqr
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acb25 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7umvpdEBtmFyuxGRyLgA:9 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230140
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

From: Troy Hanson <thanson@qti.qualcomm.com>

Instead of storing and emitting bootlogs as individual null-terminated
lines, concatenate them, and later emit them to debugfs in a single call.

Do not insert a null terminator on messages received from the device.
Instead use the message length when subsequently storing the message.

Exclude trailing nulls to normalize AIC100 and AIC200 bootlog lines.

Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..6710cedc194d 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -27,6 +27,8 @@
 struct bootlog_msg {
 	/* Buffer for bootlog messages */
 	char str[BOOTLOG_MSG_SIZE];
+	/* Length of bootlog message */
+	size_t len;
 	/* Root struct of device, used to access device resources */
 	struct qaic_device *qdev;
 	/* Work struct to schedule work coming on QAIC_LOGGING channel */
@@ -46,18 +48,15 @@ static int bootlog_show(struct seq_file *s, void *unused)
 {
 	struct bootlog_page *page;
 	struct qaic_device *qdev;
-	void *page_end;
+	size_t len;
 	void *log;
 
 	qdev = s->private;
 	mutex_lock(&qdev->bootlog_mutex);
 	list_for_each_entry(page, &qdev->bootlog, node) {
 		log = page + 1;
-		page_end = (void *)page + page->offset;
-		while (log < page_end) {
-			seq_printf(s, "%s", (char *)log);
-			log += strlen(log) + 1;
-		}
+		len = page->offset - sizeof(*page);
+		seq_write(s, log, len);
 	}
 	mutex_unlock(&qdev->bootlog_mutex);
 
@@ -182,15 +181,14 @@ static void bootlog_commit(struct qaic_device *qdev, unsigned int size)
 static void bootlog_log(struct work_struct *work)
 {
 	struct bootlog_msg *msg = container_of(work, struct bootlog_msg, work);
-	unsigned int len = strlen(msg->str) + 1;
 	struct qaic_device *qdev = msg->qdev;
 	void *log;
 
 	mutex_lock(&qdev->bootlog_mutex);
-	log = bootlog_get_space(qdev, len);
+	log = bootlog_get_space(qdev, msg->len);
 	if (log) {
-		memcpy(log, msg, len);
-		bootlog_commit(qdev, len);
+		memcpy(log, msg, msg->len);
+		bootlog_commit(qdev, msg->len);
 	}
 	mutex_unlock(&qdev->bootlog_mutex);
 
@@ -271,8 +269,11 @@ static void qaic_bootlog_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_r
 		return;
 	}
 
-	/* Force a null at the end of the transferred string */
-	msg->str[mhi_result->bytes_xferd - 1] = 0;
+	msg->len = mhi_result->bytes_xferd;
+
+	/* Exclude trailing null to normalize AIC100/AIC200 line endings */
+	if (msg->len && msg->str[msg->len - 1] == '\0')
+		msg->len--;
 
 	queue_work(qdev->bootlog_wq, &msg->work);
 }
-- 
2.43.0

