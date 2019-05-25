Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E452A6FD
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 22:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310396E17B;
	Sat, 25 May 2019 20:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854AA6E179;
 Sat, 25 May 2019 20:43:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z5so11491747lji.10;
 Sat, 25 May 2019 13:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E+IbTkqQdZIcyZ+fBbhT4Ah4Mh1U2qaUUK0vC3RuDmc=;
 b=rR0ZJXa+KSupt0N6DoFNwty2ji3WtpclPvnM406DOR6cNxibIm4EbQ8lKhfaTSu1iB
 M53eaJYqtreE6XiqgYLEPiAwAG+oDwHqOpiK/pmR7NCF7JfbKlu7c9TyvEXvHnZ45z33
 ccWpOORHM7iuY/mS82qGfIGT6WcUSpu5CtA9qOorAoPIGPwgpMiFwjczHUA28ip/F9Xq
 dgZklTmTHH1X+3jemUc4WCGI1t57Jgjre5q9YIlrTSODrVT7S75/CMlP4f6ic1ByS9fM
 H2ioPlnSnMV4Lu0Jy2+f2HJ9jxSyyR6JzlAtYD3KCUCKw1qKAADdUuYUf2uZIbjG3DeT
 4cBg==
X-Gm-Message-State: APjAAAXrvtjYQqLOuTMVi17qCatGPGds3mBieUzIry9E+ZkIL4Q/GXnu
 JgxCU5pwLEw7CwdrrMUdwAFsrBa/
X-Google-Smtp-Source: APXvYqzNIZam+xs4mQoiquZxKtWOaikG22UDA8p2dzC6n6t6monOM57uRrGyNahQ9Nn+6nByLWnwJQ==
X-Received: by 2002:a2e:5515:: with SMTP id j21mr30297898ljb.198.1558817020700; 
 Sat, 25 May 2019 13:43:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i187sm1328569lfe.64.2019.05.25.13.43.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 13:43:40 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/gma500: drop use of DRM_UDELAY wrapper
