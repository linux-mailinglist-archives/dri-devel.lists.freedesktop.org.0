Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DDCDD77
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 10:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495AC6E4E3;
	Mon,  7 Oct 2019 08:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FAE6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 08:41:06 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x127so8173538pfb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 01:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d00h7IdnG9Bs/4S91y4kH9nayVR/gCRtlft74BTzy6I=;
 b=KrguI0j2ldwKibtGfkiO1JBXC8fq+BvyPxT3Veund15Qmc1pslv9QnOFnJx3z4PyRo
 WY65BbXnVkOsS418xk608+svqIHKEMVELti98U7xmWzmlFbJITnNE2ZRopvauuDMHKpu
 WsAsRBxs/4KfYlLsCnphHR8M4tFrBAQ0G37V6jL0lSTm27sgCM2yq2GfkK+vh34+EsZt
 iCYgTUnC3aQpivV97vkzfGWNzlh5CrLIKsItxPlWWtBWs51rFRZ8iCbwgHuyopz+RqQ8
 mydIupalTiOYEc1bLJEfKUHbtcfMd7NsJ0fGj2gWAYzk6X46AlP38BAdgS/Z2D+ofk7Q
 Kmsw==
X-Gm-Message-State: APjAAAWDF3BbgFB7ej97TqKRGNaywY9Rp9265ayqP+uooPArIJt4RKMM
 EXsmuLwY4f1BORBidzyz8UtBodtXugMhe/t9q5mmyg==
X-Google-Smtp-Source: APXvYqwxXGxNWrOtyc6pCGXMSd6S1trXysWwf0BjsGf8IFVQEjIqe/b6qXijaBYnb2AJQF5sarq/ZPYHb1uY+bE9OzQ=
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr32723780pji.131.1570437665358; 
 Mon, 07 Oct 2019 01:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
 <20191006165436.GA29585@mit.edu>
 <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
In-Reply-To: <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 7 Oct 2019 01:40:53 -0700
Message-ID: <CAFd5g45djTX+FaXwn2abve1+6GbtNrv+8EJgDe_TXn1d+pzukA@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=d00h7IdnG9Bs/4S91y4kH9nayVR/gCRtlft74BTzy6I=;
 b=AUmIkwxCvC2VEhvpzdAyuNovVm2KMJDpgDWO5MBAsHUd4584+mQuTJYZeAiA+9d8qf
 Cb8CstcWhfdXgmKTT8Jlla+OWOrkQkY1Q6jQNfjMg0AaTBOEx4pAXKvHC9GWvBLdZn5f
 azsN30/RzedzrQSkqzovoBINho5ERfih75S8sqKoNuhZtu7ZJ6mBbxw52wj46VIAfs+0
 /MI6tTyO9gi1ONrL9pd+19m5cKkMzvosoY+gvlO9IBXyVRyQi1ybU6t67GV8aiwd0d0e
 6C9JtrHHYWmRkyPJoTmdFUFF6AQSVURI2bOhzr9RF9ZKtLjjyBGodHKo0R5D8MzKfjXZ
 yRSg==
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
 linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgNiwgMjAxOSBhdCAxMDoxOCBBTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBPY3QgNiwgMjAxOSBhdCA5
