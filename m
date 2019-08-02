Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078A7EE8A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BFA6ECEC;
	Fri,  2 Aug 2019 08:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA246ECEC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 08:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D0072FB03;
 Fri,  2 Aug 2019 10:14:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEKR23rwQlTS; Fri,  2 Aug 2019 10:14:48 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 111F347246; Fri,  2 Aug 2019 10:14:48 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:14:47 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/8] drm/etnaviv: simplify unbind checks
Message-ID: <20190802081447.GA6331@bogon.m.sigxcpu.org>
References: <20190705171727.27501-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705171727.27501-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDA3OjE3OjIwUE0gKzAyMDAsIEx1Y2FzIFN0YWNo
IHdyb3RlOgo+IFJlbWVtYmVyIGlmIHRoZSBHUFUgaGFzIGJlZW4gc3VjZXNzZnVsbHkgaW5pdGlh
bGl6ZWQuIE9ubHkgaW4gdGhhdCBjYXNlCj4gZG8gd2UgbmVlZCB0byBjbGVhbiB1cCB2YXJpb3Vz
IHN0cnVjdHVyZXMgaW4gdGhlIHVuYmluZCBwYXRoLiBJZiB0aGUKPiBHUFUgaGFzbid0IGJlZW4g
c3VjZXNzZnVsbHkgaW5pdGlhbGl6ZWQgYWxsIHRoZSBjbGVhbnVwcyBzaG91bGQgaGFwcGVuCj4g
aW4gdGhlIGZhaWx1cmUgcGF0aHMgb2YgdGhlIGluaXQgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCAyMCArKysrKysrLS0tLS0tLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5oIHwgIDEgKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCj4gaW5kZXggNDgyMjU0OTUwMGVlLi5lODRhMGVk
OTA0YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKPiBAQCAtNzk5
LDE3ICs3OTksMTYgQEAgaW50IGV0bmF2aXZfZ3B1X2luaXQoc3RydWN0IGV0bmF2aXZfZ3B1ICpn
cHUpCj4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGdwdS0+ZGV2KTsKPiAgCXBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKGdwdS0+ZGV2KTsKPiAgCj4gKwlncHUtPmluaXRpYWxpemVkID0g
dHJ1ZTsKPiArCj4gIAlyZXR1cm4gMDsKPiAgCj4gIGZyZWVfYnVmZmVyOgo+ICAJZXRuYXZpdl9j
bWRidWZfZnJlZSgmZ3B1LT5idWZmZXIpOwo+IC0JZ3B1LT5idWZmZXIuc3ViYWxsb2MgPSBOVUxM
Owo+ICBkZXN0cm95X3N1YmFsbG9jOgo+ICAJZXRuYXZpdl9jbWRidWZfc3ViYWxsb2NfZGVzdHJv
eShncHUtPmNtZGJ1Zl9zdWJhbGxvYyk7Cj4gLQlncHUtPmNtZGJ1Zl9zdWJhbGxvYyA9IE5VTEw7
Cj4gIGRlc3Ryb3lfaW9tbXU6Cj4gIAlldG5hdml2X2lvbW11X2Rlc3Ryb3koZ3B1LT5tbXUpOwo+
IC0JZ3B1LT5tbXUgPSBOVUxMOwo+ICBmYWlsOgo+ICAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVz
eShncHUtPmRldik7Cj4gIAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChncHUtPmRldik7Cj4g
QEAgLTE1MjEsNyArMTUyMCw3IEBAIGludCBldG5hdml2X2dwdV93YWl0X2lkbGUoc3RydWN0IGV0
bmF2aXZfZ3B1ICpncHUsIHVuc2lnbmVkIGludCB0aW1lb3V0X21zKQo+ICAKPiAgc3RhdGljIGlu
dCBldG5hdml2X2dwdV9od19zdXNwZW5kKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1KQo+ICB7Cj4g
LQlpZiAoZ3B1LT5idWZmZXIuc3ViYWxsb2MpIHsKPiArCWlmIChncHUtPmluaXRpYWxpemVkKSB7
Cj4gIAkJLyogUmVwbGFjZSB0aGUgbGFzdCBXQUlUIHdpdGggRU5EICovCj4gIAkJbXV0ZXhfbG9j
aygmZ3B1LT5sb2NrKTsKPiAgCQlldG5hdml2X2J1ZmZlcl9lbmQoZ3B1KTsKPiBAQCAtMTY4MCwx
OSArMTY3OSwxNCBAQCBzdGF0aWMgdm9pZCBldG5hdml2X2dwdV91bmJpbmQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gIAlldG5hdml2X2dwdV9od19zdXNwZW5k
KGdwdSk7Cj4gICNlbmRpZgo+ICAKPiAtCWlmIChncHUtPmJ1ZmZlci5zdWJhbGxvYykKPiArCWlm
IChncHUtPmluaXRpYWxpemVkKSB7Cj4gIAkJZXRuYXZpdl9jbWRidWZfZnJlZSgmZ3B1LT5idWZm
ZXIpOwo+IC0KPiAtCWlmIChncHUtPmNtZGJ1Zl9zdWJhbGxvYykgewo+ICAJCWV0bmF2aXZfY21k
YnVmX3N1YmFsbG9jX2Rlc3Ryb3koZ3B1LT5jbWRidWZfc3ViYWxsb2MpOwo+IC0JCWdwdS0+Y21k
YnVmX3N1YmFsbG9jID0gTlVMTDsKPiAtCX0KPiAtCj4gLQlpZiAoZ3B1LT5tbXUpIHsKPiAgCQll
dG5hdml2X2lvbW11X2Rlc3Ryb3koZ3B1LT5tbXUpOwo+IC0JCWdwdS0+bW11ID0gTlVMTDsKPiAr
CQlncHUtPmluaXRpYWxpemVkID0gZmFsc2U7Cj4gIAl9Cj4gIAo+ICsKCk1heWJlIGRyb3AgdGhp
cyBsaW5lLCBvdGhlcndpc2U6CgpSZXZpZXdlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4
Y3B1Lm9yZz4gCgo+ICAJZ3B1LT5kcm0gPSBOVUxMOwo+ICAJaWRyX2Rlc3Ryb3koJmdwdS0+ZmVu
Y2VfaWRyKTsKPiAgCj4gQEAgLTE4MjcsNyArMTgyMSw3IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9n
cHVfcnBtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4g
IAkvKiBSZS1pbml0aWFsaXNlIHRoZSBiYXNpYyBoYXJkd2FyZSBzdGF0ZSAqLwo+IC0JaWYgKGdw
dS0+ZHJtICYmIGdwdS0+YnVmZmVyLnN1YmFsbG9jKSB7Cj4gKwlpZiAoZ3B1LT5kcm0gJiYgZ3B1
LT5pbml0aWFsaXplZCkgewo+ICAJCXJldCA9IGV0bmF2aXZfZ3B1X2h3X3Jlc3VtZShncHUpOwo+
ICAJCWlmIChyZXQpIHsKPiAgCQkJZXRuYXZpdl9ncHVfY2xrX2Rpc2FibGUoZ3B1KTsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmgKPiBpbmRleCA5YmNmMTUxZjcwNmIuLmIwNmM3
Yzk4ZDUyMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dw
dS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuaAo+IEBAIC05
OSw2ICs5OSw3IEBAIHN0cnVjdCBldG5hdml2X2dwdSB7Cj4gIAllbnVtIGV0bmF2aXZfc2VjX21v
ZGUgc2VjX21vZGU7Cj4gIAlzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3E7Cj4gIAlzdHJ1Y3Qg
ZHJtX2dwdV9zY2hlZHVsZXIgc2NoZWQ7Cj4gKwlib29sIGluaXRpYWxpemVkOwo+ICAKPiAgCS8q
ICdyaW5nJy1idWZmZXI6ICovCj4gIAlzdHJ1Y3QgZXRuYXZpdl9jbWRidWYgYnVmZmVyOwo+IC0t
IAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZXRuYXZpdiBtYWlsaW5nIGxpc3QKPiBldG5hdml2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZXRu
YXZpdgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
