Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0664278
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15FF891BA;
	Wed, 10 Jul 2019 07:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBFE88A33
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:19:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id m4so793104pgk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfz7M1UfeMHHXZWoXYgXDdb2h4DdykfBMsEUwpNEPMQ=;
 b=gHK6BWdf/WwageBPTaBDsD44o55qxtFXcV4ciQEeGsIrswM6qte8/ME/ESByLtEPz8
 yrormV1rakn6B0iL1Nt80fPuWx5F16m0hQzeXjKnGSmDtIl4Ki4jd2efka06UbggOr6p
 zHVd2YNt7CJ/L9YCBYi/zFU5uJDR5Kad1XrjVphnhFLtUdSpyNr490o6jRYop7kRWQOm
 At/asJRbqvTYbzjPyxwpXSFCl2NQI1aTnCTN2r7SU7Rc2bNT0HHQvjYd8dYMql503Z5N
 8pbta6lUZ284TC0n1IVHj+3Y6zgDx2TWKdcR0SDaP8TO5xtCy/4FsJqPPhjrGqsI04lK
 hMsQ==
X-Gm-Message-State: APjAAAUBhVc44WQMvDIDv/eId//i+J5CZW4TMuHhCqM/91M0xBtoG+8+
 HCh17FyvEt+m3jCcKIivgVkk5JPdKSB7bMT4SYHYMw==
X-Google-Smtp-Source: APXvYqxygjuZUTtP3o1i+spSO/ODX76iUOPUnBSEPfKtnKohaqyGP7q59QAPXICI+tZgCfUcyvNAo+y5G+f5zV4sog8=
X-Received: by 2002:a17:90a:ab0d:: with SMTP id
 m13mr4975325pjq.84.1562743158492; 
 Wed, 10 Jul 2019 00:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-7-brendanhiggins@google.com>
 <CAK7LNATx30AhZ51xozde=nO06-8UzuC0M9nfZXrqkyfmEFdu5w@mail.gmail.com>
