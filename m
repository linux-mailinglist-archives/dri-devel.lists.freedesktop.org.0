Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1FEBA73
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 00:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2136F68E;
	Thu, 31 Oct 2019 23:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AFF6F68E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:36:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="400684746"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2019 16:36:29 -0700
Date: Thu, 31 Oct 2019 16:36:28 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-10-jhubbard@nvidia.com>
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MjBQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgZHJtL3ZpYSB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19mYXN0
KCkgY2FsbCwgd2hpY2ggc2V0cwo+IEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5vdyBy
ZXF1aXJlZCBmb3IgY29kZSB0aGF0IHJlcXVpcmVzCj4gdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2Vz
LCBhbmQgdGhlcmVmb3JlIGZvciBhbnkgY29kZSB0aGF0IGNhbGxzCj4gcHV0X3VzZXJfcGFnZSgp
Lgo+IAoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KCj4gU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFi
bGl0LmMKPiBpbmRleCAzZGIwMDBhYWNkMjYuLjM3YzVlNTcyOTkzYSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlhL3ZpYV9kbWFibGl0LmMKPiBAQCAtMjM5LDcgKzIzOSw3IEBAIHZpYV9sb2NrX2FsbF9kbWFf
cGFnZXMoZHJtX3ZpYV9zZ19pbmZvX3QgKnZzZywgIGRybV92aWFfZG1hYmxpdF90ICp4ZmVyKQo+
ICAJdnNnLT5wYWdlcyA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShzaXplb2Yoc3RydWN0IHBhZ2UgKiks
IHZzZy0+bnVtX3BhZ2VzKSk7Cj4gIAlpZiAoTlVMTCA9PSB2c2ctPnBhZ2VzKQo+ICAJCXJldHVy
biAtRU5PTUVNOwo+IC0JcmV0ID0gZ2V0X3VzZXJfcGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4
ZmVyLT5tZW1fYWRkciwKPiArCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3QoKHVuc2lnbmVkIGxv
bmcpeGZlci0+bWVtX2FkZHIsCj4gIAkJCXZzZy0+bnVtX3BhZ2VzLAo+ICAJCQl2c2ctPmRpcmVj
dGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UgPyBGT0xMX1dSSVRFIDogMCwKPiAgCQkJdnNnLT5wYWdl
cyk7Cj4gLS0gCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
