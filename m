Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B53EBA9E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 00:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AD26F695;
	Thu, 31 Oct 2019 23:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775476F695
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:38:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="400685375"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2019 16:38:25 -0700
Date: Thu, 31 Oct 2019 16:38:25 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 13/19] media/v4l2-core: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
Message-ID: <20191031233824.GL14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-14-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-14-jhubbard@nvidia.com>
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MjRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IDEuIENoYW5nZSB2NGwyIGZyb20gZ2V0X3VzZXJfcGFnZXMoRk9MTF9MT05HVEVSTSks
IHRvCj4gcGluX2xvbmd0ZXJtX3BhZ2VzKCksIHdoaWNoIHNldHMgYm90aCBGT0xMX0xPTkdURVJN
IGFuZCBGT0xMX1BJTi4KPiAKPiAyLiBCZWNhdXNlIGFsbCBGT0xMX1BJTi1hY3F1aXJlZCBwYWdl
cyBtdXN0IGJlIHJlbGVhc2VkIHZpYQo+IHB1dF91c2VyX3BhZ2UoKSwgYWxzbyBjb252ZXJ0IHRo
ZSBwdXRfcGFnZSgpIGNhbGwgb3ZlciB0bwo+IHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4K
PiAKClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cgo+IENjOiBN
YXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jIHwgMTMgKysrKystLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYyBiL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCj4gaW5kZXggMjgyNjIxOTBjM2FiLi45
YjljNWIzN2JmNTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9i
dWYtZG1hLXNnLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEt
c2cuYwo+IEBAIC0xODMsMTIgKzE4MywxMiBAQCBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9pbml0
X3VzZXJfbG9ja2VkKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSwKPiAgCWRwcmludGsoMSwg
ImluaXQgdXNlciBbMHglbHgrMHglbHggPT4gJWQgcGFnZXNdXG4iLAo+ICAJCWRhdGEsIHNpemUs
IGRtYS0+bnJfcGFnZXMpOwo+ICAKPiAtCWVyciA9IGdldF91c2VyX3BhZ2VzKGRhdGEgJiBQQUdF
X01BU0ssIGRtYS0+bnJfcGFnZXMsCj4gLQkJCSAgICAgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCBk
bWEtPnBhZ2VzLCBOVUxMKTsKPiArCWVyciA9IHBpbl9sb25ndGVybV9wYWdlcyhkYXRhICYgUEFH
RV9NQVNLLCBkbWEtPm5yX3BhZ2VzLAo+ICsJCQkJIGZsYWdzLCBkbWEtPnBhZ2VzLCBOVUxMKTsK
PiAgCj4gIAlpZiAoZXJyICE9IGRtYS0+bnJfcGFnZXMpIHsKPiAgCQlkbWEtPm5yX3BhZ2VzID0g
KGVyciA+PSAwKSA/IGVyciA6IDA7Cj4gLQkJZHByaW50aygxLCAiZ2V0X3VzZXJfcGFnZXM6IGVy
cj0lZCBbJWRdXG4iLCBlcnIsCj4gKwkJZHByaW50aygxLCAicGluX2xvbmd0ZXJtX3BhZ2VzOiBl
cnI9JWQgWyVkXVxuIiwgZXJyLAo+ICAJCQlkbWEtPm5yX3BhZ2VzKTsKPiAgCQlyZXR1cm4gZXJy
IDwgMCA/IGVyciA6IC1FSU5WQUw7Cj4gIAl9Cj4gQEAgLTM0OSwxMSArMzQ5LDggQEAgaW50IHZp
ZGVvYnVmX2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSkKPiAgCUJVR19PTihk
bWEtPnNnbGVuKTsKPiAgCj4gIAlpZiAoZG1hLT5wYWdlcykgewo+IC0JCWZvciAoaSA9IDA7IGkg
PCBkbWEtPm5yX3BhZ2VzOyBpKyspIHsKPiAtCQkJaWYgKGRtYS0+ZGlyZWN0aW9uID09IERNQV9G
Uk9NX0RFVklDRSkKPiAtCQkJCXNldF9wYWdlX2RpcnR5X2xvY2soZG1hLT5wYWdlc1tpXSk7Cj4g
LQkJCXB1dF9wYWdlKGRtYS0+cGFnZXNbaV0pOwo+IC0JCX0KPiArCQlwdXRfdXNlcl9wYWdlc19k
aXJ0eV9sb2NrKGRtYS0+cGFnZXMsIGRtYS0+bnJfcGFnZXMsCj4gKwkJCQkJICBkbWEtPmRpcmVj
dGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UpOwo+ICAJCWtmcmVlKGRtYS0+cGFnZXMpOwo+ICAJCWRt
YS0+cGFnZXMgPSBOVUxMOwo+ICAJfQo+IC0tIAo+IDIuMjMuMAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
