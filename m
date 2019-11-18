Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8391004EF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8200A6E4AA;
	Mon, 18 Nov 2019 12:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99496E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8ECD9AFF6;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CAC881E4AFE; Mon, 18 Nov 2019 10:47:37 +0100 (CET)
Date: Mon, 18 Nov 2019 10:47:37 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 06/24] goldish_pipe: rename local pin_user_pages()
 routine
Message-ID: <20191118094737.GD17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-7-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-7-jhubbard@nvidia.com>
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

T24gVGh1IDE0LTExLTE5IDIxOjUzOjIyLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gMS4gQXZvaWQg
bmFtaW5nIGNvbmZsaWN0czogcmVuYW1lIGxvY2FsIHN0YXRpYyBmdW5jdGlvbiBmcm9tCj4gInBp
bl91c2VyX3BhZ2VzKCkiIHRvICJwaW5fZ29sZGZpc2hfcGFnZXMoKSIuCj4gCj4gQW4gdXBjb21p
bmcgcGF0Y2ggd2lsbCBpbnRyb2R1Y2UgYSBnbG9iYWwgcGluX3VzZXJfcGFnZXMoKQo+IGZ1bmN0
aW9uLgo+IAo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KPiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCkxvb2tzIGdvb2Qg
dG8gbWUuIFlvdSBjYW4gYWRkOgoKUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+
CgoJCQkJCQkJCUhvbnphCgo+IC0tLQo+ICBkcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRm
aXNoX3BpcGUuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bs
YXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZp
c2gvZ29sZGZpc2hfcGlwZS5jCj4gaW5kZXggY2VmMDEzM2FhNDdhLi43ZWQyYTIxYTBiYWMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKPiAr
KysgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYwo+IEBAIC0yNTcs
MTIgKzI1NywxMiBAQCBzdGF0aWMgaW50IGdvbGRmaXNoX3BpcGVfZXJyb3JfY29udmVydChpbnQg
c3RhdHVzKQo+ICAJfQo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHBpbl91c2VyX3BhZ2VzKHVuc2ln
bmVkIGxvbmcgZmlyc3RfcGFnZSwKPiAtCQkJICB1bnNpZ25lZCBsb25nIGxhc3RfcGFnZSwKPiAt
CQkJICB1bnNpZ25lZCBpbnQgbGFzdF9wYWdlX3NpemUsCj4gLQkJCSAgaW50IGlzX3dyaXRlLAo+
IC0JCQkgIHN0cnVjdCBwYWdlICpwYWdlc1tNQVhfQlVGRkVSU19QRVJfQ09NTUFORF0sCj4gLQkJ
CSAgdW5zaWduZWQgaW50ICppdGVyX2xhc3RfcGFnZV9zaXplKQo+ICtzdGF0aWMgaW50IHBpbl9n
b2xkZmlzaF9wYWdlcyh1bnNpZ25lZCBsb25nIGZpcnN0X3BhZ2UsCj4gKwkJCSAgICAgIHVuc2ln
bmVkIGxvbmcgbGFzdF9wYWdlLAo+ICsJCQkgICAgICB1bnNpZ25lZCBpbnQgbGFzdF9wYWdlX3Np
emUsCj4gKwkJCSAgICAgIGludCBpc193cml0ZSwKPiArCQkJICAgICAgc3RydWN0IHBhZ2UgKnBh
Z2VzW01BWF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKPiArCQkJICAgICAgdW5zaWduZWQgaW50ICpp
dGVyX2xhc3RfcGFnZV9zaXplKQo+ICB7Cj4gIAlpbnQgcmV0Owo+ICAJaW50IHJlcXVlc3RlZF9w
YWdlcyA9ICgobGFzdF9wYWdlIC0gZmlyc3RfcGFnZSkgPj4gUEFHRV9TSElGVCkgKyAxOwo+IEBA
IC0zNTQsOSArMzU0LDkgQEAgc3RhdGljIGludCB0cmFuc2Zlcl9tYXhfYnVmZmVycyhzdHJ1Y3Qg
Z29sZGZpc2hfcGlwZSAqcGlwZSwKPiAgCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnBp
cGUtPmxvY2spKQo+ICAJCXJldHVybiAtRVJFU1RBUlRTWVM7Cj4gIAo+IC0JcGFnZXNfY291bnQg
PSBwaW5fdXNlcl9wYWdlcyhmaXJzdF9wYWdlLCBsYXN0X3BhZ2UsCj4gLQkJCQkgICAgIGxhc3Rf
cGFnZV9zaXplLCBpc193cml0ZSwKPiAtCQkJCSAgICAgcGlwZS0+cGFnZXMsICZpdGVyX2xhc3Rf
cGFnZV9zaXplKTsKPiArCXBhZ2VzX2NvdW50ID0gcGluX2dvbGRmaXNoX3BhZ2VzKGZpcnN0X3Bh
Z2UsIGxhc3RfcGFnZSwKPiArCQkJCQkgbGFzdF9wYWdlX3NpemUsIGlzX3dyaXRlLAo+ICsJCQkJ
CSBwaXBlLT5wYWdlcywgJml0ZXJfbGFzdF9wYWdlX3NpemUpOwo+ICAJaWYgKHBhZ2VzX2NvdW50
IDwgMCkgewo+ICAJCW11dGV4X3VubG9jaygmcGlwZS0+bG9jayk7Cj4gIAkJcmV0dXJuIHBhZ2Vz
X2NvdW50Owo+IC0tIAo+IDIuMjQuMAo+IAotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNV
U0UgTGFicywgQ1IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
