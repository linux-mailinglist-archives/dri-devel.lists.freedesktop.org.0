Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6B580B4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 12:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65B6E126;
	Thu, 27 Jun 2019 10:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FAC6E126
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 10:42:01 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hgRqq-000791-BX; Thu, 27 Jun 2019 12:42:00 +0200
Message-ID: <1561632120.2587.42.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: Use dev_info() instead of pr_info()
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Jun 2019 12:42:00 +0200
In-Reply-To: <20190611152639.18859-1-festevam@gmail.com>
References: <20190611152639.18859-1-festevam@gmail.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRGllbnN0YWcsIGRlbiAxMS4wNi4yMDE5LCAxMjoyNiAtMDMwMCBzY2hyaWViIEZhYmlvIEVz
dGV2YW06Cj4gZGV2X2luZm8oKSBpcyBtb3JlIGFwcHJvcHJpYXRlIGZvciBwcmludGluZyBfaW5m
byBsZXZlbCBtZXNzYWdlcwo+IGluc2lkZSBkcml2ZXJzLCBzbyBzd2l0Y2ggdG8gZGV2X2luZm8o
KS4KClRoaXMgcmVuZGVycyB0aGUgb3V0cHV0IHF1aXRlIGluY29uc2lzdGVudCBiZXR3ZWVuIHRo
ZSBoZXhkdW1wcyBhbmQgdGhlCnJlbGF0ZWQgbWVzc2FnZXMgeW91IGFyZSBjaGFuZ2luZyBoZXJl
LiBJIGRvIG5vdCBzZWUgdGhpcyBhcyBhbgppbXByb3ZlbWVudC4KClJlZ2FyZHMsCkx1Y2FzCgo+
IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiAtLS0K
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gQWRqdXN0IGNvbW1pdCBsb2cgdG8gc2F5ICJfaW5mbyBs
ZXZlbCIgaW5zdGVhZCBvZiAiZXJyb3IiCj4gCj4gwqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2J1ZmZlci5jIHwgMTQgKysrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2J1ZmZlci5jCj4gaW5kZXggMTYwY2UzYzA2MGE1Li44MjdiNWU0MmRiZTMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9idWZmZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfYnVmZmVyLmMKPiBAQCAtNDE0LDE4
ICs0MTQsMTggQEAgdm9pZCBldG5hdml2X2J1ZmZlcl9xdWV1ZShzdHJ1Y3QgZXRuYXZpdl9ncHUg
KmdwdSwgdTMyIGV4ZWNfc3RhdGUsCj4gPiDCoAkJCcKgwqDCoMKgYnVmZmVyLT51c2VyX3NpemUg
LSA0KTsKPiDCoAo+ID4gwqAJaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpCj4gPiAtCQlw
cl9pbmZvKCJzdHJlYW0gbGluayB0byAweCUwOHggQCAweCUwOHggJXBcbiIsCj4gPiAtCQkJcmV0
dXJuX3RhcmdldCwgZXRuYXZpdl9jbWRidWZfZ2V0X3ZhKGNtZGJ1ZiksCj4gPiAtCQkJY21kYnVm
LT52YWRkcik7Cj4gPiArCQlkZXZfaW5mbyhncHUtPmRldiwgInN0cmVhbSBsaW5rIHRvIDB4JTA4
eCBAIDB4JTA4eCAlcFxuIiwKPiA+ICsJCQnCoHJldHVybl90YXJnZXQsIGV0bmF2aXZfY21kYnVm
X2dldF92YShjbWRidWYpLAo+ID4gKwkJCcKgY21kYnVmLT52YWRkcik7Cj4gwqAKPiA+IMKgCWlm
IChkcm1fZGVidWcgJiBEUk1fVVRfRFJJVkVSKSB7Cj4gPiDCoAkJcHJpbnRfaGV4X2R1bXAoS0VS
Tl9JTkZPLCAiY21kICIsIERVTVBfUFJFRklYX09GRlNFVCwgMTYsIDQsCj4gPiDCoAkJCcKgwqDC
oMKgwqDCoMKgY21kYnVmLT52YWRkciwgY21kYnVmLT5zaXplLCAwKTsKPiDCoAo+ID4gLQkJcHJf
aW5mbygibGluayBvcDogJXBcbiIsIGJ1ZmZlci0+dmFkZHIgKyB3YWl0bGlua19vZmZzZXQpOwo+
ID4gLQkJcHJfaW5mbygiYWRkcjogMHglMDh4XG4iLCBsaW5rX3RhcmdldCk7Cj4gPiAtCQlwcl9p
bmZvKCJiYWNrOiAweCUwOHhcbiIsIHJldHVybl90YXJnZXQpOwo+ID4gLQkJcHJfaW5mbygiZXZl
bnQ6ICVkXG4iLCBldmVudCk7Cj4gPiArCQlkZXZfaW5mbyhncHUtPmRldiwgImxpbmsgb3A6ICVw
XG4iLCBidWZmZXItPnZhZGRyICsgd2FpdGxpbmtfb2Zmc2V0KTsKPiA+ICsJCWRldl9pbmZvKGdw
dS0+ZGV2LCAiYWRkcjogMHglMDh4XG4iLCBsaW5rX3RhcmdldCk7Cj4gPiArCQlkZXZfaW5mbyhn
cHUtPmRldiwgImJhY2s6IDB4JTA4eFxuIiwgcmV0dXJuX3RhcmdldCk7Cj4gPiArCQlkZXZfaW5m
byhncHUtPmRldiwgImV2ZW50OiAlZFxuIiwgZXZlbnQpOwo+ID4gwqAJfQo+IMKgCj4gPiDCoAkv
KgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
