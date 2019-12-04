Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F81126A1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D3F6F9E8;
	Wed,  4 Dec 2019 09:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998976FA06
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:10:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9238B291115;
 Wed,  4 Dec 2019 09:10:00 +0000 (GMT)
Date: Wed, 4 Dec 2019 10:09:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191204100957.15406559@collabora.com>
In-Reply-To: <20191203181924.GU4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203181924.GU4730@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzIERlYyAyMDE5IDIwOjE5OjI0ICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IE9u
IFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDAzOjE1OjA0UE0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgYXQgYWRkaW5nIHN1cHBvcnQgZm9yIHJ1
bnRpbWUgYnVzLWZvcm1hdAo+ID4gbmVnb3RpYXRpb24gYmV0d2VlbiBhbGwgZWxlbWVudHMgb2Yg
dGhlCj4gPiAnZW5jb2RlciAtPiBicmlkZ2VzIC0+IGNvbm5lY3Rvci9kaXNwbGF5JyBzZWN0aW9u
IG9mIHRoZSBwaXBlbGluZS4KPiA+IAo+ID4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0LCB3ZSBu
ZWVkIGRybSBicmlkZ2VzIHRvIGZ1bGx5IHRha2UgcGFydCBpbiB0aGUKPiA+IGF0b21pYyBzdGF0
ZSB2YWxpZGF0aW9uIHByb2Nlc3MsIHdoaWNoIHJlcXVpcmVzIGFkZGluZyBhCj4gPiBkcm1fYnJp
ZGdlX3N0YXRlIGFuZCBhIG5ldyBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19jaGVjaygpIGhvb2su
Cj4gPiBPbmNlIHRob3NlIGJhc2ljIGJ1aWxkaW5nIGJsb2NrcyBhcmUgaW4gcGxhY2UsIHdlIGNh
biBhZGQgbmV3IGhvb2tzIHRvCj4gPiBhbGxvdyBidXMgZm9ybWF0IG5lZ290aWF0aW9uICh0aG9z
ZSBhcmUgY2FsbGVkIGp1c3QgYmVmb3JlICAKPiA+IC0+YXRvbWljX2NoZWNrKCkpLiBUaGUgYnVz
IGZvcm1hdCBzZWxlY3Rpb24gaXMgZG9uZSBhdCBydW50aW1lIGJ5ICAKPiA+IHRlc3RpbmcgYWxs
IHBvc3NpYmxlIGNvbWJpbmF0aW9ucyBhY3Jvc3MgdGhlIHdob2xlIGJyaWRnZSBjaGFpbiB1bnRp
bAo+ID4gb25lIGlzIHJlcG9ydGVkIHRvIHdvcmsuCj4gPiAKPiA+IE5vIE1ham9yIGNoYW5nZXMg
aW4gdGhpcyB2NC4gSSB0aGluayBJIGFkZHJlc3NlZCBhbGwgY29tbWVudHMgSSBnb3QKPiA+IGZy
b20gTmVpbCBhbmQgTGF1cmVudCAodGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3cyBCVFcp
LiBOb3RlIHRoYXQKPiA+IHRoaXMgdmVyc2lvbiBvbmx5IGNvbnRhaW5zIGNvcmUgY2hhbmdlcy4g
T25jZSB0aG9zZSBjaGFuZ2VzIGFyZSBtZXJnZWQKPiA+IEknbGwgc2VuZCB0aGUgaW14L3BhbmVs
L2x2ZHMtY29kZWMgc3BlY2lmaWMgYml0cy4gIAo+IAo+IEkgdGhpbmsgaXQgd291bGQgbWFrZSBz
ZW5zZSB0byBmYXN0LXRyYWNrIHBhdGNoZXMgMDEgdG8gMDcgKGEgYml0Cj4gc2VsZmlzaGx5IGFz
IEkgd291bGQgaGF2ZSBhIG5lZWQgZm9yIHRoZW0gaW4gb21hcGRybSA6LSkpCgpXaWxsIGRvIHRo
YXQgZW5kIG9mIHRoaXMgd2Vlay4KCj4sIGJ1dCBzdGFydGluZwo+IGZyb20gMDggSSB3b25kZXIg
aWYgaXQgd291bGRuJ3QgbWFrZSBtb3JlIHNlbnNlIHRvIG1lcmdlIHRoZW0gd2l0aCB0aGUKPiBp
bXgvcGFuZWwvbHZkcy1jb2RlYyBiaXRzIHRvIGhhdmUgYSB1c2VyLgoKSSdkIHJlYWxseSBsaWtl
IHRvIHNlZSB0aGF0IGhhcHBlbiBlYXJseSBpbiB0aGlzIHJlbGVhc2UgY3ljbGUgc28gd2UKY2Fu
IGNhdGNoIGJ1Z3MgYmVmb3JlIHRob3NlIGNvbW1pdHMgcmVhY2ggTGludXMnIHRyZWUsIGFuZCB0
aGUKbHZkcy1jb2RlYyBjaGFuZ2VzIGRlcGVuZCBvbiB5b3VyIFBSLiBDYW4gd2UgbWFrZSBzdXJl
IHRoaXMgb25lIGlzCm1lcmdlZCBqdXN0IGFmdGVyIHRoZSBNVyBoYXMgY2xvc2VkIGFuZCB0aGUg
ZHJtLW5leHQgLT4gZHJtLW1pc2MtbmV4dApiYWNrIG1lcmdlIGRvbmUganVzdCBhZnRlciB0aGF0
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
