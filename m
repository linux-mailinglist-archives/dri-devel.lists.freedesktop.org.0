Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049FFAEEC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 11:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091AB6ECCD;
	Wed, 13 Nov 2019 10:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0956ECCD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:50:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B1ACB13C;
 Wed, 13 Nov 2019 10:50:51 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 23C1B1E1498; Wed, 13 Nov 2019 11:50:51 +0100 (CET)
Date: Wed, 13 Nov 2019 11:50:51 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 01/23] mm/gup: pass flags arg to __gup_device_*
 functions
Message-ID: <20191113105051.GH6367@quack2.suse.cz>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113042710.3997854-2-jhubbard@nvidia.com>
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlIDEyLTExLTE5IDIwOjI2OjQ4LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gQSBzdWJzZXF1
ZW50IHBhdGNoIHJlcXVpcmVzIGFjY2VzcyB0byBndXAgZmxhZ3MsIHNvCj4gcGFzcyB0aGUgZmxh
Z3MgYXJndW1lbnQgdGhyb3VnaCB0byB0aGUgX19ndXBfZGV2aWNlXyoKPiBmdW5jdGlvbnMuCj4g
Cj4gQWxzbyBwbGFjYXRlIGNoZWNrcGF0Y2gucGwgYnkgc2hvcnRlbmluZyBhIG5lYXJieSBsaW5l
Lgo+IAo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
PiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IENjOiBLaXJp
bGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKTG9va3MgZ29vZCEg
WW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KCgkJCQkJ
CQkJSG9uemEKCj4gLS0tCj4gIG1tL2d1cC5jIHwgMjggKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKPiBpbmRleCA4ZjIzNmEzMzVh
ZTkuLjg1Y2FmNzZiMzAxMiAxMDA2NDQKPiAtLS0gYS9tbS9ndXAuYwo+ICsrKyBiL21tL2d1cC5j
Cj4gQEAgLTE4OTAsNyArMTg5MCw4IEBAIHN0YXRpYyBpbnQgZ3VwX3B0ZV9yYW5nZShwbWRfdCBw
bWQsIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4gIAo+ICAjaWYgZGVm
aW5lZChDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUCkgJiYgZGVmaW5lZChDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UpCj4gIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2UodW5zaWduZWQg
bG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNpZ25lZCBsb25nIGVuZCwgc3Ry
dWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiArCQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwg
dW5zaWduZWQgaW50IGZsYWdzLAo+ICsJCQkgICAgIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAq
bnIpCj4gIHsKPiAgCWludCBucl9zdGFydCA9ICpucjsKPiAgCXN0cnVjdCBkZXZfcGFnZW1hcCAq
cGdtYXAgPSBOVUxMOwo+IEBAIC0xOTE2LDEzICsxOTE3LDE0IEBAIHN0YXRpYyBpbnQgX19ndXBf
ZGV2aWNlX2h1Z2UodW5zaWduZWQgbG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgfQo+
ICAKPiAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3Qg
KnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0
IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiArCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWdu
ZWQgaW50IGZsYWdzLAo+ICsJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gIHsK
PiAgCXVuc2lnbmVkIGxvbmcgZmF1bHRfcGZuOwo+ICAJaW50IG5yX3N0YXJ0ID0gKm5yOwo+ICAK
PiAgCWZhdWx0X3BmbiA9IHBtZF9wZm4ob3JpZykgKyAoKGFkZHIgJiB+UE1EX01BU0spID4+IFBB
R0VfU0hJRlQpOwo+IC0JaWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVu
ZCwgcGFnZXMsIG5yKSkKPiArCWlmICghX19ndXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRy
LCBlbmQsIGZsYWdzLCBwYWdlcywgbnIpKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCWlmICh1bmxp
a2VseShwbWRfdmFsKG9yaWcpICE9IHBtZF92YWwoKnBtZHApKSkgewo+IEBAIC0xOTMzLDEzICsx
OTM1LDE0IEBAIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBt
ZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgX19n
dXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25n
IGFkZHIsCj4gLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAq
bnIpCj4gKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKPiArCQkJ
CSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIGZh
dWx0X3BmbjsKPiAgCWludCBucl9zdGFydCA9ICpucjsKPiAgCj4gIAlmYXVsdF9wZm4gPSBwdWRf
cGZuKG9yaWcpICsgKChhZGRyICYgflBVRF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKPiAtCWlmICgh
X19ndXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIHBhZ2VzLCBucikpCj4gKwlp
ZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBmbGFncywgcGFnZXMs
IG5yKSkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAlpZiAodW5saWtlbHkocHVkX3ZhbChvcmlnKSAh
PSBwdWRfdmFsKCpwdWRwKSkpIHsKPiBAQCAtMTk1MCwxNCArMTk1MywxNiBAQCBzdGF0aWMgaW50
IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQg
bG9uZyBhZGRyLAo+ICB9Cj4gICNlbHNlCj4gIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2Vf
cG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gLQkJdW5z
aWduZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gKwkJCQkgdW5z
aWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKPiArCQkJCSBzdHJ1Y3QgcGFnZSAq
KnBhZ2VzLCBpbnQgKm5yKQo+ICB7Cj4gIAlCVUlMRF9CVUcoKTsKPiAgCXJldHVybiAwOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1ZF90
ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVj
dCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2ln
bmVkIGludCBmbGFncywKPiArCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICB7
Cj4gIAlCVUlMRF9CVUcoKTsKPiAgCXJldHVybiAwOwo+IEBAIC0yMDYyLDcgKzIwNjcsOCBAQCBz
dGF0aWMgaW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQg
bG9uZyBhZGRyLAo+ICAJaWYgKHBtZF9kZXZtYXAob3JpZykpIHsKPiAgCQlpZiAodW5saWtlbHko
ZmxhZ3MgJiBGT0xMX0xPTkdURVJNKSkKPiAgCQkJcmV0dXJuIDA7Cj4gLQkJcmV0dXJuIF9fZ3Vw
X2RldmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBhZGRyLCBlbmQsIHBhZ2VzLCBucik7Cj4gKwkJ
cmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBhZGRyLCBlbmQsIGZsYWdz
LAo+ICsJCQkJCSAgICAgcGFnZXMsIG5yKTsKPiAgCX0KPiAgCj4gIAlyZWZzID0gMDsKPiBAQCAt
MjA5Miw3ICsyMDk4LDggQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1k
X3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgfQo+ICAKPiAgc3RhdGljIGludCBndXBf
aHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAt
CQl1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50IGZsYWdzLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzLCBpbnQgKm5yKQo+ICsJCQl1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50IGZsYWdz
LAo+ICsJCQlzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICB7Cj4gIAlzdHJ1Y3QgcGFn
ZSAqaGVhZCwgKnBhZ2U7Cj4gIAlpbnQgcmVmczsKPiBAQCAtMjEwMyw3ICsyMTEwLDggQEAgc3Rh
dGljIGludCBndXBfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiAgCWlmIChwdWRfZGV2bWFwKG9yaWcpKSB7Cj4gIAkJaWYgKHVubGlrZWx5KGZs
YWdzICYgRk9MTF9MT05HVEVSTSkpCj4gIAkJCXJldHVybiAwOwo+IC0JCXJldHVybiBfX2d1cF9k
ZXZpY2VfaHVnZV9wdWQob3JpZywgcHVkcCwgYWRkciwgZW5kLCBwYWdlcywgbnIpOwo+ICsJCXJl
dHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wdWQob3JpZywgcHVkcCwgYWRkciwgZW5kLCBmbGFncywK
PiArCQkJCQkgICAgIHBhZ2VzLCBucik7Cj4gIAl9Cj4gIAo+ICAJcmVmcyA9IDA7Cj4gLS0gCj4g
Mi4yNC4wCj4gCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
