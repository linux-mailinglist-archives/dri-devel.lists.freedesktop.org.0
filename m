Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022DE1E24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 16:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7006EAE7;
	Wed, 23 Oct 2019 14:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448696EAE7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 14:28:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net
 [93.2.121.143])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D86D02BA;
 Wed, 23 Oct 2019 16:28:50 +0200 (CEST)
Date: Wed, 23 Oct 2019 17:28:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Message-ID: <20191023142844.GC1904@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
 <20191022111443.GE4756@pendragon.ideasonboard.com>
 <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571840931;
 bh=t3Htp1XR/thYXTkpQ0rJ6aq37qeHWyJ+ms7lSKkK260=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rq44FFoUvSBNKU3dRccrJ+nNMAAqWTv+qKPcu7cFedWct514zocGwqunpV/T85zmY
 Y8M8cSDrAK1N8xXDzcdys8702EHJETXKYvCfgtGrMqAm2LEggVvi6fGSC0NzvGJQJv
 iExRoNQX3b60Bv2LNJUaza8GOGLwflH83hiLkKiI=
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
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDc6NDI6MDZBTSAtMDUwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNjoxNCBBTSBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDU6NDZQTSAtMDUw
MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IEludHJvZHVjZSBhIG5ldyBmbGFnLCBEUk1fTU9E
RV9EVU1CX0tFUk5FTF9NQVAsIGZvciBzdHJ1Y3QKPiA+ID4gZHJtX21vZGVfY3JlYXRlX2R1bWIu
IFRoaXMgZmxhZyBpcyBmb3IgaW50ZXJuYWwga2VybmVsIHVzZSB0byBpbmRpY2F0ZQo+ID4gPiBp
ZiBkdW1iIGJ1ZmZlciBhbGxvY2F0aW9uIG5lZWRzIGEga2VybmVsIG1hcHBpbmcuIFRoaXMgaXMg
bmVlZGVkIG9ubHkgZm9yCj4gPiA+IENNQSB3aGVyZSBjcmVhdGluZyBhIGtlcm5lbCBtYXBwaW5n
IG9yIG5vdCBoYXMgdG8gYmUgZGVjaWRlZCBhdCBhbGxvY2F0aW9uCj4gPiA+IHRpbWUgYmVjYXVz
ZSBjcmVhdGluZyBhIG1hcHBpbmcgb24gZGVtYW5kICh3aXRoIHZtYXAoKSkgaXMgbm90IGd1YXJh
bnRlZWQKPiA+ID4gdG8gd29yay4gU2V2ZXJhbCBkcml2ZXJzIGFyZSB1c2luZyBDTUEsIGJ1dCBu
b3QgdGhlIENNQSBoZWxwZXJzIGJlY2F1c2UKPiA+ID4gdGhleSBkaXN0aW5ndWlzaCBiZXR3ZWVu
IGtlcm5lbCBhbmQgdXNlcnNwYWNlIGFsbG9jYXRpb25zIHRvIGNyZWF0ZSBhCj4gPiA+IGtlcm5l
bCBtYXBwaW5nIG9yIG5vdC4KPiA+ID4KPiA+ID4gVXBkYXRlIHRoZSBjYWxsZXJzIG9mIGRybV9t
b2RlX2R1bWJfY3JlYXRlKCkgdG8gc2V0Cj4gPiA+IGRybV9tb2RlX2R1bWJfY3JlYXRlLmZsYWdz
IHRvIGFwcHJvcHJpYXRlIGRlZmF1bHRzLiBDdXJyZW50bHksIGZsYWdzIGNhbgo+ID4gPiBiZSBz
ZXQgdG8gYW55dGhpbmcgYnkgdXNlcnNwYWNlLCBidXQgaXMgdW51c2VkIHdpdGhpbiB0aGUga2Vy
bmVsLiBMZXQncwo+ID4gPiBmb3JjZSBmbGFncyB0byB6ZXJvIChubyBrZXJuZWwgbWFwcGluZykg
Zm9yIHVzZXJzcGFjZSBjYWxsZXJzIGJ5IGRlZmF1bHQuCj4gPiA+IEZvciBpbiBrZXJuZWwgY2xp
ZW50cywgc2V0IERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUCBieSBkZWZhdWx0LiBEcml2ZXJzCj4g
PiA+IGNhbiBvdmVycmlkZSB0aGlzIGFzIG5lZWRlZC4KPiA+ID4KPiA+ID4gQ2M6IERhdmlkIEFp
cmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+Cj4gPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jICAgICAgIHwgMSArCj4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2R1bWJfYnVmZmVycy5jIHwgNSArKysrLQo+ID4gPiAgaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oICAgICAgICB8IDIgKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2NsaWVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYwo+ID4gPiBp
bmRleCBkOWEyZTM2OTU1MjUuLmRiZmM4MDYxYjM5MiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ns
aWVudC5jCj4gPiA+IEBAIC0yNjQsNiArMjY0LDcgQEAgZHJtX2NsaWVudF9idWZmZXJfY3JlYXRl
KHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUK
PiA+ID4gICAgICAgZHVtYl9hcmdzLndpZHRoID0gd2lkdGg7Cj4gPiA+ICAgICAgIGR1bWJfYXJn
cy5oZWlnaHQgPSBoZWlnaHQ7Cj4gPiA+ICAgICAgIGR1bWJfYXJncy5icHAgPSBpbmZvLT5jcHBb
MF0gKiA4Owo+ID4gPiArICAgICBkdW1iX2FyZ3MuZmxhZ3MgPSBEUk1fTU9ERV9EVU1CX0tFUk5F
TF9NQVA7Cj4gPiA+ICAgICAgIHJldCA9IGRybV9tb2RlX2NyZWF0ZV9kdW1iKGRldiwgJmR1bWJf
YXJncywgY2xpZW50LT5maWxlKTsKPiA+ID4gICAgICAgaWYgKHJldCkKPiA+ID4gICAgICAgICAg
ICAgICBnb3RvIGVycl9kZWxldGU7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2R1bWJfYnVmZmVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+
ID4gPiBpbmRleCBkMThhNzQwZmUwZjEuLjc0YTEzZjE0YzE3MyAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jCj4gPiA+IEBAIC05Nyw3ICs5NywxMCBAQCBpbnQgZHJt
X21vZGVfY3JlYXRlX2R1bWIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4gIGludCBkcm1f
bW9kZV9jcmVhdGVfZHVtYl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmls
ZV9wcml2KQo+ID4gPiAgewo+ID4gPiAtICAgICByZXR1cm4gZHJtX21vZGVfY3JlYXRlX2R1bWIo
ZGV2LCBkYXRhLCBmaWxlX3ByaXYpOwo+ID4gPiArICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRl
X2R1bWIgKmFyZ3MgPSBkYXRhOwo+ID4gPiArCj4gPiA+ICsgICAgIGFyZ3MtPmZsYWdzID0gMDsK
PiA+Cj4gPiBJIHdvdWxkIHByZWZlciByZXR1cm5pbmcgYW4gZXJyb3IgaWYgZmxhZ3MgaXMgc2V0
IHRvIGEgbm9uLXplcm8gdmFsdWUsCj4gPiB0byBjYXRjaCB1c2Vyc3BhY2UgZXJyb3JzIGVhcmx5
LCBidXQgSSdtIGFsc28gd29ycmllZCBpdCB3b3VsZCBicmVhawo+ID4gZXhpc3RpbmcgdXNlcnNw
YWNlIGJ5IHVuY292ZXJpbmcgZXhpc3RpbmcgYnVncy4gU3RpbGwsIGlmIHdlIGxhdGVyIGFkZAo+
ID4gZmxhZ3MgdGhhdCB1c2Vyc3BhY2UgY2FuIHNldCwgdGhvc2UgZXhpc3RpbmcgYnVncyB3aWxs
IGJlIHRyaWdnZXJlZCwgc28KPiA+IHdlJ2xsIGhhdmUgdG8gZGVhbCB3aXRoIHRoZW0gYW55d2F5
LCBhbmQgd2UgY291bGQgYWxyZWFkeSBnaXZlIGl0IGEgdHJ5Lgo+IAo+IEkgd291bGQgbGlrZSB0
aGF0IHRvbywgYnV0IHRoZSBjb21tZW50IGp1c3QgYWJvdmUgdGhpcyBjb2RlIHRlbGxzIG1lCj4g
dGhhdCdzIGxpa2VseSB0byBicmVhayB0aGluZ3M6Cj4gCj4gICAgICAgICAvKgo+ICAgICAgICAg
ICogaGFuZGxlLCBwaXRjaCBhbmQgc2l6ZSBhcmUgb3V0cHV0IHBhcmFtZXRlcnMuIFplcm8gdGhl
bSBvdXQgdG8KPiAgICAgICAgICAqIHByZXZlbnQgZHJpdmVycyBmcm9tIGFjY2lkZW50YWxseSB1
c2luZyB1bmluaXRpYWxpemVkIGRhdGEuIFNpbmNlCj4gICAgICAgICAgKiBub3QgYWxsIGV4aXN0
aW5nIHVzZXJzcGFjZSBpcyBjbGVhcmluZyB0aGVzZSBmaWVsZHMgcHJvcGVybHkgd2UKPiAgICAg
ICAgICAqIGNhbm5vdCByZWplY3QgSU9DVEwgd2l0aCBnYXJiYWdlIGluIHRoZW0uCj4gICAgICAg
ICAgKi8KPiAKPiBNYXliZSB1c2Vyc3BhY2UgZG9lcyBjb3JyZWN0bHkgemVybyBvdXQgaW5wdXQg
cGFyYW1zLgoKQnV0IGlmIHRoYXQgaG9sZHMgdHJ1ZSwgaXQgbWVhbnMgdGhhdCB3ZSB3aWxsIG5l
dmVyIGJlIGFibGUgdG8gYWRkCnVzZXJzcGFjZSBmbGFncywgYXMgZG9pbmcgc28gY291bGQgYnJl
YWsgYXBwbGljYXRpb25zIGZvciB0aGUgc2FtZQpyZWFzb24uIFRoZSBmbGFnIGZpZWxkIHNob3Vs
ZCB0aHVzIGJlIG1hcmtlZCBhcyBkZXByZWNhdGVkIGZvciB1c2Vyc3BhY2UKdXNhZ2UuIEkgd29u
ZGVyIGhvdyBiaWcgdGhlIHJpc2sgaXMuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
