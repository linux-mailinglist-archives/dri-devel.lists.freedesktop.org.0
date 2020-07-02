Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA68F211EB7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE87B6E53C;
	Thu,  2 Jul 2020 08:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B26E536;
 Thu,  2 Jul 2020 08:26:36 +0000 (UTC)
IronPort-SDR: 0M5lwss8j4qRBl8nti1U1P6h9RwZTt1zPxOJmWZboy6u3feoiAPU1lDqFEcROb0eISUVXwfWei
 1RGf3guNGxRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231704671"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="231704671"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 01:26:36 -0700
IronPort-SDR: cbv9JT2bAFEOIV7IXo1ZfLCUTS7GSSeyutqzqXFCiFkZ2c+1qYCUtR3+9tWn4qcott6whUEpF+
 7Z+1juE9yDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="321466538"
Received: from ssteinbo-mobl.ger.corp.intel.com (HELO [10.249.43.78])
 ([10.249.43.78])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2020 01:26:35 -0700
Subject: Re: [PATCH 1/2] Revert "dma-buf: Report signaled links inside
 dma-fence-chain"
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <eb6a07bc-a314-1a2b-c27a-84d2785867dc@intel.com>
Date: Thu, 2 Jul 2020 11:26:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDYvMjAyMCAxNTo0MywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyNS4wNi4y
MCB1bSAxNDozNCBzY2hyaWViIExpb25lbCBMYW5kd2VybGluOgo+PiBUaGlzIHJldmVydHMgY29t
bWl0IDVkZTM3NmJiNDM0ZjgwYTEzMTM4ZjBlYmVkYzgzNTFhYjczZDhiMGQuCj4+Cj4+IFRoaXMg
Y2hhbmdlIGJyZWFrcyBzeW5jaHJvbml6YXRpb24gb2YgYSB0aW1lbGluZS4KPj4gZG1hX2ZlbmNl
X2NoYWluX2ZpbmRfc2Vxbm8oKSBtaWdodCBiZSBhIGJpdCBvZiBhIGNvbmZ1c2luZyBuYW1lIGJ1
dAo+PiB0aGlzIGZ1bmN0aW9uIGlzIG5vdCB0cnlpbmcgdG8gZmluZCBhIHBhcnRpY3VsYXIgc2Vx
bm8sIGlzIHN1cHBvc2VkIHRvCj4+IGdpdmUgYSBmZW5jZSB0byB3YWl0IG9uIGZvciBhIHBhcnRp
Y3VsYXIgcG9pbnQgaW4gdGhlIHRpbWVsaW5lLgo+Pgo+PiBJbiBhIHRpbWVsaW5lLCBhIHBhcnRp
Y3VsYXIgdmFsdWUgaXMgcmVhY2hlZCB3aGVuIGFsbCB0aGUgcG9pbnRzIHVwIHRvCj4+IGFuZCBp
bmNsdWRpbmcgdGhhdCB2YWx1ZSBoYXZlIHNpZ25hbGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBM
aW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKCk5v
dyB0aGF0IHlvdSBhcmUgYSBtYWludGFpbmVyLCBmZWVsIGZyZWUgdG8gbWVyZ2UgdGhpcyBhbmQg
dGhlIHRlc3QgY2hhbmdlcy4KCgpUaGFua3MsCgoKLUxpb25lbAoKCj4KPj4gLS0tCj4+IMKgIGRy
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyB8IDcgLS0tLS0tLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtZmVuY2UtY2hhaW4uYyAKPj4gYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWlu
LmMKPj4gaW5kZXggYzQzNWJiYmE4NTFjLi4zZDEyMzUwMmZmMTIgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+PiArKysgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLWNoYWluLmMKPj4gQEAgLTk5LDEyICs5OSw2IEBAIGludCBkbWFfZmVuY2VfY2hh
aW5fZmluZF9zZXFubyhzdHJ1Y3QgZG1hX2ZlbmNlIAo+PiAqKnBmZW5jZSwgdWludDY0X3Qgc2Vx
bm8pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqAgwqDCoMKgwqDC
oCBkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goKnBmZW5jZSwgJmNoYWluLT5iYXNlKSB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCBpZiAoKCpwZmVuY2UpLT5zZXFubyA8IHNlcW5vKSB7IC8qIGFscmVhZHkg
c2lnbmFsZWQgKi8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dCgqcGZl
bmNlKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnBmZW5jZSA9IE5VTEw7Cj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiAtwqDCoMKgwqDCoMKgwqAgfQo+PiAtCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoKCpwZmVuY2UpLT5jb250ZXh0ICE9IGNoYWluLT5iYXNlLmNv
bnRleHQgfHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG9fZG1hX2ZlbmNlX2NoYWlu
KCpwZmVuY2UpLT5wcmV2X3NlcW5vIDwgc2Vxbm8pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+PiBAQCAtMjI4LDcgKzIyMiw2IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNl
X2NoYWluX29wcyk7Cj4+IMKgwqAgKiBAY2hhaW46IHRoZSBjaGFpbiBub2RlIHRvIGluaXRpYWxp
emUKPj4gwqDCoCAqIEBwcmV2OiB0aGUgcHJldmlvdXMgZmVuY2UKPj4gwqDCoCAqIEBmZW5jZTog
dGhlIGN1cnJlbnQgZmVuY2UKPj4gLSAqIEBzZXFubzogdGhlIHNlcXVlbmNlIG51bWJlciAoc3lu
Y3B0KSBvZiB0aGUgZmVuY2Ugd2l0aGluIHRoZSBjaGFpbgo+PiDCoMKgICoKPj4gwqDCoCAqIElu
aXRpYWxpemUgYSBuZXcgY2hhaW4gbm9kZSBhbmQgZWl0aGVyIHN0YXJ0IGEgbmV3IGNoYWluIG9y
IGFkZCAKPj4gdGhlIG5vZGUgdG8KPj4gwqDCoCAqIHRoZSBleGlzdGluZyBjaGFpbiBvZiB0aGUg
cHJldmlvdXMgZmVuY2UuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
