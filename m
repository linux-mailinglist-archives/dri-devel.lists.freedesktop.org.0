Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F9C98D0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07046E271;
	Thu,  3 Oct 2019 07:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E328F6E26F;
 Thu,  3 Oct 2019 07:08:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18702172-1500050 for multiple; Thu, 03 Oct 2019 08:07:59 +0100
MIME-Version: 1.0
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663D3DBA8B8@FMSMSX108.amr.corp.intel.com>
References: <20190915184539.16724-1-chris@chris-wilson.co.uk>
 <20190915184539.16724-2-chris@chris-wilson.co.uk>
 <14063C7AD467DE4B82DEDB5C278E8663D3DBA8B8@FMSMSX108.amr.corp.intel.com>
Message-ID: <157008647693.2173.15522994971143064863@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: RE: [PATCH 2/2] drm/mm: Pack allocated/scanned boolean into a bitfield
Date: Thu, 03 Oct 2019 08:07:56 +0100
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSdWhsLCBNaWNoYWVsIEogKDIwMTktMDktMTYgMjA6NDU6MTQpCj4gPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPkZyb206IGRyaS1kZXZlbCBbbWFpbHRvOmRyaS1kZXZlbC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmCj4gPk9mIENocmlzIFdpbHNv
bgo+ID5TZW50OiBTdW5kYXksIFNlcHRlbWJlciAxNSwgMjAxOSAyOjQ2IFBNCj4gPkBAIC00MjQs
OSArNDI0LDkgQEAgaW50IGRybV9tbV9yZXNlcnZlX25vZGUoc3RydWN0IGRybV9tbSAqbW0sCj4g
PnN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZSkKPiA+Cj4gPiAgICAgICBub2RlLT5tbSA9IG1tOwo+
ID4KPiA+KyAgICAgIF9fc2V0X2JpdChEUk1fTU1fTk9ERV9BTExPQ0FURURfQklULCAmbm9kZS0+
ZmxhZ3MpOwo+IAo+IE1heWJlIGEgc2lsbHkgcXVlc3Rpb24ocyksIGJ1dCB5b3UgYXBwZWFyIHRv
IGJlIG1peGluZyBhdG9taWMgYml0IG9wcwo+IChjbGVhcl8gYW5kIHRlc3RfKSB3aXRoIG5vbi1h
dG9taWMgYml0IG9wcyBfX3h4eF9iaXQoKS4KPiAKPiBTaG91bGQgdGhhdCBiZSBhIGNvbmNlcm4/
ICAgU2hvdWxkIHRoYXQgYmUgbWVudGlvbiBpbiB0aGUgY29tbWl0PwoKR2VuZXJhbGx5IHllcywg
YnV0IHRoaXMgaXMgaW5zaWRlIGFuIGFsbG9jYXRpb24gZnVuY3Rpb24gc28gdGhlIG5ldyBub2Rl
CmNhbm5vdCBiZSBhY2Nlc3NlZCBjb25jdXJyZW50bHkgeWV0IChhbmQgbWFuaXB1bGF0aW9uIG9m
IHRoZSBkcm1fbW0KaXRzZWxmIHJlcXVpcmVzIGV4dGVybmFsIHNlcmlhbGlzYXRpb24pLgoKVGhl
IGNvbmNlcm4gaXMgd2l0aCBibG9ja3MgbGlrZQoKPiA+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2NydGMuYwo+ID5p
bmRleCBmMWYwYTdjODc3NzEuLmIwMGUyMGY1Y2UwNSAxMDA2NDQKPiA+LS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfY3J0Yy5jCj4gPisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Ny
dGMuYwo+ID5AQCAtOTk0LDcgKzk5NCw3IEBAIHN0YXRpYyB2b2lkIHZjNF9jcnRjX2Rlc3Ryb3lf
c3RhdGUoc3RydWN0IGRybV9jcnRjCj4gPipjcnRjLAo+ID4gICAgICAgc3RydWN0IHZjNF9kZXYg
KnZjNCA9IHRvX3ZjNF9kZXYoY3J0Yy0+ZGV2KTsKPiA+ICAgICAgIHN0cnVjdCB2YzRfY3J0Y19z
dGF0ZSAqdmM0X3N0YXRlID0gdG9fdmM0X2NydGNfc3RhdGUoc3RhdGUpOwo+ID4KPiA+LSAgICAg
IGlmICh2YzRfc3RhdGUtPm1tLmFsbG9jYXRlZCkgewo+ID4rICAgICAgaWYgKGRybV9tbV9ub2Rl
X2FsbG9jYXRlZCgmdmM0X3N0YXRlLT5tbSkpIHsKPiA+ICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPiA+Cj4gPiAgICAgICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2YzQt
Pmh2cy0+bW1fbG9jaywgZmxhZ3MpOwoKd2hlcmUgd2UgYXJlIHRlc3RpbmcgdGhlIGJpdCBwcmlv
ciB0byB0YWtpbmcgdGhlIGxvY2sgdG8gc2VyaWFsaXNlCnJlbW92YWwgYmVmb3JlIGZyZWUuIFRv
IGF2b2lkIHRoZSBjb3N0IG9mIHNlcmlhbGlzaW5nIGhlcmUgd2UgaGF2ZSB0byBiZQpzdXJlIHRo
YXQgYW55IG90aGVyIHRocmVhZCBoYXMgY29tcGxldGVseSBzdG9wcGVkIHVzaW5nIHRoZSBkcm1f
bW1fbm9kZQp3aGVuIGl0IGlzIG1hcmtlZCBhcyByZWxlYXNlZC4KLUNocmlzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
