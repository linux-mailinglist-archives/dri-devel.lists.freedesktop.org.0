Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC3103030
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947026EA08;
	Tue, 19 Nov 2019 23:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BD3B6E898
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:32:49 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2EE64809B;
 Tue, 19 Nov 2019 14:33:23 +0000 (UTC)
Date: Tue, 19 Nov 2019 06:32:43 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191119143243.GH35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkxMTE5IDA1OjQyXToK
PiBPbiAxOS8xMS8yMDE5IDAxOjA1LCBUb255IExpbmRncmVuIHdyb3RlOgo+ID4gKiBTZWJhc3Rp
YW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4gWzE5MTExNyAwNzox
MV06Cj4gPiA+IFdlIGNhbiBzaW1wbHkgdXNlIHRoZSBhdG9taWMgaGVscGVyIGZvcgo+ID4gPiBo
YW5kbGluZyB0aGUgZGlydHlmYiBjYWxsYmFjay4KPiA+IC4uLgo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2NydGMuYwo+ID4gPiAtdm9pZCBvbWFwX2NydGNfZmx1c2goc3RydWN0IGRy
bV9jcnRjICpjcnRjKQo+ID4gPiArc3RhdGljIHZvaWQgb21hcF9jcnRjX2ZsdXNoKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YykKPiA+ID4gICB7Cj4gPiA+ICAgCXN0cnVjdCBvbWFwX2NydGMgKm9tYXBf
Y3J0YyA9IHRvX29tYXBfY3J0YyhjcnRjKTsKPiA+ID4gLQlzdHJ1Y3Qgb21hcF9jcnRjX3N0YXRl
ICpvbWFwX3N0YXRlID0gdG9fb21hcF9jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsKPiA+ID4gLQo+
ID4gPiAtCWlmICghb21hcF9zdGF0ZS0+bWFudWFsbHlfdXBkYXRlZCkKPiA+ID4gLQkJcmV0dXJu
Owo+ID4gPiAgIAlpZiAoIWRlbGF5ZWRfd29ya19wZW5kaW5nKCZvbWFwX2NydGMtPnVwZGF0ZV93
b3JrKSkKPiA+ID4gICAJCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmb21hcF9jcnRjLT51cGRhdGVf
d29yaywgMCk7Cj4gPiAKPiA+IEl0IHdvdWxkIGJlIG5pY2UgaWYgb21hcF9jcnRjX2ZsdXNoKCkg
d291bGQgYmVjb21lIGp1c3Qgc29tZSBnZW5lcmljCj4gPiB2b2lkIGZ1bmN0aW9uIHdpdGggbm8g
bmVlZCB0byBwYXNzIGl0IGEgY3J0Yy4gSSBndWVzcyBmb3IgdGhhdCBpdAo+ID4gc2hvdWxkIGtu
b3cgd2hhdCBwYW5lbHMgYXJlIGluIG1hbnVhbCBjb21tYW5kIG1vZGUgdG8gcmVmcmVzaCB0aGVt
LgoKUHJvYWJseSBzdGlsbCBjYW5ub3QgYmUgYSB2b2lkIGZ1bmN0aW9uLCBidXQgc2VlbXMgbGlr
ZSB3ZSBuZWVkIHRvCmNhbGwgc29tZXRoaW5nIG91dHNpZGUgb21hcF9jcnRjLmMuCgo+ID4gVGhl
IHJlYXNvbiBJJ20gYnJpbmdpbmcgdGhpcyB1cCBpcyBiZWNhdXNlIGl0IGxvb2tzIGxpa2Ugd2Ug
bmVlZAo+ID4gdG8gYWxzbyBmbHVzaCBEU0kgY29tbWFuZCBtb2RlIHBhbmVscyBmcm9tIG9tYXBf
Z2VtX29wX2ZpbmlzaCgpCj4gPiBmb3IgZ2xlcyBhbmQgdGhlIGdlbSBjb2RlIHByb2JhYmx5IHNo
b3VsZCBub3QgbmVlZCB0byBrbm93IGFueXRoaW5nCj4gPiBhYm91dCBjcnRjLCByaWdodD8KPiAK
PiBXZSBoYXZlbid0IGhhZCBvbWFwX2dlbV9vcF9maW5pc2goKSBpbiB0aGUga2VybmVsIGZvciBz
b21lIHllYXJzIG5vdy4uLgo+IAo+IFNob3VsZG4ndCBhIG5vcm1hbCBwYWdlIGZsaXAsIG9yIGlm
IGRvaW5nIHNpbmdsZS1idWZmZXJpbmcsIHVzaW5nIHRoZQo+IGRpcnR5ZmIgaW9jdGwsIGRvIHRo
ZSBqb2I/CgpJdCBkb2VzIG5vdCBzZWVtIHRvIGhhcHBlbiB3aXRoIHRoZSBvbGQgcHZyLW9tYXA0
IHJlbGF0ZWQgcGF0Y2hlcwphbmQgd2hhdGV2ZXIgZ2xlcyByZWxhdGVkIHRlc3RzIGF0IGxlYXN0
LiBJZiB5b3UgaGF2ZSBzb21lIGlkZWEKd2hlcmUgaXQgc2hvdWxkIGdldCBjYWxsZWQgSSBjYW4g
dGFrZSBhIGxvb2sgYXQgc29tZSBwb2ludC4KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
