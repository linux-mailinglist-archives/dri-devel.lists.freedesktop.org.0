Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3A907CF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 20:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CF76E358;
	Fri, 16 Aug 2019 18:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0726E358
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 18:39:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEB0F2AF;
 Fri, 16 Aug 2019 20:39:17 +0200 (CEST)
Date: Fri, 16 Aug 2019 21:39:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190816183905.GA17858@pendragon.ideasonboard.com>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <20190816173105.GA9934@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816173105.GA9934@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565980757;
 bh=k+hPtt88O7seqsthehznT+CbcesRdJ4OCTJIfsY3iz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ufZnHf02bBApsGuvXjkiqPNHvYTQSKHcuCTbqaLGAuEXplVJAxSVZ2946ZKFtG+Cl
 Kz6kFKO1npZWNBtevTl3PTZ0qv4RKwaF4qE9n3bZPKBjJpZkAugsn73+p9KGkVk3zf
 drSbwz8/GtkYtuYHJnk5ugKbBbxpWZkCkK4SDsUs=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDc6MzE6MDVQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQKPiAKPiBUaGFua3MgZm9yIGJlYXRpbmcgbWUgb24g
dGhpcyEKPiAKPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwMzoyMjoyN1BNICswMzAwLCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gU3RhbmRhcmQgRFJNIHBhbmVsIGRyaXZlcnMgZm9yIHNl
dmVyYWwgcGFuZWxzIHVzZWQgYnkgb21hcGZiMiBhcmUgbm93Cj4gPiBhdmFpbGFibGUuIFRoZWly
IG1vZHVsZSBuYW1lIGNsYXNoZXMgd2l0aCB0aGUgbW9kdWxlcyBmcm9tCj4gPiBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9kaXNwbGF5cy8sIHBhcnQgb2YgdGhlIGRlcHJlY2F0ZWQgb21hcGZiMiBm
YmRldgo+ID4gZHJpdmVyLiBBcyBvbWFwZmIyIGNhbiBvbmx5IGJlIGNvbXBpbGVkIHdoZW4gdGhl
IG9tYXBkcm0gZHJpdmVyIGlzCj4gPiBkaXNhYmxlZCwgYW5kIHRoZSBEUk0gcGFuZWwgZHJpdmVy
cyBhcmUgdXNlbGVzcyBpbiB0aGF0IGNhc2UsIG1ha2UgdGhlCj4gPiBvbWFwZmIyIHBhbmVscyBk
ZXBlbmQgb24gdGhlIHN0YW5kYXJkIERSTSBwYW5lbHMgYmVpbmcgZGlzYWJsZWQgdG8gZml4Cj4g
PiB0aGUgbmFtZSBjbGFzaC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZyB8IDUgKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnIGIvZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZwo+ID4gaW5kZXggOGMx
YzVhNGNmZTE4Li43NDQ0MTZkYzUzMGUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCj4gPiBAQCAtNDksNiArNDksNyBA
QCBjb25maWcgRkJfT01BUDJfUEFORUxfRFNJX0NNCj4gPiAgY29uZmlnIEZCX09NQVAyX1BBTkVM
X1NPTllfQUNYNTY1QUtNCj4gPiAgCXRyaXN0YXRlICJBQ1g1NjVBS00gUGFuZWwiCj4gPiAgCWRl
cGVuZHMgb24gU1BJICYmIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiA+ICsJZGVwZW5kcyBvbiBE
Uk1fUEFORUxfU09OWV9BQ1g1NjVBS00gPSBuCj4gCj4gV291bGQ6Cj4gCWRlcGVuZHMgb24gIURS
TV9QQU5FTF9TT05ZX0FDWDU2NUFLTQo+IAo+IGRvIHRoZSBzYW1lPwo+IAo+IEV4YW1wbGU6Cj4g
Y29uZmlnIEZCX0lOVEVMCj4gICAgICAgICB0cmlzdGF0ZSAiSW50ZWwgODMwTS84NDVHLzg1MkdN
Lzg1NUdNLzg2NUcvOTE1Ry85NDVHLzk0NUdNLzk2NUcvOTY1R00gc3VwcG9ydCIKPiAgICAgICAg
IGRlcGVuZHMgb24gRkIgJiYgUENJICYmIFg4NiAmJiBBR1BfSU5URUwgJiYgRVhQRVJUCj4gCS4u
Lgo+ICAgICAgICAgZGVwZW5kcyBvbiAhRFJNX0k5MTUKPiAKPiAKPiBEUk1fOTE1IGlzIGEgdHJp
c3RhdGUgc3ltYm9sLgo+IAo+IEl0IGlzIG1heWJlIGJpa2VzaGVkZGluZywgYnV0IHRoZSAhPFNZ
TUJPTD4gc2VlbXMgbW9yZSBsb2dpY2FsL3JlYWRhYmxlIHRvIG1lLgoKVGhlIHR3byBhcmUgZXF1
aXZhbGVudCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgc28gSSdtIGZpbmUgd2l0aCAhPFNZTUJPTD4u
CldvdWxkIHlvdSBjaGFuZ2UgdGhhdCB3aGVuIGFwcGx5aW5nLCBvciBzaG91bGQgSSBzZW5kIGEg
djIgPwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
