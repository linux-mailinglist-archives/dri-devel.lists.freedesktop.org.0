Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9ABC23F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928D6E9A9;
	Tue, 24 Sep 2019 07:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2C8935B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 21:31:11 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCVuZ-0003lg-TH; Mon, 23 Sep 2019 21:30:23 +0000
Subject: Re: [PATCH v18 15/19] Documentation: kunit: add documentation for
 KUnit
To: shuah <shuah@kernel.org>, Brendan Higgins <brendanhiggins@google.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-16-brendanhiggins@google.com>
 <d87eba35-ae09-0c53-bbbe-51ee9dc9531f@infradead.org>
 <CAFd5g45y-NWzbn8E8hUg=n4U5E+N6_4D8eCXhQ74Y0N4zqVW=w@mail.gmail.com>
 <d7a61045-8fe6-a104-ece9-67b69c379425@infradead.org>
 <d5dc04ab-9be5-b258-c302-29f8045d6aaa@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <437bc2d1-f26b-0f04-324f-cbdca989e42c@infradead.org>
Date: Mon, 23 Sep 2019 14:30:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5dc04ab-9be5-b258-c302-29f8045d6aaa@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Sep 2019 07:07:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O4AJzqwx8UNRh0+dCT8Ph5aKpjRexgGPb//cNFsda+Y=; b=RsebLDQx/T22kd9NN7O9OTg5V
 3+HWJNeFeZV/brf5F4kVky0J3WD+Z+J5wsncdtuiDeJ+I8f7U2CGR85reETvmwKxf5biit/usSFwR
 3cftnFOqk8YwTtJFcihOFpkCr1jCDWydkdIIBYrKxjyBx2d/G8rpQuaa8QU4v4cPfVfqn19BeZQ5g
 fSFL5NQWTeG0vsDULREYmkyX7fRbz7/KMJepTGQnSicewM6G9fyfXHKlb0mKqJ9X3DgwMnDHkXoUl
 F+E8CXXrYh6HFgMbuPhRs1smdzdW8pn/gcbnOYVKmIlZ5b95l20n2HvhukC3CB2lp3GnAEnMttbsH
 CxzckVOxw==;
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
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMy8xOSAyOjE4IFBNLCBzaHVhaCB3cm90ZToKCj4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5
IHRoZSBzZXJpZXMgdmVyeSBzb29uIHNvIGl0IGdldHMgc29tZSBzb2FrIHRpbWUKPiBhZnRlciB0
aGlzIG1vdmUgaW4gbGludXgtbmV4dCBhbmQgaXQgY2FuIHN0aWxsIG1ha2UgdGhlIHJjMS4KPiAK
PiBTaW5jZSB0aGVyZSBjaGFuZ2VzIGNhbiBiZSBhZGRyZXNzZWQgYWZ0ZXIgcmMxLCBJIHdvdWxk
IGxpa2UgdG8gbm90Cj4gcmVxdWlyZSBCcmVuZGFuIHRvIGRvIGFub3RoZXIgdmVyc2lvbiBiZWZv
cmUgSSBhcHBseS4KPiAKPiBIb3BlIHlvdSBhcmUgb2theSB3aXRoIHRoYXQgUmFuZHkhCj4gCj4g
dGhhbmtzLAo+IC0tIFNodWFoCgpTdXJlLCBubyBwcm9ibGVtLCBnbyBmb3IgaXQgLgoKLS0gCn5S
YW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
