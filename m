Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773BC69EB9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 00:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA56E03A;
	Mon, 15 Jul 2019 22:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03F56E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 22:11:25 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id g15so8375115pgi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 15:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gHxJwZ65KY+3dlkcg53YlVURzFgCQ53x+CwfDq4SFas=;
 b=jVrCeVAIl6+s+ppBMp4UBxTVhSUTOggfhurmS5BfRUBsOqD7Q+CzVjn8+llE5/wcRZ
 5ZrwkfjZo2ZPnGa8WDjw8JbvBw8WzzKYAIuy8esnJYrlR9dYvTOqXjJDCx7ORCvlLLdm
 DHkRu2lbHcSYjzyPqUFF7UOXygERp21C919nnx+BgzODXyORn7axp106flSRj9c6zyK3
 BhRiUbsKEquzcPKhV+41XWpUdcpSXrJFoJ2ZBJswyVgLTypHxZim64zLphwH0CRU6QJK
 9EMNhwh+vL+ygBuVlCzSAjFO8303wK0WBDIh6Hu053/+t2y1T375TgcgIwXEXThSOP8W
 Fhqw==
X-Gm-Message-State: APjAAAUwhfLWyachg7IP+BynhqsajLb9LiCCLFxypGzZ+AbfpPzBH5AZ
 pr+T5h7bQX8LJXYgiYw9VAGWuUQC0tKOcDzRRDxH2g==
X-Google-Smtp-Source: APXvYqyfZTPL0o0YQnU93ejOaxOs5yytKYAJU2sUr1pH6F5nUAdPz6GwWoelLdf7eJ3sfRDvsdaJ2GYy9d2vy6rHMRQ=
X-Received: by 2002:a63:eb51:: with SMTP id b17mr28473124pgk.384.1563228684913; 
 Mon, 15 Jul 2019 15:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-4-brendanhiggins@google.com>
 <20190715204356.4E3F92145D@mail.kernel.org>
 <CAFd5g47481sRaez=yEJN4_ghiXZbxayk1Y04tAZpuzPLsmnhKg@mail.gmail.com>
 <20190715220407.0030420665@mail.kernel.org>
In-Reply-To: <20190715220407.0030420665@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 15 Jul 2019 15:11:13 -0700
Message-ID: <CAFd5g44bE0F=wq_fOAnxFTtoOyx1dUshhDAkKWr5hX9ipJ4Sxw@mail.gmail.com>
Subject: Re: [PATCH v9 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gHxJwZ65KY+3dlkcg53YlVURzFgCQ53x+CwfDq4SFas=;
 b=MvXH0Y8+JYN6ezlr5+hNCudCnof36BXSG2llvPNekQW2sBy9YI7G1SGXVvdpQ2yLlf
 lKmujf+vhO+TdWj9V4lOLI5HKJRwOFsNc0Z+HQAqQPNMJNZhG/XUbO9b48lY2JAe2PXf
 C8cLituJqcyPcWhWrYkyYHyARQmMnImIukUwVh64GRNchs/vVW+Y3sNTXsnP2KkMCYsm
 tWZq1xFfkUWrMfYRu8uiUj1FZHlJMuMIXnMs4JzAjkIMXT+CDsY4Zk4nzjtcIDvnC44z
 6Zz6d+u8+o54d/ZpHHJzzRw6Uhf6PoufrWply9sIpa7H/+/YZvqwkPQ/RonuXcI57X3X
 E14A==
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
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMzowNCBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTUgMTQ6
MTE6NTApCj4gPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCAxOjQzIFBNIFN0ZXBoZW4gQm95ZCA8
c2JveWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEkgYWxzbyB3b25kZXIgaWYgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGp1c3QgaGF2ZSBhIGJpZyBzbG9wIGJ1ZmZlciBvZiBhCj4gPiA+
IDRLIHBhZ2Ugb3Igc29tZXRoaW5nIHNvIHRoYXQgd2UgYWxtb3N0IG5ldmVyIGhhdmUgdG8gYWxs
b2NhdGUgYW55dGhpbmcKPiA+ID4gd2l0aCBhIHN0cmluZ19zdHJlYW0gYW5kIHdlIGNhbiBqdXN0
IHJlbHkgb24gYSByZWFkZXIgY29uc3VtaW5nIGRhdGEKPiA+ID4gd2hpbGUgd3JpdGVycyBhcmUg
d3JpdGluZy4gVGhhdCBtaWdodCB3b3JrIG91dCBiZXR0ZXIsIGJ1dCBJIGRvbid0IHF1aXRlCj4g
PiA+IHVuZGVyc3RhbmQgdGhlIHVzZSBjYXNlIGZvciB0aGUgc3RyaW5nIHN0cmVhbS4KPiA+Cj4g
PiBUaGF0IG1ha2VzIHNlbnNlLCBidXQgbWlnaHQgdGhhdCBhbHNvIHdhc3RlIG1lbW9yeSBzaW5j
ZSB3ZSB3aWxsCj4gPiBhbG1vc3QgbmV2ZXIgbmVlZCB0aGF0IG11Y2ggbWVtb3J5Pwo+Cj4gV2h5
IGRvIHdlIGNhcmU/IFRoZXNlIGFyZSB1bml0IHRlc3RzLgoKQWdyZWVkLgoKPiBIYXZpbmcgYWxs
b2NhdGlvbnMgaW4gaGVyZSBtYWtlcwo+IHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVkLCB3aGVyZWFz
IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gaGF2ZSBhIHBvaW50ZXIKPiBhbmQgYSBzcGlubG9jayBv
cGVyYXRpbmcgb24gYSBjaHVuayBvZiBtZW1vcnkgdGhhdCBnZXRzIGZsdXNoZWQgb3V0Cj4gcGVy
aW9kaWNhbGx5LgoKSSBhbSBub3Qgc28gc3VyZS4gSSBoYXZlIHRvIGhhdmUgdGhlIGxvZ2ljIHRv
IGFsbG9jYXRlIG1lbW9yeSBpbiBzb21lCmNhc2Ugbm8gbWF0dGVyIHdoYXQgKHdoYXQgaWYgSSBu
ZWVkIG1vcmUgbWVtb3J5IHRoYXQgbXkgcHJlYWxsb2NhdGVkCmNodWNrPykuIEkgdGhpbmsgaXQg
aXMgc2ltcGxlciB0byBhbHdheXMgcmVxdWVzdCBhbiBhbGxvY2F0aW9uIHRoYW4gdG8Kb25seSBz
b21ldGltZXMgcmVxdWVzdCBhbiBhbGxvY2F0aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
