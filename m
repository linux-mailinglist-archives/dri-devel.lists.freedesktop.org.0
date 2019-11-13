Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A8FAE31
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 11:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C17C6ECBC;
	Wed, 13 Nov 2019 10:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964986ECBC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:12:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 826B9B3ED;
 Wed, 13 Nov 2019 10:12:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CA3AA1E1498; Wed, 13 Nov 2019 11:12:10 +0100 (CET)
Date: Wed, 13 Nov 2019 11:12:10 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
Message-ID: <20191113101210.GD6367@quack2.suse.cz>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
 <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDEzLTExLTE5IDAxOjAyOjAyLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gMTEvMTMv
MTkgMTI6MjIgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gLi4uCj4gPiA+ID4gV2h5IGFyZSB3
ZSBkb2luZyB0aGlzPyBJIHRoaW5rIHRoaW5ncyBnb3QgY29uZnVzZWQgaGVyZSBzb21lcGxhY2Us
IGFzCj4gPiA+IAo+ID4gPiAKPiA+ID4gQmVjYXVzZToKPiA+ID4gCj4gPiA+IGEpIFRoZXNlIG5l
ZWQgcHV0X3BhZ2UoKSBjYWxscywgIGFuZAo+ID4gPiAKPiA+ID4gYikgdGhlcmUgaXMgbm8gcHV0
X3BhZ2VzKCkgY2FsbCwgYnV0IHRoZXJlIGlzIGEgcmVsZWFzZV9wYWdlcygpIGNhbGwgdGhhdAo+
ID4gPiBpcywgYXJndWFibHksIHdoYXQgcHV0X3BhZ2VzKCkgd291bGQgYmUuCj4gPiA+IAo+ID4g
PiAKPiA+ID4gPiB0aGUgY29tbWVudCBzdGlsbCBzYXlzOgo+ID4gPiA+IAo+ID4gPiA+IC8qKgo+
ID4gPiA+ICAgKiBwdXRfdXNlcl9wYWdlKCkgLSByZWxlYXNlIGEgZ3VwLXBpbm5lZCBwYWdlCj4g
PiA+ID4gICAqIEBwYWdlOiAgICAgICAgICAgIHBvaW50ZXIgdG8gcGFnZSB0byBiZSByZWxlYXNl
ZAo+ID4gPiA+ICAgKgo+ID4gPiA+ICAgKiBQYWdlcyB0aGF0IHdlcmUgcGlubmVkIHZpYSBnZXRf
dXNlcl9wYWdlcyooKSBtdXN0IGJlIHJlbGVhc2VkIHZpYQo+ID4gPiA+ICAgKiBlaXRoZXIgcHV0
X3VzZXJfcGFnZSgpLCBvciBvbmUgb2YgdGhlIHB1dF91c2VyX3BhZ2VzKigpIHJvdXRpbmVzCj4g
PiA+ID4gICAqIGJlbG93Lgo+ID4gPiAKPiA+ID4gCj4gPiA+IE9oaGgsIEkgbWlzc2VkIHRob3Nl
IGNvbW1lbnRzLiBUaGV5IG5lZWQgdG8gYWxsIGJlIGNoYW5nZWQgb3ZlciB0bwo+ID4gPiBzYXkg
InBhZ2VzIHRoYXQgd2VyZSBwaW5uZWQgdmlhIHBpbl91c2VyX3BhZ2VzKigpIG9yCj4gPiA+IHBp
bl9sb25ndGVybV9wYWdlcyooKSBtdXN0IGJlIHJlbGVhc2VkIHZpYSBwdXRfdXNlcl9wYWdlKigp
LiIKPiA+ID4gCj4gPiA+IFRoZSBnZXRfdXNlcl9wYWdlcyooKSBwYWdlcyBtdXN0IHN0aWxsIGJl
IHJlbGVhc2VkIHZpYSBwdXRfcGFnZS4KPiA+ID4gCj4gPiA+IFRoZSBjaHVybiBpcyBkdWUgdG8g
YSBmYWlybHkgc2lnbmlmaWNhbnQgY2hhbmdlIGluIHN0cmF0ZWd5LCB3aGlzCj4gPiA+IGlzOiBp
bnN0ZWFkIG9mIGNoYW5naW5nIGFsbCBnZXRfdXNlcl9wYWdlcyooKSBzaXRlcyB0byBjYWxsCj4g
PiA+IHB1dF91c2VyX3BhZ2UoKSwgY2hhbmdlIHNlbGVjdGVkIHNpdGVzIHRvIGNhbGwgcGluX3Vz
ZXJfcGFnZXMqKCkgb3IKPiA+ID4gcGluX2xvbmd0ZXJtX3BhZ2VzKigpLCBwbHVzIHB1dF91c2Vy
X3BhZ2UoKS4KPiA+IAo+ID4gQ2FuJ3Qgd2UgY2FsbCB0aGlzIHVucGluX3VzZXJfcGFnZSB0aGVu
LCBmb3Igc29tZSBzeW1tZXRyeT8gT3IgaXMgdGhhdAo+ID4gZXZlbiBtb3JlIGNodXJuPwo+ID4g
Cj4gPiBMb29raW5nIGZyb20gYWZhciB0aGUgbmFtaW5nIGhlcmUgc2VlbXMgcmVhbGx5IGNvbmZ1
c2luZy4KPiAKPiAKPiBUaGF0IGxvb2sgZnJvbSBhZmFyIGlzIHZhbHVhYmxlLCBiZWNhdXNlIEkn
bSB0b28gY2xvc2UgdG8gdGhlIHByb2JsZW0gdG8gc2VlCj4gaG93IHRoZSBuYW1pbmcgbG9va3Mu
IDopCj4gCj4gdW5waW5fdXNlcl9wYWdlKCkgc291bmRzIHN5bW1ldHJpY2FsLiBJdCdzIHRydWUg
dGhhdCBpdCB3b3VsZCBjYXVzZSBtb3JlCj4gY2h1cm4gKHdoaWNoIGlzIHdoeSBJIHN0YXJ0ZWQg
b2ZmIHdpdGggYSBwcm9wb3NhbCB0aGF0IGF2b2lkcyBjaGFuZ2luZyB0aGUKPiBuYW1lcyBvZiBw
dXRfdXNlcl9wYWdlKigpIEFQSXMpLiBCdXQgT1RPSCwgdGhlIGFtb3VudCBvZiBjaHVybiBpcyBw
cm9wb3J0aW9uYWwKPiB0byB0aGUgY2hhbmdlIGluIGRpcmVjdGlvbiBoZXJlLCBhbmQgaXQncyBy
ZWFsbHkgb25seSAxMCBvciAyMCBsaW5lcyBjaGFuZ2VkLAo+IGluIHRoZSBlbmQuCj4gCj4gU28g
SSdtIG9wZW4gdG8gY2hhbmdpbmcgdG8gdGhhdCBuYW1pbmcuIEl0IHdvdWxkIGJlIG5pY2UgdG8g
aGVhciB3aGF0IG90aGVycwo+IHByZWZlciwgdG9vLi4uCgpGV0lXIEknZCBmaW5kIHVucGluX3Vz
ZXJfcGFnZSgpIGFsc28gYmV0dGVyIHRoYW4gcHV0X3VzZXJfcGFnZSgpIGFzIGEKY291bnRlcnBh
cnQgdG8gcGluX3VzZXJfcGFnZXMoKS4KCgkJCQkJCQkJSG9uemEKLS0gCkphbiBLYXJhIDxqYWNr
QHN1c2UuY29tPgpTVVNFIExhYnMsIENSCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
