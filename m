Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34348B05D84
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1810E20A;
	Tue, 15 Jul 2025 13:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="OZuPSAzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8B10E20A;
 Tue, 15 Jul 2025 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752587073;
 bh=IjnQY0kPhK20QaffYXVWEq0vHT5rpi7BYCx3cV6Q92A=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=OZuPSAzw/znlblyI0bHmsoUFw9GT59ynhGDp3kiqGRyqyteMccLtaWi/wwp2jFIR5
 m/P4hflxCxhj27DnNbJn7/ubi0zOoS9+uzS78H2Xeq90eLwEXyxKlBYGNU1fkvSXcF
 BefoPOtGk8GZLHtZRLOp09AR5FKixg0KyATgNVjY=
X-QQ-mid: zesmtpip2t1752587060t139a5737
X-QQ-Originating-IP: /8D94xQN+8JOFpNiEQb4FTVnmmcArlmhUzeqfbRCotE=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:44:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6857427455089537098
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
Subject: [PATCH v2 1/8] KVM: x86: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:00 +0800
Message-ID: <2EBE0C87C4CF3E11+20250715134407.540483-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MQ7eSrrLHrWC2s4UDD70j435oM5bUePaOrSyAp6ZktLAllIgVOtGvkvz
 0NUBgC4kVz3nwIMAhMTHd9BpS4hwYZhteO6rSQrMwCsWPZ/lhYzP6VeZSV6ncQe4Pf4PWKI
 UTKJnVyAjAHBzn27PkHZBfWeP0SbYVfGkENOPB49EtHxopDj3sZJgkdvWqKiErZ6ADyBDVU
 xdYoAJ5aRApVSHXlu0V34GEm8IrFCfwe2zAxi5GRePjavUXOE2lwtJwjfMv8SGZs76M2fja
 ywr6MgZdjY67Y1mGwUUHxFqb9kgDxEo7XhnSVv1hptWBuRxU+e8X+AdkxG0b2TmvXIkdytH
 VDd458eK21AM77AiqtmE2zS+FGVBVeepLOBPM91LQU2Yvkv62Ow5LsqEVVcwbQofsAJrQXT
 4WFzxAnxbn1SEsP4txa68ZSmQJDyY5x3JnqCYxah0uW+7BhNowrETW/3N5KGoC3RX4yu2mw
 hB7ZNzoR6OkzLn1dvZ9OvYiatWt3HMExjeMDiW9d9bGEvHxp/t4LzIsIQTNaKPCFiS0ujsh
 gbxeVEnRkWo+mYEAe2KxHzURhUBNujtpjdjU4R3WOO+x4S5Ozr5jJSXGxtqRDOEvIZcO0Wh
 ThvGqbIfwqEo4tjk4mmyH0ia4+tdXTCEuA/zjLfzqsj+T3qpbhNs4Tq44hZuTXJ8FKBZ8ac
 I8GUDf45XpvObmpLkdY2pwJ3UMVQA9aYxpNwsF18oHEkZoxgoiY0y56f5U0+aCSYrpDCtTE
 ERu8agCmiBYQXJZjWoTrd5VHMccB243de4PmvFu8L9eHkB9mNBJD9rd6Jhalg+tjoh85Pvu
 Sj96/QOKYMlJ4l/RKLb6azewtgLD/0mfGhDLm4CE8i9bKCfG3Q4ojvesUeWGtdrXk+eOCsU
 p+OGTTnbs/53jI6X4SUiFHlVsuJ8XVUE9tMOZTm2PYH/TMXe8mTIf/ZZaDsWQl5q6/yP2KM
 8BBpyPPWC9CISMU76STopYNauTUpKYb4qY9KvCPhyYnyZ9pL2mUBk0vcAXtYlzeWIOQBWcg
 0IH7XzGWGGFWf6nW/2z61jcx1NIzgl/zQXxw1Rj8vfZDCExyCmMRsz+ie4PiAiOJnj6bK3u
 Qnqjsp8MrK+
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

There are some spelling mistakes of 'notifer' which should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/x86/kvm/i8254.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 739aa6c0d0c3..9ff55112900a 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -641,7 +641,7 @@ static void kvm_pit_reset(struct kvm_pit *pit)
 	kvm_pit_reset_reinject(pit);
 }
 
-static void pit_mask_notifer(struct kvm_irq_mask_notifier *kimn, bool mask)
+static void pit_mask_notifier(struct kvm_irq_mask_notifier *kimn, bool mask)
 {
 	struct kvm_pit *pit = container_of(kimn, struct kvm_pit, mask_notifier);
 
@@ -694,7 +694,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 
 	pit_state->irq_ack_notifier.gsi = 0;
 	pit_state->irq_ack_notifier.irq_acked = kvm_pit_ack_irq;
-	pit->mask_notifier.func = pit_mask_notifer;
+	pit->mask_notifier.func = pit_mask_notifier;
 
 	kvm_pit_reset(pit);
 
-- 
2.50.0

