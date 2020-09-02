Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6D25A95A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 12:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3D6E2B8;
	Wed,  2 Sep 2020 10:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27CE6E2B8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 10:24:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e16so4647172wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dohIQ5UyzZkaEYR+AwQGwtwpkxkjmspAuCqUfN2fWCY=;
 b=UbeWCMpW6uL7pqcGDjqZAlo2WnRVPB8DcEbjjuSYHE62cvjCtLyscx1kWpXa0DJTkr
 7Q4OzXsJg2dT1D7xFOxxnw9y5NGtz8MkCD3AXqye0+ANMmfL7lUWz5VWd+UtiqFk8c+2
 N7GByQQs6IZeu2SUz8/XYB98zsH/qUyWptHA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dohIQ5UyzZkaEYR+AwQGwtwpkxkjmspAuCqUfN2fWCY=;
 b=U71wej1p0vUk594ftroDYi0l3hyT7NpUL4Z9kSE2jCLnEJpMKmNg/F/VKbvj/C8w+S
 1X8uN0y/jg/ZwBRdEAUNaP/7kX9m8nuWRqWX+heg45yHOjZUaadN9d5bNifaxKPSkX0B
 PXyGuvDVnzGdoVqE/rxhxvLRV7h4kK8q4K8n4i+TXYfJWdeCoVwbwhGg59SlFEMrvMr6
 OetE6rPPNxYZQlcNjLD9BRUMea6R1rWdsdrVDvw6xAeg5xlb3nn4jgx1NzbCM4fwboBh
 S4iMhaOGDHt7hD0zIaDWngH/AIjfF6bLkGP9SAJS9PBu9DPHJYrQQcO/cMjdEcL2kzR0
 leHA==
X-Gm-Message-State: AOAM533MIKV4KAaNgP4QalkkeIx1Zh7PE+xzzbKHv79ZqEqJSTXYzMh6
 X6FLXtzBHjekAmQRPyTYOCSNAikpH6vSI0hf
X-Google-Smtp-Source: ABdhPJxZPQLtsUfZzZiQU2c6l+hctqh63Azks0gZkzfctn/GlMjRdSmBbTDK2/Od5x5aS1T26FT9DA==
X-Received: by 2002:adf:c981:: with SMTP id f1mr6429105wrh.14.1599042286053;
 Wed, 02 Sep 2020 03:24:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm5546768wmj.38.2020.09.02.03.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 03:24:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Document that modifiers are always required for fb
