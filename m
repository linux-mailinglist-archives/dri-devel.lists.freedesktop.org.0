Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D5570FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 20:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED6389804;
	Wed, 26 Jun 2019 18:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148289760;
 Wed, 26 Jun 2019 18:49:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 11:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="164046367"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jun 2019 11:49:53 -0700
Date: Wed, 26 Jun 2019 11:49:53 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/25] mm: remove MEMORY_DEVICE_PUBLIC support
Message-ID: <20190626184953.GC4605@iweiny-DESK2.sc.intel.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-5-hch@lst.de>
 <CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com>
 <20190626171445.GA4605@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626171445.GA4605@iweiny-DESK2.sc.intel.com>
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6MTQ6NDVBTSAtMDcwMCwgJ0lyYSBXZWlueScgd3Jv
dGU6Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDk6MDA6NDdBTSAtMDcwMCwgRGFuIFdpbGxp
YW1zIHdyb3RlOgo+ID4gWyBhZGQgSXJhIF0KPiA+IAo+ID4gT24gV2VkLCBKdW4gMjYsIDIwMTkg
YXQgNToyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFRoZSBjb2RlIGhhc24ndCBiZWVuIHVzZWQgc2luY2UgaXQgd2FzIGFkZGVkIHRvIHRoZSB0
cmVlLCBhbmQgZG9lc24ndAo+ID4gPiBhcHBlYXIgdG8gYWN0dWFsbHkgYmUgdXNhYmxlLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+ID4g
QWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+ID4gWy4uXQo+ID4gPiBk
aWZmIC0tZ2l0IGEvbW0vc3dhcC5jIGIvbW0vc3dhcC5jCj4gPiA+IGluZGV4IDdlZGUzZWRkYzEy
YS4uODMxMDc0MTBkMjlmIDEwMDY0NAo+ID4gPiAtLS0gYS9tbS9zd2FwLmMKPiA+ID4gKysrIGIv
bW0vc3dhcC5jCj4gPiA+IEBAIC03NDAsMTcgKzc0MCw2IEBAIHZvaWQgcmVsZWFzZV9wYWdlcyhz
dHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgbnIpCj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoaXNf
aHVnZV96ZXJvX3BhZ2UocGFnZSkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgICAgLyogRGV2aWNlIHB1YmxpYyBwYWdlIGNh
biBub3QgYmUgaHVnZSBwYWdlICovCj4gPiA+IC0gICAgICAgICAgICAgICBpZiAoaXNfZGV2aWNl
X3B1YmxpY19wYWdlKHBhZ2UpKSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChs
b2NrZWRfcGdkYXQpIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZsb2NrZWRfcGdkYXQtPmxydV9sb2NrLAo+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MpOwo+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2tlZF9wZ2RhdCA9IE5VTEw7
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7Cj4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiAtICAgICAgICAgICAgICAgfQo+ID4gPiAtCj4gPiAK
PiA+IFRoaXMgY29sbGlkZXMgd2l0aCBJcmEncyBidWcgZml4IFsxXS4gVGhlIE1FTU9SWV9ERVZJ
Q0VfRlNEQVggY2FzZQo+ID4gbmVlZHMgdGhpcyB0byBiZSBjb252ZXJ0ZWQgdG8gYmUgaW5kZXBl
bmRlbnQgb2YgInB1YmxpYyIgcGFnZXMuCj4gPiBQZXJoYXBzIGl0IHNob3VsZCBiZSBwdWxsZWQg
b3V0IG9mIC1tbSBhbmQgaW5jb3Jwb3JhdGVkIGluIHRoaXMKPiA+IHNlcmllcy4KPiA+IAo+ID4g
WzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNjA1MjE0OTIyLjE3Njg0LTEt
aXJhLndlaW55QGludGVsLmNvbS8KPiAKPiBBZ3JlZWQgYW5kIEFuZHJldyBwaWNrZWQgdGhlIGZp
cnN0IDIgdmVyc2lvbnMgb2YgaXQsIG1tb3RtIGNvbW1pdHM6Cj4gCj4gM2VlZDExNGI1YjZiIG1t
LXN3YXAtZml4LXJlbGVhc2VfcGFnZXMtd2hlbi1yZWxlYXNpbmctZGV2bWFwLXBhZ2VzLXYyCj4g
OWI3ZDhkMGY1NzJmIG1tL3N3YXAuYzogZml4IHJlbGVhc2VfcGFnZXMoKSB3aGVuIHJlbGVhc2lu
ZyBkZXZtYXAgcGFnZXMKPiAKPiBJIGRvbid0IHNlZSB2MyBidXQgdGhlcmUgd2VyZSBubyBvYmpl
Y3Rpb25zLi4uCgpPayBzb21laG93IEkgY2FuJ3QgZmV0Y2ggbW1vdG0gcmlnaHQgbm93Li4uCgpE
YW4gaGFkIGFuZCB1cGRhdGVkIG1tb3RtIHRyZWUgYW5kIGl0IGRvZXMgaGF2ZSBteSB2NCBwYXRj
aC4KCkRvZXMgYW55b25lIGVsc2UgaGF2ZSBpc3N1ZXMgd2l0aCBnaXQ6Ly9naXQuY21weGNoZy5v
cmcvbGludXgtbW1vdG0uZ2l0IG9yIGlzCml0IGp1c3QgbWU/ICBGV0lXIEkgaGF2ZSBjaGVja2Vk
IHByb3hpZXMgZXRjLi4uIGFuZCBjYW4gZ2V0IHRvIGxpbnVzIGFuZCBvdGhlcgpzaXRlcyBqdXN0
IGZpbmUsIHNvIGl0IGxvb2tzIGxpa2UgYW4gaXNzdWUgdGhlcmUuICBBbHRob3VnaCB0aGUgd2Vi
IHBhZ2UgaXMKZmluZS4uLgoKU29ycnksCklyYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
