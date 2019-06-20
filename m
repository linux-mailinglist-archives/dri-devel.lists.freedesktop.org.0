Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB054DA15
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 21:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1FE6E434;
	Thu, 20 Jun 2019 19:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CF6E3E9;
 Thu, 20 Jun 2019 19:17:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D58A5AB92;
 Thu, 20 Jun 2019 19:17:35 +0000 (UTC)
Date: Thu, 20 Jun 2019 21:17:33 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
Message-ID: <20190620191733.GH12083@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613094326.24093-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDEzLTA2LTE5IDExOjQzOjA4LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBub3Zl
YXUgaXMgY3VycmVudGx5IHVzaW5nIHRoaXMgdGhyb3VnaCBhbiBvZGQgaG1tIHdyYXBwZXIsIGFu
ZCBJIHBsYW4KPiB0byBzd2l0Y2ggaXQgdG8gdGhlIHJlYWwgdGhpbmcgbGF0ZXIgaW4gdGhpcyBz
ZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIG1tL21lbXBvbGljeS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5j
Cj4gaW5kZXggMDE2MDBkODBhZTAxLi5mOTAyM2I1ZmJhMzcgMTAwNjQ0Cj4gLS0tIGEvbW0vbWVt
cG9saWN5LmMKPiArKysgYi9tbS9tZW1wb2xpY3kuYwo+IEBAIC0yMDk4LDYgKzIwOTgsNyBAQCBh
bGxvY19wYWdlc192bWEoZ2ZwX3QgZ2ZwLCBpbnQgb3JkZXIsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+ICBvdXQ6Cj4gIAlyZXR1cm4gcGFnZTsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MX0dQ
TChhbGxvY19wYWdlc192bWEpOwoKQWxsIGFsbG9jYXRvciBleHBvcnRlZCBzeW1ib2xzIGFyZSBF
WFBPUlRfU1lNQk9MLCB3aGF0IGlzIGEgcmVhc29uIHRvCmhhdmUgdGhpcyBvbmUgc3BlY2lhbD8K
Ci0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
