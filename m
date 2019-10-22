Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F4E0290
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 13:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6BF6E5D8;
	Tue, 22 Oct 2019 11:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F4B6E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 11:14:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD2E2BA;
 Tue, 22 Oct 2019 13:14:48 +0200 (CEST)
Date: Tue, 22 Oct 2019 14:14:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Message-ID: <20191022111443.GE4756@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021214550.1461-3-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571742888;
 bh=Dj3Cz/n7yM2z3c1Y1pZ8ZtwXXwJMfegZmbgkXpatmh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=at9VuQVua6bJSsjxoq999Oh4fFDdbfhUDULTceOmzi44ViGtr3RQM5KOuUJYi6nsS
 qq51ZKr48Q1VGZ/hiT4PTS47om8/Ep8WkHxwBZsTWwU2Pn+RjAoxPzS4M1V+uHB+Ic
 Yva6JLUo6CpypxRc4qteWjt1ao8qq4ENIBbmUrto=
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
dCAwNDo0NTo0NlBNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiBJbnRyb2R1Y2UgYSBuZXcg
ZmxhZywgRFJNX01PREVfRFVNQl9LRVJORUxfTUFQLCBmb3Igc3RydWN0Cj4gZHJtX21vZGVfY3Jl
YXRlX2R1bWIuIFRoaXMgZmxhZyBpcyBmb3IgaW50ZXJuYWwga2VybmVsIHVzZSB0byBpbmRpY2F0
ZQo+IGlmIGR1bWIgYnVmZmVyIGFsbG9jYXRpb24gbmVlZHMgYSBrZXJuZWwgbWFwcGluZy4gVGhp
cyBpcyBuZWVkZWQgb25seSBmb3IKPiBDTUEgd2hlcmUgY3JlYXRpbmcgYSBrZXJuZWwgbWFwcGlu
ZyBvciBub3QgaGFzIHRvIGJlIGRlY2lkZWQgYXQgYWxsb2NhdGlvbgo+IHRpbWUgYmVjYXVzZSBj
cmVhdGluZyBhIG1hcHBpbmcgb24gZGVtYW5kICh3aXRoIHZtYXAoKSkgaXMgbm90IGd1YXJhbnRl
ZWQKPiB0byB3b3JrLiBTZXZlcmFsIGRyaXZlcnMgYXJlIHVzaW5nIENNQSwgYnV0IG5vdCB0aGUg
Q01BIGhlbHBlcnMgYmVjYXVzZQo+IHRoZXkgZGlzdGluZ3Vpc2ggYmV0d2VlbiBrZXJuZWwgYW5k
IHVzZXJzcGFjZSBhbGxvY2F0aW9ucyB0byBjcmVhdGUgYQo+IGtlcm5lbCBtYXBwaW5nIG9yIG5v
dC4KPiAKPiBVcGRhdGUgdGhlIGNhbGxlcnMgb2YgZHJtX21vZGVfZHVtYl9jcmVhdGUoKSB0byBz
ZXQKPiBkcm1fbW9kZV9kdW1iX2NyZWF0ZS5mbGFncyB0byBhcHByb3ByaWF0ZSBkZWZhdWx0cy4g
Q3VycmVudGx5LCBmbGFncyBjYW4KPiBiZSBzZXQgdG8gYW55dGhpbmcgYnkgdXNlcnNwYWNlLCBi
dXQgaXMgdW51c2VkIHdpdGhpbiB0aGUga2VybmVsLiBMZXQncwo+IGZvcmNlIGZsYWdzIHRvIHpl
cm8gKG5vIGtlcm5lbCBtYXBwaW5nKSBmb3IgdXNlcnNwYWNlIGNhbGxlcnMgYnkgZGVmYXVsdC4K
PiBGb3IgaW4ga2VybmVsIGNsaWVudHMsIHNldCBEUk1fTU9ERV9EVU1CX0tFUk5FTF9NQVAgYnkg
ZGVmYXVsdC4gRHJpdmVycwo+IGNhbiBvdmVycmlkZSB0aGlzIGFzIG5lZWRlZC4KPiAKPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnQuYyAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jIHwg
NSArKysrLQo+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgICAgIHwgMiArKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnQuYwo+IGluZGV4IGQ5YTJlMzY5NTUyNS4uZGJmYzgwNjFiMzkyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NsaWVudC5jCj4gQEAgLTI2NCw2ICsyNjQsNyBAQCBkcm1fY2xpZW50X2J1ZmZlcl9jcmVh
dGUoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMyIGhlaWdodCwg
dQo+ICAJZHVtYl9hcmdzLndpZHRoID0gd2lkdGg7Cj4gIAlkdW1iX2FyZ3MuaGVpZ2h0ID0gaGVp
Z2h0Owo+ICAJZHVtYl9hcmdzLmJwcCA9IGluZm8tPmNwcFswXSAqIDg7Cj4gKwlkdW1iX2FyZ3Mu
ZmxhZ3MgPSBEUk1fTU9ERV9EVU1CX0tFUk5FTF9NQVA7Cj4gIAlyZXQgPSBkcm1fbW9kZV9jcmVh
dGVfZHVtYihkZXYsICZkdW1iX2FyZ3MsIGNsaWVudC0+ZmlsZSk7Cj4gIAlpZiAocmV0KQo+ICAJ
CWdvdG8gZXJyX2RlbGV0ZTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1i
X2J1ZmZlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHVtYl9idWZmZXJzLmMKPiBpbmRleCBk
MThhNzQwZmUwZjEuLjc0YTEzZjE0YzE3MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2R1bWJfYnVmZmVycy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZl
cnMuYwo+IEBAIC05Nyw3ICs5NywxMCBAQCBpbnQgZHJtX21vZGVfY3JlYXRlX2R1bWIoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKPiAgaW50IGRybV9tb2RlX2NyZWF0ZV9kdW1iX2lvY3RsKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJCSAgICAgICB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGVfcHJpdikKPiAgewo+IC0JcmV0dXJuIGRybV9tb2RlX2NyZWF0ZV9kdW1iKGRldiwg
ZGF0YSwgZmlsZV9wcml2KTsKPiArCXN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAqYXJncyA9
IGRhdGE7Cj4gKwo+ICsJYXJncy0+ZmxhZ3MgPSAwOwoKSSB3b3VsZCBwcmVmZXIgcmV0dXJuaW5n
IGFuIGVycm9yIGlmIGZsYWdzIGlzIHNldCB0byBhIG5vbi16ZXJvIHZhbHVlLAp0byBjYXRjaCB1
c2Vyc3BhY2UgZXJyb3JzIGVhcmx5LCBidXQgSSdtIGFsc28gd29ycmllZCBpdCB3b3VsZCBicmVh
awpleGlzdGluZyB1c2Vyc3BhY2UgYnkgdW5jb3ZlcmluZyBleGlzdGluZyBidWdzLiBTdGlsbCwg
aWYgd2UgbGF0ZXIgYWRkCmZsYWdzIHRoYXQgdXNlcnNwYWNlIGNhbiBzZXQsIHRob3NlIGV4aXN0
aW5nIGJ1Z3Mgd2lsbCBiZSB0cmlnZ2VyZWQsIHNvCndlJ2xsIGhhdmUgdG8gZGVhbCB3aXRoIHRo
ZW0gYW55d2F5LCBhbmQgd2UgY291bGQgYWxyZWFkeSBnaXZlIGl0IGEgdHJ5LgoKVGhlIHBhdGNo
IG90aGVyd2lzZSBsb29rcyBnb29kIHRvIG1lLgoKPiArCXJldHVybiBkcm1fbW9kZV9jcmVhdGVf
ZHVtYihkZXYsIGFyZ3MsIGZpbGVfcHJpdik7Cj4gIH0KPiAgCj4gIC8qKgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2Rl
LmgKPiBpbmRleCA3MzVjOGNmZGFhYTEuLjAyNzEyZjQ2Yjk0YyAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2Rl
LmgKPiBAQCAtNzk2LDYgKzc5Niw4IEBAIHN0cnVjdCBkcm1fbW9kZV9jcnRjX3BhZ2VfZmxpcF90
YXJnZXQgewo+ICAJX191NjQgdXNlcl9kYXRhOwo+ICB9Owo+ICAKPiArI2RlZmluZSBEUk1fTU9E
RV9EVU1CX0tFUk5FTF9NQVAJKDE8PDApCS8qIEZvciBpbnRlcm5hbCBrZXJuZWwgdXNlICovCj4g
Kwo+ICAvKiBjcmVhdGUgYSBkdW1iIHNjYW5vdXQgYnVmZmVyICovCj4gIHN0cnVjdCBkcm1fbW9k
ZV9jcmVhdGVfZHVtYiB7Cj4gIAlfX3UzMiBoZWlnaHQ7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
