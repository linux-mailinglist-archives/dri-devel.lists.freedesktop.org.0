Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5162563F2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636946E2C0;
	Wed, 26 Jun 2019 08:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66E96E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:03:07 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w10so828606pgj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwcdyZlVJNYhzqAX8drYdwwlincSCC0RlYdtVUa7uAU=;
 b=gotnnLPXGONUrUpCxsfdClLbHxQyG3gfJEG39H/Fk/4wSPNyWumP++T3uMfFMN5TU9
 8DPwYiAfiClDI0iSdPH0hkUyZdv3iHbLPD72FnSoNYLCOieSzu8mGJ0C3A8nMsU+1E5w
 wx52Ai7cG1s6HfPNWXvzUOSbe3/TOpB9RxgO5kg2SHFW6Kk/P0QQfQEe2GW7VFNfLTnn
 zsBkHW2vBArNUz2qzbdk3zXLWoRMeouA2E+GXz0ZrxI6no4HHUQkAg3dGSWyiDCWi1j4
 r9PNfflwNq1o5XdLa1kogniremkwWFhgroGVyMfHmgSigF6M4xvZwYPPXB/JryK/meSO
 Kr7Q==
X-Gm-Message-State: APjAAAWYtvDpU/DGTI83N8jqw1UVsaF9x92qdcUyMPE6dmAhmexyT/3D
 hos4Z+kXiPGORGYHykJlbqcXF5m6LUpBQcYFsrIOeg==
X-Google-Smtp-Source: APXvYqzSvFzyXqC4mv+sYfABQnmt0YNMhvFTkgdzLZZeovItyFY3wThgA7+iWx0YSEf5WS6vtdXjsfVxGyJkZN8WaD8=
X-Received: by 2002:a17:90a:9382:: with SMTP id
 q2mr3140021pjo.131.1561536186861; 
 Wed, 26 Jun 2019 01:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-14-brendanhiggins@google.com>
 <20190626000150.GT19023@42.do-not-panic.com>
In-Reply-To: <20190626000150.GT19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 26 Jun 2019 01:02:55 -0700
Message-ID: <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
Subject: Re: [PATCH v5 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nwcdyZlVJNYhzqAX8drYdwwlincSCC0RlYdtVUa7uAU=;
 b=IkHW2/q5zYf/AiFOwOUn62sZGCukGK93pV5qaXaFIqAD6rVurvvvVguZ0CQNqSK004
 PUW6XYRD1tpIvu/H8uK2xdNaMWkc3s+ZreXHoEsItZgP1H729MJ8nowT1aehVpl1AnJq
 rAPmVbRpyeOR+0aKXV1iywesPypOO3F4fwUcKnHNHDKkSlnXU9KrB33bQAymKu7tZx6G
 yt/Ix8apmwB+zPUY0f7g7GrCvvhKCA2B8FFf68JI9BW8d/snEU6oOmLqSE4EOwMnXWLP
 uFddQ1SWm8yfpnKxzglfseoQZZbmazxOSGTrgVrxfJIOk1+YhP4zhoDMctTsB330F1Sn
 /4dA==
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
 Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNTowMSBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwMToyNjowOEFN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfaXNfdGVzdF9wYXNzZWQtYWxsX3Bhc3Nl
ZC5sb2cKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2Rh
dGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1jcmFzaC5sb2cKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1mYWlsdXJl
LmxvZwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL2t1bml0L3Rlc3RfZGF0
YS90ZXN0X2lzX3Rlc3RfcGFzc2VkLW5vX3Rlc3RzX3J1bi5sb2cKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9vdXRwdXRfaXNvbGF0ZWRf
Y29ycmVjdGx5LmxvZwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL2t1bml0
L3Rlc3RfZGF0YS90ZXN0X3JlYWRfZnJvbV9maWxlLmtjb25maWcKPgo+IFdoeSBhcmUgdGhlc2Ug
YmVpbmcgYWRkZWQgdXBzdHJlYW0/IFRoZSBjb21taXQgbG9nIGRvZXMgbm90IGV4cGxhaW4KPiB0
aGlzLgoKT2ggc29ycnksIHRob3NlIGFyZSBmb3IgdGVzdGluZyBwdXJwb3Nlcy4gSSB0aG91Z2h0
IHRoYXQgd2FzIGNsZWFyCmZyb20gYmVpbmcgaW4gdGhlIHRlc3RfZGF0YSBkaXJlY3RvcnkuIEkg
d2lsbCByZWZlcmVuY2UgaXQgaW4gdGhlCmNvbW1pdCBsb2cgaW4gdGhlIG5leHQgcmV2aXNpb24u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