OjU1IEFNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1pdC5lZHU+IHdyb3RlOgo+ID4KPiA+IFdl
bGwsIG9uZSB0aGluZyB3ZSAqY2FuKiBkbyBpcyBpZiAoYSkgaWYgd2UgY2FuIGNyZWF0ZSBhIGtz
ZWxmdGVzdAo+ID4gYnJhbmNoIHdoaWNoIHdlIGtub3cgaXMgc3RhYmxlIGFuZCB3b24ndCBjaGFu
Z2UsIGFuZCAoYikgd2UgY2FuIGdldAo+ID4gYXNzdXJhbmNlcyB0aGF0IExpbnVzICp3aWxsKiBh
Y2NlcHQgdGhhdCBicmFuY2ggZHVyaW5nIHRoZSBuZXh0IG1lcmdlCj4gPiB3aW5kb3csIHRob3Nl
IHN1YnN5c3RlbXMgd2hpY2ggd2FudCB0byB1c2Uga3NlbGYgdGVzdCBjYW4gc2ltcGx5IHB1bGwK
PiA+IGl0IGludG8gdGhlaXIgdHJlZS4KPgo+IFllcy4KPgo+IEF0IHRoZSBzYW1lIHRpbWUsIEkg
ZG9uJ3QgdGhpbmsgaXQgbmVlZHMgdG8gYmUgZXZlbiB0aGF0IGZhbmN5LiBFdmVuCj4gaWYgaXQn
cyBub3QgYSBzdGFibGUgYnJhbmNoIHRoYXQgZ2V0cyBzaGFyZWQgYmV0d2VlbiBkaWZmZXJlbnQK
PiBkZXZlbG9wZXJzLCBpdCB3b3VsZCBiZSBnb29kIHRvIGp1c3QgaGF2ZSBwZW9wbGUgZG8gYSAi
bGV0J3MgdHJ5IHRoaXMiCj4gdGhyb3ctYXdheSBicmFuY2ggdG8gdXNlIHRoZSBrdW5pdCBmdW5j
dGlvbmFsaXR5IGFuZCB2ZXJpZnkgdGhhdAo+ICJ5ZWFoLCB0aGlzIGlzIGZhaXJseSBjb252ZW5p
ZW50IGZvciBleHQ0Ii4KPgo+IEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBtZXJnZWQgaW4gdGhhdCBm
b3JtLCBidXQganVzdCBjb25maXJtYXRpb24gdGhhdAo+IHRoZSBpbmZyYXN0cnVjdHVyZSBpcyBo
ZWxwZnVsIGJlZm9yZSBpdCBnZXRzIG1lcmdlZCB3b3VsZCBiZSBnb29kLgoKSSB0aG91Z2h0IHdl
IGFscmVhZHkgaGFkIGRvbmUgdGhpcyBzYXRpc2ZhY3RvcmlseS4KCldlIGhhdmUgb25lIHByb29m
LW9mLWNvbmNlcHQgdGVzdCBpbiB0aGUgYnJhbmNoIGluIHRoZSBrc2VsZnRlc3QgcmVwbwoocHJv
YyBzeXNjdGwgdGVzdCkgdGhhdCB3ZW50IG91dCBpbiB0aGUgcHVsbCByZXF1ZXN0LCBhbmQgd2Ug
YWxzbyBoYWQKc29tZSBvdGhlciB0ZXN0cyB0aGF0IHdlcmUgbm90IGluIHRoZSBwdWxsIHJlcXVl
c3QgKHRoZXJlIGlzIHRoZSBleHQ0CnRpbWVzdGFtcCBzdHVmZiBtZW50aW9uZWQgYWJvdmUsIGFu
ZCB3ZSBhbHNvIGhhZCBvbmUgYWdhaW5zdCB0aGUgbGlzdApkYXRhIHN0cnVjdHVyZSksIHdoaWNo
IHdlIHdlcmUgcGxhbm5pbmcgb24gc2VuZGluZyBvdXQgZm9yIHJldmlldyBvbmNlClNodWFoJ3Mg
cHVsbCByZXF1ZXN0IHdhcyBhY2NlcHRlZC4gSSBrbm93IHRoZSBhcHBhcm1vciBwZW9wbGUgYWxz
bwp3cm90ZSBzb21lIHRlc3RzIHRoYXQgdGhleSBzYWlkIHdlcmUgdXNlZnVsOyBob3dldmVyLCBJ
IGhhdmUgbm90CmNvb3JkaW5hdGVkIHdpdGggdGhlbSBvbiB1cHN0cmVhbWluZyB0aGVpciB0ZXN0
cy4gSSBrbm93IG9mIHNvbWUgb3RoZXIKcGVvcGxlIHdobyBhcmUgdXNpbmcgaXQsIGJ1dCBJIGRv
bid0IHRoaW5rIHRoZSB0ZXN0cyBhcmUgYXMgZmFyIGFsb25nCmZvciB1cHN0cmVhbWluZy4KClRo
ZSBwb2ludCBpczogSSB0aG91Z2h0IHdlIGhhZCBwbGVudHkgb2Ygc2lnbmFsIHRoYXQgS1VuaXQg
d291bGQgYmUKdXNlZnVsIHRvIGhhdmUgbWVyZ2VkIGludG8gdGhlIG1haW5saW5lIGtlcm5lbC4g
SSB0aG91Z2h0IHRoZSBvbmx5CnJlYXNvbiBpdCB3YXMgcmVqZWN0ZWQgZm9yIDUuNCB3YXMgZHVl
IHRvIHRoZSBkaXJlY3RvcnkgbmFtZSBpc3N1ZQpjb21iaW5lZCB3aXRoIGJhZCB0aW1pbmcuCgpQ
bGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZy4KClRoYW5rcyEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
