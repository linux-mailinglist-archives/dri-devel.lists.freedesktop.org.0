Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6A2BA9BF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 13:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52416E8B0;
	Fri, 20 Nov 2020 12:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58ACF6E8B0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 12:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id EFBA1FB03;
 Fri, 20 Nov 2020 13:02:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIamRrRXpCEc; Fri, 20 Nov 2020 13:02:51 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 48B6B43F6E; Fri, 20 Nov 2020 13:02:51 +0100 (CET)
Date: Fri, 20 Nov 2020 13:02:51 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] drm/panel: s6e63m0: Fix and extend MCS table
Message-ID: <20201120120251.GA23988@bogon.m.sigxcpu.org>
References: <20201117175621.870085-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117175621.870085-1-linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsClRoZSB3aG9sZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZSBjb2RlIHdpc2Ugc28K
ClJldmlld2VkLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPiAKCmJ1dCBpIGhh
dmUgbm8gbWVhbnMgdG8gdGVzdCB0aGUgY2hhbmdlcy4KQ2hlZXJzLAogLS0gR3VpZG8KCk9uIFR1
ZSwgTm92IDE3LCAyMDIwIGF0IDA2OjU2OjE5UE0gKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gRml4IHVwIHRoZSBmb3JtYXQgb2YgdGhlIG1hbnVmYWN0dXJlciBjb21tYW5kIHNldCB0YWJs
ZQo+IHRvIGJlIFRBQi1pbmRlbnRlZCBhbmQgbG93ZXJjYXNlLiBBZGQgdGhlIE1DU19URU1QX1NX
SVJFCj4gY29tbWFuZCB0aGF0IHdlIHdpbGwgbWFrZSB1c2Ugb2YuCj4gCj4gQ2M6IFN0ZXBoYW4g
R2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5ldD4KPiBDYzogUGF3ZcWCIENobWllbCA8cGF3ZWwu
bWlrb2xhai5jaG1pZWxAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNhbXN1bmctczZlNjNtMC5jIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jCj4gaW5kZXggMjEwZTcwZGEz
YTE1Li44ZmNlMzk5ZmI5N2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNhbXN1bmctczZlNjNtMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNhbXN1bmctczZlNjNtMC5jCj4gQEAgLTIzLDIwICsyMywyMSBAQAo+ICAjaW5jbHVkZSAicGFu
ZWwtc2Ftc3VuZy1zNmU2M20wLmgiCj4gIAo+ICAvKiBNYW51ZmFjdHVyZXIgQ29tbWFuZCBTZXQg
Ki8KPiAtI2RlZmluZSBNQ1NfRUxWU1NfT04gICAgICAgICAgICAgICAgMHhiMQo+IC0jZGVmaW5l
IE1DU19NSUVDVEwxICAgICAgICAgICAgICAgIDB4YzAKPiAtI2RlZmluZSBNQ1NfQkNNT0RFICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMQo+ICsjZGVmaW5lIE1DU19FTFZTU19PTgkJ
MHhiMQo+ICsjZGVmaW5lIE1DU19URU1QX1NXSVJFCQkweGIyCj4gKyNkZWZpbmUgTUNTX01JRUNU
TDEJCTB4YzAKPiArI2RlZmluZSBNQ1NfQkNNT0RFCQkweGMxCj4gICNkZWZpbmUgTUNTX0VSUk9S
X0NIRUNLCQkweGQ1Cj4gICNkZWZpbmUgTUNTX1JFQURfSUQxCQkweGRhCj4gICNkZWZpbmUgTUNT
X1JFQURfSUQyCQkweGRiCj4gICNkZWZpbmUgTUNTX1JFQURfSUQzCQkweGRjCj4gICNkZWZpbmUg
TUNTX0xFVkVMXzJfS0VZCQkweGYwCj4gICNkZWZpbmUgTUNTX01UUF9LRVkJCTB4ZjEKPiAtI2Rl
ZmluZSBNQ1NfRElTQ1RMICAgMHhmMgo+IC0jZGVmaW5lIE1DU19TUkNDVEwgICAgICAgICAgIDB4
ZjYKPiAtI2RlZmluZSBNQ1NfSUZDVEwgICAgICAgICAgICAgICAgICAgICAgIDB4ZjcKPiAtI2Rl
ZmluZSBNQ1NfUEFORUxDVEwgICAgICAgICAweEY4Cj4gLSNkZWZpbmUgTUNTX1BHQU1NQUNUTCAg
ICAgICAgICAgICAgICAgICAweGZhCj4gKyNkZWZpbmUgTUNTX0RJU0NUTAkJMHhmMgo+ICsjZGVm
aW5lIE1DU19TUkNDVEwJCTB4ZjYKPiArI2RlZmluZSBNQ1NfSUZDVEwJCTB4ZjcKPiArI2RlZmlu
ZSBNQ1NfUEFORUxDVEwJCTB4ZjgKPiArI2RlZmluZSBNQ1NfUEdBTU1BQ1RMCQkweGZhCj4gIAo+
ICAjZGVmaW5lIFM2RTYzTTBfTENEX0lEX1ZBTFVFX00yCQkweEE0Cj4gICNkZWZpbmUgUzZFNjNN
MF9MQ0RfSURfVkFMVUVfU00yCTB4QjQKPiAtLSAKPiAyLjI2LjIKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
