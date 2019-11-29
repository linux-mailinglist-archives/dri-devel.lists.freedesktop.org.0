Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC010DB21
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 22:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228F6E957;
	Fri, 29 Nov 2019 21:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF306E957
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 21:36:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1FB5F283BCB;
 Fri, 29 Nov 2019 21:36:33 +0000 (GMT)
Date: Fri, 29 Nov 2019 22:36:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 7/8] drm/panfrost: Add the panfrost_gem_mapping concept
Message-ID: <20191129223629.3aaab761@collabora.com>
In-Reply-To: <20191129201459.GS624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-8-boris.brezillon@collabora.com>
 <20191129201459.GS624164@phenom.ffwll.local>
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
Cc: stable@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSAyMToxNDo1OSArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwMjo1OTowN1BNICsw
MTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2Yg
cGVyLUZEIGFkZHJlc3Mgc3BhY2UsIHRoZSBzYW1lIEJPIGNhbiBiZSBtYXBwZWQKPiA+IGluIGRp
ZmZlcmVudCBhZGRyZXNzIHNwYWNlIGlmIHRoZSBCTyBpcyBnbG9iYWxseSB2aXNpYmxlIChHRU1f
RkxJTkspICAKPiAKPiBBbHNvIGRtYS1idWYgc2VsZi1pbXBvcnRzIGZvciB3YXlsYW5kL2RyaTMg
Li4uCgpJbmRlZWQsIEknbGwgZXh0ZW5kIHRoZSBjb21taXQgbWVzc2FnZSB0byBtZW50aW9uIHRo
YXQgY2FzZS4KCj4gCj4gPiBhbmQgb3BlbmVkIGluIGRpZmZlcmVudCBjb250ZXh0LiBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdAo+ID4gdGFrZSBjYXNlIGludG8gYWNjb3VudCwg
YW5kIGF0dGFjaGVzIHRoZSBtYXBwaW5nIGRpcmVjdGx5IHRvIHRoZQo+ID4gcGFuZnJvc3RfZ2Vt
X29iamVjdC4KPiA+IAo+ID4gTGV0J3MgY3JlYXRlIGEgcGFuZnJvc3RfZ2VtX21hcHBpbmcgc3Ry
dWN0IGFuZCBhbGxvdyBtdWx0aXBsZSBtYXBwaW5ncwo+ID4gcGVyIEJPLgo+ID4gCj4gPiBUaGUg
bWFwcGluZ3MgYXJlIHJlZmNvdW50ZWQsIHdoaWNoIGhlbHBzIHNvbHZlIGFub3RoZXIgcHJvYmxl
bSB3aGVyZQo+ID4gbWFwcGluZ3Mgd2VyZSB0ZWFyZWQgZG93biAoR0VNIGhhbmRsZSBjbG9zZWQg
YnkgdXNlcnNwYWNlKSB3aGlsZSBHUFUKPiA+IGpvYnMgYWNjZXNzaW5nIHRob3NlIEJPcyB3ZXJl
IHN0aWxsIGluLWZsaWdodC4gSm9icyBub3cga2VlcCBhCj4gPiByZWZlcmVuY2Ugb24gdGhlIG1h
cHBpbmdzIHRoZXkgdXNlLiAgCj4gCj4gdWggd2hhdC4KPiAKPiB0YmggdGhpcyBzb3VuZHMgYmFk
IGVub3VnaCAoYXMgaW4gaG93IGRpZCBhIGRlc2t0b3Agb24gcGFuZnJvc3QgZXZlciB3b3JrKQoK
V2VsbCwgd2UgZGlkbid0IGRpc2NvdmVyIHRoaXMgcHJvYmxlbSB1bnRpbCByZWNlbnRseSBiZWNh
dXNlOgoKMS8gV2UgaGF2ZSBhIEJPIGNhY2hlIGluIG1lc2EsIGFuZCB1bnRpbCByZWNlbnRseSwg
dGhpcyBjYWNoZSBjb3VsZApvbmx5IGdyb3cgKG5vIGVudHJ5IGV2aWN0aW9uIGFuZCBubyBNQURW
SVNFIHN1cHBvcnQpLCBtZWFuaW5nIHRoYXQgQk9zCndlcmUgc3RheWluZyBhcm91bmQgZm9yZXZl
ciB1bnRpbCB0aGUgYXBwIHdhcyBraWxsZWQuCgoyLyBNYXBwaW5ncyB3ZXJlIHRlYXJlZCBkb3du
IGF0IEJPIGRlc3RydWN0aW9uIHRpbWUgYmVmb3JlIGNvbW1pdAphNWVmYjRjOWE1NjIgKCJkcm0v
cGFuZnJvc3Q6IFJlc3RydWN0dXJlIHRoZSBHRU0gb2JqZWN0IGNyZWF0aW9uIiksIGFuZApqb2Jz
IGFyZSByZXRhaW5pbmcgcmVmZXJlbmNlcyB0byBhbGwgdGhlIEJPIHRoZXkgYWNjZXNzLgoKMy8g
VGhlIG1lc2EgZHJpdmVyIHdhcyBzZXJpYWxpemluZyBHUFUgam9icywgYW5kIG9ubHkgcmVsZWFz
aW5nIHRoZSBCTwpyZWZlcmVuY2Ugd2hlbiB0aGUgam9iIHdhcyBkb25lICh3YWl0IG9uIHRoZSBj
b21wbGV0aW9uIGZlbmNlKS4gVGhpcwpoYXMgcmVjZW50bHkgYmVlbiBjaGFuZ2VkLCBhbmQgbm93
IEJPcyBhcmUgcmV0dXJuZWQgdG8gdGhlIGNhY2hlIGFzCnNvb24gYXMgdGhlIGpvYiBoYXMgYmVl
biBzdWJtaXR0ZWQgdG8gdGhlIGtlcm5lbC4gV2hlbiB0aGF0CmhhcHBlbnMsdGhvc2UgQk9zIGFy
ZSBtYXJrZWQgcHVyZ2VhYmxlIHdoaWNoIG1lYW5zIHRoZSBrZXJuZWwgY2FuCnJlY2xhaW0gdGhl
bSB3aGVuIGl0J3MgdW5kZXIgbWVtb3J5IHByZXNzdXJlLgoKU28geWVzLCBrZXJuZWwgNS40IHdp
dGggYSByZWNlbnQgbWVzYSB2ZXJzaW9uIGlzIGN1cnJlbnRseSBzdWJqZWN0IHRvCkdQVSBwYWdl
LWZhdWx0IHN0b3JtcyB3aGVuIHRoZSBzeXN0ZW0gc3RhcnRzIHJlY2xhaW1pbmcgbWVtb3J5LgoK
PiB0aGF0IEkgdGhpbmsgeW91IHJlYWxseSB3YW50IGEgZmV3IGlndHMgdG8gdGVzdCB0aGlzIHN0
dWZmLgoKSSdsbCBzZWUgd2hhdCBJIGNhbiBjb21lIHVwIHdpdGggKG5vdCBzdXJlIGhvdyB0byBl
YXNpbHkgZGV0ZWN0CnBhZ2VmYXVsdHMgZnJvbSB1c2Vyc3BhY2UpLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
