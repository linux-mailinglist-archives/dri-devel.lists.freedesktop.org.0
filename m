Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CD9E494
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705E8898E8;
	Tue, 27 Aug 2019 09:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2262898E8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:40:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 099D82F0;
 Tue, 27 Aug 2019 11:40:20 +0200 (CEST)
Date: Tue, 27 Aug 2019 12:40:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20190827094014.GM5054@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <ae7bbfac-56ad-7193-d328-f3e2008ad0e9@ti.com>
 <20190826135141.GF5031@pendragon.ideasonboard.com>
 <3ebdf5ff-4269-7ce8-d742-913966dcdfda@ti.com>
 <20190827092951.GK5054@pendragon.ideasonboard.com>
 <13ac0cd0-3a07-2ff2-2ba9-260f0ea14785@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13ac0cd0-3a07-2ff2-2ba9-260f0ea14785@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566898821;
 bh=xzKLOH/iCp+bbFtXqBtjUBhOroJqMs8R3pl+wPr9nZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYe+Abi4Fy6dXNiKzxODBRz8HRWuyuzfeLft/6fYRF2lE161fDTOGRPdMLo/TYILu
 h+BFpYZ+kGAf2UZ1SE1rio25SWwxzmGD9CS6bSRwkL6i6kbZ6vTYdmv3Po0Do2C8WP
 n16PYCrepaySRovpVz4n9jfpe8Z4oq+cOHwH+jig=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDEyOjMyOjQ2UE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDI3LzA4LzIwMTkgMTI6MjksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAxMDozNDo1OUFNICswMzAwLCBUb21p
