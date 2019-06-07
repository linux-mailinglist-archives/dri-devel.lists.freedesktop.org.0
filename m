Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C03992A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 00:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA461891A6;
	Fri,  7 Jun 2019 22:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A5A891A6;
 Fri,  7 Jun 2019 22:54:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 15:54:39 -0700
X-ExtLoop1: 1
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2019 15:54:38 -0700
Date: Fri, 7 Jun 2019 15:55:53 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 hmm 05/11] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
Message-ID: <20190607225552.GG14559@iweiny-DESK2.sc.intel.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
 <20190607133107.GF14802@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607133107.GF14802@ziepe.ca>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTA6MzE6MDdBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoZSB3YWl0X2V2ZW50X3RpbWVvdXQgbWFjcm8gYWxyZWFkeSB0ZXN0cyB0aGUg
Y29uZGl0aW9uIGFzIGl0cyBmaXJzdAo+IGFjdGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRv
IG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24gb2YgdGhpcywgYWxsCj4gdGhhdCBkb2VzIGlzIHNr
aXAgdGhlIG1pZ2h0X3NsZWVwKCkgZGVidWdnaW5nIGluIGNvbW1vbiBjYXNlcywgd2hpY2ggaXMK
PiBub3QgaGVscGZ1bC4KPiAKPiBGdXJ0aGVyLCBiYXNlZCBvbiBwcmlvciBwYXRjaGVzLCB3ZSBj
YW4gbm93IHNpbXBsaWZ5IHRoZSByZXF1aXJlZCBjb25kaXRpb24KPiB0ZXN0Ogo+ICAtIElmIHJh
bmdlIGlzIHZhbGlkIG1lbW9yeSB0aGVuIHNvIGlzIHJhbmdlLT5obW0KPiAgLSBJZiBobW1fcmVs
ZWFzZSgpIGhhcyBydW4gdGhlbiByYW5nZS0+dmFsaWQgaXMgc2V0IHRvIGZhbHNlCj4gICAgYXQg
dGhlIHNhbWUgdGltZSBhcyBkZWFkLCBzbyBubyByZWFzb24gdG8gY2hlY2sgYm90aC4KPiAgLSBB
IHZhbGlkIGhtbSBoYXMgYSB2YWxpZCBobW0tPm1tLgo+IAo+IEFsbG93aW5nIHRoZSByZXR1cm4g
dmFsdWUgb2Ygd2FpdF9ldmVudF90aW1lb3V0KCkgKGFsb25nIHdpdGggaXRzIGludGVybmFsCj4g
YmFycmllcnMpIHRvIGNvbXB1dGUgdGhlIHJlc3VsdCBvZiB0aGUgZnVuY3Rpb24uCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmV2aWV3ZWQt
Ynk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KCj4gLS0tCj4gdjMKPiAtIFNpbXBs
aWZ5IHRoZSB3YWl0X2V2ZW50X3RpbWVvdXQgdG8gbm90IGNoZWNrIHZhbGlkCj4gLS0tCj4gIGlu
Y2x1ZGUvbGludXgvaG1tLmggfCAxMyArKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAo+IGluZGV4IDFkOTdiNmQ2MmM1YmNm
Li4yNmU3YzQ3NzQ5MGM0ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9obW0uaAo+IEBAIC0yMDksMTcgKzIwOSw4IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZyBobW1fcmFuZ2VfcGFnZV9zaXplKGNvbnN0IHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlKQo+ICBzdGF0aWMgaW5saW5lIGJvb2wgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFs
aWQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyB0
aW1lb3V0KQo+ICB7Cj4gLQkvKiBDaGVjayBpZiBtbSBpcyBkZWFkID8gKi8KPiAtCWlmIChyYW5n
ZS0+aG1tID09IE5VTEwgfHwgcmFuZ2UtPmhtbS0+ZGVhZCB8fCByYW5nZS0+aG1tLT5tbSA9PSBO
VUxMKSB7Cj4gLQkJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Cj4gLQkJcmV0dXJuIGZhbHNlOwo+IC0J
fQo+IC0JaWYgKHJhbmdlLT52YWxpZCkKPiAtCQlyZXR1cm4gdHJ1ZTsKPiAtCXdhaXRfZXZlbnRf
dGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFuZ2UtPnZhbGlkIHx8IHJhbmdlLT5obW0tPmRlYWQs
Cj4gLQkJCSAgIG1zZWNzX3RvX2ppZmZpZXModGltZW91dCkpOwo+IC0JLyogUmV0dXJuIGN1cnJl
bnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBnZXQgbHVja3kgKi8KPiAtCXJldHVybiBy
YW5nZS0+dmFsaWQ7Cj4gKwlyZXR1cm4gd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndx
LCByYW5nZS0+dmFsaWQsCj4gKwkJCQkgIG1zZWNzX3RvX2ppZmZpZXModGltZW91dCkpICE9IDA7
Cj4gIH0KPiAgCj4gIC8qCj4gLS0gCj4gMi4yMS4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
