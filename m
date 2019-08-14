Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D38E058
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5437A6E863;
	Wed, 14 Aug 2019 22:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CD86E863
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 22:07:45 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b24so200762pfp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm+XMGdKo1qLDwMEPJoOd+67atBUmC1hzfZly9LEwV0=;
 b=P/txSN1lgBgiUUvxaWPB/fOLl1Cb8Jxa/bd2b5hXM6v0A6Uvo+nNZdj4LOpROGs2pq
 GwXO24DUzc8oQFDUUwcOV/dtVETFjxcqaw3Ohl66/9K+kXFmEdHBATSoXYPFyW90viRx
 8djydNPHOYi1WfmqBP/R+hysEZHTU6ijFLHCgB9Up1vf8vKROc455wy8eyCtEZEmvMpl
 90BBPC3RO54hksCJMksuioch/vsB6WGXMsuBxifoWG70JGnY9mDOYtr9FCc+YM3kwujM
 bIdUn6M1gOqevBVMd/rVkRSXnlqkNXh1TcpMq+seC6//yK8fcwt+sTVr0uYmUQpaca4A
 h5/A==
X-Gm-Message-State: APjAAAWcuXeOD2gfHzjrZ388/5gybExJhAa2Lsdns8UqgpKIInR/KEB3
 /UKyWmbbbibgBptkCtqRUZMGAyIa8t3JXQ==
X-Google-Smtp-Source: APXvYqxEANCpUtYQ+5OhPEAzs37rqT2wBBhN570Sw5KrEeNXbOBWwWt7Xo763dhxGWxso/PvNN7UjA==
X-Received: by 2002:a17:90a:eb05:: with SMTP id j5mr87119pjz.102.1565820464819; 
 Wed, 14 Aug 2019 15:07:44 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id i9sm659836pgo.46.2019.08.14.15.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:07:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] mips: export arch_sync_dma_for_*()
Date: Wed, 14 Aug 2019 14:59:57 -0700
Message-Id: <20190814220011.26934-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm+XMGdKo1qLDwMEPJoOd+67atBUmC1hzfZly9LEwV0=;
 b=sgPCxVPDpH9l2X4SPUlx10kZFVi9IyEGQZCYZYSp7q2+1HYZUvT2BP02kXdHCDxuQe
 ovLGoEDRejVtZkJFak27XXUav3OaPEikhGNchX4l2i6fwcPxTxbG+IuniEBAnuJs1Wnn
 vE3XrY4NLX8lQ0cXESW4Dhc9SO9SwnUyFax0vMAwqj1rzBIWXFt0FeSvTdRUc4l3NpvN
 jX3+ZqLSgrLGCWOssPanOkD0fstz6U6ag9S/JUBDg1jCWNYg1kaWU8QYMgT+SvMMzzb2
 dX82zkunQSsga8PbpkqwG1h5iYhdx/yxUvNXdd7H192iWYxzh/ZNrGhBHqmcDohBWF4H
 +wGg==
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Paul Burton <paul.burton@mips.com>, linux-arm-kernel@lists.infradead.org,
 James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvYXJtNjQvbW0vZmx1
