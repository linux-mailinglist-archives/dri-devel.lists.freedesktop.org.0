Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA1719FF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 16:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5F26E2BE;
	Tue, 23 Jul 2019 14:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F546E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:11:23 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63883
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpvVh-00059Y-6w; Tue, 23 Jul 2019 16:11:21 +0200
Subject: Re: [PATCH v2 00/11] drm/tinydrm: Remove tinydrm.ko
To: dri-devel@lists.freedesktop.org
References: <20190719155916.62465-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <82cd19a8-ef37-a5c7-4e61-73710c682075@tronnes.org>
Date: Tue, 23 Jul 2019 16:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719155916.62465-1-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=yP+/K3tt3yJyD1kfBO/KaONFTyk3C6yPPElvGotKTOs=; 
 b=Oh8K40X1skonN63/KglQrU35Ow1pBJyTi0yyvp5JfL+ttWs7FwW0Mxf7/57mfEXr4OcxHdteKptRPGAQjzv81GFu4ESqWIjIgljQEWIQbjbkhMsnfc/2+X7Ct3oKlN6zMvlJLgbNCy6dFqn6YJF0qh+bw/SW4Q4d8Dk6Erw4DeGewgPKbQU8xMdFewiE5iTK3ZgrjBhxmvcjRbtOU/UuC0OM6UTMP+xOy764+0IwsfyO6+B1wJvo+yHFxWylaSB0SMXAlz0O9xDYfXO/nt4rhUaOeZJD+XVt9btRkeH3OsGS5u8xdY5LFzVoVNOEJJxpogrfH586vOvyFPrquJBAZQ==;
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
Cc: sam@ravnborg.org, david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTkuMDcuMjAxOSAxNy41OSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgc2Vy
aWVzIHJlbW92ZXMgdGhlIHJlbWFpbmluZyBiaXRzIG9mIHRpbnlkcm0ua28uCj4gCj4gQ2hhbmdl
czoKPiAtIFNwbGl0IFNQSSBjb25uZWN0b3IgdHlwZSBwYXRjaCBpbiBjb3JlIGFuZCBkcml2ZXIg
Y2hhbmdlcywgZXhwYW5kCj4gICBjb21taXQgbWVzc2FnZSAoRGFuaWVsKQo+IC0gRHJvcCBtb3Zp
bmcgdGhlIG1pcGlfZGJpX3NwaV9pbml0KCkgZGVjbGFyYXRpb24gKFNhbSkKPiAtIHN0NzU4Njog
Rm9yZ290IHRvIHJlbW92ZSB0aGUgbWlwaS0+cm90YXRpb24gYXNzaWdubWVudAo+IAo+IE5vdGU6
Cj4gVGhpcyBkZXBlbmRzIG9uIGEgY29tbWl0IHRoYXQganVzdCBlbnRlcmVkIExpbnVzJyB0cmVl
Ogo+IGU2ZjNmN2U0ZGM3NiAoInNwaTogQWRkIHNwaV9pc19icHdfc3VwcG9ydGVkKCkiKQo+IAo+
IFNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ry
by9saW51eC90cmVlL3JlbW92ZV90aW55ZHJtX2tvCj4gCj4gTm9yYWxmLgo+IAo+IE5vcmFsZiBU
csO4bm5lcyAoMTEpOgo+ICAgZHJtOiBBZGQgU1BJIGNvbm5lY3RvciB0eXBlCj4gICBkcm0vdGlu
eWRybTogVXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9TUEkKPiAgIGRybS90aW55ZHJtOiBVc2Ugc3Bp
X2lzX2Jwd19zdXBwb3J0ZWQoKQo+ICAgZHJtL3Rpbnlkcm06IFJlbW92ZSBzcGkgZGVidWcgYnVm
ZmVyIGR1bXBpbmcKPiAgIGRybS90aW55ZHJtOiBSZW1vdmUgdGlueWRybV9zcGlfbWF4X3RyYW5z
ZmVyX3NpemUoKQo+ICAgZHJtL3Rpbnlkcm06IENsZWFuIHVwIHRpbnlkcm1fc3BpX3RyYW5zZmVy
KCkKPiAgIGRybS90aW55ZHJtOiBNb3ZlIHRpbnlkcm1fc3BpX3RyYW5zZmVyKCkKPiAgIGRybS90
aW55ZHJtOiBNb3ZlIHRpbnlkcm1fbWFjaGluZV9saXR0bGVfZW5kaWFuKCkKPiAgIGRybS90aW55
ZHJtL3JlcGFwZXI6IERvbid0IHVzZSB0aW55ZHJtX2Rpc3BsYXlfcGlwZV9pbml0KCkKPiAgIGRy
bS90aW55ZHJtL21pcGktZGJpOiBBZGQgbWlwaV9kYmlfaW5pdF93aXRoX2Zvcm1hdHMoKQo+ICAg
ZHJtL3Rpbnlkcm06IE1vdmUgdGlueWRybV9kaXNwbGF5X3BpcGVfaW5pdCgpIHRvIG1pcGktZGJp
CgpTZXJpZXMgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIHJldmlldyBhbmQg
dGVzdGluZyEKCk5vcmFsZi4KCj4gCj4gIERvY3VtZW50YXRpb24vZ3B1L3Rpbnlkcm0ucnN0ICAg
ICAgICAgICAgICAgICB8ICAxMiAtCj4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAg
ICAgICAgICAgICAgICB8ICAgMyAtCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL01ha2VmaWxl
ICAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL2NvcmUvTWFr
ZWZpbGUgICAgICAgICB8ICAgNCAtCj4gIC4uLi9ncHUvZHJtL3Rpbnlkcm0vY29yZS90aW55ZHJt
LWhlbHBlcnMuYyAgICB8IDIwNyAtLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlu
eWRybS9jb3JlL3Rpbnlkcm0tcGlwZS5jICAgfCAxNzkgLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL2h4ODM1N2QuYyAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL2lsaTkyMjUuYyAgICAgICAgICAgICB8ICAgNSArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9pbGk5MzQxLmMgICAgICAgICAgICAgfCAgIDEgLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9taTAyODNxdC5jICAgICAgICAgICAgfCAgIDEgLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jICAgICAgICAgICAgfCAyNTQgKysrKysrKysrKysr
KystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL3JlcGFwZXIuYyAgICAgICAgICAgICB8
ICA1OCArKystCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL3N0NzU4Ni5jICAgICAgICAgICAg
ICB8ICAzMyArLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vc3Q3NzM1ci5jICAgICAgICAg
ICAgIHwgICAxIC0KPiAgaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oICAgICAgICAgICAg
ICAgIHwgIDE4ICsrCj4gIGluY2x1ZGUvZHJtL3Rpbnlkcm0vdGlueWRybS1oZWxwZXJzLmggICAg
ICAgICB8ICA3NSAtLS0tLS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKPiAgMTggZmlsZXMgY2hhbmdlZCwgMjgzIGluc2VydGlvbnMoKyks
IDU3MiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90
aW55ZHJtL2NvcmUvTWFrZWZpbGUKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS90aW55ZHJtL2NvcmUvdGlueWRybS1oZWxwZXJzLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1waXBlLmMKPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvZHJtL3Rpbnlkcm0vdGlueWRybS1oZWxwZXJzLmgKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
