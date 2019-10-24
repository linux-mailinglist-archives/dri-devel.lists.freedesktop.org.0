Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36566E33DF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 15:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ABA6E3FB;
	Thu, 24 Oct 2019 13:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CDD6E3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 13:23:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 57F7828AE4A;
 Thu, 24 Oct 2019 14:23:01 +0100 (BST)
Date: Thu, 24 Oct 2019 15:22:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
Message-ID: <20191024152257.1357e313@collabora.com>
In-Reply-To: <b98ebd1b-8d95-38ba-ff26-51a70a7c3a1c@baylibre.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <b98ebd1b-8d95-38ba-ff26-51a70a7c3a1c@baylibre.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
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

T24gVGh1LCAyNCBPY3QgMjAxOSAxMzoyNzoxNiArMDIwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBoaSBCb3JpcywKPiAKPiBPbiAyMy8xMC8yMDE5
IDE3OjQ0LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhaW1z
IGF0IGFkZGluZyBzdXBwb3J0IGZvciBydW50aW1lIGJ1cy1mb3JtYXQKPiA+IG5lZ290aWF0aW9u
IGJldHdlZW4gYWxsIGVsZW1lbnRzIG9mIHRoZQo+ID4gJ2VuY29kZXIgLT4gYnJpZGdlcyAtPiBj
b25uZWN0b3IvZGlzcGxheScgc2VjdGlvbiBvZiB0aGUgcGlwZWxpbmUuCj4gPiAKPiA+IEluIG9y
ZGVyIHRvIHN1cHBvcnQgdGhhdCwgd2UgbmVlZCBkcm0gYnJpZGdlcyB0byBmdWxseSB0YWtlIHBh
cnQgaW4gdGhlCj4gPiBhdG9taWMgc3RhdGUgdmFsaWRhdGlvbiBwcm9jZXNzLCB3aGljaCByZXF1
aXJlcyBhZGRpbmcgYQo+ID4gZHJtX2JyaWRnZV9zdGF0ZSBhbmQgYSBuZXcgZHJtX2JyaWRnZV9m
dW5jcy5hdG9taWNfY2hlY2soKSBob29rLgo+ID4gT25jZSB0aG9zZSBiYXNpYyBidWlsZGluZyBi
bG9ja3MgYXJlIGluIHBsYWNlLCB3ZSBjYW4gYWRkIG5ldyBob29rcyB0bwo+ID4gYWxsb3cgYnVz
IGZvcm1hdCBuZWdvdGlhdGlvbiAodGhvc2UgYXJlIGNhbGxlZCBqdXN0IGJlZm9yZSAgCj4gPiAt
PmF0b21pY19jaGVjaygpKS4gVGhlIGJ1cyBmb3JtYXQgc2VsZWN0aW9uIGlzIGRvbmUgYXQgcnVu
dGltZSBieSAgCj4gPiB0ZXN0aW5nIGFsbCBwb3NzaWJsZSBjb21iaW5hdGlvbnMgYWNyb3NzIHRo
ZSB3aG9sZSBicmlkZ2UgY2hhaW4gdW50aWwKPiA+IG9uZSBpcyByZXBvcnRlZCB0byB3b3JrLgo+
ID4gCj4gPiBNYWpvciBjaGFuZ2VzIHNpbmNlIHYyOgo+ID4gKiBHZXQgcmlkIG9mIHRoZSBkdW1t
eSBicmlkZ2UgZW1iZWRkZWQgaW4gZHJtX2VuY29kZXIgYW5kIGxldCBlbmNvZGVyCj4gPiAgIGRy
aXZlcnMgcHJvdmlkZSB0aGVpciBvd24gYnJpZGdlIGVsZW1lbnQKPiA+ICogQ2xhcmlmeSBBUElz
IGFuZCBpbXByb3ZlIHRoZSBkb2MKPiA+ICogUHJvcGFnYXRlIGJ1cyBmbGFncyBieSBkZWZhdWx0
ICAKPiAKPiBTZWVtcyB5b3UgZm9yZ290IG15IHJldmlld2VkLWJ5cyBvbiBwYXRjaGVzIDUsIDgs
IDExICYgMTMKCk9vcHMsIGluZGVlZC4gQ2FuIHlvdSBhZGQgdGhlbSBiYWNrPwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
