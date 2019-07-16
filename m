Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7656A259
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 08:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F6C6E0AE;
	Tue, 16 Jul 2019 06:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6988F6E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 06:45:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so18764780ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 23:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3aLy+sLkd878hI0e68qPAv+UAsAwEduUsrDn+6PipWE=;
 b=Nv/fv5wQdc8rx6lwbJiSwaqkMliiUK79OZUxR6kMGv+iv9x08Ie0RMtbc3VQrkHpNE
 tadOWMNyG3titepqn89pgxZ+yNTHij4MOPoTu0pGM74+kte7f6CMzoVMCsICcT1NdQE5
 bqxck/OBuukx7TLF6AD0KVRB1GcK/flFIauY0vzmCRinwoSgmVjmOHC0it3cyZwEhQqL
 v2Lh3XcF1DrmZu/sI8U8SwluNO5XK4hcyhkEGo9avQBQrsLCsco6sC6P2Vups3blXxjH
 UUQWTBdRU4Ncq8N+kp5k3nyX+dWH9s4pKCvz5zh2SkhpAiTWPNChgdTiHd/by9XitjgD
 LzLw==
X-Gm-Message-State: APjAAAWps9+MN8b1uMEb50FWOYC89/rjsLxvc18vOpZ07Qj5/IS0C842
 2Pqmp+5EI1Fah3+S2blNqPMql5+nLOxoJg==
X-Google-Smtp-Source: APXvYqwDY87O446RsZttrV+kCuWK4Ptm+Qt1CKQIYZjtGKNejv0Z5/L8rZZYCgEn50TdsPcwGe0t6A==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr16199525ljg.198.1563259498584; 
 Mon, 15 Jul 2019 23:44:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 27sm3529993ljw.97.2019.07.15.23.44.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 23:44:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/19] drm/i810: drop use of drmP.h
Date: Tue, 16 Jul 2019 08:42:14 +0200
Message-Id: <20190716064220.18157-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716064220.18157-1-sam@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3aLy+sLkd878hI0e68qPAv+UAsAwEduUsrDn+6PipWE=;
 b=vAG1HCalAubUhCn422YRDZ86JLZrrTq5JjxPc0469LSVD2varjp06w7qCSNO3LfUyQ
 qoB8HtBkHf1VBMCw3RbPc/u+m2mqZ7M6u5NPrglPjp/OIlMihutTGsJ4W/bX3gJRMdyf
 Ng+sEuUMvDExQvHBXq7cNWAols71pLTBnmuTTbaYUB3cl9nH0mDJid18stFEjsG2zsSE
 YsPu2u/jW4H2HB7WAQX2ZO8R+y7zYi51BzfC3/EUXVh5+sIgOU7mzTYwpyR51/mRt98s
 4clAnvUdLahECRaQrIIOLMeirAqepLV3BqAG8qff0T2JWSaxDRPUtIRF6xnNGAPmPsry
 ZFMg==
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlci4KUmVwbGFjZSB3aXRoIG5l
Y2Vzc2FyeSBpbmNsdWRlcy4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNs
ZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYyB8IDE3ICsrKysrKysr
KysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jIHwgIDggKysrKystLS0K
IGRyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmggfCAgMiArKwogMyBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pODEwL2k4MTBfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5j
CmluZGV4IDNiMzc4OTM2ZjU3NS4uMmE3NzgyM2I4ZTlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTgxMC9pODEwX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1h
LmMKQEAgLTMwLDEzICszMCwyMCBAQAogICoKICAqLwogCi0jaW5jbHVkZSA8ZHJtL2RybVAuaD4K
KyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgorI2luY2x1ZGUgPGxpbnV4L21tYW4uaD4KKworI2lu
Y2x1ZGUgPGRybS9kcm1fYWdwc3VwcG9ydC5oPgorI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+
CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KKyNp
bmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KKyNpbmNs
dWRlIDxkcm0vZHJtX3BjaS5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRl
IDxkcm0vaTgxMF9kcm0uaD4KKwogI2luY2x1ZGUgImk4MTBfZHJ2LmgiCi0jaW5jbHVkZSA8bGlu
dXgvaW50ZXJydXB0Lmg+CS8qIEZvciB0YXNrIHF1ZXVlIHN1cHBvcnQgKi8KLSNpbmNsdWRlIDxs
aW51eC9kZWxheS5oPgotI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KLSNpbmNsdWRlIDxsaW51eC9w
YWdlbWFwLmg+CiAKICNkZWZpbmUgSTgxMF9CVUZfRlJFRQkJMgogI2RlZmluZSBJODEwX0JVRl9D
TElFTlQJCTEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jCmluZGV4IGM2OWQ1YzQ4N2Y1MS4uNWRkMjZh
MDZlZTBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2Rydi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmMKQEAgLTMwLDEzICszMCwxNSBAQAogICog
ICAgR2FyZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgogICovCiAKKyNpbmNsdWRlICJp
ODEwX2Rydi5oIgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogCi0jaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
PgorI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4K
ICNpbmNsdWRlIDxkcm0vaTgxMF9kcm0uaD4KLSNpbmNsdWRlICJpODEwX2Rydi5oIgogCi0jaW5j
bHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KIAogc3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBj
aWlkbGlzdFtdID0gewogCWk4MTBfUENJX0lEUwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k4MTAvaTgxMF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZHJ2LmgKaW5kZXgg
YzczZDJmMmRhNTdiLi45ZGYzOTgxZmZjNjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
ODEwL2k4MTBfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kcnYuaApAQCAt
MzIsNyArMzIsOSBAQAogI2lmbmRlZiBfSTgxMF9EUlZfSF8KICNkZWZpbmUgX0k4MTBfRFJWX0hf
CiAKKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3ku
aD4KKyNpbmNsdWRlIDxkcm0vaTgxMF9kcm0uaD4KIAogLyogR2VuZXJhbCBjdXN0b21pemF0aW9u
OgogICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
