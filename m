Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E39758C4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 22:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FE36E82A;
	Thu, 25 Jul 2019 20:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05FE6E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 20:21:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c3so168457pfa.13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0Cra5QTZMEsQQCWtg/IrgmE1EkzXk2wzdHi6GNLFH4=;
 b=KRq8FSdeXUbuRfOQOyuFkCDEq5p2xLE7eOcQAlptsD1Tk+dgq0fA1ZttPuMpxPpdh8
 H/0zqZbemBiiKDtMD24l5HIAWae7nnt+4/GHYpuF3JC/l9cXp2I651x3pepVyW8F0EGI
 0EeNn31D6mrUBB0MfyHm+R0E25o4PrnJMh5v0mp7V39mIvtBmxBJZmwUJUEYHyEokDk/
 Mre20l2P9kKJCPbXzK+4oi33BDsD4gm7g9XlHWDetIbS2qXLd4iSHzychbSBPaUCCTsf
 sRGCk82jMcbqbVLf9ijqHdRjBfeA96u5g5fzBVUWUcoXvwpXurHhYKeytyiSkj3IXM8A
 L8Sg==
X-Gm-Message-State: APjAAAX7pnmo2j/U9UFZFYHIPdPpkdM3qXlWfHisF8/cDjNvD1B9sS8K
 wKIt7SaNHeLNi6cGCU7WL66CvplV3KA8lpuZSR0I2A==
X-Google-Smtp-Source: APXvYqxzvrolA8VKWhh/PCWTspZ6X1ImHyHFsNde4xNXJqWmdb4kpAbmdfPWVY+GfuBUC1O9mftgHi7aVHIiE4jBL10=
X-Received: by 2002:a63:b919:: with SMTP id z25mr87114130pge.201.1564086083398; 
 Thu, 25 Jul 2019 13:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFd5g47ikJmA0uGoavAFsh+hQvDmgsOi26tyii0612R=rt7iiw@mail.gmail.com>
 <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
 <20190716175021.9CA412173C@mail.kernel.org>
 <CAFd5g453vXeSUCZenCk_CzJ-8a1ym9RaPo0NVF=FujF9ac-5Ag@mail.gmail.com>
 <20190718175024.C3EC421019@mail.kernel.org>
 <CAFd5g46a7C1+R6ZcE_SkqaYqgrH5Rx3M=X7orFyaMgFLDbeYYA@mail.gmail.com>
 <20190719000834.GA3228@google.com> <20190722200347.261D3218C9@mail.kernel.org>
 <CAFd5g45hdCxEavSxirr0un_uLzo5Z-J4gHRA06qjzcQrTzmjVg@mail.gmail.com>
 <20190722235411.06C1320840@mail.kernel.org>
 <20190724073125.xyzfywctrcvg6fmh@pathway.suse.cz>
In-Reply-To: <20190724073125.xyzfywctrcvg6fmh@pathway.suse.cz>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 25 Jul 2019 13:21:12 -0700
Message-ID: <CAFd5g47v3Mr4GEGOjqyYy9Jwwm+ow7ypbu9j88rxEN06QCzdxQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
To: Petr Mladek <pmladek@suse.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t0Cra5QTZMEsQQCWtg/IrgmE1EkzXk2wzdHi6GNLFH4=;
 b=icwWCIiUgBV1wHTICVJ8PDBYNM56j1SL56zOuqzadtL/FTJftG29M/5i37umQn5pat
 98vgN9o4wCCUl6zlUntg1M2/HAqBcuf46VrRvHnBderCK2JzVC1N/QGeaiGfSXK9s4n5
 D6RwN5DHnLXKOq4Ny6b8fOnc2KVD7SZxUUSdcyUfbAIVnumy+pkl0n1aZfxPSnWyIL72
 hfdMtqkGubCbZVDRysKpCuE9QGl7AC7BSboaOfM49zJPp3eOwApBz0fXZ3/p4ovL/zBt
 OQN9pJSLbaG8HsrL0EiinQXd3Ip1iSW8gF7p8zWj9INScAI2FFyHb72jeSzAyZtgcUhN
 wuPw==
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Kevin Hilman <khilman@baylibre.com>, David Rientjes <rientjes@google.com>,
 Timothy Bird <Tim.Bird@sony.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTI6MzEgQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uIDIwMTktMDctMjIgMTY6NTQ6MTAsIFN0ZXBoZW4gQm95
