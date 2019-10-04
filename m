Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1DCC6B6
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 01:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434C36EC38;
	Fri,  4 Oct 2019 23:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802626EC38
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 23:52:18 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s1so4609875pgv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 16:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcHN5cpuf6HpMyzE/JY4AhaHdZhoO4XBzATDbA0jQMo=;
 b=f+oGodhbdkLxZLtVeYwrsHH7Q2avXfMQIkRHKyhTbHrQa6CJGYwUO0YK17RpWPv6wv
 B6ionVsi++1Szqv+kAk7LX3DyQcwxmwGRhRjgEf3UBnlVtR7yxYCpbtxKfBGCx3J0NZn
 Lmu0Yr5y22ZCD/RrNzl8n6S3Er6H5qtterhsEdzvk6PaxD2UqMmPlyVSB/kuHk+TB/ik
 1pdsTWHpI83VqgMzgCfHlHmfcutY5Ynj5d7RiZe+vetcxh35KR7yjYMcFDpvdni9fax/
 ToyDTNL4+ZE5TkQBQcMRouiR5esC+LXEIMR4ccPhyAIVU22eE0pOgtAoslLRs9CH2Fgs
 VYag==
X-Gm-Message-State: APjAAAXlUjNZI9tbQKprWLNpe3pCL3MDPqFtSP9uCwXdVnwPSgEeNN2s
 it0sgG+/qJrNDCXdzYITYvfkfdyJHQoAu3lEV5Bo4Q==
X-Google-Smtp-Source: APXvYqzN4VO3fXIRGyWeog6vTVGJnv5zTfx/ZRo8Xl3+1qWVt0nnbDwusWqIpAgUbEoU+x2bu2ZOdOWkMBCWH4UJxNQ=
X-Received: by 2002:a63:ba47:: with SMTP id l7mr17842240pgu.201.1570233137464; 
 Fri, 04 Oct 2019 16:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
 <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
