Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F1955B6C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 00:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4026E176;
	Tue, 25 Jun 2019 22:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73AE6E176
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 22:41:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k8so233768plt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 15:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZHzVm2a7c7UL6Qa6OAs8GEjMqpVhQyW6fXdYgD38tg=;
 b=WtiVG4NvuFLsYoAICAFPAWBHNoInT1nOMG4Z/RwkNzgvU0t/TWwOedXVsegOSj9EYG
 LoOk2N6GT8qaFJ0zk5kDPC2icpXCCtzAxnY94gfjHUu/jmeLgSoFqnL0379Z+hLYp9Wj
 Gxm+ikF5RYVWLIJwfT0fMC1EjHwcZzKuw+fLOC6PtNJ4h+Te8Kk5R96RMqSm2r7GTtSJ
 U3/jY46zr3chT0PIJgwsPzSNpOO9YIy27OPeRCKR5lLvI8WAnAleD18nIvqQl+oeORN0
 JyGr3euAz7FXSKgwOOjlBXLL/q7pIF+cWVfbZsmNbaWKkpKNxnRRRgzHAntORMgGRvrx
 MMEA==
X-Gm-Message-State: APjAAAUYfF3n5B3rfZUy3TSQqRKiJ5J0vqhkNrtJvng3Jgm9wb7jx9dL
 PUIqCk4CODkqyKwcU9wjHSSBjDgDzkunDkwFlt6+iA==
X-Google-Smtp-Source: APXvYqy+cT1ZyNb5dbS97li+J3swfp3mEaFo87MllhiLnOnKUdNsGvjik4FBRsZ5dS4sFwdr9UIg/0trivOUWFuNZts=
X-Received: by 2002:a17:902:1004:: with SMTP id
 b4mr1155831pla.325.1561502500720; 
 Tue, 25 Jun 2019 15:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-7-brendanhiggins@google.com>
 <20190625221318.GO19023@42.do-not-panic.com>
In-Reply-To: <20190625221318.GO19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Jun 2019 15:41:29 -0700
Message-ID: <CAFd5g448rYqr3PHg0cfoddr70nktkWXcRfJoZHmuPJjTW53YYg@mail.gmail.com>
Subject: Re: [PATCH v5 06/18] kbuild: enable building KUnit
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lZHzVm2a7c7UL6Qa6OAs8GEjMqpVhQyW6fXdYgD38tg=;
 b=WD+/u8ZZNxnSkIT8uW5k3AjwCTR/8Rul0p24/yrVxO5s2EytGRajAgq/3lh2tgJCoM
 vOOrZEi6S9bPRtEV0sQ50TTo+svFRl+vB4anHgBOhwDOhj/sKAavGpLkR9ZW/+8ZlccU
 UdMs6Z8Ga9hdSotzdUPEFVwI6IZ9G3K5novTFltGAZnxEjjToD6xbWblx/HifwrkfVwk
 hJ5e4XwNevJKRgf4O7t302ViaxWNKj1aXsprvBLH4sig979oKbLTzjrYSQpuQWmWeZ6j
 dP5tx4S2eAu98MeIeDuog/S9j0E1psO/k6tGCkOvr99nidb5QryIDQhLc5bRofLMt0FA
 FrzA==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMzoxMyBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwMToyNjowMUFN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvS2NvbmZpZyBi
L0tjb25maWcKPiA+IGluZGV4IDQ4YTgwYmVhYjY4NTMuLjEwNDI4NTAxZWRiNzggMTAwNjQ0Cj4g
PiAtLS0gYS9LY29uZmlnCj4gPiArKysgYi9LY29uZmlnCj4gPiBAQCAtMzAsMyArMzAsNSBAQCBz
b3VyY2UgImNyeXB0by9LY29uZmlnIgo+ID4gIHNvdXJjZSAibGliL0tjb25maWciCj4gPgo+ID4g
IHNvdXJjZSAibGliL0tjb25maWcuZGVidWciCj4gPiArCj4gPiArc291cmNlICJrdW5pdC9LY29u
ZmlnIgo+Cj4gVGhpcyBwYXRjaCB3b3VsZCBicmVhayBjb21waWxhdGlvbiBhcyBrdW5pdC9LY29u
ZmlnIGlzIG5vdCBpbnRyb2R1Y2VkLiBUaGlzCj4gd291bGQgd291bGQgYWxzbyBicmVhayBiaXNl
Y3RhYmlsaXR5IG9uIHRoaXMgY29tbWl0LiBUaGlzIGNoYW5nZSBzaG91bGQKPiBlaXRoZXIgYmUg
Zm9sZGVkIGluIHRvIHRoZSBuZXh0IHBhdGNoLCBvciBqdXN0IGJlIGEgc2VwYXJhdGUgcGF0Y2gg
YWZ0ZXIKPiB0aGUgbmV4dCBvbmUuCgpNYXliZSBteSBicmFpbiBpc24ndCB3b3JraW5nIHJpZ2h0
IG5vdywgYnV0IEkgYW0gcHJldHR5IGRhcm4gc3VyZSB0aGF0CkkgaW50cm9kdWNlIGt1bml0L0tj
b25maWcgaW4gdGhlIHZlcnkgZmlyc3QgcGF0Y2ggb2YgdGhpcyBzZXJpZXMuClF1b3RpbmcgZnJv
bSB0aGUgY2hhbmdlIHN1bW1hcnkgZnJvbSB0aGUgZmlyc3QgY29tbWl0OgoKPiAgaW5jbHVkZS9r
dW5pdC90ZXN0LmggfCAxNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGt1
bml0L0tjb25maWcgICAgICAgIHwgIDE3ICsrKysKPiAga3VuaXQvTWFrZWZpbGUgICAgICAgfCAg
IDEgKwo+ICBrdW5pdC90ZXN0LmMgICAgICAgICB8IDIxMCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzg5IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUva3VuaXQvdGVzdC5oCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBrdW5pdC9LY29uZmlnCgpJIGFtIG5vdCBjcmF6eSwgcmlnaHQ/Cgo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQga3VuaXQvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGt1bml0
L3Rlc3QuYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