ZCB3cm90ZToKPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA3LTIyIDE1OjMwOjQ5
KQo+ID4gPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxOjAzIFBNIFN0ZXBoZW4gQm95ZCA8c2Jv
eWRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFdoYXQncyB0aGUg
Y2FsbGluZyBjb250ZXh0IG9mIHRoZSBhc3NlcnRpb25zIGFuZCBleHBlY3RhdGlvbnM/IEkgc3Rp
bGwKPiA+ID4gPiBkb24ndCBsaWtlIHRoZSBmYWN0IHRoYXQgc3RyaW5nIHN0cmVhbSBuZWVkcyB0
byBhbGxvY2F0ZSBidWZmZXJzIGFuZAo+ID4gPiA+IHRocm93IHRoZW0gaW50byBhIGxpc3Qgc29t
ZXdoZXJlIGJlY2F1c2UgdGhlIGNhbGxpbmcgY29udGV4dCBtYXR0ZXJzCj4gPiA+ID4gdGhlcmUu
Cj4gPiA+Cj4gPiA+IFRoZSBjYWxsaW5nIGNvbnRleHQgaXMgdGhlIHNhbWUgYXMgYmVmb3JlLCB3
aGljaCBpcyBhbnl3aGVyZS4KPiA+Cj4gPiBPay4gVGhhdCdzIGNvbmNlcm5pbmcgdGhlbi4KPiA+
Cj4gPiA+Cj4gPiA+ID4gSSdkIHByZWZlciB3ZSBqdXN0IHdyb3RlIGRpcmVjdGx5IHRvIHRoZSBj
b25zb2xlL2xvZyB2aWEgcHJpbnRrCj4gPiA+ID4gaW5zdGVhZC4gVGhhdCB3YXkgdGhpbmdzIGFy
ZSBzaW1wbGUgYmVjYXVzZSB3ZSB1c2UgdGhlIGV4aXN0aW5nCj4gPiA+ID4gYnVmZmVyaW5nIHBh
dGggb2YgcHJpbnRrLCBidXQgbWF5YmUgdGhlcmUncyBzb21lIGJlbmVmaXQgdG8gdGhlIHN0cmlu
Zwo+ID4gPiA+IHN0cmVhbSB0aGF0IEkgZG9uJ3Qgc2VlPyBSaWdodCBub3cgaXQgbG9va3MgbGlr
ZSBpdCBidWlsZHMgYSBzdHJpbmcgYW5kCj4gPiA+ID4gdGhlbiBkdW1wcyBpdCB0byBwcmludGsg
c28gSSdtIHNvcnQgb2YgbG9zdCB3aGF0IHRoZSBiZW5lZml0IGlzIG92ZXIKPiA+ID4gPiBqdXN0
IHdyaXRpbmcgZGlyZWN0bHkgd2l0aCBwcmludGsuCj4gPiA+Cj4gPiA+IEl0J3MganVzdCBidWZm
ZXJpbmcgaXQgc28gdGhlIHdob2xlIHN0cmluZyBnZXRzIHByaW50ZWQgdW5pbnRlcnJ1cHRlZC4K
PiA+ID4gSWYgd2Ugd2VyZSB0byBwcmludCBvdXQgcGllY2VtZWFsIHRvIHByaW50aywgY291bGRu
J3Qgd2UgaGF2ZSBhbm90aGVyCj4gPiA+IGNhbGwgdG8gcHJpbnRrIGNvbWUgaW4gY2F1c2luZyBp
dCB0byBnYXJibGUgdGhlIEtVbml0IG1lc3NhZ2Ugd2UgYXJlCj4gPiA+IGluIHRoZSBtaWRkbGUg
b2YgcHJpbnRpbmc/Cj4gPgo+ID4gWWVzLCBwcmludGluZyBwaWVjZW1lYWwgYnkgY2FsbGluZyBw
cmludGsgbWFueSB0aW1lcyBjb3VsZCBsZWFkIHRvCj4gPiBpbnRlcmxlYXZpbmcgb2YgbWVzc2Fn
ZXMgaWYgc29tZXRoaW5nIGVsc2UgY29tZXMgaW4gc3VjaCBhcyBhbiBpbnRlcnJ1cHQKPiA+IHBy
aW50aW5nIHNvbWV0aGluZy4gUHJpbnRrIGhhcyBzb21lIHN1cHBvcnQgdG8gaG9sZCAicmVjb3Jk
cyIgYnV0IEknbQo+ID4gbm90IHN1cmUgaG93IHRoYXQgd291bGQgd29yayBoZXJlIGJlY2F1c2Ug
S0VSTl9DT05UIHRhbGtzIGFib3V0IG9ubHkKPiA+IGJlaW5nIHVzZWQgZWFybHkgb24gaW4gYm9v
dCBjb2RlLiBJIGhhdmVuJ3QgbG9va2VkIGF0IHByaW50ayBpbiBkZXRhaWwKPiA+IHRob3VnaCBz
byBtYXliZSBJJ20gYWxsIHdyb25nIGFuZCBLRVJOX0NPTlQganVzdCB3b3Jrcz8KPgo+IEtFUk5f
Q09OVCBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCB0aGUgbWVzc2FnZSB3aWxsIGdldCBwcmludGVk
Cj4gdG9nZXRoZXIuIFRoZSBwaWVjZXMgZ2V0IGludGVybGVhdmVkIHdpdGggbWVzc2FnZXMgcHJp
bnRlZCBpbgo+IHBhcmFsbGVsLgo+Cj4gTm90ZSB0aGF0IEtFUk5fQ09OVCB3YXMgb3JpZ2luYWxs
eSByZWFsbHkgbWVhbnQgdG8gYmUgdXNlZCBvbmx5IGR1cmluZwo+IGJvb3QuIEl0IHdhcyBsYXRl
ciB1c2VkIG1vcmUgd2lkZWx5IGFuZCBlbmRlZCBpbiB0aGUgYmVzdCBlZmZvcnQgY2F0ZWdvcnku
Cj4KPiBUaGVyZSB3ZXJlIHNldmVyYWwgYXR0ZW1wdHMgdG8gbWFrZSBpdCBtb3JlIHJlbGlhYmxl
LiBCdXQgaXQgd2FzCj4gYWx3YXlzIGVpdGhlciB0b28gY29tcGxpY2F0ZWQgb3IgZXJyb3IgcHJv
bmUgb3IgYm90aC4KPgo+IFlvdSBuZWVkIHRvIHVzZSB5b3VyIG93biBidWZmZXJpbmcgaWYgeW91
IHJlbHkgd2FudCBwZXJmZWN0IG91dHB1dC4KPiBUaGUgcXVlc3Rpb24gaXMgaWYgaXQgaXMgcmVh
bGx5IHdvcnRoIHRoZSBjb21wbGV4aXR5LiBBbHNvIG5vdGUgdGhhdAo+IGFueSBidWZmZXJpbmcg
cmVkdWNlcyB0aGUgY2hhbmNlIHRoYXQgdGhlIG1lc3NhZ2VzIHdpbGwgcmVhY2gKPiB0aGUgY29u
c29sZS4KClNlZW1zIGxpa2UgdGhhdCBzZXR0bGVzIGl0IHRoZW4uIFRoYW5rcyEKCj4gQlRXOiBU
aGVyZSBpcyBhIHdvcmsgaW4gcHJvZ3Jlc3Mgb24gYSBsb2NrbGVzcyBwcmludGsgcmluZyBidWZm
ZXIuCj4gSXQgd2lsbCBtYWtlIHByaW50aygpIG1vcmUgc2VjdXJlIHJlZ2FyZGluZyBkZWFkbG9j
a3MuIEJ1dCBpdCBtaWdodAo+IG1ha2UgdHJhbnNwYXJlbnQgaGFuZGxpbmcgb2YgY29udGludW91
cyBsaW5lcyBldmVuIG1vcmUgdHJpY2t5Lgo+Cj4gSSBndWVzcyB0aGF0IGxvY2FsIGJ1ZmZlcmlu
ZywgYmVmb3JlIGNhbGxpbmcgcHJpbnRrKCksIHdpbGwgYmUKPiBldmVuIG1vcmUgaW1wb3J0YW50
IHRoZW4uIFdlbGwsIGl0IG1pZ2h0IHJlYWxseSBmb3JjZSB1cyB0byBjcmVhdGUKPiBhbiBBUEkg
Zm9yIGl0LgoKQ29vbCEgQ2FuIHlvdSBDQyBtZSBvbiB0aGF0IGRpc2N1c3Npb24/Cgo+ID4gQ2Fu
IHByaW50ayBiZSBjYWxsZWQgb25jZSB3aXRoIHdoYXRldmVyIGlzIGluIHRoZSBzdHJ1Y3Q/IE90
aGVyd2lzZSBpZgo+ID4gdGhpcyBpcyBhYm91dCBtYWtpbmcgcHJpbnRrIGludG8gYSBzdHJ1Y3R1
cmVkIGxvZyB0aGVuIG1heWJlIHByaW50awo+ID4gaXNuJ3QgdGhlIHByb3BlciBzb2x1dGlvbiBh
bnl3YXkuIE1heWJlIGEgZGV2IGludGVyZmFjZSBzaG91bGQgYmUgdXNlZAo+ID4gaW5zdGVhZCB0
aGF0IGNhbiBoYW5kbGUgc3RhcnRpbmcgYW5kIHN0b3BwaW5nIHRlc3RzICh2aWEgaW9jdGwpIGlu
Cj4gPiBhZGRpdGlvbiB0byByZWFkaW5nIHRlc3QgcmVzdWx0cywgcmVjb3JkcywgZXRjLiB3aXRo
IHJlYWQoKSBhbmQgYQo+ID4gY2xlYXJpbmcgb2YgdGhlIHJlY29yZHMuIFRoZW4gdGhlIHNlcWZp
bGUgQVBJIHdvcmtzIG5hdHVyYWxseS4gQWxsIG9mCj4gPiB0aGlzIGlzIGEgYml0IHByZW1hdHVy
ZSwgYnV0IGl0IGxvb2tzIGxpa2UgeW91J3JlIGdvaW5nIGRvd24gdGhlIHBhdGggb2YKPiA+IG1h
a2luZyBzb21ldGhpbmcgYWtpbiB0byBmdHJhY2UgdGhhdCBzdG9yZXMgYmluYXJ5IGZvcm1hdHRl
ZAo+ID4gYXNzZXJ0aW9uL2V4cGVjdGF0aW9uIHJlY29yZHMgaW4gYSBsb2NrbGVzcyByaW5nIGJ1
ZmZlciB0aGF0IHRoZW4KPiA+IGZvcm1hdHMgdGhvc2UgcmVjb3JkcyB3aGVuIHRoZSB1c2VyIGFz
a3MgZm9yIHRoZW0uCj4KPiBJTUhPLCBmdHJhY2UgcG9zdHBvbmVzIHRoZSB0ZXh0IGZvcm1hdHRp
bmcgcHJpbWFyeSBiZWNhdXNlIGl0IGRvZXMgbm90Cj4gbm90IHdhbnQgdG8gc2xvdyBkb3duIHRo
ZSB0cmFjZWQgY29kZSBtb3JlIHRoYW4gbmVjZXNzYXJ5LiBJdCBpcyB5ZXQKPiBhbm90aGVyIGxh
eWVyIGFuZCB0aGVyZSBzaG91bGQgYmUgc29tZSBzdHJvbmcgcmVhc29uIGZvciBpdC4KCk5vdGVk
LiBZZWFoLCBJIHdvdWxkIHByZWZlciBhdm9pZGluZyBwcmludGluZyBvdXQgdGhlIGluZm8gYXQg
YSBzZXBhcmF0ZSB0aW1lLgoKPiA+IEkgY2FuIGltYWdpbmUgc29tZW9uZSB3YW50aW5nIHRvIHdy
aXRlIHVuaXQgdGVzdHMgdGhhdCBjaGVjayBjb25kaXRpb25zCj4gPiBmcm9tIGEgc2ltdWxhdGVk
IGhhcmRpcnEgY29udGV4dCB2aWEgaXJxIHdvcmtzIChhIGRyaXZlciBtb2NrCj4gPiBmcmFtZXdv
cms/KSwgc28gdGhpcyBkb2Vzbid0IHNlZW0gZmFyIG9mZi4KPgo+IE5vdGUgdGhhdCBzdHJvcmlu
ZyB0aGUgbWVzc2FnZXMgaW50byB0aGUgcHJpbnRrIGxvZyBpcyBiYXNpY2FsbHkgc2FmZSBpbiBh
bnkKPiBjb250ZXh0LiBJdCB1c2VzIHRlbXBvcmFyeSBwZXItQ1BVIGJ1ZmZlcnMgZm9yIHJlY3Vy
c2l2ZSBtZXNzYWdlcyBhbmQKPiBpbiBOTUkuIFRoZSBvbmx5IHByb2JsZW0gaXMgcGFuaWMoKSB3
aGVuIHNvbWUgQ1BVIGdldHMgc3R1Y2sgd2l0aCB0aGUKPiBsb2NrIHRha2VuLiBUaGlzIHdpbGwg
Z2V0IHNvbHZlZCBieSB0aGUgbG9ja2xlc3MgcmluZ2J1ZmZlci4gQWxzbwo+IHRoZSB0ZW1wb3Jh
cnkgYnVmZmVycyB3aWxsIG5vdCBiZSBuZWNlc3NhcnkgYW55IGxvbmdlci4KClN1cmUsIEkgdGhp
bmsgU3RlcGhlbidzIGNvbmNlcm4gaXMgYWxsIHRoZSBzdXBwb3J0aW5nIGNvZGUgdGhhdCBpcwpp
bnZvbHZlZC4gTm90IHByaW50ayBzcGVjaWZpY2FsbHkuIEl0IGp1c3QgbWVhbnMgYSBsb3QgbW9y
ZSBvZiBLVW5pdApoYXMgdG8gYmUgSVJRIHNhZmUuCgo+IE11Y2ggYmlnZ2VyIHByb2JsZW1zIGFy
ZSB3aXRoIGNvbnNvbGVzLiBUaGVyZSBhcmUgbWFueSBvZiB0aGVtLiBJdAo+IG1lYW5zIGEgbG90
IG9mIGNvZGUgYW5kIG1vcmUgbG9ja3MgaW52b2x2ZWQsIGluY2x1ZGluZyBzY2hlZHVsZXIKPiBs
b2Nrcy4gTm90ZSB0aGF0IGNvbnNvbGUgbG9jayBpcyBhIHNlbWFwaG9yZS4KClRoYXQgc2hvdWxk
bid0IGFmZmVjdCB1cyB0aG91Z2gsIHJpZ2h0PyBBcyBsb25nIGFzIHdlIGNvbnRpbnVlIHRvIHVz
ZQp0aGUgcHJpbnRrIGludGVyZmFjZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
