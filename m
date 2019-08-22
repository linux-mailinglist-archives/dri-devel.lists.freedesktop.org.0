Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662FB99929
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3196E6E523;
	Thu, 22 Aug 2019 16:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937B46E50E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 16:29:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18C6E289AC9;
 Thu, 22 Aug 2019 17:29:13 +0100 (BST)
Date: Thu, 22 Aug 2019 18:29:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
Message-ID: <20190822182909.0073e6a2@collabora.com>
In-Reply-To: <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjo0NCArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBJbXBsZW1lbnQgdGhlIG5l
d2x5IGFkZGVkIGJyaWRnZSBjb25uZWN0b3Igb3BlcmF0aW9ucywgYWxsb3dpbmcgdGhlCj4gdXNh
Z2Ugb2YgZHJtX2JyaWRnZV9wYW5lbCB3aXRoIGRybV9icmlkZ2VfY29ubmVjdG9yLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMTggKysr
KysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+IGluZGV4IGY1YjhlNTUzMDFhYy4u
MWM3ZjViNjQ4ZjA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+IEBAIC02MCw3ICs2MCw3
IEBAIHN0YXRpYyBpbnQgcGFuZWxfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLAo+ICAJaW50IHJldDsKPiAgCj4gIAlpZiAoZmxhZ3MgJiBEUk1fQlJJREdFX0FUVEFDSF9O
T19DT05ORUNUT1IpCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJ
aWYgKCFicmlkZ2UtPmVuY29kZXIpIHsKPiAgCQlEUk1fRVJST1IoIk1pc3NpbmcgZW5jb2Rlclxu
Iik7Cj4gQEAgLTEyMyw2ICsxMjMsMTggQEAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX3Bvc3Rf
ZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAJZHJtX3BhbmVsX3VucHJlcGFy
ZShwYW5lbF9icmlkZ2UtPnBhbmVsKTsKPiAgfQo+ICAKPiArc3RhdGljIGludCBwYW5lbF9icmlk
Z2VfZ2V0X21vZGVzKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gKwkJCQkgIHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBwYW5lbF9icmlkZ2UgKnBh
bmVsX2JyaWRnZSA9IGRybV9icmlkZ2VfdG9fcGFuZWxfYnJpZGdlKGJyaWRnZSk7Cj4gKwo+ICsJ
LyoKPiArCSAqIEZJWE1FOiBkcm1fcGFuZWxfZ2V0X21vZGVzKCkgc2hvdWxkIHRha2UgdGhlIGNv
bm5lY3RvciBhcyBhbgo+ICsJICogYXJndW1lbnQuCj4gKwkgKi8KPiArCXJldHVybiBkcm1fcGFu
ZWxfZ2V0X21vZGVzKHBhbmVsX2JyaWRnZS0+cGFuZWwpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcyA9IHsK
PiAgCS5hdHRhY2ggPSBwYW5lbF9icmlkZ2VfYXR0YWNoLAo+ICAJLmRldGFjaCA9IHBhbmVsX2Jy
aWRnZV9kZXRhY2gsCj4gQEAgLTEzMCw2ICsxNDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9icmlkZ2VfZnVuY3MgcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcyA9IHsKPiAgCS5lbmFibGUg
PSBwYW5lbF9icmlkZ2VfZW5hYmxlLAo+ICAJLmRpc2FibGUgPSBwYW5lbF9icmlkZ2VfZGlzYWJs
ZSwKPiAgCS5wb3N0X2Rpc2FibGUgPSBwYW5lbF9icmlkZ2VfcG9zdF9kaXNhYmxlLAo+ICsJLmdl
dF9tb2RlcyA9IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMsCj4gIH07Cj4gIAo+ICAvKioKPiBAQCAt
MTc1LDYgKzE4OCw5IEBAIHN0cnVjdCBkcm1fYnJpZGdlICpkcm1fcGFuZWxfYnJpZGdlX2FkZChz
dHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKPiAgI2lmZGVmIENPTkZJR19PRgo+ICAJcGFuZWxfYnJp
ZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVsLT5kZXYtPm9mX25vZGU7Cj4gICNlbmRpZgo+ICsJ
cGFuZWxfYnJpZGdlLT5icmlkZ2Uub3BzID0gRFJNX0JSSURHRV9PUF9NT0RFUzsKPiArCS8qIEZJ
WE1FOiBUaGUgcGFuZWwgc2hvdWxkIHJlcG9ydCBpdHMgdHlwZS4gKi8KPiArCXBhbmVsX2JyaWRn
ZS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJOwoKU2hvdWxkbid0IHdlIHBh
dGNoIGFsbCBwYW5lbCBkcml2ZXJzIHRvIGV4cG9zZSB0aGlzIHR5cGUgYmVmb3JlIGRvaW5nCnRo
aXMgY2hhbmdlPyBJIG1lYW4sIHRoZSBjb25uZWN0b3IgdHlwZSBpcyBleHBvc2VkIHRvIHVzZXJz
cGFjZSwgYW5kIEkKd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHNvbWUgdXNlcnNwYWNlIGFwcHMv
bGlicyBkZWNpZGVkIHRvIGJhc2UgdGhlaXIKb3V0cHV0IHNlbGVjdGlvbiBsb2dpYyBvbiB0aGlz
IGZpZWxkLgoKPiAgCj4gIAlkcm1fYnJpZGdlX2FkZCgmcGFuZWxfYnJpZGdlLT5icmlkZ2UpOwo+
ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
