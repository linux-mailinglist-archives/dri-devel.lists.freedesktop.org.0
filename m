Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A80B1004FE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FB86E4AB;
	Mon, 18 Nov 2019 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2316E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E73AFB071;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8AEB01E4B0D; Mon, 18 Nov 2019 11:34:09 +0100 (CET)
Date: Mon, 18 Nov 2019 11:34:09 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 15/24] fs/io_uring: set FOLL_PIN via pin_user_pages()
Message-ID: <20191118103409.GI17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-16-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-16-jhubbard@nvidia.com>
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
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

T24gVGh1IDE0LTExLTE5IDIxOjUzOjMxLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gQ29udmVydCBm
cy9pb191cmluZyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlcygpIGNhbGwsIHdoaWNoIHNl
dHMKPiBGT0xMX1BJTi4gU2V0dGluZyBGT0xMX1BJTiBpcyBub3cgcmVxdWlyZWQgZm9yIGNvZGUg
dGhhdCByZXF1aXJlcwo+IHRyYWNraW5nIG9mIHBpbm5lZCBwYWdlcywgYW5kIHRoZXJlZm9yZSBm
b3IgYW55IGNvZGUgdGhhdCBjYWxscwo+IHB1dF91c2VyX3BhZ2UoKS4KPiAKPiBJbiBwYXJ0aWFs
IGFudGljaXBhdGlvbiBvZiB0aGlzIHdvcmssIHRoZSBpb191cmluZyBjb2RlIHdhcyBhbHJlYWR5
Cj4gY2FsbGluZyBwdXRfdXNlcl9wYWdlKCkgaW5zdGVhZCBvZiBwdXRfcGFnZSgpLiBUaGVyZWZv
cmUsIGluIG9yZGVyIHRvCj4gY29udmVydCBmcm9tIHRoZSBnZXRfdXNlcl9wYWdlcygpL3B1dF9w
YWdlKCkgbW9kZWwsIHRvIHRoZQo+IHBpbl91c2VyX3BhZ2VzKCkvcHV0X3VzZXJfcGFnZSgpIG1v
ZGVsLCB0aGUgb25seSBjaGFuZ2UgcmVxdWlyZWQKPiBoZXJlIGlzIHRvIGNoYW5nZSBnZXRfdXNl
cl9wYWdlcygpIHRvIHBpbl91c2VyX3BhZ2VzKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9obiBI
dWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKTG9va3MgZ29vZCB0byBtZS4gWW91IGNhbiBh
ZGQ6CgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KCgkJCQkJCQkJSG9uemEK
Cj4gLS0tCj4gIGZzL2lvX3VyaW5nLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9pb191cmluZy5jIGIv
ZnMvaW9fdXJpbmcuYwo+IGluZGV4IGY5YTM4OTk4ZjJmYy4uY2ZmNjRiZDAwZGI5IDEwMDY0NAo+
IC0tLSBhL2ZzL2lvX3VyaW5nLmMKPiArKysgYi9mcy9pb191cmluZy5jCj4gQEAgLTM0MzMsNyAr
MzQzMyw3IEBAIHN0YXRpYyBpbnQgaW9fc3FlX2J1ZmZlcl9yZWdpc3RlcihzdHJ1Y3QgaW9fcmlu
Z19jdHggKmN0eCwgdm9pZCBfX3VzZXIgKmFyZywKPiAgCj4gIAkJcmV0ID0gMDsKPiAgCQlkb3du
X3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3NlbSk7Cj4gLQkJcHJldCA9IGdldF91c2VyX3BhZ2Vz
KHVidWYsIG5yX3BhZ2VzLAo+ICsJCXByZXQgPSBwaW5fdXNlcl9wYWdlcyh1YnVmLCBucl9wYWdl
cywKPiAgCQkJCSAgICAgIEZPTExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAo+ICAJCQkJICAgICAg
cGFnZXMsIHZtYXMpOwo+ICAJCWlmIChwcmV0ID09IG5yX3BhZ2VzKSB7Cj4gLS0gCj4gMi4yNC4w
Cj4gCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
