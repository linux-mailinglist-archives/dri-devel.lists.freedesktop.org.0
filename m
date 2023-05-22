Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016570C096
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB310E28A;
	Mon, 22 May 2023 13:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07610E331
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684763896; i=deller@gmx.de;
 bh=+zC3D8AvSEx830CUZFTlFVLy1JxPYYFXGv+HoGh9Av0=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=IDPxrfQCdUUkRxqxb9W5C9SsZiaoePHw8nIVqk2V3ft0IVyBYYDGf/ILaovf3M+9Y
 KPU4y/r1RDEnS2imPTqVs4Z6BIVnYz21xcIiqPKp6TYl3ue8aAsPmZtlzIkXAIMXbX
 40X7C29RFwzOhGxSYjlf1h2FggJCg+L8gRs7iqSYIAsQy+DVZ5qOL98hoiwuK7Q2SK
 qx+OMW8LvdpB9OIEqVQJAWO5qqbEpO+4jVyRMJ+lNqNYSNW/evG7kcFlUlqXRTZ0AX
 Y32AvpsMi0S3hbploK4BCxouBjltBeGjJdFfhbtvuL2b2RS2w9wLQAv1DCJvDwxKFF
 iM3vcWY6vKx3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530.fritz.box ([94.134.144.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VHM-1qBZZq2PyU-016swh; Mon, 22
 May 2023 15:58:16 +0200
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 1/2] sticon/parisc: Allow 64-bit STI calls in PDC firmware
 abstration
Date: Mon, 22 May 2023 15:58:14 +0200
Message-Id: <20230522135815.38949-2-deller@gmx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522135815.38949-1-deller@gmx.de>
References: <20230522135815.38949-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f1rA2fw3o3HqeljaA7TXJFVJnsDxEKN8ALDvRtFYdQqvhGK7TJR
 WAMAW80wBSfg/ugKwoty8NCbhaskr5iKroDTPv+pV6pwsX9bDFOFfobVQ3qr4sTwc1TiPbt
 eQb68ZSn1Ot31ZjE1CeSPoE39yVioHugIU/3hH9MvUgZ4s3wITlkDOmwyl9wXijRVEZJLEL
 LedjFFisSK1m57lxVmulw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YtlrGUopMJE=;LjocBl0vIhwfkfauTUByyhEJ5nS
 G+AWOwlrSDPQz4XE1Dk08Uwgp8euuyIwz9zveFQiUApPa4KM8PZMxLxGkK6JgHjaqJNz3u7A7
 sl/ZXmyrqY2gNUvzpVj+vvPtCEdUYM1dqP/mTevQnAHB0h5PPtoFBHYpzeHpzMoRlw/tPmF01
 fQMu95QblnuGhSJQLsb0PoqFXavhaP7LLYequv/qbmEyP8uL9YY8ROoggJIMH86p9IzlWoWDw
 5fERG8Yk/Q4BswQken70ZkK/qg2GE7j1jq47u9le5zcSNYRcdqG8GfgZVUWVPWz3hfRrClYkE
 4GmyQf65XTY/ktE2+wTxoRO5YpuLp6KI75YlMc//7DYHJTqefyvByJedXgFmZRVEqqcA9ghqA
 YNqsLwrB1DneiET0weOST5AZWc/npoYqVC05K5xapuVsgDbZ2+kFSGPIqjTbfXG0bOH7/TT3w
 cVpQlrOaUm50CLbcQWcmn0WOyejbSxqO7SHNWQWAYPj593fplZphoOj3fFA8D+h1EKeDejrGp
 dd4pdpM9LZOEKvocXfR3jVgMLK5ZxLA9usMqWZrIHn9l0QMLRbQsPmEvl0SeMPK45OOBd0ziP
 tnziRzHi8Efxpn1bGxL7YUAoCefpRa7SmWCjDPXbDAGdQGWHslgzc807CtDQaKL62jdqXL7w5
 yA9qMBDM5ZMW61d8cuNijXMhzDQw2IXLT0HujSfpyvjqI8K3T/VyTfu3G7EjoU5GF9nVr2t00
 cYb4AmeFpf6ZpCPejogaqJJTosLr9EybyzrD3CWROOd83B4dfzO9JVczMaP4YJoOzsA4LHsLI
 RnFc1uzWktJ5E4fd5PK2j1UP5beOF9wNNkm73nOjTfi6UVhInRZ0faG1NaRc9FfVYnMJKht7q
 4VEkpz0t5ep7RuT3bdKqFAZLvrS7lt2K8KO/56YGNaQh+DJXFf4UadzHFS+F59hCbNF8LSNk2
 Hm8x/g==
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

Some 64-bit machines require us to call the STI ROM in 64-bit mode, e.g.
with the VisFXe graphic card.
This patch allows drivers to use such 64-bit calling conventions.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/include/asm/pdc.h |  4 ++--
 arch/parisc/kernel/firmware.c | 21 ++++++++++++++-------
 drivers/video/sticore.c       |  2 +-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 2b4fad8328e8..269b9a159f01 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -88,8 +88,8 @@ int pdc_iodc_print(const unsigned char *str, unsigned co=
unt);

 void pdc_emergency_unlock(void);
 int pdc_sti_call(unsigned long func, unsigned long flags,
-                 unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg);
+		unsigned long inptr, unsigned long outputr,
+		unsigned long glob_cfg, int do_call64);

 int __pdc_cpu_rendezvous(void);
 void pdc_cpu_rendezvous_lock(void);
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index cc124d9f1f7f..71ef1640db5a 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1389,17 +1389,24 @@ int pdc_iodc_getc(void)
 }

 int pdc_sti_call(unsigned long func, unsigned long flags,
-                 unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg)
+		unsigned long inptr, unsigned long outputr,
+		unsigned long glob_cfg, int do_call64)
 {
-        int retval;
+	int retval =3D 0;
 	unsigned long irqflags;

-        spin_lock_irqsave(&pdc_lock, irqflags);
-        retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
-        spin_unlock_irqrestore(&pdc_lock, irqflags);
+	spin_lock_irqsave(&pdc_lock, irqflags);
+	if (IS_ENABLED(CONFIG_64BIT) && do_call64) {
+#ifdef CONFIG_64BIT
+		retval =3D real64_call(func, flags, inptr, outputr, glob_cfg);
+#else
+		WARN_ON(1);
+#endif
+	} else
+		retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
+	spin_unlock_irqrestore(&pdc_lock, irqflags);

-        return retval;
+	return retval;
 }
 EXPORT_SYMBOL(pdc_sti_call);

diff --git a/drivers/video/sticore.c b/drivers/video/sticore.c
index 7eb925f2ba9c..60ba3ab5b6cc 100644
=2D-- a/drivers/video/sticore.c
+++ b/drivers/video/sticore.c
@@ -1142,7 +1142,7 @@ int sti_call(const struct sti_struct *sti, unsigned =
long func,
 		return -1;
 #endif

-	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg);
+	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg, 0);

 	return ret;
 }
=2D-
2.40.1

