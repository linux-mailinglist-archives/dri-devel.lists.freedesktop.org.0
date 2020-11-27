Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D482C66DA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082266EDB0;
	Fri, 27 Nov 2020 13:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672F36EDB0;
 Fri, 27 Nov 2020 13:30:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133422-1500050 for multiple; Fri, 27 Nov 2020 13:30:48 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-98-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-98-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 097/162] drm/i915: Distinction of memory
 regions
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:30:48 +0000
Message-ID: <160648384816.2925.16577141354577339264@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Adam Miszczak <adam.miszczak@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMjAtMTEtMjcgMTI6MDY6MTMpCj4gRnJvbTogWmJpZ25p
ZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gCj4gSUdU
cyBzaG91bGQgYmUgYWJsZSB0byBjaG9vc2UgdGVzdGluZyBzdHJhdGVneSBkZXBlbmRpbmcgb24g
bWVtb3J5Cj4gcmVnaW9ucyBhbmQgaXRzIHNpemVzLiBBZGQgcmVnaW9uIGluc3RhbmNlIG51bWJl
ciB0byBtYWtlIHRoaXMKPiBlYXNpZXIgYW5kIGRlc2NyaXB0aXZlLgo+IAo+IENjOiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4gQ2M6IFJhbWFsaW5nYW0gQyA8cmFtYWxp
bmdhbS5jQGludGVsLmNvbT4KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlu
dGVsLmNvbT4KPiBDYzogQWRhbSBNaXN6Y3phayA8YWRhbS5taXN6Y3pha0BpbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9y
ZWdpb24uYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX21lbW9yeV9yZWdpb24uYwo+IGluZGV4IDFmMjZi
YzA2ZWMyMC4uY2VhNDRkZGViZTQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX21lbW9yeV9yZWdpb24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X21lbW9yeV9yZWdpb24uYwo+IEBAIC0zMjksNiArMzI5LDEwIEBAIGludCBpbnRlbF9tZW1vcnlf
cmVnaW9uc19od19wcm9iZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKPiAgICAgICAg
ICAgICAgICAgbWVtLT5pbnN0YW5jZSA9IGluc3RhbmNlOwo+ICAgICAgICAgICAgICAgICBtZW0t
Pmd0ID0gJmk5MTUtPmd0Owo+ICAKPiArICAgICAgICAgICAgICAgaWYgKEhBU19MTUVNKG1lbS0+
aTkxNSkgJiYgdHlwZSAhPSBJTlRFTF9NRU1PUllfU1lTVEVNKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGludGVsX21lbW9yeV9yZWdpb25fc2V0X25hbWUobWVtLCAiJXMldSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW0tPm5hbWUs
IG1lbS0+aW5zdGFuY2UpOwoKc3ByaW50ZihtZW0tPm5hbWUsICIlcyIsIG1lbS0+bmFtZSkKCmlz
IHRoYXQgZXZlbiBkZWZpbmVkIGJlaGF2aW91cj8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
