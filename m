Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC26F9B35C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53EA6ECCC;
	Fri, 23 Aug 2019 15:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144D6ECCB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:33:37 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F8AD2133F;
 Fri, 23 Aug 2019 15:33:34 +0000 (UTC)
Subject: Re: [PATCH v14 01/18] kunit: test: add KUnit test runner core
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190820232046.50175-1-brendanhiggins@google.com>
 <20190820232046.50175-2-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <7f2c8908-75f6-b793-7113-ad57c51777ce@kernel.org>
Date: Fri, 23 Aug 2019 09:33:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820232046.50175-2-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566574416;
 bh=yCT4ObOgsNt0bYY8blJS3y9Aifbq9ZOtPmFappz9gKg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o79+bNgvN/+G52KjHl2k7P+/9FYtVoFa6klyl9gzDLuUZmv2FLD2H6/h6kgCvvnGO
 RFvuceeQSSSVqLj+co0KPaqw2Cjpu4rkBzl2xsJBk8SmTfznnZR1skMABiBGgQCWnW
 h17J/lCDhV60JedIGFyevZgryI2eRxj+0jNWq+Gg=
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
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, richard@nod.at,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJlbmRhbiwKCk9uIDgvMjAvMTkgNToyMCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+
IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlk
ZXMgYSBjb21tb24gd2F5Cj4gdG8gZGVmaW5lIHRlc3QgY2FzZXMsIGZ1bmN0aW9ucyB0aGF0IGV4
ZWN1dGUgY29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4gYW5kIGRldGVybWluZSB3aGV0aGVyIHRo
ZSBjb2RlIHVuZGVyIHRlc3QgYmVoYXZlcyBhcyBleHBlY3RlZDsgdGhpcyBhbHNvCj4gcHJvdmlk
ZXMgYSB3YXkgdG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3Vp
dGVzIChoZXJlCj4gd2UgY2FsbCB0aGVtIHRlc3RfbW9kdWxlcykuCj4gCj4gSnVzdCBkZWZpbmUg
dGVzdCBjYXNlcyBhbmQgaG93IHRvIGV4ZWN1dGUgdGhlbSBmb3Igbm93OyBzZXR0aW5nCj4gZXhw
ZWN0YXRpb25zIG9uIGNvZGUgd2lsbCBiZSBkZWZpbmVkIGxhdGVyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdl
ZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBS
ZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IFJldmll
d2VkLWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1i
eTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgo+IC0tLQo+ICAgaW5jbHVkZS9rdW5p
dC90ZXN0LmggfCAxNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAga3VuaXQvS2NvbmZpZyAgICAgICAgfCAgMTcgKysrKwo+ICAga3VuaXQvTWFrZWZpbGUgICAg
ICAgfCAgIDEgKwo+ICAga3VuaXQvdGVzdC5jICAgICAgICAgfCAxOTEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzODggaW5z
ZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUva3VuaXQvdGVzdC5oCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvS2NvbmZpZwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGt1bml0L01ha2VmaWxlCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga3VuaXQvdGVzdC5jCj4gCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmUwYjM0YWNiOWVl
NGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9rdW5pdC90ZXN0LmgKPiBAQCAtMCww
ICsxLDE3OSBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ICsv
Kgo+ICsgKiBCYXNlIHVuaXQgdGVzdCAoS1VuaXQpIEFQSS4KPiArICoKPiArICogQ29weXJpZ2h0
IChDKSAyMDE5LCBHb29nbGUgTExDLgo+ICsgKiBBdXRob3I6IEJyZW5kYW4gSGlnZ2lucyA8YnJl
bmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9LVU5JVF9URVNU
X0gKPiArI2RlZmluZSBfS1VOSVRfVEVTVF9ICj4gKwo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KPiArCj4gK3N0cnVjdCBrdW5pdDsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3Qga3VuaXRfY2Fz
ZSAtIHJlcHJlc2VudHMgYW4gaW5kaXZpZHVhbCB0ZXN0IGNhc2UuCj4gKyAqIEBydW5fY2FzZTog
dGhlIGZ1bmN0aW9uIHJlcHJlc2VudGluZyB0aGUgYWN0dWFsIHRlc3QgY2FzZS4KPiArICogQG5h
bWU6IHRoZSBuYW1lIG9mIHRoZSB0ZXN0IGNhc2UuCj4gKyAqCj4gKyAqIEEgdGVzdCBjYXNlIGlz
IGEgZnVuY3Rpb24gd2l0aCB0aGUgc2lnbmF0dXJlLCBgYHZvaWQgKCopKHN0cnVjdCBrdW5pdCAq
KWBgCj4gKyAqIHRoYXQgbWFrZXMgZXhwZWN0YXRpb25zIChzZWUgS1VOSVRfRVhQRUNUX1RSVUUo
KSkgYWJvdXQgY29kZSB1bmRlciB0ZXN0LiBFYWNoCj4gKyAqIHRlc3QgY2FzZSBpcyBhc3NvY2lh
dGVkIHdpdGggYSAmc3RydWN0IGt1bml0X3N1aXRlIGFuZCB3aWxsIGJlIHJ1biBhZnRlciB0aGUK
PiArICogc3VpdGUncyBpbml0IGZ1bmN0aW9uIGFuZCBmb2xsb3dlZCBieSB0aGUgc3VpdGUncyBl
eGl0IGZ1bmN0aW9uLgo+ICsgKgo+ICsgKiBBIHRlc3QgY2FzZSBzaG91bGQgYmUgc3RhdGljIGFu
ZCBzaG91bGQgb25seSBiZSBjcmVhdGVkIHdpdGggdGhlIEtVTklUX0NBU0UoKQo+ICsgKiBtYWNy
bzsgYWRkaXRpb25hbGx5LCBldmVyeSBhcnJheSBvZiB0ZXN0IGNhc2VzIHNob3VsZCBiZSB0ZXJt
aW5hdGVkIHdpdGggYW4KPiArICogZW1wdHkgdGVzdCBjYXNlLgo+ICsgKgo+ICsgKiBFeGFtcGxl
OgoKQ2FuIHlvdSBmaXggdGhlc2UgbGluZSBjb250aW51YXRpb25zLiBJdCBtYWtlcyBpdCB2ZXJ5
IGhhcmQgdG8gcmVhZC4KU29ycnkgZm9yIHRoaXMgbGF0ZSBjb21tZW50LiBUaGVzZSBjb21tZW50
cyBsaW5lcyBhcmUgbG9uZ2VyIHRoYW4gODAKYW5kIHdyYXAuCgpUaGVyZSBhcmUgc2V2ZXJhbCBj
b21tZW50IGxpbmVzIGluIHRoZSBmaWxlIHRoYXQgYXJlIHdheSB0b28gbG9uZy4KCnRoYW5rcywK
LS0gU2h1YWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