IFZhbGtlaW5lbiB3cm90ZToKPiA+PiBPbiAyNi8wOC8yMDE5IDE2OjUxLCBMYXVyZW50IFBpbmNo
YXJ0IHdyb3RlOgo+ID4+PiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAwMzoxNToyM1BNICswMzAw
LCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiA+Pj4+IE9uIDIwLzA4LzIwMTkgMDQ6MTYsIExhdXJl
bnQgUGluY2hhcnQgd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4+IFRoZSBwYXRjaGVzIGNhbiBiZSBmb3Vu
ZCBhdAo+ID4+Pj4+Cj4gPj4+Pj4gCWdpdDovL2xpbnV4dHYub3JnL3BpbmNoYXJ0bC9tZWRpYS5n
aXQgb21hcGRybS9icmlkZ2UvZGV2ZWwKPiA+Pj4+Cj4gPj4+PiBJIHRvb2sgeW91ciBicmFuY2gs
IGJvb3RlZCBBTTUgRVZNIChJIHNlZSB5b3UgaGFkIHRoZSBoYWNrIGR0cyBwYXRjaCBpbiB5b3Vy
IGJyYW5jaCksIGFuZDoKPiA+Pj4+Cj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVy
cy9tZWRpYS9jZWMvY2VjLmtvCj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2NmYmNvcHlhcmVhLmtvCj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGlu
dXgvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2NmYmltZ2JsdC5rbwo+ID4+Pj4gaW5zbW9kIG5m
cy93b3JrL2xpbnV4L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9jZmJmaWxscmVjdC5rbwo+ID4+
Pj4gaW5zbW9kIG5mcy93b3JrL2xpbnV4L2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWxfb3JpZW50
YXRpb25fcXVpcmtzLmtvCj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJpdmVycy9ncHUv
ZHJtL2RybS5rbwo+ID4+Pj4gaW5zbW9kIG5mcy93b3JrL2xpbnV4L2RyaXZlcnMvZ3B1L2RybS9k
cm1fa21zX2hlbHBlci5rbwo+ID4+Pj4gaW5zbW9kIG5mcy93b3JrL2xpbnV4L2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktdGZwNDEwLmtvCj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGludXgvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmtvCj4gPj4+PiBpbnNtb2QgbmZzL3dvcmsvbGlu
dXgvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5rbwo+ID4+Pj4gaW5zbW9kIG5mcy93
b3JrL2xpbnV4L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUua28KPiA+Pj4+IFsg
ICAyNS40ODcwMDJdIHBhbmVsLXNpbXBsZSBkaXNwbGF5OiBkaXNwbGF5IHN1cHBseSBwb3dlciBu
b3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgo+ID4+Pj4gWyAgIDI1LjQ5NTI0MV0gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPj4+PiBbICAgMjUuNDk5OTAwXSBX
QVJOSU5HOiBDUFU6IDAgUElEOiAzMDMgYXQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jOjM3OCBwYW5lbF9zaW1wbGVfcHJvYmUrMHgzNGMvMHgzYjQgW3BhbmVsX3NpbXBsZV0K
PiA+Pj4KPiA+Pj4gSG93IGFtIEkgZXhwZWN0ZWQgdG8gc25lYWsgcGF0Y2hlcyBpbiBpZiB5b3Ug
dGVzdCB0aGVtID8gOi0pCj4gPj4+Cj4gPj4+IFRoaXMgaGFzIGJlZW4gaW50cm9kdWNlZCBieSBh
IHJlY2VudCByZWJhc2UsIGFuZCBJJ3ZlIG9ubHkgdGVzdGVkIHRoZQo+ID4+PiBzZXJpZXMgb24g
dGhlIHBhbmRhYm9hcmQgc2luY2UgdGhlbi4gSXQgbG9va3MgbGlrZSB0aGUgcHJvYmxlbSBjb21l
cwo+ID4+PiBmcm9tCj4gPj4+Cj4gPj4+IGNvbW1pdCBiOGEyOTQ4ZmEyYjNhNWE2ZGE2N2ZkNTdh
YTAxYzczMThkNzk1MTI1Cj4gPj4+IEF1dGhvcjogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Cj4gPj4+IERhdGU6ICAgVGh1IEp1bCAxMSAxMzozNDo1MyAyMDE5IC0wNzAwCj4gPj4+
Cj4gPj4+ICAgICAgIGRybS9wYW5lbDogc2ltcGxlOiBBZGQgYWJpbGl0eSB0byBvdmVycmlkZSB0
eXBpY2FsIHRpbWluZwo+ID4+Pgo+ID4+PiB3aGljaCBicmVha3Mgb3VyIG91dC1vZi10cmVlIERU
LiBBcyBhIHNob3J0IHRlcm0gZml4IEkgY2FuIHNpbXBseSBkcm9wCj4gPj4+IHRoZSBwYW5lbCB0
aW1pbmdzIGZyb20gRFQsIGJ1dCBJIHRoaW5rIHRoaXMgaXNzdWUgY2FuIGFmZmVjdCBtb3JlCj4g
Pj4KPiA+PiBTbyBqdXN0IHJlbW92aW5nIHRoZSB0aW1pbmdzIGZyb20gdGhlIHBhbmVsJ3Mgbm9k
ZSBzaG91bGQgYmUgZW5vdWdoPwo+ID4+IFN0aWxsIGNyYXNoaW5nIGZvciBtZSwgYWx0aG91Z2gg
dGhlIHBhbmVsIHdhcm5pbmcgZ29lcyBhd2F5Lgo+ID4gCj4gPiBNeSBiYWQsIHlvdSBhbHNvIG5l
ZWQgdGhlIGZvbGxvd2luZyBwYXRjaCB0aGF0IEkgd2lsbCBpbmNsdWRlIGluIHYzLgo+IAo+IFRo
YW5rcywgYnV0IEkgZ3Vlc3MgSSBuZWVkIHNvbWV0aGluZyBtb3JlOgo+IAo+IGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYzoyMzg0OjM6IGVycm9yOiDigJhjb25zdCBzdHJ1Y3Qg
Cj4gcGFuZWxfZGVzY+KAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGNvbm5lY3Rvcl90eXBl4oCZ
Cj4gICAgLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0RQSSwKClllcywgeW91
IGFsc28gbmVlZCB0byBhcHBseSB0aGlzIG9uIHRvcCBvZiB2MyB3aGljaCBJIGhhdmVuJ3QgcG9z
dGVkIHlldAo6LSkgWW91IGNhbiBqdXN0IGZldGNoIG15IG9tYXBkcm0vYnJpZGdlL2RldmVsIGJy
YW5jaCwgSSd2ZSBwdXNoZWQgdGhlCmxhdGVzdCB2ZXJzaW9uIHRoZXJlLgoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
