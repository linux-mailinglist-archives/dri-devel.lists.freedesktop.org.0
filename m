Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA2EB05D23
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106110E5D0;
	Tue, 15 Jul 2025 13:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="FuSGLnLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 23267 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 13:41:48 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6F10E5CA;
 Tue, 15 Jul 2025 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752586877;
 bh=DYh+6PDIK8SljIBmyMHrXvBMyc6UvyjoLxtRvLKcLYw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=FuSGLnLwCgAHTPyGVASWNIky64prQYBGC23iLTwJaxSXF2msqdPe5oYgoHClHMjNJ
 5jf6pn/sdZvM2ROoK0aOG8bcnlxOzGOhJhgJVveAYgoF3H4us4KUN8Hiz2cHR4q8Yp
 EkZeBNRjaS9QdvY/QRZfUBTVHqYWXKOCZC3PZvZ8=
X-QQ-mid: zesmtpip4t1752586865t2a0dea2e
X-QQ-Originating-IP: vd1RqZ1Qgxy/7VfOTmQ9xNBTBKWDttmC7/G/8c4FLA8=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:41:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13011556839216271353
EX-QQ-RecipientCnt: 63
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
 guanwentao@uniontech.com
Subject: [PATCH v2 0/8] treewide: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:40:50 +0800
Message-ID: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OK0361LY/LXI8nlvspYlQFyqRrCjzyXqkN5hP7+ojw5/gb7lp68kF2Uk
 p1oClLbudbSJR3P8x8PW/7LNwwJ+hR2Hvavz4eCbd6BVdGRAoI1D5C0QoztMX1laDwCONbX
 6weFSI/xb4cvdsxW4Bak3I3uQR/3ClRwChlzk41AV3nH4wmRzkYGBEJ1ocIe849pcu0Vo/g
 jpim2OSAhgWz3M69ChCJcd2Hahig3apZi9l5ekG4VyAokkGN53A0V1qZ5YCI8RG/lQ5l/Hh
 iiBNsQnfBkRGwRtabZ9Ein8ApiG46wFSuyrHiPOZoIbJMhL2SnH1+c2D7qTCF+qgsDUXMLc
 xk2sK6DJ9Xfd41DXWqhkwLMLYLpZZ7c8q5ufIEgsnLtx1UWWeO72sZt+7TAIMOz7/JVQ8sC
 9RBt+HfearMkGGpCJRpeuotFbx9RA7qIv9LAdav7unk/lVf90IRMz/I2L6HdTWY0fucefUh
 NR5HHu+xRyLyZ04OWCvd52dsinwZ1mdc05uQbrWGSBWDWKsr+a1ujpmCizijtN3++0S8icp
 Am540IA5vTPLeNZNPIMLGQ5fblSy+hk2rOcxnVsrLSWBsldPKR82erUEzSqqoMQtXCbCSIw
 O4vGo23XycL7UGq2LmmuguaSuqUizXkLUSU9oJGZ079of2Z/TbzJZnh2+RI8qYzJxTsov4z
 maK0O0L5xileDIw0ERX8Ifv6/rEOhbd74ObslvwGTg3sTvt/xFQ2HW+rBBiZabiUdEsmWlZ
 +4sl7IwkAJW+W9D3+ozkmcenGJfUv7q4/Zgx2d2+g/ovDZEqdB1YL4MucZWfwbikbcR0M2n
 U3lkTDMzvRByPHoqiizNWGNZgoWDNMN6KMJpc/GF2mQk6iLSaz/FAnhwVaC7d+ziJufJSuK
 wuH1RnHlcKBlzkc7hpXB7M54uo/gbSo1U/Q3QtyKsQB+hJwe3CxBKZtAI84ZOSCrXvxdFsr
 IaXJludiZevFD0sLatMdcjWxjYVQrl3G0Nmk7XO6UWspEgIQr+p3vwYbaDjRNElFEeud+FT
 /+TLcfBnvL4Znjcqwqj5VCsm0dMKRuIE5z4IaUS/I4mw4BO8o8Wtpwipw2b08EzlIftEABl
 1uMAIsZQvx3eAnQ6HSD9lk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/

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

-- 
2.50.0

