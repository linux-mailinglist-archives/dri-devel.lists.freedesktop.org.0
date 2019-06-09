Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85483AC42
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 00:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A05891D9;
	Sun,  9 Jun 2019 22:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAAF89190;
 Sun,  9 Jun 2019 22:08:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o13so6166882lji.5;
 Sun, 09 Jun 2019 15:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zktQ+UQ79HBZ24zZ/ONHzaythhaRsiPDKawSGpEHEjE=;
 b=fGeaJxk2Ti1f0Vam4db8C47q9VWgo2KVhTKDhXmH4Sdozx+SnKD9P12RnNkVMJOlbC
 CW3Yh2VJaIp6WEHKCpPCJaZENPsKM16sQvsPoyx/l5S+pZGy+F79eEUOIzNxH0KLuLfZ
 LvoGbRFzvokREO0isKlxSyqjMPTakecbINU/hvC4mE5XIHbg/y8yNNn6PtY0qvLg0UFK
 hldMlTSeKIETZNAnzAhS43GoMTZB+HdE11LAGJCgO0ZIgSIneDziX+QhqTDQVCzf2534
 vYBsaUkz0Xhar2SMY9ZjRkniH27kUK2oqV6R/xxJPWD7ZAuOnGNFSJlc46d8lglgsAny
 vWhw==
X-Gm-Message-State: APjAAAU/FuO2aymIXDNcUY09zDpRRb3h/jAJX/2iYFCKvu5slgSayDKP
 zAAQiZxfqmUhvhhe9eAw7sPh7vjpKK4=
X-Google-Smtp-Source: APXvYqzbvyCwenTeWRmgyy7lFwTRjmoE3GVv5RN1PYvRhmsbVpALdgI3SqO35k2FrTDDUMJVNI1F6Q==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr35051752ljj.168.1560118111859; 
 Sun, 09 Jun 2019 15:08:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v12sm225476ljk.22.2019.06.09.15.08.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 15:08:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 06/10] drm/amd: drop use of drmP.h from all header files
Date: Mon, 10 Jun 2019 00:07:53 +0200
Message-Id: <20190609220757.10862-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190609220757.10862-1-sam@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zktQ+UQ79HBZ24zZ/ONHzaythhaRsiPDKawSGpEHEjE=;
 b=fTjJ3VZdp3rsBjgFaapnulHVBFT/ZKmltOTxbkTM44UfP7cTmb7NEi7AzMSU7AULlT
 9oQQ9cSKsardOqes8QOYKLmAXls51A/Fv95I/zMgNu1FzAYegDxgWFJ6EmxtMBnOl5+W
 3mJiXnI0JWorDj/nJe88z4FUZjFeZHzwW4y44SefvTE2i7Cj50wH87+Q89A3MclZgkBZ
 PYGF3rDE6KBWjO7mVwaEqeD3L3qR4RYSwjW2Xs1qwhA5dC9q1V8BVE5nIbjOcnRls9O2
 b7nnmhVja1KRMBJmSaGAfVlyJU/ZS9/3I4EMyVEtMuDJS2Abz38pSyY+ys/+4iMQQjLM
 mU/Q==
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlIGZyb20KYWxsIGFt
ZCBoZWFkZXIgZmlsZXMuClRoaXMgbWFrZXMgaXQgYSBtb3JlIHNtb290aCBwcm9jZXNzIHRvIGdl
dCByaWQgb2YgZHJtUC5oCmluIHRoZSAuYyBmaWxlcy4KCkFkZGVkIGluY2x1ZGUgZmlsZXMgYW5k
IGZvcndhcmRzIGFzIGFwcHJvcHJpYXRlLgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNj
OiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQxLlpob3VAYW1kLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuaCAgICAg
ICAgIHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgg
ICAgICAgICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmggfCA1ICsrKystCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfc2NoZWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zY2hlZC5oCmlu
ZGV4IDJhMWEwYzczNGJkZC4uMTIyOTlmZDk1NjkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfc2NoZWQuaApAQCAtMjUsNyArMjUsMTAgQEAKICNpZm5kZWYgX19BTURHUFVf
U0NIRURfSF9fCiAjZGVmaW5lIF9fQU1ER1BVX1NDSEVEX0hfXwogCi0jaW5jbHVkZSA8ZHJtL2Ry
bVAuaD4KK2VudW0gZHJtX3NjaGVkX3ByaW9yaXR5OworCitzdHJ1Y3QgZHJtX2RldmljZTsKK3N0
cnVjdCBkcm1fZmlsZTsKIAogZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgYW1kZ3B1X3RvX3NjaGVk
X3ByaW9yaXR5KGludCBhbWRncHVfcHJpb3JpdHkpOwogaW50IGFtZGdwdV9zY2hlZF9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHJhY2UuaAppbmRleCBkM2NhMjQyNGI1ZmUuLjc3Njc0YTdiOTYxNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKQEAgLTI4LDggKzI4LDYg
QEAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQu
aD4KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Ci0KICN1bmRlZiBUUkFDRV9TWVNURU0KICNkZWZp
bmUgVFJBQ0VfU1lTVEVNIGFtZGdwdQogI2RlZmluZSBUUkFDRV9JTkNMVURFX0ZJTEUgYW1kZ3B1
X3RyYWNlCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uaAppbmRleCA5NzhmZjE0YTdkNDUuLjI0ODVkODQyNmU1ZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCkBAIC0yNiw4ICsy
NiwxMSBAQAogI2lmbmRlZiBfX0FNREdQVV9ETV9IX18KICNkZWZpbmUgX19BTURHUFVfRE1fSF9f
CiAKLSNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+Cisj
aW5jbHVkZSA8ZHJtL2RybV9jb25uZWN0b3IuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4K
KyNpbmNsdWRlIDxkcm0vZHJtX2RwX21zdF9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3Bs
YW5lLmg+CiAKIC8qCiAgKiBUaGlzIGZpbGUgY29udGFpbnMgdGhlIGRlZmluaXRpb24gZm9yIGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
