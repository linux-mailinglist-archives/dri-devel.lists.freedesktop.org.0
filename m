Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0F241807
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6606E175;
	Tue, 11 Aug 2020 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571AA6E175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:12:05 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E036A804C8;
 Tue, 11 Aug 2020 10:12:02 +0200 (CEST)
Date: Tue, 11 Aug 2020 10:12:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
Message-ID: <20200811081201.GA470897@ravnborg.org>
References: <20200807180547.GA923146@ravnborg.org>
 <bc77eba7-a49b-15cf-f72f-6c78af015813@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc77eba7-a49b-15cf-f72f-6c78af015813@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=iox4zFpeAAAA:8 a=20KFwNOVAAAA:8
 a=d_3pEfQ1oISyZ1YTlTAA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDg6NTk6MTNBTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkgU2FtCj4gCj4gdGhhbmtzIGZvciB0YWtlbiBjYXJl
IG9mIHRoaXMgaXNzdWUuIEFscGhhIGlzIGEgcmFyZSBhcmNoaXRlY3R1cmUgdGhlc2UKPiBkYXlz
LiBIb3cgZG8geW91IGJ1aWxkIGFuZCB0ZXN0IGZvciBpdD8KCkkgYW0gb24gdWJ1bnR1IGhlcmUg
c28gSSBoYXZlIGluc3RhbGxlZDoKYXB0IGluc3RhbGwgZ2NjLWFscGhhLWxpbnV4LWdudQoKQW5k
IHRoZW4gYWxwaGEgaXMgb25lIG9mIHRoZSBhcmNoaXRlY3R1cmVzIEkgYnVpbGQgZm9yLgpNeSBm
dWxsIGxpc3Q6CmFyY2hzPSJhbHBoYSBhcm0gYXJtNjQgc3BhcmM2NCBpMzg2IHg4NiBwb3dlcnBj
IHMzOTAgcmlzY3Ygc2giCgpJIGJ1aWxkIHRoZXNlIGNvbmZpZ3M6CmNvbmZpZ3M9ImFsbG1vZGNv
bmZpZyBhbGx5ZXNjb25maWcgYWxsbm9jb25maWcgZGVmY29uZmlnIgoKSXQgdGFrZXMgYSB3aGls
ZSBzbyB1c3VhbGx5IEkgYnVpbGQgb25seSB0aGUgcmVsZXZhbnQgc3ViLXNldCBzdWNoIGFzCmRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvCgpJIGhhdmUsIHVuZm9ydHVuYXRlbHksIG5vIHRlc3Rpbmcu
IFdvdWxkIGxvdmUgc29tZXRoaW5nIHFlbXUgYmFzZWQgYnV0CmhhdmUgbmV2ZXIgaW52ZXN0ZWQg
dGltZSBpbnRvIHRoaXMuCgoJU2FtCgo+IAo+IEFtIDA3LjA4LjIwIHVtIDIwOjA1IHNjaHJpZWIg
U2FtIFJhdm5ib3JnOgo+ID4gV2hlbiBidWlsZGluZyBpbWdhZzIwMCBmb3IgdGhlIGFscGhhIGFy
Y2hpdGVjdHVyZSBpdCBmYWlscyBsaWtlIHRoaXM6Cj4gPiBtZ2FnMjAwX2Rydi5jOjIzMzo5OiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdm1hbGxvY+KAmQo+ID4g
ICAyMzMgfCAgYmlvcyA9IHZtYWxsb2Moc2l6ZSk7Cj4gPiAgICAgICB8ICAgICAgICAgXn5+fn5+
fgo+ID4gICAgICAgfCAgICAgICAgIGttYWxsb2MKPiA+IAo+ID4gV2hlbiBidWlsZGluZyBmb3Ig
b3RoZXIgYXJjaGl0ZWN0dXJlcyB2bWFsbG9jLmggaXMgcHVsbGVkIGluIHZpYSBzb21lCj4gPiBv
dGhlciBoZWFkZXIgZmlsZSAtIGZvciBleGFtcGxlIGFzbS1nZW5lcmljL2lvLmguCj4gPiBVc2Ug
YW4gZXhwbGljaXQgaW5jbHVkZSBvZiB2bWFsbG9jLmggdG8gZml4IHRoZSBidWlsZC4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IAo+IFNv
cnJ5IGZvciBiZWluZyAodG9vKSBsYXRlLCBidXQgc3RpbGw6Cj4gCj4gUmV2aWV3ZWQtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IAo+IEJlc3QgcmVnYXJkcwo+
IFRob21hcwo+IAo+ID4gRml4ZXM6IGUyMGRmZDI3ZjdhYSAoImRybS9tZ2FnMjAwOiBBZGQgc3Vw
cG9ydCBmb3IgRzIwMCBkZXNrdG9wIGNhcmRzIikKPiA+IENjOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBFZ2JlcnQgRWljaCA8ZWljaEBzdXNlLmNvbT4K
PiA+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Cj4gPiBDYzogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gSSBoYXZlIGxvc3QgdHJhY2sgaWYgdGhlIG9m
ZmVuZGluZyBjb21taXQgaXMgb24gdGhlIHdheSB0byB1cHN0cmVhbSBvcgo+ID4gaXQgaXMganVz
dCBpbiBkcm0tbWlzYy1uZXh0LiBCdXQgSSB0aGluayBpdCBpcyB0aGUgbGF0dGVyIHNvIHdlIGNh
bgo+ID4gYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0Lgo+ID4gCj4gPiAJU2FtCj4gPiAKPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIHwgMSArCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9kcnYuYwo+ID4gaW5kZXggMDkxNzBkNDZhYTUzLi5iMjgyYjBlNDJjMmQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCj4gPiBAQCAtOSw2ICs5LDcgQEAK
PiA+ICAjaW5jbHVkZSA8bGludXgvY29uc29sZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Zt
YWxsb2MuaD4KPiA+ICAKPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9maWxlLmg+Cj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+IEdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
