Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC2C01AB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94936EEBB;
	Fri, 27 Sep 2019 09:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7946EEBB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:03:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14AE7AFE1;
 Fri, 27 Sep 2019 09:03:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v3 2/5] drm/ast: Move ast_{show,
 hide}_cursor() within source file
Date: Fri, 27 Sep 2019 11:03:06 +0200
Message-Id: <20190927090309.10254-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927090309.10254-1-tzimmermann@suse.de>
References: <20190927090309.10254-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBvbmx5IG1vdmVzIGFyb3VuZCBjb2RlIGZvciBlYXNpZXIgcmV2aWV3IG9mIGxh
dGVyIHBhdGNoZXMuIE5vCmZ1bmN0aW9uYWwgY2FobmdlcyBhcmUgbWFkZS4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDM0ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMKaW5kZXggYTRjYmYyZDVlZTBhLi41YTllNmE4N2VhNWIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMKQEAgLTEwNjQsMjMgKzEwNjQsNiBAQCBzdGF0aWMgdm9pZCBh
c3RfaTJjX2Rlc3Ryb3koc3RydWN0IGFzdF9pMmNfY2hhbiAqaTJjKQogCWtmcmVlKGkyYyk7CiB9
CiAKLXN0YXRpYyB2b2lkIGFzdF9zaG93X2N1cnNvcihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCi17
Ci0Jc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSBjcnRjLT5kZXYtPmRldl9wcml2YXRlOwotCXU4
IGpyZWc7Ci0KLQlqcmVnID0gMHgyOwotCS8qIGVuYWJsZSBBUkdCIGN1cnNvciAqLwotCWpyZWcg
fD0gMTsKLQlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhj
YiwgMHhmYywganJlZyk7Ci19Ci0KLXN0YXRpYyB2b2lkIGFzdF9oaWRlX2N1cnNvcihzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMpCi17Ci0Jc3RydWN0IGFzdF9wcml2YXRlICphc3QgPSBjcnRjLT5kZXYt
PmRldl9wcml2YXRlOwotCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fQ1JUQ19Q
T1JULCAweGNiLCAweGZjLCAweDAwKTsKLX0KLQogc3RhdGljIHUzMiBjb3B5X2N1cnNvcl9pbWFn
ZSh1OCAqc3JjLCB1OCAqZHN0LCBpbnQgd2lkdGgsIGludCBoZWlnaHQpCiB7CiAJdW5pb24gewpA
QCAtMTEzNyw2ICsxMTIwLDIzIEBAIHN0YXRpYyB1MzIgY29weV9jdXJzb3JfaW1hZ2UodTggKnNy
YywgdTggKmRzdCwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0KQogCXJldHVybiBjc3VtOwogfQogCitz
dGF0aWMgdm9pZCBhc3Rfc2hvd19jdXJzb3Ioc3RydWN0IGRybV9jcnRjICpjcnRjKQoreworCXN0
cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gY3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsKKwl1OCBqcmVn
OworCisJanJlZyA9IDB4MjsKKwkvKiBlbmFibGUgQVJHQiBjdXJzb3IgKi8KKwlqcmVnIHw9IDE7
CisJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4Y2IsIDB4
ZmMsIGpyZWcpOworfQorCitzdGF0aWMgdm9pZCBhc3RfaGlkZV9jdXJzb3Ioc3RydWN0IGRybV9j
cnRjICpjcnRjKQoreworCXN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gY3J0Yy0+ZGV2LT5kZXZf
cHJpdmF0ZTsKKwlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwg
MHhjYiwgMHhmYywgMHgwMCk7Cit9CisKIHN0YXRpYyBpbnQgYXN0X2N1cnNvcl9zZXQoc3RydWN0
IGRybV9jcnRjICpjcnRjLAogCQkJICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIAkJCSAg
dWludDMyX3QgaGFuZGxlLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
