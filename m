Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC47053A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A46089D1D;
	Mon, 22 Jul 2019 16:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C98189D1D;
 Mon, 22 Jul 2019 16:17:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9EB43803BB;
 Mon, 22 Jul 2019 18:17:21 +0200 (CEST)
Date: Mon, 22 Jul 2019 18:17:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
Message-ID: <20190722161720.GA14638@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
 <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=7YfXLusrAAAA:8 a=eh1Yez-EAAAA:8 a=_Wotqz80AAAA:8 a=zesU-xl1AAAA:8
 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=F5OasDLRAAAA:8 a=YJRnuw1UzE3hUiCSD7IA:9
 a=wnQvfRj839QLHllx:21 a=WnwC3fy0cjvAuXi0:21 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=SLz71HocmBbuEhFRYD3r:22
 a=buJP51TR1BpY-zbLSsyS:22 a=fdD1wl1Dw2ox_IZrOsee:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=UUmgAkjOvJY8lVOI6Cee:22
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbC4KCk9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA0OjM4OjM5UE0gKzAxMDAsIEVtaWwg
VmVsaWtvdiB3cm90ZToKPiBPbiBTYXQsIDIwIEp1bCAyMDE5IGF0IDA5OjQ2LCBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEUk1fUkVBRCwgRFJNX1dS
SVRFIG1hY3JvcyBjb21lcyBmcm9tIHRoZSBkZXByZWNhdGVkIGRybV9vc19saW51eC5oCj4gPiBo
ZWFkZXIgZmlsZS4gUmVtb3ZlIHRoZWlyIHVzZSB0byByZW1vdmUgdGhpcyBkZXBlbmRlbmN5Lgo+
ID4KPiA+IFJlcGxhY2UgdGhlIHVzZSBvZiB0aGUgbWFjcm9zIHdpdGggb3BlbiBjb2RlZCB2YXJp
YW50cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gPiBDYzogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAZ214LmNvbT4KPiA+IENjOiBUaG9t
YXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gPiBDYzogIkd1c3Rhdm8gQS4g
Ui4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+ID4gQ2M6IE1pa2UgTWFyc2hhbGwg
PGh1YmNhcEBvbW5pYm9uZC5jb20+Cj4gPiBDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwu
Y29tPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBD
YzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiA+IENjOiBNaWNo
ZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3ZpYS92aWFfZHJ2LmggfCAxNSArKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
cnYuaAo+ID4gaW5kZXggNmQxYWU4MzQ0ODRjLi5kNWEyYjFmZmQ4YzEgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfZHJ2LmgKPiA+IEBAIC0xMTUsMTAgKzExNSwxNyBAQCBlbnVtIHZpYV9mYW1pbHkg
ewo+ID4gIC8qIFZJQSBNTUlPIHJlZ2lzdGVyIGFjY2VzcyAqLwo+ID4gICNkZWZpbmUgVklBX0JB
U0UgKChkZXZfcHJpdi0+bW1pbykpCj4gPgo+ID4gLSNkZWZpbmUgVklBX1JFQUQocmVnKSAgICAg
ICAgICBEUk1fUkVBRDMyKFZJQV9CQVNFLCByZWcpCj4gPiAtI2RlZmluZSBWSUFfV1JJVEUocmVn
LCB2YWwpICAgIERSTV9XUklURTMyKFZJQV9CQVNFLCByZWcsIHZhbCkKPiA+IC0jZGVmaW5lIFZJ
QV9SRUFEOChyZWcpICAgICAgICAgRFJNX1JFQUQ4KFZJQV9CQVNFLCByZWcpCj4gPiAtI2RlZmlu
ZSBWSUFfV1JJVEU4KHJlZywgdmFsKSAgIERSTV9XUklURTgoVklBX0JBU0UsIHJlZywgdmFsKQo+
ID4gKyNkZWZpbmUgVklBX1JFQUQocmVnKSBcCj4gPiArICAgICAgIHJlYWRsKCgodm9pZCBfX2lv
bWVtICopVklBX0JBU0UtPmhhbmRsZSkgKyAocmVnKSkKPiA+ICsKPiA+ICsjZGVmaW5lIFZJQV9X
UklURShyZWcsIHZhbCkgXAo+ID4gKyAgICAgICB3cml0ZWwodmFsLCAoKHZvaWQgX19pb21lbSAq
KVZJQV9CQVNFLT5oYW5kbGUpICsgKHJlZykpCj4gPiArCj4gPiArI2RlZmluZSBWSUFfUkVBRDgo
cmVnKSBcCj4gPiArICAgICAgIHJlYWRiKCgodm9pZCBfX2lvbWVtICopVklBX0JBU0UtPmhhbmRs
ZSkgKyAocmVnKSkKPiA+ICsKPiA+ICsjZGVmaW5lIFZJQV9XUklURTgocmVnLCB2YWwpIFwKPiA+
ICsgICAgICAgd3JpdGViKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+aGFuZGxlKSAr
IChyZWcpKQo+ID4KPiBJTUhPIGEgZmFyIGJldHRlciBpZGVhIGlzIHRvIGV4cGFuZCB0aGVzZSBt
YWNyb3MgYXMgc3RhdGljIGlubGluZSBmdW5jdGlvbnMuCj4gVGhlIGV4dHJhIGJvbnVzIGhlcmUg
aXMgdGhhdCB0aGUgcHNldWRvLW1hZ2ljYWwgVklBX0JBU0Ugd2lsbCBhbHNvIGRpc2FwcGVhci4K
PiAKPiBTaW5jZSBhbGwgdGhlIFZJQV9SRUFEOCBhcmUgdXNlZCBmb3IgbWFza2luZywgb25lIG1p
Z2h0IGFzIHdlbGwgZHJvcAo+IHRoZW0gaW4gZmF2b3VyIG9mIHZpYV9tYXNrKCkuCj4gCj4gV0RZ
VD8KCkFzIHRoaXMgaXMgYSBsZWdhY3kgZHJpdmVyIEkgbGlrZSB0aGUgc3RlcHMgdG8gYmUgc21h
bGwuClNvIHdlIGtlZXAgaXQgbGlrZSB0aGlzIGJ1dCBtYXliZSBhZGRyZXNzIGl0IGluIGEgZm9s
bG93LXVwIHBhdGNoPwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
