Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C726886
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95BA89C0A;
	Wed, 22 May 2019 16:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACCC89BFD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:42:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s17so3087271wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EiCXJBgmQQgvHjA9MJX6zXtOm5JUiCrk6V/+8qDrxZk=;
 b=NmiP7v/LmXCNEvK5g3Dc3+6Gmohdy4hE4EzGq57KIek6zYBRBmpTb8wHWKUnnlg2t+
 cu3+Qq8GZMm10uGaL3d9GrTIB9lRPnp+Y7+vm/rNUAj+U/LEV8ww5kGeyYhQL7vTQqmt
 N2hblq3jPffd5/Sd8t+qBqexqkfcvJEFNlTuvqXQISrn6sjBW0nDbPvm+80PMS2v7uJR
 09Qayz81o0hvn8syILU7pq6YEMGNx02qnio/4Dxqcf6CmIT1sDJFXOMLjS2L+pv78Ym3
 1u/y4MKXOIoqhvs1XSyceqWF5ZmLIGjJQxFe14qW45gHrhChBJP23pKey86SoZPwPdsG
 ZYQA==
X-Gm-Message-State: APjAAAXKIVYQ/R2RCF1LRMWQngoEZSyhF1U5hd4w6Z6u8RpL0VJ1JnWj
 4j212i0cUkxNIL9UAS3PU+NulCk5
X-Google-Smtp-Source: APXvYqwmuJmBXVS+sNh7zySGrXTzRc79zy0KCVF6B0eeuSJbs1d2RpNguwyFSqi92qTB470E1aKixQ==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr40395703wru.91.1558543362833; 
 Wed, 22 May 2019 09:42:42 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l18sm24576684wrv.38.2019.05.22.09.42.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:42:42 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] vmwgfx: drop empty lastclose stub
Date: Wed, 22 May 2019 17:41:15 +0100
Message-Id: <20190522164119.24139-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EiCXJBgmQQgvHjA9MJX6zXtOm5JUiCrk6V/+8qDrxZk=;
 b=gnpg/6QLDSAPuzTRIaDVF+KpTNeqMgBNG6VMO8WH8vGRjBDQfaSR6b25rd3Gymo4M1
 B7tl5EXpBuaHej0Fc3ujlNcMcB6eoFldKwwPw1iDhXdn9W3FUsVj1Gqs/I7QnZyI8XjT
 FjIoQ/XM9ySe245b0BO9jhPgF7WjdBInMoIf9F4Jl+sSADPekUCZFqoWZPDUOtbNoSwI
 cVNBOadIEGuwvZwbzgBVQqGJwq90WcC3IupfIOvgtvJuTSAZ43iFYR9Gzu1vW+4/Z0Ad
 TcZH28t1IO8dR2rvvdK7cuHQ5G2OQonAXmMLdlX2ODeGpAqJWnEeQRpvDETudxSyrU9+
 v8PQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel@collabora.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkNvcmUgRFJN
IGlzIHNhZmUgd2hlbiB0aGUgY2FsbGJhY2sgaXMgTlVMTC4KCkNjOiAiVk13YXJlIEdyYXBoaWNz
IiA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIHwgNSAtLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuYwppbmRleCBiZTI1Y2U5NDQwYWQuLmEzOGYwNjkwOWZiNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmMKQEAgLTEyMDAsMTAgKzEyMDAsNiBAQCBzdGF0aWMgbG9uZyB2bXdf
Y29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQgY21kLAogfQogI2Vu
ZGlmCiAKLXN0YXRpYyB2b2lkIHZtd19sYXN0Y2xvc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikK
LXsKLX0KLQogc3RhdGljIHZvaWQgdm13X21hc3Rlcl9pbml0KHN0cnVjdCB2bXdfbWFzdGVyICp2
bWFzdGVyKQogewogCXR0bV9sb2NrX2luaXQoJnZtYXN0ZXItPmxvY2spOwpAQCAtMTU2OCw3ICsx
NTY0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKIAlEUklWRVJfTU9E
RVNFVCB8IERSSVZFUl9QUklNRSB8IERSSVZFUl9SRU5ERVIgfCBEUklWRVJfQVRPTUlDLAogCS5s
b2FkID0gdm13X2RyaXZlcl9sb2FkLAogCS51bmxvYWQgPSB2bXdfZHJpdmVyX3VubG9hZCwKLQku
bGFzdGNsb3NlID0gdm13X2xhc3RjbG9zZSwKIAkuZ2V0X3ZibGFua19jb3VudGVyID0gdm13X2dl
dF92YmxhbmtfY291bnRlciwKIAkuZW5hYmxlX3ZibGFuayA9IHZtd19lbmFibGVfdmJsYW5rLAog
CS5kaXNhYmxlX3ZibGFuayA9IHZtd19kaXNhYmxlX3ZibGFuaywKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
