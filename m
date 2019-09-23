Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAABBDB5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 23:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5F89B65;
	Mon, 23 Sep 2019 21:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2005D89B65
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 21:18:49 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEFE921655;
 Mon, 23 Sep 2019 21:18:45 +0000 (UTC)
Subject: Re: [PATCH v18 15/19] Documentation: kunit: add documentation for
 KUnit
To: Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-16-brendanhiggins@google.com>
 <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
 <CAFd5g45y-NWzbn8E8hUg=n4U5E+N6_4D8eCXhQ74Y0N4zqVW=w@mail.gmail.com>
 <d7a61045-8fe6-a104-ece9-67b69c379425@infradead.org>
From: shuah <shuah@kernel.org>
Message-ID: <d5dc04ab-9be5-b258-c302-29f8045d6aaa@kernel.org>
Date: Mon, 23 Sep 2019 15:18:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d7a61045-8fe6-a104-ece9-67b69c379425@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569273528;
 bh=uZGy9vlY/pn+dPb1iZcKXB9oWJ1CxU/IxDEL/lnY++Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SGo9W/cpUNl7KLgBfpJognPZxmFKKR4dEP6cA4jJHfYUQWpe3l2mgKE4k6iQx35cy
 ofpQ0Ztxh76B0jNkARdk9GCqGBkkj5Tzt6rUZCw261tq2nb9i+caRKzISInhCp2Dgx
 eN+urP1l4CUPMZHARnlboLegMC/L9Vk8rfBD2WVE=
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, shuah <shuah@kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMy8xOSAxOjQ5IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gOS8yMy8xOSAxMTow
NiBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+PiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCA4
OjQ4IEFNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPj4+Cj4+
PiBPbiA5LzIzLzE5IDI6MDIgQU0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPj4+PiBBZGQgZG9j
dW1lbnRhdGlvbiBmb3IgS1VuaXQsIHRoZSBMaW51eCBrZXJuZWwgdW5pdCB0ZXN0aW5nIGZyYW1l
d29yay4KPj4+PiAtIEFkZCBpbnRybyBhbmQgdXNhZ2UgZ3VpZGUgZm9yIEtVbml0Cj4+Pj4gLSBB
ZGQgQVBJIHJlZmVyZW5jZQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggR3VvIDxmZWxp
eGd1b3hpdXBpbmdAZ21haWwuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPj4+PiBDYzogSm9uYXRoYW4gQ29yYmV0IDxj
b3JiZXRAbHduLm5ldD4KPj4+PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPj4+PiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBl
IDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gICBEb2N1bWVudGF0aW9uL2Rldi10b29scy9p
bmRleC5yc3QgICAgICAgICAgIHwgICAxICsKPj4+PiAgIERvY3VtZW50YXRpb24vZGV2LXRvb2xz
L2t1bml0L2FwaS9pbmRleC5yc3QgfCAgMTYgKwo+Pj4+ICAgRG9jdW1lbnRhdGlvbi9kZXYtdG9v
bHMva3VuaXQvYXBpL3Rlc3QucnN0ICB8ICAxMSArCj4+Pj4gICBEb2N1bWVudGF0aW9uL2Rldi10
b29scy9rdW5pdC9mYXEucnN0ICAgICAgIHwgIDYyICsrKwo+Pj4+ICAgRG9jdW1lbnRhdGlvbi9k
ZXYtdG9vbHMva3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysKPj4+PiAgIERvY3VtZW50YXRp
b24vZGV2LXRvb2xzL2t1bml0L3N0YXJ0LnJzdCAgICAgfCAxODAgKysrKysrCj4+Pj4gICBEb2N1
bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QgICAgIHwgNTc2ICsrKysrKysrKysr
KysrKysrKysrCj4+Pj4gICA3IGZpbGVzIGNoYW5nZWQsIDkyNSBpbnNlcnRpb25zKCspCj4+Pj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvYXBpL2lu
ZGV4LnJzdAo+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xz
L2t1bml0L2FwaS90ZXN0LnJzdAo+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2LXRvb2xzL2t1bml0L2ZhcS5yc3QKPj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9pbmRleC5yc3QKPj4+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9zdGFydC5yc3QKPj4+PiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPj4+
Cj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9zdGFy
dC5yc3QgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC9zdGFydC5yc3QKPj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmRjMjI5ZTQ2YmIzCj4+
Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0
L3N0YXJ0LnJzdAo+Pj4+IEBAIC0wLDAgKzEsMTgwIEBACj4+Pj4gKy4uIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4+Pj4gKwo+Pj4+ICs9PT09PT09PT09PT09PT0KPj4+PiArR2V0
dGluZyBTdGFydGVkCj4+Pj4gKz09PT09PT09PT09PT09PQo+Pj4+ICsKPj4+PiArSW5zdGFsbGlu
ZyBkZXBlbmRlbmNpZXMKPj4+PiArPT09PT09PT09PT09PT09PT09PT09PT0KPj4+PiArS1VuaXQg
aGFzIHRoZSBzYW1lIGRlcGVuZGVuY2llcyBhcyB0aGUgTGludXgga2VybmVsLiBBcyBsb25nIGFz
IHlvdSBjYW4gYnVpbGQKPj4+PiArdGhlIGtlcm5lbCwgeW91IGNhbiBydW4gS1VuaXQuCj4+Pj4g
Kwo+Pj4+ICtLVW5pdCBXcmFwcGVyCj4+Pj4gKz09PT09PT09PT09PT0KPj4+PiArSW5jbHVkZWQg
d2l0aCBLVW5pdCBpcyBhIHNpbXBsZSBQeXRob24gd3JhcHBlciB0aGF0IGhlbHBzIGZvcm1hdCB0
aGUgb3V0cHV0IHRvCj4+Pj4gK2Vhc2lseSB1c2UgYW5kIHJlYWQgS1VuaXQgb3V0cHV0LiBJdCBo
YW5kbGVzIGJ1aWxkaW5nIGFuZCBydW5uaW5nIHRoZSBrZXJuZWwsIGFzCj4+Pj4gK3dlbGwgYXMg
Zm9ybWF0dGluZyB0aGUgb3V0cHV0Lgo+Pj4+ICsKPj4+PiArVGhlIHdyYXBwZXIgY2FuIGJlIHJ1
biB3aXRoOgo+Pj4+ICsKPj4+PiArLi4gY29kZS1ibG9jazo6IGJhc2gKPj4+PiArCj4+Pj4gKyAg
IC4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4KPj4+PiArCj4+Pj4gK0NyZWF0aW5n
IGEga3VuaXRjb25maWcKPj4+PiArPT09PT09PT09PT09PT09PT09PT09PQo+Pj4+ICtUaGUgUHl0
aG9uIHNjcmlwdCBpcyBhIHRoaW4gd3JhcHBlciBhcm91bmQgS2J1aWxkIGFzIHN1Y2gsIGl0IG5l
ZWRzIHRvIGJlCj4+Pgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGFyb3VuZCBLYnVpbGQuIEFzIHN1Y2gsCj4+Cj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBv
dXQuCj4+Cj4+Pgo+Pj4+ICtjb25maWd1cmVkIHdpdGggYSBgYGt1bml0Y29uZmlnYGAgZmlsZS4g
VGhpcyBmaWxlIGVzc2VudGlhbGx5IGNvbnRhaW5zIHRoZQo+Pj4+ICtyZWd1bGFyIEtlcm5lbCBj
b25maWcsIHdpdGggdGhlIHNwZWNpZmljIHRlc3QgdGFyZ2V0cyBhcyB3ZWxsLgo+Pj4+ICsKPj4+
PiArLi4gY29kZS1ibG9jazo6IGJhc2gKPj4+PiArCj4+Pj4gKyAgICAgZ2l0IGNsb25lIC1iIG1h
c3RlciBodHRwczovL2t1bml0Lmdvb2dsZXNvdXJjZS5jb20va3VuaXRjb25maWcgJFBBVEhfVE9f
S1VOSVRDT05GSUdfUkVQTwo+Pj4+ICsgICAgIGNkICRQQVRIX1RPX0xJTlVYX1JFUE8KPj4+PiAr
ICAgICBsbiAtcyAkUEFUSF9UT19LVU5JVF9DT05GSUdfUkVQTy9rdW5pdGNvbmZpZyBrdW5pdGNv
bmZpZwo+Pj4+ICsKPj4+PiArWW91IG1heSB3YW50IHRvIGFkZCBrdW5pdGNvbmZpZyB0byB5b3Vy
IGxvY2FsIGdpdGlnbm9yZS4KPj4+PiArCj4+Pj4gK1ZlcmlmeWluZyBLVW5pdCBXb3Jrcwo+Pj4+
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiArCj4+Pj4gK1RvIG1ha2Ugc3VyZSB0aGF0IGV2
ZXJ5dGhpbmcgaXMgc2V0IHVwIGNvcnJlY3RseSwgc2ltcGx5IGludm9rZSB0aGUgUHl0aG9uCj4+
Pj4gK3dyYXBwZXIgZnJvbSB5b3VyIGtlcm5lbCByZXBvOgo+Pj4+ICsKPj4+PiArLi4gY29kZS1i
bG9jazo6IGJhc2gKPj4+PiArCj4+Pj4gKyAgICAgLi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0
LnB5Cj4+Pj4gKwo+Pj4+ICsuLiBub3RlOjoKPj4+PiArICAgWW91IG1heSB3YW50IHRvIHJ1biBg
YG1ha2UgbXJwcm9wZXJgYCBmaXJzdC4KPj4+Cj4+PiBJIG5vcm1hbGx5IHVzZSBPPWJ1aWxkZGly
IHdoZW4gYnVpbGRpbmcga2VybmVscy4KPj4+IERvZXMgdGhpcyBzdXBwb3J0IHVzaW5nIE89YnVp
bGRkaXIgPwo+Pgo+PiBZZXAsIGl0IHN1cHBvcnRzIHNwZWNpZnlpbmcgYSBzZXBhcmF0ZSBidWls
ZCBkaXJlY3RvcnkuCj4+Cj4+Pj4gKwo+Pj4+ICtJZiBldmVyeXRoaW5nIHdvcmtlZCBjb3JyZWN0
bHksIHlvdSBzaG91bGQgc2VlIHRoZSBmb2xsb3dpbmc6Cj4+Pj4gKwo+Pj4+ICsuLiBjb2RlLWJs
b2NrOjogYmFzaAo+Pj4+ICsKPj4+PiArICAgICBHZW5lcmF0aW5nIC5jb25maWcgLi4uCj4+Pj4g
KyAgICAgQnVpbGRpbmcgS1VuaXQgS2VybmVsIC4uLgo+Pj4+ICsgICAgIFN0YXJ0aW5nIEtVbml0
IEtlcm5lbCAuLi4KPj4+PiArCj4+Pj4gK2ZvbGxvd2VkIGJ5IGEgbGlzdCBvZiB0ZXN0cyB0aGF0
IGFyZSBydW4uIEFsbCBvZiB0aGVtIHNob3VsZCBiZSBwYXNzaW5nLgo+Pj4+ICsKPj4+PiArLi4g
bm90ZTo6Cj4+Pj4gKyAgIEJlY2F1c2UgaXQgaXMgYnVpbGRpbmcgYSBsb3Qgb2Ygc291cmNlcyBm
b3IgdGhlIGZpcnN0IHRpbWUsIHRoZSBgYEJ1aWxkaW5nCj4+Pj4gKyAgIGt1bml0IGtlcm5lbGBg
IHN0ZXAgbWF5IHRha2UgYSB3aGlsZS4KPj4+PiArCj4+Pj4gK1dyaXRpbmcgeW91ciBmaXJzdCB0
ZXN0Cj4+Pj4gKz09PT09PT09PT09PT09PT09PT09PT09Cj4+Pgo+Pj4gW3NuaXBdCj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QgYi9E
b2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzZlNjk2MzRlMjc0Cj4+Pj4gLS0tIC9k
ZXYvbnVsbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3VzYWdlLnJz
dAo+Pj4KPj4+IFRCRC4uLgo+Pgo+PiBXaGF0IGRpZCB5b3UgbWVhbiBieSB0aGlzIGNvbW1lbnQ/
Cj4gCj4gSSBwbGFuIHRvIHJldmlldyB1c2FnZS5yc3Qgc29vbi4uLiAoVG8gQmUgRG9uZSA6KQo+
IAoKSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHRoZSBzZXJpZXMgdmVyeSBzb29uIHNvIGl0IGdldHMg
c29tZSBzb2FrIHRpbWUKYWZ0ZXIgdGhpcyBtb3ZlIGluIGxpbnV4LW5leHQgYW5kIGl0IGNhbiBz
dGlsbCBtYWtlIHRoZSByYzEuCgpTaW5jZSB0aGVyZSBjaGFuZ2VzIGNhbiBiZSBhZGRyZXNzZWQg
YWZ0ZXIgcmMxLCBJIHdvdWxkIGxpa2UgdG8gbm90CnJlcXVpcmUgQnJlbmRhbiB0byBkbyBhbm90
aGVyIHZlcnNpb24gYmVmb3JlIEkgYXBwbHkuCgpIb3BlIHlvdSBhcmUgb2theSB3aXRoIHRoYXQg
UmFuZHkhCgp0aGFua3MsCi0tIFNodWFoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
