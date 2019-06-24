Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075DA5053B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 11:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD8890BC;
	Mon, 24 Jun 2019 09:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936D898B7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 09:02:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 02:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="155102346"
Received: from agusev-mobl1.ger.corp.intel.com (HELO [10.252.34.77])
 ([10.252.34.77])
 by orsmga008.jf.intel.com with ESMTP; 24 Jun 2019 02:00:25 -0700
Subject: Re: [PATCH] fbcon: Export fbcon_remap_all
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ca17f6dd-b691-b3ce-af28-46f4ba2fe0c7@linux.intel.com>
Date: Mon, 24 Jun 2019 11:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Hans de Goede <hdegoede@redhat.com>, kbuild test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-fbdev@vger.kernel.org, Yisheng Xie <ysxie@foxmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjQtMDYtMjAxOSBvbSAxMDozMiBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gRml4ZXMgbGlu
a2luZyBmYWlsIHdoZW4gZmJjb24vZmJkZXYgaXMgbW9kdWxlciBhbmQgdmdhc3dpdGNoZXJvbyBp
cwo+IGVuYWJsZWQ6Cj4KPiB4ODZfNjQtbGludXgtZ251LWxkOiBkcml2ZXJzL2dwdS92Z2Evdmdh
X3N3aXRjaGVyb28ubzogaW4gZnVuY3Rpb24gYHZnYV9zd2l0Y2h0b19zdGFnZTInOgo+IHZnYV9z
d2l0Y2hlcm9vLmM6KC50ZXh0KzB4OTk3KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZmJjb25f
cmVtYXBfYWxsJwo+Cj4gUmVwb3J0ZWQtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1
dWcub3JnLmF1Pgo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KPiBGaXhlczogMWNkNTFiNWQyMDBkICgidmdhc3dpdGNoZXJvbzogY2FsbCBmYmNvbl9yZW1h
cF9hbGwgZGlyZWN0bHkiKQo+IENjOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9y
Zy5hdT4KPiBDYzogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxt
YXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KPiBDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcu
Y29tPgo+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IENjOiBZaXNo
ZW5nIFhpZSA8eXN4aWVAZm94bWFpbC5jb20+Cj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVs
Lm9yZwo+IENjOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+
IENjOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwo+IC0t
Cj4gd3J0IG1lcmdpbmcgcHJvYmFibHkgYmVzdCBpZiBNYWFydGVuIGFkZHMgdGhpcyB0byB0aGUg
dG9waWMgYnJhbmNoIHdlCj4gaGF2ZSBhbHJlYWR5IGFuZCBzZW5kcyBvdXQgYW4gdXBkYXRlZCBw
dWxsIHJlcXVlc3QuCj4KPiBBcG9sb2dpZXMgZm9yIHRoZSBtZXNzLgo+IC1EYW5pZWwKPiAtLS0K
PiAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiY29uLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwo+IGluZGV4IGM5
MjM1YTJmNDJmOC4uMTk5Y2E3MjNjNzY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYmNvbi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMK
PiBAQCAtMzE5NCw2ICszMTk0LDcgQEAgdm9pZCBmYmNvbl9yZW1hcF9hbGwoc3RydWN0IGZiX2lu
Zm8gKmluZm8pCj4gIAl9Cj4gIAljb25zb2xlX3VubG9jaygpOwo+ICB9Cj4gK0VYUE9SVF9TWU1C
T0woZmJjb25fcmVtYXBfYWxsKTsKPiAgCj4gICNpZmRlZiBDT05GSUdfRlJBTUVCVUZGRVJfQ09O
U09MRV9ERVRFQ1RfUFJJTUFSWQo+ICBzdGF0aWMgdm9pZCBmYmNvbl9zZWxlY3RfcHJpbWFyeShz
dHJ1Y3QgZmJfaW5mbyAqaW5mbykKCkRpZCB5b3UgdGVzdCB0aGlzIG9uIGEgYWxsbW9kY29uZmln
PwoKZmJjb25fcmVtYXBfYWxsIGlzIGluIGEgbW9kdWxlLCB2Z2Egc3dpdGNoZXJvbyBpcyBidWls
dGluLCBldmVuIHdpdGggdGhpcyBwYXRjaCB5b3Ugd2lsbCBzdGlsbCBnZXQgdGhlIHNhbWUgY29t
cGlsZSBmYWlsdXJlLgoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
