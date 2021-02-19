Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CE31F948
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 13:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22E6E8C9;
	Fri, 19 Feb 2021 12:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAE76EB23
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 81D1280106;
 Fri, 19 Feb 2021 13:17:10 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/3] drm/uapi: Add USB connector type
Date: Fri, 19 Feb 2021 13:17:00 +0100
Message-Id: <20210219121702.50964-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219121702.50964-1-noralf@tronnes.org>
References: <20210219121702.50964-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=sSyzFPz0vM96QvMiUssA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgY29ubmVjdG9yIHR5cGUgZm9yIFVTQiBjb25uZWN0ZWQgZGlzcGxheSBwYW5lbHMuCgpT
b21lIGV4YW1wbGVzIG9mIHdoYXQgY3VycmVudCB1c2Vyc3BhY2Ugd2lsbCBuYW1lIHRoZSBjb25u
ZWN0b3I6Ci0gV2VzdG9uOiAiVU5OQU1FRC0lZCIKLSBNdXR0ZXI6ICJVbmtub3duMjAtJWQiCi0g
WDogIlVua25vd24yMC0lZCIKCnYyOgotIFVwZGF0ZSBkcm1fY29ubmVjdG9yX2VudW1fbGlzdAot
IEFkZCBleGFtcGxlcyB0byBjb21taXQgbWVzc2FnZQoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8
bm9yYWxmQHRyb25uZXMub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMg
fCAxICsKIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKaW5kZXggNzE3YzRl
NzI3MWIwLi41MjcxMmRhZWQzYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29u
bmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpAQCAtOTQsNiAr
OTQsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uX3Byb3BfZW51bV9saXN0IGRybV9jb25uZWN0
b3JfZW51bV9saXN0W10gPSB7CiAJeyBEUk1fTU9ERV9DT05ORUNUT1JfRFBJLCAiRFBJIiB9LAog
CXsgRFJNX01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSywgIldyaXRlYmFjayIgfSwKIAl7IERSTV9N
T0RFX0NPTk5FQ1RPUl9TUEksICJTUEkiIH0sCisJeyBEUk1fTU9ERV9DT05ORUNUT1JfVVNCLCAi
VVNCIiB9LAogfTsKIAogdm9pZCBkcm1fY29ubmVjdG9yX2lkYV9pbml0KHZvaWQpCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9t
b2RlLmgKaW5kZXggZmVkNjZhMDNjN2FlLi4zMzAyNGNjNWQyNmUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgK
QEAgLTM2Nyw2ICszNjcsNyBAQCBlbnVtIGRybV9tb2RlX3N1YmNvbm5lY3RvciB7CiAjZGVmaW5l
IERSTV9NT0RFX0NPTk5FQ1RPUl9EUEkJCTE3CiAjZGVmaW5lIERSTV9NT0RFX0NPTk5FQ1RPUl9X
UklURUJBQ0sJMTgKICNkZWZpbmUgRFJNX01PREVfQ09OTkVDVE9SX1NQSQkJMTkKKyNkZWZpbmUg
RFJNX01PREVfQ09OTkVDVE9SX1VTQgkJMjAKIAogLyoqCiAgKiBzdHJ1Y3QgZHJtX21vZGVfZ2V0
X2Nvbm5lY3RvciAtIEdldCBjb25uZWN0b3IgbWV0YWRhdGEuCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
