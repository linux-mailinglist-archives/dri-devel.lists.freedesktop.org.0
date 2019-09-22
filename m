Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D620BAE13
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C716E0FC;
	Mon, 23 Sep 2019 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95DA6E846
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2019 16:29:21 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iC4iv-00076b-DS; Sun, 22 Sep 2019 16:28:33 +0000
Subject: Re: [PATCH v17 07/19] kunit: test: add initial tests
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190921001855.200947-1-brendanhiggins@google.com>
 <20190921001855.200947-8-brendanhiggins@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <944ac47d-1411-9ebd-d0d4-a616c88c9c20@infradead.org>
Date: Sun, 22 Sep 2019 09:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921001855.200947-8-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGqXLDwoxSJ+wMClTeqCK7DBN64mFNHAm3f7xeAfO/Y=; b=Jqrmyr//FV9HMLM96+iNkQrG9
 U4Uoy/pOrdbQVcKQBj9xPvAkV/nzrJpOJ1bdtxIXDSdsG2VLMEJv6TViNNLTSyi4UdBQYPKzaxcrJ
 2T4t8mrKe78jij/lNHM3wjTob7KcsjUa815F7f3Aihj/SleVztJIvrssWkutND3UYT6Rv/iySkIdf
 NfuXnPzxcoef19ZF0a6xFA3k17U3TqdtEDvk5uN2TMgl2RW2OQ0GTb2A3YN0AuqPW+csabIMBu0CZ
 MEZI3cTzBe5bCL5Kj08Onh8n/iaXULqCTmLm39f238LK0to8z19ySnG8XjQR5JizEmVVeaKJZ1gFo
 +Z/Ym2Tyg==;
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
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMC8xOSA1OjE4IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gQWRkIGEgdGVzdCBm
b3Igc3RyaW5nIHN0cmVhbSBhbG9uZyB3aXRoIGEgc2ltcGxlciBleGFtcGxlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBS
ZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KPiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+
IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGxp
Yi9rdW5pdC9LY29uZmlnICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysKPiAgbGliL2t1bml0
L01ha2VmaWxlICAgICAgICAgICAgIHwgIDQgKysKPiAgbGliL2t1bml0L2V4YW1wbGUtdGVzdC5j
ICAgICAgIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIva3Vu
aXQvc3RyaW5nLXN0cmVhbS10ZXN0LmMgfCA1MiArKysrKysrKysrKysrKysrKysrKwo+ICA0IGZp
bGVzIGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIv
a3VuaXQvZXhhbXBsZS10ZXN0LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9rdW5pdC9zdHJp
bmctc3RyZWFtLXRlc3QuYwo+IAo+IGRpZmYgLS1naXQgYS9saWIva3VuaXQvS2NvbmZpZyBiL2xp
Yi9rdW5pdC9LY29uZmlnCj4gaW5kZXggNjY2YjljYjY3YTc0Li4zODY4YzIyNmNmMzEgMTAwNjQ0
Cj4gLS0tIGEvbGliL2t1bml0L0tjb25maWcKPiArKysgYi9saWIva3VuaXQvS2NvbmZpZwo+IEBA
IC0xMSwzICsxMSwyOCBAQCBtZW51Y29uZmlnIEtVTklUCj4gIAkgIHNwZWNpYWwgaGFyZHdhcmUg
d2hlbiB1c2luZyBVTUwuIENhbiBhbHNvIGJlIHVzZWQgb24gbW9zdCBvdGhlcgo+ICAJICBhcmNo
aXRlY3R1cmVzLiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgcGxlYXNlIHNlZQo+ICAJICBEb2N1bWVu
dGF0aW9uL2Rldi10b29scy9rdW5pdC8uCj4gKwo+ICtpZiBLVU5JVAoKVGhlICdpZicgYWJvdmUg
cHJvdmlkZXMgdGhlIGRlcGVuZGVuY3kgY2xhdXNlLCBzbyB0aGUgMiAnZGVwZW5kcyBvbiBLVU5J
VCcKYmVsb3cgYXJlIG5vdCBuZWVkZWQuICBUaGV5IGFyZSByZWR1bmRhbnQuCgo+ICsKPiArY29u
ZmlnIEtVTklUX1RFU1QKPiArCWJvb2wgIktVbml0IHRlc3QgZm9yIEtVbml0Igo+ICsJZGVwZW5k
cyBvbiBLVU5JVAo+ICsJaGVscAo+ICsJICBFbmFibGVzIHRoZSB1bml0IHRlc3RzIGZvciB0aGUg
S1VuaXQgdGVzdCBmcmFtZXdvcmsuIFRoZXNlIHRlc3RzIHRlc3QKPiArCSAgdGhlIEtVbml0IHRl
c3QgZnJhbWV3b3JrIGl0c2VsZjsgdGhlIHRlc3RzIGFyZSBib3RoIHdyaXR0ZW4gdXNpbmcKPiAr
CSAgS1VuaXQgYW5kIHRlc3QgS1VuaXQuIFRoaXMgb3B0aW9uIHNob3VsZCBvbmx5IGJlIGVuYWJs
ZWQgZm9yIHRlc3RpbmcKPiArCSAgcHVycG9zZXMgYnkgZGV2ZWxvcGVycyBpbnRlcmVzdGVkIGlu
IHRlc3RpbmcgdGhhdCBLVW5pdCB3b3JrcyBhcwo+ICsJICBleHBlY3RlZC4KPiArCj4gK2NvbmZp
ZyBLVU5JVF9FWEFNUExFX1RFU1QKPiArCWJvb2wgIkV4YW1wbGUgdGVzdCBmb3IgS1VuaXQiCj4g
KwlkZXBlbmRzIG9uIEtVTklUCj4gKwloZWxwCj4gKwkgIEVuYWJsZXMgYW4gZXhhbXBsZSB1bml0
IHRlc3QgdGhhdCBpbGx1c3RyYXRlcyBzb21lIG9mIHRoZSBiYXNpYwo+ICsJICBmZWF0dXJlcyBv
ZiBLVW5pdC4gVGhpcyB0ZXN0IG9ubHkgZXhpc3RzIHRvIGhlbHAgbmV3IHVzZXJzIHVuZGVyc3Rh
bmQKPiArCSAgd2hhdCBLVW5pdCBpcyBhbmQgaG93IGl0IGlzIHVzZWQuIFBsZWFzZSByZWZlciB0
byB0aGUgZXhhbXBsZSB0ZXN0Cj4gKwkgIGl0c2VsZiwgbGliL2t1bml0L2V4YW1wbGUtdGVzdC5j
LCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4gVGhpcyBvcHRpb24KPiArCSAgaXMgaW50ZW5kZWQgZm9y
IGN1cmlvdXMgaGFja2VycyB3aG8gd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIGhvdyB0bwo+ICsJ
ICB1c2UgS1VuaXQgZm9yIGtlcm5lbCBkZXZlbG9wbWVudC4KPiArCj4gK2VuZGlmICMgS1VOSVQK
CgoKLS0gCn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
