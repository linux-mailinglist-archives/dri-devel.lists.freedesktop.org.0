Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568272004
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 21:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4E06E3A0;
	Tue, 23 Jul 2019 19:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554CD6E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 19:20:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 12:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="193171889"
Received: from mpietras-mobl.ger.corp.intel.com (HELO [10.249.35.21])
 ([10.249.35.21])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2019 12:20:28 -0700
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability v2
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org
References: <20190723142114.24688-1-david1.zhou@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <fe5bff32-b7b4-e388-61e7-950b0125d8fc@intel.com>
Date: Tue, 23 Jul 2019 22:20:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723142114.24688-1-david1.zhou@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDcvMjAxOSAxNzoyMSwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiB1c2VyIHNwYWNlIG5l
ZWRzIGEgZmxleGlhYmxlIHF1ZXJ5IGFiaWxpdHkuCj4gU28gdGhhdCB1bWQgY2FuIGdldCBsYXN0
IHNpZ25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4KPiB2MjoKPiBhZGQgc2FuaXRpemVyIGNoZWNr
aW5nLgo+Cj4gQ2hhbmdlLUlkOiBJNjUxMmI0MzA1MjRlYmFiZTcxNWU2MDJhMmJmNWFiYjBhN2U3
ODBlYQo+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+
Cj4gQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4K
PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgoKUmV2aWV3
ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4K
Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDM0ICsrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtLmggICAgICAg
IHwgIDMgKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiBpbmRleCAzZDQwMDkwNTEwMGIuLjNmYzhm
NjZhZGE2OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gQEAgLTExOTcsNyArMTE5Nyw3IEBA
IGRybV9zeW5jb2JqX3RpbWVsaW5lX3NpZ25hbF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAo+ICAgCWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZF
Ul9TWU5DT0JKX1RJTUVMSU5FKSkKPiAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgCj4gLQlp
ZiAoYXJncy0+cGFkICE9IDApCj4gKwlpZiAoYXJncy0+ZmxhZ3MgIT0gMCkKPiAgIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gICAKPiAgIAlpZiAoYXJncy0+Y291bnRfaGFuZGxlcyA9PSAwKQo+IEBAIC0x
MjY4LDcgKzEyNjgsNyBAQCBpbnQgZHJtX3N5bmNvYmpfcXVlcnlfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgIAlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfU1lOQ09CSl9USU1FTElORSkpCj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsK
PiAgIAo+IC0JaWYgKGFyZ3MtPnBhZCAhPSAwKQo+ICsJaWYgKGFyZ3MtPmZsYWdzICYgfkRSTV9T
WU5DT0JKX1FVRVJZX0ZMQUdTX0xBU1RfU1VCTUlUVEVEKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsK
PiAgIAo+ICAgCWlmIChhcmdzLT5jb3VudF9oYW5kbGVzID09IDApCj4gQEAgLTEyOTEsMjMgKzEy
OTEsMjkgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCj4gICAJCWlmIChjaGFpbikgewo+ICAgCQkJc3RydWN0IGRtYV9mZW5j
ZSAqaXRlciwgKmxhc3Rfc2lnbmFsZWQgPSBOVUxMOwo+ICAgCj4gLQkJCWRtYV9mZW5jZV9jaGFp
bl9mb3JfZWFjaChpdGVyLCBmZW5jZSkgewo+IC0JCQkJaWYgKCFpdGVyKQo+IC0JCQkJCWJyZWFr
Owo+IC0JCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKPiAtCQkJCWxhc3Rfc2lnbmFs
ZWQgPSBkbWFfZmVuY2VfZ2V0KGl0ZXIpOwo+IC0JCQkJaWYgKCF0b19kbWFfZmVuY2VfY2hhaW4o
bGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pCj4gLQkJCQkJLyogSXQgaXMgbW9zdCBsaWtlbHkg
dGhhdCB0aW1lbGluZSBoYXMKPiAtCQkJCQkgKiB1bm9yZGVyIHBvaW50cy4gKi8KPiAtCQkJCQli
cmVhazsKPiArCQkJaWYgKGFyZ3MtPmZsYWdzICYKPiArCQkJICAgIERSTV9TWU5DT0JKX1FVRVJZ
X0ZMQUdTX0xBU1RfU1VCTUlUVEVEKSB7Cj4gKwkJCQlwb2ludCA9IGZlbmNlLT5zZXFubzsKPiAr
CQkJfSBlbHNlIHsKPiArCQkJCWRtYV9mZW5jZV9jaGFpbl9mb3JfZWFjaChpdGVyLCBmZW5jZSkg
ewo+ICsJCQkJCWlmICghaXRlcikKPiArCQkJCQkJYnJlYWs7Cj4gKwkJCQkJZG1hX2ZlbmNlX3B1
dChsYXN0X3NpZ25hbGVkKTsKPiArCQkJCQlsYXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChp
dGVyKTsKPiArCQkJCQlpZiAoIXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0X3NpZ25hbGVkKS0+cHJl
dl9zZXFubykKPiArCQkJCQkJLyogSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aW1lbGluZSBoYXMK
PiArCQkJCQkJKiB1bm9yZGVyIHBvaW50cy4gKi8KPiArCQkJCQkJYnJlYWs7Cj4gKwkJCQl9Cj4g
KwkJCQlwb2ludCA9IGRtYV9mZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/Cj4gKwkJ
CQkJbGFzdF9zaWduYWxlZC0+c2Vxbm8gOgo+ICsJCQkJCXRvX2RtYV9mZW5jZV9jaGFpbihsYXN0
X3NpZ25hbGVkKS0+cHJldl9zZXFubzsKPiAgIAkJCX0KPiAtCQkJcG9pbnQgPSBkbWFfZmVuY2Vf
aXNfc2lnbmFsZWQobGFzdF9zaWduYWxlZCkgPwo+IC0JCQkJbGFzdF9zaWduYWxlZC0+c2Vxbm8g
Ogo+IC0JCQkJdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOwo+
ICAgCQkJZG1hX2ZlbmNlX3B1dChsYXN0X3NpZ25hbGVkKTsKPiAgIAkJfSBlbHNlIHsKPiAgIAkJ
CXBvaW50ID0gMDsKPiAgIAkJfQo+ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+ICAgCQlyZXQg
PSBjb3B5X3RvX3VzZXIoJnBvaW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsKPiAg
IAkJcmV0ID0gcmV0ID8gLUVGQVVMVCA6IDA7Cj4gICAJCWlmIChyZXQpCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oCj4gaW5kZXgg
NjYxZDczZjlhOTE5Li5mZDk4N2NlMjRkOWYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKPiBAQCAtNzc3LDExICs3Nzcs
MTIgQEAgc3RydWN0IGRybV9zeW5jb2JqX2FycmF5IHsKPiAgIAlfX3UzMiBwYWQ7Cj4gICB9Owo+
ICAgCj4gKyNkZWZpbmUgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJNSVRURUQgKDEg
PDwgMCkgLyogbGFzdCBhdmFpbGFibGUgcG9pbnQgb24gdGltZWxpbmUgc3luY29iaiAqLwo+ICAg
c3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsKPiAgIAlfX3U2NCBoYW5kbGVzOwo+
ICAgCV9fdTY0IHBvaW50czsKPiAgIAlfX3UzMiBjb3VudF9oYW5kbGVzOwo+IC0JX191MzIgcGFk
Owo+ICsJX191MzIgZmxhZ3M7Cj4gICB9Owo+ICAgCj4gICAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
