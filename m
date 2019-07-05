Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4E60C1A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549A16E536;
	Fri,  5 Jul 2019 20:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583566E536
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 20:15:08 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id cl9so5034453plb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 13:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dg5Yvvp7NUrUvKeik0ledTLe2yGcHUO+ZrIPV2huI9Y=;
 b=LIwjAgIJo/R9VDxpd5NavPGCv98ooAM8UytXpUTpNmYML4PerZ4WOE8Oh+xwyDEHbL
 FuNa6eohNlWpl22cdUH6hZpRffXSVACQGERAbwfxjRlwwepYTEP+3Vb8rW2ttgJZWmZD
 3ElKW9rGtq2feY05vierIuXcoJyqC9/zV51aOxhae0Ei05tbcJaQcIOjrBYYoN5HklIr
 rwALAW3UHqS9XJ3rMb3FyKTlvUJZUbC1vZdhqox5kyklR1GyVbFUKEufCdtKsOOrI3wS
 +4iniUkNVZ1aprUt+ZpsJtwoioEPFo7UdHdKBovE+GdXz4386fF1N2lBtKWTriUSqvIf
 AzuA==
X-Gm-Message-State: APjAAAX8MiZ9sz1RB3SwL93qu/SebO6jzDSUjkgyKZdDIOwihBpwi17p
 3AyaAi5vgC7X+ouRuKEludg=
X-Google-Smtp-Source: APXvYqzH7c1mrZ0zttAPULzlg8jVTTmmhx/hVeHeJnG9PaMmHS0LdOn+bNDKbdY4NLyOIl1o3kOldA==
X-Received: by 2002:a17:902:2865:: with SMTP id
 e92mr7552625plb.264.1562357707679; 
 Fri, 05 Jul 2019 13:15:07 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id 10sm17424980pfb.30.2019.07.05.13.15.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:15:06 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id C552E40190; Fri,  5 Jul 2019 20:15:05 +0000 (UTC)
