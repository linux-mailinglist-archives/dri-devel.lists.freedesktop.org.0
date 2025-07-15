Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91188B05DA9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A510E5D1;
	Tue, 15 Jul 2025 13:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="cYNpNWbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.73.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3D10E5D1;
 Tue, 15 Jul 2025 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752587119;
 bh=VbDjsaSgaoEPlFZ9K3vL7MSzjcmGihKEVnrA99JNOYI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=cYNpNWbYqKgbtSDrgMMfjJ2xkHgZRACyt6gucq3evEQo11N5w57rJeRzQ7B2fzh9e
 Wvr4qxNetJdS4xTKmYCMM2vK+tntv0eZYCh5l36LjGooQUOks3svE9xekEGP1XEEL2
 zPbk/ivgtwq0VZZgsVVizuezciF49dM5Ni64086s=
X-QQ-mid: zesmtpip2t1752587106t97bb4b6a
X-QQ-Originating-IP: fr1CmoslNJ1j99md0Ifh9EAzvQnNvfGQS6SMdf3j/kc=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 21:45:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4765109323548060574
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
Subject: [PATCH v2 5/8] wifi: brcmfmac: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:04 +0800
Message-ID: <F92035B0A9123150+20250715134407.540483-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NqpYruwlneiLbbMXibSF/Jw99ADSpZwhYZdtrpEogWm6GFFTjIUVxKs8
 tzurL/0a3h+MDp1L0HHo9Fadnk0ssOfLtFAQjF8//xsX6ZduVt043IyLtGW5/2BVYzOYMjr
 ecom+AxOAxXyP6Ko153/jbbr2I8KMcw41eh6nDovrtpgUP5N87Zxq5sFQA2H2zuYiIFYJod
 AvCCk41VmtavzLtaFf+qJH1yYaFXn706++Z+Cuzjqgj8T4axADd6XFfjSoeghwI4CgDNqIf
 4xW1dSCkn7SfWSG9I/1IdCDQmr88nwiCPLkhuNw0uxoPJgut1NABRgK7lhpMNWimcJ91iqi
 5JXIlaSuBdWJcB4GKICs3IaLIiYuGhxechK9sFYgvK6ZQsdKcihwAlyouAZ9WuwoNrI173+
 V0eCoKweSjBlJu+aH0I3wjpclOtleHRNETe0u8UOQ5L3w0UwIJ3RNzTPV7jUwqR9qYHuxzH
 l6txhWHwsUEzqWZoEzZKTodpbk8prWNHe7udHTL5y9xDxf8feC3FzRbi2dATa+8KA23+TGu
 jVP7Hes/B9MOOEUICYnJ0pMqjT9A/Tt7FdYC/H43+purPbgfRqsClSmZIB/Rfzb28bAP8B/
 i1e3d9OAXEbSyaJAG50WHlU1O2ZdcRzRQeENVZSX3YJDiwRrqnNmc0tN97srodbhYBb5mmf
 0SLYCqwwC8Wib5exbsvpCMvsU+JQfB39NRq675MyemAKLa8ZhRzz5NKhoTjQVftWlEb7/kX
 b9k6yNjcz7qvXCBdpbi0QFIKaQB10/a9Npmd5hWU7M6AKLfP+MIZqSa8C4lM9ZFitY4lByc
 6bH8vinxYDNgG+dhn4FYxLk6ZJys3cS/s4WPM0gyDsaz3haEKCw7n3KuYaNqvKtfByxMh8D
 Bcp8GZrAjCrf1RpFO/1lYuRi8vUlHjmDFwbTpLf5JGnq5/RI0HWrJ2mgQyeMT5P5oFphUYO
 Iy5vxWfdF9wFTUlvBXd+T2H8QL68gbhlCNm8T2sbhEFu+QFTCYk2xTekIPFR0E4l0UnKxyA
 Nr8wYmOuPA2kt9EEHO+x0jsm0tQCw2SchbG0tTKM/GgUxD+7pV+A4/0I4nqLmuEfKVMJQUR
 svBOlCalFeFY5cGcB06y/+SJafLQuFidrd3vnGlgLv9h3QKTltkAizyx7nS+TPXtA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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

