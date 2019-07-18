Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2C6CF72
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967B6E3CE;
	Thu, 18 Jul 2019 14:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414736E3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:08:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 07:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,278,1559545200"; d="scan'208";a="158791144"
Received: from lelicken-mobl1.ger.corp.intel.com (HELO [10.249.33.88])
 ([10.249.33.88])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 07:08:36 -0700
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Chunming Zhou <zhoucm1@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
 <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <36d29516-42e7-6ce5-88fc-a005ed4432d6@intel.com>
Date: Thu, 18 Jul 2019 17:08:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDcvMjAxOSAxNjowMiwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiDlnKggMjAxOS83LzE4
IDE5OjMxLCBMaW9uZWwgTGFuZHdlcmxpbiDlhpnpgZM6Cj4+IE9uIDE4LzA3LzIwMTkgMTQ6MTMs
IENodW5taW5nIFpob3Ugd3JvdGU6Cj4+PiBpZiBXQUlUX0ZPUl9TVUJNSVQgaXNuJ3Qgc2V0IGFu
ZCBpbiB0aGUgbWVhbndoaWxlIG5vIHVuZGVybHlpbmcgZmVuY2UKPj4+IG9uIHN5bmNvYmosCj4+
PiB0aGVuIHJldHVybiBub24tYmxvY2sgZXJyb3IgY29kZSB0byB1c2VyIHNhcGNlLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+Cj4+PiAt
LS0KPj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDQgKystLQo+Pj4gIMKg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCj4+PiBpbmRleCAzNjFhMDFhMDhjMTguLjkyOWY3YzY0Zjlh
MiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+Pj4gQEAgLTI1Miw3ICsyNTIsNyBAQCBp
bnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpbGUKPj4+ICpmaWxlX3ByaXZh
dGUsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoKmZlbmNlKTsKPj4+ICDCoMKgwqDCoMKgIH0gZWxz
ZSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTlZBTDsKPj4+ICvCoMKgwqDCoMKgwqDC
oCByZXQgPSAtRU5PVEJMSzsKPj4+ICDCoMKgwqDCoMKgIH0KPj4+ICDCoCDCoMKgwqDCoMKgIGlm
ICghKGZsYWdzICYgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpKQo+Pj4g
QEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgc2lnbmVkIGxvbmcKPj4+IGRybV9zeW5jb2JqX2Fy
cmF5X3dhaXRfdGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2JqcywKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdT
X1dBSVRfRk9SX1NVQk1JVCkgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCA9IC1FSU5WQUw7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVvdXQgPSAtRU5PVEJMSzsKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gY2xlYW51cF9lbnRyaWVzOwo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
fQo+Pgo+PiBUaGlzIHdvdWxkIGJyZWFrIGV4aXN0aW5nIHRlc3RzIGZvciBiaW5hcnkgc3luY29i
anMuCj4gSG93IGRvZXMgdGhpcyBicmVha3MgYmluYXJ5IHN5bmNvYmo/CgoKVGhpcyBpcyB1c2Vk
IGluIHRoZSBzdWJtaXNzaW9uIHBhdGggb2Ygc2V2ZXJhbCBkcml2ZXJzLgoKQ2hhbmdpbmcgdGhl
IGVycm9yIGNvZGUgd2lsbCBjaGFuZ2Ugd2hhdCB0aGUgZHJpdmVycyBhcmUgcmVwb3J0aW5nIHRv
IAp1c2Vyc3BhY2UgYW5kIGNvdWxkIGJyZWFrIHRlc3RzLgoKCmk5MTUgZG9lc24ndCB1c2UgdGhh
dCBmdW5jdGlvbiBzbyBpdCdzIG5vdCBhZmZlY3RlZCBidXQgCmxpbWEvcGFuZnJvc3QvdmM0IHNl
ZW0gdG8gYmUuCgoKPgo+Cj4+IElzIHRoaXMgcmVhbGx5IHdoYXQgd2Ugd2FudD8KPiBJIHdhbnQg
dG8gdXNlIHRoaXMgbWVhbmluZ2Z1bCByZXR1cm4gdmFsdWUgdG8ganVkZ2UgaWYgV2FpdEJlZm9y
ZVNpZ25hbAo+IGhhcHBlbnMuCj4KPiBJIHRoaW5rIHRoaXMgaXMgdGhlIGNoZWFwZXN0IGNoYW5n
ZSBmb3IgdGhhdC4KCgpJIHRob3VnaHQgdGhlIHBsYW4gd2FzIHRvIGFkZCBhIG5ldyBpb2N0bCB0
byBxdWVyeSB0aGUgbGFzdCBzdWJtaXR0ZWQgdmFsdWUuCgpEaWQgSSBtaXN1bmRlcnN0YW5kPwoK
ClRoYW5rcywKCgotTGlvbmVsCgoKPgo+IC1EYXZpZAo+Cj4KPj4KPj4gLUxpb25lbAo+Pgo+PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
