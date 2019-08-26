Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FC9CC1E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 11:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044048982E;
	Mon, 26 Aug 2019 09:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327F8982E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 09:04:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 02:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="204510191"
Received: from jbroders-mobl1.ger.corp.intel.com (HELO
 delly.ger.corp.intel.com) ([10.252.38.38])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 02:04:52 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/syncobj: add protection against timeline resets
Date: Mon, 26 Aug 2019 12:04:45 +0300
Message-Id: <20190826090448.12819-1-lionel.g.landwerlin@intel.com>
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
Cc: Christian.Koenig@amd.com, jason@jlekstrand.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKRm9sbG93aW5nIEphc29uJ3Mgc3VnZ2VzdGlvbiBvbiBhbm90aGVyIHRocmVhZCBh
ZGRpbmcgdGltZWxpbmUKZG9jdW1lbnRhdGlvbiBbMV0sIGhlcmUgaXMgYSBzbWFsbCBzZXJpZXMg
YWRkaW5nIGEgY3JlYXRpb24gZmxhZyB0bwpzeW5jb2JqcyBzbyB0aGF0IHVzZXJzIGFyZSBwcmV2
ZW50ZWQgdG8gZHJvcCB0aGUgZXhpc3RpbmcgdGltZWxpbmUKZmVuY2VzIGluIHRoZSBzeW5jb2Jq
LCBlZmZlY3RpdmVsbHkgZW5zdXJpbmcgYSB1c2VyIGFsd2F5cyBhZGRzIHRvIHRoZQpkbWFfZmVu
Y2VfY2hhaW4gaW5zdGVhZCBvZiByZXBsYWNpbmcgaXQuCgpXZSBzdGlsbCBhbGxvdyBleHBsaWNp
dCByZXNldC4KCkFwYXJ0IGZyb20gdGhlIGZhY3Qgd2UgbmVlZCB0byBlbmZvcmNlIHRoaXMgcG9s
aWN5IGluIGVhY2ggZHJpdmVyJ3MKc3VibWlzc2lvbiBwYXRoLCBJIGhhdmVuJ3QgcnVuIGludG8g
b2RkcyB0aGluZ3MgeWV0LgoKQ2hlZXJzLAoKWzFdIDogaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktQXVndXN0LzIzMjcwMC5odG1sCgpMaW9uZWwg
TGFuZHdlcmxpbiAoMyk6CiAgZHJtL3N5bmNvYmo6IHByb3RlY3QgdGltZWxpbmUgc3luY29ianMK
ICBkcm0vYW1kL2FtZGdwdTogZGlzYWxsb3cgcmVwbGFjaW5nIGZlbmNlcyBpbiB0aW1lbGluZSBz
eW5jb2JqcwogIGRybS9pOTE1OiBkaXNhbGxvdyByZXBsYWNpbmcgZmVuY2VzIG9mIHRpbWVsaW5l
IHN5bmNvYmpzCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgICAgICAg
IHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jICAgICAgICAgICAgICAgICB8
IDMwICsrKysrKysrKysrKysrKysrKy0KIC4uLi9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4
ZWNidWZmZXIuYyAgICB8ICA4ICsrKysrCiBpbmNsdWRlL2RybS9kcm1fc3luY29iai5oICAgICAg
ICAgICAgICAgICAgICAgfCAgOCArKysrKwogaW5jbHVkZS91YXBpL2RybS9kcm0uaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogNSBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgotLQoyLjIzLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
