Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D74644E7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 03:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843B6E41B;
	Wed,  1 Dec 2021 02:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26086E41B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 02:29:56 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211201022954epoutp04c8f04d75693f964fae08796b9853b308~8gKE6kViB2067120671epoutp048
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 02:29:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211201022954epoutp04c8f04d75693f964fae08796b9853b308~8gKE6kViB2067120671epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638325794;
 bh=f0bhbVDABH/keU3Qir8aHIW3gODMDiP8eVq5hhBDS8k=;
 h=From:To:Cc:Subject:Date:References:From;
 b=TBEWxXNf34FoHchRnNKlJvbSn8lwuzUs+ZVLtVcA+/g5Q5JqjVH6SDR/JQTQs4sVn
 QDNqKZ7SmACL3mQ5uAe2F9ZdpDusJH8jtf9ecZ5HfstSw5RrnD3b1VAEvi5ukx8XEh
 GiYhGv0Yv6KoRaMgwjuCsEraFMIHLYLnOUQjYdVo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20211201022953epcas1p40ce3fe155004d33477b9bc4d7c3ce227~8gKEgAiMN2079020790epcas1p4h;
 Wed,  1 Dec 2021 02:29:53 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.234]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4J3jj51QGzz4x9Q0; Wed,  1 Dec
 2021 02:29:45 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 20.12.21932.0BDD6A16; Wed,  1 Dec 2021 11:28:00 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20211201022937epcas1p43cd1c33af30edc7c31d9428307c329d5~8gJ06CX510855508555epcas1p4F;
 Wed,  1 Dec 2021 02:29:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211201022937epsmtrp1efc26ce946d955a1e6a5fb76aaa4c829~8gJ05Ue1e1086010860epsmtrp1Q;
 Wed,  1 Dec 2021 02:29:37 +0000 (GMT)
X-AuditID: b6c32a38-929ff700000255ac-ee-61a6ddb07683
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 41.53.29871.11ED6A16; Wed,  1 Dec 2021 11:29:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211201022937epsmtip1f86ffd1daea65c0cd910c03b56686ea6~8gJ0xHXRy2915729157epsmtip1f;
 Wed,  1 Dec 2021 02:29:37 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/exynos: drop the use of label from
 exynos_dsi_register_te_irq
