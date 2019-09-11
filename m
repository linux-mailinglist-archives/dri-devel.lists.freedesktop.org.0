Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DBB0765
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6116EB56;
	Thu, 12 Sep 2019 04:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1676E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:40:32 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7FCA33A;
 Wed, 11 Sep 2019 20:40:29 +0200 (CEST)
Subject: Re: [PATCH v4 6/9] drm: rcar-du: crtc: Enable and disable CMMs
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au,
 uli+renesas@fpond.eu, VenkataRajesh.Kalakodima@in.bosch.com
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-7-jacopo+renesas@jmondi.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bc443263-5f20-f022-34c8-1e521243dec1@ideasonboard.com>
Date: Wed, 11 Sep 2019 19:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-7-jacopo+renesas@jmondi.org>
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568227230;
 bh=Cm4wbCtI9Gzn79VIY7AbQ+F58/Qss2DHcbMDeHO/vJs=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fbg0AjCoUSm7qfE40KzniJtnT5TizMqaZtackRBNACafqaOFix0cU/S0G2GsgWZZp
 SFELE0Ia/I4Nb/23kJ/cdIM7+BoZiojzlMpKdY7M4iDuFnnNgY/yuy2FzHt77y2Kar
 M20BaTZ9u+k9ljLFN33eSXoPzHPeJm8fJ1pqJ5Sk=
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKT24gMDYvMDkvMjAxOSAxNDo1NCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+IEVu
YWJsZS9kaXNhYmxlIHRoZSBDTU0gYXNzb2NpYXRlZCB3aXRoIGEgQ1JUQyBhdCBDUlRDIHN0YXJ0
IGFuZCBzdG9wCj4gdGltZSBhbmQgZW5hYmxlIHRoZSBDTU0gdW5pdCB0aHJvdWdoIHRoZSBEaXNw
bGF5IEV4dGVuc2lvbmFsIEZ1bmN0aW9ucwo+IHJlZ2lzdGVyIGF0IGdyb3VwIHNldHVwIHRpbWUu
Cj4gCj4gUmV2aWV3ZWQtYnk6IFVscmljaCBIZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+Cj4g
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGpt
b25kaS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5j
ICB8IDcgKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmMg
fCA4ICsrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oICB8
IDUgKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jIGIvZHJpdmVycy9n
cHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKPiBpbmRleCAyM2YxZDZjYzE3MTkuLjNkYWM2
MDVjM2E2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Ny
dGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCj4gQEAg
LTIxLDYgKzIxLDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+ICAKPiArI2luY2x1ZGUgInJjYXJfY21tLmgiCj4g
ICNpbmNsdWRlICJyY2FyX2R1X2NydGMuaCIKPiAgI2luY2x1ZGUgInJjYXJfZHVfZHJ2LmgiCj4g
ICNpbmNsdWRlICJyY2FyX2R1X2VuY29kZXIuaCIKPiBAQCAtNjE5LDYgKzYyMCw5IEBAIHN0YXRp
YyB2b2lkIHJjYXJfZHVfY3J0Y19zdG9wKHN0cnVjdCByY2FyX2R1X2NydGMgKnJjcnRjKQo+ICAJ
aWYgKHJjYXJfZHVfaGFzKHJjcnRjLT5kZXYsIFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NPVVJDRSkp
Cj4gIAkJcmNhcl9kdV92c3BfZGlzYWJsZShyY3J0Yyk7Cj4gIAo+ICsJaWYgKHJjcnRjLT5jbW0p
Cj4gKwkJcmNhcl9jbW1fZGlzYWJsZShyY3J0Yy0+Y21tKTsKPiArCj4gIAkvKgo+ICAJICogU2Vs
ZWN0IHN3aXRjaCBzeW5jIG1vZGUuIFRoaXMgc3RvcHMgZGlzcGxheSBvcGVyYXRpb24gYW5kIGNv
bmZpZ3VyZXMKPiAgCSAqIHRoZSBIU1lOQyBhbmQgVlNZTkMgc2lnbmFscyBhcyBpbnB1dHMuCj4g
QEAgLTY4Niw2ICs2OTAsOSBAQCBzdGF0aWMgdm9pZCByY2FyX2R1X2NydGNfYXRvbWljX2VuYWJs
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAl9Cj4gIAo+ICAJcmNhcl9kdV9jcnRjX3N0YXJ0
KHJjcnRjKTsKPiArCj4gKwlpZiAocmNydGMtPmNtbSkKPiArCQlyY2FyX2NtbV9lbmFibGUocmNy
dGMtPmNtbSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHJjYXJfZHVfY3J0Y19hdG9taWNfZGlz
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZ3JvdXAuYwo+IGluZGV4IDllZWU0Nzk2OWU3Ny4uMjVkMGZjMTI1ZDdhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYwo+IEBAIC0xNDcsNiArMTQ3LDE0IEBA
IHN0YXRpYyB2b2lkIHJjYXJfZHVfZ3JvdXBfc2V0dXAoc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJn
cnApCj4gIAo+ICAJcmNhcl9kdV9ncm91cF9zZXR1cF9waW5zKHJncnApOwo+ICAKPiArCWlmIChy
Y2FyX2R1X2hhcyhyY2R1LCBSQ0FSX0RVX0ZFQVRVUkVfQ01NKSkgewo+ICsJCXUzMiBkZWZyNyA9
IERFRlI3X0NPREUKPiArCQkJICB8IChyZ3JwLT5jbW1zX21hc2sgJiBCSVQoMSkgPyBERUZSN19D
TU1FMSA6IDApCj4gKwkJCSAgfCAocmdycC0+Y21tc19tYXNrICYgQklUKDApID8gREVGUjdfQ01N
RTAgOiAwKTsKPiArCj4gKwkJcmNhcl9kdV9ncm91cF93cml0ZShyZ3JwLCBERUZSNywgZGVmcjcp
Owo+ICsJfQo+ICsKCldoYXQncyB0aGUgZWZmZWN0IGhlcmUgb24gcGxhdGZvcm1zIHdpdGggYSBD
TU0sIGJ1dCB3aXRoCkNPTkZJR19EUk1fUkNBUl9DTU0gdW5zZXQ/CgpXaWxsIHRoaXMgaW5jb3Jy
ZWN0bHkgY29uZmlndXJlIHRoZSBEVSA/CgpXaWxsIGl0IHN0YWxsIHRoZSBkaXNwbGF5IGlmIHRo
ZSBEVSB0cmllcyB0byBpbnRlcmFjdCB3aXRoIGFub3RoZXIKbW9kdWxlIHdoaWNoIGlzIG5vdCBl
bmFibGVkPwoKCj4gIAlpZiAocmNkdS0+aW5mby0+Z2VuID49IDIpIHsKPiAgCQlyY2FyX2R1X2dy
b3VwX3NldHVwX2RlZnI4KHJncnApOwo+ICAJCXJjYXJfZHVfZ3JvdXBfc2V0dXBfZGlkc3Iocmdy
cCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5o
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKPiBpbmRleCBiYzg3ZjA4
MGIxNzAuLmZiOTk2NDk0OTM2OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X3JlZ3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
cmVncy5oCj4gQEAgLTE5Nyw2ICsxOTcsMTEgQEAKPiAgI2RlZmluZSBERUZSNl9NTE9TMQkJKDEg
PDwgMikKPiAgI2RlZmluZSBERUZSNl9ERUZBVUxUCQkoREVGUjZfQ09ERSB8IERFRlI2X1RDTkUx
KQo+ICAKPiArI2RlZmluZSBERUZSNwkJCTB4MDAwZWMKPiArI2RlZmluZSBERUZSN19DT0RFCQko
MHg3Nzc5IDw8IDE2KQo+ICsjZGVmaW5lIERFRlI3X0NNTUUxCQlCSVQoNikKPiArI2RlZmluZSBE
RUZSN19DTU1FMAkJQklUKDQpCj4gKwo+ICAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgKiBS
OEE3NzkwLW9ubHkgQ29udHJvbCBSZWdpc3RlcnMKPiAgICovCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
