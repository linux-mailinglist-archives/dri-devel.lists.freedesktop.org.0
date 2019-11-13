Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B2FB840
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5196EE07;
	Wed, 13 Nov 2019 19:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793096EE07
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:01:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="355563182"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2019 11:01:18 -0800
Date: Wed, 13 Nov 2019 11:01:17 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 20/23] mm/gup_benchmark: use proper FOLL_WRITE flags
 instead of hard-coding "1"
Message-ID: <20191113190116.GA12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-21-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-21-jhubbard@nvidia.com>
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

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDg6Mjc6MDdQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEZpeCB0aGUgZ3VwIGJlbmNobWFyayBmbGFncyB0byB1c2UgdGhlIHN5bWJvbGljIEZP
TExfV1JJVEUsCj4gaW5zdGVhZCBvZiBhIGhhcmQtY29kZWQgIjEiIHZhbHVlLgo+IAo+IEFsc28s
IGNsZWFuIHVwIHRoZSBmaWx0ZXJpbmcgb2YgZ3VwIGZsYWdzIGEgbGl0dGxlLCBieSBqdXN0IGRv
aW5nCj4gaXQgb25jZSBiZWZvcmUgaXNzdWluZyBhbnkgb2YgdGhlIGdldF91c2VyX3BhZ2VzKigp
IGNhbGxzLiBUaGlzCj4gbWFrZXMgaXQgaGFyZGVyIHRvIG92ZXJsb29rLCBpbnN0ZWFkIG9mIGhh
dmluZyBsaXR0bGUgImd1cF9mbGFncyAmIDEiCj4gcGhyYXNlcyBpbiB0aGUgZnVuY3Rpb24gY2Fs
bHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
PgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KCj4gLS0tCj4g
IG1tL2d1cF9iZW5jaG1hcmsuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYyB8IDYgKysrKyst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvbW0vZ3VwX2JlbmNobWFyay5jIGIvbW0vZ3VwX2JlbmNobWFyay5jCj4g
aW5kZXggN2RkNjAyZDdmOGRiLi43ZmM0NGQyNWVjYTcgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwX2Jl
bmNobWFyay5jCj4gKysrIGIvbW0vZ3VwX2JlbmNobWFyay5jCj4gQEAgLTQ4LDE4ICs0OCwyMSBA
QCBzdGF0aWMgaW50IF9fZ3VwX2JlbmNobWFya19pb2N0bCh1bnNpZ25lZCBpbnQgY21kLAo+ICAJ
CQluciA9IChuZXh0IC0gYWRkcikgLyBQQUdFX1NJWkU7Cj4gIAkJfQo+ICAKPiArCQkvKiBGaWx0
ZXIgb3V0IG1vc3QgZ3VwIGZsYWdzOiBvbmx5IGFsbG93IGEgdGlueSBzdWJzZXQgaGVyZTogKi8K
PiArCQlndXAtPmZsYWdzICY9IEZPTExfV1JJVEU7Cj4gKwo+ICAJCXN3aXRjaCAoY21kKSB7Cj4g
IAkJY2FzZSBHVVBfRkFTVF9CRU5DSE1BUks6Cj4gLQkJCW5yID0gZ2V0X3VzZXJfcGFnZXNfZmFz
dChhZGRyLCBuciwgZ3VwLT5mbGFncyAmIDEsCj4gKwkJCW5yID0gZ2V0X3VzZXJfcGFnZXNfZmFz
dChhZGRyLCBuciwgZ3VwLT5mbGFncywKPiAgCQkJCQkJIHBhZ2VzICsgaSk7Cj4gIAkJCWJyZWFr
Owo+ICAJCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKPiAgCQkJbnIgPSBnZXRfdXNlcl9w
YWdlcyhhZGRyLCBuciwKPiAtCQkJCQkgICAgKGd1cC0+ZmxhZ3MgJiAxKSB8IEZPTExfTE9OR1RF
Uk0sCj4gKwkJCQkJICAgIGd1cC0+ZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAo+ICAJCQkJCSAgICBw
YWdlcyArIGksIE5VTEwpOwo+ICAJCQlicmVhazsKPiAgCQljYXNlIEdVUF9CRU5DSE1BUks6Cj4g
LQkJCW5yID0gZ2V0X3VzZXJfcGFnZXMoYWRkciwgbnIsIGd1cC0+ZmxhZ3MgJiAxLCBwYWdlcyAr
IGksCj4gKwkJCW5yID0gZ2V0X3VzZXJfcGFnZXMoYWRkciwgbnIsIGd1cC0+ZmxhZ3MsIHBhZ2Vz
ICsgaSwKPiAgCQkJCQkgICAgTlVMTCk7Cj4gIAkJCWJyZWFrOwo+ICAJCWRlZmF1bHQ6Cj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYwo+IGluZGV4IDQ4NWNmMDZl
ZjAxMy4uMzg5MzI3ZTliMzBhIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3ZtL2d1cF9iZW5jaG1hcmsuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1
cF9iZW5jaG1hcmsuYwo+IEBAIC0xOCw2ICsxOCw5IEBACj4gICNkZWZpbmUgR1VQX0xPTkdURVJN
X0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBndXBfYmVuY2htYXJrKQo+ICAjZGVmaW5l
IEdVUF9CRU5DSE1BUksJCV9JT1dSKCdnJywgMywgc3RydWN0IGd1cF9iZW5jaG1hcmspCj4gIAo+
ICsvKiBKdXN0IHRoZSBmbGFncyB3ZSBuZWVkLCBjb3BpZWQgZnJvbSBtbS5oOiAqLwo+ICsjZGVm
aW5lIEZPTExfV1JJVEUJMHgwMQkvKiBjaGVjayBwdGUgaXMgd3JpdGFibGUgKi8KPiArCj4gIHN0
cnVjdCBndXBfYmVuY2htYXJrIHsKPiAgCV9fdTY0IGdldF9kZWx0YV91c2VjOwo+ICAJX191NjQg
cHV0X2RlbHRhX3VzZWM7Cj4gQEAgLTg1LDcgKzg4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQo+ICAJfQo+ICAKPiAgCWd1cC5ucl9wYWdlc19wZXJfY2FsbCA9IG5yX3BhZ2Vz
Owo+IC0JZ3VwLmZsYWdzID0gd3JpdGU7Cj4gKwlpZiAod3JpdGUpCj4gKwkJZ3VwLmZsYWdzIHw9
IEZPTExfV1JJVEU7Cj4gIAo+ICAJZmQgPSBvcGVuKCIvc3lzL2tlcm5lbC9kZWJ1Zy9ndXBfYmVu
Y2htYXJrIiwgT19SRFdSKTsKPiAgCWlmIChmZCA9PSAtMSkKPiAtLSAKPiAyLjI0LjAKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
