Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BD5987C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5246E8CF;
	Fri, 28 Jun 2019 10:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E0F6E8CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:34:10 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M4JVv-1hgX5U2JRx-000Hmo; Fri, 28 Jun 2019 12:34:01 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/armada: fix debugfs link error
Date: Fri, 28 Jun 2019 12:33:40 +0200
Message-Id: <20190628103359.2516007-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:yDMdCFNWi3eU4ukD4Asr7J3rQl5xwCdYhWLt3CtMOZ0hUYFIVP0
 TN6nF1GWbhjRGe5AH0LiQ9iSfgDYTsV5YQjtAF49GKiyIbUdB56yLZ4vgitW4ndREs6VNRr
 XkiMQi+73hO8i64aUnRo/CspzmUQgF20+bQmrefYvEus5jIt2eFZjWVmUDp6cEgTjB1F9zd
 +4QDLSFXVhUEWpYEMDfrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WII6mkT31vU=:BJ3SdIyV3vMTpydYamkxj3
 DQJ7SUbnIXLT8VuLoKVLblLnbDI/iGV1QFIjaBputIyypzuRsuVz9SoAlCRLZ0/V/49TaYKc8
 g9mMlRbYjtcoiraCXQawDU1tgPJdFXcJacv4m/RjC4LLVYx7SlSid2m2isZdt6n+L73VZGUfu
 8ioGU3ZxwLRLzKHaXWU6tdGGoopQJNsjIcQ9hw99N05MOXgYYwoWRkn7LUCNC7c9MZgh18DJ4
 mKQR1DRFJvFfDvhkD4LpmqUasp17SZTasN1iJ6FuR5L2VxnhDjWuw3/vnKjf4Ug8vlCsHtiDy
 OjPFGIzKi5jJlrsy3DctMBgmhARIee2QXsmXgfuILwzFDiHE2A5WpKV7VIYjik8xTRCwvsBiP
 fz1+vTdI6Xyd5IpWY+DC9y1xzqjE0SPPruvX5zexTObFOr+88SMPl1qA64vPZf16/vlRglbsR
 sXYGwz4ZmOybPKI8ZdQAsjFamsQVgpOTmmk0bq+c0VyvfmK7LrkRqhQ8oNSLsIlUC3JozMH0x
 igINaxkEZXuOUsTL2GRbwDlF96yGL4yW/tqSjTb5GXP8aqdcdi4VCPd+Bg5l6iHhLEKMnp5Fp
 NMBPKaRjnrpayLeo+YSvO6KE0WEtDA14YWtMZoHKKyA6MIwbrcTYg4RSSMpJ0R9JBNBG/nV+R
 aVS21HUCWOrZEQzN53AdaIAUS+44q1TKitFQCJj9sdyIsRoaXJZKwdSGJtGiP+V5C1WahM5N1
 TFkifZmoEny1NieOKP1F0CNeCChPt83nYiyOkg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVidWdmcyBjYW4gYmUgZGlzYWJsZWQgYXQgY29tcGlsZSB0aW1lLCBjYXVzaW5nIGEgbGluayBl
cnJvcgp3aXRoIHRoZSBuZXdseSByZXN0cnVjdHVyZWQgY29kZToKCmRyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhX2NydGMubzogSW4gZnVuY3Rpb24gYGFybWFkYV9kcm1fY3J0Y19sYXRlX3Jl
Z2lzdGVyJzoKYXJtYWRhX2NydGMuYzooLnRleHQrMHg5NzQpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBhcm1hZGFfZHJtX2NydGNfZGVidWdmc19pbml0JwoKTWFrZSB0aGUgY29kZSBpbnRvIHRo
ZSBkZWJ1Z2ZzIGluaXQgZnVuY3Rpb24gY29uZGl0aW9uYWwuCgpGaXhlczogMDVlYzhiZDUyNGJh
ICgiZHJtL2FybWFkYTogcmVkbyBDUlRDIGRlYnVnZnMgZmlsZXMiKQpTaWduZWQtb2ZmLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEv
YXJtYWRhX2NydGMuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMuYwppbmRleCBlM2E1
OTY0ZDhhNjUuLjAzZDNmZDAwZmUwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFk
YS9hcm1hZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMu
YwpAQCAtNzczLDcgKzc3Myw5IEBAIHN0YXRpYyB2b2lkIGFybWFkYV9kcm1fY3J0Y19kZXN0cm95
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAogc3RhdGljIGludCBhcm1hZGFfZHJtX2NydGNfbGF0
ZV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7Ci0JYXJtYWRhX2RybV9jcnRjX2Rl
YnVnZnNfaW5pdChkcm1fdG9fYXJtYWRhX2NydGMoY3J0YykpOworCWlmIChJU19FTkFCTEVEKENP
TkZJR19ERUJVR19GUykpCisJCWFybWFkYV9kcm1fY3J0Y19kZWJ1Z2ZzX2luaXQoZHJtX3RvX2Fy
bWFkYV9jcnRjKGNydGMpKTsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjIwLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
