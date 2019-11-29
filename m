Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55910DA13
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 20:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9AB6FA85;
	Fri, 29 Nov 2019 19:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34736FA80
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 19:24:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7776B291E9C;
 Fri, 29 Nov 2019 19:24:40 +0000 (GMT)
Date: Fri, 29 Nov 2019 20:24:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location
 constraint in panfrost_gem_object
Message-ID: <20191129202437.0a3c6c25@collabora.com>
In-Reply-To: <20191129184038.GK624164@phenom.ffwll.local>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
 <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
 <20191129151936.5fb18d2e@collabora.com>
 <20191129184038.GK624164@phenom.ffwll.local>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAxOTo0MDozOCArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwMzoxOTozNlBNICsw
MTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBPbiBGcmksIDI5IE5vdiAyMDE5IDE0OjEz
OjMzICswMDAwCj4gPiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90ZToK
PiA+ICAgCj4gPiA+IE9uIDI5LzExLzIwMTkgMTM6NTYsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTog
IAo+ID4gPiA+IEkndmUgc3BlbnQgaG91cnMgY2hhc2luZyBhIG1lbW9yeSBjb3JydXB0aW9uIHRo
YXQgd2FzIGNhdXNlZCBieQo+ID4gPiA+IGluc2VydGlvbiBvZiBhbiBleHRyYSBmaWVsZCBmaWVs
ZCBiZWZvcmUgLT5iYXNlLiBMZXQncyBkb2N1bWVudCB0aGUKPiA+ID4gPiBmYWN0IHRoYXQgYmFz
ZSBoYXMgdG8gYmUgdGhlIGZpcnN0IGZpZWxkIGluIHBhbmZyb3N0X2dlbV9vYmplY3QuCj4gPiA+
ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4gICAgCj4gPiA+IAo+ID4gPiBUaGlzIHNlZW1zIHRvIGJlIGEgbGlt
aXRhdGlvbiBpbXBvc2VkIGJ5IHRoZSBnZW1fY3JlYXRlX29iamVjdCgpCj4gPiA+IGNhbGxiYWNr
IC0gZS5nLiBpdCdzIGFzc3VtZWQgdGhhdCBrZnJlZSgpIGNhbiBiZSBkaXJlY3RseSBjYWxsZWQg
b24gdGhlCj4gPiA+IHJlc3VsdC4gVXNlZnVsIHRvIGhhdmUgdGhlIGRvY3VtZW50YXRpb24gdGhv
dWdoLiAgCj4gPiAKPiA+IE9oLCB5b3UncmUgcmlnaHQsIEkgZGlkbid0IGNhdGNoIHRoYXQgb25l
LiAgCj4gCj4gQXMgYSBnZW5lcmFsIHJ1bGUgb2YgdGh1bWIsIG5ldmVyIGluc2VydCBhbnl0aGlu
ZyBiZWZvcmUgYSBzdHJ1Y3QgbWVtYmVyCj4gY2FsbGVkIGJhc2UuIEV2ZW4gbW9yZSBzbyBpZiBp
dCdzIG9mIHRoZSBzYW1lIGtpbmQgb2YgJHRoaW5nLCBidXQgbGVzcwo+IHNwZXppYWxlZC4gVGhp
cyBwYXR0ZXJuIGlzIHNvIGNvbW1vbiBpdCdzIGZhaXJseSBvZnRlbiBub3QgZG9jdW1lbnRlZAo+
IGFueXdoZXJlLgoKSSBjb3VsZCBhcmd1ZSB0aGF0IGFueXRoaW5nIHVzaW5nIGNvbnRhaW5lcl9v
ZigpIGluIGl0cyB0b194eHgoKSBoZWxwZXIKaXMgbWlzbGVhZGluZyB0aGUgdXNlciBpbnRvIHRo
aW5raW5nIHRoZSBwb3NpdGlvbiBvZiB0aGUgYmFzZSBmaWVsZApkb2Vzbid0IG1hdHRlciAod2hp
Y2ggaXMgZXhhY3RseSB3aGF0IGhhcHBlbmVkIGhlcmUpLCBidXQgSSBmZWVsIGxpa2UgSQphbHJl
YWR5IGxvc3QgdGhpcyBiYXR0bGUsIHNvIEknbGwgc2ltcGx5IGRyb3AgdGhlIHBhdGNoLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
