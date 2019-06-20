Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F434DA4B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 21:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A826E4DD;
	Thu, 20 Jun 2019 19:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB896E4DD;
 Thu, 20 Jun 2019 19:36:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A71FAAEEC;
 Thu, 20 Jun 2019 19:36:20 +0000 (UTC)
Date: Thu, 20 Jun 2019 21:36:19 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
Message-ID: <20190620193619.GK12083@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613094326.24093-5-hch@lst.de>
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

T24gVGh1IDEzLTA2LTE5IDExOjQzOjA3LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiAtPm1h
cHBpbmcgaXNuJ3QgZXZlbiB1c2VkIGJ5IEhNTSB1c2VycywgYW5kIHRoZSBmaWVsZCBhdCB0aGUg
c2FtZSBvZmZzZXQKPiBpbiB0aGUgem9uZV9kZXZpY2UgcGFydCBvZiB0aGUgdW5pb24gaXMgZGVj
bGFyZWQgYXMgcGFkLiAgKFdoaWNoIGJ0dyBpcwo+IHJhdGhlciBjb25mdXNpbmcsIGFzIERBWCB1
c2VzIC0+cGdtYXAgYW5kIC0+bWFwcGluZyBmcm9tIHR3byBkaWZmZXJlbnQKPiBzaWRlcyBvZiB0
aGUgdW5pb24sIGJ1dCBEQVggZG9lc24ndCB1c2UgaG1tX2Rldm1lbV9mcmVlKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KCkkgY2Fubm90IHJlYWxs
eSBqdWRnZSBoZXJlIGJ1dCBzZXR0aW5nIG1hcHBpbmcgaGVyZSB3aXRob3V0IGFueSBjb21tZW50
CmlzIHF1aXRlIGNvbmZ1c2luZy4gU28gaWYgdGhpcyBpcyBzYWZlIHRvIHJlbW92ZSB0aGVuIGl0
IGlzIGNlcnRhaW5seSBhbgppbXByb3ZlbWVudC4KCj4gLS0tCj4gIG1tL2htbS5jIHwgMiAtLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1t
LmMgYi9tbS9obW0uYwo+IGluZGV4IDBjNjI0MjZkMTI1Ny4uZTFkYzk4NDA3ZTdiIDEwMDY0NAo+
IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtMTM0Nyw4ICsxMzQ3LDYgQEAg
c3RhdGljIHZvaWQgaG1tX2Rldm1lbV9mcmVlKHN0cnVjdCBwYWdlICpwYWdlLCB2b2lkICpkYXRh
KQo+ICB7Cj4gIAlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtID0gZGF0YTsKPiAgCj4gLQlwYWdl
LT5tYXBwaW5nID0gTlVMTDsKPiAtCj4gIAlkZXZtZW0tPm9wcy0+ZnJlZShkZXZtZW0sIHBhZ2Up
Owo+ICB9Cj4gIAo+IC0tIAo+IDIuMjAuMQoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
