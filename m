Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5C110425
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 19:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609FE6E0B6;
	Tue,  3 Dec 2019 18:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9666E0B6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 18:19:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4DF9309;
 Tue,  3 Dec 2019 19:19:32 +0100 (CET)
Date: Tue, 3 Dec 2019 20:19:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191203181924.GU4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203141515.3597631-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575397173;
 bh=cBB4j+7hkCsBm/IXK9DIP4kp1uIXKZ/+DCGVNlsPr1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p+CtxNTA+gZlqDwPLyEEK72fUFWR6FFq+hD+tZWz+BO1CzlktoMonO5K4T3zidB7M
 A2enTxKE2ptJsvNpZvTRmx6W6cJiRywD4zuM0bUJLS+S29A6q3sjaG536wsYu5EsHC
 bDMhzubkXiE65TD0MfV/NEfC53sAbDC3BjytcPtQ=
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

SGkgQm9yaXMsCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwMzoxNTowNFBNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWltcyBhdCBhZGRpbmcgc3Vw
cG9ydCBmb3IgcnVudGltZSBidXMtZm9ybWF0Cj4gbmVnb3RpYXRpb24gYmV0d2VlbiBhbGwgZWxl
bWVudHMgb2YgdGhlCj4gJ2VuY29kZXIgLT4gYnJpZGdlcyAtPiBjb25uZWN0b3IvZGlzcGxheScg
c2VjdGlvbiBvZiB0aGUgcGlwZWxpbmUuCj4gCj4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0LCB3
ZSBuZWVkIGRybSBicmlkZ2VzIHRvIGZ1bGx5IHRha2UgcGFydCBpbiB0aGUKPiBhdG9taWMgc3Rh
dGUgdmFsaWRhdGlvbiBwcm9jZXNzLCB3aGljaCByZXF1aXJlcyBhZGRpbmcgYQo+IGRybV9icmlk
Z2Vfc3RhdGUgYW5kIGEgbmV3IGRybV9icmlkZ2VfZnVuY3MuYXRvbWljX2NoZWNrKCkgaG9vay4K
PiBPbmNlIHRob3NlIGJhc2ljIGJ1aWxkaW5nIGJsb2NrcyBhcmUgaW4gcGxhY2UsIHdlIGNhbiBh
ZGQgbmV3IGhvb2tzIHRvCj4gYWxsb3cgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiAodGhvc2UgYXJl
IGNhbGxlZCBqdXN0IGJlZm9yZQo+IC0+YXRvbWljX2NoZWNrKCkpLiBUaGUgYnVzIGZvcm1hdCBz
ZWxlY3Rpb24gaXMgZG9uZSBhdCBydW50aW1lIGJ5Cj4gdGVzdGluZyBhbGwgcG9zc2libGUgY29t
YmluYXRpb25zIGFjcm9zcyB0aGUgd2hvbGUgYnJpZGdlIGNoYWluIHVudGlsCj4gb25lIGlzIHJl
cG9ydGVkIHRvIHdvcmsuCj4gCj4gTm8gTWFqb3IgY2hhbmdlcyBpbiB0aGlzIHY0LiBJIHRoaW5r
IEkgYWRkcmVzc2VkIGFsbCBjb21tZW50cyBJIGdvdAo+IGZyb20gTmVpbCBhbmQgTGF1cmVudCAo
dGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3cyBCVFcpLiBOb3RlIHRoYXQKPiB0aGlzIHZl
cnNpb24gb25seSBjb250YWlucyBjb3JlIGNoYW5nZXMuIE9uY2UgdGhvc2UgY2hhbmdlcyBhcmUg
bWVyZ2VkCj4gSSdsbCBzZW5kIHRoZSBpbXgvcGFuZWwvbHZkcy1jb2RlYyBzcGVjaWZpYyBiaXRz
LgoKSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGZhc3QtdHJhY2sgcGF0Y2hlcyAwMSB0
byAwNyAoYSBiaXQKc2VsZmlzaGx5IGFzIEkgd291bGQgaGF2ZSBhIG5lZWQgZm9yIHRoZW0gaW4g
b21hcGRybSA6LSkpLCBidXQgc3RhcnRpbmcKZnJvbSAwOCBJIHdvbmRlciBpZiBpdCB3b3VsZG4n
dCBtYWtlIG1vcmUgc2Vuc2UgdG8gbWVyZ2UgdGhlbSB3aXRoIHRoZQppbXgvcGFuZWwvbHZkcy1j
b2RlYyBiaXRzIHRvIGhhdmUgYSB1c2VyLgoKPiBBIG1vcmUgZGV0YWlsZWQgY2hhbmdlbG9nIGlz
IHByb3ZpZGVkIGluIGVhY2ggcGF0Y2guCj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYWxzbyBh
dmFpbGFibGUgaGVyZSBbMV0uCj4gCj4gVGhhbmtzLAo+IAo+IEJvcmlzCj4gCj4gWzFdaHR0cHM6
Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGludXgtMGRheS9jb21taXRzL2RybS1icmlkZ2UtYnVz
Zm10LXY0Cj4gCj4gQm9yaXMgQnJlemlsbG9uICgxMSk6Cj4gICBkcm0vYnJpZGdlOiBSZW5hbWUg
YnJpZGdlIGhlbHBlcnMgdGFyZ2V0aW5nIGEgYnJpZGdlIGNoYWluCj4gICBkcm0vYnJpZGdlOiBJ
bnRyb2R1Y2UgZHJtX2JyaWRnZV9nZXRfbmV4dF9icmlkZ2UoKQo+ICAgZHJtOiBTdG9wIGFjY2Vz
c2luZyBlbmNvZGVyLT5icmlkZ2UgZGlyZWN0bHkKPiAgIGRybS9icmlkZ2U6IE1ha2UgdGhlIGJy
aWRnZSBjaGFpbiBhIGRvdWJsZS1saW5rZWQgbGlzdAo+ICAgZHJtL2JyaWRnZTogQWRkIHRoZSBk
cm1fZm9yX2VhY2hfYnJpZGdlX2luX2NoYWluKCkgaGVscGVyCj4gICBkcm0vYnJpZGdlOiBBZGQg
dGhlIGRybV9icmlkZ2VfZ2V0X3ByZXZfYnJpZGdlKCkgaGVscGVyCj4gICBkcm0vYnJpZGdlOiBD
bGFyaWZ5IHRoZSBhdG9taWMgZW5hYmxlL2Rpc2FibGUgaG9va3Mgc2VtYW50aWNzCj4gICBkcm0v
YnJpZGdlOiBBZGQgYSBkcm1fYnJpZGdlX3N0YXRlIG9iamVjdAo+ICAgZHJtL2JyaWRnZTogUGF0
Y2ggYXRvbWljIGhvb2tzIHRvIHRha2UgYSBkcm1fYnJpZGdlX3N0YXRlCj4gICBkcm0vYnJpZGdl
OiBBZGQgYW4gLT5hdG9taWNfY2hlY2soKSBob29rCj4gICBkcm0vYnJpZGdlOiBBZGQgdGhlIG5l
Y2Vzc2FyeSBiaXRzIHRvIHN1cHBvcnQgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbgo+IAo+ICAuLi4v
ZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMgICAgfCAgNDEgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyAgICAgICAgICAgICAgICAgIHwgIDM5ICsKPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgICAgICAgICAgIHwgIDUzICstCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgICAgICAgICAgICAgICAgICB8IDc1NiArKysrKysr
KysrKysrKystLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgICAgICAgICAgICAg
ICAgIHwgIDE1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgICAgICAg
ICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMg
ICAgICAgfCAgMTMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAg
ICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcF9icmlkZ2UuYyAg
ICAgICAgICB8ICAxMCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jICAg
ICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9lbmNvZGVy
LmMgICAgICAgIHwgICAzICstCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0
Yy5jICAgICAgICB8ICAxMCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYyAgICAg
ICAgICAgICAgICAgfCAgMTggKy0KPiAgaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oICAgICAgICAg
ICAgICAgICAgICAgIHwgICAzICsKPiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAg
ICAgICAgICAgICAgIHwgNDA0ICsrKysrKysrKy0KPiAgaW5jbHVkZS9kcm0vZHJtX2VuY29kZXIu
aCAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDExNzQg
aW5zZXJ0aW9ucygrKSwgMjE0IGRlbGV0aW9ucygtKQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
