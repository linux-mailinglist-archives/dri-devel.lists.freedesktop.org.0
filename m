Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFE906E6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 19:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0576E37F;
	Fri, 16 Aug 2019 17:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3FA6E37F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:31:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0462480618;
 Fri, 16 Aug 2019 19:31:06 +0200 (CEST)
Date: Fri, 16 Aug 2019 19:31:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190816173105.GA9934@ravnborg.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=nzYembN0EoxnqSs6ZzwA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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

SGkgTGF1cmVudAoKVGhhbmtzIGZvciBiZWF0aW5nIG1lIG9uIHRoaXMhCgpPbiBGcmksIEF1ZyAx
NiwgMjAxOSBhdCAwMzoyMjoyN1BNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IFN0
YW5kYXJkIERSTSBwYW5lbCBkcml2ZXJzIGZvciBzZXZlcmFsIHBhbmVscyB1c2VkIGJ5IG9tYXBm
YjIgYXJlIG5vdwo+IGF2YWlsYWJsZS4gVGhlaXIgbW9kdWxlIG5hbWUgY2xhc2hlcyB3aXRoIHRo
ZSBtb2R1bGVzIGZyb20KPiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy8sIHBhcnQg
b2YgdGhlIGRlcHJlY2F0ZWQgb21hcGZiMiBmYmRldgo+IGRyaXZlci4gQXMgb21hcGZiMiBjYW4g
b25seSBiZSBjb21waWxlZCB3aGVuIHRoZSBvbWFwZHJtIGRyaXZlciBpcwo+IGRpc2FibGVkLCBh
bmQgdGhlIERSTSBwYW5lbCBkcml2ZXJzIGFyZSB1c2VsZXNzIGluIHRoYXQgY2FzZSwgbWFrZSB0
aGUKPiBvbWFwZmIyIHBhbmVscyBkZXBlbmQgb24gdGhlIHN0YW5kYXJkIERSTSBwYW5lbHMgYmVp
bmcgZGlzYWJsZWQgdG8gZml4Cj4gdGhlIG5hbWUgY2xhc2guCj4gCj4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnIHwg
NSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCj4gaW5kZXgg
OGMxYzVhNGNmZTE4Li43NDQ0MTZkYzUzMGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9m
YmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL0tjb25maWcKPiBAQCAtNDksNiArNDksNyBAQCBj
b25maWcgRkJfT01BUDJfUEFORUxfRFNJX0NNCj4gIGNvbmZpZyBGQl9PTUFQMl9QQU5FTF9TT05Z
X0FDWDU2NUFLTQo+ICAJdHJpc3RhdGUgIkFDWDU2NUFLTSBQYW5lbCIKPiAgCWRlcGVuZHMgb24g
U1BJICYmIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UKPiArCWRlcGVuZHMgb24gRFJNX1BBTkVMX1NP
TllfQUNYNTY1QUtNID0gbgoKV291bGQ6CglkZXBlbmRzIG9uICFEUk1fUEFORUxfU09OWV9BQ1g1
NjVBS00KCmRvIHRoZSBzYW1lPwoKRXhhbXBsZToKY29uZmlnIEZCX0lOVEVMCiAgICAgICAgdHJp
c3RhdGUgIkludGVsIDgzME0vODQ1Ry84NTJHTS84NTVHTS84NjVHLzkxNUcvOTQ1Ry85NDVHTS85
NjVHLzk2NUdNIHN1cHBvcnQiCiAgICAgICAgZGVwZW5kcyBvbiBGQiAmJiBQQ0kgJiYgWDg2ICYm
IEFHUF9JTlRFTCAmJiBFWFBFUlQKCS4uLgogICAgICAgIGRlcGVuZHMgb24gIURSTV9JOTE1CgoK
RFJNXzkxNSBpcyBhIHRyaXN0YXRlIHN5bWJvbC4KCkl0IGlzIG1heWJlIGJpa2VzaGVkZGluZywg
YnV0IHRoZSAhPFNZTUJPTD4gc2VlbXMgbW9yZSBsb2dpY2FsL3JlYWRhYmxlIHRvIG1lLgoKCVNh
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
