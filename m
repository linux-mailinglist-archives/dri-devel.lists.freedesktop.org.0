Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05010FB71
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E286E463;
	Tue,  3 Dec 2019 10:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B006E463
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:11:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8E33F28D3AF;
 Tue,  3 Dec 2019 10:11:54 +0000 (GMT)
Date: Tue, 3 Dec 2019 11:11:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 12/21] drm/bridge: Add an ->atomic_check() hook
Message-ID: <20191203111151.28d86f53@collabora.com>
In-Reply-To: <20191202170336.GP4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-13-boris.brezillon@collabora.com>
 <20191202170336.GP4929@pendragon.ideasonboard.com>
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

T24gTW9uLCAyIERlYyAyMDE5IDE5OjAzOjM2ICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+ID4gKwkvKioKPiA+ICsJICog
QGF0b21pY19jaGVjazoKPiA+ICsJICoKPiA+ICsJICogVGhpcyBtZXRob2QgaXMgcmVzcG9uc2li
bGUgZm9yIGNoZWNraW5nIGJyaWRnZSBzdGF0ZSBjb3JyZWN0bmVzcy4KPiA+ICsJICogSXQgY2Fu
IGFsc28gY2hlY2sgdGhlIHN0YXRlIG9mIHRoZSBzdXJyb3VuZGluZyBjb21wb25lbnRzIGluIGNo
YWluCj4gPiArCSAqIHRvIG1ha2Ugc3VyZSB0aGUgd2hvbGUgcGlwZWxpbmUgY2FuIHdvcmsgcHJv
cGVybHkuICAKPiAKPiBBcyBleHBsYWluZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgUkZDLCBJIHRo
aW5rIGl0J3MgYSBtaXN0YWtlIG5vdCB0bwo+IGRlZmluZSB0aGUgc2VtYW50aWNzIG9mIHRoaXMg
b3BlcmF0aW9uIHByZWNpc2VseSwgYW5kIGluIHBhcnRpY3VsYXIgbm90Cj4gdG8gZGVmaW5lIGV4
cGxpY3RseSB3aGF0IHBhcmFtZXRlcnMgYnJpZGdlIGRyaXZlcnMgYXJlIGFsbG93ZWQgdG8gbW9k
aWZ5Cj4gaGVyZS4gSSBob3dldmVyIGRvbid0IHdhbnQgdG8gbWFrZSB0aGlzIGEgcHJlcmVxdWlz
aXRlIGZvciB5b3VyIHNlcmllcywKPiBzbwo+IAo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gCj4gYnV0IEknbSBzdXJl
IHdlJ2xsIHJlZ3JldCB0aGlzIGxhdGVyIHdoZW4gZGlmZmVyZW50IGJyaWRnZXMgd2lsbCBoYXZl
Cj4gc2xpZ2h0bHkgaW5jb21wYXRpYmxlIGltcGxlbWVudGF0aW9ucy4KCk5vdGhpbmcgcHJldmVu
dHMgdXMgZnJvbSB3b3JraW5nIG9uIHRoaXMgY2xhcmlmaWNhdGlvbiBhZnRlciB0aGUgcGF0Y2gK
c2VyaWVzIGhhcyBiZWVuIG1lcmdlZC4gSSBqdXN0IHNhaWQgSSBjb3VsZG4ndCBjb21lIHVwIHdp
dGggYSBnb29kCnNldCBvZiBydWxlcyBvbiBteSBvd24sIGFzIEkgZG9uJ3QgcmVhbGx5IGtub3cg
d2hhdCBicmlkZ2UtPm1vZGVfZml4dXAoKQphbGxvd3MgdXMgdG8gbW9kaWZ5IGluIHRoZSBmaXJz
dCBwbGFjZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
