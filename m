Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F556B05DA4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B110E5CE;
	Tue, 15 Jul 2025 13:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="Wjts9OSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.73.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40110E5CE;
 Tue, 15 Jul 2025 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752587112;
 bh=rQmC2fT7t1QerTXaC4lb+PTlBodpE334vwPD+1BbEVQ=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Wjts9OSmF7J9zue7nrnsfbwPy4jBQa19CYFuWNOu+GAYLzB8oiQzzn/IQM1Th1ifL
 MaTehwZqOKTa42CN3YCHmDt4/y2iccWutlqeNvrp/ieG/4Yb/A/55TQWqpiDmgzUfH
 DD8EnZn98Es6TBnbwoF46gEDIljEHMmZArX4c3lo=
X-QQ-mid: zesmtpip2t1752587098tca5493a2
X-QQ-Originating-IP: bz3FlVgOsDFMU4yP789akKxa0PSTuDy5vUHH1rKzucE=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:44:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17118280138594798834
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com,
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com, dave@stgolabs.net,
 davem@davemloft.net, dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org,
 lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com, ming.li@zohomail.com,
 mingo@kernel.org, mingo@redhat.com, netdev@vger.kernel.org,
 niecheng1@uniontech.com, oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
 pbonzini@redhat.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
 rodrigo.vivi@intel.com, seanjc@google.com, shenlichuan@vivo.com,
 simona@ffwll.ch, sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: [PATCH v2 4/8] net: mvneta: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:03 +0800
Message-ID: <41013AF60AF9B5BE+20250715134407.540483-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NiWT7DR6HJ54mJ1VBC3jMGW+gWgt0C8dhP0AyYWvvST8eKznfdV/Lfdz
 v++9J5erimV3Hg95ho78glEpgHggpXVBaNI0r9P4j9JU7hC7Ocl5CpfLcx+HM+v6MjhUE/a
 pCypqKZTlsVe69aV9QBZsoQTWn033nnA0aJkBLfGdJRduPUhbWRmCx5L4zI6FhOkyyMftW3
 i+7B8Kjh48Z45Dtu0N8zhlza+JIJXEnFLeO/9ZYUMP36tosgvclEphE1XF/z4Wb7nNr/atd
 BNKIUcqTNGJDslU82izL4ZxtTGKhC0YTd+Hxt+jDzwdGLUuL/PGAbFfcd1I5oAIrFfZieOe
 iMdM2GQzipDQjVUp6cw5TkNxfkUWmtHRUHgVQRmLqL9Wv+49gV7/SV+cRoQuBWijBGzTuWe
 hHjxibI+E4+UxF2GfOlHwvT/lw3rxBUGosciPouqWqbkPn5fKIhmlJqnTGNLFTT5cLda4aL
 c//115ZRWUGJRsfSYQUNycoWbRisrCgn9cOkQ72n44w2OKZPmZREthbQDK+hCqIpkKqTuKv
 RLFMFNakVGuNwhwz9vasRAaWMkE3OEvX3nkvme90kRXb8ImmhViggGNUX8efuY0cXtWLmGI
 XYiQxVESPVMGHifm3tTSR9U4mm5pTzJmz36TJJSDBRR49EKOIfegNZXa9gHCmsV5p++J5x8
 LeMSj0nFUMWz3zawXSUVKiFGLP2IHmFG/S3Qu1Xd2uTR6qY+CPEXbYmhpzH4sz6pEiWmFPi
 RtisKqWCPyO0+atJBWIzv3Cm6M9RhEkeIQzq5ni9WxHHlkbLUyVHB+W+0gemCXb14ixD38x
 tH9VOnyI7ye2E5kj3ZQ7WELMzddWJPbzaT0P/jx+ZYySX3ZtckGYBBKdYYt8nk8hRT8wfHA
 UxoVHrVqdW/7BHRU3ctMg2aYqKbP8FmckbpjxJiPaBeaxWoWGo6yTyXc1UxA08mjs5I6XbT
 FQ2aSOxbtfHkE411/Yx3/wk6jnYNkzLIF6O/Fiz/IS6vtuDyTH5WSPB22T2VlouCEdL7oJl
 Bp10bWiZutwpS8pyWrA9UJS4oAZyP6j1/ZLXg/mHccUS91SS/T+ctc1exco77pARzBcvU6e
 WMBrEVE86LIKo2RgTXLpVZft/Fa6qXVzoDIVz4mX1L3BxlOltvlScw=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
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

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/ethernet/marvell/mvneta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 147571fdada3..ee4696600146 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4610,7 +4610,7 @@ static int mvneta_stop(struct net_device *dev)
 		/* Inform that we are stopping so we don't want to setup the
 		 * driver for new CPUs in the notifiers. The code of the
 		 * notifier for CPU online is protected by the same spinlock,
-		 * so when we get the lock, the notifer work is done.
+		 * so when we get the lock, the notifier work is done.
 		 */
 		spin_lock(&pp->lock);
 		pp->is_stopped = true;
-- 
2.50.0

