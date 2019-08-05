Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277638148B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223A56E317;
	Mon,  5 Aug 2019 08:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5A6E30D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:01 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p197so57256619lfa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 01:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Mpu+9BXQBz6K5v4fBeKDx2nimOndUlvbI5LeRRJJ8w=;
 b=bckMXxj1ueXKaRMlunf7ymLYudMZRFeQzF/Qym7oPlF9gmGAb8TkU3SptfjvT3o7+Z
 +K1F5w5kbvTlLMh77dOJ/1gqMhaxOOhepf92ryj3ogPduP3ugcDzbJyGNZfcIdk4cBWI
 o5sYJVbXM8bvaJ67SNN6kb1uH1AS2H/RPtTEgPEQYJ/MArijm4KLLmvFP+b3YBWUX1Rc
 lU5mwXClhQp/J6npkU0wLKEtL4Q+XwQQo34TnCpJIcJFGkJR8CZ5zIxPxPD7A8M0BPmP
 5zrc7VxdEKDohyfMDgyMouKJsMFIYTY3YCeBJmfCqpttc9la1tLfY6VNhvqZWWpW6l+S
 pXZA==
X-Gm-Message-State: APjAAAVnUIhvryZFC5DkvddWYW4n9c3PbZa3ACrowj54l1ZKOC5uO3XL
 KD2ba+yGV992lx/gS01HTzhvHA==
X-Google-Smtp-Source: APXvYqzgQX6QSvc8gNUWxCb0D3TS6ENYK1ZH8OpjA5RX1MHD4c88CWPDVZhINA2GGzpXkZtBVyi6/w==
X-Received: by 2002:a19:f703:: with SMTP id z3mr15398029lfe.171.1564995540090; 
 Mon, 05 Aug 2019 01:59:00 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id b20sm234500lfc.17.2019.08.05.01.58.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 01:58:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 0/4 v2] PL111 DRM conversion of nspire
Date: Mon,  5 Aug 2019 10:58:43 +0200
Message-Id: <20190805085847.25554-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Mpu+9BXQBz6K5v4fBeKDx2nimOndUlvbI5LeRRJJ8w=;
 b=ubWWTLCzqcirJay0D9GAVci3gf5pepENlv2D0l2p4vZJbe4D7/w7hQMQFHkV5J49vS
 qGgBEKsennpq+/NO8pidoUeiWpW7ReJxgmMDRjVohc9DEUL6dR4iPPDMz3D2N45VDJ7k
 suSQNm4VqfuenWOWU/PUhGPf1l0KTr61H4dX+S8Zwy0X0OQcOCj4ga3k92Kb06glM/9/
 RFApqKc2vg44g48T3lkn6gvCIkccgtcJuDGNUpU5lPw0EHDsGOVN0o+se8B/mnE+xdLU
 xeW2SKibS/UKMK58z/crFtP/tjusCExRIKLp2DyUE5VwoTyBmVBdnaskOtZIgADHljd+
 M4pw==
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBub3cgd29ya3MsIEkgdGhpbmsuCgpTbyB0aGlzIGlzIGEgY29sZC1jb2RlZCBhdHRlbXB0
IHRvIG1vdmUgdGhlIFRJIG5zcGlyZSBvdmVyIHRvCnVzaW5nIERSTS4gSXQgaXMgbW9yZSBvciBs
ZXNzIHRoZSBsYXN0IHVzZXIgb2YgdGhlIG9sZCBmYmRldgpkcml2ZXIgc28gaXQgaXMgYSBub2Js
ZSBjYXVzZSBhbmQgaW50ZXJlc3RpbmcgdXNlY2FzZS4KClRoaXMgY2FuIGJlIGFwcGxpZWQgb24g
dG9wIG9mIGEgdmFuaWxsYSBUb3J2YWxkcyB2NS4zLXJjMQprZXJuZWwgb3V0IHNpbmNlIHN1bmRh
eS4KCkkgZG8gbm90IGV4cGVjdCB0aGVzZSBwYXRjaGVzIHRvICJqdXN0IHdvcmsiLCBJIGV4cGVj
dCB0aGVtIHRvCm5lZWQgc29tZSBoYWNraW5nLCBzbyBzb21lb25lIHdobyBpcyBhY3R1YWxseSB3
b3JraW5nIG9uIHRoZQpoYXJkd2FyZSB3aWxsIG5lZWQgdG8gc3RlcCBpbiBhbmQgZml4IGl0IHVw
LgoKSXQgZG9lcyBvdXRsaW5lIHRoZSBvdmVyYWxsIGlkZWEgb2YgaG93IHRvIGRvIHRoaXMuCgpJ
IGZvdW5kIG5vIGRlZmNvbmZpZyBmb3IgbnNwaXJlIGluIHRoZSBrZXJuZWwgc28gSSB1c2VkCkFS
TXY0dCBtdWx0aS4KCkNvbmZpZ3VyaW5nIHRoZSBkcml2ZXIgZm9yIG5zcGlyZToKCi0gRGlzYWJs
ZSBDT05GSUdfRkJfQVJNQ0xDRAotIEVuYWJsZSBDT05GSUdfRFJNX1BMMTExLCBDT05GSUdfRFJN
X1BBTkVMX1NJTVBMRQoKVGhlIEFSTSBwYXRjaCB3aWxsIGJlIG1lcmdlZCBzZXBhcmF0ZWx5IHRo
cm91Z2ggQVJNIFNvQy4KCkxpbnVzIFdhbGxlaWogKDQpOgogIGRybS9wbDExMTogU3VwcG9ydCBn
cmF5c2NhbGUKICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIFRJIG5zcGlyZSBwYW5lbCBiaW5kaW5n
cwogIGRybS9wYW5lbDogc2ltcGxlOiBTdXBwb3J0IFRJIG5zcGlyZSBwYW5lbHMKICBBUk06IG5z
cGlyZTogTW92ZSBDTENEIHNldC11cCB0byBkZXZpY2UgdHJlZQoKIC4uLi9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sICAgICB8ICAzNiArKysrKysKIGFyY2gvYXJtL2Jvb3Qv
ZHRzL25zcGlyZS1jbGFzc2ljLmR0c2kgICAgICAgICB8ICAxOSArKy0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL25zcGlyZS1jeC5kdHMgICAgICAgICAgICAgICB8ICAxOCArKy0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL25zcGlyZS5kdHNpICAgICAgICAgICAgICAgICB8ICAxMCArLQogYXJjaC9hcm0vbWFjaC1u
c3BpcmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxIC0KIGFyY2gvYXJtL21hY2gtbnNw
aXJlL2NsY2QuYyAgICAgICAgICAgICAgICAgICB8IDExNCAtLS0tLS0tLS0tLS0tLS0tLS0KIGFy
Y2gvYXJtL21hY2gtbnNwaXJlL2NsY2QuaCAgICAgICAgICAgICAgICAgICB8ICAxMCAtLQogYXJj
aC9hcm0vbWFjaC1uc3BpcmUvbnNwaXJlLmMgICAgICAgICAgICAgICAgIHwgIDI1IC0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8ICA2NCArKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZGlzcGxheS5jICAgICAgICAgfCAgMjkg
KysrKy0KIGluY2x1ZGUvbGludXgvYW1iYS9jbGNkLXJlZ3MuaCAgICAgICAgICAgICAgICB8ICAg
MSArCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgMTU2IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3RpLG5zcGlyZS55YW1sCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0v
bWFjaC1uc3BpcmUvY2xjZC5jCiBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1uc3Bp
cmUvY2xjZC5oCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
