Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0564686
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948D6E0D3;
	Wed, 10 Jul 2019 12:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C176E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:51:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="186136344"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Jul 2019 05:51:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 15:51:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm: Fix return type of crc .poll()
Date: Wed, 10 Jul 2019 15:51:43 +0300
Message-Id: <20190710125143.9965-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNw
YXJzZSBjb21wYWluczoKLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jOjM1MDox
Nzogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gaW5pdGlhbGl6ZXIgKGRpZmZlcmVudCBiYXNl
IHR5cGVzKQouLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmM6MzUwOjE3OiAgICBl
eHBlY3RlZCByZXN0cmljdGVkIF9fcG9sbF90ICggKnBvbGwgKSggLi4uICkKLi4vZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jOjM1MDoxNzogICAgZ290IHVuc2lnbmVkIGludCAoICog
KSggLi4uICkKCkNoYW5nZSB0aGUgLnBvbGwoKSByZXR1cm4gdHlwZSB0byBfX3BvbGxfdCB0byBz
aWxlbmNlIGl0LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMg
fCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwppbmRleCA3Y2E0ODZkNzUwZTkuLjI4NGQ2
MTVlZDA4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwpAQCAtMzI1LDE5ICszMjUsMTcg
QEAgc3RhdGljIHNzaXplX3QgY3J0Y19jcmNfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZXAsIGNoYXIg
X191c2VyICp1c2VyX2J1ZiwKIAlyZXR1cm4gTElORV9MRU4oY3JjLT52YWx1ZXNfY250KTsKIH0K
IAotc3RhdGljIHVuc2lnbmVkIGludCBjcnRjX2NyY19wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBw
b2xsX3RhYmxlICp3YWl0KQorc3RhdGljIF9fcG9sbF90IGNydGNfY3JjX3BvbGwoc3RydWN0IGZp
bGUgKmZpbGUsIHBvbGxfdGFibGUgKndhaXQpCiB7CiAJc3RydWN0IGRybV9jcnRjICpjcnRjID0g
ZmlsZS0+Zl9pbm9kZS0+aV9wcml2YXRlOwogCXN0cnVjdCBkcm1fY3J0Y19jcmMgKmNyYyA9ICZj
cnRjLT5jcmM7Ci0JdW5zaWduZWQgcmV0OworCV9fcG9sbF90IHJldCA9IDA7CiAKIAlwb2xsX3dh
aXQoZmlsZSwgJmNyYy0+d3EsIHdhaXQpOwogCiAJc3Bpbl9sb2NrX2lycSgmY3JjLT5sb2NrKTsK
IAlpZiAoY3JjLT5zb3VyY2UgJiYgY3J0Y19jcmNfZGF0YV9jb3VudChjcmMpKQotCQlyZXQgPSBQ
T0xMSU4gfCBQT0xMUkROT1JNOwotCWVsc2UKLQkJcmV0ID0gMDsKKwkJcmV0IHw9IEVQT0xMSU4g
fCBFUE9MTFJETk9STTsKIAlzcGluX3VubG9ja19pcnEoJmNyYy0+bG9jayk7CiAKIAlyZXR1cm4g
cmV0OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
