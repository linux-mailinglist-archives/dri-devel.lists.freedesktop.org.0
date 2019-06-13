Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6A432F5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 08:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42B89228;
	Thu, 13 Jun 2019 06:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 02BB489228
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 06:31:25 +0000 (UTC)
X-UUID: 58c713b7ac094cbb99b115b77087896c-20190613
X-UUID: 58c713b7ac094cbb99b115b77087896c-20190613
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 934902771; Thu, 13 Jun 2019 14:31:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Jun 2019 14:31:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Jun 2019 14:31:18 +0800
Message-ID: <1560407478.7597.5.camel@mtksdaap41>
Subject: Re: [GIT,PULL] mediatek drm fixes for 5.2
From: CK Hu <ck.hu@mediatek.com>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Jun 2019 14:31:18 +0800
In-Reply-To: <20190612162538.GA8035@phenom.ffwll.local>
References: <1560325868.3259.6.camel@mtksdaap41>
 <20190612162538.GA8035@phenom.ffwll.local>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbDoKCk9uIFdlZCwgMjAxOS0wNi0xMiBhdCAxODoyNSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMzo1MTowOFBNICswODAwLCBD
SyBIdSB3cm90ZToKPiA+IEhpIERhdmUsIERhbmllbDoKPiA+IAo+ID4gVGhpcyBpbmNsdWRlIHVu
YmluZCBlcnJvciBmaXgsIGNsb2NrIGNvbnRyb2wgZmxvdyByZWZpbmVtZW50LCBhbmQgUFJJTUUK
PiA+IG1tYXAgd2l0aCBwYWdlIG9mZnNldC4KPiA+IAo+ID4gUmVnYXJkcywKPiA+IENLCj4gPiAK
PiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQKPiA+IGExODgzMzljYTVhMzk2
YWNjNTg4ZTU4NTFlZDdlMTlmNjZiMGViZDk6Cj4gPiAKPiA+ICAgTGludXggNS4yLXJjMSAoMjAx
OS0wNS0xOSAxNTo0NzowOSAtMDcwMCkKPiA+IAo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6Cj4gPiAKPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2NraHUtbWVkaWF0
ZWsvbGludXguZ2l0LXRhZ3MuZ2l0Cj4gPiBtZWRpYXRlay1kcm0tZml4ZXMtNS4yCj4gCj4gRm9y
IG5leHQgdGltZSBhcm91bmQsIHBsZWFzZSBtYWtlIHRoaXMgYSBzaWduZWQgYW5ub3RhdGVkIHRh
Zy4gYW5ub3RhdGVkCj4gYmVjYXVzZSB0aGVuIGl0J3MgbGVzcyB0eXBpbmcgZm9yIG1lLCBhbmQg
c2lnbmVkIGJlY2F1c2UgaXQncyBvbiBhIHNlcnZlcgo+IHdlIGRvbid0IG5lY2Vzc2FyaWx5IHRy
dXN0LgoKT0ssIEknZCBtYWtlIGEgc2lnbmVkIGFubm90YXRlZCB0YWcgaW4gbmV4dCB0aW1lLgoK
PiAKPiA+IAo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDI0NThkOWQ2ZDk0YmU5
ODJiOTE3ZTkzYzYxYTg5YjQ0MjZmMzJlMzE6Cj4gPiAKPiA+ICAgZHJtL21lZGlhdGVrOiBjYWxs
IG10a19kc2lfc3RvcCgpIGFmdGVyIG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZSgpCj4gPiAo
MjAxOS0wNi0wNCAwOTo1NDo0MiArMDgwMCkKPiA+IAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gSHNpbi1ZaSBX
YW5nICg1KToKPiA+ICAgICAgIGRybS9tZWRpYXRlazogZml4IHVuYmluZCBmdW5jdGlvbnMKPiA+
ICAgICAgIGRybS9tZWRpYXRlazogdW5iaW5kIGNvbXBvbmVudHMgaW4gbXRrX2RybV91bmJpbmQo
KQo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBjYWxsIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KCkgd2hlbiB1bmJpbmRpbmcKPiA+IGRyaXZlcgo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBjbGVh
ciBudW1fcGlwZXMgd2hlbiB1bmJpbmQgZHJpdmVyCj4gPiAgICAgICBkcm0vbWVkaWF0ZWs6IGNh
bGwgbXRrX2RzaV9zdG9wKCkgYWZ0ZXIKPiA+IG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZSgp
Cj4gPiAKPiA+IFlvbmdxaWFuZyBOaXUgKDIpOgo+ID4gICAgICAgZHJtL21lZGlhdGVrOiBhZGp1
c3QgZGRwIGNsb2NrIGNvbnRyb2wgZmxvdwo+ID4gICAgICAgZHJtL21lZGlhdGVrOiByZXNwZWN0
IHBhZ2Ugb2Zmc2V0IGZvciBQUklNRSBtbWFwIGNhbGxzCj4gCj4gWW91IG1pZ2h0IHdhbnQgdG8g
bG9vayBpbnRvIGFsbCB0aGUgcmVjZW50bHkgYWRkZWQgaGVscGVycyBmb3IgbW1hcCwgSQo+IGRv
bid0IHRoaW5rIG10ayBkb2VzIGFueXRoaW5nIHNwZWNpYWwgaGVyZS4KCklmIHlvdSBtZWFuIHVz
aW5nIGRybV9nZW1fcHJpbWVfbW1hcCBhcyB0aGUgaW1wbGVtZW50YXRpb24gb2YKZHJtX2RyaXZl
ci0+Z2VtX3ByaW1lX21tYXAsIEkgdGhpbmsgd2UgaGF2ZSBkaXNjdXNzZWQgaW4gWzFdIHRoYXQK
bWVkaWF0ZWsgZHJtIHN0aWxsIG5lZWQgaXRzIG93biBpbXBsZW1lbnRhdGlvbi4KClsxXSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNjU3MDA3LwoKUmVnYXJkcywKQ0sKCj4g
Cj4gCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAz
MAo+ID4gKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgIHwgIDggKysrLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyAgfCAgNyArKysrKystCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgIHwgMTIgKysrKysrKysrKystCj4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKPiAKPiBQdWxsZWQs
IHRoYW5rcy4KPiAtRGFuaWVsCj4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
