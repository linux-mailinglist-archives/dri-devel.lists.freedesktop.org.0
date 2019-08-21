Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E796E16
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 02:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1FB6E157;
	Wed, 21 Aug 2019 00:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6E6E157
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 00:16:01 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 116882087E;
 Wed, 21 Aug 2019 00:15:58 +0000 (UTC)
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190814055108.214253-1-brendanhiggins@google.com>
 <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
 <20190820182450.GA38078@google.com>
 <e8eaf28e-75df-c966-809a-2e3631353cc9@kernel.org>
 <CAFd5g44JT_KQ+OxjVdG0qMWuaEB0Zq5x=r6tLsqJdncwZ_zbGA@mail.gmail.com>
 <CAFd5g44aO40G7Wc-51EPyhWZgosN4ZHwwSjKe7CU_vi2OD7eKA@mail.gmail.com>
From: shuah <shuah@kernel.org>
Message-ID: <10e4190d-2a26-f51a-ba34-7afe8e640771@kernel.org>
Date: Tue, 20 Aug 2019 18:15:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g44aO40G7Wc-51EPyhWZgosN4ZHwwSjKe7CU_vi2OD7eKA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566346560;
 bh=2RuQs1F7tYgJBLvgQ6WridWiJhdHMgHseFYdpGdyqzs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h/9SOpCxtOLRs6g5m+cJNbJz0udbmW1GGoOmLXaQfek2wie52cFhxaDLPxrwyKa7t
 DXo/HvBBcOpNeAp5/4kk9R4eosaYHxiCJmSQZPYFG/r9HgeUIOSuGMLSresn8i9BPp
 XGM39t/6VU4uCPsIzFNwGZggfyYQ0w1m5Gkr9ny8=
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
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSA1OjIzIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gT24gVHVlLCBBdWcg
MjAsIDIwMTkgYXQgMjoyNiBQTSBCcmVuZGFuIEhpZ2dpbnMKPiA8YnJlbmRhbmhpZ2dpbnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDEyOjA4IFBNIHNo
dWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3cm90ZToKPj4+Cj4+PiBPbiA4LzIwLzE5IDEyOjI0IFBN
LCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4+Pj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6
MjQ6NDVBTSAtMDYwMCwgc2h1YWggd3JvdGU6Cj4+Pj4+IE9uIDgvMTMvMTkgMTE6NTAgUE0sIEJy
ZW5kYW4gSGlnZ2lucyB3cm90ZToKPj4+Pj4+ICMjIFRMO0RSCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBy
ZXZpc2lvbiBhZGRyZXNzZXMgY29tbWVudHMgZnJvbSBTdGVwaGVuIGFuZCBCam9ybiBIZWxnYWFz
LiBNb3N0Cj4+Pj4+PiBjaGFuZ2VzIGFyZSBwcmV0dHkgbWlub3Igc3R1ZmYgdGhhdCBkb2Vzbid0
IGFmZmVjdCB0aGUgQVBJIGluIGFueXdheS4KPj4+Pj4+IE9uZSBzaWduaWZpY2FudCBjaGFuZ2Us
IGhvd2V2ZXIsIGlzIHRoYXQgSSBhZGRlZCBzdXBwb3J0IGZvciBmcmVlaW5nCj4+Pj4+PiBrdW5p
dF9yZXNvdXJjZSBtYW5hZ2VkIHJlc291cmNlcyBiZWZvcmUgdGhlIHRlc3QgY2FzZSBpcyBmaW5p
c2hlZCB2aWEKPj4+Pj4+IGt1bml0X3Jlc291cmNlX2Rlc3Ryb3koKS4gQWRkaXRpb25hbGx5LCBC
am9ybiBwb2ludGVkIG91dCB0aGF0IEkgYnJva2UKPj4+Pj4+IEtVbml0IG9uIGNlcnRhaW4gY29u
ZmlndXJhdGlvbnMgKGxpa2UgdGhlIGRlZmF1bHQgb25lIGZvciB4ODYsIHdob29wcykuCj4+Pj4+
Pgo+Pj4+Pj4gQmFzZWQgb24gU3RlcGhlbidzIGZlZWRiYWNrIG9uIHRoZSBwcmV2aW91cyBjaGFu
Z2UsIEkgdGhpbmsgd2UgYXJlCj4+Pj4+PiBwcmV0dHkgY2xvc2UuIEkgYW0gbm90IGV4cGVjdGlu
ZyBhbnkgc2lnbmlmaWNhbnQgY2hhbmdlcyBmcm9tIGhlcmUgb24KPj4+Pj4+IG91dC4KPj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IEhpIEJyZW5kYW4sCj4+Pj4+Cj4+Pj4+IEkgZm91bmQgY2hlY2twYXRjaCBl
cnJvcnMgaW4gb25lIG9yIHR3byBwYXRjaGVzLiBDYW4geW91IGZpeCB0aG9zZSBhbmQKPj4+Pj4g
c2VuZCB2MTQuCj4+Pj4KPj4+PiBIaSBTaHVhaCwKPj4+Pgo+Pj4+IEFyZSB5b3UgcmVmZXJpbmcg
dG8gdGhlIGZvbGxvd2luZyBlcnJvcnM/Cj4+Pj4KPj4+PiBFUlJPUjogTWFjcm9zIHdpdGggY29t
cGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2VzCj4+Pj4gIzE0NDog
RklMRTogaW5jbHVkZS9rdW5pdC90ZXN0Lmg6NDU2Ogo+Pj4+ICsjZGVmaW5lIEtVTklUX0JJTkFS
WV9DTEFTUyBcCj4+Pj4gKyAgICAgICBrdW5pdF9iaW5hcnlfYXNzZXJ0LCBLVU5JVF9JTklUX0JJ
TkFSWV9BU1NFUlRfU1RSVUNUCj4+Pj4KPj4+PiBFUlJPUjogTWFjcm9zIHdpdGggY29tcGxleCB2
YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2VzCj4+Pj4gIzE0NjogRklMRTog
aW5jbHVkZS9rdW5pdC90ZXN0Lmg6NDU4Ogo+Pj4+ICsjZGVmaW5lIEtVTklUX0JJTkFSWV9QVFJf
Q0xBU1MgXAo+Pj4+ICsgICAgICAga3VuaXRfYmluYXJ5X3B0cl9hc3NlcnQsIEtVTklUX0lOSVRf
QklOQVJZX1BUUl9BU1NFUlRfU1RSVUNUCj4+Pj4KPj4+PiBUaGVzZSB2YWx1ZXMgc2hvdWxkICpu
b3QqIGJlIGluIHBhcmVudGhlc2VzLiBJIGFtIGd1ZXNzaW5nIGNoZWNrcGF0Y2ggaXMKPj4+PiBn
ZXR0aW5nIGNvbmZ1c2VkIGFuZCB0aGlua3MgdGhhdCB0aGVzZSBhcmUgY29tcGxleCBleHByZXNz
aW9ucywgd2hlbgo+Pj4+IHRoZXkgYXJlIG5vdC4KPj4+Pgo+Pj4+IEkgaWdub3JlZCB0aGUgZXJy
b3JzIHNpbmNlIEkgZmlndXJlZCBjaGVja3BhdGNoIHdhcyBjb21wbGFpbmluZwo+Pj4+IGVycm9u
ZW91c2x5Lgo+Pj4+Cj4+Pj4gSSBjb3VsZCByZWZhY3RvciB0aGUgY29kZSB0byByZW1vdmUgdGhl
c2UgbWFjcm9zIGVudGlyZWx5LCBidXQgSSB0aGluawo+Pj4+IHRoZSBjb2RlIGlzIGNsZWFuZXIg
d2l0aCB0aGVtLgo+Pj4+Cj4+Pgo+Pj4gUGxlYXNlIGRvLiBJIGFtIG5vdCB2ZXJ1IHN1cmUgd2hh
dCB2YWx1ZSB0aGVzZSBtYWNyb3MgYWRkLgo+Pgo+PiBBbHJpZ2h0LCBJIHdpbGwgaGF2ZSBzb21l
dGhpbmcgZm9yIHlvdSBsYXRlciB0b2RheS4KPiAKPiBJIGp1c3Qgc2VudCBhIG5ldyByZXZpc2lv
biB3aXRoIHRoZSBmaXguCj4gCj4gQ2hlZXJzCj4gCgpUaGFua3MgQnJlbmRhbi4gSSB3aWxsIGdl
dCB0aGVtIGluLgoKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
