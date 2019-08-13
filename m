Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401038AE1D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2896E629;
	Tue, 13 Aug 2019 04:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A926E629
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:55:11 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1D6E206C2;
 Tue, 13 Aug 2019 04:55:10 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-12-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-12-brendanhiggins@google.com>
Subject: Re: [PATCH v12 11/18] kunit: test: add the concept of assertions
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:55:09 -0700
Message-Id: <20190813045510.C1D6E206C2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565672110;
 bh=sNs8Jd2xkQEsuQp9rhkHGchWAQJXpnxX1ZLCePCDf18=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=r6BR1VpnUPJtcLpxSN6MzduXH/yQRPwo8roQ2PhzFBwrjyUmuDeet29A/zAYIKzoB
 rXSL+H7vMbDJlLtVTxK+pxHOYx2XBv7vlL5PTxOzCH7sywF+WyBUoRmzmArBuhPF9v
 rnjMiiYeiR/EOunpx0iR0Cc/RMwL2jKukJ0nIsg4=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTQpCj4gQWRkIHN1cHBv
cnQgZm9yIGFzc2VydGlvbnMgd2hpY2ggYXJlIGxpa2UgZXhwZWN0YXRpb25zIGV4Y2VwdCB0aGUg
dGVzdAo+IHRlcm1pbmF0ZXMgaWYgdGhlIGFzc2VydGlvbiBpcyBub3Qgc2F0aXNmaWVkLgo+IAo+
IFRoZSBpZGVhIHdpdGggYXNzZXJ0aW9ucyBpcyB0aGF0IHlvdSB1c2UgdGhlbSB0byBzdGF0ZSBh
bGwgdGhlCj4gcHJlY29uZGl0aW9ucyBmb3IgeW91ciB0ZXN0LiBMb2dpY2FsbHkgc3BlYWtpbmcs
IHRoZXNlIGFyZSB0aGUgcHJlbWlzZXMKPiBvZiB0aGUgdGVzdCBjYXNlLCBzbyBpZiBhIHByZW1p
c2UgaXNuJ3QgdHJ1ZSwgdGhlcmUgaXMgbm8gcG9pbnQgaW4KPiBjb250aW51aW5nIHRoZSB0ZXN0
IGNhc2UgYmVjYXVzZSB0aGVyZSBhcmUgbm8gY29uY2x1c2lvbnMgdGhhdCBjYW4gYmUKPiBkcmF3
biB3aXRob3V0IHRoZSBwcmVtaXNlcy4gV2hlcmVhcywgdGhlIGV4cGVjdGF0aW9uIGlzIHRoZSB0
aGluZyB5b3UKPiBhcmUgdHJ5aW5nIHRvIHByb3ZlLiBJdCBpcyBub3QgdXNlZCB1bml2ZXJzYWxs
eSBpbiB4LXVuaXQgc3R5bGUgdGVzdAo+IGZyYW1ld29ya3MsIGJ1dCBJIHJlYWxseSBsaWtlIGl0
IGFzIGEgY29udmVudGlvbi4gIFlvdSBjb3VsZCBzdGlsbAo+IGV4cHJlc3MgdGhlIGlkZWEgb2Yg
YSBwcmVtaXNlIHVzaW5nIHRoZSBhYm92ZSBpZGlvbSwgYnV0IEkgdGhpbmsKPiBLVU5JVF9BU1NF
UlRfKiBzdGF0ZXMgdGhlIGludGVuZGVkIGlkZWEgcGVyZmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdl
ZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBS
ZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgoKUmV2aWV3
ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KCj4gKyAqIFNldHMgYW4gZXhw
ZWN0YXRpb24gdGhhdCB0aGUgdmFsdWVzIHRoYXQgQGxlZnQgYW5kIEByaWdodCBldmFsdWF0ZSB0
byBhcmUKPiArICogbm90IGVxdWFsLiBUaGlzIGlzIHNlbWFudGljYWxseSBlcXVpdmFsZW50IHRv
Cj4gKyAqIEtVTklUX0FTU0VSVF9UUlVFKEB0ZXN0LCBzdHJjbXAoKEBsZWZ0KSwgKEByaWdodCkp
KS4gU2VlIEtVTklUX0FTU0VSVF9UUlVFKCkKPiArICogZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4g
KyAqLwo+ICsjZGVmaW5lIEtVTklUX0FTU0VSVF9TVFJORVEodGVzdCwgbGVmdCwgcmlnaHQpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIEtVTklUX0JJ
TkFSWV9TVFJfTkVfQVNTRVJUSU9OKHRlc3QsICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS1VOSVRfQVNT
RVJUSU9OLCAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsZWZ0LCAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpZ2h0KQo+ICsKPiAr
I2RlZmluZSBLVU5JVF9BU1NFUlRfU1RSTkVRX01TRyh0ZXN0LCBsZWZ0LCByaWdodCwgZm10LCAu
Li4pICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBLVU5JVF9CSU5BUllfU1RS
X05FX01TR19BU1NFUlRJT04odGVzdCwgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVU5JVF9BU1NFUlRJ
T04sICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlZnQsICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlnaHQsICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmbXQsICAgICAgICAgICAgICAgICAgICAgICAgIFwKClNhbWUgcXVlc3Rpb24gYWJv
dXQgdGFiYmluZyB0b28uCgo+IGRpZmYgLS1naXQgYS9rdW5pdC90ZXN0LXRlc3QuYyBiL2t1bml0
L3Rlc3QtdGVzdC5jCj4gaW5kZXggODhmNGNkZjAzZGIyYS4uMDU4ZjNmYjM3NDU4YSAxMDA2NDQK
PiAtLS0gYS9rdW5pdC90ZXN0LXRlc3QuYwo+ICsrKyBiL2t1bml0L3Rlc3QtdGVzdC5jCj4gQEAg
LTc4LDExICs3OCwxMyBAQCBzdGF0aWMgaW50IGt1bml0X3RyeV9jYXRjaF90ZXN0X2luaXQoc3Ry
dWN0IGt1bml0ICp0ZXN0KQo+ICAgICAgICAgc3RydWN0IGt1bml0X3RyeV9jYXRjaF90ZXN0X2Nv
bnRleHQgKmN0eDsKPiAgCj4gICAgICAgICBjdHggPSBrdW5pdF9remFsbG9jKHRlc3QsIHNpemVv
ZigqY3R4KSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9O
VUxMKHRlc3QsIGN0eCk7CgpBaCBvay4gUXVlc3Rpb24gc3RpbGwgc3RhbmRzIGlmIGt1bml0X2t6
YWxsb2MoKSBzaG91bGQganVzdCBoYXZlIHRoZQphc3NlcnRpb24gb24gZmFpbHVyZS4KCj4gICAg
ICAgICB0ZXN0LT5wcml2ID0gY3R4Owo+ICAKPiAgICAgICAgIGN0eC0+dHJ5X2NhdGNoID0ga3Vu
aXRfa21hbGxvYyh0ZXN0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZigqY3R4LT50cnlfY2F0Y2gpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdGUF9LRVJORUwpOwo+ICsgICAgICAgS1VOSVRfQVNTRVJUX05PVF9FUlJfT1Jf
TlVMTCh0ZXN0LCBjdHgtPnRyeV9jYXRjaCk7Cj4gIApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
