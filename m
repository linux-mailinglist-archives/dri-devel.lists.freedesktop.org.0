Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F911DA5F5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 09:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AA86E9F4;
	Thu, 17 Oct 2019 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1606E9F4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:06:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 00:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,306,1566889200"; d="scan'208";a="221031393"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2019 00:06:40 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKzrr-0008G3-03; Thu, 17 Oct 2019 10:06:39 +0300
Date: Thu, 17 Oct 2019 10:06:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
Message-ID: <20191017070638.GB32742@smile.fi.intel.com>
References: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
 <20191017064426.30814-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017064426.30814-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-arm-kernel@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Mark Brown <broonie@kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6NDQ6MjZBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJbiBETUEgbW9kZSB3ZSBoYXZlIGEgbWF4aW11bSB0cmFuc2ZlciBzaXplLCBwYXN0
IHRoYXQgdGhlIGRyaXZlcgo+IGZhbGxzIGJhY2sgdG8gUElPIChzZWUgdGhlIGNoZWNrIGF0IHRo
ZSB0b3Agb2YgcHhhMnh4X3NwaV90cmFuc2Zlcl9vbmUpLgo+IEZhbGxpbmcgYmFjayB0byBQSU8g
Zm9yIGJpZyB0cmFuc2ZlcnMgZGVmZWF0cyB0aGUgcG9pbnQgb2YgYSBkbWEgZW5naW5lLAo+IGhl
bmNlIHNldCB0aGUgbWF4IHRyYW5zZmVyIHNpemUgdG8gaW5mb3JtIHNwaSBjbGllbnRzIHRoYXQg
dGhleSBuZWVkCj4gdG8gZG8gc29tZXRoaW5nIHNtYXJ0ZXIuCj4gCj4gVGhpcyB3YXMgdW5jb3Zl
cmVkIGJ5IHRoZSBkcm1fbWlwaV9kYmkgc3BpIHBhbmVsIGNvZGUsIHdoaWNoIGRvZXMKPiBsYXJn
ZSBzcGkgdHJhbnNmZXJzLCBidXQgc3RvcHBlZCBzcGxpdHRpbmcgdGhlbSBhZnRlcjoKPiAKPiBj
b21taXQgZTE0MzM2NGI0YzE3NzRmNjhlOTIzYTVhMGJiMGZjYTI4YWMyNTg4OAo+IEF1dGhvcjog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gRGF0ZTogICBGcmkgSnVsIDE5
IDE3OjU5OjEwIDIwMTkgKzAyMDAKPiAKPiAgICAgZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJt
X3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpCj4gCj4gQWZ0ZXIgdGhpcyBjb21taXQgdGhlIGNvZGUg
cmVsaWVkIG9uIHRoZSBzcGkgY29yZSB0byBzcGxpdCB0cmFuc2ZlcnMKPiBpbnRvIG1heCBkbWEt
YWJsZSBibG9ja3MsIHdoaWNoIGFsc28gcGFwZXJlZCBvdmVyIHRoZSBQSU8gZmFsbGJhY2sgaXNz
dWUuCj4gCj4gRml4IHRoaXMgYnkgc2V0dGluZyB0aGUgb3ZlcmFsbCBtYXggdHJhbnNmZXIgc2l6
ZSB0byB0aGUgRE1BIGxpbWl0LAo+IGJ1dCBvbmx5IHdoZW4gdGhlIGNvbnRyb2xsZXIgcnVucyBp
biBETUEgbW9kZS4KPiAKClRoYW5rIHlvdSwgRGFuaWVsIQoKPiBGaXhlczogZTE0MzM2NGI0YzE3
ICgiZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtX3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgpIikK
PiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiBDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogQW5keSBTaGV2Y2hl
bmtvIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBNYWNrIDxkYW5p
ZWxAem9ucXVlLm9yZz4KPiBDYzogSGFvamlhbiBaaHVhbmcgPGhhb2ppYW4uemh1YW5nQGdtYWls
LmNvbT4KPiBDYzogUm9iZXJ0IEphcnptaWsgPHJvYmVydC5qYXJ6bWlrQGZyZWUuZnI+Cj4gQ2M6
IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IC0tCj4g
djI6IEJyb3duIHBhcGVyIGJhZyBlZGl0aW9uLCBpdCBuZWVkcyB0byBiZSBhIGZ1bmN0aW9uIC4u
Lgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMgfCA3ICsrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktcHhhMnh4LmMgYi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKPiBpbmRleCBiYjZhMTRkMWFi
MGYuLjA2OGMyMTAzNzY3OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMK
PiArKysgYi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKPiBAQCAtMTYwMiw2ICsxNjAyLDExIEBA
IHN0YXRpYyBpbnQgcHhhMnh4X3NwaV9md190cmFuc2xhdGVfY3Moc3RydWN0IHNwaV9jb250cm9s
bGVyICpjb250cm9sbGVyLAo+ICAJcmV0dXJuIGNzOwo+ICB9Cj4gIAo+ICtzdGF0aWMgc2l6ZV90
IHB4YTJ4eF9zcGlfbWF4X2RtYV90cmFuc2Zlcl9zaXplKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkp
Cj4gK3sKPiArCXJldHVybiBNQVhfRE1BX0xFTjsKPiArfQo+ICsKPiAgc3RhdGljIGludCBweGEy
eHhfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gQEAgLTE3MDcsNiArMTcxMiw4IEBAIHN0YXRp
YyBpbnQgcHhhMnh4X3NwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
CX0gZWxzZSB7Cj4gIAkJCWNvbnRyb2xsZXItPmNhbl9kbWEgPSBweGEyeHhfc3BpX2Nhbl9kbWE7
Cj4gIAkJCWNvbnRyb2xsZXItPm1heF9kbWFfbGVuID0gTUFYX0RNQV9MRU47Cj4gKwkJCWNvbnRy
b2xsZXItPm1heF90cmFuc2Zlcl9zaXplID0KPiArCQkJCXB4YTJ4eF9zcGlfbWF4X2RtYV90cmFu
c2Zlcl9zaXplOwo+ICAJCX0KPiAgCX0KPiAgCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKV2l0aCBC
ZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
