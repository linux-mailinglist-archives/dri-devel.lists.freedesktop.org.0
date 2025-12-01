Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A4C97560
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436710E3D0;
	Mon,  1 Dec 2025 12:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XR1PcdKX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQLv6eq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335F10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:43:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B19MCaB3361771
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 12:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=; b=XR1PcdKXJkx1y7lP
 1hl+9CzAqtSL+e2kFxF9sah35MGnmVSLivazrLvPrWo8zhkg7+7F3Yc0qBvAdw0D
 0Rcx9XHoC33Q8YGhzsSr2ctUULz9VLVFpwG90cz3XFjuC08JTXw8+X8F//dQ6yUO
 EUI8HizI6XGSjaSydbEGKq/bfDn3etKvt+Y+kjdW42c124s11HPFXwt3c/iPxi9v
 LpGNA6GsTRNY+gUhwKKygIq+XJRpipG6W8++QY32QNS9U9UR5SeZ5Mud0gWSY+9U
 3IzOsDms4kTgtONn4rgbYXruSqffW5sCfJeh2IzcdSiUw+glechcoP9Yr8sdEhnz
 gkzUyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00j8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 12:43:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29846a9efa5so77235285ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764593025; x=1765197825;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
 b=DQLv6eq2ImFWFes0XnAxwt7s3svLhkuUkBlPNEtUdrSjazOZ4y27CFAtJUnhBWegau
 QrVNjeThYlbJEG7qEL9DiEsGuITBFWg7LyJkBDD+5LbkeaH8t3AW/WZk9d0ozu8s5RMD
 nkh+w0v268JR9KAdDb3tIgoaAOj+aCitgyciHENGkerMeSnx2b1kBNazm4e6avJJecOt
 6GM7pJt75sbWq5jl/01kuhjuMJhxwqqQpLcKC2uiuLZsCCjtaN0bYDFfs8I1vxMj/XzI
 T2mJonMT+8hIpLT4ilKqF2nhvw550BrKXwqNnRKA8igewBio/TLK1wGeqaXLlMALNYzS
 eyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764593025; x=1765197825;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
 b=jjWhC4xeef7ZsVmvqM/1S+mr/G3KkU9xpxaVgEthpk+WKlb77J+kO79LWOx2nz6mNt
 PeefbnPV+75t5szalRS57e1WUgnZNh7MUhos8FpT+eAZx70ErPjvPK+s5TBJyjL9CWW7
 YBCgNgU9Uq6HgczlS2GMpedVo6CyEGFRG5ZigHqTYF7HVPn2ZgaTLueoxgeduHNe0tIw
 Tc6HzXV2TcO7y5uRCTJWAiLpR+oOnsuc1v5BokvxnzpZJ8kve9axjmx4qxyTxSWKwIwp
 1MRhvgzBehoIcHexv7mFwHvIZ49Carh+klmk4lL/OAy6RNVT23+1zZTGBydYtfzzYo90
 1d/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi9TYSil3MjUlzaxWal1+I8eVc222yW35W2dPcV8S0VUGq3fdSQ6Jx3J81FZjPJOj+5Q6gblXs57g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhKaV5Fg0yIZcy0uS0lK1jr6EcEtWR/7i2vNT1/QfHGyc0/50U
 Zv9khDJHHK6hYZ5LQIDVi1WcIpJeWS1Jp/1VNwGRYKstEA94r4UpM4HONCsMLhyW+YBn/tjC4qz
 40Jlzj5EqkkHwkrF+6phfvQiCEd2tqFGxL6KQlSP1+ZsdRKN7uj7yXSppwkm/Pti1DmT+wXs=
