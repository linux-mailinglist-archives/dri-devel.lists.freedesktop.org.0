Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF4674837
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472E56E676;
	Thu, 25 Jul 2019 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95626E3A6;
 Thu, 25 Jul 2019 03:53:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id az7so22814445plb.5;
 Wed, 24 Jul 2019 20:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
 b=DUZFAli26r1ogsXH8LSUeeBqS0stlYJExXgjPjdJUIm228B6EpCDO7XKZ8pTwsc9GH
 HXs2B6sdRerh3yrRPySjYuSGYMUto7I88lim71tWJOuPKxksn23lh+btsPIVDTnZCSxf
 /oXwto2HHp7UmYSxEGsNgg53dXNYf5PbKhGk8qbQApBfMFGloVq829+mQBEMCF2HqvDy
 8TQHsiolq6E6SOkpUa/KDUVRUcBp86qQgvvbvgq3gnMyHJMpqN6HgRfPNgkRTA/ldfOh
 q0Yby8JT7t2bSu3QPGKkMeOs+edfweC5ysyruQ/3lMTae8FostaNrjASWgfopbMry4dh
 o7sQ==
X-Gm-Message-State: APjAAAXZi1a3OZHoPgtPYLmpYGNBQCOP3dfTXULdTHVZWNcJ2T7ehQA/
 G9Z5xg9Q1EiVVJMQf29jYWM=
X-Google-Smtp-Source: APXvYqx9hemuW6yfJrdLe/W9cnYSkxCvTtjqmGP/oGqHMbl2olfl8tXQReuCOEwOZAZOQSmHSy68kw==
X-Received: by 2002:a17:902:296a:: with SMTP id
 g97mr87272714plb.115.1564026785497; 
 Wed, 24 Jul 2019 20:53:05 -0700 (PDT)
Received: from huyue2.ccdomain.com ([218.189.10.173])
 by smtp.gmail.com with ESMTPSA id 11sm49035787pfw.33.2019.07.24.20.53.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 20:53:04 -0700 (PDT)
From: Yue Hu <zbestahu@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
 robh@kernel.org, tomeu.vizoso@collabora.com
Subject: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant
Date: Thu, 25 Jul 2019 11:52:39 +0800
Message-Id: <20190725035239.1192-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.17.1.windows.2
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y5mWEC7ogDY2PSdGXYMgqGEgddaBMGRrx0o4VSfwM/o=;
 b=YPWRGW5VmHNWo6GsrY3FzBl3NteVrMAlJZDe3aI5Qbe6y5GoO5iz1P+VoDpS114xir
 lnJQbc5weUseSt46orAnRfhtgU/fGYHAaJncUp0dU254Ien57uasz/8B2c8/2K/U8r0/
 SI6MS2x4qfFMTOZPT7DKM7mt3pqN0cBUoUDHoh/iM+ZC4NvBGXbCfcjt4Ksn8UYlfBB6
 e2HareCP+ntG+5Swk2Js+HaoQIKrGB7BK1KzTohZT6t55ozmluarZfKGJc0HAiaYXvBp
 EyZKEFpF0pr4jklKhXLmUMatasZm31V6OXaGTsCTUIv/F9V4mjXTBBTA+SUwlovdfdvU
 3U1Q==
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, huyue2@yulong.com, myungjoo.ham@samsung.com,
 zhangwen@yulong.com, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlIEh1IDxodXl1ZTJAeXVsb25nLmNvbT4KClNpbmNlIGdvdmVybm9yIG5hbWUgaXMg
ZGVmaW5lZCBieSBERVZGUkVRIGZyYW1ld29yayBpbnRlcm5hbGx5LCB1c2UgdGhlCm1hY3JvIGRl
ZmluaXRpb24gaW5zdGVhZCBvZiB1c2luZyB0aGUgbmFtZSBkaXJlY3RseS4KClNpZ25lZC1vZmYt
Ynk6IFl1ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ3B1LmMgICAgICAgICAgICAgICB8IDMgKystCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jIHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKaW5kZXggNGVkYjg3NC4uZjcz
MDhkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMKQEAgLTk1LDcgKzk1LDggQEAgc3RhdGljIHZvaWQg
bXNtX2RldmZyZXFfaW5pdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1KQogCSAqLwogCiAJZ3B1LT5kZXZm
cmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgmZ3B1LT5wZGV2LT5kZXYsCi0J
CQkmbXNtX2RldmZyZXFfcHJvZmlsZSwgInNpbXBsZV9vbmRlbWFuZCIsIE5VTEwpOworCQkJJm1z
bV9kZXZmcmVxX3Byb2ZpbGUsIERFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORCwKKwkJCU5VTEwp
OwogCiAJaWYgKElTX0VSUihncHUtPmRldmZyZXEuZGV2ZnJlcSkpIHsKIAkJRFJNX0RFVl9FUlJP
UigmZ3B1LT5wZGV2LT5kZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IGRiNzk4
NTMuLmE3YzE4YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZy
ZXEuYwpAQCAtMTU3LDcgKzE1Nyw4IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJZGV2X3BtX29wcF9wdXQob3BwKTsKIAogCXBmZGV2
LT5kZXZmcmVxLmRldmZyZXEgPSBkZXZtX2RldmZyZXFfYWRkX2RldmljZSgmcGZkZXYtPnBkZXYt
PmRldiwKLQkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUsICJzaW1wbGVfb25kZW1hbmQiLCBO
VUxMKTsKKwkJCSZwYW5mcm9zdF9kZXZmcmVxX3Byb2ZpbGUsIERFVkZSRVFfR09WX1NJTVBMRV9P
TkRFTUFORCwKKwkJCU5VTEwpOwogCWlmIChJU19FUlIocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkp
IHsKIAkJRFJNX0RFVl9FUlJPUigmcGZkZXYtPnBkZXYtPmRldiwgIkNvdWxkbid0IGluaXRpYWxp
emUgR1BVIGRldmZyZXFcbiIpOwogCQlyZXQgPSBQVFJfRVJSKHBmZGV2LT5kZXZmcmVxLmRldmZy
ZXEpOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