Date: Fri, 5 Jul 2019 20:15:05 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190705201505.GA19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-2-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MzU6NThQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEFkZCBjb3JlIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nIHVuaXQgdGVzdHM7IHRo
aXMgcHJvdmlkZXMgYSBjb21tb24gd2F5Cj4gdG8gZGVmaW5lIHRlc3QgY2FzZXMsIGZ1bmN0aW9u
cyB0aGF0IGV4ZWN1dGUgY29kZSB3aGljaCBpcyB1bmRlciB0ZXN0Cj4gYW5kIGRldGVybWluZSB3
aGV0aGVyIHRoZSBjb2RlIHVuZGVyIHRlc3QgYmVoYXZlcyBhcyBleHBlY3RlZDsgdGhpcyBhbHNv
Cj4gcHJvdmlkZXMgYSB3YXkgdG8gZ3JvdXAgdG9nZXRoZXIgcmVsYXRlZCB0ZXN0IGNhc2VzIGlu
IHRlc3Qgc3VpdGVzIChoZXJlCj4gd2UgY2FsbCB0aGVtIHRlc3RfbW9kdWxlcykuCj4gCj4gSnVz
dCBkZWZpbmUgdGVzdCBjYXNlcyBhbmQgaG93IHRvIGV4ZWN1dGUgdGhlbSBmb3Igbm93OyBzZXR0
aW5nCj4gZXhwZWN0YXRpb25zIG9uIGNvZGUgd2lsbCBiZSBkZWZpbmVkIGxhdGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4K
PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KPiBSZXZpZXdlZC1ieTogTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29t
PgoKUmV2aWV3ZWQtYnk6IEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgoKQnV0
IGEgbml0cGljayBiZWxvdywgSSB0aGluayB0aGF0IGNhbiBiZSBmaXhlZCBsYXRlciB3aXRoIGEg
Zm9sbG93IHVwCnBhdGNoLgoKPiArLyoqCj4gKyAqIHN0cnVjdCBrdW5pdCAtIHJlcHJlc2VudHMg
YSBydW5uaW5nIGluc3RhbmNlIG9mIGEgdGVzdC4KPiArICogQHByaXY6IGZvciB1c2VyIHRvIHN0
b3JlIGFyYml0cmFyeSBkYXRhLiBDb21tb25seSB1c2VkIHRvIHBhc3MgZGF0YSBjcmVhdGVkCj4g
KyAqIGluIHRoZSBpbml0IGZ1bmN0aW9uIChzZWUgJnN0cnVjdCBrdW5pdF9zdWl0ZSkuCj4gKyAq
Cj4gKyAqIFVzZWQgdG8gc3RvcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGN1cnJlbnQgY29udGV4
dCB1bmRlciB3aGljaCB0aGUgdGVzdCBpcwo+ICsgKiBydW5uaW5nLiBNb3N0IG9mIHRoaXMgZGF0
YSBpcyBwcml2YXRlIGFuZCBzaG91bGQgb25seSBiZSBhY2Nlc3NlZCBpbmRpcmVjdGx5Cj4gKyAq
IHZpYSBwdWJsaWMgZnVuY3Rpb25zOyB0aGUgb25lIGV4Y2VwdGlvbiBpcyBAcHJpdiB3aGljaCBj
YW4gYmUgdXNlZCBieSB0aGUKPiArICogdGVzdCB3cml0ZXIgdG8gc3RvcmUgYXJiaXRyYXJ5IGRh
dGEuCj4gKyAqCj4gKyAqIEEgYnJpZWYgbm90ZSBvbiBsb2NraW5nOgo+ICsgKgo+ICsgKiBGaXJz
dCBvZmYsIHdlIG5lZWQgdG8gbG9jayBiZWNhdXNlIGluIGNlcnRhaW4gY2FzZXMgYSB1c2VyIG1h
eSB3YW50IHRvIHVzZSBhbgo+ICsgKiBleHBlY3RhdGlvbiBpbiBhIHRocmVhZCBvdGhlciB0aGFu
IHRoZSB0aHJlYWQgdGhhdCB0aGUgdGVzdCBjYXNlIGlzIHJ1bm5pbmcKPiArICogaW4uCgpUaGlz
IGFzIGEgcHJlZml4IHRvIHRoZSBzdHJ1Y3Qgd2l0aG91dCBhIGxvY2sgc2VlbXMgb2RkLiBJdCB3
b3VsZCBiZQpjbGVhcmVyIEkgdGhpbmsgaWYgeW91J2QgZXhwbGFpbiBoZXJlIHdoYXQgbG9ja2lu
ZyBtZWNoYW5pc20gd2UgZGVjaWRlZAp0byB1c2UgYW5kIHdoeSBpdCBzdWZmaWNlcyB0b2RheS4K
Cj4gKy8qKgo+ICsgKiBzdWl0ZV90ZXN0KCkgLSB1c2VkIHRvIHJlZ2lzdGVyIGEgJnN0cnVjdCBr
dW5pdF9zdWl0ZSB3aXRoIEtVbml0LgoKWW91IG1lYW4ga3VuaXRfdGVzdF9zdWl0ZSgpPwoKPiAr
ICogQHN1aXRlOiBhIHN0YXRpY2FsbHkgYWxsb2NhdGVkICZzdHJ1Y3Qga3VuaXRfc3VpdGUuCj4g
KyAqCj4gKyAqIFJlZ2lzdGVycyBAc3VpdGUgd2l0aCB0aGUgdGVzdCBmcmFtZXdvcmsuIFNlZSAm
c3RydWN0IGt1bml0X3N1aXRlIGZvciBtb3JlCj4gKyAqIGluZm9ybWF0aW9uLgo+ICsgKgo+ICsg
KiBOT1RFOiBDdXJyZW50bHkgS1VuaXQgdGVzdHMgYXJlIGFsbCBydW4gYXMgbGF0ZV9pbml0Y2Fs
bHM7IHRoaXMgbWVhbnMgdGhhdAo+ICsgKiB0aGV5IGNhbm5vdCB0ZXN0IGFueXRoaW5nIHdoZXJl
IHRlc3RzIG11c3QgcnVuIGF0IGEgZGlmZmVyZW50IGluaXQgcGhhc2UuIE9uZQo+ICsgKiBzaWdu
aWZpY2FudCByZXN0cmljdGlvbiByZXN1bHRpbmcgZnJvbSB0aGlzIGlzIHRoYXQgS1VuaXQgY2Fu
bm90IHJlbGlhYmx5Cj4gKyAqIHRlc3QgYW55dGhpbmcgdGhhdCBpcyBpbml0aWFsaXplIGluIHRo
ZSBsYXRlX2luaXQgcGhhc2UuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbml0aWFsaXpl
IHByaW9yIHRvIHRoZSBsYXRlIGluaXQgcGhhc2UuCgoKVGhhdCBpcywgdGhpcyBpcyB1c2VsZXNz
IHRvIHRlc3QgdGhpbmdzIHJ1bm5pbmcgZWFybHkuCgo+ICsgKgo+ICsgKiBUT0RPKGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20pOiBEb24ndCBydW4gYWxsIEtVbml0IHRlc3RzIGFzIGxhdGVfaW5p
dGNhbGxzLgo+ICsgKiBJIGhhdmUgc29tZSBmdXR1cmUgd29yayBwbGFubmVkIHRvIGRpc3BhdGNo
IGFsbCBLVW5pdCB0ZXN0cyBmcm9tIHRoZSBzYW1lCj4gKyAqIHBsYWNlLCBhbmQgYXQgdGhlIHZl
cnkgbGVhc3QgdG8gZG8gc28gYWZ0ZXIgZXZlcnl0aGluZyBlbHNlIGlzIGRlZmluaXRlbHkKPiAr
ICogaW5pdGlhbGl6ZWQuCgpUT0RPcyBhcmUgb2RkIHRvIGJlIGFkZGluZyB0byBkb2N1bWVudGF0
aW9uLCB0aGlzIGlzIGp1c3Qgbm90IGNvbW1vbgpwbGFjZSBwcmFjdGljZS4gVGhlIE5PVEUgc2hv
dWxkIHN1ZmZpY2UgZm9yIHlvdS4KCiAgTHVpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
