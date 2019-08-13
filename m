Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8838AC17
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 02:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC386E610;
	Tue, 13 Aug 2019 00:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2D6E610
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 00:41:18 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id m9so48369324pls.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 17:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2YhU7ZI7zRBNkSqHEOZBShLAkxc14NOfVdnGmm5fKU=;
 b=JE3cdgHJVtcEl5Ju9uJlQiqMlSQeddb7833YMvrMoHPClMC62niKhQ8lIer1n7+b2v
 1xDw3ySardGUZ/5OSTV/hQ76ccNuNW/4MZBtQWsk9LW6igm3Tl80bgR5csKuK19gRdz0
 BBPEaUVf1iDETzXOReQI/vlETM0/sShoKmnbQIG1xJ+SHwvrdtExqxwbNAto8RGstSia
 Em1kQCWmjlE5AdTJVMZ/ppmlIXQ417l4K/BKxHUQoFOQiYWrcxlJtu0ca0K6aji4Q3KR
 N9yazO9YSsV85Wbhr9vqc0k8lHOLEvGPx+pcHbaFpJShw/UcbPW+3tkyc+lQRyFqobk8
 BnZw==
X-Gm-Message-State: APjAAAX9f0yl0rW/jQTRvDQc06yzl49Fwkdwmsyw6eK8WZjbquIVWFun
 7Ml8Y4dukE56KSB/hFhgFNmssIPK6xCR8poonPsANg==
X-Google-Smtp-Source: APXvYqwMN7m1oxhncwRThnueyB+Cpwr7fkWXdNKhV0HMwJO6gvgJeykiY4kuCkE7DaZ3nG+H6w12tIuXT7ijhEgDApc=
X-Received: by 2002:a17:902:5983:: with SMTP id
 p3mr25962931pli.232.1565656877406; 
 Mon, 12 Aug 2019 17:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
 <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com>
 <20190812235940.100842063F@mail.kernel.org>
In-Reply-To: <20190812235940.100842063F@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 17:41:05 -0700
Message-ID: <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=o2YhU7ZI7zRBNkSqHEOZBShLAkxc14NOfVdnGmm5fKU=;
 b=jtHRbV2jvCMOrug1VL8DlniNesFQqe4mwKTZ3VzgssQ3VQs6b5LtUaNMVZsc5CuJDp
 Iw8whkhdXJ7rcwjGwBhO6bOb4R9HDy3aGxnSkB24MJ9hY0F8GUX42o4R2L5RbO1mHvNQ
 fgfZIIuryuM6MsMlE2FCQsFy9Ko0MwXC35YX0zFHFknsYf9vPZZbgUGmBgAsRIvp4Uqd
 60LKpvXh51SGPv9+hzg4POm9qQcvjpOv0jvCdTcXtAwCmnYW+REf4ctA9Xh3nN2C0Pk2
 Dfg6a9VXk1PXwpLh/pQidSNRP79rt83WW1lNCqDZaP/t4ID/ZKf6fmlxyUwdKcQccRx2
 iAHA==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNDo1OSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTY6
MzM6MzYpCj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwMzo1NToxOVBNIC0wNzAwLCBTdGVw
aGVuIEJveWQgd3JvdGU6Cj4gPiA+IFF1b3RpbmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEy
IDExOjI0OjA2KQo+ID4gPiA+ICt2b2lkIHN0cmluZ19zdHJlYW1fY2xlYXIoc3RydWN0IHN0cmlu
Z19zdHJlYW0gKnN0cmVhbSkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgc3RydWN0IHN0cmlu
Z19zdHJlYW1fZnJhZ21lbnQgKmZyYWdfY29udGFpbmVyLCAqZnJhZ19jb250YWluZXJfc2FmZTsK
PiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBzcGluX2xvY2soJnN0cmVhbS0+bG9jayk7Cj4gPiA+
ID4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZnJhZ19jb250YWluZXIsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJhZ19jb250YWluZXJfc2FmZSwK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3RyZWFtLT5mcmFnbWVu
dHMsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSkgewo+ID4g
PiA+ICsgICAgICAgICAgICAgICBsaXN0X2RlbCgmZnJhZ19jb250YWluZXItPm5vZGUpOwo+ID4g
Pgo+ID4gPiBTaG91bGRuJ3Qgd2UgZnJlZSB0aGUgYWxsb2NhdGlvbiBoZXJlPyBPdGhlcndpc2Us
IGlmIHNvbWUgdGVzdCBpcyBnb2luZwo+ID4gPiB0byBhZGQsIGFkZCwgY2xlYXIsIGFkZCwgaXQn
cyBnb2luZyB0byBsZWFrIHVudGlsIHRoZSB0ZXN0IGlzIG92ZXI/Cj4gPgo+ID4gU28gYmFzaWNh
bGx5IHRoaXMgbWVhbnMgSSBzaG91bGQgYWRkIGEga3VuaXRfa2ZyZWUgYW5kCj4gPiBrdW5pdF9y
ZXNvdXJjZV9kZXN0cm95IChyZXNwZWN0aXZlIGVxdWl2YWxlbnRzIHRvIGRldm1fa2ZyZWUsIGFu
ZAo+ID4gZGV2cmVzX2Rlc3Ryb3kpIGFuZCB1c2Uga3VuaXRfa2ZyZWUgaGVyZT8KPiA+Cj4KPiBZ
ZXMsIG9yIGRyb3AgdGhlIEFQSSBlbnRpcmVseT8gRG9lcyBhbnl0aGluZyBuZWVkIHRoaXMgZnVu
Y3Rpb25hbGl0eT8KCkRyb3AgdGhlIGt1bml0X3Jlc291cmNlIEFQST8gSSB3b3VsZCBzdHJvbmds
eSBwcmVmZXIgbm90IHRvLgpzdHJpbmdfc3RyZWFtIHVzZXMgaXQ7IHRoZSBleHBlY3RhdGlvbiBz
dHVmZiB1c2VzIGl0IHZpYSBzdHJpbmcKc3RyZWFtOyBzb21lIG9mIHRoZSB0ZXN0cyBpbiB0aGlz
IHBhdGNoc2V0IGFsbG9jYXRlIG1lbW9yeSBhcyBwYXJ0IG9mCnRoZSB0ZXN0IHNldHVwIHRoYXQg
dXNlcyBpdC4gVGhlIGludGVudGlvbiBpcyB0aGF0IHdlIHdvdWxkIHByb3ZpZGUgYQprdW5pdF9y
ZXNfKiB2ZXJzaW9uIG9mIG1hbnkgKGhvcGVmdWxseSBldmVudHVhbGx5IG1vc3QpIGNvbW1vbgpy
ZXNvdXJjZXMgcmVxdWlyZWQgYnkgdGVzdHMgYW5kIGl0IHdvdWxkIGJlIHVzZWQgaW4gdGhlIHNh
bWUgd2F5IHRoYXQKdGhlIGRldm1fKiBzdHVmZiBpcy4KCk5ldmVydGhlbGVzcywgSSBhbSBmaW5l
IGFkZGluZyB0aGUga3VuaXRfcmVzb3VyY2VfZGVzdHJveSwgZXRjLiBJIGp1c3QKd2FudGVkIHRv
IG1ha2Ugc3VyZSBJIHVuZGVyc3Rvb2Qgd2hhdCB5b3Ugd2VyZSBhc2tpbmcuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
