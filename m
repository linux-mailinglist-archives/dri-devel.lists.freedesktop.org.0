Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF50CB52B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37F66E2D7;
	Fri,  4 Oct 2019 07:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2019 12:50:20 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9EB89FD9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 12:50:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,574,1559520000"; d="scan'208";a="17548536"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
 ([173.38.203.22])
 by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 02 Oct 2019 12:43:10 +0000
Received: from localhost.rd.cisco.com ([10.47.76.245])
 by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id x92Ch9t7029812;
 Wed, 2 Oct 2019 12:43:10 GMT
From: Johan Korsnes <jkorsnes@cisco.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Date: Wed,  2 Oct 2019 14:42:26 +0200
Message-Id: <20191002124226.21458-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.47.76.245, [10.47.76.245]
X-Outbound-Node: aer-core-1.cisco.com
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1294; q=dns/txt; s=iport;
 t=1570020620; x=1571230220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=azYyqHIYzV26XDIjpKQ5qhK+INsrRrWYZtnuE1wO6nk=;
 b=HNTK42MlsEEt+63O1SI5q8MTldLdSx3AoAWMYWzKv2AFr2pJyr9T67VK
 h8z1T7QZJSX2OPGxv3rVsxhsqrfGYc9C3EAkinBVeRBSXl/hWVmG7q/9t
 Zec5vljpBxbQPlF7lQeyAcPpwlc8EaXbHOhSr9zlDOjhykmNqDUcA4V9A
 c=;
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
Cc: Johan Korsnes <jkorsnes@cisco.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBsb2dnaW5nIHRoZSBBVkkgSW5mb0ZyYW1lLCBjbGVhcmx5IGluZGljYXRlIHdoZXRoZXIg
b3Igbm90IHRoZQpleHRlbmRlZCBjb2xvcmltZXRyeSBhdHRyaWJ1dGUgaXMgYWN0aXZlLiBUaGlz
IGlzIG9ubHkgdGhlIGNhc2Ugd2hlbgp0aGUgQVZJIEluZm9GcmFtZSBjb2xvcmltZXRyeSBhdHRy
aWJ1dGUgaXMgc2V0IHRvIGV4dGVuZGVkLiBbMF0KClswXSBDVEEtODYxLUcgc2VjdGlvbiA2LjQg
cGFnZSA1NwoKU2lnbmVkLW9mZi1ieTogSm9oYW4gS29yc25lcyA8amtvcnNuZXNAY2lzY28uY29t
PgotLS0KIGRyaXZlcnMvdmlkZW8vaGRtaS5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vaGRtaS5jIGIvZHJpdmVycy92aWRlby9oZG1pLmMKaW5kZXggZjI5ZGI3MjhmZjI5Li5hNzA5
ZTM4YTUzY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jCisrKyBiL2RyaXZlcnMv
dmlkZW8vaGRtaS5jCkBAIC02ODIsOCArNjgyLDE0IEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZpX2lu
Zm9mcmFtZV9sb2coY29uc3QgY2hhciAqbGV2ZWwsCiAJaGRtaV9sb2coIiAgICBhY3RpdmUgYXNw
ZWN0OiAlc1xuIiwKIAkJCWhkbWlfYWN0aXZlX2FzcGVjdF9nZXRfbmFtZShmcmFtZS0+YWN0aXZl
X2FzcGVjdCkpOwogCWhkbWlfbG9nKCIgICAgaXRjOiAlc1xuIiwgZnJhbWUtPml0YyA/ICJJVCBD
b250ZW50IiA6ICJObyBEYXRhIik7Ci0JaGRtaV9sb2coIiAgICBleHRlbmRlZCBjb2xvcmltZXRy
eTogJXNcbiIsCisKKwlpZiAoZnJhbWUtPmNvbG9yaW1ldHJ5ID09IEhETUlfQ09MT1JJTUVUUllf
RVhURU5ERUQpCisJCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4iLAog
CQkJaGRtaV9leHRlbmRlZF9jb2xvcmltZXRyeV9nZXRfbmFtZShmcmFtZS0+ZXh0ZW5kZWRfY29s
b3JpbWV0cnkpKTsKKwllbHNlCisJCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6
IE4vQSAoMHgleClcbiIsCisJCQlmcmFtZS0+ZXh0ZW5kZWRfY29sb3JpbWV0cnkpOworCiAJaGRt
aV9sb2coIiAgICBxdWFudGl6YXRpb24gcmFuZ2U6ICVzXG4iLAogCQkJaGRtaV9xdWFudGl6YXRp
b25fcmFuZ2VfZ2V0X25hbWUoZnJhbWUtPnF1YW50aXphdGlvbl9yYW5nZSkpOwogCWhkbWlfbG9n
KCIgICAgbnVwczogJXNcbiIsIGhkbWlfbnVwc19nZXRfbmFtZShmcmFtZS0+bnVwcykpOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
