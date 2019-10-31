Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA8EB6C4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 19:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283FB6E0EA;
	Thu, 31 Oct 2019 18:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93896E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 18:18:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 11:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,252,1569308400"; d="scan'208";a="375329849"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2019 11:18:45 -0700
Date: Thu, 31 Oct 2019 11:18:44 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 01/19] mm/gup: pass flags arg to __gup_device_* functions
Message-ID: <20191031181844.GB14771@iweiny-DESK2.sc.intel.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030224930.3990755-2-jhubbard@nvidia.com>
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MTJQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEEgc3Vic2VxdWVudCBwYXRjaCByZXF1aXJlcyBhY2Nlc3MgdG8gZ3VwIGZsYWdzLCBz
bwo+IHBhc3MgdGhlIGZsYWdzIGFyZ3VtZW50IHRocm91Z2ggdG8gdGhlIF9fZ3VwX2RldmljZV8q
Cj4gZnVuY3Rpb25zLgo+IAo+IEFsc28gcGxhY2F0ZSBjaGVja3BhdGNoLnBsIGJ5IHNob3J0ZW5p
bmcgYSBuZWFyYnkgbGluZS4KPiAKClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBp
bnRlbC5jb20+Cgo+IENjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51
eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgo+IC0tLQo+ICBtbS9ndXAuYyB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggOGYyMzZhMzM1YWU5
Li44NWNhZjc2YjMwMTIgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+
IEBAIC0xODkwLDcgKzE4OTAsOCBAQCBzdGF0aWMgaW50IGd1cF9wdGVfcmFuZ2UocG1kX3QgcG1k
LCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAo+ICAKPiAgI2lmIGRlZmlu
ZWQoQ09ORklHX0FSQ0hfSEFTX1BURV9ERVZNQVApICYmIGRlZmluZWQoQ09ORklHX1RSQU5TUEFS
RU5UX0hVR0VQQUdFKQo+ICBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlKHVuc2lnbmVkIGxv
bmcgcGZuLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVj
dCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gKwkJCSAgICAgdW5zaWduZWQgbG9uZyBlbmQsIHVu
c2lnbmVkIGludCBmbGFncywKPiArCQkJICAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5y
KQo+ICB7Cj4gIAlpbnQgbnJfc3RhcnQgPSAqbnI7Cj4gIAlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBn
bWFwID0gTlVMTDsKPiBAQCAtMTkxNiwxMyArMTkxNywxNCBAQCBzdGF0aWMgaW50IF9fZ3VwX2Rl
dmljZV9odWdlKHVuc2lnbmVkIGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIH0KPiAg
Cj4gIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpw
bWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVjdCBw
YWdlICoqcGFnZXMsIGludCAqbnIpCj4gKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVk
IGludCBmbGFncywKPiArCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICB7Cj4g
IAl1bnNpZ25lZCBsb25nIGZhdWx0X3BmbjsKPiAgCWludCBucl9zdGFydCA9ICpucjsKPiAgCj4g
IAlmYXVsdF9wZm4gPSBwbWRfcGZuKG9yaWcpICsgKChhZGRyICYgflBNRF9NQVNLKSA+PiBQQUdF
X1NISUZUKTsKPiAtCWlmICghX19ndXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQs
IHBhZ2VzLCBucikpCj4gKwlpZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwg
ZW5kLCBmbGFncywgcGFnZXMsIG5yKSkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAlpZiAodW5saWtl
bHkocG1kX3ZhbChvcmlnKSAhPSBwbWRfdmFsKCpwbWRwKSkpIHsKPiBAQCAtMTkzMywxMyArMTkz
NSwxNCBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRf
dCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IF9fZ3Vw
X2RldmljZV9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+IC0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5y
KQo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCj4gKwkJCQkg
c3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBmYXVs
dF9wZm47Cj4gIAlpbnQgbnJfc3RhcnQgPSAqbnI7Cj4gIAo+ICAJZmF1bHRfcGZuID0gcHVkX3Bm
bihvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFHRV9TSElGVCk7Cj4gLQlpZiAoIV9f
Z3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBwYWdlcywgbnIpKQo+ICsJaWYg
KCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgZmxhZ3MsIHBhZ2VzLCBu
cikpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKHVubGlrZWx5KHB1ZF92YWwob3JpZykgIT0g
cHVkX3ZhbCgqcHVkcCkpKSB7Cj4gQEAgLTE5NTAsMTQgKzE5NTMsMTYgQEAgc3RhdGljIGludCBf
X2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiAgfQo+ICAjZWxzZQo+ICBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3Bt
ZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+IC0JCXVuc2ln
bmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICsJCQkJIHVuc2ln
bmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCj4gKwkJCQkgc3RydWN0IHBhZ2UgKipw
YWdlcywgaW50ICpucikKPiAgewo+ICAJQlVJTERfQlVHKCk7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3QgcHVkLCBwdWRfdCAq
cHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+IC0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MsCj4gKwkJCQkgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAgewo+
ICAJQlVJTERfQlVHKCk7Cj4gIAlyZXR1cm4gMDsKPiBAQCAtMjA2Miw3ICsyMDY3LDggQEAgc3Rh
dGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiAgCWlmIChwbWRfZGV2bWFwKG9yaWcpKSB7Cj4gIAkJaWYgKHVubGlrZWx5KGZs
YWdzICYgRk9MTF9MT05HVEVSTSkpCj4gIAkJCXJldHVybiAwOwo+IC0JCXJldHVybiBfX2d1cF9k
ZXZpY2VfaHVnZV9wbWQob3JpZywgcG1kcCwgYWRkciwgZW5kLCBwYWdlcywgbnIpOwo+ICsJCXJl
dHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wbWQob3JpZywgcG1kcCwgYWRkciwgZW5kLCBmbGFncywK
PiArCQkJCQkgICAgIHBhZ2VzLCBucik7Cj4gIAl9Cj4gIAo+ICAJcmVmcyA9IDA7Cj4gQEAgLTIw
OTIsNyArMjA5OCw4IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90
ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgZ3VwX2h1
Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gLQkJ
dW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywgc3RydWN0IHBhZ2UgKipwYWdl
cywgaW50ICpucikKPiArCQkJdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywK
PiArCQkJc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAgewo+ICAJc3RydWN0IHBhZ2Ug
KmhlYWQsICpwYWdlOwo+ICAJaW50IHJlZnM7Cj4gQEAgLTIxMDMsNyArMjExMCw4IEBAIHN0YXRp
YyBpbnQgZ3VwX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25n
IGFkZHIsCj4gIAlpZiAocHVkX2Rldm1hcChvcmlnKSkgewo+ICAJCWlmICh1bmxpa2VseShmbGFn
cyAmIEZPTExfTE9OR1RFUk0pKQo+ICAJCQlyZXR1cm4gMDsKPiAtCQlyZXR1cm4gX19ndXBfZGV2
aWNlX2h1Z2VfcHVkKG9yaWcsIHB1ZHAsIGFkZHIsIGVuZCwgcGFnZXMsIG5yKTsKPiArCQlyZXR1
cm4gX19ndXBfZGV2aWNlX2h1Z2VfcHVkKG9yaWcsIHB1ZHAsIGFkZHIsIGVuZCwgZmxhZ3MsCj4g
KwkJCQkJICAgICBwYWdlcywgbnIpOwo+ICAJfQo+ICAKPiAgCXJlZnMgPSAwOwo+IC0tIAo+IDIu
MjMuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
