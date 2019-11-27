Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A77510B35D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6273E6E348;
	Wed, 27 Nov 2019 16:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28596E33F;
 Wed, 27 Nov 2019 16:33:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="221030718"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/13] video: fbmem: use const pointer for fb_ops
Date: Wed, 27 Nov 2019 18:32:02 +0200
Message-Id: <7550581b21a54500021d9a1b2b9b91ba075d19d1.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGluZm8tPmZib3BzIHBvaW50
ZXIgY29uc3QgaW4gdGhlCmZ1dHVyZS4KCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMKaW5kZXggODZiMDZhNTk5Zjk2Li4wMDNmNDk0Y2NhYmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9m
Ym1lbS5jCkBAIC0xMDc5LDcgKzEwNzksNyBAQCBFWFBPUlRfU1lNQk9MKGZiX2JsYW5rKTsKIHN0
YXRpYyBsb25nIGRvX2ZiX2lvY3RsKHN0cnVjdCBmYl9pbmZvICppbmZvLCB1bnNpZ25lZCBpbnQg
Y21kLAogCQkJdW5zaWduZWQgbG9uZyBhcmcpCiB7Ci0Jc3RydWN0IGZiX29wcyAqZmI7CisJY29u
c3Qgc3RydWN0IGZiX29wcyAqZmI7CiAJc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvIHZhcjsKIAlz
dHJ1Y3QgZmJfZml4X3NjcmVlbmluZm8gZml4OwogCXN0cnVjdCBmYl9jbWFwIGNtYXBfZnJvbTsK
QEAgLTEyOTIsNyArMTI5Miw3IEBAIHN0YXRpYyBsb25nIGZiX2NvbXBhdF9pb2N0bChzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKIAkJCSAgICB1bnNpZ25lZCBsb25nIGFyZykK
IHsKIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGVfZmJfaW5mbyhmaWxlKTsKLQlzdHJ1Y3Qg
ZmJfb3BzICpmYjsKKwljb25zdCBzdHJ1Y3QgZmJfb3BzICpmYjsKIAlsb25nIHJldCA9IC1FTk9J
T0NUTENNRDsKIAogCWlmICghaW5mbykKQEAgLTEzMzIsNyArMTMzMiw3IEBAIHN0YXRpYyBpbnQK
IGZiX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqIHZtYSkK
IHsKIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IGZpbGVfZmJfaW5mbyhmaWxlKTsKLQlzdHJ1Y3Qg
ZmJfb3BzICpmYjsKKwljb25zdCBzdHJ1Y3QgZmJfb3BzICpmYjsKIAl1bnNpZ25lZCBsb25nIG1t
aW9fcGdvZmY7CiAJdW5zaWduZWQgbG9uZyBzdGFydDsKIAl1MzIgbGVuOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
