Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483065265
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213936E11B;
	Thu, 11 Jul 2019 07:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE889FC8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 07:50:31 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x6A7o7Ss007109
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:50:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6A7o7Ss007109
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id u3so896761vsh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 00:50:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVVhQqhbI2+K0AcCoDaNLWUJCwITOtv5vrQ5H/79rQFeW7ZtSYu
 OXbXG09jFsD4GQdrkM+Fl524T62cJ8PqfT302Ds=
X-Google-Smtp-Source: APXvYqw2lrh+5DK/jJwMNeRrzarB0aSECJBPOWsWFIa2/e5Dx+WrHYOuiqBpjnzOBa000Fw4cKQimfq9Auvs/nIayt0=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr17019011vsd.215.1562745007249; 
 Wed, 10 Jul 2019 00:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
 <20190710071508.173491-7-brendanhiggins@google.com>
In-Reply-To: <20190710071508.173491-7-brendanhiggins@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 Jul 2019 16:49:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASywq+RhEisuPbqOjFoBh7WNvMEgy55iacizrgNB-uBfA@mail.gmail.com>
Message-ID: <CAK7LNASywq+RhEisuPbqOjFoBh7WNvMEgy55iacizrgNB-uBfA@mail.gmail.com>
Subject: Re: [PATCH v8 06/18] kbuild: enable building KUnit
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1562745008;
 bh=PI9vAU5DZ4pm8uk/LZDalZiWfwOYBnqaRPHYLckDX4g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=w5GILrEzqG9QlS6RZMKoQ+TxsVYj6AbqrRo9R4/qXciHnnGeEtP6k+w63dXtetcj/
 Xn6NAKlf8heOTJuAUmEALG9Whwr46Y8aldwwTqaASxABPKyU4DzeaJFtd8vtz0jU/c
 +jWBilSzUMoEElhEZGQd/JPFPEwiRPRfHYIjk4ajD0wWByqOPvBar9WY7dbCfcDdi4
 Wjod5ApEpPIoKqPqNoJhXo484ulGXFa6J5zsl096hZmZIKS+2TfdDqJrByp/HtDa2D
 lfX401sqMeHtu6CQ0Roycgg7O2PZ7+gKmQLTnMijt+3tvbOQKweRcnve6x1E1IhZhv
 MVmVq54Wkjd4Q==
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "Cc: Shuah Khan" <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Michal Marek <michal.lkml@markovi.net>, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgNDoxNiBQTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gS1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5n
IGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQgd2hlbiB1c2VkIGlzCj4gYnVpbHQgaW50byB0
aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0IHRvIHRoZSByb290IEtjb25maWcg
YW5kCj4gTWFrZWZpbGUgdG8gYWxsb3cgaXQgdG8gYmUgYWN0dWFsbHkgYnVpbHQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4g
Q2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CgpQbGVh
c2UgZmVlbCBmcmVlIHRvIHJlcGxhY2UgdGhpcyB3aXRoOgoKQWNrZWQtYnk6IE1hc2FoaXJvIFlh
bWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CgoKPiBDYzogTWljaGFsIE1hcmVr
IDxtaWNoYWwubGttbEBtYXJrb3ZpLm5ldD4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9nYW4gR3Vu
dGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJv
IFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
