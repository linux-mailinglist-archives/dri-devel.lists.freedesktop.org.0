Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBBACDD1C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 10:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9866E4B7;
	Mon,  7 Oct 2019 08:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3706E4B7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 08:20:46 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w8so6499428plq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 01:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ote0/C1JReGNWp+FkearLP+n5iZPIKVYgqsUmtRTjFs=;
 b=Fs/Y58zqCdP0TGChhdDFByAKUISK7aHZVfERc4CflDZArQCPBJi3I1J9ipYv8gZb6n
 SPwoyT41AnmQm/5Gali0JItaRjThIUvDK9swejMl3h2t3BynJkM7eMnP787Gzq0VBSrs
 cuuvWFhv0W+c/vchK0zNqDKq7FB8OuO8BYOppjOAwrYiW2hkYu51mQIyAQvreZ016wFU
 uQshkFI+dpM9Ezw+7OpNF/TYCI/5X567yHqeNi5Y9SCrkiUlpNUFAWfbBpIpvdolfoof
 5RC57HOSVD2jCen7ZbfnJDEP7YQgUZqClCgjA8a9CnIf7azLGW7HU1nArwbfixXhn+x3
 xNMA==
X-Gm-Message-State: APjAAAVEVaGKzy/4KWv16b1cWMjzYlcoDg+2JLDBpxqpJytrrW8YT6qN
 Fb7IUmLWX8BApwUoVKEUYOfuYp33tTM1WWYq1taNHw==
X-Google-Smtp-Source: APXvYqx8Yk5sgQkWXnFQm4/CGRSWyRMpxzmUgLAHY9vWCZW1JOEviLWEyRGwfm5yzonhZdNlXfXkmD5OjjAPHS+whBM=
X-Received: by 2002:a17:902:8f88:: with SMTP id
 z8mr28990175plo.232.1570436445413; 
 Mon, 07 Oct 2019 01:20:45 -0700 (PDT)
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
In-Reply-To: <20191006165436.GA29585@mit.edu>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 7 Oct 2019 01:20:34 -0700
Message-ID: <CAFd5g47XogYaO24fHnRR9wyki_r4oQg0qSWo9kOgnXpyTuJAWw@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: "Theodore Y. Ts'o" <tytso@mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ote0/C1JReGNWp+FkearLP+n5iZPIKVYgqsUmtRTjFs=;
 b=ucHtKJn0UJ/TfFDX+4FXj4mOFaUq1DsFLZGjyuBNxfgLXveZezTTcBAH3AoBOIOBEU
 9Q68fJQlIZMn6KrlKTDzJpjNG8TqWULiaH2rlCAcf0lZ+nNuMEV+zgZrBiY1Dw9yJ+u+
 CnikzZLmoBcE6hsbUbbZy61X/2MSIy8UU9KMfv7H8WYsp7Inq5RegXOks3+X+J8jqMPm
 hKQmH60pRG9T9rirx2yP0hvm85sKqjotn7r05OGpiU9g/AO8TGbcjQmonzZgKOXmk0sp
 Q/OF6iGuie1Fhf7sgCtf3kcTPs1M9fwLUXXUhWuFlWamP+XzN2k7qw0YD2qXx5TZ+Lra
 z5Tg==
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
 Logan Gunthorpe <logang@deltatee.com>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgNiwgMjAxOSBhdCA5OjU1IEFNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDY6MTg6MDRQTSAtMDcw
MCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiBMZXQncyB0YWxrIGFib3V0IGN1cnJlbnQg
c3RhdGUuIFJpZ2h0IG5vdyBrdW5pdCBpcyBpbiBsaW51eC1uZXh0IGFuZAo+ID4gPiB3ZSB3YW50
IHRvIGFkZCBhIGZldyBtb3JlIHRlc3RzLiBXZSB3aWxsIGhhdmUgdG8gY29vcmRpbmF0ZSB0aGUg
ZWZmb3J0Lgo+ID4gPiBPbmNlIGt1bml0IGdldCBpbnRvIG1haW5saW5lLCB0aGVuIHRoZSBuZWVk
IGZvciB0aGlzIGNvb3JkaW5hdGlvbiBnb2VzCj4gPiA+IGRvd24uCj4gPgo+ID4gU3VyZSwgSSB3
YXMganVzdCB0aGlua2luZyB0aGF0IGdldHRpbmcgb3RoZXIgcGVvcGxlIHRvIHdyaXRlIHRoZSB0
ZXN0cwo+ID4gd291bGQgYmUgYmV0dGVyLiBTaW5jZSBub3Qgb25seSBpcyBpdCB0aGVuIHVzZWZ1
bCB0byBzb21lb25lIGVsc2UsIGl0Cj4gPiBwcm92aWRlcyB0aGUgYmVzdCBwb3NzaWJsZSBleGVy
Y2lzZSBvZiBLVW5pdC4KPgo+IFdlbGwsIG9uZSB0aGluZyB3ZSAqY2FuKiBkbyBpcyBpZiAoYSkg
aWYgd2UgY2FuIGNyZWF0ZSBhIGtzZWxmdGVzdAo+IGJyYW5jaCB3aGljaCB3ZSBrbm93IGlzIHN0
YWJsZSBhbmQgd29uJ3QgY2hhbmdlLCBhbmQgKGIpIHdlIGNhbiBnZXQKPiBhc3N1cmFuY2VzIHRo
YXQgTGludXMgKndpbGwqIGFjY2VwdCB0aGF0IGJyYW5jaCBkdXJpbmcgdGhlIG5leHQgbWVyZ2UK
PiB3aW5kb3csIHRob3NlIHN1YnN5c3RlbXMgd2hpY2ggd2FudCB0byB1c2Uga3NlbGYgdGVzdCBj
YW4gc2ltcGx5IHB1bGwKPiBpdCBpbnRvIHRoZWlyIHRyZWUuCgpZZWFoLCBJIGNhbid0IHRoaW5r
IG9mIGFueSByZWFzb24gdGhhdCB5b3UgaGF2ZW4ndCBvdXRsaW5lZCBhbHJlYWR5CndoeSB0aGF0
IG1pZ2h0IG5vdCB3b3JrLCBidXQgdGhhdCBzZWVtcyBraW5kIG9mIGxpa2UgY2lyY3VtdmVudGlu
ZwpMaW51cy4KCj4gV2UndmUgZG9uZSB0aGlzIGJlZm9yZSBpbiB0aGUgZmlsZSBzeXN0ZW0gd29y
bGQsIHdoZW4gdGhlcmUgaGFzIGJlZW4KPiBzb21lIGNvbW1vbiBzZXQgb2YgY2hhbmdlcyBuZWVk
ZWQgdG8gaW1wcm92ZSwgc2F5LCBEaXJlY3QgSS9PLCB3aGVyZQo+IHRoZSBjaGFuZ2VzIGFyZSBw
dXQgaW50byBhIHN0YW5kYWxvbmUgYnJhbmNoLCBzYXksIGluIHRoZSB4ZnMgdHJlZSwKPiBhbmQg
dGhvc2UgZmlsZSBzeXN0ZW1zIHdoaWNoIG5lZWQgaXQgYXMgYSBidWlsZGluZyBibG9jayBjYW4g
cHVsbCBpdAo+IGludG8gdGhlaXIgdHJlZSwgYW5kIHRoZW4gYWRkIHRoZSBjaGFuZ2VzIG5lZWRl
ZCB0byB1c2UgdGhvc2UgY2hhbmdlcwo+IGludG8gdGhlaXIgZmlsZSBzeXN0ZW0gZ2l0IHRyZWUu
ICBUaGVzZSBjaGFuZ2VzIGFyZSBnZW5lcmFsbHkgbm90Cj4gdGVycmlibHkgY29udHJvdmVyc2lh
bCwgYW5kIHdlJ3ZlIG5vdCBoYWQgdG8gd29ycnkgYWJvdXQgcGVvcGxlIHdhbnQKPiB0byBiaWtl
c2hlZCB0aGUgY2hhbmdlcy4KPgo+IFRoZXJlIGlzIGEgcmlzayB3aXRoIGRvaW5nIHRoaXMgb2Yg
Y291cnNlLCB3aGljaCBpcyB0aGF0IGlmIHRoZSBicmFuY2gKPiAqaXMqIGNvbnRyb3ZlcnNpYWws
IG9yIGdldHMgYmlrZS1zaGVkZGVkIGZvciBzb21lIHJlYXNvbiwgdGhlbiBMaW51cwo+IGdldHMg
dXBzZXQgYW5kIGFueSBicmFuY2hlcyB3aGljaCBkZXBlbmRlZCBvbiBzYWlkIGJyYW5jaCB3aWxs
IGdldAo+IHJlamVjdGVkIGF0IHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4gIFdoaWNoIGlzIHRoZSBy
ZXF1aXJlbWVudCBmb3IgKGEpCj4gYW5kIChiKSBhYm92ZS4gIFByZXN1bWFibHksIHRoZSBmYWN0
IHRoYXQgcGVvcGxlIHdlcmUgdW53aWxsaW5nIHRvIGxldAo+IEt1bml0IGxhbmQgZHVyaW5nIHRo
aXMgbWVyZ2Ugd2luZG93IG1pZ2h0IHdpbGwgKmJlY2F1c2UqIHdlIHRoaW5rIG1vcmUKPiBjaGFu
Z2VzIG1pZ2h0IGJlIHBlbmRpbmc/CgpNeSB1bmRlcnN0YW5kaW5nLCBiYXNlZCBvbiB3aGF0IEkg
aGF2ZSBiZWVuIHRvbGQsIGlzIHRoYXQgd2Ugd2VyZQpzaW1wbHkgdW5sdWNreSB3aXRoIHRoZSB0
aW1pbmcgd2hlbiBMaW51cyBwdWxsZWQgdGhlIGJyYW5jaCBpbiB0aGUKZmlyc3Qgd2VlayBvZiB0
aGUgNS40IG1lcmdlIHdpbmRvdyAoRnJpZGF5KSwgc3VjaCB0aGF0IG9uY2UgSSBmaXhlZAp0aGUg
ZGlyZWN0b3J5IG5hbWluZyBpc3N1ZSwgdGhlIHVwZGF0ZWQgY2hhbmdlcyBkaWRuJ3Qgc3BlbmQg
ZW5vdWdoCnRpbWUgaW4gbGludXgtbmV4dC4gQW5kIG5vdyB3aXRoIHRoaXMgaXNzdWUgZml4ZWQg
YW5kIEtVbml0IGJhY2sgaW4KbGludXgtbmV4dCwgaWYgbm90aGluZyBpbnRlcmVzdGluZyBoYXBw
ZW5zIGJldHdlZW4gbm93IGFuZCA1LjUsIGl0CndpbGwgYmUgYWNjZXB0ZWQgaW4gdGhlIDUuNSBt
ZXJnZSB3aW5kb3cuIEkgZG8gbm90IHRoaW5rIHRoYXQgYW55b25lCmlzIGV4cGVjdGluZyBhbnlt
b3JlIGNoYW5nZXMgYmVmb3JlIG1lcmdpbmcuCgpTaHVhaCwgTGludXMsIGlzIG15IHVuZGVyc3Rh
bmRpbmcgY29ycmVjdD8KCj4gVGhlIG90aGVyIHRoaW5nIEkgc3VwcG9zZSBJIGNhbiBkbyBpcyB0
byBsZXQgdGhlIGV4dDQga3VuaXQgdGVzdHMgbGFuZAo+IGluIGV4dDQgdHJlZSwgYnV0IHdpdGgg
dGhlIG5lY2Vzc2FyeSAjaWZkZWYncyBhcm91bmQgdGhpbmdzIGxpa2UKPiAiI2luY2x1ZGUgPGt1
bml0L3Rlc3QuaD4iIHNvIHRoYXQgdGhlIGJ1aWxkIHdvbid0IGJsb3cgdXAgdy9vIGt1bml0Cj4g
Y2hhbmdlcyBiZWluZyBpbiB0aGUgdHJlZSB0aGF0IEknbSBidWlsZGluZy4gIEl0IG1lYW5zIEkg
d29uJ3QgYmUgYWJsZQo+IHRvIHJ1biB0aGUgdGVzdHMgd2l0aG91dCBjcmVhdGluZyBhIHRlc3Qg
aW50ZWdyYXRpb24gYnJhbmNoIGFuZAo+IG1lcmdpbmcgaW4ga3VuaXQgYnkgaGFuZCwgd2hpY2gg
d2lsbCBzdXBlci1hbm5veWluZywgb2YgY291cnNlLiAgQW5kCj4gaWYgc29tZSBvZiB0aGUgYmlr
ZS1zaGVkZGluZyBpcyBpbiBLdW5pdCdzIGludGVyZmFjZXMsIHRoZW4gdGhhdAo+IGJlY29tZXMg
cHJvYmxlbWF0aWMgYXMgd2VsbCwgc2luY2UgYW55IHRlc3RzIHRoYXQgYXJlIGluIGV4dDQuZ2l0
IHRyZWUKPiBtaWdodCBjaGFuZ2UgaWYgcGVvcGxlIHdhbnQgdG8gcmVuYW1lIEt1bml0J3MgcHVi
bGljYWxseSBleHBvcnRlZAo+IGZ1bmN0aW9ucyAoZm9yIGV4YW1wbGUpLgoKWWVhaCwgdGhhdCBz
ZWVtcyBldmVuIHdvcnNlLiBJJ20gc29ycnkgdG8gaGF2ZSBjYXVzZWQgdGhpcyBmcnVzdHJhdGlv
bi4KCj4gPiBIZXkgVGVkLCBkbyB5b3Uga25vdyBpZiB0aGF0IGV4dDQgdGltZXN0YW1wIHRlc3Qg
Y2FuIGdvIGluIHRocm91Z2gKPiA+IGxpbnV4LWtzZWxmdGVzdD8gSXQgc2VlbWVkIGZhaXJseSBz
ZWxmLWNvbnRhaW5lZC4gT3IgaXMgdGhhdCB3aGF0IHlvdQo+ID4gd2VyZSBzYXlpbmcgd291bGRu
J3Qgd29yayBmb3IgeW91Pwo+Cj4gV2VsbCwgSSB3YXMgaG9waW5nIHRoYXQgd2UgbWlnaHQgc3Rh
cnQgY3JlYXRpbmcgbW9yZSB0ZXN0cyBiZXlvbmQganVzdAo+IHRoZSBleHQ0IHRpbWVzdGFtcCB0
ZXN0cy4uLi4KCk9rYXksIHRoYXQncyB3aGF0IEkgdGhvdWdodCAoYW5kIHdoYXQgSSBob3BlZCkg
eW91IHdlcmUgc2F5aW5nIDotKQoKSSBob3BlIHdlIGNhbiBmaWd1cmUgb3V0IHNvbWV0aGluZyB0
aGF0IHdpbGwgd29yayBmb3IgeW91LiBPcgpvdGhlcndpc2UgdGhhdCB5b3Ugd29uJ3QgbWluZCB3
YWl0aW5nIHVudGlsIDUuNS4KClNvcnJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
