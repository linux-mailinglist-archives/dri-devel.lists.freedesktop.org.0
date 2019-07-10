Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C67B642CF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4736889B4D;
	Wed, 10 Jul 2019 07:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3F7899F2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 04:00:34 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x6A407vU006698
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 13:00:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6A407vU006698
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id y16so612637vsc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 21:00:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVFBlqrhTm2/tOFdoajn/r0BrhPxk5mqtObWA4onGZk2Vujq4V9
 EqJlcHmz0R6wwep/hcuAqkbMfKHPDESanzPFcec=
X-Google-Smtp-Source: APXvYqzEJesQV2n3K1HZLU8Wx1IHWCC1QIw58D6BP7vlVU/X0PRT9+zSoni+Ubl8ut/dwkZUzYEjYnFrduUZ0sj9y38=
X-Received: by 2002:a67:f495:: with SMTP id o21mr16708917vsn.54.1562731207027; 
 Tue, 09 Jul 2019 21:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-7-brendanhiggins@google.com>
In-Reply-To: <20190709063023.251446-7-brendanhiggins@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 Jul 2019 12:59:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATx30AhZ51xozde=nO06-8UzuC0M9nfZXrqkyfmEFdu5w@mail.gmail.com>
Message-ID: <CAK7LNATx30AhZ51xozde=nO06-8UzuC0M9nfZXrqkyfmEFdu5w@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kbuild: enable building KUnit
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1562731208;
 bh=KknRHaSkhBMpTs1BmzD59wJGTvSH88jZgscNwiE3MlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zcv8Y/m8P8X292YdVCGzvjt8eh3zKthkL/tKU8hgl0+kZFK/TCidt2YnUJeXwRY2C
 53gnnvfR1V5a/tZ3oft3dU87Wv/na0I6Cs7CUbLYQQ/tTgfsks7h1YrnLQlPvFedYE
 CUXVrkPfqD5VgYstJJ7CydXBopsxsIxYrwFsxgwx6d60uk5NaU0HmmUFrWcRa0Ma+X
 JP4vrMHlCl+oWvWoNYTtWzS8BRJaI99Vvewq8PDOryzMVp2NXYrBOU+OgPSCXtaQVR
 iBpoKf4mR5G2BIwMVbOsyg7IXjsTJdhgiZepcEUeuFghjpTnMBJ19Lf/0+rRb7AENC
 me1vWrlscZvww==
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "Cc: Shuah Khan" <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Michal Marek <michal.lkml@markovi.net>, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAzOjM0IFBNIEJyZW5kYW4gSGlnZ2lucwo8YnJlbmRhbmhp
Z2dpbnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBLVW5pdCBpcyBhIG5ldyB1bml0IHRlc3Rpbmcg
ZnJhbWV3b3JrIGZvciB0aGUga2VybmVsIGFuZCB3aGVuIHVzZWQgaXMKPiBidWlsdCBpbnRvIHRo
ZSBrZXJuZWwgYXMgYSBwYXJ0IG9mIGl0LiBBZGQgS1VuaXQgdG8gdGhlIHJvb3QgS2NvbmZpZyBh
bmQKPiBNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBhY3R1YWxseSBidWlsdC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBD
YzogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiBDYzog
TWljaGFsIE1hcmVrIDxtaWNoYWwubGttbEBtYXJrb3ZpLm5ldD4KPiBSZXZpZXdlZC1ieTogR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1i
eTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IC0tLQo+ICBLY29uZmln
ICB8IDIgKysKPiAgTWFrZWZpbGUgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvS2NvbmZpZyBiL0tjb25maWcK
PiBpbmRleCA0OGE4MGJlYWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAo+IC0tLSBhL0tjb25m
aWcKPiArKysgYi9LY29uZmlnCj4gQEAgLTMwLDMgKzMwLDUgQEAgc291cmNlICJjcnlwdG8vS2Nv
bmZpZyIKPiAgc291cmNlICJsaWIvS2NvbmZpZyIKPgo+ICBzb3VyY2UgImxpYi9LY29uZmlnLmRl
YnVnIgo+ICsKPiArc291cmNlICJrdW5pdC9LY29uZmlnIgo+IGRpZmYgLS1naXQgYS9NYWtlZmls
ZSBiL01ha2VmaWxlCj4gaW5kZXggM2U0ODY4YTY0OThiMi4uNjBjZjRmMDgxM2UwZCAxMDA2NDQK
PiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAgLTk5MSw3ICs5OTEsNyBAQCBl
bmRpZgo+ICBQSE9OWSArPSBwcmVwYXJlMAo+Cj4gIGlmZXEgKCQoS0JVSUxEX0VYVE1PRCksKQo+
IC1jb3JlLXkgICAgICAgICArPSBrZXJuZWwvIGNlcnRzLyBtbS8gZnMvIGlwYy8gc2VjdXJpdHkv
IGNyeXB0by8gYmxvY2svCj4gK2NvcmUteSAgICAgICAgICs9IGtlcm5lbC8gY2VydHMvIG1tLyBm
cy8gaXBjLyBzZWN1cml0eS8gY3J5cHRvLyBibG9jay8ga3VuaXQvCj4KPiAgdm1saW51eC1kaXJz
ICAgOj0gJChwYXRzdWJzdCAlLywlLCQoZmlsdGVyICUvLCAkKGluaXQteSkgJChpbml0LW0pIFwK
PiAgICAgICAgICAgICAgICAgICAgICAkKGNvcmUteSkgJChjb3JlLW0pICQoZHJpdmVycy15KSAk
KGRyaXZlcnMtbSkgXAo+IC0tCj4gMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgoKVGhpcyBp
cyBzbyB0cml2aWFsLCBhbmQgZG8gbm90IG5lZWQgdG8gZ2V0IGFjayBmcm9tIG1lLgoKSnVzdCBh
IG5pdC4KCgpXaGVuIENPTkZJR19LVU5JVCBpcyBkaXNhYmxlLCBpcyB0aGVyZSBhbnkgcG9pbnQg
aW4gZGVzY2VuZGluZyBpbnRvIGt1bml0LyA/Cgpjb3JlLSQoQ09ORklHX0tVTklUKSArPSBrdW5p
dC8KCi4uLiBtaWdodCBiZSB1c2VmdWwgdG8gc2tpcCBrdW5pdC8gZW50aXJlbHkuCgpJZiB5b3Ug
bG9vayBhdCB0aGUgdG9wLWxldmVsIE1ha2VmaWxlLCBzb21lIGVudHJpZXMgYXJlIGRvaW5nIHRo
aXM6CgoKaW5pdC15ICAgICAgICAgIDo9IGluaXQvCmRyaXZlcnMteSAgICAgICA6PSBkcml2ZXJz
LyBzb3VuZC8KZHJpdmVycy0kKENPTkZJR19TQU1QTEVTKSArPSBzYW1wbGVzLwpkcml2ZXJzLSQo
Q09ORklHX0tFUk5FTF9IRUFERVJfVEVTVCkgKz0gaW5jbHVkZS8KbmV0LXkgICAgICAgICAgIDo9
IG5ldC8KbGlicy15ICAgICAgICAgIDo9IGxpYi8KY29yZS15ICAgICAgICAgIDo9IHVzci8KCgoK
CgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
