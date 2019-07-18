Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A826D253
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 18:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959546E43D;
	Thu, 18 Jul 2019 16:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43CE6E42F;
 Thu, 18 Jul 2019 16:48:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17404642-1500050 for multiple; Thu, 18 Jul 2019 17:46:43 +0100
MIME-Version: 1.0
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190718161507.2047-3-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
Message-ID: <156346840026.24728.936589728458336617@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Date: Thu, 18 Jul 2019 17:46:40 +0100
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTYW0gUmF2bmJvcmcgKDIwMTktMDctMTggMTc6MTQ6NTgpCj4gZHJtX3ByaW50Lmgg
dXNlZCBEUk1fTkFNRSAtIHRodXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBmcm9tCj4gaW5jbHVkZS9k
cm0vZHJtX3ByaW50LmggPT4gdWFwaS9kcm0vZHJtLmgKPiAKPiBIYXJkY29kZSB0aGUgbmFtZSAi
ZHJtIiB0byBicmVhayB0aGlzIGRlcGVuZGVuY3kuCj4gVGhlIGlkZWEgaXMgdGhhdCB0aGVyZSBz
aGFsbCBiZSBhIG1pbmltYWwgZGVwZW5kZW5jeQo+IGJldHdlZW4gaW5jbHVkZS9kcm0vKiBhbmQg
dWFwaS8qCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwg
PHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2Vh
bnBhdWxAY2hyb21pdW0ub3JnPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9kcm1fcHJpbnQuaCB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9wcmludC5oIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiBpbmRleCBhNWQ2ZjJmM2U0MzAu
Ljc2MGQxYmQwZWFmMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ICsr
KyBiL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4gQEAgLTMyLDggKzMyLDYgQEAKPiAgI2luY2x1
ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgo+ICAKPiAt
I2luY2x1ZGUgPGRybS9kcm0uaD4KPiAtCj4gIC8qKgo+ICAgKiBET0M6IHByaW50Cj4gICAqCj4g
QEAgLTI4Nyw3ICsyODUsNyBAQCB2b2lkIGRybV9lcnIoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4p
Owo+ICAvKiBNYWNyb3MgdG8gbWFrZSBwcmludGsgZWFzaWVyICovCj4gIAo+ICAjZGVmaW5lIF9E
Uk1fUFJJTlRLKG9uY2UsIGxldmVsLCBmbXQsIC4uLikgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiAtICAgICAgIHByaW50ayMjb25jZShLRVJOXyMjbGV2ZWwgIlsiIERSTV9OQU1FICJd
ICIgZm10LCAjI19fVkFfQVJHU19fKQo+ICsgICAgICAgcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZl
bCAiW2RybV0gIiBmbXQsICMjX19WQV9BUkdTX18pCgpJIGd1ZXNzIEknbSB0aCBvbmx5IG9uZSB3
aG8KCiN1bmRlZiBEUk1fTkFNRQojZGVmaW5lIERSTV9OQU1FIGk5MTUKCmp1c3Qgc28gdGhhdCBJ
IGRpZG4ndCBoYXZlIGluYW5lIGxvZ3M/CgpPbmUgbWlnaHQgc3VnZ2VzdCB0aGF0IGluc3RlYWQg
b2YgaGFyZGNvZGluZyBpdCwgZm9sbG93IHRoZSBwcl9mbXQoKQpwYXR0ZXJuIGFuZCBvbmx5IGFk
ZCAiW2RybV0iIGZvciB0aGUgZHJtIGNvcmUuCgpFdmVuIHRoZW4gaXQgc28gdXNlbGVzcyAod2hp
Y2ggZHJtIGRyaXZlciBpcyB0aGlzIG1lc3NhZ2UgZm9yPz8/KSB0aGF0IEkKd2FudCB0byByZW1v
dmUgdGhlbSBhbGwgOigKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
