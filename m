Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FDE1C646
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 11:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7C89202;
	Tue, 14 May 2019 09:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD588E6B;
 Tue, 14 May 2019 09:44:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 02:44:35 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.103.238.204]) ([10.103.238.204])
 by orsmga005.jf.intel.com with ESMTP; 14 May 2019 02:44:33 -0700
Subject: Re: [PATCH libdrm 4/7] add timeline signal/transfer ioctls v2
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20190513095305.14110-1-david1.zhou@amd.com>
 <20190513095305.14110-4-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <650e63c2-abd7-7eed-905f-83e52bd353c2@intel.com>
Date: Tue, 14 May 2019 10:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513095305.14110-4-david1.zhou@amd.com>
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDUvMjAxOSAxMDo1MywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiB2MjogdXNlIG9uZSB0
cmFuc2ZlciBpb2N0bAo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpo
b3VAYW1kLmNvbT4KPiAtLS0KPiAgIHhmODZkcm0uYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAgeGY4NmRybS5oIHwgIDYgKysrKysrCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDM5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94Zjg2ZHJtLmMgYi94Zjg2ZHJt
LmMKPiBpbmRleCAxN2UzZDg4MC4uYWNkMTZmYWIgMTAwNjQ0Cj4gLS0tIGEveGY4NmRybS5jCj4g
KysrIGIveGY4NmRybS5jCj4gQEAgLTQyNTcsNiArNDI1NywyMSBAQCBkcm1fcHVibGljIGludCBk
cm1TeW5jb2JqU2lnbmFsKGludCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsCj4gICAgICAg
cmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+ICtkcm1fcHVibGljIGludCBkcm1TeW5jb2JqVGltZWxp
bmVTaWduYWwoaW50IGZkLCBjb25zdCB1aW50MzJfdCAqaGFuZGxlcywKPiArCQkJCQl1aW50NjRf
dCAqcG9pbnRzLCB1aW50MzJfdCBoYW5kbGVfY291bnQpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1f
c3luY29ial90aW1lbGluZV9hcnJheSBhcmdzOwo+ICsgICAgaW50IHJldDsKPiArCj4gKyAgICBt
ZW1jbGVhcihhcmdzKTsKPiArICAgIGFyZ3MuaGFuZGxlcyA9ICh1aW50cHRyX3QpaGFuZGxlczsK
PiArICAgIGFyZ3MucG9pbnRzID0gKHVpbnQ2NF90KSh1aW50cHRyX3QpcG9pbnRzOwoKCkkgdGhp
bmsgeW91IGNhbiBkcm9wIHRoZSB1aW50NjRfdCBjYXN0LgoKCj4gKyAgICBhcmdzLmNvdW50X2hh
bmRsZXMgPSBoYW5kbGVfY291bnQ7Cj4gKwo+ICsgICAgcmV0ID0gZHJtSW9jdGwoZmQsIERSTV9J
T0NUTF9TWU5DT0JKX1RJTUVMSU5FX1NJR05BTCwgJmFyZ3MpOwo+ICsgICAgcmV0dXJuIHJldDsK
PiArfQo+ICsKPiAgIGRybV9wdWJsaWMgaW50IGRybVN5bmNvYmpUaW1lbGluZVdhaXQoaW50IGZk
LCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKPiAgIAkJCQkgICAgICB1bnNp
Z25lZCBudW1faGFuZGxlcywKPiAgIAkJCQkgICAgICBpbnQ2NF90IHRpbWVvdXRfbnNlYywgdW5z
aWduZWQgZmxhZ3MsCj4gQEAgLTQyOTksNCArNDMxNCwyMiBAQCBkcm1fcHVibGljIGludCBkcm1T
eW5jb2JqUXVlcnkoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywK
PiAgICAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtkcm1fcHVibGljIGludCBkcm1TeW5jb2Jq
VHJhbnNmZXIoaW50IGZkLAo+ICsJCQkJICB1aW50MzJfdCBkc3RfaGFuZGxlLCB1aW50NjRfdCBk
c3RfcG9pbnQsCj4gKwkJCQkgIHVpbnQzMl90IHNyY19oYW5kbGUsIHVpbnQ2NF90IHNyY19wb2lu
dCwKPiArCQkJCSAgdWludDMyX3QgZmxhZ3MpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1fc3luY29i
al90cmFuc2ZlciBhcmdzOwo+ICsgICAgaW50IHJldDsKPiArCj4gKyAgICBtZW1jbGVhcihhcmdz
KTsKPiArICAgIGFyZ3Muc3JjX2hhbmRsZSA9IHNyY19oYW5kbGU7Cj4gKyAgICBhcmdzLmRzdF9o
YW5kbGUgPSBkc3RfaGFuZGxlOwo+ICsgICAgYXJncy5zcmNfcG9pbnQgPSBzcmNfcG9pbnQ7Cj4g
KyAgICBhcmdzLmRzdF9wb2ludCA9IGRzdF9wb2ludDsKPiArICAgIGFyZ3MuZmxhZ3MgPSBmbGFn
czsKPiArCj4gKyAgICByZXQgPSBkcm1Jb2N0bChmZCwgRFJNX0lPQ1RMX1NZTkNPQkpfVFJBTlNG
RVIsICZhcmdzKTsKPiAgIAo+ICsgICAgcmV0dXJuIHJldDsKPiArfQo+IGRpZmYgLS1naXQgYS94
Zjg2ZHJtLmggYi94Zjg2ZHJtLmgKPiBpbmRleCA2MGM3YTg0Zi4uM2ZiMWQxY2EgMTAwNjQ0Cj4g
LS0tIGEveGY4NmRybS5oCj4gKysrIGIveGY4NmRybS5oCj4gQEAgLTg3NiwxMiArODc2LDE4IEBA
IGV4dGVybiBpbnQgZHJtU3luY29ialdhaXQoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdW5z
aWduZWQgbnVtX2hhbmRsZXMsCj4gICAJCQkgIHVpbnQzMl90ICpmaXJzdF9zaWduYWxlZCk7Cj4g
ICBleHRlcm4gaW50IGRybVN5bmNvYmpSZXNldChpbnQgZmQsIGNvbnN0IHVpbnQzMl90ICpoYW5k
bGVzLCB1aW50MzJfdCBoYW5kbGVfY291bnQpOwo+ICAgZXh0ZXJuIGludCBkcm1TeW5jb2JqU2ln
bmFsKGludCBmZCwgY29uc3QgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQzMl90IGhhbmRsZV9jb3Vu
dCk7Cj4gK2V4dGVybiBpbnQgZHJtU3luY29ialRpbWVsaW5lU2lnbmFsKGludCBmZCwgY29uc3Qg
dWludDMyX3QgKmhhbmRsZXMsCj4gKwkJCQkgICAgdWludDY0X3QgKnBvaW50cywgdWludDMyX3Qg
aGFuZGxlX2NvdW50KTsKPiAgIGV4dGVybiBpbnQgZHJtU3luY29ialRpbWVsaW5lV2FpdChpbnQg
ZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICAgCQkJCSAgdW5zaWdu
ZWQgbnVtX2hhbmRsZXMsCj4gICAJCQkJICBpbnQ2NF90IHRpbWVvdXRfbnNlYywgdW5zaWduZWQg
ZmxhZ3MsCj4gICAJCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwo+ICAgZXh0ZXJuIGlu
dCBkcm1TeW5jb2JqUXVlcnkoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBv
aW50cywKPiAgIAkJCSAgIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Cj4gK2V4dGVybiBpbnQgZHJt
U3luY29ialRyYW5zZmVyKGludCBmZCwKPiArCQkJICAgICAgdWludDMyX3QgZHN0X2hhbmRsZSwg
dWludDY0X3QgZHN0X3BvaW50LAo+ICsJCQkgICAgICB1aW50MzJfdCBzcmNfaGFuZGxlLCB1aW50
NjRfdCBzcmNfcG9pbnQsCj4gKwkJCSAgICAgIHVpbnQzMl90IGZsYWdzKTsKPiAgIAo+ICAgI2lm
IGRlZmluZWQoX19jcGx1c3BsdXMpCj4gICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
