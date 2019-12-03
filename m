Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC011102AA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A026EA10;
	Tue,  3 Dec 2019 16:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD17B6EA0D;
 Tue,  3 Dec 2019 16:40:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:16 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="412248795"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 12/12] auxdisplay: constify fb ops
Date: Tue,  3 Dec 2019 18:38:54 +0200
Message-Id: <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com,
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgpDYzogTWlndWVsIE9qZWRh
IFNhbmRvbmlzIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgpDYzogUm9iaW4gdmFu
IGRlciBHcmFjaHQgPHJvYmluQHByb3RvbmljLm5sPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IE1pZ3VlbCBPamVkYSA8bWln
dWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4KQWNrZWQtYnk6IFJvYmluIHZhbiBkZXIgR3Jh
Y2h0IDxyb2JpbkBwcm90b25pYy5ubD4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMg
fCAyICstCiBkcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jICAgICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2F1eGRpc3BsYXkvY2ZhZzEyODY0YmZiLmMgYi9kcml2ZXJzL2F1eGRpc3BsYXkvY2Zh
ZzEyODY0YmZiLmMKaW5kZXggNDA3NDg4NmI3YmM4Li4yMDAyMjkxYWIzMzggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYworKysgYi9kcml2ZXJzL2F1eGRpc3Bs
YXkvY2ZhZzEyODY0YmZiLmMKQEAgLTU3LDcgKzU3LDcgQEAgc3RhdGljIGludCBjZmFnMTI4NjRi
ZmJfbW1hcChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
CiAJcmV0dXJuIHZtX21hcF9wYWdlc196ZXJvKHZtYSwgJnBhZ2VzLCAxKTsKIH0KIAotc3RhdGlj
IHN0cnVjdCBmYl9vcHMgY2ZhZzEyODY0YmZiX29wcyA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZmJfb3BzIGNmYWcxMjg2NGJmYl9vcHMgPSB7CiAJLm93bmVyID0gVEhJU19NT0RVTEUsCiAJLmZi
X3JlYWQgPSBmYl9zeXNfcmVhZCwKIAkuZmJfd3JpdGUgPSBmYl9zeXNfd3JpdGUsCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jIGIvZHJpdmVycy9hdXhkaXNwbGF5L2h0
MTZrMzMuYwppbmRleCBhMmZjZGU1ODJlMmEuLmQ5NTFkNTRiMjZmNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9hdXhkaXNwbGF5L2h0MTZrMzMuYworKysgYi9kcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmsz
My5jCkBAIC0yMjgsNyArMjI4LDcgQEAgc3RhdGljIGludCBodDE2azMzX21tYXAoc3RydWN0IGZi
X2luZm8gKmluZm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXJldHVybiB2bV9tYXBf
cGFnZXNfemVybyh2bWEsICZwYWdlcywgMSk7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZmJfb3BzIGh0
MTZrMzNfZmJfb3BzID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaHQxNmszM19mYl9v
cHMgPSB7CiAJLm93bmVyID0gVEhJU19NT0RVTEUsCiAJLmZiX3JlYWQgPSBmYl9zeXNfcmVhZCwK
IAkuZmJfd3JpdGUgPSBmYl9zeXNfd3JpdGUsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