Date: Wed,  2 Sep 2020 12:24:40 +0200
Message-Id: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlbiBmb3IgbGVnYWN5IHVzZXJzcGFjZSwgc2luY2Ugb3RoZXJ3aXNlIEdFVEZCMiBpcyBicm9r
ZW4gYW5kIGlmIHlvdQpzd2l0Y2ggYmV0d2VlbiBtb2RpZmllci1sZXNzIGFuZCBtb2RpZmllci1h
d2FyZSBjb21wb3NpdG9ycywgc21vb3RoCnRyYW5zaXRpb25zIGJyZWFrLgoKQWxzbyBpdCdzIGp1
c3QgYmVzdCBwcmFjdGljZSB0byBtYWtlIHN1cmUgbW9kaWZpZXJzIGFyZSBpbnZhcmlhbnQgZm9y
CmEgZ2l2ZW4gZHJtX2ZiLCBhbmQgdGhhdCBhIG1vZGlmaWVyLWF3YXJlIGttcyBkcml2ZXJzIG9u
bHkgaGFzIG9uZQpwbGFjZSB0byBzdG9yZSB0aGVtLCBpZ25vcmluZyBhbnkgb2xkIGltcGxpY2l0
IGJvIGZsYWdzIG9yIHdoYXRldmVyCmVsc2UgbWlnaHQgZmxvYXQgYXJvdW5kLgoKTW90aXZhdGVk
IGJ5IHNvbWUgaXJjIGRpc2N1c3Npb24gd2l0aCBCYXMgYWJvdXQgYW1kZ3B1IG1vZGlmaWVyCnN1
cHBvcnQuCgpGaXhlczogNDU1ZTAwZjE0MTJmICgiZHJtOiBBZGQgZ2V0ZmIyIGlvY3RsIikKQ2M6
IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgpDYzogSnVzdG9uIExpIDxqdXN0
b24ubGlAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNj
OiBCYXMgTmlldXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+CkNjOiBNYXJlayBP
bMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPgpDYzogIldlbnRsYW5kLCBIYXJyeSIgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIHwgMTMgKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2Nv
bmZpZy5oCmluZGV4IGExOGY3M2ViM2NmNi4uNWZmYmI0ZWQ1YjM1IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25m
aWcuaApAQCAtNTgsNiArNTgsMTIgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB7CiAJ
ICogYWN0dWFsIG1vZGlmaWVyIHVzZWQgaWYgdGhlIHJlcXVlc3QgZG9lc24ndCBoYXZlIGl0IHNw
ZWNpZmllZCwKIAkgKiBpZS4gd2hlbiAoQG1vZGVfY21kLT5mbGFncyAmIERSTV9NT0RFX0ZCX01P
RElGSUVSUykgPT0gMC4KIAkgKgorCSAqIElNUE9SVEFOVDogVGhlc2UgaW1wbGllZCBtb2RpZmll
cnMgZm9yIGxlZ2FjeSB1c2Vyc3BhY2UgbXVzdCBiZQorCSAqIHN0b3JlZCBpbiBzdHJ1Y3QgJmRy
bV9mcmFtZWJ1ZmZlciwgaW5jbHVkaW5nIGFsbCByZWxldmFudCBtZXRhZGF0YQorCSAqIGxpa2Ug
JmRybV9mcmFtZWJ1ZmZlci5waXRjaGVzIGFuZCAmZHJtX2ZyYW1lYnVmZmVyLm9mZnNldHMgaWYg
dGhlCisJICogbW9kaWZpZXIgZW5hYmxlcyBhZGRpdGlvbmFsIHBsYW5lcyBiZXlvbmQgdGhlIGZv
dXJjYyBwaXhlbCBmb3JtYXQKKwkgKiBjb2RlLiBUaGlzIGlzIHJlcXVpcmVkIGJ5IHRoZSBHRVRG
QjIgaW9jdGwuCisJICoKIAkgKiBJZiB0aGUgcGFyYW1ldGVycyBhcmUgZGVlbWVkIHZhbGlkIGFu
ZCB0aGUgYmFja2luZyBzdG9yYWdlIG9iamVjdHMgaW4KIAkgKiB0aGUgdW5kZXJseWluZyBtZW1v
cnkgbWFuYWdlciBhbGwgZXhpc3QsIHRoZW4gdGhlIGRyaXZlciBhbGxvY2F0ZXMKIAkgKiBhIG5l
dyAmZHJtX2ZyYW1lYnVmZmVyIHN0cnVjdHVyZSwgc3ViY2xhc3NlZCB0byBjb250YWluCkBAIC05
MTUsNiArOTIxLDEzIEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWcgewogCSAqIEBhbGxvd19mYl9t
b2RpZmllcnM6CiAJICoKIAkgKiBXaGV0aGVyIHRoZSBkcml2ZXIgc3VwcG9ydHMgZmIgbW9kaWZp
ZXJzIGluIHRoZSBBRERGQjIuMSBpb2N0bCBjYWxsLgorCSAqCisJICogSU1QT1JUQU5UOgorCSAq
CisJICogSWYgdGhpcyBpcyBzZXQgdGhlIGRyaXZlciBtdXN0IGZpbGwgb3V0IHRoZSBmdWxsIGlt
cGxpY2l0IG1vZGlmaWVyCisJICogaW5mb3JtYXRpb24gaW4gdGhlaXIgJmRybV9tb2RlX2NvbmZp
Z19mdW5jcy5mYl9jcmVhdGUgaG9vayBmb3IgbGVnYWN5CisJICogdXNlcnNwYWNlIHdoaWNoIGRv
ZXMgbm90IHNldCBtb2RpZmllcnMuIE90aGVyd2lzZSB0aGUgR0VURkIyIGlvY3RsIGlzCisJICog
YnJva2VuIGZvciBtb2RpZmllciBhd2FyZSB1c2Vyc3BhY2UuCiAJICovCiAJYm9vbCBhbGxvd19m
Yl9tb2RpZmllcnM7CiAKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