X-Gm-Gg: ASbGncv0T6v0mS0mr0Hm9qIWaCMZ3QvvGppkLtm3XTHHqiZ8OdU2oisEE7PK5ap0zsE
 TM/3bkRUuro3LYYf/IgMvkWzq8/2yEpgxiGoWiNVYUwthzRdp0d0sETOWavTyq2B06aBJADM2j8
 8p+Klm2sfxTF71b8BjOK5hWwvKx78bWZxBREEtXVY/ty5yb8Fp1i9faMQKaGe1PhJJ1r4c/MrNa
 gVnZIiH3klQl8Bue2/vi181J5kYdiyZ9/1V0bzP7FHFlXl9F8kAith8hiRqZpxQmw85j+sHrk5w
 JwBk7zqPVbV2dNqdV3ZV38d6gdJNVlsyTCI7T2cvH5ZlWYPfqkBWkTh37c2puR9y9QSDdXrANVE
 +bPxerHMhvtygPabciNUN5QJtGJHd3oh8EuaNXaCA8p+j
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id
 d9443c01a7336-29b6bf3b620mr427701525ad.36.1764593025060; 
 Mon, 01 Dec 2025 04:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQRyQeaORqv6EIcBnGlMaq26A/hMlADJNn0YXR98fYBetj3iI8jUv1Ui+5YteXsBVLZPjwlA==
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id
 d9443c01a7336-29b6bf3b620mr427701135ad.36.1764593024474; 
 Mon, 01 Dec 2025 04:43:44 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 04:43:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:19 +0530
Subject: [PATCH 3/4] net: mhi_net: Implement runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=3344;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rbqwP2YI4CzGHgLkC6DPKf/HhJhVBMMGwEXYBUIoF6k=;
 b=/Y2lIbKnoetk66YeT7B0yhq+Lp6V/NhqVD5b7G9I3ctKq/8126e4MtAa3KtI53yQh650IoAtH
 yDP4z6ZpJW+BDRVzLPVbyhcZhAeBx2UtPa+G7f/CG+yfkSzgm82tWqi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d8d81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FGecwo-O3dF_YbjdleMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: VF78bsnk4hPhJwW6BDDXXvwnb3q8cApg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfXyuaPcfiV2oOB
 GD8k4EJ0iMJmH4jjtwWO2F5zAf9oKj+uuhi4CW1s1ySzhHM50ubPMLVR2XxMcYVND/ra1gpDYAP
 A+kZzKBP+Mq6sbVtPd7A/F5OO2r1IHUe+5MKfK/PwzlhnkW2uIr0d5HH8j4aEz+htlGcnJRWX4X
 Dh3jaGqMlPrz8fODtmYgqGMT9EDYJAC6T+ZX8s4/WV4aZ+K8ZQWfd5KkZ31S8J/lerSpboGTbvb
 blSGDdUys9YHnM9rUGpw+ZPHAdvP2pnH5TClE7I7azSQ9YejPAnvtHhoUsCFeZ0xbE6g6VxpY6d
 v1Y/nrexzYhWR3s2bMlrJrx5hqncwS01pQINPJsehH3krXmya+LU3A+NqSFHiLwjM9TBr0sRcOJ
 segxYp9Z3GOD+GsGoWHrrOuGVdd7Ew==
X-Proofpoint-GUID: VF78bsnk4hPhJwW6BDDXXvwnb3q8cApg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
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

Add runtime power management support to the mhi_net driver to align with
the updated MHI framework, which expects runtime PM to be enabled by client
drivers. This ensures the controller remains active during data transfers
and can autosuspend when idle.

The driver now uses pm_runtime_get() and pm_runtime_put() around
transmit, receive, and buffer refill operations. Runtime PM is initialized
during probe with autosuspend enabled and a 100ms delay. The device is
marked with pm_runtime_no_callbacks() to notify PM framework that there
are no callbacks for this driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 
@@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct mhi_device *mdev = mhi_netdev->mdev;
 	int err;
 
+	pm_runtime_get(&mdev->dev);
 	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
 	if (unlikely(err)) {
 		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
@@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	return NETDEV_TX_OK;
 }
 
@@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 
 	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
 
+	pm_runtime_get_sync(&mdev->dev);
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		skb = netdev_alloc_skb(ndev, size);
 		if (unlikely(!skb))
@@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
@@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
+	pm_runtime_use_autosuspend(&mhi_dev->dev);
+	pm_runtime_get(&mhi_dev->dev);
 	err = mhi_net_newlink(mhi_dev, ndev);
 	if (err) {
 		free_netdev(ndev);
+		pm_runtime_put_autosuspend(&mhi_dev->dev);
 		return err;
 	}
 
+	pm_runtime_put_autosuspend(&mhi_dev->dev);
 	return 0;
 }
 

-- 
2.34.1

