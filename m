Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627C71971
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20756E28A;
	Tue, 23 Jul 2019 13:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D806E228
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:38:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so41090735ljg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WIz4398NalYoE1dkIhu0zv1BVloq81pBzlO+qRIk2I=;
 b=dY0z3i5hJrcy2gtAuo1wMA49TfAmQogglkE5odE0lJ6nerVYMtzhMc2F4omd9+EOa6
 opcFPk5RSH7pKjlQWU2EqjRZhmDJqU2UKXxXVriEyTNajuqT/3feFY4sU3h8gcnWoJgc
 ks97jgtIjj/pW2jHfxMlN4tNWGWWZm+i0ESVrFRx0xNNg2xWKNwNdUtAZMHeHLt6x6uJ
 cgK97ldht5/WLisfNOqfD5KyCEf++bE/puFIq3XgAqxUa5GgEgxpHn2OV3w0LxNMvzTj
 JvEnajWPYEjbVbwm4T4SdRbmjuAocXT3a66MZtdabV4NvtA1WCm77wGibwzQ/s5FFkAJ
 ccsA==
X-Gm-Message-State: APjAAAXbnI+kLQnI0TEDjCWfKZmMBZGRoErB+BKU2/TX8MtW3MgGkSYo
 cCtOTiptkX0Wo8V8MKAUQ/fmhLPyiOM=
X-Google-Smtp-Source: APXvYqz/2Y2BXw9Lr9zrIFx/PaE0rfUE7HpKmwIOHcpKt2QoC8yNgr5Nx1MWD1rKCScVSXzxuBjWSw==
X-Received: by 2002:a2e:89d0:: with SMTP id c16mr38667121ljk.219.1563889086687; 
 Tue, 23 Jul 2019 06:38:06 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id l24sm8069411lji.78.2019.07.23.06.38.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 06:38:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 2/3] RTF: drm/panel: simple: Add TI nspire panels
Date: Tue, 23 Jul 2019 15:37:54 +0200
Message-Id: <20190723133755.22677-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190723133755.22677-1-linus.walleij@linaro.org>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WIz4398NalYoE1dkIhu0zv1BVloq81pBzlO+qRIk2I=;
 b=OuhS0VSszSa/G+X8Vg8wOX4jN8ZWDZS3HVget6W39BC0v6+nDLYNJ/IDrryN+4galP
 +LkZx4gw2vFzAHOuHz0XjiUHQV4UuFrYsPtsbQaAySmaNwqImGY8tYZIhAe4niKTC2Ja
 h1bGtbWp6EobD7I1no/m/iXS2qreA0g/ulZHFm6vhBJU+1jLVzEFFpbsssimk4DQEP3u
 +Oq3lV/DRdwM/3ABEguM0ZOB9oNgo3RKUKtyRgRGUu8RZYCA1hGMNeDL4YP2pAtXNIie
 VedCUoWMNl9E1LyRy9RH/I2hNhkfiXCC+HHLFHR86yN6NB7cijvL/l4GimVJsD2hR0w8
 nf9Q==
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

VGhpcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUSSBuc3BpcmUgcGFuZWxzIHRvIHRoZSBzaW1wbGUg
cGFuZWwKcm9zdGVyLiBUaGlzIGNvZGUgaXMgYmFzZWQgb24gYXJjaC9hcm0vbWFjaC1uc3BpcmUv
Y2xjZC5jLgpUaGlzIGluY2x1ZGVzIGxpa2VseSB0aGUgZmlyc3QgZ3JheXNjYWxlIHBhbmVsIHN1
cHBvcnRlZC4KClRoZXNlIHBhbmVscyB3aWxsIGJlIHVzZWQgd2l0aCB0aGUgUEwxMXggRFJNIGRy
aXZlci4KCkNjOiBEYW5pZWwgVGFuZyA8ZHQudGFuZ3JAZ21haWwuY29tPgpDYzogRmFiaWFuIFZv
Z3QgPGZhYmlhbkByaXR0ZXItdm9ndC5kZT4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmlu
ZGV4IDVhOTNjNGVkZjFlNC4uZTVjZmUxMzk4YTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jCkBAIC0yNzYxLDYgKzI3NjEsNjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5l
bF9kZXNjIGFybV9ydHNtID0gewogCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MVgyNCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBuc3BpcmVf
Y3hfbGNkX21vZGVbXSA9IHsKKwl7CisJCS5jbG9jayA9IDEwMDAsCisJCS5oZGlzcGxheSA9IDMy
MCwKKwkJLmhzeW5jX3N0YXJ0ID0gMzIwICsgNTAsCisJCS5oc3luY19lbmQgPSAzMjAgKyA1MCAr
IDYsCisJCS5odG90YWwgPSAzMjAgKyA1MCArIDYgKyAzOCwKKwkJLnZkaXNwbGF5ID0gMjQwLAor
CQkudnN5bmNfc3RhcnQgPSAyNDAgKyAzLAorCQkudnN5bmNfZW5kID0gMjQwICsgMyArIDEsCisJ
CS52dG90YWwgPSAyNDAgKyAzICsgMSArIDE3LAorCQkudnJlZnJlc2ggPSA2MCwKKwkJLmZsYWdz
ID0gRFJNX01PREVfRkxBR19OVlNZTkMgfCBEUk1fTU9ERV9GTEFHX05IU1lOQywKKwl9LAorfTsK
Kworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIG5zcGlyZV9jeF9sY2RfcGFuZWwgPSB7
CisJLm1vZGVzID0gbnNwaXJlX2N4X2xjZF9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5icGMg
PSA4LAorCS5zaXplID0geworCQkud2lkdGggPSA2NSwKKwkJLmhlaWdodCA9IDQ5LAorCX0sCisJ
LmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAorCS5idXNfZmxhZ3MgPSBE
Uk1fQlVTX0ZMQUdfUElYREFUQV9ORUdFREdFLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlIG5zcGlyZV9jbGFzc2ljX2xjZF9tb2RlW10gPSB7CisJeworCQkuY2xv
Y2sgPSAxMDAwLAorCQkuaGRpc3BsYXkgPSAzMjAsCisJCS5oc3luY19zdGFydCA9IDMyMCArIDYs
CisJCS5oc3luY19lbmQgPSAzMjAgKyA2ICsgNiwKKwkJLmh0b3RhbCA9IDMyMCArIDYgKyA2ICsg
NiwKKwkJLnZkaXNwbGF5ID0gMjQwLAorCQkudnN5bmNfc3RhcnQgPSAyNDAgKyAwLAorCQkudnN5
bmNfZW5kID0gMjQwICsgMCArIDEsCisJCS52dG90YWwgPSAyNDAgKyAwICsgMSArIDAsCisJCS52
cmVmcmVzaCA9IDYwLAorCQkuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX1BIU1lOQyB8IERSTV9NT0RF
X0ZMQUdfUFZTWU5DLAorCX0sCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mg
bnNwaXJlX2NsYXNzaWNfbGNkX3BhbmVsID0geworCS5tb2RlcyA9IG5zcGlyZV9jbGFzc2ljX2xj
ZF9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS8qIFRoZSBncmF5c2NhbGUgcGFuZWwgaGFzIDgg
Yml0IGZvciB0aGUgY29sb3IgLi4gWSAoYmxhY2spICovCisJLmJwYyA9IDgsCisJLnNpemUgPSB7
CisJCS53aWR0aCA9IDcxLAorCQkuaGVpZ2h0ID0gNTMsCisJfSwKKwkvKiBUaGlzIGlzIHRoZSBn
cmF5c2NhbGUgYnVzIGZvcm1hdCAqLworCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9ZOF8x
WDgsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9t
YXRjaFtdID0gewogCXsKIAkJLmNvbXBhdGlibGUgPSAiYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10
MDFoIiwKQEAgLTI5NjYsNiArMzAyMywxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAibmx0
LG5sMTkyMTA4YWMxOC0wMmQiLAogCQkuZGF0YSA9ICZubHRfbmwxOTIxMDhhYzE4XzAyZCwKKwl9
LCB7CisJCS5jb21wYXRpYmxlID0gInRpLG5zcGlyZS1jeC1sY2QtcGFuZWwiLAorCQkuZGF0YSA9
ICZuc3BpcmVfY3hfbGNkX3BhbmVsLAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAidGksbnNwaXJl
LWNsYXNzaWMtbGNkLXBhbmVsIiwKKwkJLmRhdGEgPSAmbnNwaXJlX2NsYXNzaWNfbGNkX3BhbmVs
LAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAibnZkLDkxMjgiLAogCQkuZGF0YSA9ICZudmRfOTEy
OCwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