Date: Sat, 25 May 2019 22:43:18 +0200
Message-Id: <20190525204319.28977-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525204319.28977-1-sam@ravnborg.org>
References: <20190525204319.28977-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+IbTkqQdZIcyZ+fBbhT4Ah4Mh1U2qaUUK0vC3RuDmc=;
 b=oYJxpJ8FkfGorV9so39ERQ6Pvp+mS9GNCHhxIc6LZGyBJVCIsp7Uksfb7LqdmachUZ
 FcG91Ualpj78BwVZvioSMV5+QoweKTbxJFuWiQJSYWEK/cCII4Hfy8rrd83yTBERImlO
 9eQQhPd/RIpwVwdtMRX47AEfdvSLI4SbIWBvpU6T4nFkAAIIHQ1Ep1aoO23yBd0vWPGZ
 zbnAZ7mcux0NTx1/csPyc4tt2xhBfVVJP4Lej2QY6ukNI8ckNtNiVxzb9yvRHEr/vCaO
 fhgyH1+iun8NKxGcMEw5UgGPK4Qw8VgFAjn4wKHX8ae+cqBVQjbZbp/r1RVmk9b2pCdz
 FOFw==
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERSTV9VREVMQVkgd3JhcHBlciBmcm9tIGRybV9vc19saW51eC5oIGlzIHVzZWQgaW4gYSBm
ZXcgcGxhY2VzLAphbGwgb3RoZXIgcGxhY2VzIGNhbGxzIHVkZWxheSgpIHdpdGggbm8gd3JhcHBl
ci4KClRoZXJlIGlzIG5vIHJlYXNvbiB0byBjb250aW51ZSB0byB1c2UgdGhpcyB3cmFwcGVyIC0g
c28gZHJvcCBpdAphbmQgZGlyZWN0IGNhbGwgdWRlbGF5KCkuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIu
amFrb2Jzc29uQGdtYWlsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RldmljZS5jICAgIHwgNCArKy0tCiBk
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2RldmljZS5jIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL2dtYTUwMC9vYWt0cmFpbF9oZG1pLmMgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxk
X2RldmljZS5jCmluZGV4IDU4NWVjMmU0NjE2Ni4uZWRiOWIxYmJkNmM2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL21kZmxkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9nbWE1MDAvbWRmbGRfZGV2aWNlLmMKQEAgLTM0NCw3ICszNDQsNyBAQCBzdGF0aWMgaW50IG1k
ZmxkX3Jlc3RvcmVfZGlzcGxheV9yZWdpc3RlcnMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50
IHBpcGVudW0pCiAKIAlpZiAocGlwZW51bSA9PSAxKSB7CiAJCS8qIHJlc3RvcmUgcGFsZXR0ZSAo
Z2FtbWEpICovCi0JCS8qRFJNX1VERUxBWSg1MDAwMCk7ICovCisJCS8qIHVkZWxheSg1MDAwMCk7
ICovCiAJCWZvciAoaSA9IDA7IGkgPCAyNTY7IGkrKykKIAkJCVBTQl9XVkRDMzIocGlwZS0+cGFs
ZXR0ZVtpXSwgbWFwLT5wYWxldHRlICsgKGkgPDwgMikpOwogCkBAIC00MDYsNyArNDA2LDcgQEAg
c3RhdGljIGludCBtZGZsZF9yZXN0b3JlX2Rpc3BsYXlfcmVnaXN0ZXJzKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIGludCBwaXBlbnVtKQogCVBTQl9XVkRDMzIocGlwZS0+Y29uZiwgbWFwLT5jb25m
KTsKIAogCS8qIHJlc3RvcmUgcGFsZXR0ZSAoZ2FtbWEpICovCi0JLypEUk1fVURFTEFZKDUwMDAw
KTsgKi8KKwkvKiB1ZGVsYXkoNTAwMDApOyAqLwogCWZvciAoaSA9IDA7IGkgPCAyNTY7IGkrKykK
IAkJUFNCX1dWREMzMihwaXBlLT5wYWxldHRlW2ldLCBtYXAtPnBhbGV0dGUgKyAoaSA8PCAyKSk7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2RldmljZS5jCmluZGV4IGYwODcyZTJj
MjJkNS4uMmQ4YWZiYjUxYTc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29h
a3RyYWlsX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfZGV2
aWNlLmMKQEAgLTMyNyw3ICszMjcsNyBAQCBzdGF0aWMgaW50IG9ha3RyYWlsX3Jlc3RvcmVfZGlz
cGxheV9yZWdpc3RlcnMoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAogCS8qIEFjdHVhbGx5IGVu
YWJsZSBpdCAqLwogCVBTQl9XVkRDMzIocC0+ZHBsbCwgTVJTVF9EUExMX0EpOwotCURSTV9VREVM
QVkoMTUwKTsKKwl1ZGVsYXkoMTUwKTsKIAogCS8qIFJlc3RvcmUgbW9kZSAqLwogCVBTQl9XVkRD
MzIocC0+aHRvdGFsLCBIVE9UQUxfQSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL29ha3RyYWlsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfaGRt
aS5jCmluZGV4IGM2ZDcyZGUxYzA1NC4uNzk3MzI5MDI4NDM5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL29ha3RyYWlsX2hkbWkuYwpAQCAtODE1LDcgKzgxNSw3IEBAIHZvaWQgb2FrdHJhaWxfaGRt
aV9yZXN0b3JlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJUFNCX1dWREMzMihoZG1pX2Rldi0+
c2F2ZURQTExfQURKVVNULCBEUExMX0FESlVTVCk7CiAJUFNCX1dWREMzMihoZG1pX2Rldi0+c2F2
ZURQTExfVVBEQVRFLCBEUExMX1VQREFURSk7CiAJUFNCX1dWREMzMihoZG1pX2Rldi0+c2F2ZURQ
TExfQ0xLX0VOQUJMRSwgRFBMTF9DTEtfRU5BQkxFKTsKLQlEUk1fVURFTEFZKDE1MCk7CisJdWRl
bGF5KDE1MCk7CiAKIAkvKiBwaXBlICovCiAJUFNCX1dWREMzMihwaXBlYi0+c3JjLCBQSVBFQlNS
Qyk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
