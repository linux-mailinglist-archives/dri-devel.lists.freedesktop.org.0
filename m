Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A037B0D344
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21310E5FA;
	Tue, 22 Jul 2025 07:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="hh9mf8Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7690E10E5FA;
 Tue, 22 Jul 2025 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1753169773;
 bh=+qa2f3QEhHEuh4QOwcxSpKUWx1Ey8PdHAyuKdLKK9Qg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=hh9mf8Mc39i+ypXzkOsf4eXv2b0nYXHjypO6K51HtClWMOgoe8WiUCUOKgNrC7lSO
 kswBdHwDqCHODQZxZ6qIfnz8LZ4/eguAmnzJfkAWwhxgggEZRer794/zfwygBOEXsy
 Bh700+3qb0A6kf23H6xbSevPD5NtzbaKY2SbGXGs=
X-QQ-mid: zesmtpip2t1753169713ta05aff85
X-QQ-Originating-IP: 65xfAki0jxPR9TUF1QvLcfebtVmeg84+TUXILAN6dYc=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 22 Jul 2025 15:35:09 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13454134674662907572
EX-QQ-RecipientCnt: 64
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
 yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: [PATCH v3 5/8] wifi: brcmfmac: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:28 +0800
Message-ID: <6CA31F0821E6687F+20250722073431.21983-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MQzHuj/l4p1exEu9NuNMKN1TzxRjapobS0iun3hI2nqVfG1x6+jRK04f
 tT8vlT/6r11/mry+8E2FknrTTjJ1s03Pfjm4A9ZDX4hjhDppiI+6czHkM1JRSWxADR367/i
 e30EVLwP7CQl+hzDg+6s5bt4toKRrQHlnjGvMTmb9RilcUS8vM5HWtcVy/rsAkLU7ZjZDT5
 javyPBlyyO/WroBBr/dBYCabMdT9yHkF3Uwu6BFb3tbo07yTqQZaK/FWucml77KxMYXDN5u
 yWkrzEHYkSXV0YNLFdmmYv5UhcKf8sskP38SUEl99BkDjPhrQjda6yZfuM9056MXGOv75U5
 +z8rEoymijoo5EctmrvJCxd05hD+nHOqv3xDoaqPb8IQnSuzrQuy39DtUend1Lls2fM5yze
 GSAzU6BTCMaXRI+7CRCgu8TlTTEp/5/V2mHJBqyuRgFGEGVXiu0P5uvC/6ckAtkn9+yjv32
 9nEJHXVr6LSA8KG0Sc/MsiNRHT57fuio6zPlRQUz2nJ7KgQHlth+eSUJqRDP/OFA3H6r8bf
 ij06kwWYkULCQ4vWHXrdQasnr0VsPVvCF+Pu32RmK4UJjUCc1qlFcZFobELzB2NOrjsjkOD
 Ah4nLX5dy+WFw2yoHYxDEmexDm34B3akxoMmy7pIQyi8A0Er/NFl1ee5bJmvvlBi5Ha3r7Z
 o+3uBBtqDPQ8Wngrpm9Nca2+trlfxhqR6KEhdviIMj6XnCCPlPIPmq4cQ7Xqg/HHwgbv6eW
 k0EajGCLWit0v173HCkl9QMXaoRvqt/j/AmuRvCwtsJmvtWMLTCiOpVXfWlIleckEapp95T
 IJgvH0RsAC7Qml0fhLFxU5sP8u56a9UW1WmKSwtmBQTYmAMteq44iJisrmwKutIyrTnjCD6
 oWxW7kfkGIzSSALtq7hHN1KuXPsCyG/kVmJq7ZJeq7fNkaBs9GyGEt31eX6bdKUh1YvXmV9
 oj99lHJJdrJyRb9te+Z4txdv9mhitcK/PwKJ4hUClenjnk1s34antu7vbkOSNXe/Mod8GQx
 bHs4aPbo9p7WnY+CIsryjBWBMxqE8iSwOEvidZHBRlL+ggax4K4nDAvZIz6kIChr3d6EnS6
 UXIVFQOTxx8eyrv3QLTR4//ekHs7sOiykacSX/OuBywR1jod1jrydk=
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

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b94c3619526c..bcd56c7c4e42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8313,7 +8313,7 @@ struct brcmf_cfg80211_info *brcmf_cfg80211_attach(struct brcmf_pub *drvr,
 	cfg->d11inf.io_type = (u8)io_type;
 	brcmu_d11_attach(&cfg->d11inf);
 
-	/* regulatory notifer below needs access to cfg so
+	/* regulatory notifier below needs access to cfg so
 	 * assign it now.
 	 */
 	drvr->config = cfg;
-- 
2.50.0

