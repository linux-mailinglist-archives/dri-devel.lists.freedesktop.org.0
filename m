Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A5CC6C7
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 01:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD8B6EC3B;
	Fri,  4 Oct 2019 23:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1726EC3B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 23:57:37 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B5B4217F5;
 Fri,  4 Oct 2019 23:57:27 +0000 (UTC)
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
Date: Fri, 4 Oct 2019 17:57:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570233456;
 bh=QnxgZGjRGb9kVa/AbzFU/w+ata+FCIrTiXgoxZKR668=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=14VBaXN2i1lZzsGbzc40dGmK4Kz7MeNzgfzYFP1mBUWKFrLWr5b8W2fbZxF7XWXT/
 kFJ2TnRAgZew/x23kGW5L/k2jFdvXDJGUxAALPAqq4xa3NgG7/4XUrOkkuVZWSwetb
 YcbcyPY+1xumtG3sOuB8AeQgccrkurfn3PNq0JFU=
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNC8xOSA1OjUyIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
NCwgMjAxOSBhdCA0OjMwIFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1pdC5lZHU+IHdyb3Rl
Ogo+Pgo+PiBPbiBGcmksIE9jdCAwNCwgMjAxOSBhdCAwNDo0NzowOVBNIC0wNjAwLCBzaHVhaCB3
cm90ZToKPj4+PiBIb3dldmVyLCBpZiBJIGVuY291cmFnZSBhcmJpdHJhcnkgdGVzdHMvaW1wcm92
ZW1lbnRzIGludG8gbXkgS1VuaXQKPj4+PiBicmFuY2gsIGl0IGZ1cnRoZXIgZGl2ZXJnZXMgYXdh
eSBmcm9tIHRvcnZhbGRzL21hc3RlciwgYW5kIGlzIG1vcmUKPj4+PiBsaWtlbHkgdGhhdCB0aGVy
ZSB3aWxsIGJlIGEgbWVyZ2UgY29uZmxpY3Qgb3IgaXNzdWUgdGhhdCBpcyBub3QgcmVsYXRlZAo+
Pj4+IHRvIHRoZSBjb3JlIEtVbml0IGNoYW5nZXMgdGhhdCB3aWxsIGNhdXNlIHRoZSB3aG9sZSB0
aGluZyB0byBiZQo+Pj4+IHJlamVjdGVkIGFnYWluIGluIHY1LjUuCj4+Pgo+Pj4gVGhlIGlkZWEg
aXMgdGhhdCB0aGUgbmV3IGRldmVsb3BtZW50IHdpbGwgaGFwcGVuIGJhc2VkIG9uIGt1bml0IGlu
Cj4+PiBsaW51eC1rc2VsZnRlc3QgbmV4dC4gSXQgd2lsbCB3b3JrIGp1c3QgZmluZS4gQXMgd2Ug
YWNjZXB0cyBwYXRjaGVzLAo+Pj4gdGhleSB3aWxsIGdvIG9uIHRvcCBvZiBrdW5pdCB0aGF0IGlz
IGluIGxpbnV4LW5leHQgbm93Lgo+Pgo+PiBJIGRvbid0IHNlZSBob3cgdGhpcyB3b3VsZCB3b3Jr
LiAgSWYgSSBhZGQgdW5pdCB0ZXN0cyB0byBleHQ0LCB0aGV5Cj4+IHdvdWxkIGJlIGluIGZzL2V4
dDQuICBBbmQgdG8gdGhlIGV4dGVudCB0aGF0IEkgbmVlZCB0byBhZGQgdGVzdCBtb2Nrcwo+PiB0
byBhbGxvdyB0aGUgdW5pdCB0ZXN0cyB0byB3b3JrLCB0aGV5IHdpbGwgaW52b2x2ZSBjaGFuZ2Vz
IHRvIGV4aXN0aW5nCj4+IGZpbGVzIGluIGZzL2V4dDQuICBJIGNhbid0IHB1dCB0aGVtIGluIHRo
ZSBleHQ0LmdpdCB0cmVlIHdpdGhvdXQKPj4gcHVsbGluZyBpbiB0aGUga3VuaXQgY2hhbmdlcyBp
bnRvIHRoZSBleHQ0IGdpdCB0cmVlLiAgQW5kIGlmIHRoZXkgZXh0NAo+PiB1bml0IHRlc3RzIGxh
bmQgaW4gdGhlIGt1bml0IHRyZWUsIGl0IHdvdWxkIGJlIGEgcmVjZWlwZSBmb3IgbGFyZ2UKPj4g
bnVtYmVycyBvZiBtZXJnZSBjb25mbGljdHMuCj4gCj4gVGhhdCdzIHdoZXJlIEkgd2FzIG9yaWdp
bmFsbHkgY29taW5nIGZyb20uCj4gCj4gU28gaGVyZSdzIGEgZHVtYiBpZGVhOiB3aGF0IGlmIHdl
IG1lcmdlZCBLVW5pdCB0aHJvdWdoIHRoZSBleHQ0IHRyZWU/Cj4gSSBpbWFnaW5lIHRoYXQgY291
bGQgcG90ZW50aWFsbHkgZ2V0IHZlcnkgY29uZnVzaW5nIHdoZW4gd2UgZ28gYmFjayB0bwo+IHNl
bmRpbmcgY2hhbmdlcyBpbiB0aHJvdWdoIHRoZSBrc2VsZnRlc3QgdHJlZSwgYnV0IGF0IGxlYXN0
IGl0IG1lYW5zCj4gdGhhdCBleHQ0IGNhbiB1c2UgaXQgaW4gdGhlIG1lYW50aW1lLCB3aGljaCBt
ZWFucyB0aGF0IGl0IGF0IGxlYXN0Cj4gZ2V0cyB0byBiZSB1c2VmdWwgdG8gb25lIGdyb3VwIG9m
IHBlb3BsZS4gQWxzbywgc2luY2UgVGVkIHNlZW1zIHByZXR0eQo+IGtlZW4gb24gdXNpbmcgdGhp
cywgSSBpbWFnaW5lIGl0IGlzIG11Y2ggbW9yZSBsaWtlbHkgdG8gcHJvZHVjZSByZWFsCj4gd29y
bGQsIGltbWVkaWF0ZWx5IHVzZWZ1bCB0ZXN0cyBub3Qgd3JpdHRlbiBieSBtZSAoSSdtIG5vdCBi
ZWluZyBsYXp5LAo+IEkganVzdCB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZ2V0IG90aGVyIHBlb3Bs
ZSdzIGV4cGVyaWVuY2VzIG90aGVyIHRoYW4KPiBteSBvd24pLgo+IAoKVGhhdCBkb2Vzbid0IG1h
a2Ugc2Vuc2UgZG9lcyBpdD8gVGhlIHRlc3RzIG1pZ2h0IG5vdCBiZSBsaW1pdGVkIHRvCmZzL2V4
dDQuIFdlIG1pZ2h0IGhhdmUgb3RoZXIgc3ViLXN5c3RlbXMgdGhhdCBhZGQgdGVzdHMuCgpTbywg
d2Ugd2lsbCBoYXZlIHRvIHdvcmsgdG8gbWFrZSBsaW51eC1uZXh0IGFzIHRoZSBiYXNlIGZvciBu
ZXcKZGV2ZWxvcG1lbnQgYW5kIGxpbWl0IHRoZSBudW1iZXIgb2YgdGVzdHMgdG8gd2hlcmUgaXQg
d2lsbCBiZQplYXNpZXIgd29yayBpbiB0aGlzIG1vZGUgZm9yIDUuNS4gV2UgY2FuIHN0YWdlIHRo
ZSBwdWxsIHJlcXVlc3RzCnNvIHRoYXQga3VuaXQgbGFuZHMgZmlyc3QgZm9sbG93ZWQgYnkgdGVz
dHMuCgpXZSBoYXZlIGEgc2ltaWxhciBzaXR1YXRpb24gd2l0aCBrc2VsZnRlc3QgYXMgd2VsbC4g
U3ViLXN5c3RlbXMKc2VuZCB0ZXN0cyB0aGF0IGRlcGVuZCBvbiB0aGVpciB0cmVzcyBzZXBhcmF0
ZWx5LgoKdGhhbmtzLAotLSBTaHVhaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
