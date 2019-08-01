Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC837E47F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 22:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6086E808;
	Thu,  1 Aug 2019 20:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746936E808
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 20:52:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 13:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,335,1559545200"; d="scan'208";a="372736374"
Received: from markusbr-mobl5.ger.corp.intel.com (HELO [10.249.34.240])
 ([10.249.34.240])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2019 13:52:24 -0700
To: dri-devel <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Threaded submission & semaphore sharing
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
Date: Thu, 1 Aug 2019 23:52:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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

SGkgQ2hyaXN0aWFuLCBEYXZpZCwKClNvcnJ5IHRvIHJlcG9ydCB0aGlzIHNvIGxhdGUgaW4gdGhl
IHByb2Nlc3MsIGJ1dCBJIHRoaW5rIHdlIGZvdW5kIGFuIAppc3N1ZSBub3QgZGlyZWN0bHkgcmVs
YXRlZCB0byBzeW5jb2JqIHRpbWVsaW5lcyB0aGVtc2VsdmVzIGJ1dCB3aXRoIGEgCnNpZGUgZWZm
ZWN0IG9mIHRoZSB0aHJlYWRlZCBzdWJtaXNzaW9ucy4KCkVzc2VudGlhbGx5IHdlJ3JlIGZhaWxp
bmcgYSB0ZXN0IGluIGNydWNpYmxlIDogCmZ1bmMuc3luYy5zZW1hcGhvcmUtZmQub3BhcXVlLWZk
ClRoaXMgdGVzdCBjcmVhdGUgYSBzaW5nbGUgYmluYXJ5IHNlbWFwaG9yZSwgc2hhcmVzIGl0IGJl
dHdlZW4gMiAKVmtEZXZpY2UvVmtRdWV1ZS4KVGhlbiBpbiBhIGxvb3AgaXQgcHJvY2VlZHMgdG8g
c3VibWl0IHdvcmtsb2FkIGFsdGVybmF0aW5nIGJldHdlZW4gdGhlIDIgClZrUXVldWUgd2l0aCBv
bmUgc3VibWl0IGRlcGVuZGluZyBvbiB0aGUgb3RoZXIuCkl0IGRvZXMgc28gYnkgd2FpdGluZyBv
biB0aGUgVmtTZW1hcGhvcmUgc2lnbmFsZWQgaW4gdGhlIHByZXZpb3VzIAppdGVyYXRpb24gYW5k
IHJlc2lnbmFsaW5nIGl0LgoKVGhlIHByb2JsZW0gZm9yIHVzIGlzIHRoYXQgb25jZSB0aGluZ3Mg
YXJlIGRpc3BhdGNoZWQgdG8gdGhlIHN1Ym1pc3Npb24gCnRocmVhZCwgdGhlIG9yZGVyaW5nIG9m
IHRoZSBzdWJtaXNzaW9uIGlzIGxvc3QuCkJlY2F1c2Ugd2UgaGF2ZSAyIGRldmljZXMgYW5kIHRo
ZXkgYm90aCBoYXZlIHRoZWlyIG93biBzdWJtaXNzaW9uIHRocmVhZC4KCkphc29uIHN1Z2dlc3Rl
ZCB0aGF0IHdlIHJlZXN0YWJsaXNoIHRoZSBvcmRlcmluZyBieSBoYXZpbmcgCnNlbWFwaG9yZXMv
c3luY29ianMgY2FycnkgYW4gYWRkaXRpb25hbCB1aW50NjRfdCBwYXlsb2FkLgpUaGlzIDY0Yml0
IGludGVnZXIgd291bGQgcmVwcmVzZW50IGJlIGFuIGlkZW50aWZpZXIgdGhhdCBzdWJtaXNzaW9u
IAp0aHJlYWRzIHdpbGwgV0FJVF9GT1JfQVZBSUxBQkxFIG9uLgoKVGhlIHNjZW5hcmlvIHdvdWxk
IGxvb2sgbGlrZSB0aGlzIDoKIMKgwqDCoCAtIHZrUXVldWVTdWJtaXQocXVldWVBLCBzaWduYWwg
b24gc2VtQSk7CiDCoMKgwqAgwqDCoMKgIC0gaW4gdGhlIGNhbGxlciB0aHJlYWQsIHRoaXMgd291
bGQgaW5jcmVtZW50IHRoZSBzeW5jb2JqIAphZGRpdGlvbmFsIHU2NCBwYXlsb2FkIGFuZCByZXR1
cm4gaXQgdG8gdXNlcnNwYWNlLgogwqDCoMKgIMKgwqDCoCAtIGF0IHNvbWUgcG9pbnQgdGhlIHN1
Ym1pc3Npb24gdGhyZWFkIG9mIHF1ZXVlQSBzdWJtaXRzIHRoZSAKd29ya2xvYWQgYW5kIHNpZ25h
bCB0aGUgc3luY29iaiBvZiBzZW1BIHdpdGggdmFsdWUgcmV0dXJuZWQgaW4gdGhlIApjYWxsZXIg
dGhyZWFkIG9mIHZrUXVldWVTdWJtaXQoKS4KIMKgwqDCoCAtIHZrUXVldWVTdWJtaXQocXVldWVC
LCB3YWl0IG9uIHNlbUEpOwogwqDCoMKgIMKgwqDCoCAtIGluIHRoZSBjYWxsZXIgdGhyZWFkLCB0
aGlzIHdvdWxkIHJlYWQgdGhlIHN5bmNvYmogYWRkaXRpb25hbCAKdTY0IHBheWxvYWQKIMKgwqDC
oCDCoMKgwqAgLSBhdCBzb21lIHBvaW50IHRoZSBzdWJtaXNzaW9uIHRocmVhZCBvZiBxdWV1ZUIg
d2lsbCB0cnkgdG8gCnN1Ym1pdCB0aGUgd29yaywgYnV0IGZpcnN0IGl0IHdpbGwgV0FJVF9GT1Jf
QVZBSUxBQkxFIHRoZSB1NjQgdmFsdWUgCnJldHVybmVkIGluIHRoZSBzdGVwIGFib3ZlCgpCZWNh
dXNlIHdlIHdhbnQgdGhlIGJpbmFyeSBzZW1hcGhvcmVzIHRvIGJlIHNoYXJlZCBhY3Jvc3MgcHJv
Y2Vzc2VzIGFuZCAKd291bGQgbGlrZSB0aGlzIHRvIHJlbWFpbiBhIHNpbmdsZSBGRCwgdGhlIHNp
bXBsZXN0IGxvY2F0aW9uIHRvIHN0b3JlIAp0aGlzIGFkZGl0aW9uYWwgdTY0IHBheWxvYWQgd291
bGQgYmUgdGhlIERSTSBzeW5jb2JqLgpJdCB3b3VsZCBuZWVkIGFuIGFkZGl0aW9uYWwgaW9jdGwg
dG8gcmVhZCAmIGluY3JlbWVudCB0aGUgdmFsdWUuCgpXaGF0IGRvIHlvdSB0aGluaz8KCi1MaW9u
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
