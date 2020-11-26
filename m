Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF52C59B1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 18:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3F6E957;
	Thu, 26 Nov 2020 17:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633706E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 17:01:31 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiKcr-0001Kj-AC; Thu, 26 Nov 2020 18:00:09 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiKch-0002rx-1n; Thu, 26 Nov 2020 17:59:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geoff Levand <geoff@infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Jens Axboe <axboe@kernel.dk>, Jim Paris <jim@jtan.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
Date: Thu, 26 Nov 2020 17:59:49 +0100
Message-Id: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJlbW92ZSBjYWxsYmFjayBpcyBvbmx5IGNhbGxlZCBmb3IgZGV2aWNlcyB0aGF0IHdlcmUg
cHJvYmVkCnN1Y2Nlc3NmdWxseSBiZWZvcmUuIEFzIHRoZSBtYXRjaGluZyBwcm9iZSBmdW5jdGlv
biBjYW5ub3QgY29tcGxldGUKd2l0aG91dCBlcnJvciBpZiBkZXYtPm1hdGNoX2lkICE9IFBTM19N
QVRDSF9JRF9TT1VORCwgd2UgZG9uJ3QgaGF2ZSB0bwpjaGVjayB0aGlzIGhlcmUuCgpTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
PgotLS0KIHNvdW5kL3BwYy9zbmRfcHMzLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9wcGMvc25kX3BzMy5jIGIvc291bmQvcHBjL3Nu
ZF9wczMuYwppbmRleCA1OGJiNDlmZmYxODQuLjZhYjc5NmE1ZDkzNiAxMDA2NDQKLS0tIGEvc291
bmQvcHBjL3NuZF9wczMuYworKysgYi9zb3VuZC9wcGMvc25kX3BzMy5jCkBAIC0xMDUzLDggKzEw
NTMsNiBAQCBzdGF0aWMgaW50IHNuZF9wczNfZHJpdmVyX3JlbW92ZShzdHJ1Y3QgcHMzX3N5c3Rl
bV9idXNfZGV2aWNlICpkZXYpCiB7CiAJaW50IHJldDsKIAlwcl9pbmZvKCIlczpzdGFydCBpZD0l
ZFxuIiwgX19mdW5jX18sICBkZXYtPm1hdGNoX2lkKTsKLQlpZiAoZGV2LT5tYXRjaF9pZCAhPSBQ
UzNfTUFUQ0hfSURfU09VTkQpCi0JCXJldHVybiAtRU5YSU87CiAKIAkvKgogCSAqIGN0bCBhbmQg
cHJlYWxsb2NhdGUgYnVmZmVyIHdpbGwgYmUgZnJlZWQgaW4KLS0gCjIuMjkuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
