Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DAC70AD1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595B089ED3;
	Mon, 22 Jul 2019 20:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6B889ECD;
 Mon, 22 Jul 2019 20:38:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2C09780463;
 Mon, 22 Jul 2019 22:38:45 +0200 (CEST)
Date: Mon, 22 Jul 2019 22:38:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, openchrome-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/via: drop use of deprecated headers drmP.h and
 drm_os_linux.h
Message-ID: <20190722203844.GA8751@ravnborg.org>
References: <20190722203545.8612-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722203545.8612-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=F5OasDLRAAAA:8
 a=e5mUnYsNAAAA:8 a=j_e6Luczr6ZXV8xU6-EA:9 a=wPNLvfGTeEIA:10
 a=UUmgAkjOvJY8lVOI6Cee:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgc3ViamVjdAoKT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTA6MzU6NDFQTSArMDIwMCwg
U2FtIFJhdm5ib3JnIHdyb3RlOgo+IFRoZSBmaXJzdCB0aHJlZSBwYXRjaGVzIHByZXBhcmUgZm9y
IHRoZSByZW1vdmFsIG9mIGRybVAuaC4KPiBUaGUgbGFzdCBwYXRjaCByZW1vdmUgdXNlIG9mIGRy
bVAuaCBhbmQgcmVwbGFjZSB3aXRoIG5lY2Vzc2FyeQo+IGluY2x1ZGUgZmlsZXMgdG8gZml4IGJ1
aWxkLgo+IAo+IEJ1aWxkIHRlc3RlZCB3aXRoIHZhcmlvdXMgY29uZmlncyBhbmQgdmFyaW91cyBh
cmNoaXRlY3R1cmVzLgo+IAo+IEkgaGFkIHByZWZlcnJlZCB0aGF0IHRoZSB2aWEgZHJpdmVyIHdh
cyByZXBsYWNlZCBieSB0aGUKPiBvcGVuY2hyb21lIGRyaXZlciwgYnV0IHVudGlsIHdlIGhhdmUg
aXQgdGhlbiB3ZSBuZWVkCj4gdG8gZGVhbCB3aXRoIHRoZSBsZWdhY3kgdmlhIGRyaXZlciB3aGVu
IHJlbW92aW5nIG9sZCBjcnVmdAo+IGluIHRoZSBkcm0gc3Vic3lzdGVtLgo+IAo+IHYzOgo+IC0g
VXNlIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIGZvciB0aGUgcmVhZC93cml0ZSBvcGVyYXRpb25z
IChFbWlsKQo+IC0gVXNlIGRlZGljYXRlZCAqX21hc2tfb3IoKSBhbmQgKl9tYXNrX2FuZCgpIChF
bWlsKQo+IC0gUmVwbGFjZSBEUk1fV0FJVF9PTiBpbiBzYW1lIHBhdGggdGhhdCBpbnRyb2R1Y2Vz
IFZJQV9XQUlUX09OIChFbWlsKQo+IC0gQ29sbGVjdGVkIHItYidzCj4gLSBDaGFuZ2Vsb2cgYWRq
dXN0bWVudHMKPiAtIFJlYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQKPiAKPiB2MjoKPiAt
IEFkZCBhIGNvcHkgb2YgRFJNX1dBSVRfT04gdG8gdGhlIHZpYSBkcml2ZXIsIGtlZXBpbmcKPiAg
IHRoZSBjaGFuZ2VzIHRvIHRoaXMgbGVnYWN5IGRyaXZlciB0byBhIG1pbmltdW0uCj4gICBUaGlz
IGFsc28gZ2l2ZXMgbXVjaCBtb3JlIGNvbmZpZGVuY2UgdGhhdCB0aGUKPiAgIGRyaXZlciBjb250
aW51ZXMgdG8gd29yayBhcyB0aGVyZSBpcyBubyBjaGFuZ2VzCj4gICBpbiBsb2dpYy4gVGhlcmVm
b3JlIGRyb3BwZWQgIlJGVCIuCj4gLSBBZGRlZCBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBk
YWVuemVyLm5ldD4gdG8gYWxsCj4gICBwYXRjaGVzLCBhcyBNaWNoYWVsIGhhdmUgY29tbWVudGVk
IG9uIHRoZSBzZXJpZXMuCj4gCj4gICAgICAgICBTYW0KPiAKPiBTYW0gUmF2bmJvcmcgKDQpOgo+
ICAgICAgIGRybS92aWE6IGRyb3AgdXNlIG9mIERSTShSRUFEfFdSSVRFKSBtYWNyb3MKPiAgICAg
ICBkcm0vdmlhOiBjb3B5IERSTV9XQUlUX09OIGFzIFZJQV9XQUlUX09OIGFuZCB1c2UgaXQKPiAg
ICAgICBkcm0vdmlhOiBtYWtlIHZpYV9kcnYuaCBzZWxmLWNvbnRhaW5lZAo+ICAgICAgIGRybS92
aWE6IGRyb3AgdXNlIG9mIGRybVAuaAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWEu
YyAgICAgIHwgNDMgKysrKysrKysrKystLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZG1hYmxpdC5jICB8IDQxICsrKysrKysrKystLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfZHJ2LmMgICAgICB8ICA3ICsrKy0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFf
ZHJ2LmggICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2lycS5jICAgICAgfCA1NCArKysrKysrKysrKysrLS0t
LS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX21hcC5jICAgICAgfCAgNiArKy0K
PiAgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfbW0uYyAgICAgICB8ICA3ICsrKy0KPiAgZHJpdmVy
cy9ncHUvZHJtL3ZpYS92aWFfdmVyaWZpZXIuYyB8IDIyICsrKysrLS0tLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3ZpYS92aWFfdmlkZW8uYyAgICB8ICA1ICsrLQo+ICA5IGZpbGVzIGNoYW5nZWQsIDE4
MiBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkKPiAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
