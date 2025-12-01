Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2EC9755D
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C301110E3CD;
	Mon,  1 Dec 2025 12:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmGcLuQj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOg5gfPC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934410E3CD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:43:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1BK5HA106130
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=; b=jmGcLuQjx1kSOQH8
 znVK1DJ4FY7Ci3owB8HJ6D2/pr8V281Yz1rCRbBrV2Wwk8ACe/Dc0ecc1XTa/yfQ
 qym6y+ByyrSi6k26VkLVYCp5FiHut7QKKR/Gi8xqmnubfwpuX86qUuoaZbhrS6t+
 +qmG6VfiIMvR8cFDX2EN6GSLIut0wO105sE12uxhad+lQKSRQABpBYPb4ZFa0GlT
 C4tFosIk3SsU7ljWUXllkYcKmvpSUd6CXq476tsEg2z0hsY2IjTSYmalJD+VllcX
 EpExd0XSH8AJzeKCvRP07ilxzjB7XGfYlwxcJXvTVLApdMUx2hXnrlDp0fazZyuP
 LCSW0g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asa2386hd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 12:43:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3416dc5754fso7587419a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764593013; x=1765197813;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
 b=SOg5gfPC2TrSo5zU4sK04gMDmLoaN87XLOn/fRjCEKLs/rOZhLRCfc2nXE1HhvRSaX
 L0KDSRejFEf668rZZHGqUlFQvbLHbnUBAwvoav+tVruEllEFfpwR7p0e1iOg46iWTbDT
 qiVyBo4I/Pdp+dHGrAnTXc8HW/1ciXZrwDDiajj17sgwUIe9+jDMozbHdbnfuvhlOz7s
 lANwMc4RNSAy3F6F9TY0ucQmOZMRXXTGCAc4ASoLG1iAzuWhnZbDTmbiASFyS/Nyp5Y7
 HFXh2SDfPOAzGEirQthz6zx7cTLpIWVKN+yDGocs9j3aEiFQBUYEUEU1AumfjuZ48ewH
 Wo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764593013; x=1765197813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YC6FU3llCYxXh4VP04XbK7i9763mHcc9u/o//Iu96T4=;
 b=s9fQoAYVK+vvxP0BcK+xPAnPGUF3sK5B+IRSCT0/Mq/g7ov/nzjzv4VawBj7Az51HC
 2MCqKNILJ7kA4o6AU2K508x5orQ1JGhk633c8XMW4NfFGUR0hbwJHGYmzoihlVWDxOoj
 s7MShY0hyJEK/iNzW7ZzsE6vXUqHdf+W63vIcSDgFA79Jw2P4F0VZfogTz2MlNzAzyio
 b7sy8/6TTo8u82KwoE4TzJSi//QQOlKVV4SL4HXJr8XTesM/p46Uv9Ja0pDHfziS16ZH
 71guVh18i2xn1tL6dY9Nmj1ce4iGRL55KV8VJYivUkmOiXxazZogF2EfdDTfIdJPxO6p
 mX7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx8bDjHoyJ2fQmbdNjdm13yEHr58k8tXTFwtUXwbKiGoIWtFlTKcvuP7rooHWHwZB6R28bGdv6lbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRID6UuHxB7Bz0HASy6aae82rWWtaX8B/GPXUB3JitZp3O7YQC
 aaqeTvRucQOtDsdTrrBePSOocNlWaC6l2+GYAqx5S/IdcfGF21p7yno7qZaOoM63PH14OoMQOxJ
 c5Z2p4EI9ra0YsXxW1a3OaqjkR+Cv/o5y556BhMa32tENtrgJkoSb6fzyKKDoITU+88ed/xc=
