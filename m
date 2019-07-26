Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A786764B1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 13:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD996ED22;
	Fri, 26 Jul 2019 11:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEA76ED22
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:36:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E894980435;
 Fri, 26 Jul 2019 13:36:26 +0200 (CEST)
Date: Fri, 26 Jul 2019 13:36:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] video: Demote panel timing not found error message
Message-ID: <20190726113625.GC20065@ravnborg.org>
References: <20190726101849.27322-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726101849.27322-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=5Qqih-qkqPENY-0g_TsA:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeS4KCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDEyOjE4OjQ5UE0gKzAyMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4gCj4gRmFpbGluZyB0byBmaW5kIGEgcGFuZWwtdGltaW5nIG5vZGUgaXMgbm90IGFu
IGVycm9yIGluIGFsbCBjYXNlcywgc28gZG8KPiBub3Qgb3V0cHV0IGFuIGVycm9yIG1lc3NhZ2Ug
aW4gdGhhdCBjYXNlLiBJbnN0ZWFkIHR1cm4gaXQgaW50byBhIGRlYnVnCj4gbWVzc2FnZSBhbmQg
bWFrZSB0aGUgZHJpdmVycyB0aGF0IGNhcmUgYWJvdXQgaXQgb3V0cHV0IGFuIGVycm9yIG1lc3Nh
Z2UKPiBvZiB0aGVpciBvd24uCgpUaGlzIGlzIG1vcmUgb3IgbGVzcyB0aGUgc2FtZSBhcyBhbHJl
YWR5IGltcGxtZW50ZWQgYnkgRG91Z2xhcyBoZXJlOgpodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL2NvdmVyLzExMDUzMjQzLwoKRG91ZydzIGhhcyBhbiBleHRyYSBidWctZml4IHRoYXQgd2Ug
c2hhbGwgbm90IG1pc3MuCgpJIGFtIHdhaXRpbmcgZm9yIGZlZWRiYWNrIGZyb20gQmFydGxvbWll
aiBiZWZvcmUgcHJvY2VlZGluZy4KSSBndWVzcyBoZSBpcyBvbiBob2xpZGF5IHNvbWV3aGVyZSBh
bmQgd2lsbCByZXR1cm4gc29vbi4KCglTYW0KCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWx2ZHMuYyB8IDQgKysrLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2FtYmEtY2xjZC5j
ICAgIHwgNCArKystCj4gIGRyaXZlcnMvdmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYyAgfCAyICst
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwo+IGluZGV4IDFlYzU3ZDA4MDZhOC4uN2ZjYjM1
MjdjNzg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCj4gQEAgLTE0Nyw4ICsx
NDcsMTAgQEAgc3RhdGljIGludCBwYW5lbF9sdmRzX3BhcnNlX2R0KHN0cnVjdCBwYW5lbF9sdmRz
ICpsdmRzKQo+ICAJaW50IHJldDsKPiAgCj4gIAlyZXQgPSBvZl9nZXRfZGlzcGxheV90aW1pbmco
bnAsICJwYW5lbC10aW1pbmciLCAmdGltaW5nKTsKPiAtCWlmIChyZXQgPCAwKQo+ICsJaWYgKHJl
dCA8IDApIHsKPiArCQlkZXZfZXJyKGx2ZHMtPmRldiwgIiVwT0Y6IGNvdWxkIG5vdCBmaW5kIHBh
bmVsIHRpbWluZ1xuIiwgbnApOwo+ICAJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJdmlkZW9t
b2RlX2Zyb21fdGltaW5nKCZ0aW1pbmcsICZsdmRzLT52aWRlb19tb2RlKTsKPiAgCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYW1iYS1jbGNkLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2FtYmEtY2xjZC5jCj4gaW5kZXggODkzMjRlNDJhMDMzLi4xM2RmODk4YTM0ODEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9hbWJhLWNsY2QuYwo+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvYW1iYS1jbGNkLmMKPiBAQCAtNTYxLDggKzU2MSwxMCBAQCBzdGF0aWMgaW50
IGNsY2RmYl9vZl9nZXRfZHBpX3BhbmVsX21vZGUoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+
ICAJc3RydWN0IHZpZGVvbW9kZSB2aWRlbzsKPiAgCj4gIAllcnIgPSBvZl9nZXRfZGlzcGxheV90
aW1pbmcobm9kZSwgInBhbmVsLXRpbWluZyIsICZ0aW1pbmcpOwo+IC0JaWYgKGVycikKPiArCWlm
IChlcnIpIHsKPiArCQlwcl9lcnIoIiVwT0Y6IGNvdWxkIG5vdCBmaW5kIHBhbmVsIHRpbWluZ1xu
Iiwgbm9kZSk7Cj4gIAkJcmV0dXJuIGVycjsKPiArCX0KPiAgCj4gIAl2aWRlb21vZGVfZnJvbV90
aW1pbmcoJnRpbWluZywgJnZpZGVvKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
b2ZfZGlzcGxheV90aW1pbmcuYyBiL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYwo+
IGluZGV4IGY1YzFjNDY5YzBhZi4uOTM4NWI1MTgzNDlmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
dmlkZW8vb2ZfZGlzcGxheV90aW1pbmcuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vb2ZfZGlzcGxh
eV90aW1pbmcuYwo+IEBAIC0xMjUsNyArMTI1LDcgQEAgaW50IG9mX2dldF9kaXNwbGF5X3RpbWlu
Zyhjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBjb25zdCBjaGFyICpuYW1lLAo+ICAKPiAg
CXRpbWluZ19ucCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG5wLCBuYW1lKTsKPiAgCWlmICghdGlt
aW5nX25wKSB7Cj4gLQkJcHJfZXJyKCIlcE9GOiBjb3VsZCBub3QgZmluZCBub2RlICclcydcbiIs
IG5wLCBuYW1lKTsKPiArCQlwcl9kZWJ1ZygiJXBPRjogY291bGQgbm90IGZpbmQgbm9kZSAnJXMn
XG4iLCBucCwgbmFtZSk7Cj4gIAkJcmV0dXJuIC1FTk9FTlQ7Cj4gIAl9Cj4gIAo+IC0tIAo+IDIu
MjIuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
