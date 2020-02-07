Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE63155ECD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3424A6FD69;
	Fri,  7 Feb 2020 19:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458556FD62;
 Fri,  7 Feb 2020 19:51:08 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id y2so161139qvu.13;
 Fri, 07 Feb 2020 11:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6tp8lbkNZ4vvovr7+zUqpsvLjCLpUqj6oN6SSSy5BNA=;
 b=XTHdaXyRMooLO9PCRIIvNA3nZpRTjJPokIgNRzV/Vr/k3yhVCfeAf/gI/3iJwkSp8Z
 SJCPMWz+RRfaTF9F7j8aWpHjB3SoAVCvatENdBwGyumQpSDdo4YEXr89OSgAFuPA2fv+
 NTMSbkm2mahon0l0RoMr595iN4AQ0Mp0McPkAF9NX3+9/mmhccHKeki1tI+K+t9ifUlj
 aPMEZsTpqM8bswNElAgDIHmlbE/rjH0mc9mG8ZQExLZCUidw6bDSCylP+JgYBqf6XriT
 Ci/upospPyDB5J2C7tiRTbu5Oy3QocyS4nt7LywPSzGsPKYm9iwUdzSwqjyHuH58+J+L
 EXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6tp8lbkNZ4vvovr7+zUqpsvLjCLpUqj6oN6SSSy5BNA=;
 b=l7xbpbnZf6+fyqg2dakn9ouagGzmf8HLcAaizsBjxo4INrXEIao/DWCJ9+7EvPJIEP
 s2b7CBtpB6JsSqYls6REQMASjdJTcsff7PPwuJ5Of5nm+EUH1KZCccdefh23ixKhjvTl
 +C7yHpOY9W0NLSxQm/MVL5ZOxS5uzzE5zo0YYrA4ZFBEC+HJG+B0tdq/Q0Z3x8YX2WfM
 NgVhgsowMLyssvwKiGX34rO4vtlfia1PdjcX8lQZa732JyImS/BTwEXmUjjEmBUCYcnS
 VxryAzQB5Gc23XZPIivZBZX6/d+GHME9j6qnoUOEEC5R0DFruaGmHEK6/MHAOg0lLXbT
 YsVA==
X-Gm-Message-State: APjAAAWjtBg+Tw7vc6H3wRaGJ+3d2sv9rHd4j50r+g2qG7HGtnU0evh9
 FJG4dNG1MYCr67JEbPyjBRz1j/r3
X-Google-Smtp-Source: APXvYqzq+Pf4rTp6584dAGIQmvuyHazMjhgHHqxhlpB4+yHq1tZwSGb36+eTiJoloEmBWVIkqZn5Hg==
X-Received: by 2002:ad4:55e8:: with SMTP id bu8mr20149qvb.61.1581105067061;
 Fri, 07 Feb 2020 11:51:07 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:06 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/15] drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
Date: Fri,  7 Feb 2020 14:50:44 -0500
Message-Id: <20200207195058.2354-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dG8gYW1kZ3B1X2RlYnVnZnNfZmluaS4gIEl0IHdpbGwgYmUgdXNlZCBmb3Igb3RoZXIgdGhpbmdz
IGluCnRoZSBmdXR1cmUuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVn
ZnMuYyB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMu
aCB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgfCAy
ICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwppbmRleCBmMjRlZDlh
MWEzZTUuLjU4YjVlMWI0ZjgxNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGVidWdmcy5jCkBAIC0xMjI5LDcgKzEyMjksNyBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCQkJQVJSQVlfU0laRShhbWRncHVfZGVi
dWdmc19saXN0KSk7CiB9CiAKLXZvaWQgYW1kZ3B1X2RlYnVnZnNfcHJlZW1wdF9jbGVhbnVwKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQordm9pZCBhbWRncHVfZGVidWdmc19maW5pKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCWRlYnVnZnNfcmVtb3ZlKGFkZXYtPmRlYnVnZnNf
cHJlZW1wdCk7CiB9CkBAIC0xMjM5LDcgKzEyMzksNyBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlyZXR1cm4gMDsKIH0KLXZvaWQgYW1k
Z3B1X2RlYnVnZnNfcHJlZW1wdF9jbGVhbnVwKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSB7
IH0KK3ZvaWQgYW1kZ3B1X2RlYnVnZnNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikg
eyB9CiBpbnQgYW1kZ3B1X2RlYnVnZnNfcmVnc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogewogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RlYnVnZnMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmgKaW5kZXggZjI4OWQyOGFkNmIyLi5iMzgyNTI3ZTM1OWEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuaApAQCAtMzQsNyArMzQsNyBAQCBzdHJ1
Y3QgYW1kZ3B1X2RlYnVnZnMgewogaW50IGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7CiB2b2lkIGFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfY2xlYW51cChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci12b2lkIGFtZGdwdV9kZWJ1Z2ZzX3ByZWVtcHRfY2xl
YW51cChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cit2b2lkIGFtZGdwdV9kZWJ1Z2ZzX2Zp
bmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9kZWJ1Z2ZzX2FkZF9m
aWxlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCSAgICAgY29uc3Qgc3RydWN0IGRy
bV9pbmZvX2xpc3QgKmZpbGVzLAogCQkJICAgICB1bnNpZ25lZCBuZmlsZXMpOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDdjYmI2ZDM1OGVlMS4uNGNm
MWMyZDI2MWNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CkBAIC0zMjYwLDcgKzMyNjAsNyBAQCB2b2lkIGFtZGdwdV9kZXZpY2VfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X3Vjb2RlX3N5c2ZzX2ZpbmkoYWRldik7CiAJaWYg
KElTX0VOQUJMRUQoQ09ORklHX1BFUkZfRVZFTlRTKSkKIAkJYW1kZ3B1X3BtdV9maW5pKGFkZXYp
OwotCWFtZGdwdV9kZWJ1Z2ZzX3ByZWVtcHRfY2xlYW51cChhZGV2KTsKKwlhbWRncHVfZGVidWdm
c19maW5pKGFkZXYpOwogCWlmIChhbWRncHVfZGlzY292ZXJ5ICYmIGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX05BVkkxMCkKIAkJYW1kZ3B1X2Rpc2NvdmVyeV9maW5pKGFkZXYpOwogfQotLSAKMi4y
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
