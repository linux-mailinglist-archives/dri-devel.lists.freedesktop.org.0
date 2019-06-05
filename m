Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66836CE7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28CE89722;
	Thu,  6 Jun 2019 07:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C067A8952F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 22:23:02 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 3/3] drm/panel: simple: Add GiantPlus GPM940B0 panel support
Date: Thu,  6 Jun 2019 00:22:47 +0200
Message-Id: <20190605222247.25657-3-paul@crapouillou.net>
In-Reply-To: <20190605222247.25657-1-paul@crapouillou.net>
References: <20190605222247.25657-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559773380; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec0iX6C9Cbbb2emN4/mdqLlTppIrtG6LOagZde1RzLM=;
 b=YOfxpYE/DJ+i+S7utlAgro38CuxdClMh1wkEE96NtjKlTp6Uwt2K4QyqQQzlfxhoWnoNjL
 wrhmsujZ4cwehaEam/pfYjP8EQo5nZnYR6e/yaYlDoBEewHL+iRWKd7AwLQd5IgLVWwLk7
 BhpNylMz6o2/1LsFJaREOQtf3iRHhDc=
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
Cc: devicetree@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdpYW50UGx1cyBHUE05NDBCMCBpcyBhIHNpbXBsZSAzLjAiIDMyMHgyNDAgMjQtYml0IFRG
VCBwYW5lbC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3Uu
bmV0PgpUZXN0ZWQtYnk6IEFydHVyIFJvamVrIDxjb250YWN0QGFydHVyLXJvamVrLmV1PgotLS0K
Ck5vdGVzOgogICAgdjI6IENoYW5nZSBidXMgZm9ybWF0IHRvIE1FRElBX0JVU19GTVRfUkdCODg4
XzNYOF9CRQogICAgCiAgICB2MzogTm8gY2hhbmdlCiAgICAKICAgIHY0OiBDaGFuZ2UgYnVzIGZv
cm1hdCB0byBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDgKICAgIAogICAgdjU6IE5vIGNoYW5nZQoK
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDI4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDVhOTNjNGVkZjFlNC4uZWVjOWE5ZWZjYzcz
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0xMzM1LDYgKzEzMzUsMzEg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGdpYW50cGx1c19ncGc0ODI3MzlxczUg
PSB7CiAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAogfTsKIAorc3Rh
dGljIGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBnaWFudHBsdXNfZ3BtOTQwYjBfdGltaW5n
ID0geworCS5waXhlbGNsb2NrID0geyAxMzUwMDAwMCwgMjcwMDAwMDAsIDI3NTAwMDAwIH0sCisJ
LmhhY3RpdmUgPSB7IDMyMCwgMzIwLCAzMjAgfSwKKwkuaGZyb250X3BvcmNoID0geyAxNCwgNjg2
LCA3MTggfSwKKwkuaGJhY2tfcG9yY2ggPSB7IDUwLCA3MCwgMjU1IH0sCisJLmhzeW5jX2xlbiA9
IHsgMSwgMSwgMSB9LAorCS52YWN0aXZlID0geyAyNDAsIDI0MCwgMjQwIH0sCisJLnZmcm9udF9w
b3JjaCA9IHsgMSwgMSwgMTc5IH0sCisJLnZiYWNrX3BvcmNoID0geyAxLCAyMSwgMzEgfSwKKwku
dnN5bmNfbGVuID0geyAxLCAxLCA2IH0sCisJLmZsYWdzID0gRElTUExBWV9GTEFHU19IU1lOQ19M
T1cgfCBESVNQTEFZX0ZMQUdTX1ZTWU5DX0xPVywKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGFuZWxfZGVzYyBnaWFudHBsdXNfZ3BtOTQwYjAgPSB7CisJLnRpbWluZ3MgPSAmZ2lhbnRwbHVz
X2dwbTk0MGIwX3RpbWluZywKKwkubnVtX3RpbWluZ3MgPSAxLAorCS5icGMgPSA4LAorCS5zaXpl
ID0geworCQkud2lkdGggPSA2MCwKKwkJLmhlaWdodCA9IDQ1LAorCX0sCisJLmJ1c19mb3JtYXQg
PSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDgsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19E
RV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfTkVHRURHRSwKK307CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgaGFubnN0YXJfaHNkMDcwcHd3MV90aW1pbmcgPSB7CiAJ
LnBpeGVsY2xvY2sgPSB7IDY0MzAwMDAwLCA3MTEwMDAwMCwgODIwMDAwMDAgfSwKIAkuaGFjdGl2
ZSA9IHsgMTI4MCwgMTI4MCwgMTI4MCB9LApAQCAtMjg4Miw2ICsyOTA3LDkgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9LCB7CiAJ
CS5jb21wYXRpYmxlID0gImdpYW50cGx1cyxncGc0ODI3MzlxczUiLAogCQkuZGF0YSA9ICZnaWFu
dHBsdXNfZ3BnNDgyNzM5cXM1CisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJnaWFudHBsdXMsZ3Bt
OTQwYjAiLAorCQkuZGF0YSA9ICZnaWFudHBsdXNfZ3BtOTQwYjAsCiAJfSwgewogCQkuY29tcGF0
aWJsZSA9ICJoYW5uc3Rhcixoc2QwNzBwd3cxIiwKIAkJLmRhdGEgPSAmaGFubnN0YXJfaHNkMDcw
cHd3MSwKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