In-Reply-To: <20191004232955.GC12012@mit.edu>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Oct 2019 16:52:06 -0700
Message-ID: <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: "Theodore Y. Ts'o" <tytso@mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wcHN5cpuf6HpMyzE/JY4AhaHdZhoO4XBzATDbA0jQMo=;
 b=p7+dFuiZsziG+/e4IFX0rnW9SeflAmpaFKbEye7G4M1ebE6V8LeScytbqmMKERZtR5
 QjRbiuO/aToN8Or4WR9FYXEhSUYMDU1KJIn32SoOozMI77zF8vOjIzvvJABxh84RZR4C
 LlqSCR6sGDe79xZesgkxmXJeuJitrXFE1GdKXTKr6FLzSDlwKRRjm9ro2En4XOPnrsrV
 xLsx/eNVyd83B5NslZmLyCoW4U/8f74vR2BiTHdskJQYP0m+HIjZr9Gl8VnrLSnaKHoe
 M710bTEav+D5XHd2wKySIJSZ3eNrQ+KbhUxPLsZfRYOkqO1iB3sLZMsPtKh3vaYk8nMz
 tTog==
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

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCA0OjMwIFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDQ6NDc6MDlQTSAtMDYw
MCwgc2h1YWggd3JvdGU6Cj4gPiA+IEhvd2V2ZXIsIGlmIEkgZW5jb3VyYWdlIGFyYml0cmFyeSB0
ZXN0cy9pbXByb3ZlbWVudHMgaW50byBteSBLVW5pdAo+ID4gPiBicmFuY2gsIGl0IGZ1cnRoZXIg
ZGl2ZXJnZXMgYXdheSBmcm9tIHRvcnZhbGRzL21hc3RlciwgYW5kIGlzIG1vcmUKPiA+ID4gbGlr
ZWx5IHRoYXQgdGhlcmUgd2lsbCBiZSBhIG1lcmdlIGNvbmZsaWN0IG9yIGlzc3VlIHRoYXQgaXMg
bm90IHJlbGF0ZWQKPiA+ID4gdG8gdGhlIGNvcmUgS1VuaXQgY2hhbmdlcyB0aGF0IHdpbGwgY2F1
c2UgdGhlIHdob2xlIHRoaW5nIHRvIGJlCj4gPiA+IHJlamVjdGVkIGFnYWluIGluIHY1LjUuCj4g
Pgo+ID4gVGhlIGlkZWEgaXMgdGhhdCB0aGUgbmV3IGRldmVsb3BtZW50IHdpbGwgaGFwcGVuIGJh
c2VkIG9uIGt1bml0IGluCj4gPiBsaW51eC1rc2VsZnRlc3QgbmV4dC4gSXQgd2lsbCB3b3JrIGp1
c3QgZmluZS4gQXMgd2UgYWNjZXB0cyBwYXRjaGVzLAo+ID4gdGhleSB3aWxsIGdvIG9uIHRvcCBv
ZiBrdW5pdCB0aGF0IGlzIGluIGxpbnV4LW5leHQgbm93Lgo+Cj4gSSBkb24ndCBzZWUgaG93IHRo
aXMgd291bGQgd29yay4gIElmIEkgYWRkIHVuaXQgdGVzdHMgdG8gZXh0NCwgdGhleQo+IHdvdWxk
IGJlIGluIGZzL2V4dDQuICBBbmQgdG8gdGhlIGV4dGVudCB0aGF0IEkgbmVlZCB0byBhZGQgdGVz
dCBtb2Nrcwo+IHRvIGFsbG93IHRoZSB1bml0IHRlc3RzIHRvIHdvcmssIHRoZXkgd2lsbCBpbnZv
bHZlIGNoYW5nZXMgdG8gZXhpc3RpbmcKPiBmaWxlcyBpbiBmcy9leHQ0LiAgSSBjYW4ndCBwdXQg
dGhlbSBpbiB0aGUgZXh0NC5naXQgdHJlZSB3aXRob3V0Cj4gcHVsbGluZyBpbiB0aGUga3VuaXQg
Y2hhbmdlcyBpbnRvIHRoZSBleHQ0IGdpdCB0cmVlLiAgQW5kIGlmIHRoZXkgZXh0NAo+IHVuaXQg
dGVzdHMgbGFuZCBpbiB0aGUga3VuaXQgdHJlZSwgaXQgd291bGQgYmUgYSByZWNlaXBlIGZvciBs
YXJnZQo+IG51bWJlcnMgb2YgbWVyZ2UgY29uZmxpY3RzLgoKVGhhdCdzIHdoZXJlIEkgd2FzIG9y
aWdpbmFsbHkgY29taW5nIGZyb20uCgpTbyBoZXJlJ3MgYSBkdW1iIGlkZWE6IHdoYXQgaWYgd2Ug
bWVyZ2VkIEtVbml0IHRocm91Z2ggdGhlIGV4dDQgdHJlZT8KSSBpbWFnaW5lIHRoYXQgY291bGQg
cG90ZW50aWFsbHkgZ2V0IHZlcnkgY29uZnVzaW5nIHdoZW4gd2UgZ28gYmFjayB0bwpzZW5kaW5n
IGNoYW5nZXMgaW4gdGhyb3VnaCB0aGUga3NlbGZ0ZXN0IHRyZWUsIGJ1dCBhdCBsZWFzdCBpdCBt
ZWFucwp0aGF0IGV4dDQgY2FuIHVzZSBpdCBpbiB0aGUgbWVhbnRpbWUsIHdoaWNoIG1lYW5zIHRo
YXQgaXQgYXQgbGVhc3QKZ2V0cyB0byBiZSB1c2VmdWwgdG8gb25lIGdyb3VwIG9mIHBlb3BsZS4g
QWxzbywgc2luY2UgVGVkIHNlZW1zIHByZXR0eQprZWVuIG9uIHVzaW5nIHRoaXMsIEkgaW1hZ2lu
ZSBpdCBpcyBtdWNoIG1vcmUgbGlrZWx5IHRvIHByb2R1Y2UgcmVhbAp3b3JsZCwgaW1tZWRpYXRl
bHkgdXNlZnVsIHRlc3RzIG5vdCB3cml0dGVuIGJ5IG1lIChJJ20gbm90IGJlaW5nIGxhenksCkkg
anVzdCB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZ2V0IG90aGVyIHBlb3BsZSdzIGV4cGVyaWVuY2Vz
IG90aGVyIHRoYW4KbXkgb3duKS4KClRob3VnaHRzPwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
