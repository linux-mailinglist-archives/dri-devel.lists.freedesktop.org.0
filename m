Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA41982CA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8376F6E8BA;
	Wed, 21 Aug 2019 18:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDC36E8BA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 18:30:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AD3C2699FC;
 Wed, 21 Aug 2019 19:30:51 +0100 (BST)
Date: Wed, 21 Aug 2019 20:30:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 00/11] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Message-ID: <20190821203047.06730da4@collabora.com>
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAxMDo0MDo1OCArMDIwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBUaGlzIHBhdGNoc2V0IGlzIGJhc2VkIG9uIEJv
cmlzJ3MgImRybTogQWRkIHN1cHBvcnQgZm9yIGJ1cy1mb3JtYXQgbmVnb3RpYXRpb24iIFJGQyBh
dCBbMV0KClNtYWxsIGNsYXJpZmljYXRpb24uIE5laWwncyB3b3JrIGluIGJhc2VkIG9uIGEgc2xp
Z2h0bHkgZGlmZmVyZW50CnZlcnNpb24gb2YgbXkgUkZDIFs0XSAoSSBwbGFuIHRvIHBvc3QgYSB2
MiB2ZXJ5IHNvb24pLgoKPiBwYXRjaHNldCB0byBpbXBsZW1lbnQgOgo+IC0gYmFzaWMgYnVzLWZv
cm1hdCBuZWdvdGlhdGlvbiBmb3IgRFctSERNSQo+IC0gYWR2YW5jZWQgSERNSTIuMCBZVVY0MjAg
YnVzLWZvcm1hdCBuZWdvdGlhdGlvbiBmb3IgRFctSERNSQo+IAo+IEFuZCB0aGUgY291bnRlcnBh
cnQgaW1wbGVtZW50YXRpb24gaW4gdGhlIEFtbG9naWMgTWVzb24gVlBVIGR3LWhkbWkgZ2x1ZSA6
Cj4gLSBiYXNpYyBidXMtZm9ybWF0IG5lZ290aWF0aW9uIHRvIHNlbGVjdCBZVVY0NDQgYnVzLWZv
cm1hdCBhcyBEVy1IRE1JIGlucHV0Cj4gLSBZVVY0MjAgc3VwcG9ydCB3aGVuIEhETUkyLjAgWVVW
NDIwIG1vZGVzZXQKPiAKPiBUaGlzIGlzIGEgZm9sbG93LXVwIGZyb20gdGhlIHByZXZpb3VzIGF0
dGVtcHRzIDoKPiAtICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1JMi4wIFlVVjQyMCA0
azYwIiBhdCBbMl0KPiAtICJkcm0vbWVzb246IEFkZCBzdXBwb3J0IGZvciBIRE1JMi4wIDRrNjAi
IGF0IFszXQo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
bXNnaWQvMjAxOTA4MDgxNTExNTAuMTYzMzYtMS1ib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bQo+IFsyXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAx
OTA1MjAxMzM3NTMuMjM4NzEtMS1uYXJtc3Ryb25nQGJheWxpYnJlLmNvbQo+IFszXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMTU0OTAyMjg3My00MDU0OS0x
LWdpdC1zZW5kLWVtYWlsLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tCgpbNF1odHRwczovL2dpdGh1
Yi5jb20vYmJyZXppbGxvbi9saW51eC0wZGF5L2NvbW1pdHMvZHJtLWJyaWRnZS1idXNmbXQtMgoK
PiAKPiBOZWlsIEFybXN0cm9uZyAoMTEpOgo+ICAgZml4dXAhIGRybS9icmlkZ2U6IEFkZCB0aGUg
bmVjZXNzYXJ5IGJpdHMgdG8gc3VwcG9ydCBidXMgZm9ybWF0Cj4gICAgIG5lZ290aWF0aW9uCj4g
ICBkcm0vbWVzb246IHZlbmM6IG1ha2UgZHJtX2Rpc3BsYXlfbW9kZSBjb25zdAo+ICAgZHJtL21l
c29uOiBtZXNvbl9kd19oZG1pOiBzd2l0Y2ggdG8gZHJtX2JyaWRnZV9mdW5jcwo+ICAgZHJtL2Jy
aWRnZTogc3lub3BzeXM6IGR3LWhkbWk6IGFkZCBiYXNpYyBicmlkZ2VfYXRvbWljX2NoZWNrCj4g
ICBkcm0vYnJpZGdlOiBzeW5vcHN5czogZHctaGRtaTogdXNlIG5lZ29jaWF0ZWQgYnVzIGZvcm1h
dHMKPiAgIGRybS9tZXNvbjogZHctaGRtaTogc3RvcCBlbmZvcmNpbmcgaW5wdXRfYnVzX2Zvcm1h
dAo+ICAgZHJtL2JyaWRnZTogZHctaGRtaTogYWxsb3cgeWNiY3I0MjAgbW9kZXMgZm9yID49IDB4
MjAwYQo+ICAgZHJtL2JyaWRnZTogc3lub3BzeXM6IGR3LWhkbWk6IGFkZCA0MjAgbW9kZSBmb3Jt
YXQgbmVnb2NpYXRpb24KPiAgIGRybS9tZXNvbjogdmVuYzogYWRkIHN1cHBvcnQgZm9yIFlVVjQy
MCBzZXR1cAo+ICAgZHJtL21lc29uOiB2Y2xrOiBhZGQgc3VwcG9ydCBmb3IgWVVWNDIwIHNldHVw
Cj4gICBkcm0vbWVzb246IEFkZCBZVVY0MjAgb3V0cHV0IHN1cHBvcnQKPiAKPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAgOTcgKysrKysrKysrKysrKysrLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jICAgICAgICAgICAgICB8ICAgNiArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jICAgICB8IDEzNSArKysrKysrKysr
KysrKysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgICAgICAg
IHwgIDkzICsrKysrKysrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNs
ay5oICAgICAgICB8ICAgNyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5j
ICAgICAgICB8ICAgOCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5oICAg
ICAgICB8ICAxMyArKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmNfY3Zicy5j
ICAgfCAgIDMgKy0KPiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAg
fCAgIDEgKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDI5NSBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlv
bnMoLSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
