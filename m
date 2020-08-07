Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488ED23F410
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 23:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA6E6EA37;
	Fri,  7 Aug 2020 21:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811926EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 21:00:22 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 629FA8045F;
 Fri,  7 Aug 2020 23:00:20 +0200 (CEST)
Date: Fri, 7 Aug 2020 23:00:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
Message-ID: <20200807210018.GA1037199@ravnborg.org>
References: <20200807180547.GA923146@ravnborg.org>
 <CAKMK7uHb7HEgnYVF45C9UA3CRPN8k6pDj8mZ4dhYcgTHi-kT8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHb7HEgnYVF45C9UA3CRPN8k6pDj8mZ4dhYcgTHi-kT8Q@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=iox4zFpeAAAA:8 a=20KFwNOVAAAA:8
 a=e5mUnYsNAAAA:8 a=25-AhOLfAAAA:8 a=y7WX3AVZ_yhgokfXTLgA:9
 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=dnuY3_Gu-P7Vi9ynLKQe:22
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKT24gRnJpLCBBdWcgMDcsIDIwMjAgYXQgMTA6MzY6MzRQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEF1ZyA3LCAyMDIwIGF0IDg6MDUgUE0gU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZToKPiA+Cj4gPiBXaGVuIGJ1aWxkaW5nIGlt
Z2FnMjAwIGZvciB0aGUgYWxwaGEgYXJjaGl0ZWN0dXJlIGl0IGZhaWxzIGxpa2UgdGhpczoKPiA+
IG1nYWcyMDBfZHJ2LmM6MjMzOjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJh2bWFsbG9j4oCZCj4gPiAgIDIzMyB8ICBiaW9zID0gdm1hbGxvYyhzaXplKTsKPiA+
ICAgICAgIHwgICAgICAgICBefn5+fn5+Cj4gPiAgICAgICB8ICAgICAgICAga21hbGxvYwo+ID4K
PiA+IFdoZW4gYnVpbGRpbmcgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgdm1hbGxvYy5oIGlzIHB1
bGxlZCBpbiB2aWEgc29tZQo+ID4gb3RoZXIgaGVhZGVyIGZpbGUgLSBmb3IgZXhhbXBsZSBhc20t
Z2VuZXJpYy9pby5oLgo+ID4gVXNlIGFuIGV4cGxpY2l0IGluY2x1ZGUgb2Ygdm1hbGxvYy5oIHRv
IGZpeCB0aGUgYnVpbGQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+ID4gRml4ZXM6IGUyMGRmZDI3ZjdhYSAoImRybS9tZ2FnMjAwOiBBZGQg
c3VwcG9ydCBmb3IgRzIwMCBkZXNrdG9wIGNhcmRzIikKPiA+IENjOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiBFZ2JlcnQgRWljaCA8ZWljaEBzdXNlLmNv
bT4KPiA+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+Cj4gPiBDYzogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gSSBoYXZlIGxvc3QgdHJhY2sgaWYgdGhl
IG9mZmVuZGluZyBjb21taXQgaXMgb24gdGhlIHdheSB0byB1cHN0cmVhbSBvcgo+ID4gaXQgaXMg
anVzdCBpbiBkcm0tbWlzYy1uZXh0LiBCdXQgSSB0aGluayBpdCBpcyB0aGUgbGF0dGVyIHNvIHdl
IGNhbgo+ID4gYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0Lgo+IAo+ICQgZGltIHN0YXR1cyAj
IGZldGNoZXMgYWxsIHRoZSB0cmVlcwpIbW0sIGV4Y2VwdCB0aGF0IGl0IGRpZCBub3QgdXBkYXRl
IGRybS1taXNjLW5leHQ/IT8KCkkgaGF2ZSByZWFkICJDb21taXRlcnMgdGhhdCB3YW50IHRvIGNo
ZWNrIHRoZSBzdGF0dXMgb2YgdGhlaXIKY3VycmVudCBicmFuY2ggc2hvdWxkIHVzZSBub3JtYWwg
Z2l0IHN0YXR1cyBjb21tYW5kcy4iCgpTbyB0aGF0LCBJIGd1ZXNzLCBtYXkgZXhwbGFpbiBpdC4K
Cj4gJCBkaW0gdGFnLWNvbnRhaW5zIGUyMGRmZDI3ZjdhYQo+IGRybS1taXNjL2RybS1taXNjLW5l
eHQKTmljZSBsaXR0bGUgY29tbWFuZCAtIGJ1dCBubyAidGFnLWNvbnRhaW5zIiBpbiBteSBkaW0g
dmVyc2lvbi4KVGhlcmUgaXMgImRpbSB0YyIgYnV0IG5vLW9uZSBoYXZlIGFueSBjaGFuY2UgZ3Vl
c3Npbmcgd2hhdCB0YwppcyBhbiBhYmJyZXZhdGlvbiBmb3IgLSBzaWdoLgoKPiAKPiBZb3UgZ3Vl
c3MgY29ycmVjdGx5IDotKQo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgoKVGhhbmtzLCBwdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCglTYW0K
Cgo+ID4KPiA+ICAgICAgICAgU2FtCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfZHJ2LmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiA+IGluZGV4IDA5MTcwZDQ2
YWE1My4uYjI4MmIwZTQyYzJkIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYwo+ID4gQEAgLTksNiArOSw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUu
aD4KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Bj
aS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gPgo+ID4gICNpbmNsdWRlIDxk
cm0vZHJtX2Rydi5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiA+IC0tCj4gPiAy
LjI1LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKPiAKPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
