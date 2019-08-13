Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F78AD7A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F195A89739;
	Tue, 13 Aug 2019 04:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B383189739
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:24:55 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A04320644;
 Tue, 13 Aug 2019 04:24:55 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-11-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:24:54 -0700
Message-Id: <20190813042455.4A04320644@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565670295;
 bh=lYF5vY6A9XGwdbOcoCHf2uLqBmu5NRPCpxTmtGqQJhs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KCRm3MnmcSr4r9DJLeJoz79Ahddq949WPxyIzyFrExKgucBorBvg59cJpXDJ+jPp5
 PBgeRsjFWXar7544719pqTdGFznCN2uAa+rzB3U0UHd+Ej51ANvVlEQmefqncFeorT
 zM+muQSvFjFYVLYxKXgAxydELtwpClAqHSPnhY/8=
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

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MTMpCj4gKwo+ICtzdGF0
aWMgaW50IGt1bml0X3RyeV9jYXRjaF90ZXN0X2luaXQoc3RydWN0IGt1bml0ICp0ZXN0KQo+ICt7
Cj4gKyAgICAgICBzdHJ1Y3Qga3VuaXRfdHJ5X2NhdGNoX3Rlc3RfY29udGV4dCAqY3R4Owo+ICsK
PiArICAgICAgIGN0eCA9IGt1bml0X2t6YWxsb2ModGVzdCwgc2l6ZW9mKCpjdHgpLCBHRlBfS0VS
TkVMKTsKCkNhbiB0aGlzIGZhaWw/IFNob3VsZCByZXR1cm4gLUVOT01FTSBpbiB0aGF0IGNhc2U/
Cgo+ICsgICAgICAgdGVzdC0+cHJpdiA9IGN0eDsKPiArCj4gKyAgICAgICBjdHgtPnRyeV9jYXRj
aCA9IGt1bml0X2ttYWxsb2ModGVzdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplb2YoKmN0eC0+dHJ5X2NhdGNoKSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
