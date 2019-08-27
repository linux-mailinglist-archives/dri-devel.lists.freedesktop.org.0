Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E29DCC9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 06:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E9F89249;
	Tue, 27 Aug 2019 04:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1A389227;
 Tue, 27 Aug 2019 04:48:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 21:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="185174605"
Received: from sharmash-mobl3.gar.corp.intel.com (HELO [10.252.72.100])
 ([10.252.72.100])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 21:48:08 -0700
Subject: Re: [PATCH v9 3/6] drm: Extend I915 mei interface for transcoder info
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20190822151904.17919-1-ramalingam.c@intel.com>
 <20190822151904.17919-4-ramalingam.c@intel.com>
From: "Sharma, Shashank" <shashank.sharma@intel.com>
Message-ID: <4d2a0d7a-e364-bbc8-071c-d4bbd887479d@intel.com>
Date: Tue, 27 Aug 2019 10:18:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822151904.17919-4-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, tomas.winkler@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjIvMjAxOSA4OjQ5IFBNLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4gSTkxNSBuZWVkcyB0
byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNjb2RlciBhcyBwZXIgTUUgRlcuCj4gVG8gc3Vw
cG9ydCB0aGlzLCBkZWZpbmUgZW51bSBtZWlfZndfZGRpIGFuZCBhZGQgYXMgYSBtZW1iZXIgaW50
bwo+IHRoZSBzdHJ1Y3QgaGRjcF9wb3J0X2RhdGEuCgpUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5cyB5
b3UgYXJlIGRlZmluaW5nIGVudW0gbWVpX2Z3X2RkaSwgYnV0IHlvdSBhcmUgCmFjdHVhbGx5IGRl
ZmluaW5nIGVudW0gbWVpX2Z3X3RjOwoKLSBTaGFzaGFuawoKPiBTaWduZWQtb2ZmLWJ5OiBSYW1h
bGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gQWNrZWQtYnk6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gICBpbmNsdWRlL2RybS9pOTE1X21laV9o
ZGNwX2ludGVyZmFjZS5oIHwgMTMgKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNw
X2ludGVyZmFjZS5oIGIvaW5jbHVkZS9kcm0vaTkxNV9tZWlfaGRjcF9pbnRlcmZhY2UuaAo+IGlu
ZGV4IGE5N2FjZjFjOTcxMC4uMGRlNjI5YmYyZjYyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKPiArKysgYi9pbmNsdWRlL2RybS9pOTE1X21laV9o
ZGNwX2ludGVyZmFjZS5oCj4gQEAgLTU0LDkgKzU0LDIxIEBAIGVudW0gbWVpX2Z3X2RkaSB7Cj4g
ICAJTUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0EsCj4gICB9Owo+ICAgCj4gK2VudW0gbWVp
X2Z3X3RjIHsKPiArCU1FSV9JTlZBTElEX1RSQU5TQ09ERVIgPSAweDAwLAkvKiBJbnZhbGlkIHRy
YW5zY29kZXIgdHlwZSAqLwo+ICsJTUVJX1RDX0VEUCwJCQkvKiBUcmFuc2NvZGVyIGZvciBlRFAg
Ki8KPiArCU1FSV9UQ19EU0kwLAkJCS8qIFRyYW5zY29kZXIgZm9yIERTSTAgKi8KPiArCU1FSV9U
Q19EU0kxLAkJCS8qIFRyYW5zY29kZXIgZm9yIERTSTEgKi8KPiArCU1FSV9UQ19BID0gMHgxMCwJ
CS8qIFRyYW5zY29kZXIgVENBICovCj4gKwlNRUlfVENfQiwJCQkvKiBUcmFuc2NvZGVyIFRDQiAq
Lwo+ICsJTUVJX1RDX0MsCQkJLyogVHJhbnNjb2RlciBUQ0MgKi8KPiArCU1FSV9UQ19ECQkJLyog
VHJhbnNjb2RlciBUQ0QgKi8KPiArfTsKPiArCj4gICAvKioKPiAgICAqIHN0cnVjdCBoZGNwX3Bv
cnRfZGF0YSAtIGludGVsIHNwZWNpZmljIEhEQ1AgcG9ydCBkYXRhCj4gICAgKiBAZndfZGRpOiBk
ZGkgaW5kZXggYXMgcGVyIE1FIEZXCj4gKyAqIEBmd190YzogdHJhbnNjb2RlciBpbmRleCBhcyBw
ZXIgTUUgRlcKPiAgICAqIEBwb3J0X3R5cGU6IEhEQ1AgcG9ydCB0eXBlIGFzIHBlciBNRSBGVyBj
bGFzc2lmaWNhdGlvbgo+ICAgICogQHByb3RvY29sOiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1F
IEZXCj4gICAgKiBAazogTm8gb2Ygc3RyZWFtcyB0cmFuc21pdHRlZCBvbiBhIHBvcnQuIE9ubHkg
b24gRFAgTVNUIHRoaXMgaXMgIT0gMQo+IEBAIC02OSw2ICs4MSw3IEBAIGVudW0gbWVpX2Z3X2Rk
aSB7Cj4gICAgKi8KPiAgIHN0cnVjdCBoZGNwX3BvcnRfZGF0YSB7Cj4gICAJZW51bSBtZWlfZndf
ZGRpIGZ3X2RkaTsKPiArCWVudW0gbWVpX2Z3X3RjIGZ3X3RjOwo+ICAgCXU4IHBvcnRfdHlwZTsK
PiAgIAl1OCBwcm90b2NvbDsKPiAgIAl1MTYgazsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