X-Gm-Gg: ASbGnctIA3xS1eFqkloq/DVlUNWQNKaB5MPpK34c4daodxfnLSkutpVtuSuKMfEtUZn
 o4CbRu6ymoZJb7PikXYVXPvwwq2Ql/7/40eZEkQbg1ELO0AhRy+ulwT4+J7wJ3ijXcQckMWeC0Q
 8Gve00E72RDlU0rwtuQ0W6zoWMwMrf30TrYYmjexuuiupO4oQJfeU+gUWJm7KYeeStBrTqqr6KO
 3wkNt0l72JwXqw3RBOTAtuNsbjGD1Ino62Oyc2aHmAcYKw4kI4xa48uD6CA7l6AmZN2OYY0OvZb
 XstG7+HxVI7nLctg1WhaGkyI15oruKlkTs031z+oHtvi2uJe2qhqQ7hqVyKV3rMdbvqpSlxwqto
 udomG5HOIiQFmONUI9DzQTdQSFC1qppyEaj/yRAR7RQmU
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id
 98e67ed59e1d1-34733e55262mr35347995a91.6.1764593013363; 
 Mon, 01 Dec 2025 04:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElgDjDJHW2YDf+PAwc9iRI3ntCUsGwfUffpxrfbB3ePkiBM/khpNTD20UCrGFmP3x4X6p7TA==
X-Received: by 2002:a17:90b:57cf:b0:340:5c27:a096 with SMTP id
 98e67ed59e1d1-34733e55262mr35347954a91.6.1764593012680; 
 Mon, 01 Dec 2025 04:43:32 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 04:43:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:17 +0530
Subject: [PATCH 1/4] bus: mhi: Replace controller runtime_get/put callbacks
 with direct PM runtime APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-1-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 vivek.pernamitta@oss.qualcomm.com,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=4834;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O1bfb49f81nWjSwl16Z6OQyKyPquLUwL1wCzDbmKlZQ=;
 b=yLM+3VZeO3i0vzTYNib15uacoRstISgcmAjNZBsE2uImwB5USfI0sbF6aT/yYbSsn9pqrY/4E
 WgFlDNvcU6+DI+bVnaoIPTkVXI/EG9ShgxobuhrFdniiGsg71jFlRYz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=dOurWeZb c=1 sm=1 tr=0 ts=692d8d76 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-vyvwYMTLgQEoxk1dJgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: UaXx4DUgu1XMAHeCgdfJyFWmuxiv6ZkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX7fOnnDxJ0XaB
 xrQzAjYYbD6nz/UNONHviWnOeSZzw+758ItzI/9nvfq/kwECZMwjpxzZf7ahzhKo7DKIqJgPzQc
 rFUI1tmAmUuXyrOSeOJk66B0bUKxWaXmXo62Q0uGciScz333rpizZkrE7QV6r0B6U8DmhwM+aIK
 A5AKBN9saTkGpYRA0Ik1DjVwq6b8riQUe8E/31K/xjNBmw80dxE68BgQpQvBBeI3lKLaskVC6QX
 yGa6/rJVdEndWzQWCi1SHH8cOQwS64kuTVJDl4R7EtOOiWN8LbFzjW/MIc4klv4/NnrxKZq9rIe
 5HQtHL1JRzzKArSy18AyNdhuvO9dQ8il0FWfAAtAf8qPCVpCXdqTsRbOhe9TkZyMJI1ed9x/ip7
 XkmtA+SDVNfsl04XEW92VDW+s/mUzg==
X-Proofpoint-ORIG-GUID: UaXx4DUgu1XMAHeCgdfJyFWmuxiv6ZkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
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

Replace usage of runtime_get() and runtime_put() function pointers in
the MHI core with direct calls to the pm_runtime APIs. As the controller
drivers were not doing more than calling the PM runtime APIs in these
callbacks.

This refactoring simplifies the runtime PM handling and removes the need
for drivers to provide no-op or duplicate implementations of these ops.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd190078af4ca12cd7a1de739572feca9d..5b22808fd543f9febcaa9ea623101d2d5d05b040 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -938,7 +938,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7937bb1f742ca8033c17a01f5cffbf103330f51f..61e03298e898e6dd02d2a977cddc4c87b21e3a6c 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -353,8 +355,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 8615512743199a59a58c3756d9cc3407079cee7e..7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -661,7 +661,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
 				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+				pm_runtime_put(mhi_cntrl->cntrl_dev);
 			}
 
 			/*
@@ -1155,7 +1156,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1166,8 +1167,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1374,7 +1377,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1405,7 +1408,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1591,7 +1595,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
 			/* Release the reference got from mhi_queue() */
-			mhi_cntrl->runtime_put(mhi_cntrl);
+			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+			pm_runtime_put(mhi_cntrl->cntrl_dev);
 		}
 
 		if (!buf_info->pre_mapped)

-- 
2.34.1

