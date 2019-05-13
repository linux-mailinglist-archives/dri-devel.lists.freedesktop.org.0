Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1F1BE7E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DA189228;
	Mon, 13 May 2019 20:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AAB89228;
 Mon, 13 May 2019 20:17:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 13:17:14 -0700
X-ExtLoop1: 1
Received: from vlizunov-mobl.ger.corp.intel.com (HELO [10.252.21.200])
 ([10.252.21.200])
 by orsmga007.jf.intel.com with ESMTP; 13 May 2019 13:17:12 -0700
Subject: Re: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
To: zhoucm1 <zhoucm1@amd.com>, Chunming Zhou <david1.zhou@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20190513095305.14110-1-david1.zhou@amd.com>
 <9179e6bc-77f3-f284-d1ad-13d8956e1919@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <d4cf0b6f-81e9-a6a1-4f94-0f3b02ca3a3c@intel.com>
Date: Mon, 13 May 2019 21:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9179e6bc-77f3-f284-d1ad-13d8956e1919@amd.com>
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

U29ycnkgZm9yIHRoZSBkZWxheSwgSSdsbCB0cnkgdG8gcmV2aWV3IHRoaXMgdG9tb3Jyb3cuCgot
TGlvbmVsCgpPbiAxMy8wNS8yMDE5IDExOjE1LCB6aG91Y20xIHdyb3RlOgo+IHBpbmcuLi4gZm9y
IHBhdGNoIHNldC4KPgo+Cj4gT24gMjAxOeW5tDA15pyIMTPml6UgMTc6NTIsIENodW5taW5nIFpo
b3Ugd3JvdGU6Cj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGluY2x1
ZGUvZHJtL2FtZGdwdV9kcm0uaCB8IDkgKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0u
aCBiL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAo+PiBpbmRleCBkMDcwMWZmYy4uM2QwMzE4ZTYg
MTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAo+PiArKysgYi9pbmNsdWRl
L2RybS9hbWRncHVfZHJtLmgKPj4gQEAgLTUyOCw2ICs1MjgsOCBAQCBzdHJ1Y3QgZHJtX2FtZGdw
dV9nZW1fdmEgewo+PiDCoCAjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TWU5DT0JKX09VVMKgwqDC
oMKgIDB4MDUKPj4gwqAgI2RlZmluZSBBTURHUFVfQ0hVTktfSURfQk9fSEFORExFU8KgwqDCoMKg
wqAgMHgwNgo+PiDCoCAjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TQ0hFRFVMRURfREVQRU5ERU5D
SUVTIDB4MDcKPj4gKyNkZWZpbmUgQU1ER1BVX0NIVU5LX0lEX1NZTkNPQkpfVElNRUxJTkVfV0FJ
VMKgwqDCoCAweDA4Cj4+ICsjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TWU5DT0JKX1RJTUVMSU5F
X1NJR05BTMKgIDB4MDkKPj4KPj4gwqAgc3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmsgewo+PiDC
oMKgwqDCoMKgwqDCoMKgIF9fdTMywqDCoMKgwqDCoMKgwqDCoMKgwqAgY2h1bmtfaWQ7Cj4+IEBA
IC02MDgsNiArNjEwLDEzIEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2NzX2NodW5rX3NlbSB7Cj4+IMKg
wqDCoMKgwqDCoMKgwqAgX191MzIgaGFuZGxlOwo+PiDCoCB9Owo+Pgo+PiArc3RydWN0IGRybV9h
bWRncHVfY3NfY2h1bmtfc3luY29iaiB7Cj4+ICvCoMKgwqDCoMKgwqAgX191MzIgaGFuZGxlOwo+
PiArwqDCoMKgwqDCoMKgIF9fdTMyIGZsYWdzOwo+PiArwqDCoMKgwqDCoMKgIF9fdTY0IHBvaW50
Owo+PiArfTsKPj4gKwo+PiArCj4+IMKgICNkZWZpbmUgQU1ER1BVX0ZFTkNFX1RPX0hBTkRMRV9H
RVRfU1lOQ09CSsKgwqDCoMKgIDAKPj4gwqAgI2RlZmluZSBBTURHUFVfRkVOQ0VfVE9fSEFORExF
X0dFVF9TWU5DT0JKX0ZEwqAgMQo+PiDCoCAjZGVmaW5lIEFNREdQVV9GRU5DRV9UT19IQU5ETEVf
R0VUX1NZTkNfRklMRV9GRMKgwqDCoMKgwqDCoMKgIDIKPj4gLS0gCj4+IDIuMTcuMQo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
