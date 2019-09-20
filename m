Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF8BA247
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D9E6E265;
	Sun, 22 Sep 2019 12:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3756E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 07:05:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id w10so4252025plq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 00:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eg0Go6Vco6zmrMokIuCHT90eNcEj+1gkgwUozbRoOU=;
 b=rhwiZXy+El4xZHDgauSKMT6EIhlwSJxbOKnA5OWcVjXsSj+Uap71ARQY/Wrh1Nu+Ot
 BUhNpKZCkauHPQFOmAdPpKmyXdXXHEn8OQIjq4HX9TM2+BjmKORbXMJv6bM2ba6Vllwf
 Badebbm+qFijoFiWjFn7Hc+Qfp4oJqADdAFzEv6I3wLMNiAU1bLU/P4tb+xt5M5kukE2
 PiG98vWhE35KhrMhVGVaqzwX11rb70BxaBXEPEHcoLO5BqGy2OW0QnsD/qdOeVSBRyjx
 C564cTj2Tm6fxYJVeGKqDSO5ZMRGzBJ58Yn5NISJ9M+chhdEx8Nb3zgaZiIgP5SBF3B+
 QPrg==
X-Gm-Message-State: APjAAAXPX+HI+F4BnL1YliFaQ6xjtzOEgyrpiNjAk+7qxfairJLXaB3d
 JUsH8lWen0x/xGALx7N2bkdg6gBzBz/EYNZ5e69hmEPOjiJViA==
X-Google-Smtp-Source: APXvYqxVNfOs4Ho/5kXpPZVj8oP5ezLhr8UaD2UCudmwUKwPDFfSFY4+sFjwQIeK+urY5OGR284WgAH5zN0eWfy9OQU=
X-Received: by 2002:a17:902:169:: with SMTP id
 96mr18912291plb.297.1569023545999; 
 Fri, 20 Sep 2019 16:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
 <20190920231923.141900-7-brendanhiggins@google.com>
 <20190920233600.48BBA20644@mail.kernel.org>
 <CAFd5g46pndA_gOD9i8M5e5fb8x4mSL9mcgMDujN7XufeFs8bmQ@mail.gmail.com>
In-Reply-To: <CAFd5g46pndA_gOD9i8M5e5fb8x4mSL9mcgMDujN7XufeFs8bmQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 20 Sep 2019 16:52:14 -0700
Message-ID: <CAFd5g44E9Z=wRLarzcirAMudQ5=_3d4gnYfAwM9T2XB+sr+_qg@mail.gmail.com>
Subject: Re: [PATCH v16 06/19] lib: enable building KUnit in lib/
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8eg0Go6Vco6zmrMokIuCHT90eNcEj+1gkgwUozbRoOU=;
 b=C3ZFMMtvPf81TgLhiSeEgf2YDVeBRSaHW0FNEf+k4vFeia1DmItLwfEBHoOIfODtlF
 gEyN20SdH4KLHWwmhavoas54tR7qUqGUNdwwesdSM+wK3SyllrG5IxRh96WXtnnrfY7d
 pWKppGT1A1o2nr1VJ5fMakqYDf8QR5Hd9B9Tr6251H/ZqxARqyg4FG/IYVzwg6lZHgw9
 KjiL/8lm/frPH5jhCZqRRWZnbSsN2mWbWgq5azfITpuYNj1mNqmc8FRarPSRhSul8KEc
 RmmD1CROxNKOEtIbX+4Fprl/YK9aZC0HXh6DiK9VVU/3W0qEmA2PmqxFFb9ET+vFYLUq
 AVCw==
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgNDo0NCBQTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgNDoz
NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFF1b3Rp
bmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA5LTIwIDE2OjE5OjEwKQo+ID4gPiBLVW5pdCBpcyBh
IG5ldyB1bml0IHRlc3RpbmcgZnJhbWV3b3JrIGZvciB0aGUga2VybmVsIGFuZCB3aGVuIHVzZWQg
aXMKPiA+ID4gYnVpbHQgaW50byB0aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0
IHRvIHRoZSBsaWIgS2NvbmZpZyBhbmQKPiA+ID4gTWFrZWZpbGUgdG8gYWxsb3cgaXQgdG8gYmUg
YWN0dWFsbHkgYnVpbHQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+ID4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1
bmxhcEBpbmZyYWRlYWQub3JnPgo+ID4gPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KPiA+ID4gQ2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJv
QHNvY2lvbmV4dC5jb20+Cj4gPiA+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9y
Zz4KPiA+ID4gLS0tCj4gPiA+ICBsaWIvS2NvbmZpZy5kZWJ1ZyB8IDIgKysKPiA+ID4gIGxpYi9N
YWtlZmlsZSAgICAgIHwgMiArKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25m
aWcuZGVidWcKPiA+ID4gaW5kZXggNTk2MGUyOTgwYThhLi41ODcwZmJlMTFlOWIgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2xpYi9LY29uZmlnLmRlYnVnCj4gPiA+ICsrKyBiL2xpYi9LY29uZmlnLmRlYnVn
Cj4gPiA+IEBAIC0yMTQ0LDQgKzIxNDQsNiBAQCBjb25maWcgSU9fU1RSSUNUX0RFVk1FTQo+ID4g
Pgo+ID4gPiAgc291cmNlICJhcmNoLyQoU1JDQVJDSCkvS2NvbmZpZy5kZWJ1ZyIKPiA+ID4KPiA+
ID4gK3NvdXJjZSAibGliL2t1bml0L0tjb25maWciCj4gPiA+ICsKPiA+Cj4gPiBQZXJoYXBzIHRo
aXMgc2hvdWxkIGdvIGJ5IHRoZSAiUnVudGltZSBUZXN0aW5nIiBwYXJ0PyBCZWZvcmUgb3IgYWZ0
ZXIuCgpOb3cgSSBhbSBhY3R1YWxseSB0aGlua2luZyB0aGF0IGl0IHNob3VsZCBiZSBhIG1lbnVj
b25maWcuLi4KCj4gPiA+ICBlbmRtZW51ICMgS2VybmVsIGhhY2tpbmcKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
