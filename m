Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843FB0D355
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D126910E603;
	Tue, 22 Jul 2025 07:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="MJFkxAG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3722410E603;
 Tue, 22 Jul 2025 07:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753169768;
 bh=JwyCRpM1FWaTLNFe5LSvBKJz+ZtIxups+3c5ci7f0O0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=MJFkxAG3TnOaoyZ4tzb12gT1fPu5yyG16H1Jl1iJ/oYnB9Kts6izQRSiY9a7OPcm7
 WZleUri6Ry182mEzkPtL2iDmtU3MLCXxT/Vu/l1qM1DNsBuz5jKinRM3iFv1jNlTlK
 Fc9kOnytqsgB5JVJNE2AOdrQsN15jb66+sxQDTV4=
X-QQ-mid: zesmtpip2t1753169705t5d8d5b17
X-QQ-Originating-IP: sO//PwrBzanzWIpX43hUjMW25ZeVM74q8qXSuUHVttA=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:35:00 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13053412534972424115
EX-QQ-RecipientCnt: 65
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
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
 wangyuli@deepin.org, x86@kernel.org, xen-devel@lists.xenproject.org,
 yujiaoliang@vivo.com, zhanjun@uniontech.com,
 Simon Horman <horms@kernel.org>
Subject: [PATCH v3 4/8] net: mvneta: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:27 +0800
Message-ID: <0CB4300CB6F49007+20250722073431.21983-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OLsBWtCIHsg6qpyUVgLKJSgwSlAKGQTxXOnZVJNFFd4AQWPB2BjvZZt8
 2wgW4YXeCgyJCjYbAnzceUWlGLhA1te78istOv0Nk1hEiUUVDgV17BZ5q6Tdiyth7YZTfAR
 pepTKbRe/Bw/4jW2yVaCTNK5wF6QHSy8EBu9w9bHCVKKJi4v5FsdNACW3dBkY0y2fjpPp68
 AJt6+XmryWCnDmBOni4XzxxEgkRTAIVudwhv/2sxAsAYRpDHiE3RlbqG1LLzW6vi/q2qtRM
 0tdjKhUaazURm+S/exHXwWswXA/80tYYJe/um8gTx3oB5F/OjKNB+PSmBZj6pHQnpoOyTXa
 aRkrMK/NHUtsGm2KD6GE2b3BHm/LIPFuX0ka3ZVAzdhuIw1HdxIno/FG73WIqNJ2xWQC9lH
 sliMvciP6/NPcliBimaJhBBYRZDkkK+BDtPYP3df2QxGcEyJLj5NhkYL3/Um4M8DCvJe15J
 nvwByVEInbw+KtHNnPGqDe4joaIKcVLSpHXB4H6hi32mhCIOJyTyi/utkt3Jo+qFPgWuJrI
 hGt++YRsr1tdLgMiGZJZQXELfMXzYwAHDmYfZz17x3cATEzKMUKEmfoNEFnPPD1gZZWACl3
 EY2UpZnnf4Zouo6p0q/mU09CxsjQL898Kg3L/ruyEfsKBDDSMYtZxW/G79vhlMtshFGhvRv
 8FRYQSOQ85OW8q3LqQVU18BkfoRgxMoDHd7z/wFWENKZ63JPaQ/soUM+0TtI95phljixouL
 6CoT5iVYkVEzBPxbwJ5jg9eFJk7FQPkEs0yWTXjLwHH7POuGGy81+VC4Gp1TMu4Dy9JdFBf
 HILJqTFWMiQVws6sDYwntn8l4OC59MCJCXs+AKU6rw5t5MiwxAPD7BoKB2IZDxv6TiZAg+8
 4hSvE3LTxdwc9MYhFY7h8aRnPI2zMlssunpCHnePdmzWJIMW7QHJ1su0ypTUkYAd6ZrERvS
 AzYDkng4WfXu5+GKhizgRrJtIEJWmtxVvNvLvbYIQSrftXdLna2gYIWO2utj2/X0YnJg4LE
 Lz0kPewy8Jr0rB0DABZK5/5Hh4h/VSf+VBwwHCILiO4yOzGP2z7pwATgjwD0MURCnxEfQwE
 7szkTlAp+hjzGdFpMbHApv12IPDZa0+oQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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

Reviewed-by: Simon Horman <horms@kernel.org>
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

