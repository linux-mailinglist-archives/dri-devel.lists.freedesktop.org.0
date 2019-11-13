Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B43FB87B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667BD6EE0C;
	Wed, 13 Nov 2019 19:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE856EE0C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:09:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="355565939"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2019 11:09:36 -0800
Date: Wed, 13 Nov 2019 11:09:35 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 23/23] mm/gup: remove support for gup(FOLL_LONGTERM)
Message-ID: <20191113190935.GD12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-24-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-24-jhubbard@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6Mjc6MTBQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE5vdyB0aGF0IGFsbCBvdGhlciBrZXJuZWwgY2FsbGVycyBvZiBnZXRfdXNlcl9wYWdl
cyhGT0xMX0xPTkdURVJNKQo+IGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gcGluX2xvbmd0ZXJtX3Bh
Z2VzKCksIGxvY2sgaXQgZG93bjoKPiAKPiAxKSBBZGQgYW4gYXNzZXJ0aW9uIHRvIGdldF91c2Vy
X3BhZ2VzKCksIHByZXZlbnRpbmcgY2FsbGVycyBmcm9tCj4gICAgcGFzc2luZyBGT0xMX0xPTkdU
RVJNIChpbiBhZGRpdGlvbiB0byB0aGUgZXhpc3RpbmcgYXNzZXJ0aW9uIHRoYXQKPiAgICBwcmV2
ZW50cyBGT0xMX1BJTikuCj4gCj4gMikgUmVtb3ZlIHRoZSBhc3NvY2lhdGVkIEdVUF9MT05HVEVS
TV9CRU5DSE1BUksgdGVzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIG1tL2d1cC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDggKysrKy0tLS0KPiAgbW0vZ3VwX2JlbmNobWFyay5jICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgOSArLS0tLS0tLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0v
Z3VwX2JlbmNobWFyay5jIHwgNyArKy0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9n
dXAuYwo+IGluZGV4IDgyZTdlNGNlNTAyNy4uOTBmNWY5NWVlN2FjIDEwMDY0NAo+IC0tLSBhL21t
L2d1cC5jCj4gKysrIGIvbW0vZ3VwLmMKPiBAQCAtMTc1NiwxMSArMTc1NiwxMSBAQCBsb25nIGdl
dF91c2VyX3BhZ2VzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMs
Cj4gIAkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICoqdm1hcykKPiAgewo+ICAJLyoKPiAtCSAqIEZP
TExfUElOIG11c3Qgb25seSBiZSBzZXQgaW50ZXJuYWxseSBieSB0aGUgcGluX3VzZXJfcGFnZSoo
KSBhbmQKPiAtCSAqIHBpbl9sb25ndGVybV8qKCkgQVBJcywgbmV2ZXIgZGlyZWN0bHkgYnkgdGhl
IGNhbGxlciwgc28gZW5mb3JjZSB0aGF0Cj4gLQkgKiB3aXRoIGFuIGFzc2VydGlvbjoKPiArCSAq
IEZPTExfUElOIGFuZCBGT0xMX0xPTkdURVJNIG11c3Qgb25seSBiZSBzZXQgaW50ZXJuYWxseSBi
eSB0aGUKPiArCSAqIHBpbl91c2VyX3BhZ2UqKCkgYW5kIHBpbl9sb25ndGVybV8qKCkgQVBJcywg
bmV2ZXIgZGlyZWN0bHkgYnkgdGhlCj4gKwkgKiBjYWxsZXIsIHNvIGVuZm9yY2UgdGhhdCB3aXRo
IGFuIGFzc2VydGlvbjoKPiAgCSAqLwo+IC0JaWYgKFdBUk5fT05fT05DRShndXBfZmxhZ3MgJiBG
T0xMX1BJTikpCj4gKwlpZiAoV0FSTl9PTl9PTkNFKGd1cF9mbGFncyAmIChGT0xMX1BJTiB8IEZP
TExfTE9OR1RFUk0pKSkKCkRvbid0IHdlIHdhbnQgdG8gYmxvY2sgRk9MTF9MT05HVEVSTSBpbiBn
ZXRfdXNlcl9wYWdlc19mYXN0KCkgYXMgd2VsbCBhZnRlciBhbGwKdGhpcz8KCklyYQoKPiAgCQly
ZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAlyZXR1cm4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKGN1cnJl
bnQsIGN1cnJlbnQtPm1tLCBzdGFydCwgbnJfcGFnZXMsCj4gZGlmZiAtLWdpdCBhL21tL2d1cF9i
ZW5jaG1hcmsuYyBiL21tL2d1cF9iZW5jaG1hcmsuYwo+IGluZGV4IDhmOTgwZDkxZGJmNS4uNjc5
ZjBlNmEwYWRiIDEwMDY0NAo+IC0tLSBhL21tL2d1cF9iZW5jaG1hcmsuYwo+ICsrKyBiL21tL2d1
cF9iZW5jaG1hcmsuYwo+IEBAIC02LDcgKzYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvZGVidWdm
cy5oPgo+ICAKPiAgI2RlZmluZSBHVVBfRkFTVF9CRU5DSE1BUksJX0lPV1IoJ2cnLCAxLCBzdHJ1
Y3QgZ3VwX2JlbmNobWFyaykKPiAtI2RlZmluZSBHVVBfTE9OR1RFUk1fQkVOQ0hNQVJLCV9JT1dS
KCdnJywgMiwgc3RydWN0IGd1cF9iZW5jaG1hcmspCj4gKy8qIENvbW1hbmQgMiBoYXMgYmVlbiBk
ZWxldGVkLiAqLwo+ICAjZGVmaW5lIEdVUF9CRU5DSE1BUksJCV9JT1dSKCdnJywgMywgc3RydWN0
IGd1cF9iZW5jaG1hcmspCj4gICNkZWZpbmUgUElOX0ZBU1RfQkVOQ0hNQVJLCV9JT1dSKCdnJywg
NCwgc3RydWN0IGd1cF9iZW5jaG1hcmspCj4gICNkZWZpbmUgUElOX0xPTkdURVJNX0JFTkNITUFS
SwlfSU9XUignZycsIDUsIHN0cnVjdCBndXBfYmVuY2htYXJrKQo+IEBAIC0yOCw3ICsyOCw2IEBA
IHN0YXRpYyB2b2lkIHB1dF9iYWNrX3BhZ2VzKGludCBjbWQsIHN0cnVjdCBwYWdlICoqcGFnZXMs
IHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpCj4gIAo+ICAJc3dpdGNoIChjbWQpIHsKPiAgCWNhc2Ug
R1VQX0ZBU1RfQkVOQ0hNQVJLOgo+IC0JY2FzZSBHVVBfTE9OR1RFUk1fQkVOQ0hNQVJLOgo+ICAJ
Y2FzZSBHVVBfQkVOQ0hNQVJLOgo+ICAJCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKQo+
ICAJCQlwdXRfcGFnZShwYWdlc1tpXSk7Cj4gQEAgLTk3LDExICs5Niw2IEBAIHN0YXRpYyBpbnQg
X19ndXBfYmVuY2htYXJrX2lvY3RsKHVuc2lnbmVkIGludCBjbWQsCj4gIAkJCW5yID0gZ2V0X3Vz
ZXJfcGFnZXNfZmFzdChhZGRyLCBuciwgZ3VwLT5mbGFncywKPiAgCQkJCQkJIHBhZ2VzICsgaSk7
Cj4gIAkJCWJyZWFrOwo+IC0JCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKPiAtCQkJbnIg
PSBnZXRfdXNlcl9wYWdlcyhhZGRyLCBuciwKPiAtCQkJCQkgICAgZ3VwLT5mbGFncyB8IEZPTExf
TE9OR1RFUk0sCj4gLQkJCQkJICAgIHBhZ2VzICsgaSwgTlVMTCk7Cj4gLQkJCWJyZWFrOwo+ICAJ
CWNhc2UgR1VQX0JFTkNITUFSSzoKPiAgCQkJbnIgPSBnZXRfdXNlcl9wYWdlcyhhZGRyLCBuciwg
Z3VwLT5mbGFncywgcGFnZXMgKyBpLAo+ICAJCQkJCSAgICBOVUxMKTsKPiBAQCAtMTU5LDcgKzE1
Myw2IEBAIHN0YXRpYyBsb25nIGd1cF9iZW5jaG1hcmtfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVw
LCB1bnNpZ25lZCBpbnQgY21kLAo+ICAKPiAgCXN3aXRjaCAoY21kKSB7Cj4gIAljYXNlIEdVUF9G
QVNUX0JFTkNITUFSSzoKPiAtCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKPiAgCWNhc2Ug
R1VQX0JFTkNITUFSSzoKPiAgCWNhc2UgUElOX0ZBU1RfQkVOQ0hNQVJLOgo+ICAJY2FzZSBQSU5f
TE9OR1RFUk1fQkVOQ0hNQVJLOgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy92bS9ndXBfYmVuY2htYXJrLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ndXBfYmVu
Y2htYXJrLmMKPiBpbmRleCAwMzkyOGU0N2E4NmYuLjgzNmI3MDgyZGIxMyAxMDA2NDQKPiAtLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMKPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMKPiBAQCAtMTUsNyArMTUsNyBA
QAo+ICAjZGVmaW5lIFBBR0VfU0laRSBzeXNjb25mKF9TQ19QQUdFU0laRSkKPiAgCj4gICNkZWZp
bmUgR1VQX0ZBU1RfQkVOQ0hNQVJLCV9JT1dSKCdnJywgMSwgc3RydWN0IGd1cF9iZW5jaG1hcmsp
Cj4gLSNkZWZpbmUgR1VQX0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBn
dXBfYmVuY2htYXJrKQo+ICsvKiBDb21tYW5kIDIgaGFzIGJlZW4gZGVsZXRlZC4gKi8KPiAgI2Rl
ZmluZSBHVVBfQkVOQ0hNQVJLCQlfSU9XUignZycsIDMsIHN0cnVjdCBndXBfYmVuY2htYXJrKQo+
ICAKPiAgLyoKPiBAQCAtNDksNyArNDksNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFy
Z3YpCj4gIAljaGFyICpmaWxlID0gIi9kZXYvemVybyI7Cj4gIAljaGFyICpwOwo+ICAKPiAtCXdo
aWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJtOnI6bjpmOmFiY3RUTFV1d1NIIikpICE9
IC0xKSB7Cj4gKwl3aGlsZSAoKG9wdCA9IGdldG9wdChhcmdjLCBhcmd2LCAibTpyOm46ZjphYmN0
VFV1d1NIIikpICE9IC0xKSB7Cj4gIAkJc3dpdGNoIChvcHQpIHsKPiAgCQljYXNlICdhJzoKPiAg
CQkJY21kID0gUElOX0ZBU1RfQkVOQ0hNQVJLOwo+IEBAIC03NSw5ICs3NSw2IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgCQljYXNlICdUJzoKPiAgCQkJdGhwID0gMDsKPiAg
CQkJYnJlYWs7Cj4gLQkJY2FzZSAnTCc6Cj4gLQkJCWNtZCA9IEdVUF9MT05HVEVSTV9CRU5DSE1B
Uks7Cj4gLQkJCWJyZWFrOwo+ICAJCWNhc2UgJ1UnOgo+ICAJCQljbWQgPSBHVVBfQkVOQ0hNQVJL
Owo+ICAJCQlicmVhazsKPiAtLSAKPiAyLjI0LjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
