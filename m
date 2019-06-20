Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846124DA25
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 21:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B720C6E4B0;
	Thu, 20 Jun 2019 19:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC66E4B0;
 Thu, 20 Jun 2019 19:26:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E42C3AC9A;
 Thu, 20 Jun 2019 19:26:50 +0000 (UTC)
Date: Thu, 20 Jun 2019 21:26:48 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
Message-ID: <20190620192648.GI12083@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613094326.24093-19-hch@lst.de>
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

T24gVGh1IDEzLTA2LTE5IDExOjQzOjIxLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUg
Y29kZSBoYXNuJ3QgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBhZGRlZCB0byB0aGUgdHJlZSwgYW5k
IGRvZXNuJ3QKPiBhcHBlYXIgdG8gYWN0dWFsbHkgYmUgdXNhYmxlLiAgTWFyayBpdCBhcyBCUk9L
RU4gdW50aWwgZWl0aGVyIGEgdXNlcgo+IGNvbWVzIGFsb25nIG9yIHdlIGZpbmFsbHkgZ2l2ZSB1
cCBvbiBpdC4KCkkgd291bGQgZ28gZXZlbiBmdXJ0aGVyIGFuZCBzaW1wbHkgcmVtb3ZlIGFsbCB0
aGUgREVWSUNFX1BVQkxJQyBjb2RlLgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KCkFueXdheQpBY2tlZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+Cgo+IC0tLQo+ICBtbS9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwo+IGlu
ZGV4IDBkMmJhN2UxZjQzZS4uNDA2ZmE0NWU5ZWNjIDEwMDY0NAo+IC0tLSBhL21tL0tjb25maWcK
PiArKysgYi9tbS9LY29uZmlnCj4gQEAgLTcyMSw2ICs3MjEsNyBAQCBjb25maWcgREVWSUNFX1BS
SVZBVEUKPiAgY29uZmlnIERFVklDRV9QVUJMSUMKPiAgCWJvb2wgIkFkZHJlc3NhYmxlIGRldmlj
ZSBtZW1vcnkgKGxpa2UgR1BVIG1lbW9yeSkiCj4gIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+
ICsJZGVwZW5kcyBvbiBCUk9LRU4KPiAgCXNlbGVjdCBITU0KPiAgCXNlbGVjdCBERVZfUEFHRU1B
UF9PUFMKPiAgCj4gLS0gCj4gMi4yMC4xCgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
