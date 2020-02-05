Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720BC15340B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 16:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C6E89C13;
	Wed,  5 Feb 2020 15:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EC489BF4;
 Wed,  5 Feb 2020 15:40:10 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id b81so2691829ywe.9;
 Wed, 05 Feb 2020 07:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=18PoEPWuFM2KYsBe3wCA6P7dSJZNgZDnsgACDtqLcBc=;
 b=fRjabsYoK+Gy0jnQqVmuyA7LWZcmg/JIqUwD/Gal/luY1lmeNdgPDqxh5Uj9b3twtL
 wDKDOAfckPWn/+8MIgv8+KR635GcDyZmtTKXnJ0ueS8ktFwE74OYGUG0g19aWPlOJ2kQ
 4OIcEjBSzwwcWjPQ6Ag/U1aXrCarRdh++l/QUa+F8Z5ZKj26u5Bdm32dFEA4Dv/eoNOK
 lkXgWbtHd3uC7JA3TvCND4dGSfCcDf4cdS7QlmIfggVF3TP1dbZf9bhQERF49+z3AIIi
 Djo1ydRGdw8Tu0jsW8vydimH4DXNIDrZLPJuXFtVcmyM9gwv88MF1PXdN1uUMqFhIrMD
 w3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=18PoEPWuFM2KYsBe3wCA6P7dSJZNgZDnsgACDtqLcBc=;
 b=L7jaSYPVPs4HEBU/p1B53geTXkj0tWXmWjP7T9we12TdjIgETQVsDJEZb6Rk4lKM1R
 h70BDAAGxfMt2Isbi56XU71VG7wGu1UkMD7u5Xs34IoWilm7jGZ6o7L+9oPau0T5usFI
 kFot19y5zHoodL3equdRy5Yyhi5SplbXnGNhaL8j+8fnF3glazS9h5/fbQUorJtPYvQB
 gv/H9g7Za59Fnkv9W88oiHnqUgl1uZ3CXT39giL7TFolBl/PcvfAV0wh/Xpw/brtTn1t
 ry4fy5dSj0IjmxNp8TZGasiUdyjw9j7fXgEp/VNWBcZ37ZBy+iTDP97ty4vnXX9SEGJ3
 WIzg==
X-Gm-Message-State: APjAAAVWva4tR7J/hNR+mKHaX7jbQaioMgnHamxOLOjsp3N5SiOHFHxJ
 CYJMnI2O+vMn3/hzGjeGKLJ5AARR
X-Google-Smtp-Source: APXvYqxYX576j9aUzNj97r6A/lC8JEIo57EwOzsXf/aDvjHfMlbPVD5V3Gu1T9aOC70PjAd1AIqIUw==
X-Received: by 2002:a25:6b52:: with SMTP id o18mr29508776ybm.167.1580917209780; 
 Wed, 05 Feb 2020 07:40:09 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id q185sm61256ywh.61.2020.02.05.07.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 07:40:09 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/15] drm/amdgpu: rename amdgpu_debugfs_preempt_cleanup
Date: Wed,  5 Feb 2020 10:39:46 -0500
Message-Id: <20200205154000.536145-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205154000.536145-1-alexander.deucher@amd.com>
References: <20200205154000.536145-1-alexander.deucher@amd.com>
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
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDhkZjc3Mjc4MTVjYi4uM2Iw
OTg5N2ViMWU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CkBAIC0zMjI4LDcgKzMyMjgsNyBAQCB2b2lkIGFtZGdwdV9kZXZpY2VfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X3Vjb2RlX3N5c2ZzX2ZpbmkoYWRldik7CiAJaWYg
KElTX0VOQUJMRUQoQ09ORklHX1BFUkZfRVZFTlRTKSkKIAkJYW1kZ3B1X3BtdV9maW5pKGFkZXYp
OwotCWFtZGdwdV9kZWJ1Z2ZzX3ByZWVtcHRfY2xlYW51cChhZGV2KTsKKwlhbWRncHVfZGVidWdm
c19maW5pKGFkZXYpOwogCWlmIChhbWRncHVfZGlzY292ZXJ5ICYmIGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX05BVkkxMCkKIAkJYW1kZ3B1X2Rpc2NvdmVyeV9maW5pKGFkZXYpOwogfQotLSAKMi4y
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
