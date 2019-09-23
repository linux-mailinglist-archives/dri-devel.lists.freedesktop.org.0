Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32932BC24D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCA96EA09;
	Tue, 24 Sep 2019 07:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90E189A9A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 19:50:38 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCULM-0004hv-CB; Mon, 23 Sep 2019 19:49:56 +0000
Subject: Re: [PATCH v18 15/19] Documentation: kunit: add documentation for
 KUnit
To: Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-16-brendanhiggins@google.com>
 <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
 <CAFd5g45y-NWzbn8E8hUg=n4U5E+N6_4D8eCXhQ74Y0N4zqVW=w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d7a61045-8fe6-a104-ece9-67b69c379425@infradead.org>
Date: Mon, 23 Sep 2019 12:49:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45y-NWzbn8E8hUg=n4U5E+N6_4D8eCXhQ74Y0N4zqVW=w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUUUPJp8Q+5PlAv7/AOGceOtoVnI1K3PZLVv987cVRU=; b=IWsVG8Im3Z8uUrSD/S3h+TdHQ
 xHv1A9gVSzgMJ+kavZxPZT1xVWv/jjm2sfWSXfFzdZXciz5sTxLQIXQbckhIgFNYBWXOW56MeYtce
 RDRk8PXLYa9JQjzqNAneuoj1DvrREkcaGQzDzLU/3LMcEVdSMIHU76lE/eq38yRXFCg081K4ExSo1
 3FzbuLuNzJemUVQmfTaqi81/oFTUI+Th3OPTWOS6vX+oxZcGfA5LtBulYnbTXPP5bCHavi6YOqx9z
 e56+yGYscXzBmfqZYNNhNJZMvVMvRWVJ5BD1Js8eMwTSDhc/tN/DGap0FCPAVWCU6SvBatYXJP2Hz
 KnM7z0gbQ==;
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
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMy8xOSAxMTowNiBBTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+IE9uIE1vbiwgU2Vw
IDIzLCAyMDE5IGF0IDg6NDggQU0gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
IHdyb3RlOgo+Pgo+PiBPbiA5LzIzLzE5IDI6MDIgQU0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToK
Pj4+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBLVW5pdCwgdGhlIExpbnV4IGtlcm5lbCB1bml0IHRl
c3RpbmcgZnJhbWV3b3JrLgo+Pj4gLSBBZGQgaW50cm8gYW5kIHVzYWdlIGd1aWRlIGZvciBLVW5p
dAo+Pj4gLSBBZGQgQVBJIHJlZmVyZW5jZQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1
byA8ZmVsaXhndW94aXVwaW5nQGdtYWlsLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4g
SGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPj4+IENjOiBKb25hdGhhbiBDb3Ji
ZXQgPGNvcmJldEBsd24ubmV0Pgo+Pj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhv
cnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8
c2JveWRAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2lu
ZGV4LnJzdCAgICAgICAgICAgfCAgIDEgKwo+Pj4gIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1
bml0L2FwaS9pbmRleC5yc3QgfCAgMTYgKwo+Pj4gIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1
bml0L2FwaS90ZXN0LnJzdCAgfCAgMTEgKwo+Pj4gIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1
bml0L2ZhcS5yc3QgICAgICAgfCAgNjIgKysrCj4+PiAgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
a3VuaXQvaW5kZXgucnN0ICAgICB8ICA3OSArKysKPj4+ICBEb2N1bWVudGF0aW9uL2Rldi10b29s
cy9rdW5pdC9zdGFydC5yc3QgICAgIHwgMTgwICsrKysrKwo+Pj4gIERvY3VtZW50YXRpb24vZGV2
LXRvb2xzL2t1bml0L3VzYWdlLnJzdCAgICAgfCA1NzYgKysrKysrKysrKysrKysrKysrKysKPj4+
ICA3IGZpbGVzIGNoYW5nZWQsIDkyNSBpbnNlcnRpb25zKCspCj4+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L2FwaS9pbmRleC5yc3QKPj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvYXBpL3Rlc3QucnN0
Cj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L2Zh
cS5yc3QKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3Vu
aXQvaW5kZXgucnN0Cj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2LXRv
b2xzL2t1bml0L3N0YXJ0LnJzdAo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPj4KPj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2Rldi10b29scy9rdW5pdC9zdGFydC5yc3QgYi9Eb2N1bWVudGF0aW9uL2Rldi10b29s
cy9rdW5pdC9zdGFydC5yc3QKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjZkYzIyOWU0NmJiMwo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvc3RhcnQucnN0Cj4+PiBAQCAtMCwwICsxLDE4MCBAQAo+
Pj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+PiArCj4+PiArPT09PT09
PT09PT09PT09Cj4+PiArR2V0dGluZyBTdGFydGVkCj4+PiArPT09PT09PT09PT09PT09Cj4+PiAr
Cj4+PiArSW5zdGFsbGluZyBkZXBlbmRlbmNpZXMKPj4+ICs9PT09PT09PT09PT09PT09PT09PT09
PQo+Pj4gK0tVbml0IGhhcyB0aGUgc2FtZSBkZXBlbmRlbmNpZXMgYXMgdGhlIExpbnV4IGtlcm5l
bC4gQXMgbG9uZyBhcyB5b3UgY2FuIGJ1aWxkCj4+PiArdGhlIGtlcm5lbCwgeW91IGNhbiBydW4g
S1VuaXQuCj4+PiArCj4+PiArS1VuaXQgV3JhcHBlcgo+Pj4gKz09PT09PT09PT09PT0KPj4+ICtJ
bmNsdWRlZCB3aXRoIEtVbml0IGlzIGEgc2ltcGxlIFB5dGhvbiB3cmFwcGVyIHRoYXQgaGVscHMg
Zm9ybWF0IHRoZSBvdXRwdXQgdG8KPj4+ICtlYXNpbHkgdXNlIGFuZCByZWFkIEtVbml0IG91dHB1
dC4gSXQgaGFuZGxlcyBidWlsZGluZyBhbmQgcnVubmluZyB0aGUga2VybmVsLCBhcwo+Pj4gK3dl
bGwgYXMgZm9ybWF0dGluZyB0aGUgb3V0cHV0Lgo+Pj4gKwo+Pj4gK1RoZSB3cmFwcGVyIGNhbiBi
ZSBydW4gd2l0aDoKPj4+ICsKPj4+ICsuLiBjb2RlLWJsb2NrOjogYmFzaAo+Pj4gKwo+Pj4gKyAg
IC4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4KPj4+ICsKPj4+ICtDcmVhdGluZyBh
IGt1bml0Y29uZmlnCj4+PiArPT09PT09PT09PT09PT09PT09PT09PQo+Pj4gK1RoZSBQeXRob24g
c2NyaXB0IGlzIGEgdGhpbiB3cmFwcGVyIGFyb3VuZCBLYnVpbGQgYXMgc3VjaCwgaXQgbmVlZHMg
dG8gYmUKPj4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJvdW5k
IEtidWlsZC4gQXMgc3VjaCwKPiAKPiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lgo+IAo+
Pgo+Pj4gK2NvbmZpZ3VyZWQgd2l0aCBhIGBga3VuaXRjb25maWdgYCBmaWxlLiBUaGlzIGZpbGUg
ZXNzZW50aWFsbHkgY29udGFpbnMgdGhlCj4+PiArcmVndWxhciBLZXJuZWwgY29uZmlnLCB3aXRo
IHRoZSBzcGVjaWZpYyB0ZXN0IHRhcmdldHMgYXMgd2VsbC4KPj4+ICsKPj4+ICsuLiBjb2RlLWJs
b2NrOjogYmFzaAo+Pj4gKwo+Pj4gKyAgICAgZ2l0IGNsb25lIC1iIG1hc3RlciBodHRwczovL2t1
bml0Lmdvb2dsZXNvdXJjZS5jb20va3VuaXRjb25maWcgJFBBVEhfVE9fS1VOSVRDT05GSUdfUkVQ
Two+Pj4gKyAgICAgY2QgJFBBVEhfVE9fTElOVVhfUkVQTwo+Pj4gKyAgICAgbG4gLXMgJFBBVEhf
VE9fS1VOSVRfQ09ORklHX1JFUE8va3VuaXRjb25maWcga3VuaXRjb25maWcKPj4+ICsKPj4+ICtZ
b3UgbWF5IHdhbnQgdG8gYWRkIGt1bml0Y29uZmlnIHRvIHlvdXIgbG9jYWwgZ2l0aWdub3JlLgo+
Pj4gKwo+Pj4gK1ZlcmlmeWluZyBLVW5pdCBXb3Jrcwo+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+Pj4gKwo+Pj4gK1RvIG1ha2Ugc3VyZSB0aGF0IGV2ZXJ5dGhpbmcgaXMgc2V0IHVwIGNvcnJl
Y3RseSwgc2ltcGx5IGludm9rZSB0aGUgUHl0aG9uCj4+PiArd3JhcHBlciBmcm9tIHlvdXIga2Vy
bmVsIHJlcG86Cj4+PiArCj4+PiArLi4gY29kZS1ibG9jazo6IGJhc2gKPj4+ICsKPj4+ICsgICAg
IC4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weQo+Pj4gKwo+Pj4gKy4uIG5vdGU6Ogo+Pj4g
KyAgIFlvdSBtYXkgd2FudCB0byBydW4gYGBtYWtlIG1ycHJvcGVyYGAgZmlyc3QuCj4+Cj4+IEkg
bm9ybWFsbHkgdXNlIE89YnVpbGRkaXIgd2hlbiBidWlsZGluZyBrZXJuZWxzLgo+PiBEb2VzIHRo
aXMgc3VwcG9ydCB1c2luZyBPPWJ1aWxkZGlyID8KPiAKPiBZZXAsIGl0IHN1cHBvcnRzIHNwZWNp
ZnlpbmcgYSBzZXBhcmF0ZSBidWlsZCBkaXJlY3RvcnkuCj4gCj4+PiArCj4+PiArSWYgZXZlcnl0
aGluZyB3b3JrZWQgY29ycmVjdGx5LCB5b3Ugc2hvdWxkIHNlZSB0aGUgZm9sbG93aW5nOgo+Pj4g
Kwo+Pj4gKy4uIGNvZGUtYmxvY2s6OiBiYXNoCj4+PiArCj4+PiArICAgICBHZW5lcmF0aW5nIC5j
b25maWcgLi4uCj4+PiArICAgICBCdWlsZGluZyBLVW5pdCBLZXJuZWwgLi4uCj4+PiArICAgICBT
dGFydGluZyBLVW5pdCBLZXJuZWwgLi4uCj4+PiArCj4+PiArZm9sbG93ZWQgYnkgYSBsaXN0IG9m
IHRlc3RzIHRoYXQgYXJlIHJ1bi4gQWxsIG9mIHRoZW0gc2hvdWxkIGJlIHBhc3NpbmcuCj4+PiAr
Cj4+PiArLi4gbm90ZTo6Cj4+PiArICAgQmVjYXVzZSBpdCBpcyBidWlsZGluZyBhIGxvdCBvZiBz
b3VyY2VzIGZvciB0aGUgZmlyc3QgdGltZSwgdGhlIGBgQnVpbGRpbmcKPj4+ICsgICBrdW5pdCBr
ZXJuZWxgYCBzdGVwIG1heSB0YWtlIGEgd2hpbGUuCj4+PiArCj4+PiArV3JpdGluZyB5b3VyIGZp
cnN0IHRlc3QKPj4+ICs9PT09PT09PT09PT09PT09PT09PT09PQo+Pgo+PiBbc25pcF0KPj4KPj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QgYi9E
b2N1bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM2ZTY5NjM0ZTI3NAo+Pj4gLS0tIC9kZXYv
bnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0Cj4+
Cj4+IFRCRC4uLgo+IAo+IFdoYXQgZGlkIHlvdSBtZWFuIGJ5IHRoaXMgY29tbWVudD8KCkkgcGxh
biB0byByZXZpZXcgdXNhZ2UucnN0IHNvb24uLi4gKFRvIEJlIERvbmUgOikKCi0tIAp+UmFuZHkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
