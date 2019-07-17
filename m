Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AE6C0D7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 20:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBB4899DE;
	Wed, 17 Jul 2019 18:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C164B899DE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 18:13:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D3B0420020;
 Wed, 17 Jul 2019 20:13:21 +0200 (CEST)
Date: Wed, 17 Jul 2019 20:13:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 05/10] drm/tinydrm: Clean up tinydrm_spi_transfer()
Message-ID: <20190717181320.GA6522@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-6-noralf@tronnes.org>
 <20190717130909.GA4852@ravnborg.org>
 <6698e266-4827-2ad5-0cd5-894620f7c10b@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6698e266-4827-2ad5-0cd5-894620f7c10b@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=az0ZLF7uAAAA:8
 a=FFvrCgZY7Eyv7umZ2d0A:9 a=fhG4adcTn91Ai2Fz:21 a=BufRbLQZvcxgfFjL:21
 a=wPNLvfGTeEIA:10 a=ApzzGE7FMTUA:10 a=Y5BLYH8yhGsA:10
 a=Ecm-UqGiPpeiKTWeDREx:22
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDY6MTg6MzlQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERlbiAxNy4wNy4yMDE5IDE1LjA5LCBza3JldiBT
YW0gUmF2bmJvcmc6Cj4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBhdCAwMTo1ODoxMlBNICswMjAw
LCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gPj4gUHJlcCB3b3JrIGJlZm9yZSBtb3ZpbmcgdGhl
IGZ1bmN0aW9uIHRvIG1pcGktZGJpLgo+ID4+Cj4gPj4gdGlueWRybV9zcGlfdHJhbnNmZXIoKSB3
YXMgbWFkZSB0byBzdXBwb3J0IG9uZSBjbGFzcyBvZiBkcml2ZXJzIGluCj4gPj4gZHJpdmVycy9z
dGFnaW5nL2ZidGZ0IHRoYXQgaGFzIG5vdCBiZWVuIGNvbnZlcnRlZCB0byBEUk0geWV0LCBzbyBz
dHJpcAo+ID4+IGF3YXkgdGhlIHVudXNlZCBmdW5jdGlvbmFsaXR5Ogo+ID4+IC0gU3RhcnQgYnl0
ZSAoaGVhZGVyKSBpcyBub3QgdXNlZC4KPiA+PiAtIE5vIGRyaXZlciByZWxpZXMgb24gdGhlIGF1
dG9tYXRpYyAxNi1iaXQgYnl0ZSBzd2FwcGluZyBvbiBsaXR0bGUgZW5kaWFuCj4gPj4gICBtYWNo
aW5lcyB3aXRoIFNQSSBjb250cm9sbGVycyBvbmx5IHN1cHBvcnRpbmcgOCBiaXRzIHBlciB3b3Jk
Lgo+ID4gCj4gPiBLZWVwaW5nIHVudXNlZCBjb2RlIGFyb3VuZCBpcyBuZXZlciBhIGdvb2QgaWRl
YS4KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBzaG91bGQgd2Ugbm90IHRyeSB0byBnZXQgdGhlIGRy
aXZlciBpbiBxdWVzdGlvbnMKPiA+IHBvcnRlZCBzbyB3ZSBoYXZlIGEgdXNlciBhbmQgd2UgZG8g
bm90IG5lZWQgdG8gcmUtYWRkIHRoaXMgbGF0ZXI/Cj4gPiBXaGF0IGRyaXZlci9kaXNwbGF5IG5l
ZWRzIHRoaXM/Cj4gCj4gQXQgbGVhc3QgZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZiX2lsaTkzMnsw
LDV9LmMgYW5kIG1heWJlIGFub3RoZXIgb25lLCBJCj4gZG9uJ3QgcmVtZW1iZXIuIEkgaGF2ZW4n
dCB3b3JrZWQgb24gZmJ0ZnQgYWZ0ZXIgSSBkaWQgdGlueWRybS4KPiBJdCBsb29rcyBsaWtlIHRo
ZXkgc3RpbGwgc2VsbCB0aGUgaHkyOGI6Cj4gaHR0cHM6Ly93d3cuaG90bWN1LmNvbS8yOC10b3Vj
aC1zY3JlZW4tdGZ0LWxjZC13aXRoLWFsbC1pbnRlcmZhY2UtcC02My5odG1sCgpJIG9yZGVyZWQg
b25lLCB0aGVuIHdlIHdpbGwgc2VlIGlmIEkgYWxzbyBmaW5kIHRpbWUgdG8gcG9ydCB0aGUgZHJp
dmVyCmFuZCB0ZXN0IGl0LgoKPiBJJ20gbm90IHN1cmUgd2hhdCB0aGUgZnV0dXJlIG9mIGZidGZ0
IGlzLiBUaGUgaWRlYSB3YXMgdGhhdCB0aGUgZHJpdmVycwo+IHNob3VsZCBnZXQgY2xlYW5lZCB1
cCBhbmQgbW92ZSBvdXQgb2Ygc3RhZ2luZywgYnV0IHRoZW4gZmJkZXYgd2FzIGNsb3NlZAo+IGZv
ciBuZXcgZHJpdmVycyBhbmQgSSBkaWQgdGlueWRybS4gT25seSB0d28gZHJpdmVycyBoYXZlIGJl
ZW4gY29udmVydGVkCj4gYXBhcnQgZnJvbSBtaTAyODNxdCB0aGF0IEkgZGlkIGFuZCB0aGF0IGlz
IGh4ODM1NyB3aGljaCBFcmljIGRpZCBhbmQKPiBzdDc3MzUgdGhhdCBEYXZpZCBkaWQuIFRob3Nl
IDMgY292ZXJzIGEgbG90IG9mIHRoZSB0aW55IFNQSSBkaXNwbGF5Cj4gbWFya2VkLCBBZGFmcnVp
dCBzZWxscyB0aGVtLgo+IEl0J3MgYSBjaGlja2VuIGFuZCBlZ2cgcHJvYmxlbSwgYXMgbG9uZyBh
cyB0aGUgZmJ0ZnQgZHJpdmVycyBhcmUgdGhlcmUKPiBhbmQgd29ya2luZywgdGhlcmUncyBubyBp
bmNlbnRpdmUgdG8gY29udmVydCB0aGVtLgpJIGZvbGxvdyB0aGUgYXZlcmFnZSBqb2UgdXNlciBo
ZXJlLiBJZiBpdCB3b3JrcyB0aGVuIHdoeSB3b3JyeS4KQnV0IGlmIEkgZ2V0IEhXIGFuZCB0aW1l
IEkgY2FuIGF0IGxlYXN0IHBvcnQgb3ZlciBhIGZldyBvZiB0aGVtLgpJdCBsb29rcyBsaWtlIGl0
IHRha2VzIG1vcmUgdGltZSB0byB0ZXN0IHRoYW4gdG8gZG8gdGhlIHBvcnRpbmcuCgo+IFRoZXJl
J3MgYW5vdGhlciBjaGFsbGVuZ2Ugd2l0aCB0aGVzZSBkcml2ZXJzIHNpbmNlIGl0IGlzIHBvc3Np
YmxlIHRvCj4gb3ZlcnJpZGUgdGhlIGluaXQgc2VxdWVuY2UgaW4gRGV2aWNlIFRyZWUsIG1lYW5p
bmcgdGhleSBjYW4gd29yayB3aXRoCj4gYWxsIGtpbmRzIG9mIGRpc3BsYXlzIHdpdGhvdXQgd3Jp
dGluZyBhIG5ldyBkcml2ZXIuCj4gSSB3YXMgbm90IGFsbG93ZWQgdG8ga2VlcCB0aGF0IGZ1bmN0
aW9uYWxpdHkgb3V0c2lkZSBvZiBzdGFnaW5nLgo+IAo+IFdoZW4gSSdtIGRvbmUgd2l0aCB0aGUg
dGlueWRybSBjbGVhbnVwLCBJJ20gZ29pbmcgdG8gd29yayBvbiBhbiBpZGVhIEkKPiBoYXZlOiB0
dXJuIHRoZSBSYXNwYmVycnkgUGkgWmVybyBpbnRvIGEgJDUgVVNCIHRvCj4gSERNSS9TRFRWL0RT
SS9EUEkvU1BJLWRpc3BsYXkgYWRhcHRlci4gSSdtIHBsYW5uaW5nIHRvIHdyaXRlIGEgZ2VuZXJp
Ywo+IFVTQiBob3N0IGRpc3BsYXkgZHJpdmVyIHdpdGggYSBtYXRjaGluZyBMaW51eCBPVEcgZGV2
aWNlIGRyaXZlci4KPiBJIHBsYW4gdG8gbWFrZSBpdCBlYXN5IHRvIGRvIHRoZSBkaXNwbGF5IE9U
RyBzaWRlIG9uIGEgbWljcm9jb250cm9sbGVyCj4gYXMgd2VsbC4gVGhpcyB3YXkgaXQgd2lsbCBi
ZSBwb3NzaWJsZSBmb3IgbWFudWZhY3R1cmVycyB0byBkbyBVU0IKPiBjb25uZWN0ZWQgZGlzcGxh
eXMgb2YgKG5lYXJseSkgYWxsIHNpemVzIHdpdGhvdXQgaGF2aW5nIHRvIHdyaXRlIGEgTGludXgK
PiBkcml2ZXIuCkl0IHdpbGwgYmUgaW50ZXJlc3RpbmcgdG8gZm9sbG93IHRoaXMsIGtlZXAgdXMg
cG9zdGVkLgoKPiBJdCdzIGRpZmZpY3VsdCB0byBwcmVkaWN0IHRoZSBmdXR1cmUsIGJ1dCBwb3dl
cmZ1bCBtaWNyb2NvbnRyb2xsZXJzIGFyZQo+IGNoZWFwIG5vd2FkYXlzIHNvIG1heWJlIHRoZXNl
IFNQSSBkaXNwbGF5cyB3aWxsIGJlIGZhc2VkIG91dCBieSBjaGVhcAo+IFVTQiBkaXNwbGF5cy4g
VGhlIHVDIGNhbiByZXBsYWNlIHRoZSB0b3VjaCBjb250cm9sbGVyIGN1dHRpbmcgc29tZSBvZgo+
IHRoZSB1QyBjb3N0LgoKWWVwLCBpdCBpcyBpbXByZXNzaXZlIHdoYXQgb25lIGNhbiBnZXQgZm9y
IFVTRCA1IHRoZXNlIGRheXMuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