In-Reply-To: <CAK7LNATx30AhZ51xozde=nO06-8UzuC0M9nfZXrqkyfmEFdu5w@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 10 Jul 2019 00:19:06 -0700
Message-ID: <CAFd5g479H3pS9preU6-oCnN5adwBPDe4zQkiFPatKPbxpT5r6w@mail.gmail.com>
Subject: Re: [PATCH v7 06/18] kbuild: enable building KUnit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jfz7M1UfeMHHXZWoXYgXDdb2h4DdykfBMsEUwpNEPMQ=;
 b=l6WF16GVYe5eCc/5x8O8KdIpdGxyu4cFn2VT370ERVLkliFZoRrSfvp79LhBQiNSIN
 Fc3VEBYfnK22TfTFupWFCOy7wIIOmCBSmWzp151VVHjXiu08YEAd1cUyMwfMhn+dU/bF
 UHlZhZc0wk0wQTnNlXcS52uWXZ0GmfQuDPOS9e4OHx48QXa6/or/tZHQSVGwKXE40j8J
 tydITPKv4HnEgptGj8+2KN4wvn2CgD7bTL5YD2VkAUKcTMoyzgx29qn2jFdugUlBv9P8
 +GIsXjY1xdI2IPhRGGizyMRas0HBWbQ4T3n7MZP9ykXTcG22rpDfaxe6v7izwrk4jBVj
 l8OQ==
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

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCA5OjAwIFBNIE1hc2FoaXJvIFlhbWFkYQo8eWFtYWRhLm1h
c2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgOSwgMjAxOSBhdCAz
OjM0IFBNIEJyZW5kYW4gSGlnZ2lucwo+IDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPiB3cm90
ZToKPiA+Cj4gPiBLVW5pdCBpcyBhIG5ldyB1bml0IHRlc3RpbmcgZnJhbWV3b3JrIGZvciB0aGUg
a2VybmVsIGFuZCB3aGVuIHVzZWQgaXMKPiA+IGJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBh
cnQgb2YgaXQuIEFkZCBLVW5pdCB0byB0aGUgcm9vdCBLY29uZmlnIGFuZAo+ID4gTWFrZWZpbGUg
dG8gYWxsb3cgaXQgdG8gYmUgYWN0dWFsbHkgYnVpbHQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gQ2M6IE1hc2Fo
aXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gPiBDYzogTWljaGFs
IE1hcmVrIDxtaWNoYWwubGttbEBtYXJrb3ZpLm5ldD4KPiA+IFJldmlld2VkLWJ5OiBHcmVnIEty
b2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gUmV2aWV3ZWQtYnk6
IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiA+IC0tLQo+ID4gIEtjb25m
aWcgIHwgMiArKwo+ID4gIE1ha2VmaWxlIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0tjb25maWcg
Yi9LY29uZmlnCj4gPiBpbmRleCA0OGE4MGJlYWI2ODUzLi4xMDQyODUwMWVkYjc4IDEwMDY0NAo+
ID4gLS0tIGEvS2NvbmZpZwo+ID4gKysrIGIvS2NvbmZpZwo+ID4gQEAgLTMwLDMgKzMwLDUgQEAg
c291cmNlICJjcnlwdG8vS2NvbmZpZyIKPiA+ICBzb3VyY2UgImxpYi9LY29uZmlnIgo+ID4KPiA+
ICBzb3VyY2UgImxpYi9LY29uZmlnLmRlYnVnIgo+ID4gKwo+ID4gK3NvdXJjZSAia3VuaXQvS2Nv
bmZpZyIKPiA+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gPiBpbmRleCAzZTQ4
NjhhNjQ5OGIyLi42MGNmNGYwODEzZTBkIDEwMDY0NAo+ID4gLS0tIGEvTWFrZWZpbGUKPiA+ICsr
KyBiL01ha2VmaWxlCj4gPiBAQCAtOTkxLDcgKzk5MSw3IEBAIGVuZGlmCj4gPiAgUEhPTlkgKz0g
cHJlcGFyZTAKPiA+Cj4gPiAgaWZlcSAoJChLQlVJTERfRVhUTU9EKSwpCj4gPiAtY29yZS15ICAg
ICAgICAgKz0ga2VybmVsLyBjZXJ0cy8gbW0vIGZzLyBpcGMvIHNlY3VyaXR5LyBjcnlwdG8vIGJs
b2NrLwo+ID4gK2NvcmUteSAgICAgICAgICs9IGtlcm5lbC8gY2VydHMvIG1tLyBmcy8gaXBjLyBz
ZWN1cml0eS8gY3J5cHRvLyBibG9jay8ga3VuaXQvCj4gPgo+ID4gIHZtbGludXgtZGlycyAgIDo9
ICQocGF0c3Vic3QgJS8sJSwkKGZpbHRlciAlLywgJChpbml0LXkpICQoaW5pdC1tKSBcCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAkKGNvcmUteSkgJChjb3JlLW0pICQoZHJpdmVycy15KSAkKGRy
aXZlcnMtbSkgXAo+ID4gLS0KPiA+IDIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwo+Cj4KPiBU
aGlzIGlzIHNvIHRyaXZpYWwsIGFuZCBkbyBub3QgbmVlZCB0byBnZXQgYWNrIGZyb20gbWUuCgpP
aCwgc29ycnkgYWJvdXQgdGhhdC4KCj4gSnVzdCBhIG5pdC4KPgo+Cj4gV2hlbiBDT05GSUdfS1VO
SVQgaXMgZGlzYWJsZSwgaXMgdGhlcmUgYW55IHBvaW50IGluIGRlc2NlbmRpbmcgaW50byBrdW5p
dC8gPwo+Cj4gY29yZS0kKENPTkZJR19LVU5JVCkgKz0ga3VuaXQvCj4KPiAuLi4gbWlnaHQgYmUg
dXNlZnVsIHRvIHNraXAga3VuaXQvIGVudGlyZWx5LgoKTWFrZXMgc2Vuc2UuIEkganVzdCBzZW50
IG91dCBhIG5ldyBjaGFuZ2UgdGhhdCBkb2VzIHRoaXMuCgpUaGFua3MhCgo+IElmIHlvdSBsb29r
IGF0IHRoZSB0b3AtbGV2ZWwgTWFrZWZpbGUsIHNvbWUgZW50cmllcyBhcmUgZG9pbmcgdGhpczoK
Pgo+Cj4gaW5pdC15ICAgICAgICAgIDo9IGluaXQvCj4gZHJpdmVycy15ICAgICAgIDo9IGRyaXZl
cnMvIHNvdW5kLwo+IGRyaXZlcnMtJChDT05GSUdfU0FNUExFUykgKz0gc2FtcGxlcy8KPiBkcml2
ZXJzLSQoQ09ORklHX0tFUk5FTF9IRUFERVJfVEVTVCkgKz0gaW5jbHVkZS8KPiBuZXQteSAgICAg
ICAgICAgOj0gbmV0Lwo+IGxpYnMteSAgICAgICAgICA6PSBsaWIvCj4gY29yZS15ICAgICAgICAg
IDo9IHVzci8KPgo+Cj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiBNYXNhaGlybyBZYW1hZGEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
