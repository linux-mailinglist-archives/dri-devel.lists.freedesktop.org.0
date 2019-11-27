Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6F910C4EB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519996E03A;
	Thu, 28 Nov 2019 08:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FF716E31E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 15:46:01 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5BF508102;
 Wed, 27 Nov 2019 15:46:37 +0000 (UTC)
Date: Wed, 27 Nov 2019 07:45:56 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 0/3] drm/omap: fix am4 evm lcd
Message-ID: <20191127154556.GI43123@atomide.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52608d4e-dd67-1232-41e7-e6d0cba58783@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:48 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCiogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gWzE5MTEyNyAxMjo1
OV06Cj4gSGkgVG9ueSwgVGhpZXJyeSwgTGF1cmVudCwKPiAKPiBBbnkgdGhvdWdodHMgb24gdGhl
IGJlbG93IHBvaW50cz8KCj4gSSB0aGluayB5ZXQgYW5vdGhlciBvcHRpb24gaXMgdG8gd3JpdGUg
c29tZSBvbWFwIGJvb3QgdGltZSBxdWlya3MgY29kZSwKPiB3aGljaCBsb29rcyBhdCB0aGUgRFQg
ZGF0YSwgYW5kIGNoYW5nZXMgdGhlIHBhbmVsIGNvbXBhdGlibGUgc3RyaW5nIChmb3IgMSksCj4g
YW5kIHJlbW92ZXMgdGhlIHRpbWluZ3Mgbm9kZSAoZm9yIDIpLgoKTmFoLCBzZWVtcyB3ZSBjYW4g
anVzdCB1cGRhdGUgdGhlIGNvbXBhdGlibGUuCgo+IE9uIDE0LzExLzIwMTkgMTE6MzksIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+ID4gMSkgUGFuZWwgZHJpdmVyIGlzIG5vdCBwcm9iZWQuIFdpdGgg
b21hcGRybSdzIHBhbmVsLWRwaSwgdGhlIG1hdGNoCj4gPiBoYXBwZW5lZCB3aXRoICJwYW5lbC1k
cGkiIGNvbXBhdGlibGUgc3RyaW5nLiBOb3cgd2l0aCBwYW5lbC1zaW1wbGUsIHRoZQo+ID4gbWF0
Y2ggc2hvdWxkIGhhcHBlbiB3aXRoIHRoZSBwYW5lbCBtb2RlbCBjb21wYXRpYmxlIHN0cmluZywg
d2hpY2ggaXMKPiA+ICJvc2RkaXNwbGF5cyxvc2QwNTdUMDU1OS0zNHRzIiBpbiB0aGUgRFQgZmls
ZS4gSG93ZXZlciwgbm8gc3VjaAo+ID4gY29tcGF0aWJsZSBleGlzdHMgaW4gcGFuZWwtc2ltcGxl
Lgo+ID4KPiA+IEludGVyZXN0aW5nbHksIHRoZSBhY3R1YWwgcGFuZWwgYXQgbGVhc3Qgb24gbXkg
RVZNcyBhbmQgZVBPU2VzIGlzIG5vdAo+ID4gb3NkMDU3VDA1NTktMzR0cywgYnV0IG9zZDA3MHQx
NzE4LTE5dHMuIEFsc28sIEkgd2FzIHVuYWJsZSB0byBmaW5kIGFueQo+ID4gaW5mb3JtYXRpb24g
YWJvdXQgb3NkMDU3VDA1NTktMzR0cy4gSSBkb24ndCBrbm93IHRoZSBoaXN0b3J5IHdpdGggdGhp
cywKPiA+IHNvIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGVhcmx5IHZlcnNpb25zIG9mIHRoZSBi
b2FyZHMgZGlkIGhhdmUKPiA+IG9zZDA1N1QwNTU5LTM0dHMsIGJ1dCB3YXMgbGF0ZXIgY2hhbmdl
ZCB0byBvc2QwNzB0MTcxOC0xOXRzLgoKSSBndWVzcyB5b3UgY291bGQga2VlcCB0aGUgb2xkIGNv
bXBhdGlibGUgdGhlcmUgdG9vIGlmIHJlYWxseSBuZWVkZWQuCkJ1dCB0aGVuIGFnYWluIGlmIHRo
ZSBvbGQgY29tcGF0aWJsZSBpcyBrbm93biB0byBiZSBpbmNvcnJlY3QsIGl0CnNob3VsZCBiZSBq
dXN0IHVwZGF0ZWQuCgpTbyBpdCBsb29rcyBnb29kIHRvIG1lIGZvciB0aGUgZHRzIGNoYW5nZXMu
IERvIHlvdSB3YW50IG1lIHRvIHBpY2sKdGhlbSBpbnRvIGZpeGVzIGFzIGl0IHNlZW1zIHRoYXQg
dGhlIHBhbmVsIGRyaXZlciBmaXggaXMgYSBzZXBhcmF0ZQppc3N1ZT8KClJlZ2FyZHMsCgpUb255
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