Date: Wed,  1 Dec 2021 11:40:39 +0900
Message-Id: <20211201024039.226386-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFKsWRmVeSWpSXmKPExsWy7bCmvu6Gu8sSDY7uMba48vU9m8Wk+xNY
 LGac38dk8ar5EZsDi8fiPS+ZPO53H2fy6NuyitHj8ya5AJaobJuM1MSU1CKF1Lzk/JTMvHRb
 Je/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoJVKCmWJOaVAoYDE4mIlfTubovzSklSF
 jPziElul1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DChOyMP0v+Mhds4a5o6PvA3sB4lLOL
 kZNDQsBEYuXnp0xdjFwcQgI7GCW6dh1nAUkICXxilDi6VBwi8Y1RYkHnR2aYjsUHXzJCJPYy
 Skxqv8QG4XxhlFi34As7SBWbgKrExBX32UBsEQFlib8TVzGC2MwC2RITPpwBs4UFQiSmfG5g
 BbFZgOrfbXsF1MvBwStgJfGkvRhimbzEzEvfwUbyCghKnJz5hAVijLxE89bZzCB7JQTWsUtM
 f7qOBaLBRaLn+2yoS4UlXh3fwg5hS0m87G9jh2hYxShxe95nqO71jBLNL96xQVQZS+xfOpkJ
 5ApmAU2J9bv0IcKKEjt/z4V6gE/i3dceVpASCQFeiY42IYgSJYljF28wQtgSEheWTGSDKPGQ
 6F5uCWIKCcRKbP9iOIFRfhaSb2Yh+WYWwtoFjMyrGMVSC4pz01OLDQtM4HGanJ+7iRGc6LQs
 djDOfftB7xAjEwfjIUYJDmYlEV75mcsShXhTEiurUovy44tKc1KLDzGaAoN3IrOUaHI+MNXm
 lcQbmlgamJgZGZtYGJoZKonzPvefnigkkJ5YkpqdmlqQWgTTx8TBKdXAFDDRtN1i2+sXXMu0
 7aylP/tP/2x4dHr/1Y9dGc6mKwwYrj0zSuQwPO9i/1Lb5POWBycWrla74dLCdP3Ecs67U0PO
 JRll338X2bjzrZ9wFd8ztkl7pmoFJjhwTyw57y2g+Kzx7ansCTclDU7MKZ3h6VmbHz2noT5X
 699+q1XXGjindPNmqm/Z8cbx9/RJdd1ni93mXPzssHTzm4N+17Q7hK917DXaGbL1+ML3E6bc
 W2QczirduuxltbnI1nzxvBjV5g4rH4XQj6UtHUbqex2UX/L66nAW52zdcVVA7ajV48f5DLY8
 v9/NTP66vOEU2+uXexdstTG9wLc0YYuX7J19N7wZAmcv2BY5ZcXedyXmxUosxRmJhlrMRcWJ
 ACl+AYn9AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGLMWRmVeSWpSXmKPExsWy7bCSnK7gvWWJBmeucVlc+fqezWLS/Qks
 FjPO72OyeNX8iM2BxWPxnpdMHve7jzN59G1ZxejxeZNcAEsUl01Kak5mWWqRvl0CV8afJX+Z
 C7ZwVzT0fWBvYDzK2cXIySEhYCKx+OBLRhBbSGA3o8S6FRFdjBxAcQmJLVs5IExhicOHiyEq
 PjFKfNiSDGKzCahKTFxxnw3EFhFQlvg7cRXYFGaBXIm/Rz+yg9jCAkESb08uZgKxWYDq3217
 xQ4yklfASuJJezHEAfISMy99ByvnFRCUODnzCQvEGHmJ5q2zmScw8s1CkpqFJLWAkWkVo2Rq
 QXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZw0Glp7mDcvuqD3iFGJg7GQ4wSHMxKIrzyM5cl
 CvGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cB0pKal7tTm
 CWc/O1RPT1yq1n3mcOm6ssMsLwX5zpw9HeDn8P3pxvvbXn59GV96sEy6fDmToUbVsoBYBdNT
 Sd2RTKdKgnpbLrg9WbKa4/anBTZNDZ3diraxXEu/8ryY+PCOkUyXTO7so9J2JiKzJgjXfTec
 vf5NpOYy7laLiOOrmOvq5+4rn5gfF9eXkW77oHcKX4bD3V62xdaO3BFh/Z5+WTa60uuStfZy
 njj4X6L2/fP6wsdVj1m/h9w19bGwDZ23yujmd61jH+yvndoiI/5J4DlPpCBnumZBnuc++2vv
 34WcCI+ZunjXEvMU2faiH33blm37cP9QveW+WdMXdRybsyxJnjuU31Kft+auko8SS3FGoqEW
 c1FxIgANpP/DqQIAAA==
X-CMS-MailID: 20211201022937epcas1p43cd1c33af30edc7c31d9428307c329d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211201022937epcas1p43cd1c33af30edc7c31d9428307c329d5
References: <CGME20211201022937epcas1p43cd1c33af30edc7c31d9428307c329d5@epcas1p4.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dropped the use of 'out' label from exynos_dsi_register_te_irq function
because the label isn't needed. This patch returns an error in each
error case directly not going to 'out' label.

With this patch build warning[1] is also fixed, which was reported by
kernel test robot <lkp@intel.com>

[1] https://www.spinics.net/lists/dri-devel/msg323803.html

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b0b1acb7e712..32a36572b894 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1338,7 +1338,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	if (IS_ERR(dsi->te_gpio)) {
 		dev_err(dsi->dev, "gpio request failed with %ld\n",
 				PTR_ERR(dsi->te_gpio));
-		goto out;
+		return PTR_ERR(dsi->te_gpio);
 	}
 
 	te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
@@ -1348,11 +1348,10 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
-		goto out;
+		return ret;
 	}
 
-out:
-	return ret;
+	return 0;
 }
 
 static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
-- 
2.25.1

