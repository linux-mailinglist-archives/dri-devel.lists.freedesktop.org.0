Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D712DA0
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8B189F0A;
	Fri,  3 May 2019 12:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3801C89F19
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVG2t095237;
 Fri, 3 May 2019 07:31:16 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVGPr049524
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:16 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:15 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtx002029;
 Fri, 3 May 2019 07:31:13 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 15/23] drm/bridge: tc358767: cleanup LT result check
Date: Fri, 3 May 2019 15:29:41 +0300
Message-ID: <20190503122949.12266-16-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886676;
 bh=hz1E9B84rWrlzOkP6HOoQvd+Y2z9eUNIP7zKj6H6g08=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dyfFfwb4hhJW5biAkP+pOcPrIy/g003RlIYm22ia6ygv7QBRyoHl8TqJ5UQjcdxad
 fNNV2x2Vog6h3n8KqSgeE7oo2FzirMTqwOcG6n6YE4nhtfbnXKwtlv9u5+Js6SCHsA
 ymBbhIAG6851B0QU9FRx1O810HUGI2ij+nCBH5xk=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBoYXMgYSBsb29wIGFmdGVyIGVuZGluZyBsaW5rIHRyYWluaW5nLCB3aGVyZSBp
dCByZWFkcyB0aGUKRFBDRCBsaW5rIHN0YXR1cyBhbmQgcHJpbnRzIGFuIGVycm9yIGlmIHRoYXQg
c3RhdHVzIGlzIG5vdCBvay4KClRoZSBsb29wIGlzIHVubmVjZXNzYXJ5LCBhcyBmYXIgYXMgSSBj
YW4gdW5kZXJzdGFuZCBmcm9tIERQIHNwZWNzLCBzbwpsZXQncyByZW1vdmUgaXQuIFdlIGNhbiBh
bHNvIHByaW50IHRoZSBtb3JlIHNwZWNpZmljIGVycm9ycyB0byBoZWxwCmRlYnVnZ2luZy4KClNp
Z25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDYyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggODdlYjg3NWUxMTc0Li4yY2VjMDY1MjBm
Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTk4MCwzNCArOTgwLDQyIEBAIHN0
YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJl
dCA8IDApCiAJCWdvdG8gZXJyX2RwY2Rfd3JpdGU7CiAKLQkvKiBXYWl0ICovCi0JdGltZW91dCA9
IDEwMDsKLQlkbyB7Ci0JCXVkZWxheSgxKTsKLQkJLyogUmVhZCBEUENEIDB4MjAyLTB4MjA3ICov
Ci0JCXJldCA9IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoYXV4LCB0bXAgKyAyKTsKLQkJ
aWYgKHJldCA8IDApCi0JCQlnb3RvIGVycl9kcGNkX3JlYWQ7Ci0JfSB3aGlsZSAoKC0tdGltZW91
dCkgJiYKLQkJICEoZHJtX2RwX2NoYW5uZWxfZXFfb2sodG1wICsgMiwgIHRjLT5saW5rLmJhc2Uu
bnVtX2xhbmVzKSkpOworCS8qIENoZWNrIGxpbmsgc3RhdHVzICovCisJcmV0ID0gZHJtX2RwX2Rw
Y2RfcmVhZF9saW5rX3N0YXR1cyhhdXgsIHRtcCk7CisJaWYgKHJldCA8IDApCisJCWdvdG8gZXJy
X2RwY2RfcmVhZDsKIAotCWlmICh0aW1lb3V0ID09IDApIHsKLQkJLyogUmVhZCBEUENEIDB4MjAw
LTB4MjAxICovCi0JCXJldCA9IGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9TSU5LX0NPVU5ULCB0
bXAsIDIpOwotCQlpZiAocmV0IDwgMCkKLQkJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQkJZGV2X2Vy
cihkZXYsICJjaGFubmVsKHMpIEVRIG5vdCBva1xuIik7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIw
MCBTSU5LX0NPVU5UOiAweCUwMnhcbiIsIHRtcFswXSk7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIw
MSBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SOiAweCUwMnhcbiIsCi0JCQkgdG1wWzFdKTsKLQkJ
ZGV2X2luZm8oZGV2LCAiMHgwMjAyIExBTkUwXzFfU1RBVFVTOiAweCUwMnhcbiIsIHRtcFsyXSk7
Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIwNCBMQU5FX0FMSUdOX1NUQVRVU19VUERBVEVEOiAweCUw
MnhcbiIsCi0JCQkgdG1wWzRdKTsKLQkJZGV2X2luZm8oZGV2LCAiMHgwMjA1IFNJTktfU1RBVFVT
OiAweCUwMnhcbiIsIHRtcFs1XSk7Ci0JCWRldl9pbmZvKGRldiwgIjB4MDIwNiBBREpVU1RfUkVR
VUVTVF9MQU5FMF8xOiAweCUwMnhcbiIsCi0JCQkgdG1wWzZdKTsKLQotCQlyZXR1cm4gLUVBR0FJ
TjsKKwlyZXQgPSAwOworCisJdmFsdWUgPSB0bXBbMF0gJiBEUF9DSEFOTkVMX0VRX0JJVFM7CisK
KwlpZiAodmFsdWUgIT0gRFBfQ0hBTk5FTF9FUV9CSVRTKSB7CisJCWRldl9lcnIodGMtPmRldiwg
IkxhbmUgMCBmYWlsZWQ6ICV4XG4iLCB2YWx1ZSk7CisJCXJldCA9IC1FTk9ERVY7CisJfQorCisJ
aWYgKHRjLT5saW5rLmJhc2UubnVtX2xhbmVzID09IDIpIHsKKwkJdmFsdWUgPSAodG1wWzBdID4+
IDQpICYgRFBfQ0hBTk5FTF9FUV9CSVRTOworCisJCWlmICh2YWx1ZSAhPSBEUF9DSEFOTkVMX0VR
X0JJVFMpIHsKKwkJCWRldl9lcnIodGMtPmRldiwgIkxhbmUgMSBmYWlsZWQ6ICV4XG4iLCB2YWx1
ZSk7CisJCQlyZXQgPSAtRU5PREVWOworCQl9CisKKwkJaWYgKCEodG1wWzJdICYgRFBfSU5URVJM
QU5FX0FMSUdOX0RPTkUpKSB7CisJCQlkZXZfZXJyKHRjLT5kZXYsICJJbnRlcmxhbmUgYWxpZ24g
ZmFpbGVkXG4iKTsKKwkJCXJldCA9IC1FTk9ERVY7CisJCX0KKwl9CisKKwlpZiAocmV0KSB7CisJ
CWRldl9lcnIoZGV2LCAiMHgwMjAyIExBTkUwXzFfU1RBVFVTOiAgICAgICAgICAgIDB4JTAyeFxu
IiwgdG1wWzBdKTsKKwkJZGV2X2VycihkZXYsICIweDAyMDMgTEFORTJfM19TVEFUVVMgICAgICAg
ICAgICAgMHglMDJ4XG4iLCB0bXBbMV0pOworCQlkZXZfZXJyKGRldiwgIjB4MDIwNCBMQU5FX0FM
SUdOX1NUQVRVU19VUERBVEVEOiAweCUwMnhcbiIsIHRtcFsyXSk7CisJCWRldl9lcnIoZGV2LCAi
MHgwMjA1IFNJTktfU1RBVFVTOiAgICAgICAgICAgICAgIDB4JTAyeFxuIiwgdG1wWzNdKTsKKwkJ
ZGV2X2VycihkZXYsICIweDAyMDYgQURKVVNUX1JFUVVFU1RfTEFORTBfMTogICAgMHglMDJ4XG4i
LCB0bXBbNF0pOworCQlkZXZfZXJyKGRldiwgIjB4MDIwNyBBREpVU1RfUkVRVUVTVF9MQU5FMl8z
OiAgICAweCUwMnhcbiIsIHRtcFs1XSk7CisJCWdvdG8gZXJyOwogCX0KIAogCXJldHVybiAwOwot
LSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAg
SGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9t
aWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
