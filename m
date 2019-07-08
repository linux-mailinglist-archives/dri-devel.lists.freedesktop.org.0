Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE6627F5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 20:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4112D6E027;
	Mon,  8 Jul 2019 18:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776E6E027
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:08:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c73so3315134pfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 11:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pl4l3gaXCZ0Civm5i1pNfvFYe/9qjH5f6pxejgr6AT8=;
 b=okte/APJmxc2E4Q2qZG883jfMeDI9y32Q/f7J99ukQEghbta3QWsK64wABPVk/dt+E
 bXTls2hLbUH5PTR0wjz019BzNdjUqqq8KKgc41IV3cz8A7PXed4k+tIgBTsfLh4nNxaG
 YccpEuTCLm9VAOVCiXPv0R7Z1R8oZQaBqZdLnvVika4yOH6h4fDaB5554seeQsZVEuVg
 4xpBf0UFI1rJkxx/2B/QQKeRjwriSRfElIuMl3izzoLt/ljULvbT61r1QUuXV8J6xqX4
 qT3CmsaWg26qMrof9ybkydwWNMXBjDemtBi7FyTS3bBADNjvLmg2S/FAEoxDDoC+5bLZ
 uH4A==
X-Gm-Message-State: APjAAAUN8V9C/WhUbf1r6DMSVsfEKr7NecXUjMvhhSIeogQ/t70atjOU
 ARN25dasxXZN2lx1vY2RBaPlePeoqKjW536O963Rhg==
X-Google-Smtp-Source: APXvYqwoLoh11AGLeVf5uSZhLWgN1V0Lf0IPFYJElvqds2Mjg+FKGEtSZZdm1FCZKhiAeE2kYC6jZBxFraVmnG074HI=
X-Received: by 2002:a63:b919:: with SMTP id z25mr25337810pge.201.1562609318390; 
 Mon, 08 Jul 2019 11:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
 <20190705201505.GA19023@42.do-not-panic.com>
In-Reply-To: <20190705201505.GA19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 Jul 2019 11:08:27 -0700
Message-ID: <CAFd5g45cF9rYc8YupnCgd=7xz_yW+_TMp_L+cSFUBW7d9njnVQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pl4l3gaXCZ0Civm5i1pNfvFYe/9qjH5f6pxejgr6AT8=;
 b=SmOjZWgQtja4PiBSvkc/DsaRuuY8KuEdsMMIKFu//v+ppa1NV5GwqJ4JU08u4uuqXU
 KBGOdoVwwU+z3nPB5Yc7Nj2ei2N1Y2sszCQi7aydqX+v1bs0R5WVY9VfrLuAxD0X22yO
 et4/wVXqTEuA8XKb8I+GG2Cy0aB5wgbYiiI9zkmmG0P1bXmqCbs0GEYAywdf8m69uDNv
 i3LNyALK0qO5EHrEqLLK7h1Y4PRr0CfVpj56uFuOU19A9ib63eiTFseAJoBv3geF+XdI
 Ex1jzjCOgerKv5XAy3Zhbk2qyoHk/ecWgRcxMQ7auZjG3EZDzZIqKZ+9SL7kyLXtMMIf
 MRgA==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@google.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgNSwgMjAxOSBhdCAxOjE1IFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDA1OjM1OjU4UE0g
LTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9y
IGRlZmluaW5nIHVuaXQgdGVzdHM7IHRoaXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4gPiB0byBk
ZWZpbmUgdGVzdCBjYXNlcywgZnVuY3Rpb25zIHRoYXQgZXhlY3V0ZSBjb2RlIHdoaWNoIGlzIHVu
ZGVyIHRlc3QKPiA+IGFuZCBkZXRlcm1pbmUgd2hldGhlciB0aGUgY29kZSB1bmRlciB0ZXN0IGJl
aGF2ZXMgYXMgZXhwZWN0ZWQ7IHRoaXMgYWxzbwo+ID4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAg
dG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGluIHRlc3Qgc3VpdGVzIChoZXJlCj4gPiB3ZSBj
YWxsIHRoZW0gdGVzdF9tb2R1bGVzKS4KPiA+Cj4gPiBKdXN0IGRlZmluZSB0ZXN0IGNhc2VzIGFu
ZCBob3cgdG8gZXhlY3V0ZSB0aGVtIGZvciBub3c7IHNldHRpbmcKPiA+IGV4cGVjdGF0aW9ucyBv
biBjb2RlIHdpbGwgYmUgZGVmaW5lZCBsYXRlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmVu
ZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+IFJldmll
d2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5jb20+Cj4KPiBSZXZpZXdl
ZC1ieTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Cj4KPiBCdXQgYSBuaXRw
aWNrIGJlbG93LCBJIHRoaW5rIHRoYXQgY2FuIGJlIGZpeGVkIGxhdGVyIHdpdGggYSBmb2xsb3cg
dXAKPiBwYXRjaC4KPgo+ID4gKy8qKgo+ID4gKyAqIHN0cnVjdCBrdW5pdCAtIHJlcHJlc2VudHMg
YSBydW5uaW5nIGluc3RhbmNlIG9mIGEgdGVzdC4KPiA+ICsgKiBAcHJpdjogZm9yIHVzZXIgdG8g
c3RvcmUgYXJiaXRyYXJ5IGRhdGEuIENvbW1vbmx5IHVzZWQgdG8gcGFzcyBkYXRhIGNyZWF0ZWQK
PiA+ICsgKiBpbiB0aGUgaW5pdCBmdW5jdGlvbiAoc2VlICZzdHJ1Y3Qga3VuaXRfc3VpdGUpLgo+
ID4gKyAqCj4gPiArICogVXNlZCB0byBzdG9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgY3VycmVu
dCBjb250ZXh0IHVuZGVyIHdoaWNoIHRoZSB0ZXN0IGlzCj4gPiArICogcnVubmluZy4gTW9zdCBv
ZiB0aGlzIGRhdGEgaXMgcHJpdmF0ZSBhbmQgc2hvdWxkIG9ubHkgYmUgYWNjZXNzZWQgaW5kaXJl
Y3RseQo+ID4gKyAqIHZpYSBwdWJsaWMgZnVuY3Rpb25zOyB0aGUgb25lIGV4Y2VwdGlvbiBpcyBA
cHJpdiB3aGljaCBjYW4gYmUgdXNlZCBieSB0aGUKPiA+ICsgKiB0ZXN0IHdyaXRlciB0byBzdG9y
ZSBhcmJpdHJhcnkgZGF0YS4KPiA+ICsgKgo+ID4gKyAqIEEgYnJpZWYgbm90ZSBvbiBsb2NraW5n
Ogo+ID4gKyAqCj4gPiArICogRmlyc3Qgb2ZmLCB3ZSBuZWVkIHRvIGxvY2sgYmVjYXVzZSBpbiBj
ZXJ0YWluIGNhc2VzIGEgdXNlciBtYXkgd2FudCB0byB1c2UgYW4KPiA+ICsgKiBleHBlY3RhdGlv
biBpbiBhIHRocmVhZCBvdGhlciB0aGFuIHRoZSB0aHJlYWQgdGhhdCB0aGUgdGVzdCBjYXNlIGlz
IHJ1bm5pbmcKPiA+ICsgKiBpbi4KPgo+IFRoaXMgYXMgYSBwcmVmaXggdG8gdGhlIHN0cnVjdCB3
aXRob3V0IGEgbG9jayBzZWVtcyBvZGQuIEl0IHdvdWxkIGJlCj4gY2xlYXJlciBJIHRoaW5rIGlm
IHlvdSdkIGV4cGxhaW4gaGVyZSB3aGF0IGxvY2tpbmcgbWVjaGFuaXNtIHdlIGRlY2lkZWQKPiB0
byB1c2UgYW5kIHdoeSBpdCBzdWZmaWNlcyB0b2RheS4KCldob29wcywgc29ycnkgdGhpcyBzaG91
bGQgaGF2ZSBiZWVuIGluIHRoZSBuZXh0IHBhdGNoLiBXaWxsIGZpeC4KCj4gPiArLyoqCj4gPiAr
ICogc3VpdGVfdGVzdCgpIC0gdXNlZCB0byByZWdpc3RlciBhICZzdHJ1Y3Qga3VuaXRfc3VpdGUg
d2l0aCBLVW5pdC4KPgo+IFlvdSBtZWFuIGt1bml0X3Rlc3Rfc3VpdGUoKT8KClllcCwgc29ycnkg
YWJvdXQgdGhhdC4gV2lsbCBmaXguCgo+ID4gKyAqIEBzdWl0ZTogYSBzdGF0aWNhbGx5IGFsbG9j
YXRlZCAmc3RydWN0IGt1bml0X3N1aXRlLgo+ID4gKyAqCj4gPiArICogUmVnaXN0ZXJzIEBzdWl0
ZSB3aXRoIHRoZSB0ZXN0IGZyYW1ld29yay4gU2VlICZzdHJ1Y3Qga3VuaXRfc3VpdGUgZm9yIG1v
cmUKPiA+ICsgKiBpbmZvcm1hdGlvbi4KPiA+ICsgKgo+ID4gKyAqIE5PVEU6IEN1cnJlbnRseSBL
VW5pdCB0ZXN0cyBhcmUgYWxsIHJ1biBhcyBsYXRlX2luaXRjYWxsczsgdGhpcyBtZWFucyB0aGF0
Cj4gPiArICogdGhleSBjYW5ub3QgdGVzdCBhbnl0aGluZyB3aGVyZSB0ZXN0cyBtdXN0IHJ1biBh
dCBhIGRpZmZlcmVudCBpbml0IHBoYXNlLiBPbmUKPiA+ICsgKiBzaWduaWZpY2FudCByZXN0cmlj
dGlvbiByZXN1bHRpbmcgZnJvbSB0aGlzIGlzIHRoYXQgS1VuaXQgY2Fubm90IHJlbGlhYmx5Cj4g
PiArICogdGVzdCBhbnl0aGluZyB0aGF0IGlzIGluaXRpYWxpemUgaW4gdGhlIGxhdGVfaW5pdCBw
aGFzZS4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5pdGlhbGl6ZSBwcmlvciB0byB0
aGUgbGF0ZSBpbml0IHBoYXNlLgo+Cj4KPiBUaGF0IGlzLCB0aGlzIGlzIHVzZWxlc3MgdG8gdGVz
dCB0aGluZ3MgcnVubmluZyBlYXJseS4KClllYWgsIEkgY2FuIGFkZCB0aGF0IHBocmFzaW5nIGlu
LgoKPiA+ICsgKgo+ID4gKyAqIFRPRE8oYnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbSk6IERvbid0
IHJ1biBhbGwgS1VuaXQgdGVzdHMgYXMgbGF0ZV9pbml0Y2FsbHMuCj4gPiArICogSSBoYXZlIHNv
bWUgZnV0dXJlIHdvcmsgcGxhbm5lZCB0byBkaXNwYXRjaCBhbGwgS1VuaXQgdGVzdHMgZnJvbSB0
aGUgc2FtZQo+ID4gKyAqIHBsYWNlLCBhbmQgYXQgdGhlIHZlcnkgbGVhc3QgdG8gZG8gc28gYWZ0
ZXIgZXZlcnl0aGluZyBlbHNlIGlzIGRlZmluaXRlbHkKPiA+ICsgKiBpbml0aWFsaXplZC4KPgo+
IFRPRE9zIGFyZSBvZGQgdG8gYmUgYWRkaW5nIHRvIGRvY3VtZW50YXRpb24sIHRoaXMgaXMganVz
dCBub3QgY29tbW9uCj4gcGxhY2UgcHJhY3RpY2UuIFRoZSBOT1RFIHNob3VsZCBzdWZmaWNlIGZv
ciB5b3UuCgpCZWNhdXNlIGl0IGlzIGEga2VybmVsIGRvYz8gV291bGQgeW91IHVzdWFsbHkgbWFr
ZSBhIHNlcGFyYXRlCm5vbi1rZXJuZWwgZG9jIGNvbW1lbnQgZm9yIGEgVE9ETz8gSSBndWVzcyB0
aGF0IG1ha2VzIHNlbnNlLgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
