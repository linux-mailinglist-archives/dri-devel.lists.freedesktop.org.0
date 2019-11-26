Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DD10A403
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 19:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8789D6E442;
	Tue, 26 Nov 2019 18:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B8B06E442
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 18:19:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99EDA1FB;
 Tue, 26 Nov 2019 10:19:38 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A0213F52E;
 Tue, 26 Nov 2019 10:19:38 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 37AF3682854; Tue, 26 Nov 2019 18:19:37 +0000 (GMT)
Date: Tue, 26 Nov 2019 18:19:37 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/fourcc: Fill out all block sizes for P10/12/16
Message-ID: <20191126181937.bfyfg32mhx2yprah@e110455-lin.cambridge.arm.com>
References: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Ayan Kumar Halder <ayan.halder@arm.com>, Randy Li <ayaka@soulik.info>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTA6MTQ6MTNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiAwIG1lYW5zIDEgYXMgdGhlIGRlZmF1bHQsIGJ1dCBpdCdzIG1pZ2h0eSBjb25mdXNp
bmcgaWYgdGhlIGJsb2NrIHNpemUKPiBmb3IgdGhlIGZpcnN0IHBsYW5lIGlzIHNwZWxsZWQgb3V0
IGV4cGxpY2l0bHksIGJ1dCBub3QgZm9yIHRoZSAybmQKPiBwbGFuZS4KPiAKPiBObyBjYzogc3Rh
YmxlIGJlY2F1c2UgdGhpcyBpcyBqdXN0IGNvbmZ1c2lvbiwgYnV0IDAgZnVuY3Rpb25hbCBpc3N1
ZS4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVn
YXJkcywKTGl2aXUKCj4gCj4gRml4ZXM6IDA1ZjhiYzgyZmM0MiAoImRybS9mb3VyY2M6IEFkZCBu
ZXcgUDAxMCwgUDAxNiB2aWRlbyBmb3JtYXQiKQo+IENjOiBEYW5pZWwgU3RvbmUgPGRhbmllbEBm
b29pc2hiYXIub3JnPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+IENjOiBSYW5keSBMaSA8YXlha2FAc291bGlrLmluZm8+Cj4gQ2M6IENsaW50
IFRheWxvciA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+Cj4gQ2M6IEF5YW4gS3VtYXIgSGFs
ZGVyIDxheWFuLmhhbGRlckBhcm0uY29tPgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4g
aW5kZXggYzYzMDA2NGNjZjQxLi5mZTc5Y2U4NTdjOGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3VyY2MuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMK
PiBAQCAtMjUzLDEzICsyNTMsMTMgQEAgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqX19k
cm1fZm9ybWF0X2luZm8odTMyIGZvcm1hdCkKPiAgCQkgIC5jaGFyX3Blcl9ibG9jayA9IHsgOCwg
MCwgMCB9LCAuYmxvY2tfdyA9IHsgMiwgMCwgMCB9LCAuYmxvY2tfaCA9IHsgMiwgMCwgMCB9LAo+
ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlIH0sCj4gIAkJeyAuZm9y
bWF0ID0gRFJNX0ZPUk1BVF9QMDEwLCAgICAgICAgICAgIC5kZXB0aCA9IDAsICAubnVtX3BsYW5l
cyA9IDIsCj4gLQkJICAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQsIDAgfSwgLmJsb2NrX3cgPSB7
IDEsIDAsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDAsIDAgfSwKPiArCQkgIC5jaGFyX3Blcl9ibG9j
ayA9IHsgMiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsgMSwgMSwgMCB9LCAuYmxvY2tfaCA9IHsgMSwg
MSwgMCB9LAo+ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiAg
CQl7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1AwMTIsCQkuZGVwdGggPSAwLCAgLm51bV9wbGFuZXMg
PSAyLAo+IC0JCSAgLmNoYXJfcGVyX2Jsb2NrID0geyAyLCA0LCAwIH0sIC5ibG9ja193ID0geyAx
LCAwLCAwIH0sIC5ibG9ja19oID0geyAxLCAwLCAwIH0sCj4gKwkJICAuY2hhcl9wZXJfYmxvY2sg
PSB7IDIsIDQsIDAgfSwgLmJsb2NrX3cgPSB7IDEsIDEsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDEs
IDAgfSwKPiAgCQkgICAuaHN1YiA9IDIsIC52c3ViID0gMiwgLmlzX3l1diA9IHRydWV9LAo+ICAJ
CXsgLmZvcm1hdCA9IERSTV9GT1JNQVRfUDAxNiwJCS5kZXB0aCA9IDAsICAubnVtX3BsYW5lcyA9
IDIsCj4gLQkJICAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQsIDAgfSwgLmJsb2NrX3cgPSB7IDEs
IDAsIDAgfSwgLmJsb2NrX2ggPSB7IDEsIDAsIDAgfSwKPiArCQkgIC5jaGFyX3Blcl9ibG9jayA9
IHsgMiwgNCwgMCB9LCAuYmxvY2tfdyA9IHsgMSwgMSwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwg
MCB9LAo+ICAJCSAgLmhzdWIgPSAyLCAudnN1YiA9IDIsIC5pc195dXYgPSB0cnVlfSwKPiAgCQl7
IC5mb3JtYXQgPSBEUk1fRk9STUFUX1AyMTAsCQkuZGVwdGggPSAwLAo+ICAJCSAgLm51bV9wbGFu
ZXMgPSAyLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDQsIDAgfSwKPiAtLSAKPiAyLjI0LjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0t
IAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3Js
ZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBj
b2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
