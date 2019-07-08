Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E763155
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD9E897F3;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFDE8977A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 23:34:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so18919592wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 16:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0bgA4UqbyynY1WKuo34XLnfT2RL8oF6dGSsO++vmwI=;
 b=cLUY8yo6zTKLJJRg9S1fP2WBevF0uoe6F1vxyLGXrgUl0NhkBYPexIsjLc5ABJGGQZ
 dC7TG6IWxqK+LyrNOYNgmq/cIcljikqtsPF+PBsyzgCvBcrJxIQeQQQdknVd3vw4YHMW
 g//Sk+iaMsjKbvn5e9iNx/8ZbYU4XW355l95govzdKSN5NSZlbsZ+m3wZXb1SzMNzA+L
 NsQ3QrSlfWU7Fbk2o12Dl4/jdKO4BIDvKC4EjaGRpyTcNqEkpRURxdUMPTlLVVKLeyTP
 sg2pTUTspvu6pRC6l/7f3eifZTNYRv6mPZk9O8wryBI3R2/oY4qy26owSyaGIsXrXXdz
 /p+A==
X-Gm-Message-State: APjAAAWgDTxC413j1wzBEJ1ZFMU9GXAxiie8oVag8Fm1tYNMyhFOcPa2
 Y7hp3bMhfyiBQgbudfLDmsyYAJ7duG+UeEYYrxi7
X-Google-Smtp-Source: APXvYqy2agX+h3NF02X+WujT1yk9yb+IABwJhy8IpnbR3/useLGvEwjfJj5ObeDsKZRewf4wva8AmF6fHX7xEyn/0ZQ=
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr19532947wrv.19.1562628896307; 
 Mon, 08 Jul 2019 16:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-19-brendanhiggins@google.com>
 <20190705204810.GE19023@42.do-not-panic.com>
 <CAFd5g44j7ECQorYLnDQadAaj+yBki98kFjmjejn+3W4eHtqGDA@mail.gmail.com>
 <CAAXuY3q1==RvAiw+gw5kfFJmjdR9JEUnnxou4Sv0POd88aD41w@mail.gmail.com>
In-Reply-To: <CAAXuY3q1==RvAiw+gw5kfFJmjdR9JEUnnxou4Sv0POd88aD41w@mail.gmail.com>
From: Iurii Zaikin <yzaikin@google.com>
Date: Mon, 8 Jul 2019 16:34:20 -0700
Message-ID: <CAAXuY3ov7s28BQ0VxzkfAHR6NZiBq-YfnJ_510VN22DMhEyCBg@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+0bgA4UqbyynY1WKuo34XLnfT2RL8oF6dGSsO++vmwI=;
 b=Vvu+7XyZ+bf18JzhxWs9WUla5B97kN6JNUGK09wQnbC1To+ikzJLjWemzYQ4bSdXem
 Lb4Ujrcwm/h5eSGI7UR+HmJu9labaWTTr2uGAMIQle4ZAoZT+/Rr04O/5fXMa+UDK/dI
 PiWmvqDOuBeRwnaNj0eFrE7zYpPFf5ZW5v1/snESkLUrZhzUeLNH4C7U1TAT94jY3ioz
 eEbjqFsIRgjTDidMp1LOdKzZIEzJRV4P4q40BE/P564YjPoiVk+St3f2/qGgJ0XbufeM
 E4LGboUMF+nD44IlGbVNDieKQG3KCLdUF/egpt+dZ1xlDy4X/3SK1jXeVQiIZHm6dFjh
 zhQA==
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
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBNb24sIEp1bCA4LCAyMDE5IGF0IDQ6MTYgUE0gQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFu
aGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPj4KPj4gQ0MnaW5nIEl1cmlpIFphaWtpbgo+Pgo+
PiBPbiBGcmksIEp1bCA1LCAyMDE5IGF0IDE6NDggUE0gTHVpcyBDaGFtYmVybGFpbiA8bWNncm9m
QGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6
MzY6MTVQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+PiA+ID4gQWRkIGVudHJ5IGZv
ciB0aGUgbmV3IHByb2Mgc3lzY3RsIEtVbml0IHRlc3QgdG8gdGhlIFBST0MgU1lTQ1RMIHNlY3Rp
b24uCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFu
aGlnZ2luc0Bnb29nbGUuY29tPgo+PiA+ID4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1h
biA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4+ID4gPiBSZXZpZXdlZC1ieTogTG9nYW4g
R3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+PiA+ID4gQWNrZWQtYnk6IEx1aXMgQ2hh
bWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPgo+PiA+Cj4+ID4gQ29tZSB0byB0aGluayBvZiBp
dCwgSSdkIHdlbGNvbWUgSXVyaWkgdG8gYmUgYWRkZWQgYXMgYSBtYWludGFpbmVyLAo+PiA+IHdp
dGggdGhlIGhvcGUgSXVyaWkgd291bGQgYmUgdXAgdG8gcmV2aWV3IG9ubHkgdGhlIGt1bml0IGNo
YW5nZXMuIE9mCj4+ID4gY291cnNlIGlmIEl1cmlpIHdvdWxkIGJlIHVwIHRvIGFsc28gaGVscCBy
ZXZpZXcgZnV0dXJlIHByb2MgY2hhbmdlcywKPj4gPiBldmVuIGJldHRlci4gMyBwYWlyIG9mIGV5
ZWJhbGxzIGlzIGJldHRlciB0aGFuIDIgcGFpcnMuCj4+Cj4+IFdoYXQgZG8geW91IHRoaW5rLCBJ
dXJpaT8KCkknbSBpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
