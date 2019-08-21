Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559597F72
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 17:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8946E34A;
	Wed, 21 Aug 2019 15:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14FE6E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 15:53:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E009B28CC73;
 Wed, 21 Aug 2019 16:53:47 +0100 (BST)
Date: Wed, 21 Aug 2019 17:53:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC 06/19] drm/bridge: Create drm_bridge_chain_xx()
 wrappers
Message-ID: <20190821175345.6d29a34f@collabora.com>
In-Reply-To: <20190821144504.GF5433@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-7-boris.brezillon@collabora.com>
 <20190821144504.GF5433@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMSBBdWcgMjAxOSAxNzo0NTowNCArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNTox
MTozN1BNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBEUk0gYnJpZGdlcyBzaG91
bGQgbm90IGJlIG9wZXJhdGVkIGluZGVwZW5kZW50bHkuIExldCdzIHJlbmFtZSB0aGUKPiA+IGRy
bV9icmlkZ2VfeHh4KCkgaGVscGVycyB0aGF0IHRha2UgdGhlIGZpcnN0IGJyaWRnZSBvZiB0aGUg
Y2hhaW4gYW5kCj4gPiBpdGVyYXRlIG92ZXIgdGhlIHdob2xlIGNoYWluIGludG8gZHJtX2JyaWRn
ZV9jaGFpbl94eCgpLiBXZSBhbHNvIHBhc3MKPiA+IGl0IHRoZSBlbmNvZGVyIGNvbnRhaW5pbmcg
dGhlIGJyaWRnZSBjaGFpbiBpbnN0ZWFkIG9mIHRoZSBkZXJlZmVyZW5jaW5nCj4gPiBlbmNvZGVy
LT5icmlkZ2UuICAKPiAKPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhpcy4gSSBkbyBhZ3JlZSB0aGF0
IHRoZSBoZWxwZXJzIG9wZXJhdGUgb24gYSBjaGFpbiwKPiBidXQgSSB0aGluayB0aGV5J3JlIHVz
ZSBmb3IgY2FsbGluZyB0aGVtIG9uIGFueSBicmlkZ2UsIGVzcGVjaWFsbHkgaW4KPiBjb25qdW5j
dGlvbiB3aXRoIHlvdXIgd29yay4gVGhlIHdheSBJIHNlZSBpdCBpcyB0aGF0IHdoZW4gYSBicmlk
Z2UgaW4KPiB0aGUgY2hhaW4gbmVlZHMgYSBjdXN0b20gZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2Ug
KGZsYWdnZWQgYnkgc29tZSBraW5kCj4gb2YgZmxhZyBpbiB0aGUgYnJpZGdlIHN0cnVjdHVyZSks
IHRoZSBoZWxwZXJzIHdpbGwgbm90IGF1dG9tYXRpY2FsbHkKPiBwcm9wYWdhdGUgdGhlIGNhbGxz
IGRvd24gdGhlIGNoYWluLCBhbmQgbGV0IHRoZSBicmlkZ2UgY2FsbCB0aGUgcHJlL3Bvc3QKPiBl
bmFibGUvZGlzYWJsZSBvcGVyYXRpb25zIG9uIHRoZSBkb3duc3RyZWFtIGJyaWRnZS4gVGhpcyBt
ZWFucyB0aGF0Cj4gdGhvc2UgYnJpZGdlcyB3aXRoIHNwZWNpYWwgbmVlZHMgd2lsbCBoYXZlIHRv
IGNhbGwgdGhlIGhlbHBlcnMgb24gdGhlCj4gbmV4dCBicmlkZ2UgZG93biB0aGUgY2hhaW4sIGFu
ZCB0aHVzIHJlcXVpcmUga2VlcGluZyB0aGUgYWJpbGl0eSB0byBkbwo+IHNvLgoKQWxzbyBjaGFu
Z2VkIG15IG1pbmQgb24gdGhpcyBvbmUgYWZ0ZXIgdGhlIGRpc2N1c3Npb24gd2UgaGFkLiBJCmtl
cHQgdGhlIHJlbmFtZSBwYXJ0IGJ1dCBkcm9wcGVyIHRoZSBzL2JyaWRnZS9lbmNvZGVyLyBjaGFu
Z2UuIFRoaXMgd2F5LApicmlkZ2VzIHRoYXQgbmVlZCB0byBjb250cm9sIHRoZSBlbmFibGUvZGlz
YWJsZSBzZXF1ZW5jZSBjYW4gdXNlIHRob3NlCmhlbHBlcnMgb24gYSBzdWItY2hhaW4gKHRoZSBj
aGFpbiBzdGFydGluZyBhdCB0aGUgYnJpZGdlIGVsZW1lbnQganVzdAphZnRlciB0aGVtKS4KCj4g
Cj4gV2UgY291bGQgb2YgY291cnNlIHByb3Bvc2UgdHdvIHNldHMgb2YgaGVscGVycywgb25lIHRh
a2luZyBhIGJyaWRnZQo+IHBvaW50ZXIsIGFuZCBhbm90aGVyIG9uZSB0YWtpbmcgYW4gZW5jb2Rl
ciBwb2ludGVyLCBidXQgSSB0aGluayBpdCdzIGEKPiBiaXQgb3ZlcmtpbGwuIEVzcGVjaWFsbHkg
aWYgeW91IGNvbnNpZGVyIG15IGNvbW1lbnRzIGVhcmxpZXIgaW4gdGhpcwo+IHNlcmllcyB3aGVy
ZSBJIHByb3Bvc2UgbW92aW5nIHRoZSBjdXN0b20gc2VxdWVuY2UgZmVhdHVyZSB0byBicmlkZ2Vz
Cj4gaW5zdGVhZCBvZiBlbmNvZGVycywgSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIHdpbGwgYmUg
bmVlZGVkLgoKQWdyZWVkLiBBcyBzYWlkIGFib3ZlLCBJIGtlcHQgdGhlIHJlbmFtZSBwYXJ0IG9m
IHRoaXMgcGF0Y2ggYmVjYXVzZSBJCnRoaW5rIGl0IGJldHRlciByZWZsZWN0cyB0aGUgZmFjdCB0
aGF0IHRob3NlIGhlbHBlcnMgYXJlIGFjdGluZyBvbiBhCmJyaWRnZSBjaGFpbiwgYW5kIG5vdCBh
IHNpbmdsZSBicmlkZ2UgZWxlbWVudC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
