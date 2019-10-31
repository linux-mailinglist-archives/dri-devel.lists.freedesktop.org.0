Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC9EBA67
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 00:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871BC6F691;
	Thu, 31 Oct 2019 23:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30A56F691
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 23:35:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 16:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="206259359"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2019 16:35:19 -0700
Date: Thu, 31 Oct 2019 16:35:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 08/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Message-ID: <20191031233519.GH14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-9-jhubbard@nvidia.com>
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

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MTlQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgcHJvY2Vzc192bV9hY2Nlc3MgdG8gdXNlIHRoZSBuZXcgcGluX3VzZXJf
cGFnZXNfcmVtb3RlKCkKPiBjYWxsLCB3aGljaCBzZXRzIEZPTExfUElOLiBTZXR0aW5nIEZPTExf
UElOIGlzIG5vdyByZXF1aXJlZCBmb3IKPiBjb2RlIHRoYXQgcmVxdWlyZXMgdHJhY2tpbmcgb2Yg
cGlubmVkIHBhZ2VzLgo+IAo+IEFsc28sIHJlbGVhc2UgdGhlIHBhZ2VzIHZpYSBwdXRfdXNlcl9w
YWdlKigpLgo+IAo+IEFsc28sIHJlbmFtZSAicGFnZXMiIHRvICJwaW5uZWRfcGFnZXMiLCBhcyB0
aGlzIG1ha2VzIGZvcgo+IGVhc2llciByZWFkaW5nIG9mIHByb2Nlc3Nfdm1fcndfc2luZ2xlX3Zl
YygpLgoKT2suLi4gIGJ1dCBpdCBtYWRlIHJldmlldyBhIGJpdCBoYXJkZXIuLi4KClJldmlld2Vk
LWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAtLS0KPiAgbW0vcHJvY2Vzc192
bV9hY2Nlc3MuYyB8IDI4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jIGIvbW0vcHJvY2Vzc192bV9hY2Nlc3MuYwo+IGluZGV4
IDM1N2FhN2JlZjZjMC4uZmQyMGFiNjc1Yjg1IDEwMDY0NAo+IC0tLSBhL21tL3Byb2Nlc3Nfdm1f
YWNjZXNzLmMKPiArKysgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCj4gQEAgLTQyLDEyICs0Miwx
MSBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywK
PiAgCQlpZiAoY29weSA+IGxlbikKPiAgCQkJY29weSA9IGxlbjsKPiAgCj4gLQkJaWYgKHZtX3dy
aXRlKSB7Cj4gKwkJaWYgKHZtX3dyaXRlKQo+ICAJCQljb3BpZWQgPSBjb3B5X3BhZ2VfZnJvbV9p
dGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Cj4gLQkJCXNldF9wYWdlX2RpcnR5X2xvY2so
cGFnZSk7Cj4gLQkJfSBlbHNlIHsKPiArCQllbHNlCj4gIAkJCWNvcGllZCA9IGNvcHlfcGFnZV90
b19pdGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Cj4gLQkJfQo+ICsKPiAgCQlsZW4gLT0g
Y29waWVkOwo+ICAJCWlmIChjb3BpZWQgPCBjb3B5ICYmIGlvdl9pdGVyX2NvdW50KGl0ZXIpKQo+
ICAJCQlyZXR1cm4gLUVGQVVMVDsKPiBAQCAtOTYsNyArOTUsNyBAQCBzdGF0aWMgaW50IHByb2Nl
c3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gIAkJZmxhZ3MgfD0gRk9M
TF9XUklURTsKPiAgCj4gIAl3aGlsZSAoIXJjICYmIG5yX3BhZ2VzICYmIGlvdl9pdGVyX2NvdW50
KGl0ZXIpKSB7Cj4gLQkJaW50IHBhZ2VzID0gbWluKG5yX3BhZ2VzLCBtYXhfcGFnZXNfcGVyX2xv
b3ApOwo+ICsJCWludCBwaW5uZWRfcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9wYWdlc19wZXJf
bG9vcCk7Cj4gIAkJaW50IGxvY2tlZCA9IDE7Cj4gIAkJc2l6ZV90IGJ5dGVzOwo+ICAKPiBAQCAt
MTA2LDE0ICsxMDUsMTUgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5z
aWduZWQgbG9uZyBhZGRyLAo+ICAJCSAqIGN1cnJlbnQvY3VycmVudC0+bW0KPiAgCQkgKi8KPiAg
CQlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQkJcGFnZXMgPSBnZXRfdXNlcl9wYWdlc19y
ZW1vdGUodGFzaywgbW0sIHBhLCBwYWdlcywgZmxhZ3MsCj4gLQkJCQkJICAgICAgcHJvY2Vzc19w
YWdlcywgTlVMTCwgJmxvY2tlZCk7Cj4gKwkJcGlubmVkX3BhZ2VzID0gcGluX3VzZXJfcGFnZXNf
cmVtb3RlKHRhc2ssIG1tLCBwYSwgcGlubmVkX3BhZ2VzLAo+ICsJCQkJCQkgICAgIGZsYWdzLCBw
cm9jZXNzX3BhZ2VzLAo+ICsJCQkJCQkgICAgIE5VTEwsICZsb2NrZWQpOwo+ICAJCWlmIChsb2Nr
ZWQpCj4gIAkJCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gLQkJaWYgKHBhZ2VzIDw9IDApCj4g
KwkJaWYgKHBpbm5lZF9wYWdlcyA8PSAwKQo+ICAJCQlyZXR1cm4gLUVGQVVMVDsKPiAgCj4gLQkJ
Ynl0ZXMgPSBwYWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsKPiArCQlieXRlcyA9IHBp
bm5lZF9wYWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsKPiAgCQlpZiAoYnl0ZXMgPiBs
ZW4pCj4gIAkJCWJ5dGVzID0gbGVuOwo+ICAKPiBAQCAtMTIyLDEwICsxMjIsMTIgQEAgc3RhdGlj
IGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJCQkJ
CSB2bV93cml0ZSk7Cj4gIAkJbGVuIC09IGJ5dGVzOwo+ICAJCXN0YXJ0X29mZnNldCA9IDA7Cj4g
LQkJbnJfcGFnZXMgLT0gcGFnZXM7Cj4gLQkJcGEgKz0gcGFnZXMgKiBQQUdFX1NJWkU7Cj4gLQkJ
d2hpbGUgKHBhZ2VzKQo+IC0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFnZXNdKTsKPiAr
CQlucl9wYWdlcyAtPSBwaW5uZWRfcGFnZXM7Cj4gKwkJcGEgKz0gcGlubmVkX3BhZ2VzICogUEFH
RV9TSVpFOwo+ICsKPiArCQkvKiBJZiB2bV93cml0ZSBpcyBzZXQsIHRoZSBwYWdlcyBuZWVkIHRv
IGJlIG1hZGUgZGlydHk6ICovCj4gKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwcm9jZXNz
X3BhZ2VzLCBwaW5uZWRfcGFnZXMsCj4gKwkJCQkJICB2bV93cml0ZSk7Cj4gIAl9Cj4gIAo+ICAJ
cmV0dXJuIHJjOwo+IC0tIAo+IDIuMjMuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