c2guYyAgICAgICAgICB8ICAyICsrCiBhcmNoL21pcHMvbW0vZG1hLW5vbmNvaGVyZW50LmMgfCAg
MiArKwogZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jICAgIHwgMjAgKysrKysrKysrKysrKysr
KystLS0KIGluY2x1ZGUvZHJtL2RybV9jYWNoZS5oICAgICAgICB8ICA0ICsrKysKIDQgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L21tL2ZsdXNoLmMgYi9hcmNoL2FybTY0L21tL2ZsdXNoLmMKaW5kZXggZGMxOTMw
MDMwOWQyLi5mMGViNjMyMGM5NzkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvbW0vZmx1c2guYwor
KysgYi9hcmNoL2FybTY0L21tL2ZsdXNoLmMKQEAgLTkzLDMgKzkzLDUgQEAgdm9pZCBhcmNoX2lu
dmFsaWRhdGVfcG1lbSh2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSkKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKGFyY2hfaW52YWxpZGF0ZV9wbWVtKTsKICNlbmRpZgorCitFWFBPUlRfU1lNQk9MX0dQTChf
X2ZsdXNoX2RjYWNoZV9hcmVhKTsKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9tbS9kbWEtbm9uY29o
ZXJlbnQuYyBiL2FyY2gvbWlwcy9tbS9kbWEtbm9uY29oZXJlbnQuYwppbmRleCBlZDU2YzZmYTdi
ZTIuLmJkNWRlYmUxYjQyMyAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL21tL2RtYS1ub25jb2hlcmVu
dC5jCisrKyBiL2FyY2gvbWlwcy9tbS9kbWEtbm9uY29oZXJlbnQuYwpAQCAtMTMxLDYgKzEzMSw3
IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgcGh5
c19hZGRyX3QgcGFkZHIsCiB7CiAJZG1hX3N5bmNfcGh5cyhwYWRkciwgc2l6ZSwgZGlyKTsKIH0K
K0VYUE9SVF9TWU1CT0xfR1BMKGFyY2hfc3luY19kbWFfZm9yX2RldmljZSk7CiAKICNpZmRlZiBD
T05GSUdfQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVQogdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9j
cHUoc3RydWN0IGRldmljZSAqZGV2LCBwaHlzX2FkZHJfdCBwYWRkciwKQEAgLTEzOSw2ICsxNDAs
NyBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYsIHBoeXNf
YWRkcl90IHBhZGRyLAogCWlmIChjcHVfbmVlZHNfcG9zdF9kbWFfZmx1c2goZGV2KSkKIAkJZG1h
X3N5bmNfcGh5cyhwYWRkciwgc2l6ZSwgZGlyKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGFyY2hf
c3luY19kbWFfZm9yX2NwdSk7CiAjZW5kaWYKIAogdm9pZCBhcmNoX2RtYV9jYWNoZV9zeW5jKHN0
cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqdmFkZHIsIHNpemVfdCBzaXplLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5j
CmluZGV4IDNiZDc2ZTkxOGI1ZC4uOTAxMDVjNjM3Nzk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2NhY2hlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCkBAIC02
OSw2ICs2OSwxNCBAQCBzdGF0aWMgdm9pZCBkcm1fY2FjaGVfZmx1c2hfY2xmbHVzaChzdHJ1Y3Qg
cGFnZSAqcGFnZXNbXSwKIH0KICNlbmRpZgogCisjaWYgZGVmaW5lZChfX3Bvd2VycGNfXykKK3N0
YXRpYyB2b2lkIF9fZmx1c2hfZGNhY2hlX2FyZWEodm9pZCAqYWRkciwgc2l6ZV90IGxlbikKK3sK
KwlmbHVzaF9kY2FjaGVfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpYWRkciwKKwkJCSAgICh1bnNpZ25l
ZCBsb25nKWFkZHIgKyBQQUdFX1NJWkUpOworfQorI2VuZGlmCisKIC8qKgogICogZHJtX2NsZmx1
c2hfcGFnZXMgLSBGbHVzaCBkY2FjaGUgbGluZXMgb2YgYSBzZXQgb2YgcGFnZXMuCiAgKiBAcGFn
ZXM6IExpc3Qgb2YgcGFnZXMgdG8gYmUgZmx1c2hlZC4KQEAgLTkwLDcgKzk4LDcgQEAgZHJtX2Ns
Zmx1c2hfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVkIGxvbmcgbnVtX3BhZ2Vz
KQogCWlmICh3YmludmRfb25fYWxsX2NwdXMoKSkKIAkJcHJfZXJyKCJUaW1lZCBvdXQgd2FpdGlu
ZyBmb3IgY2FjaGUgZmx1c2hcbiIpOwogCi0jZWxpZiBkZWZpbmVkKF9fcG93ZXJwY19fKQorI2Vs
aWYgZGVmaW5lZChfX3Bvd2VycGNfXykgfHwgZGVmaW5lZChDT05GSUdfQVJNNjQpCiAJdW5zaWdu
ZWQgbG9uZyBpOwogCWZvciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykgewogCQlzdHJ1Y3Qg
cGFnZSAqcGFnZSA9IHBhZ2VzW2ldOwpAQCAtMTAwLDggKzEwOCw3IEBAIGRybV9jbGZsdXNoX3Bh
Z2VzKHN0cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBsb25nIG51bV9wYWdlcykKIAkJCWNv
bnRpbnVlOwogCiAJCXBhZ2VfdmlydHVhbCA9IGttYXBfYXRvbWljKHBhZ2UpOwotCQlmbHVzaF9k
Y2FjaGVfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpcGFnZV92aXJ0dWFsLAotCQkJCSAgICh1bnNpZ25l
ZCBsb25nKXBhZ2VfdmlydHVhbCArIFBBR0VfU0laRSk7CisJCV9fZmx1c2hfZGNhY2hlX2FyZWEo
cGFnZV92aXJ0dWFsLCBQQUdFX1NJWkUpOwogCQlrdW5tYXBfYXRvbWljKHBhZ2VfdmlydHVhbCk7
CiAJfQogI2Vsc2UKQEAgLTEzNSw2ICsxNDIsMTMgQEAgZHJtX2NsZmx1c2hfc2coc3RydWN0IHNn
X3RhYmxlICpzdCkKIAogCWlmICh3YmludmRfb25fYWxsX2NwdXMoKSkKIAkJcHJfZXJyKCJUaW1l
ZCBvdXQgd2FpdGluZyBmb3IgY2FjaGUgZmx1c2hcbiIpOworI2VsaWYgZGVmaW5lZChDT05GSUdf
QVJNNjQpCisJc3RydWN0IHNnX3BhZ2VfaXRlciBzZ19pdGVyOworCisJZm9yX2VhY2hfc2dfcGFn
ZShzdC0+c2dsLCAmc2dfaXRlciwgc3QtPm5lbnRzLCAwKSB7CisJCXN0cnVjdCBwYWdlICpwID0g
c2dfcGFnZV9pdGVyX3BhZ2UoJnNnX2l0ZXIpOworCQlkcm1fY2xmbHVzaF9wYWdlcygmcCwgMSk7
CisJfQogI2Vsc2UKIAlwcl9lcnIoIkFyY2hpdGVjdHVyZSBoYXMgbm8gZHJtX2NhY2hlLmMgc3Vw
cG9ydFxuIik7CiAJV0FSTl9PTl9PTkNFKDEpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2NhY2hlLmggYi9pbmNsdWRlL2RybS9kcm1fY2FjaGUuaAppbmRleCA5ODdmZjE2Yjk0MjAuLmY5
NGU3YmQzZWNhNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NhY2hlLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2NhY2hlLmgKQEAgLTQwLDYgKzQwLDEwIEBAIHZvaWQgZHJtX2NsZmx1c2hf
c2coc3RydWN0IHNnX3RhYmxlICpzdCk7CiB2b2lkIGRybV9jbGZsdXNoX3ZpcnRfcmFuZ2Uodm9p
ZCAqYWRkciwgdW5zaWduZWQgbG9uZyBsZW5ndGgpOwogYm9vbCBkcm1fbmVlZF9zd2lvdGxiKGlu
dCBkbWFfYml0cyk7CiAKKyNpZiBkZWZpbmVkKENPTkZJR19YODYpIHx8IGRlZmluZWQoX19wb3dl
cnBjX18pIHx8IGRlZmluZWQoQ09ORklHX0FSTTY0KQorI2RlZmluZSBIQVNfRFJNX0NBQ0hFIDEK
KyNlbmRpZgorCiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBkcm1fYXJjaF9jYW5fd2NfbWVtb3J5KHZv
aWQpCiB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
