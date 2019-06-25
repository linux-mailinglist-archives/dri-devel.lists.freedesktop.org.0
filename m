Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DC55BF0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 01:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4EE6E181;
	Tue, 25 Jun 2019 23:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5385F6E181
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 23:03:49 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id m7so247349pls.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K5ErWoFi/JRH3gFgmKoboUdo26AiFjxGcMAHhZYf05o=;
 b=FJ+WTOtzJVtDk6rNNEv+RelFr+ZWqhB9KWgDRVd/WWsucsGTV9cV/xbZzMbSYOMrXt
 7ndb00Pa5ZMZmPYQJilFwZROBGTXJauPuQn8qpGSEltgcoABheL77Ky3whjx6rdZKwAT
 Frcou5Vdcyy/peHwmqRoao8LR3DTRO6lwpzzyul7suI4JZyRCsMgCaimi7pIc3EVb4ME
 hCHTCnpLcyEExB8IvqoyRI4oqbnxKPkDECWVvIlofkVUKg6VdESOm5aZAZ3q60+D2QS4
 BFsRCbF1Tp50Juzofy+eXXUgF2tApV1N0ij77+nCJ/Zrj8eg/08idvQAHx/caPMIpbbo
 5hFg==
X-Gm-Message-State: APjAAAUlCgat/PLgRKxFuaS8Y4ntM5DdbwsKD5UV7t6rfryIA7wT3tai
 FqJr6S+GQ33N/tZ4iVPR+3I=
X-Google-Smtp-Source: APXvYqz0M1IYGUwmvhT0NQpAoWP4ae2xshnXaqUSrqM3bOHQ06wFfedsHIaIBAncXtAoSDKV5lQq7Q==
X-Received: by 2002:a17:902:467:: with SMTP id
 94mr1238634ple.131.1561503828687; 
 Tue, 25 Jun 2019 16:03:48 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id 10sm9969046pfb.30.2019.06.25.16.03.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 16:03:47 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id BAAA5401EB; Tue, 25 Jun 2019 23:03:46 +0000 (UTC)
Date: Tue, 25 Jun 2019 23:03:46 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 06/18] kbuild: enable building KUnit
Message-ID: <20190625230346.GR19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-7-brendanhiggins@google.com>
 <20190625221318.GO19023@42.do-not-panic.com>
 <CAFd5g448rYqr3PHg0cfoddr70nktkWXcRfJoZHmuPJjTW53YYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g448rYqr3PHg0cfoddr70nktkWXcRfJoZHmuPJjTW53YYg@mail.gmail.com>
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
 Kees Cook <keescook@google.com>, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDM6NDE6MjlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDM6MTMgUE0gTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5
IGF0IDAxOjI2OjAxQU0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gZGlmZiAt
LWdpdCBhL0tjb25maWcgYi9LY29uZmlnCj4gPiA+IGluZGV4IDQ4YTgwYmVhYjY4NTMuLjEwNDI4
NTAxZWRiNzggMTAwNjQ0Cj4gPiA+IC0tLSBhL0tjb25maWcKPiA+ID4gKysrIGIvS2NvbmZpZwo+
ID4gPiBAQCAtMzAsMyArMzAsNSBAQCBzb3VyY2UgImNyeXB0by9LY29uZmlnIgo+ID4gPiAgc291
cmNlICJsaWIvS2NvbmZpZyIKPiA+ID4KPiA+ID4gIHNvdXJjZSAibGliL0tjb25maWcuZGVidWci
Cj4gPiA+ICsKPiA+ID4gK3NvdXJjZSAia3VuaXQvS2NvbmZpZyIKPiA+Cj4gPiBUaGlzIHBhdGNo
IHdvdWxkIGJyZWFrIGNvbXBpbGF0aW9uIGFzIGt1bml0L0tjb25maWcgaXMgbm90IGludHJvZHVj
ZWQuIFRoaXMKPiA+IHdvdWxkIHdvdWxkIGFsc28gYnJlYWsgYmlzZWN0YWJpbGl0eSBvbiB0aGlz
IGNvbW1pdC4gVGhpcyBjaGFuZ2Ugc2hvdWxkCj4gPiBlaXRoZXIgYmUgZm9sZGVkIGluIHRvIHRo
ZSBuZXh0IHBhdGNoLCBvciBqdXN0IGJlIGEgc2VwYXJhdGUgcGF0Y2ggYWZ0ZXIKPiA+IHRoZSBu
ZXh0IG9uZS4KPiAKPiBNYXliZSBteSBicmFpbiBpc24ndCB3b3JraW5nIHJpZ2h0IG5vdywgYnV0
IEkgYW0gcHJldHR5IGRhcm4gc3VyZSB0aGF0Cj4gSSBpbnRyb2R1Y2Uga3VuaXQvS2NvbmZpZyBp
biB0aGUgdmVyeSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNlcmllcy4KPiBRdW90aW5nIGZyb20gdGhl
IGNoYW5nZSBzdW1tYXJ5IGZyb20gdGhlIGZpcnN0IGNvbW1pdDoKCkluZGVlZCwgbXkgbWlzdGFr
ZSwgdGhhbmtzIQoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
