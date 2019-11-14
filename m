Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE3FD792
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DD66E029;
	Fri, 15 Nov 2019 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2019 10:23:10 UTC
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA426E5D9;
 Thu, 14 Nov 2019 10:23:10 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Nov 2019 15:46:57 +0530
IronPort-SDR: lkhLyskng5J0klG/9RWVxN2nL6fyRmJw97v05Gn7Mvg5rotW1gGDf6vfUsRrU2EfFh47YXFMQp
 LGZdt8IUHa1PNQGY/sWDmj4X9soz9gZvB2jUHg/VyEgUG/DCPZH3ZrNSvrkORbycjQ515yY6Y9
 wG7vHS4qplpgxHiB0JYy4bjonIT8WdXqwq627BdQFPhyIG6tvG54qDNTtUpZAyyfOPrHkFaq8d
 DBfwo7otXOKB6O87w188qq3yLCxFC1VzA2Y4ecef2NosgBal4GQ/+zOcwmNydg6GVpXEVe/spe
 t/1Yd/+i1U5+dRyqYUOmDPa3
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Nov 2019 15:46:39 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 026CF2704; Thu, 14 Nov 2019 15:46:37 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] drm/msm: add DSI config changes to support DSI version
Date: Thu, 14 Nov 2019 15:46:28 +0530
Message-Id: <1573726588-18897-3-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERTSSBjb25maWcgY2hhbmdlcyB0byBzdXBwb3J0IERTSSB2ZXJzaW9uLgoKU2lnbmVkLW9m
Zi1ieTogSGFyaWdvdmluZGFuIFAgPGhhcmlnb3ZpQGNvZGVhdXJvcmEub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwog
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2NmZy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5jCmluZGV4IGI3Yjdj
MWEuLmQyYzQ1OTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmMKQEAgLTEzMyw2ICsxMzMs
MTAgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBkc2lfc2RtODQ1X2J1c19jbGtfbmFtZXNb
XSA9IHsKIAkiaWZhY2UiLCAiYnVzIiwKIH07CiAKK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qg
ZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzW10gPSB7CisgICAgICAgICJpZmFjZSIsICJidXMiLAor
fTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBzZG04NDVfZHNpX2NmZyA9
IHsKIAkuaW9fb2Zmc2V0ID0gRFNJXzZHX1JFR19TSElGVCwKIAkucmVnX2NmZyA9IHsKQEAgLTE0
Nyw2ICsxNTEsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NvbmZpZyBzZG04NDVf
ZHNpX2NmZyA9IHsKIAkubnVtX2RzaSA9IDIsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IG1z
bV9kc2lfY29uZmlnIHNjNzE4MF9kc2lfY2ZnID0geworCS5pb19vZmZzZXQgPSBEU0lfNkdfUkVH
X1NISUZULAorCS5yZWdfY2ZnID0geworCQkubnVtID0gMSwKKwkJLnJlZ3MgPSB7CisJCQl7InZk
ZGEiLCAyMTgwMCwgNCB9LAkvKiAxLjIgViAqLworCQl9LAorCX0sCisJLmJ1c19jbGtfbmFtZXMg
PSBkc2lfc2M3MTgwX2J1c19jbGtfbmFtZXMsCisJLm51bV9idXNfY2xrcyA9IEFSUkFZX1NJWkUo
ZHNpX3NjNzE4MF9idXNfY2xrX25hbWVzKSwKKwkuaW9fc3RhcnQgPSB7IDB4YWU5NDAwMCB9LAor
CS5udW1fZHNpID0gMSwKK307CisKIGNvbnN0IHN0YXRpYyBzdHJ1Y3QgbXNtX2RzaV9ob3N0X2Nm
Z19vcHMgbXNtX2RzaV92Ml9ob3N0X29wcyA9IHsKIAkubGlua19jbGtfZW5hYmxlID0gZHNpX2xp
bmtfY2xrX2VuYWJsZV92MiwKIAkubGlua19jbGtfZGlzYWJsZSA9IGRzaV9saW5rX2Nsa19kaXNh
YmxlX3YyLApAQCAtMjAxLDYgKzIxOSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9j
ZmdfaGFuZGxlciBkc2lfY2ZnX2hhbmRsZXJzW10gPSB7CiAJCSZtc204OTk4X2RzaV9jZmcsICZt
c21fZHNpXzZnX3YyX2hvc3Rfb3BzfSwKIAl7TVNNX0RTSV9WRVJfTUFKT1JfNkcsIE1TTV9EU0lf
NkdfVkVSX01JTk9SX1YyXzJfMSwKIAkJJnNkbTg0NV9kc2lfY2ZnLCAmbXNtX2RzaV82Z192Ml9o
b3N0X29wc30sCisJe01TTV9EU0lfVkVSX01BSk9SXzZHLCBNU01fRFNJXzZHX1ZFUl9NSU5PUl9W
Ml80XzEsCisJCSZzYzcxODBfZHNpX2NmZywgJm1zbV9kc2lfNmdfdjJfaG9zdF9vcHN9LAorCiB9
OwogCiBjb25zdCBzdHJ1Y3QgbXNtX2RzaV9jZmdfaGFuZGxlciAqbXNtX2RzaV9jZmdfZ2V0KHUz
MiBtYWpvciwgdTMyIG1pbm9yKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX2NmZy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2NmZy5oCmluZGV4IGUyYjdh
N2QuLjk5MTk1MzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9jZmcu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfY2ZnLmgKQEAgLTE5LDYgKzE5LDcg
QEAKICNkZWZpbmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjFfNF8xCTB4MTAwNDAwMDEKICNkZWZp
bmUgTVNNX0RTSV82R19WRVJfTUlOT1JfVjJfMl8wCTB4MjAwMDAwMDAKICNkZWZpbmUgTVNNX0RT
SV82R19WRVJfTUlOT1JfVjJfMl8xCTB4MjAwMjAwMDEKKyNkZWZpbmUgTVNNX0RTSV82R19WRVJf
TUlOT1JfVjJfNF8xCTB4MjAwNDAwMDEKIAogI2RlZmluZSBNU01fRFNJX1YyX1ZFUl9NSU5PUl84
MDY0CTB4MAogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
