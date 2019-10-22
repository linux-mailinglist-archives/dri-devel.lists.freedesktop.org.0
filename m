Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52BE02A5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 13:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35786E47B;
	Tue, 22 Oct 2019 11:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BCC6E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:18:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AB65A2C;
 Tue, 22 Oct 2019 13:18:54 +0200 (CEST)
Date: Tue, 22 Oct 2019 14:18:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/6] drm/cma-helper: Use the dma_*_attr API variant
Message-ID: <20191022111849.GF4756@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021214550.1461-4-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571743134;
 bh=oS7CmPV8UD0nLLejLW9+oTb/3yWIxQqsikap2UyJtwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzTrzyqEEhFKAKpH0TMnAV+xM4eltHUNpUsSsNkPiezxqQMASXUga56G7X0sGmOsF
 TCF6T+e/AcItSRr45a3fWVkAyT8EcBY+5GpFmCsNH+laQ+6kFuaeXuugYO3iggbHw7
 gbL3fP6hSNj5PGzTr3t01Z8CCR/AcObIKfblXsG0=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIE9jdCAyMSwgMjAxOSBh
dCAwNDo0NTo0N1BNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiBJbiBwcmVwYXJhdGlvbiB0
byBhbGxvdyBEUk0gQ01BIHVzZXJzIHRvIGFkanVzdCB0aGUgRE1BX0FUVFJfKiBmbGFncywKPiBj
b252ZXJ0IHRoZSBDTUEgaGVscGVyIGNvZGUgdG8gdXNlIHRoZSBkbWFfKl9hdHRyIEFQSXMgaW5z
dGVhZCBvZiB0aGUKPiBkbWFfKl93YyB2YXJpYW50cy4KPiAKPiBPbmx5IHRoZSBETUFfQVRUUl9X
UklURV9DT01CSU5FIGFuZCBETUFfQVRUUl9OT19XQVJOIGF0dHJpYnV0ZXMgYXJlIHNldAo+IGlu
IHRoaXMgY29tbWl0LCBzbyB0aGVyZSdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKQXBhcnQgZnJv
bSB0aGUgZG9jdW1lbnRhdGlvbiBpc3N1ZSByZXBvcnRlZCBieSBrYnVpbGQsCgpSZXZpZXdlZC1i
eTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoK
PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
Pgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fY21hX2hlbHBlci5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KPiAgaW5jbHVkZS9k
cm0vZHJtX2dlbV9jbWFfaGVscGVyLmggICAgIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2Nt
YV9oZWxwZXIuYwo+IGluZGV4IDEyZTk4ZmIyODIyOS4uNGNlYmZlMDFlNmVhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+IEBAIC03MCw2ICs3MCw3IEBAIF9fZHJtX2dl
bV9jbWFfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHNpemVfdCBzaXplKQo+ICAJCWdv
dG8gZXJyb3I7Cj4gIAl9Cj4gCj4gKwljbWFfb2JqLT5kbWFfYXR0cnMgfD0gRE1BX0FUVFJfTk9f
V0FSTiB8IERNQV9BVFRSX1dSSVRFX0NPTUJJTkU7Cj4gIAlyZXR1cm4gY21hX29iajsKPiAKPiAg
ZXJyb3I6Cj4gQEAgLTEwMiw4ICsxMDMsOSBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpk
cm1fZ2VtX2NtYV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKPiAgCWlmIChJU19FUlIo
Y21hX29iaikpCj4gIAkJcmV0dXJuIGNtYV9vYmo7Cj4gCj4gLQljbWFfb2JqLT52YWRkciA9IGRt
YV9hbGxvY193Yyhkcm0tPmRldiwgc2l6ZSwgJmNtYV9vYmotPnBhZGRyLAo+IC0JCQkJICAgICAg
R0ZQX0tFUk5FTCB8IF9fR0ZQX05PV0FSTik7Cj4gKwljbWFfb2JqLT52YWRkciA9IGRtYV9hbGxv
Y19hdHRycyhkcm0tPmRldiwgc2l6ZSwgJmNtYV9vYmotPnBhZGRyLAo+ICsJCQkJCSBHRlBfS0VS
TkVMIHwgX19HRlBfTk9XQVJOLAo+ICsJCQkJCSBjbWFfb2JqLT5kbWFfYXR0cnMpOwo+ICAJaWYg
KCFjbWFfb2JqLT52YWRkcikgewo+ICAJCWRldl9kYmcoZHJtLT5kZXYsICJmYWlsZWQgdG8gYWxs
b2NhdGUgYnVmZmVyIHdpdGggc2l6ZSAlenVcbiIsCj4gIAkJCXNpemUpOwo+IEBAIC0xODQsOCAr
MTg2LDkgQEAgdm9pZCBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKmdlbV9vYmopCj4gIAkJCWRtYV9idWZfdnVubWFwKGdlbV9vYmotPmltcG9ydF9hdHRhY2gt
PmRtYWJ1ZiwgY21hX29iai0+dmFkZHIpOwo+ICAJCWRybV9wcmltZV9nZW1fZGVzdHJveShnZW1f
b2JqLCBjbWFfb2JqLT5zZ3QpOwo+ICAJfSBlbHNlIGlmIChjbWFfb2JqLT52YWRkcikgewo+IC0J
CWRtYV9mcmVlX3djKGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5iYXNlLnNpemUsCj4gLQkJ
CSAgICBjbWFfb2JqLT52YWRkciwgY21hX29iai0+cGFkZHIpOwo+ICsJCWRtYV9mcmVlX2F0dHJz
KGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5iYXNlLnNpemUsCj4gKwkJCSAgICAgICBjbWFf
b2JqLT52YWRkciwgY21hX29iai0+cGFkZHIsCj4gKwkJCSAgICAgICBjbWFfb2JqLT5kbWFfYXR0
cnMpOwo+ICAJfQo+IAo+ICAJZHJtX2dlbV9vYmplY3RfcmVsZWFzZShnZW1fb2JqKTsKPiBAQCAt
Mjc5LDggKzI4Miw5IEBAIHN0YXRpYyBpbnQgZHJtX2dlbV9jbWFfbW1hcF9vYmooc3RydWN0IGRy
bV9nZW1fY21hX29iamVjdCAqY21hX29iaiwKPiAgCXZtYS0+dm1fZmxhZ3MgJj0gflZNX1BGTk1B
UDsKPiAgCXZtYS0+dm1fcGdvZmYgPSAwOwo+IAo+IC0JcmV0ID0gZG1hX21tYXBfd2MoY21hX29i
ai0+YmFzZS5kZXYtPmRldiwgdm1hLCBjbWFfb2JqLT52YWRkciwKPiAtCQkJICBjbWFfb2JqLT5w
YWRkciwgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiArCXJldCA9IGRtYV9tbWFwX2F0
dHJzKGNtYV9vYmotPmJhc2UuZGV2LT5kZXYsIHZtYSwgY21hX29iai0+dmFkZHIsCj4gKwkJCSAg
ICAgY21hX29iai0+cGFkZHIsIHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCwKPiArCQkJICAg
ICBjbWFfb2JqLT5kbWFfYXR0cnMpOwo+ICAJaWYgKHJldCkKPiAgCQlkcm1fZ2VtX3ZtX2Nsb3Nl
KHZtYSk7Cj4gCj4gQEAgLTQzNCw4ICs0MzgsOCBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1f
Y21hX3ByaW1lX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgCWlm
ICghc2d0KQo+ICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+IAo+IC0JcmV0ID0gZG1hX2dl
dF9zZ3RhYmxlKG9iai0+ZGV2LT5kZXYsIHNndCwgY21hX29iai0+dmFkZHIsCj4gLQkJCSAgICAg
IGNtYV9vYmotPnBhZGRyLCBvYmotPnNpemUpOwo+ICsJcmV0ID0gZG1hX2dldF9zZ3RhYmxlX2F0
dHJzKG9iai0+ZGV2LT5kZXYsIHNndCwgY21hX29iai0+dmFkZHIsCj4gKwkJCSAgICAgIGNtYV9v
YmotPnBhZGRyLCBvYmotPnNpemUsIGNtYV9vYmotPmRtYV9hdHRycyk7Cj4gIAlpZiAocmV0IDwg
MCkKPiAgCQlnb3RvIG91dDsKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaAo+IGluZGV4IDk0
N2FjOTVlYjI0YS4uZDA0MjIxM2MzNTk1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9n
ZW1fY21hX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmgK
PiBAQCAtMjQsNiArMjQsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0IHsKPiAKPiAgCS8q
IEZvciBvYmplY3RzIHdpdGggRE1BIG1lbW9yeSBhbGxvY2F0ZWQgYnkgR0VNIENNQSAqLwo+ICAJ
dm9pZCAqdmFkZHI7Cj4gKwl1bnNpZ25lZCBsb25nIGRtYV9hdHRyczsKPiAgfTsKPiAKPiAgI2Rl
ZmluZSB0b19kcm1fZ2VtX2NtYV9vYmooZ2VtX29iaikgXAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
