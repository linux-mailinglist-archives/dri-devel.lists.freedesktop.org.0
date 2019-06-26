Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186456F68
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 19:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B646E4A7;
	Wed, 26 Jun 2019 17:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80116E4A5;
 Wed, 26 Jun 2019 17:14:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 10:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="172793484"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 26 Jun 2019 10:14:46 -0700
Date: Wed, 26 Jun 2019 10:14:45 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/25] mm: remove MEMORY_DEVICE_PUBLIC support
Message-ID: <20190626171445.GA4605@iweiny-DESK2.sc.intel.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-5-hch@lst.de>
 <CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDk6MDA6NDdBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IFsgYWRkIElyYSBdCj4gCj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgNToyNyBBTSBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4gVGhlIGNvZGUgaGFz
bid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0
Cj4gPiBhcHBlYXIgdG8gYWN0dWFsbHkgYmUgdXNhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+IEFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1o
b2Nrb0BzdXNlLmNvbT4KPiBbLi5dCj4gPiBkaWZmIC0tZ2l0IGEvbW0vc3dhcC5jIGIvbW0vc3dh
cC5jCj4gPiBpbmRleCA3ZWRlM2VkZGMxMmEuLjgzMTA3NDEwZDI5ZiAxMDA2NDQKPiA+IC0tLSBh
L21tL3N3YXAuYwo+ID4gKysrIGIvbW0vc3dhcC5jCj4gPiBAQCAtNzQwLDE3ICs3NDAsNiBAQCB2
b2lkIHJlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG5yKQo+ID4gICAgICAg
ICAgICAgICAgIGlmIChpc19odWdlX3plcm9fcGFnZShwYWdlKSkKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ID4KPiA+IC0gICAgICAgICAgICAgICAvKiBEZXZpY2UgcHVi
bGljIHBhZ2UgY2FuIG5vdCBiZSBodWdlIHBhZ2UgKi8KPiA+IC0gICAgICAgICAgICAgICBpZiAo
aXNfZGV2aWNlX3B1YmxpY19wYWdlKHBhZ2UpKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICBpZiAobG9ja2VkX3BnZGF0KSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmxvY2tlZF9wZ2RhdC0+bHJ1X2xvY2ssCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3Mp
Owo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrZWRfcGdkYXQgPSBOVUxM
Owo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiAtCj4gCj4gVGhpcyBjb2xs
aWRlcyB3aXRoIElyYSdzIGJ1ZyBmaXggWzFdLiBUaGUgTUVNT1JZX0RFVklDRV9GU0RBWCBjYXNl
Cj4gbmVlZHMgdGhpcyB0byBiZSBjb252ZXJ0ZWQgdG8gYmUgaW5kZXBlbmRlbnQgb2YgInB1Ymxp
YyIgcGFnZXMuCj4gUGVyaGFwcyBpdCBzaG91bGQgYmUgcHVsbGVkIG91dCBvZiAtbW0gYW5kIGlu
Y29ycG9yYXRlZCBpbiB0aGlzCj4gc2VyaWVzLgo+IAo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDE5MDYwNTIxNDkyMi4xNzY4NC0xLWlyYS53ZWlueUBpbnRlbC5jb20vCgpB
Z3JlZWQgYW5kIEFuZHJldyBwaWNrZWQgdGhlIGZpcnN0IDIgdmVyc2lvbnMgb2YgaXQsIG1tb3Rt
IGNvbW1pdHM6CgozZWVkMTE0YjViNmIgbW0tc3dhcC1maXgtcmVsZWFzZV9wYWdlcy13aGVuLXJl
bGVhc2luZy1kZXZtYXAtcGFnZXMtdjIKOWI3ZDhkMGY1NzJmIG1tL3N3YXAuYzogZml4IHJlbGVh
c2VfcGFnZXMoKSB3aGVuIHJlbGVhc2luZyBkZXZtYXAgcGFnZXMKCkkgZG9uJ3Qgc2VlIHYzIGJ1
dCB0aGVyZSB3ZXJlIG5vIG9iamVjdGlvbnMuLi4KCklyYQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
