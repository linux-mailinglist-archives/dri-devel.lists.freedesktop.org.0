Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D0482EC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 14:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFC18921D;
	Mon, 17 Jun 2019 12:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922638921D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:48:21 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M5PyX-1hbTbo3fxl-001Ome; Mon, 17 Jun 2019 14:48:01 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: pvr2fb: fix compile-testing as module
Date: Mon, 17 Jun 2019 14:47:36 +0200
Message-Id: <20190617124758.1252449-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fQtLcNbtFadlnuLEAq66p6lty3m3sCianAYbjFY5chYptpALFcP
 4TxA6KG53CIq6rdVgC2Kw5nD2IaMXJ9u2BJNWuVDUJEgJ1UZ7GJu0qTunRJs6pVBchRVHN4
 6/SGL8y9THk7xyJslKbKJ5xTKGBxXsBnkJr8gaAoXGZvwc1iK9Xywo/doP/QGHF3pzhceof
 kh4RdN+3fsW0iy/E4G7aQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NPqdFaKRhec=:lkKoHx6wdLb5r5g14ioiy1
 uwH9a3rmaAwmHLYZGcFd7m67zqtsWFr6xzqJAXKqkl0T1laFSLypRhCug/yHZbNyO6xuGYPMj
 liNdVhD4poaIJSkG5UsQfXvYfLUNGtOk2G23+cjDJhhsdFXgyE3uswykw4yMedtlojfb6fjot
 hZ9qYQuXhQzAje+Lf1iY6rf6k9npIa7e9LQukSn76TWe9gCvOeqefKSKW1vCEqqu2OELO3ZkL
 du4t2tjwc12ZyMGfT5pvlO41awVTRrpuxRlNbfgtM1g9LQyNkhF9/dAV8iM5QLuKYGi7/2TQV
 k4AathpPl5Fty7Er23WgsVkLjT47mEGB4EDYly6mYWxfB9y7q2VwjsFTH0mX4UYlwZuQQdHFC
 3sYlbZVzHpKdsXe+LEHdI+cOFr/OVL3I7f+C20gayOOfRSEXw0IB7xMZnUoNfd5UglXL2D2A9
 JWJj4fPdpB2IcxUKjOo4VSWXi2kTYBVYgym6AX4+MZwGKP/89gBG8dq5T8sRqiBiV+yTgUR94
 Tq2jvVXyaaQUznlxOVi1gE5zu68cZ1IqPSBaPadTunaM4dTsZCDAeOZNXHSR3p2ad0LcgBOjk
 mGAYcQVb1d64vwwAd8eGIZP2+adfBBedct4G2WfAWWW91BiweyqFd4dRbtwm1r1nb+nEyY6Rd
 lzDOEX4sxeTU62xDnO99nVuRvGLgHlz8Cmz1stGzayK8+xWfvIaOkCru5mvDpX1utmzdpk7oi
 ejdZRUC4AlthUaR6bdgaY5kj0z1rHqVauKxVaA==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnVpbGRpbmcgYW4gYWxsbW9kY29uZmlnIGtlcm5lbCBub3cgcHJvZHVjZXMgYSBoYXJtbGVzcyB3
YXJuaW5nOgoKZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYzo3MjY6MTI6IGVycm9yOiB1bnVz
ZWQgZnVuY3Rpb24gJ3B2cjJfZ2V0X3BhcmFtX3ZhbCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rp
b25dCgpTaHV0IHRoaXMgdXAgdGhlIHNhbWUgd2F5IGFzIHdlIGRvIGZvciBvdGhlciB1bnVzZWQg
ZnVuY3Rpb25zCmluIHRoZSBzYW1lIGZpbGUsIHVzaW5nIHRoZSBfX21heWJlX3VudXNlZCBhdHRy
aWJ1dGUuCgpGaXhlczogMGY1YTU3MTJhZDFlICgidmlkZW86IGZiZGV2OiBwdnIyZmI6IGFkZCBD
T01QSUxFX1RFU1Qgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9wdnIyZmIuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9wdnIy
ZmIuYwppbmRleCA1OWM1OWIzYTY3Y2IuLmNmOWNmZGM1ZTY4NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9wdnIyZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B2cjJmYi5j
CkBAIC03MjMsOCArNzIzLDggQEAgc3RhdGljIHN0cnVjdCBmYl9vcHMgcHZyMmZiX29wcyA9IHsK
IAkuZmJfaW1hZ2VibGl0CT0gY2ZiX2ltYWdlYmxpdCwKIH07CiAKLXN0YXRpYyBpbnQgcHZyMl9n
ZXRfcGFyYW1fdmFsKGNvbnN0IHN0cnVjdCBwdnIyX3BhcmFtcyAqcCwgY29uc3QgY2hhciAqcywK
LQkJCSAgICAgIGludCBzaXplKQorc3RhdGljIGludCBfX21heWJlX3VudXNlZCBwdnIyX2dldF9w
YXJhbV92YWwoY29uc3Qgc3RydWN0IHB2cjJfcGFyYW1zICpwLAorCQkJCQkgICAgIGNvbnN0IGNo
YXIgKnMsIGludCBzaXplKQogewogCWludCBpOwogCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
