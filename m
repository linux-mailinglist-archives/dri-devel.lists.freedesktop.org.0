Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46599CBA24
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0292B6EB59;
	Fri,  4 Oct 2019 12:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4113B6EB59
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 12:17:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 05:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="204288067"
Received: from sschuler-mobl3.amr.corp.intel.com (HELO
 zkempczy-mobl2.ger.corp.intel.com) ([10.252.18.211])
 by orsmga002.jf.intel.com with ESMTP; 04 Oct 2019 05:16:55 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/drm_syncobj: Dead code removal
Date: Fri,  4 Oct 2019 14:16:52 +0200
Message-Id: <20191004121652.5940-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGRlYWQgY29kZSwgbGlrZWx5IG92ZXJzZWVuZWQgZHVyaW5nIHJldmlldyBwcm9jZXNz
LgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5
bnNraUBpbnRlbC5jb20+CkNjOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogSmFzb24gRWtzdHJhbmQgPGph
c29uQGpsZWtzdHJhbmQubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwg
NCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
CmluZGV4IDRiNWM3YjBlZDcxNC4uMjFhMjJlMzljOWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwpA
QCAtMTkyLDggKzE5Miw2IEBAIHN0YXRpYyB2b2lkIGRybV9zeW5jb2JqX2ZlbmNlX2FkZF93YWl0
KHN0cnVjdCBkcm1fc3luY29iaiAqc3luY29iaiwKIAlpZiAoIWZlbmNlIHx8IGRtYV9mZW5jZV9j
aGFpbl9maW5kX3NlcW5vKCZmZW5jZSwgd2FpdC0+cG9pbnQpKSB7CiAJCWRtYV9mZW5jZV9wdXQo
ZmVuY2UpOwogCQlsaXN0X2FkZF90YWlsKCZ3YWl0LT5ub2RlLCAmc3luY29iai0+Y2JfbGlzdCk7
Ci0JfSBlbHNlIGlmICghZmVuY2UpIHsKLQkJd2FpdC0+ZmVuY2UgPSBkbWFfZmVuY2VfZ2V0X3N0
dWIoKTsKIAl9IGVsc2UgewogCQl3YWl0LT5mZW5jZSA9IGZlbmNlOwogCX0KQEAgLTg1Niw4ICs4
NTQsNiBAQCBzdGF0aWMgdm9pZCBzeW5jb2JqX3dhaXRfc3luY29ial9mdW5jKHN0cnVjdCBkcm1f
c3luY29iaiAqc3luY29iaiwKIAlpZiAoIWZlbmNlIHx8IGRtYV9mZW5jZV9jaGFpbl9maW5kX3Nl
cW5vKCZmZW5jZSwgd2FpdC0+cG9pbnQpKSB7CiAJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwogCQly
ZXR1cm47Ci0JfSBlbHNlIGlmICghZmVuY2UpIHsKLQkJd2FpdC0+ZmVuY2UgPSBkbWFfZmVuY2Vf
Z2V0X3N0dWIoKTsKIAl9IGVsc2UgewogCQl3YWl0LT5mZW5jZSA9IGZlbmNlOwogCX0KLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
