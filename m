Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6668AAD2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 00:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E0B89F33;
	Mon, 12 Aug 2019 22:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB4C89F33
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 22:55:20 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A67C206A2;
 Mon, 12 Aug 2019 22:55:20 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-4-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 15:55:19 -0700
Message-Id: <20190812225520.5A67C206A2@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565650520;
 bh=bzSVxn1O+XeeWY+2gZI6RE/G7J9stvLsMgc7wXKMLBY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=2fFWNBju/NoA9EEEg6SgrC0ymxSRFlWH+/sXXpWVTbVoBuKIvJiA7w1IyG/Q5cfgN
 gw3v0MRCJ48hdqHfIdIAFVkbP+9VeXqYGvbIjFkrUu6xwlZcEnR9KMfu3l/b+H0uED
 iKs6Gza2xwnDfKRu3oYIOckfg2RYjnmKmEyi2wfI=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDYpCj4gK3ZvaWQgc3Ry
aW5nX3N0cmVhbV9jbGVhcihzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbV9mcmFnbWVudCAqZnJhZ19jb250YWluZXIsICpmcmFn
X2NvbnRhaW5lcl9zYWZlOwo+ICsKPiArICAgICAgIHNwaW5fbG9jaygmc3RyZWFtLT5sb2NrKTsK
PiArICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShmcmFnX2NvbnRhaW5lciwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFnX2NvbnRhaW5lcl9zYWZlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdHJlYW0tPmZyYWdtZW50cywKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBub2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGxpc3Rf
ZGVsKCZmcmFnX2NvbnRhaW5lci0+bm9kZSk7CgpTaG91bGRuJ3Qgd2UgZnJlZSB0aGUgYWxsb2Nh
dGlvbiBoZXJlPyBPdGhlcndpc2UsIGlmIHNvbWUgdGVzdCBpcyBnb2luZwp0byBhZGQsIGFkZCwg
Y2xlYXIsIGFkZCwgaXQncyBnb2luZyB0byBsZWFrIHVudGlsIHRoZSB0ZXN0IGlzIG92ZXI/Cgo+
ICsgICAgICAgfQo+ICsgICAgICAgc3RyZWFtLT5sZW5ndGggPSAwOwo+ICsgICAgICAgc3Bpbl91
bmxvY2soJnN0cmVhbS0+bG9jayk7Cj4gK30KPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
