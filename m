Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DA1082A0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 10:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0289EBB;
	Sun, 24 Nov 2019 09:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1689EBB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 09:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 3DEDB28F6B1
Message-ID: <da4b669f24a91380f098c892da5cf40cbb200b01.camel@collabora.com>
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Eric Anholt
 <eric@anholt.net>, Inki Dae <inki.dae@samsung.com>
Date: Sun, 24 Nov 2019 18:34:36 +0900
In-Reply-To: <20191124083222.657619ee@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <947ed9253bf501636e035698336c80c8af0743e0.camel@collabora.com>
 <20191124083222.657619ee@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDE5LTExLTI0IGF0IDA4OjMyICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6
Cj4gT24gU3VuLCAyNCBOb3YgMjAxOSAwOTo0Njo0MSArMDkwMAo+IEV6ZXF1aWVsIEdhcmNpYSA8
ZXplcXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBCb3JpcywgTmVpbCwKPiA+
IAo+ID4gT24gV2VkLCAyMDE5LTEwLTIzIGF0IDE3OjQ0ICswMjAwLCBCb3JpcyBCcmV6aWxsb24g
d3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgYXQgYWRkaW5nIHN1cHBvcnQgZm9y
IHJ1bnRpbWUgYnVzLWZvcm1hdAo+ID4gPiBuZWdvdGlhdGlvbiBiZXR3ZWVuIGFsbCBlbGVtZW50
cyBvZiB0aGUKPiA+ID4gJ2VuY29kZXIgLT4gYnJpZGdlcyAtPiBjb25uZWN0b3IvZGlzcGxheScg
c2VjdGlvbiBvZiB0aGUgcGlwZWxpbmUuCj4gPiA+IAo+ID4gPiBJbiBvcmRlciB0byBzdXBwb3J0
IHRoYXQsIHdlIG5lZWQgZHJtIGJyaWRnZXMgdG8gZnVsbHkgdGFrZSBwYXJ0IGluIHRoZQo+ID4g
PiBhdG9taWMgc3RhdGUgdmFsaWRhdGlvbiBwcm9jZXNzLCB3aGljaCByZXF1aXJlcyBhZGRpbmcg
YQo+ID4gPiBkcm1fYnJpZGdlX3N0YXRlIGFuZCBhIG5ldyBkcm1fYnJpZGdlX2Z1bmNzLmF0b21p
Y19jaGVjaygpIGhvb2suCj4gPiA+IE9uY2UgdGhvc2UgYmFzaWMgYnVpbGRpbmcgYmxvY2tzIGFy
ZSBpbiBwbGFjZSwgd2UgY2FuIGFkZCBuZXcgaG9va3MgdG8KPiA+ID4gYWxsb3cgYnVzIGZvcm1h
dCBuZWdvdGlhdGlvbiAodGhvc2UgYXJlIGNhbGxlZCBqdXN0IGJlZm9yZSAgCj4gPiA+IC0+YXRv
bWljX2NoZWNrKCkpLiBUaGUgYnVzIGZvcm1hdCBzZWxlY3Rpb24gaXMgZG9uZSBhdCBydW50aW1l
IGJ5ICAKPiA+ID4gdGVzdGluZyBhbGwgcG9zc2libGUgY29tYmluYXRpb25zIGFjcm9zcyB0aGUg
d2hvbGUgYnJpZGdlIGNoYWluIHVudGlsCj4gPiA+IG9uZSBpcyByZXBvcnRlZCB0byB3b3JrLgo+
ID4gPiAKPiA+ID4gTWFqb3IgY2hhbmdlcyBzaW5jZSB2MjoKPiA+ID4gKiBHZXQgcmlkIG9mIHRo
ZSBkdW1teSBicmlkZ2UgZW1iZWRkZWQgaW4gZHJtX2VuY29kZXIgYW5kIGxldCBlbmNvZGVyCj4g
PiA+ICAgZHJpdmVycyBwcm92aWRlIHRoZWlyIG93biBicmlkZ2UgZWxlbWVudAo+ID4gPiAqIENs
YXJpZnkgQVBJcyBhbmQgaW1wcm92ZSB0aGUgZG9jCj4gPiA+ICogUHJvcGFnYXRlIGJ1cyBmbGFn
cyBieSBkZWZhdWx0Cj4gPiA+IAo+ID4gPiBNYWpvciBjaGFuZ2VzIHNpbmNlIHRoZSBSRkM6Cj4g
PiA+IAo+ID4gPiAqIEFkZCBhIGR1bW15IGJyaWRnZSB0byB0aGUgZHJtX2VuY29kZXIgb2JqZWN0
IHNvIHRoYXQgdmM0IGFuZCBleHlub3MKPiA+ID4gICBEU0kgZHJpdmVycyBjYW4gaW1wbGVtZW50
IHRoZSBwcmVfZW5hYmxlL3Bvc3RfZGlzYWJsZSBob29rcyBpbnN0ZWFkCj4gPiA+ICAgb2YgbWFu
dWFsbHkgc2V0dGluZyBlbmNvZGVyLT5icmlkZ2UgdG8gTlVMTCB0byBjb250cm9sIHRoZQo+ID4g
PiAgIGVuYWJsZS9kaXNhYmxlIHNlcXVlbmNlLiBUaGlzIGNoYW5nZSBpcyBhbHNvIGEgZmlyc3Qg
c3RlcCB0b3dhcmRzCj4gPiA+ICAgZHJtX2JyaWRnZS9kcm1fZW5jb2RlciB1bmlmaWNhdGlvbi4g
TmV3IGVuY29kZXIgZHJpdmVycyBzaG91bGQKPiA+ID4gICBzdG9wIGltcGxlbWVudGluZyBkcm1f
ZW5jb2Rlcl9oZWxwZXJfZnVuY3MgYW5kIHN3aXRjaCB0bwo+ID4gPiAgIGRybV9icmlkZ2VfZnVu
Y3MuIEV4aXN0aW5nIGRyaXZlcnMgY2FuIGJlIGNvbnZlcnRlZCBwcm9ncmVzc2l2ZWx5Cj4gPiA+
ICAgKGFscmVhZHkgaGF2ZSBhIGJyYW5jaCB3aGVyZSBJIHN0YXJ0ZWQgY29udmVydGluZyBzb21l
IG9mIHRoZW0gWzFdKQo+ID4gPiAqIHJld29yayB0aGUgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiB0
byBnaXZlIG1vcmUgY29udHJvbCB0byBicmlkZ2UKPiA+ID4gICBkcml2ZXJzIGluIHRoZSBzZWxl
Y3Rpb24gcHJvY2VzcyAoZHJpdmVyIGNhbiBzZWxlY3QgYXQgcnVudGltZSB3aGljaAo+ID4gPiAg
IGlucHV0IGJ1cyBmb3JtYXQgdGhleSBzdXBwb3J0IGZvciBhIHNwZWNpZmljIG91dHB1dCBidXMg
Zm9ybWF0IGJhc2VkCj4gPiA+ICAgb24gYW55IGluZm9ybWF0aW9uIGF2YWlsYWJsZSBpbiB0aGUg
Y29ubmVjdG9yLCBjcnRjIGFuZCBicmlkZ2Ugc3RhdGUuCj4gPiA+IAo+ID4gPiBBIG1vcmUgZGV0
YWlsZWQgY2hhbmdlbG9nIGlzIHByb3ZpZGVkIGluIGVhY2ggcGF0Y2guCj4gPiA+IAo+ID4gPiBU
aGlzIHBhdGNoIHNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlIFsyXS4KPiA+ID4gCj4gPiA+
IFRoYW5rcywKPiA+ID4gCj4gPiA+IEJvcmlzCj4gPiA+IAo+ID4gPiBbMV1odHRwczovL2dpdGh1
Yi5jb20vYmJyZXppbGxvbi9saW51eC0wZGF5L2NvbW1pdHMvZHJtLWVuY29kZXItYnJpZGdlCj4g
PiA+IFsyXWh0dHBzOi8vZ2l0aHViLmNvbS9iYnJlemlsbG9uL2xpbnV4LTBkYXkvY29tbWl0cy9k
cm0tYnJpZGdlLWJ1c2ZtdC12Mwo+ID4gPiAKPiA+ID4gKioqIEJMVVJCIEhFUkUgKioqCj4gPiA+
IAo+ID4gPiBCb3JpcyBCcmV6aWxsb24gKDIxKToKPiA+ID4gICBkcm0vdmM0OiBEZWNsYXJlIHRo
ZSBEU0kgZW5jb2RlciBhcyBhIGJyaWRnZSBlbGVtZW50Cj4gPiA+ICAgZHJtL2V4eW5vczogRG9u
J3QgcmVzZXQgYnJpZGdlLT5uZXh0Cj4gPiA+ICAgZHJtL2V4eW5vczogRGVjbGFyZSB0aGUgRFNJ
IGVuY29kZXIgYXMgYSBicmlkZ2UgZWxlbWVudAo+ID4gPiAgIGRybS9icmlkZ2U6IFJlbmFtZSBi
cmlkZ2UgaGVscGVycyB0YXJnZXRpbmcgYSBicmlkZ2UgY2hhaW4KPiA+ID4gICBkcm0vYnJpZGdl
OiBJbnRyb2R1Y2UgZHJtX2JyaWRnZV9jaGFpbl9nZXRfbmV4dF9icmlkZ2UoKQo+ID4gPiAgIGRy
bTogU3RvcCBhY2Nlc3NpbmcgZW5jb2Rlci0+YnJpZGdlIGRpcmVjdGx5ICAKPiA+IAo+ID4gUGF0
Y2hlcyAxIHRvIDYgc2VlbSB0byBiZSByZXZpZXdlZCwgYW5kIGFwcGVhciBhcyBhIGdvb2QKPiA+
IHN0ZXAgZm9yd2FyZC4KPiAKPiBBRkFJQ1QsIHBhdGNoIDEgYW5kIDMgYXJlIG5vdCByZXZpZXdl
ZCwgd2hpY2ggaXMga2luZCBvZiBibG9ja2luZyBtZQo+IGZvciBwYXRjaCA0LTYuIEkgY2FuIChh
bmQgcGxhbiB0bykgYXBwbHkgcGF0Y2ggMi4KCkFoLCB5b3UgYXJlIHJpZ2h0LiBMZXQncyBhZGQg
RXJpYyBmb3IgdmM0IGFuZCBJbmtpIGZvciBleHlub3MuCgpGb3IgcmVmZXJlbmNlLCBoZXJlIGlz
IHRoZSBzZXJpZXM6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2
ZWwvbGlzdC8/c2VyaWVzPTE5MjM1OQoKVGhhbmtzLApFemVxdWllbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
