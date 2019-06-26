Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF557416
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 00:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFEA6E52E;
	Wed, 26 Jun 2019 22:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5196E52E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 22:03:53 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 19so132809pfa.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 15:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2/PNSJ1/n2Sf5XjBVfcC1JCMKtBWU3f+geLh+mw2r8k=;
 b=pybHfCS+LZbR9a/Ed/+9/AiKGyX+PFQ7JzseGaC2AXkB11XNjw17Cm+Ls/VxdWgr3Q
 2jTPPCLWtBM4drNt2tw101bS9QEfJs4GEpaG4uPIemUqx+rGsekkCrbwtE5QMEr9X339
 z92vzkQ1tWFhIc4jXgGguGVHPjxEVqZZASzdd7GpOBe2EJKtZIhDKN4ezTAgSSqnlioG
 MuNLJcx42axs87LVEfK9YFKPCNE1CK66iDyF0sm8R9Xhd6nimatcgyspj5hVkAd9ycAh
 sHQAbEQZbGUWiHDdZyiGW7bGZFCMLz+HnOqkBfxUq0yn+A1jFe4DWZ6dtiPfeNNA8sSt
 pZwg==
X-Gm-Message-State: APjAAAV8JiTlL7W+DA778wUk3g8QDZVkLaLb3mVocMEc9oqwLHTgfQaM
 FqTAbgVpcELiKo8CCkSSk3M=
X-Google-Smtp-Source: APXvYqw88JPlk1NMugJQCJe5YC3I+KLyTyrQ1NxeCgEmtlZtT8YwpdCjtZvQ3Q7z9dJOH+5nmM/tbA==
X-Received: by 2002:a63:6cc3:: with SMTP id h186mr215927pgc.292.1561586632642; 
 Wed, 26 Jun 2019 15:03:52 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id j23sm110168pgb.63.2019.06.26.15.03.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 15:03:51 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 5B297401D0; Wed, 26 Jun 2019 22:03:50 +0000 (UTC)
Date: Wed, 26 Jun 2019 22:03:50 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 13/18] kunit: tool: add Python wrappers for running
 KUnit tests
Message-ID: <20190626220350.GA19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-14-brendanhiggins@google.com>
 <20190626000150.GT19023@42.do-not-panic.com>
 <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g44kkepB2hZcpYL-NB5ZHYE5tP7W-0yducGCX7Khd9gd9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDE6MDI6NTVBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDU6MDEgUE0gTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5
IGF0IDAxOjI2OjA4QU0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL2t1bml0L3Rlc3RfZGF0YS90ZXN0X2lzX3Rlc3Rf
cGFzc2VkLWFsbF9wYXNzZWQubG9nCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVz
dGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1jcmFzaC5sb2cKPiA+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL2t1bml0L3Rlc3RfZGF0YS90ZXN0X2lz
X3Rlc3RfcGFzc2VkLWZhaWx1cmUubG9nCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
dGVzdGluZy9rdW5pdC90ZXN0X2RhdGEvdGVzdF9pc190ZXN0X3Bhc3NlZC1ub190ZXN0c19ydW4u
bG9nCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9rdW5pdC90ZXN0X2Rh
dGEvdGVzdF9vdXRwdXRfaXNvbGF0ZWRfY29ycmVjdGx5LmxvZwo+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHRvb2xzL3Rlc3Rpbmcva3VuaXQvdGVzdF9kYXRhL3Rlc3RfcmVhZF9mcm9tX2ZpbGUu
a2NvbmZpZwo+ID4KPiA+IFdoeSBhcmUgdGhlc2UgYmVpbmcgYWRkZWQgdXBzdHJlYW0/IFRoZSBj
b21taXQgbG9nIGRvZXMgbm90IGV4cGxhaW4KPiA+IHRoaXMuCj4gCj4gT2ggc29ycnksIHRob3Nl
IGFyZSBmb3IgdGVzdGluZyBwdXJwb3Nlcy4gSSB0aG91Z2h0IHRoYXQgd2FzIGNsZWFyCj4gZnJv
bSBiZWluZyBpbiB0aGUgdGVzdF9kYXRhIGRpcmVjdG9yeS4gSSB3aWxsIHJlZmVyZW5jZSBpdCBp
biB0aGUKPiBjb21taXQgbG9nIGluIHRoZSBuZXh0IHJldmlzaW9uLgoKU3RpbGwsIEkgZG9uJ3Qg
Z2V0IGl0LiBUaGV5IHNlZW0gdG8gYmUgcmVzdWx0cyBmcm9tIGEgcHJpb3IgcnVuLiBXaHkgZG8K
d2UgbmVlZCB0aGVtIGZvciB0ZXN0aW5nIHB1cnBvc2VzPwoKICBMdWlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
