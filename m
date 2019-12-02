Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC610F975
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73D6E416;
	Tue,  3 Dec 2019 08:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901156E218
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 15:41:52 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 3/3] drm/panel: simple: Add support for the Frida
 FRD350H54004 panel
Date: Mon,  2 Dec 2019 16:41:23 +0100
Message-Id: <20191202154123.64139-3-paul@crapouillou.net>
In-Reply-To: <20191202154123.64139-1-paul@crapouillou.net>
References: <20191202154123.64139-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1575301297; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fg/PlDK+PUoPua/OIog53C2OHM90AAbBw95IRxAF1p0=;
 b=ejdJmGX7ldTLpDtqHVBHySbEnM4HxQxgk8hJzLqcusGuaibBluoBtzu9BT0Vu4bB7wl7nQ
 MHp3AcDgEPql/L2soQ7BADjwLGQo8I85yC69JrZg/ugQ6Wer1M0mKi9Xhyfecrwscvu3/6
 aTas+GoV1wzTRWIS5AqygrMqHPT1pV8=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEZSRDM1MEg1NDAwNCBpcyBhIHNpbXBsZSAzLjUiIDMyMHgyNDAgMjQtYml0IFRGVCBwYW5l
bCwgZm91bmQgZm9yCmluc3RhbmNlIGluc2lkZSB0aGUgQW5iZXJuaWMgUkctMzUwIGhhbmRoZWxk
IGdhbWluZyBjb25zb2xlLgoKdjI6IE9yZGVyIGFscGhhYmV0aWNhbGx5CgpTaWduZWQtb2ZmLWJ5
OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYwppbmRleCAyOGZhNmJhN2I3NjcuLjBlNWUzM2E1N2YwYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMTQwMiw2ICsxNDAyLDMyIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGFuZWxfZGVzYyBmb3hsaW5rX2ZsNTAwd3ZyMDBfYTB0ID0gewogCS5idXNfZm9y
bWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBmcmlkYV9mcmQzNTBoNTQwMDRfbW9kZSA9IHsKKwkuY2xvY2sg
PSA2Nzc3LAorCS5oZGlzcGxheSA9IDMyMCwKKwkuaHN5bmNfc3RhcnQgPSAzMjAgKyA3MCwKKwku
aHN5bmNfZW5kID0gMzIwICsgNzAgKyA1MCwKKwkuaHRvdGFsID0gMzIwICsgNzAgKyA1MCArIDEw
LAorCS52ZGlzcGxheSA9IDI0MCwKKwkudnN5bmNfc3RhcnQgPSAyNDAgKyA1LAorCS52c3luY19l
bmQgPSAyNDAgKyA1ICsgMSwKKwkudnRvdGFsID0gMjQwICsgNSArIDEgKyA1LAorCS52cmVmcmVz
aCA9IDYwLAorCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxBR19Q
VlNZTkMsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZnJpZGFfZnJkMzUw
aDU0MDA0ID0geworCS5tb2RlcyA9ICZmcmlkYV9mcmQzNTBoNTQwMDRfbW9kZSwKKwkubnVtX21v
ZGVzID0gMSwKKwkuYnBjID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gNzcsCisJCS5oZWln
aHQgPSA2NCwKKwl9LAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwK
KwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFU
QV9QT1NFREdFLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZy
aWVuZGx5YXJtX2hkNzAyZV9tb2RlID0gewogCS5jbG9jawkJPSA2NzE4NSwKIAkuaGRpc3BsYXkJ
PSA4MDAsCkBAIC0zMTg5LDYgKzMyMTUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAiZm94
bGluayxmbDUwMHd2cjAwLWEwdCIsCiAJCS5kYXRhID0gJmZveGxpbmtfZmw1MDB3dnIwMF9hMHQs
CisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJmcmlkYSxmcmQzNTBoNTQwMDQiLAorCQkuZGF0YSA9
ICZmcmlkYV9mcmQzNTBoNTQwMDQsCiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJmcmllbmRseWFy
bSxoZDcwMmUiLAogCQkuZGF0YSA9ICZmcmllbmRseWFybV9oZDcwMmUsCi0tIAoyLjI0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
