Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36899EBA81
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 00:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20B6F693;
	Thu, 31 Oct 2019 23:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994666F693
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:37:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:37:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="204356863"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga006.jf.intel.com with ESMTP; 31 Oct 2019 16:37:22 -0700
Date: Thu, 31 Oct 2019 16:37:22 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 10/19] fs/io_uring: set FOLL_PIN via pin_user_pages()
Message-ID: <20191031233721.GJ14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-11-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-11-jhubbard@nvidia.com>
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MjFQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgZnMvaW9fdXJpbmcgdG8gdXNlIHRoZSBuZXcgcGluX3VzZXJfcGFnZXMo
KSBjYWxsLCB3aGljaCBzZXRzCj4gRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJl
cXVpcmVkIGZvciBjb2RlIHRoYXQgcmVxdWlyZXMKPiB0cmFja2luZyBvZiBwaW5uZWQgcGFnZXMs
IGFuZCB0aGVyZWZvcmUgZm9yIGFueSBjb2RlIHRoYXQgY2FsbHMKPiBwdXRfdXNlcl9wYWdlKCku
Cj4gCgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIGZz
L2lvX3VyaW5nLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2lvX3VyaW5nLmMgYi9mcy9pb191
cmluZy5jCj4gaW5kZXggYTMwYzRmNjIyY2IzLi5kMzkyNGIxNzYwZWIgMTAwNjQ0Cj4gLS0tIGEv
ZnMvaW9fdXJpbmcuYwo+ICsrKyBiL2ZzL2lvX3VyaW5nLmMKPiBAQCAtMzQzMSw5ICszNDMxLDgg
QEAgc3RhdGljIGludCBpb19zcWVfYnVmZmVyX3JlZ2lzdGVyKHN0cnVjdCBpb19yaW5nX2N0eCAq
Y3R4LCB2b2lkIF9fdXNlciAqYXJnLAo+ICAKPiAgCQlyZXQgPSAwOwo+ICAJCWRvd25fcmVhZCgm
Y3VycmVudC0+bW0tPm1tYXBfc2VtKTsKPiAtCQlwcmV0ID0gZ2V0X3VzZXJfcGFnZXModWJ1Ziwg
bnJfcGFnZXMsCj4gLQkJCQkgICAgICBGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKPiAtCQkJ
CSAgICAgIHBhZ2VzLCB2bWFzKTsKPiArCQlwcmV0ID0gcGluX2xvbmd0ZXJtX3BhZ2VzKHVidWYs
IG5yX3BhZ2VzLCBGT0xMX1dSSVRFLCBwYWdlcywKPiArCQkJCQkgIHZtYXMpOwo+ICAJCWlmIChw
cmV0ID09IG5yX3BhZ2VzKSB7Cj4gIAkJCS8qIGRvbid0IHN1cHBvcnQgZmlsZSBiYWNrZWQgbWVt
b3J5ICovCj4gIAkJCWZvciAoaiA9IDA7IGogPCBucl9wYWdlczsgaisrKSB7Cj4gLS0gCj4gMi4y
My4wCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
