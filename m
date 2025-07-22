Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941CCB0D2F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C9410E5EF;
	Tue, 22 Jul 2025 07:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="iSOav6Ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31F310E5EF;
 Tue, 22 Jul 2025 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753169326;
 bh=x+S0lLyonKMBOYVe3hwfq+3jtrctPFlVfJ/rovDXpoI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=iSOav6Lng8FvoeHsQ5EaVq6WcOa5VBdkUBs1J0knzzqJJoZedNzoi3UQP/bUqJgVD
 qDSakpFzr8gZoLZolGbS+MhAHK9kIin0sv/jrsFd46jFgViG1OjMYp419ZWG52kfaE
 7IToGnzVtYGu2GIHC99N4FKROLGkdjW+xjWoh/Rw=
X-QQ-mid: zesmtpip3t1753169263t53df68e6
X-QQ-Originating-IP: rTOvj0yplF8v1TzV+LE7s5Wipo1URwqutr9CN7Z1bPc=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:27:37 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4379188185935626122
EX-QQ-RecipientCnt: 64
From: WangYuli <wangyuli@uniontech.com>
To: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, dave@stgolabs.net,
 jonathan.cameron@huawei.com, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 dan.j.williams@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, marcin.s.wojtas@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, arend.vanspriel@broadcom.com,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 akpm@linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, wangyuli@uniontech.com,
 ming.li@zohomail.com, linux-cxl@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, kvalo@kernel.org, johannes.berg@intel.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com,
 jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
 linux@treblig.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
 cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com, wangyuli@deepin.org
Subject: [PATCH v3 0/8] treewide: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:27:34 +0800
Message-ID: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MTbLGNmJundR9k3L4hhUbJN8ObUlVPA7XbHV14TgBBAfxrpD5Ypbo40l
 nZrsDOgyPnf+NL/d6EzXUG1uHE8kpUFk4fTguLEcOua3KIz0fHzkWIXjeg75SiRUq8fQJZb
 4AXg4eHkptFUHnf8Cl/aG11dJbDqlLM/nD0TyKENAY5EOl1zEXtVdQ6Az1SAxKfKubcjCPJ
 siUzVVUy6TrmUKgn1UZFv4oFu8Ogf9P/pyUjL1iGIu30Q5a+x5QBj49MkkhDpG3Jf5uN0VE
 90Lks4XTwRf+sTGUF3tL0Mrjr8aKesaBEeYO8K57eFxWJzgaFMtabjmM8tUeQ+rwxDoGPZS
 BUh9+KumoBYbofbWlmPrTaw2JNxyNGc+kQIPnmgG2xhdrFzaqja82U6LNKT6lNJgSPa6QKi
 sbYd7aOz/ZlcElDchI/1DCX7p7QYoUjsR41qAmK+VdTBj3WOL/bT5EQKFmTC2m6fnqtnpUc
 Crir85ke2PU382sIy0bWV0TStHdF5gAzXSZcUxS4niYJO+KLX3PMqF0tlEvyP83ZAI7SjfL
 OJcrpbnacSYRRca1Nr9e8nWLrRs8jUoMozvDCUgvJAaBkRtf4k3DQtJLg9MVvSt6HPTLyeH
 ULP30KOejksCzSLDHPstq7KS9yorLr0ZquQbfDBtt1KH+HfQB8PFuyRrZ3jvCOmmGlLptOb
 KjQqoVTd99fUNDs+l02nUMVdT8d7Zd23pTZNBk9egvtJvC//zLYkts3W3q9ZIAX8y/fi5s7
 0v7PoTJvQrdx8QOi0vMIHQJJrDoPEdEqt/wppDubBk8Xnp5C8MvwNS1909ey2kyl/B77Tt5
 BT8Juo/RxdrMmcjtSoPfqG1FKfybX8QKotz/VeDAv8e7DMFd1zxLDJeF20SLfqsTMGuZUoC
 6kVwp0yq+7AbXGAiBgthExtXAlhuPc3P1Am0ZXGQE5JxN7cY87bn3If/xUI7jUiT1ebVuD3
 ov5V7roqN4vsj+XCo0PJWXkl/P5VXarQqAcDB2wjyHB2+oPMoBjhqeWRbFw9ptZJqxaLe2N
 JKDsDdu9AAiPtyVjqh44MjyRxEWJw3YNqVzsftpUANgDBrM39OVskcHdfgkWuWS5b/9TOB9
 988tzCECp7Ls0QbVknq43QriqCApGGmhw==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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

There are some spelling mistakes of 'notifer' in comments which
should be 'notifier'.

Fix them and add it to scripts/spelling.txt.

WangYuli (8):
  KVM: x86: Fix typo "notifer"
  cxl: mce: Fix typo "notifer"
  drm/xe: Fix typo "notifer"
  net: mvneta: Fix typo "notifer"
  wifi: brcmfmac: Fix typo "notifer"
  serial: 8250_dw: Fix typo "notifer"
  xen/xenbus: Fix typo "notifer"
  scripts/spelling.txt: Add notifer||notifier to spelling.txt

 arch/x86/kvm/i8254.c                                        | 4 ++--
 drivers/cxl/core/mce.h                                      | 2 +-
 drivers/gpu/drm/xe/xe_vm_types.h                            | 2 +-
 drivers/net/ethernet/marvell/mvneta.c                       | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 drivers/tty/serial/8250/8250_dw.c                           | 2 +-
 include/xen/xenbus.h                                        | 2 +-
 scripts/spelling.txt                                        | 1 +
 8 files changed, 9 insertions(+), 8 deletions(-)
---
Changelog:
 *v1->v2: Break patch v1 up into one-patch-per-subsystem.
  v2->v3: Remove links to my patch v1 and add some "Reviewed-by" tags.

-- 
2.50.0

