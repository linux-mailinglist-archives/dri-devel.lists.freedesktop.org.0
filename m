Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0C9690F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 21:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9E6E851;
	Tue, 20 Aug 2019 19:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3451F6E851
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 19:08:33 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDF8A2082F;
 Tue, 20 Aug 2019 19:08:29 +0000 (UTC)
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
 <20190820182450.GA38078@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
Date: Tue, 20 Aug 2019 13:08:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820182450.GA38078@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566328112;
 bh=EQcE7jgODYPqBxFha4axxuVZtCHbZv+lyg0wG/vxuqE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V//JOo/nBlns1BIGxHPsWcL0jiR9TJx2KmCu8eYP4YNIYAdhdLuzoIx3vOjLgJOWf
 qywhT+G/ZqWkgzBVmgCpi40PPee/iCkXqnClTUaQ9H817cboZ6rQYsqsdhOXzkxXEe
 SSvE0tF9mSLKe15z7ad2lgpjVB8OR8ObBpC4AYuQ=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, frowand.list@gmail.com,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 Bjorn Helgaas <bhelgaas@google.com>, kunit-dev@googlegroups.com, tytso@mit.edu,
 richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 keescook@google.com, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSAxMjoyNCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIFR1ZSwgQXVn
IDIwLCAyMDE5IGF0IDExOjI0OjQ1QU0gLTA2MDAsIHNodWFoIHdyb3RlOgo+PiBPbiA4LzEzLzE5
IDExOjUwIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+PiAjIyBUTDtEUgo+Pj4KPj4+IFRo
aXMgcmV2aXNpb24gYWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gU3RlcGhlbiBhbmQgQmpvcm4gSGVs
Z2Fhcy4gTW9zdAo+Pj4gY2hhbmdlcyBhcmUgcHJldHR5IG1pbm9yIHN0dWZmIHRoYXQgZG9lc24n
dCBhZmZlY3QgdGhlIEFQSSBpbiBhbnl3YXkuCj4+PiBPbmUgc2lnbmlmaWNhbnQgY2hhbmdlLCBo
b3dldmVyLCBpcyB0aGF0IEkgYWRkZWQgc3VwcG9ydCBmb3IgZnJlZWluZwo+Pj4ga3VuaXRfcmVz
b3VyY2UgbWFuYWdlZCByZXNvdXJjZXMgYmVmb3JlIHRoZSB0ZXN0IGNhc2UgaXMgZmluaXNoZWQg
dmlhCj4+PiBrdW5pdF9yZXNvdXJjZV9kZXN0cm95KCkuIEFkZGl0aW9uYWxseSwgQmpvcm4gcG9p
bnRlZCBvdXQgdGhhdCBJIGJyb2tlCj4+PiBLVW5pdCBvbiBjZXJ0YWluIGNvbmZpZ3VyYXRpb25z
IChsaWtlIHRoZSBkZWZhdWx0IG9uZSBmb3IgeDg2LCB3aG9vcHMpLgo+Pj4KPj4+IEJhc2VkIG9u
IFN0ZXBoZW4ncyBmZWVkYmFjayBvbiB0aGUgcHJldmlvdXMgY2hhbmdlLCBJIHRoaW5rIHdlIGFy
ZQo+Pj4gcHJldHR5IGNsb3NlLiBJIGFtIG5vdCBleHBlY3RpbmcgYW55IHNpZ25pZmljYW50IGNo
YW5nZXMgZnJvbSBoZXJlIG9uCj4+PiBvdXQuCj4+Pgo+Pgo+PiBIaSBCcmVuZGFuLAo+Pgo+PiBJ
IGZvdW5kIGNoZWNrcGF0Y2ggZXJyb3JzIGluIG9uZSBvciB0d28gcGF0Y2hlcy4gQ2FuIHlvdSBm
aXggdGhvc2UgYW5kCj4+IHNlbmQgdjE0Lgo+IAo+IEhpIFNodWFoLAo+IAo+IEFyZSB5b3UgcmVm
ZXJpbmcgdG8gdGhlIGZvbGxvd2luZyBlcnJvcnM/Cj4gCj4gRVJST1I6IE1hY3JvcyB3aXRoIGNv
bXBsZXggdmFsdWVzIHNob3VsZCBiZSBlbmNsb3NlZCBpbiBwYXJlbnRoZXNlcwo+ICMxNDQ6IEZJ
TEU6IGluY2x1ZGUva3VuaXQvdGVzdC5oOjQ1NjoKPiArI2RlZmluZSBLVU5JVF9CSU5BUllfQ0xB
U1MgXAo+ICsgICAgICAga3VuaXRfYmluYXJ5X2Fzc2VydCwgS1VOSVRfSU5JVF9CSU5BUllfQVNT
RVJUX1NUUlVDVAo+IAo+IEVSUk9SOiBNYWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQg
YmUgZW5jbG9zZWQgaW4gcGFyZW50aGVzZXMKPiAjMTQ2OiBGSUxFOiBpbmNsdWRlL2t1bml0L3Rl
c3QuaDo0NTg6Cj4gKyNkZWZpbmUgS1VOSVRfQklOQVJZX1BUUl9DTEFTUyBcCj4gKyAgICAgICBr
dW5pdF9iaW5hcnlfcHRyX2Fzc2VydCwgS1VOSVRfSU5JVF9CSU5BUllfUFRSX0FTU0VSVF9TVFJV
Q1QKPiAKPiBUaGVzZSB2YWx1ZXMgc2hvdWxkICpub3QqIGJlIGluIHBhcmVudGhlc2VzLiBJIGFt
IGd1ZXNzaW5nIGNoZWNrcGF0Y2ggaXMKPiBnZXR0aW5nIGNvbmZ1c2VkIGFuZCB0aGlua3MgdGhh
dCB0aGVzZSBhcmUgY29tcGxleCBleHByZXNzaW9ucywgd2hlbgo+IHRoZXkgYXJlIG5vdC4KPiAK
PiBJIGlnbm9yZWQgdGhlIGVycm9ycyBzaW5jZSBJIGZpZ3VyZWQgY2hlY2twYXRjaCB3YXMgY29t
cGxhaW5pbmcKPiBlcnJvbmVvdXNseS4KPiAKPiBJIGNvdWxkIHJlZmFjdG9yIHRoZSBjb2RlIHRv
IHJlbW92ZSB0aGVzZSBtYWNyb3MgZW50aXJlbHksIGJ1dCBJIHRoaW5rCj4gdGhlIGNvZGUgaXMg
Y2xlYW5lciB3aXRoIHRoZW0uCj4gCgpQbGVhc2UgZG8uIEkgYW0gbm90IHZlcnUgc3VyZSB3aGF0
IHZhbHVlIHRoZXNlIG1hY3JvcyBhZGQuCgp0aGFua3MsCi0tIFNodWFoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
