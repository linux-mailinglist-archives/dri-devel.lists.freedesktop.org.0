Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7313848400
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFE588D18;
	Mon, 17 Jun 2019 13:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D14A88D18
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:32:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3CC8344;
 Mon, 17 Jun 2019 06:32:14 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A43BE3F246;
 Mon, 17 Jun 2019 06:32:14 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 67DD5682413; Mon, 17 Jun 2019 14:32:13 +0100 (BST)
Date: Mon, 17 Jun 2019 14:32:13 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/komeda: fix size_t format string
Message-ID: <20190617133213.GY4173@e110455-lin.cambridge.arm.com>
References: <20190617125002.1312331-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617125002.1312331-1-arnd@arndb.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJuZCwKCk9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDAyOjQ5OjE4UE0gKzAyMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gVGhlIGRlYnVnIG91dHB1dCB1c2VzIHRoZSB3cm9uZyBmb3JtYXQg
c3RyaW5nIGZvciBwcmludGluZyBhIHNpemVfdDoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
aW5jbHVkZS9kcm0vZHJtX21tLmg6NDksCj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUv
ZHJtL2RybV92bWFfbWFuYWdlci5oOjI2LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRl
L2RybS9kcm1fZ2VtLmg6NDAsCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmM6OToKPiBkcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jOiBJbiBmdW5jdGlv
biAna29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayc6Cj4gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzo5NjoxNzogZXJyb3I6IGZvcm1hdCAnJWx4
JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgdW5zaWduZWQgaW50JywgYnV0IGFyZ3Vt
ZW50IDMgaGFzIHR5cGUgJ3NpemVfdCcge2FrYSAndW5zaWduZWQgaW50J30gWy1XZXJyb3I9Zm9y
bWF0PV0KPiAgICBEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpfc2l6
ZTogMHglbHguIG1pbl9zaXplIDB4JXguXG4iLAo+IAo+IFRoaXMgaXMgaGFybWxlc3MgaW4gdGhl
IGtlcm5lbCBhcyBzaXplX3QgYW5kIGxvbmcgYXJlIGFsd2F5cyB0aGUgc2FtZQo+IHdpZHRoLCBi
dXQgaXQncyBhbHdheXMgYmV0dGVyIHRvIHVzZSB0aGUgY29ycmVjdCBmb3JtYXQgc3RyaW5nCj4g
dG8gc2h1dCB1cCB0aGUgd2FybmluZy4KPiAKPiBGaXhlczogOWNjZjUzNmU1M2NiICgiZHJtL2tv
bWVkYTogQWRkZWQgQUZCQyBzdXBwb3J0IGZvciBrb21lZGEgZHJpdmVyIikKPiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2ghIEkgZGlkIHNlZSB0aGUgd2FybmluZyBlbWFpbCBzZW50IGJ5IHRoZSBidWlsZCBib3RzIGFu
ZApJJ3ZlIGhhZCB0aGUgc2FtZSBmaXggaW4gbXkgc3Rhc2gsIGJ1dCB0aGVuIEkndmUgbG9va2Vk
IGF0IHRoZSBjb2RlIHVzaW5nCm1pbl9zaXplIGFuZCBJJ20gbm90IGhhcHB5IHdpdGggaXQsIHNv
IEkndmUgYXNrZWQgSmFtZXMgdG8gY29tZSB1cCB3aXRoIGEgcGF0Y2gKdG8gZml4IHRoaW5ncyBp
biBhIGJldHRlciB3YXkuCgpTbywgaWYgeW91IGRvbid0IG1pbmQsIEkgd2lsbCBkZWxheSB0aGlz
IHBhdGNoIHVudGlsIEphbWVzIGNvbWVzIHVwIHdpdGggYSBmaXgKaW4gdGhlIG5leHQgY291cGxl
IG9mIGRheXMuIElmIGhlIGlzIG5vdCwgdGhlbiBJJ2xsIHB1bGwgdGhlIHBhdGNoIGludG8gbWFs
aS1kcAp0cmVlIChzaGFyZWQgd2l0aCBrb21lZGEpLgoKQmVzdCByZWdhcmRzLApMaXZpdQoKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVm
ZmVyLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBpbmRleCBhYmM4YzBjY2MwNTMuLjU4ZmYzNGU3
MThkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+IEBAIC05Myw3ICs5Myw3IEBAIGtvbWVkYV9mYl9h
ZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGUsCj4gIAkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gIAltaW5fc2l6ZSA9
IGtmYi0+YWZiY19zaXplICsgZmItPm9mZnNldHNbMF07Cj4gIAlpZiAobWluX3NpemUgPiBvYmot
PnNpemUpIHsKPiAtCQlEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpf
c2l6ZTogMHglbHguIG1pbl9zaXplIDB4JXguXG4iLAo+ICsJCURSTV9ERUJVR19LTVMoImFmYmMg
c2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCV6eC4gbWluX3NpemUgMHgleC5cbiIsCj4g
IAkJCSAgICAgIG9iai0+c2l6ZSwgbWluX3NpemUpOwo+ICAJCWdvdG8gY2hlY2tfZmFpbGVkOwo+
ICAJfQo+IEBAIC0xMzcsNyArMTM3LDcgQEAga29tZWRhX2ZiX25vbmVfYWZiY19zaXplX2NoZWNr
KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3Qga29tZWRhX2ZiICprZmIsCj4gIAkJbWlu
X3NpemUgPSBrb21lZGFfZmJfZ2V0X3BpeGVsX2FkZHIoa2ZiLCAwLCBmYi0+aGVpZ2h0LCBpKQo+
ICAJCQkgLSB0b19kcm1fZ2VtX2NtYV9vYmoob2JqKS0+cGFkZHI7Cj4gIAkJaWYgKG9iai0+c2l6
ZSA8IG1pbl9zaXplKSB7Cj4gLQkJCURSTV9ERUJVR19LTVMoIlRoZSBmYi0+b2JqWyVkXSBzaXpl
OiAlbGQgbG93ZXIgdGhhbiB0aGUgbWluaW11bSByZXF1aXJlbWVudDogJWQuXG4iLAo+ICsJCQlE
Uk1fREVCVUdfS01TKCJUaGUgZmItPm9ialslZF0gc2l6ZTogJXpkIGxvd2VyIHRoYW4gdGhlIG1p
bmltdW0gcmVxdWlyZW1lbnQ6ICVkLlxuIiwKPiAgCQkJCSAgICAgIGksIG9iai0+c2l6ZSwgbWlu
X3NpemUpOwo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gLS0gCj4gMi4yMC4wCj4gCgot
LSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29y
bGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2Ug
Y29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
