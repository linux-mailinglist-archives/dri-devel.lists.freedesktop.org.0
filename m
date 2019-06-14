Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECB4508A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 02:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D66892B9;
	Fri, 14 Jun 2019 00:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4026892B9;
 Fri, 14 Jun 2019 00:29:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 17:29:47 -0700
X-ExtLoop1: 1
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2019 17:29:46 -0700
Date: Thu, 13 Jun 2019 17:31:08 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: dev_pagemap related cleanups
Message-ID: <20190614003107.GC783@iweiny-DESK2.sc.intel.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190613204043.GD22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613204043.GD22062@mellanox.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6NDA6NDZQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjI3OjM5QU0gLTA3MDAsIERhbiBX
aWxsaWFtcyB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDI6NDMgQU0gQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBEYW4sIErDqXLD
tG1lIGFuZCBKYXNvbiwKPiA+ID4KPiA+ID4gYmVsb3cgaXMgYSBzZXJpZXMgdGhhdCBjbGVhbnMg
dXAgdGhlIGRldl9wYWdlbWFwIGludGVyZmFjZSBzbyB0aGF0Cj4gPiA+IGl0IGlzIG1vcmUgZWFz
aWx5IHVzYWJsZSwgd2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3cmFwIGl0IGluIGhtbQo+ID4g
PiBhbmQgdGh1cyBhbGxvd2luZyB0byBraWxsIGEgbG90IG9mIGNvZGUKPiA+ID4KPiA+ID4gRGlm
ZnN0YXQ6Cj4gPiA+Cj4gPiA+ICAyMiBmaWxlcyBjaGFuZ2VkLCAyNDUgaW5zZXJ0aW9ucygrKSwg
ODAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBIb29yYXkhCj4gPiAKPiA+ID4gR2l0IHRyZWU6Cj4g
PiA+Cj4gPiA+ICAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQg
aG1tLWRldm1lbS1jbGVhbnVwCj4gPiAKPiA+IEkganVzdCByZWFsaXplZCB0aGlzIGNvbGxpZGVz
IHdpdGggdGhlIGRldl9wYWdlbWFwIHJlbGVhc2UgcmV3b3JrIGluCj4gPiBBbmRyZXcncyB0cmVl
IChjb21taXQgaWRzIGJlbG93IGFyZSBmcm9tIG5leHQuZ2l0IGFuZCBhcmUgbm90IHN0YWJsZSkK
PiA+IAo+ID4gNDQyMmVlODQ3NmYwIG1tL2Rldm1fbWVtcmVtYXBfcGFnZXM6IGZpeCBmaW5hbCBw
YWdlIHB1dCByYWNlCj4gPiA3NzFmMDcxNGQwZGMgUENJL1AyUERNQTogdHJhY2sgcGdtYXAgcmVm
ZXJlbmNlcyBwZXIgcmVzb3VyY2UsIG5vdCBnbG9iYWxseQo+ID4gYWYzNzA4NWRlOTA2IGxpYi9n
ZW5hbGxvYzogaW50cm9kdWNlIGNodW5rIG93bmVycwo+ID4gZTAwNDdmZjhhYTc3IFBDSS9QMlBE
TUE6IGZpeCB0aGUgZ2VuX3Bvb2xfYWRkX3ZpcnQoKSBmYWlsdXJlIHBhdGgKPiA+IDAzMTVkNDdk
NmFlOSBtbS9kZXZtX21lbXJlbWFwX3BhZ2VzOiBpbnRyb2R1Y2UgZGV2bV9tZW11bm1hcF9wYWdl
cwo+ID4gMjE2NDc1YzdlYWE4IGRyaXZlcnMvYmFzZS9kZXZyZXM6IGludHJvZHVjZSBkZXZtX3Jl
bGVhc2VfYWN0aW9uKCkKPiA+IAo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGlj
dCBpbiB0b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFwLmMKPiA+IENPTkZMSUNUIChjb250
ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gbW0vaG1tLmMKPiA+IENPTkZMSUNUIChjb250ZW50KTog
TWVyZ2UgY29uZmxpY3QgaW4ga2VybmVsL21lbXJlbWFwLmMKPiA+IENPTkZMSUNUIChjb250ZW50
KTogTWVyZ2UgY29uZmxpY3QgaW4gaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oCj4gPiBDT05GTElD
VCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvcGNpL3AycGRtYS5jCj4gPiBD
T05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvbnZkaW1tL3BtZW0u
Ywo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL2RheC9k
ZXZpY2UuYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBkcml2ZXJz
L2RheC9kYXgtcHJpdmF0ZS5oCj4gPiAKPiA+IFBlcmhhcHMgd2Ugc2hvdWxkIHB1bGwgdGhvc2Ug
b3V0IGFuZCByZXNlbmQgdGhlbSB0aHJvdWdoIGhtbS5naXQ/Cj4gCj4gSXQgY291bGQgYmUgZG9u
ZSAtIGJ1dCBob3cgYmFkIGlzIHRoZSBjb25mbGljdCByZXNvbHV0aW9uPwo+IAo+IEknZCBiZSBt
b3JlIGNvbWZvcnRhYmxlIHRvIHRha2UgYSBQUiBmcm9tIHlvdSB0byBtZXJnZSBpbnRvIGhtbS5n
aXQsCj4gcmF0aGVyIHRoYW4gcmF3IHBhdGNoZXMsIHRoZW4gYXBwbHkgQ0gncyBzZXJpZXMgb24g
dG9wLiBJIHRoaW5rLgo+IAo+IFRoYXQgd2F5IGlmIHNvbWV0aGluZyBnb2VzIHdyb25nIHlvdSBj
YW4gc2VuZCB5b3VyIFBSIHRvIExpbnVzCj4gZGlyZWN0bHkuCj4gCj4gPiBJdCBhbHNvIHR1cm5z
IG91dCB0aGUgbnZkaW1tIHVuaXQgdGVzdHMgY3Jhc2ggd2l0aCB0aGlzIHNpZ25hdHVyZSBvbgo+
ID4gdGhhdCBicmFuY2ggd2hlcmUgYmFzZSB2NS4yLXJjMyBwYXNzZXM6Cj4gPiAKPiA+ICAgICBC
VUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAw
MDAwMDgKPiA+ICAgICBbLi5dCj4gPiAgICAgQ1BVOiAxNSBQSUQ6IDE0MTQgQ29tbTogbHQtbGli
bmRjdGwgVGFpbnRlZDogRyAgICAgICAgICAgT0UKPiA+IDUuMi4wLXJjMysgIzMzOTkKPiA+ICAg
ICBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwg
QklPUyAwLjAuMCAwMi8wNi8yMDE1Cj4gPiAgICAgUklQOiAwMDEwOnBlcmNwdV9yZWZfa2lsbF9h
bmRfY29uZmlybSsweDFlLzB4MTgwCj4gPiAgICAgWy4uXQo+ID4gICAgIENhbGwgVHJhY2U6Cj4g
PiAgICAgIHJlbGVhc2Vfbm9kZXMrMHgyMzQvMHgyODAKPiA+ICAgICAgZGV2aWNlX3JlbGVhc2Vf
ZHJpdmVyX2ludGVybmFsKzB4ZTgvMHgxYjAKPiA+ICAgICAgYnVzX3JlbW92ZV9kZXZpY2UrMHhm
Mi8weDE2MAo+ID4gICAgICBkZXZpY2VfZGVsKzB4MTY2LzB4MzcwCj4gPiAgICAgIHVucmVnaXN0
ZXJfZGV2X2RheCsweDIzLzB4NTAKPiA+ICAgICAgcmVsZWFzZV9ub2RlcysweDIzNC8weDI4MAo+
ID4gICAgICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHhlOC8weDFiMAo+ID4gICAg
ICB1bmJpbmRfc3RvcmUrMHg5NC8weDEyMAo+ID4gICAgICBrZXJuZnNfZm9wX3dyaXRlKzB4ZjAv
MHgxYTAKPiA+ICAgICAgdmZzX3dyaXRlKzB4YjcvMHgxYjAKPiA+ICAgICAga3N5c193cml0ZSsw
eDVjLzB4ZDAKPiA+ICAgICAgZG9fc3lzY2FsbF82NCsweDYwLzB4MjQwCj4gCj4gVG9vIGJhZCB0
aGUgdHJhY2UgZGlkbid0IHNheSB3aGljaCBkZXZtIGNsZWFudXAgdHJpZ2dlcmVkIGl0Li4gRGlk
Cj4gZGV2X3BhZ2VtYXBfcGVyY3B1X2V4aXQgZ2V0IGNhbGxlZCB3aXRoIGEgTlVMTCBwZ21hcC0+
cmVmID8KCkkgd291bGQgZ3Vlc3Mgc29tZXRoaW5nIGxpa2UgdGhhdC4gIEkgZGlkIG5vdCBmdWxs
eSB3cmFwIG15IGhlYWQgYXJvdW5kIHRoZSByZWYKY291bnRpbmcgdGhlcmUgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhlIHBhdGNoIGlzIGNvcnJlY3QuICBTZWUgbXkgcmV2aWV3LgoKSXJhCgo+IAo+IEph
c29uCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBM
aW51eC1udmRpbW0gbWFpbGluZyBsaXN0Cj4gTGludXgtbnZkaW1tQGxpc3RzLjAxLm9yZwo+IGh0
dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbnZkaW1tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
