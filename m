Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92755F94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9D36E25A;
	Wed, 26 Jun 2019 03:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921FA6E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:36:46 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j2so531992pfe.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OjCrPT4hCWb7xnrRZjLNhlZP4Wd3/W1zcGw/ncRINUY=;
 b=sqeSWviNaHogUS7MvzbdjHj36JExJVOVYG4M1+T+VvrvDuJZV1py71EP4uoT5PgnT5
 nQMKqAdqYqAru7TANTRxoD30z/nr8UZfYZjDNJAogan/sJlnHnhrO6QHG0Sg/A4P7VRP
 mL4UPcW7emxRzZPYavF2GkE9ns3FAkCHpJ86loiRmcRk43I2GxgiJykvAHLHFLtPPPMx
 ULeMwGv4SKV2ef7WQWUgXp/H2ae2OmCkTbxnVKhLgXxA3xtjkibDPQPEKA1wuxd+1Pr2
 tTibz182xVRzVAeQb1D1spu/Nj24UD0uU6ulaexi5bLsUHkDutcYf3/kTPdy3q9/Sv1O
 7JNA==
X-Gm-Message-State: APjAAAVebwQ5xZ3Xq1teyATVya0dWM7a+FeR/+ITSqyerlByghsNhs66
 gA25KscO0pwljVTy2D029bE=
X-Google-Smtp-Source: APXvYqzdBmpyE53WQRasxEh7JB6Bcl0/Rzj4Dgw3h206UsHqJ5Xslk8HuWxgkcEgUlDNN6u05UT4Bg==
X-Received: by 2002:a17:90a:2190:: with SMTP id
 q16mr1703219pjc.23.1561520205640; 
 Tue, 25 Jun 2019 20:36:45 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id d187sm17418788pfa.38.2019.06.25.20.36.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 20:36:44 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id BA50240336; Wed, 26 Jun 2019 03:36:43 +0000 (UTC)
Date: Wed, 26 Jun 2019 03:36:43 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
Message-ID: <20190626033643.GX19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190625223312.GP19023@42.do-not-panic.com>
 <CAFd5g46TLAONgXiZkFM98BPd-sariMTwhmYG9hSJ+M9=r-ixeg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g46TLAONgXiZkFM98BPd-sariMTwhmYG9hSJ+M9=r-ixeg@mail.gmail.com>
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDU6MDc6MzJQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDM6MzMgUE0gTHVpcyBDaGFtYmVybGFp
biA8bWNncm9mQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5
IGF0IDAxOjI1OjU2QU0gLTA3MDAsIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiA+ID4gKy8qKgo+
ID4gPiArICogbW9kdWxlX3Rlc3QoKSAtIHVzZWQgdG8gcmVnaXN0ZXIgYSAmc3RydWN0IGt1bml0
X21vZHVsZSB3aXRoIEtVbml0Lgo+ID4gPiArICogQG1vZHVsZTogYSBzdGF0aWNhbGx5IGFsbG9j
YXRlZCAmc3RydWN0IGt1bml0X21vZHVsZS4KPiA+ID4gKyAqCj4gPiA+ICsgKiBSZWdpc3RlcnMg
QG1vZHVsZSB3aXRoIHRoZSB0ZXN0IGZyYW1ld29yay4gU2VlICZzdHJ1Y3Qga3VuaXRfbW9kdWxl
IGZvciBtb3JlCj4gPiA+ICsgKiBpbmZvcm1hdGlvbi4KPiA+ID4gKyAqLwo+ID4gPiArI2RlZmlu
ZSBtb2R1bGVfdGVzdChtb2R1bGUpIFwKPiA+ID4gKyAgICAgICAgICAgICBzdGF0aWMgaW50IG1v
ZHVsZV9rdW5pdF9pbml0IyNtb2R1bGUodm9pZCkgXAo+ID4gPiArICAgICAgICAgICAgIHsgXAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGt1bml0X3J1bl90ZXN0cygmbW9kdWxl
KTsgXAo+ID4gPiArICAgICAgICAgICAgIH0gXAo+ID4gPiArICAgICAgICAgICAgIGxhdGVfaW5p
dGNhbGwobW9kdWxlX2t1bml0X2luaXQjI21vZHVsZSkKPiA+Cj4gPiBCZWN1YXNlIGxhdGVfaW5p
dGNhbGwoKSBpcyB1c2VkLCBpZiB0aGVzZSBtb2R1bGVzIGFyZSBidWlsdC1pbiwgdGhpcwo+ID4g
d291bGQgcHJlY2x1ZGUgdGhlIGFiaWxpdHkgdG8gdGVzdCB0aGluZ3MgcHJpb3IgdG8gdGhpcyBw
YXJ0IG9mIHRoZQo+ID4ga2VybmVsIHVuZGVyIFVNTCBvciB3aGF0ZXZlciBhcmNoaXRlY3R1cmUg
cnVucyB0aGUgdGVzdHMuIFNvLCB0aGlzCj4gPiBsaW1pdHMgdGhlIHNjb3BlIG9mIHRlc3Rpbmcu
IFNtYWxsIGRldGFpbCBidXQgdGhlIHNjb3BlIHdob3VsZCBiZQo+ID4gZG9jdW1lbnRlZC4KPiAK
PiBZb3UgYXJlbid0IHRoZSBmaXJzdCBwZXJzb24gdG8gY29tcGxhaW4gYWJvdXQgdGhpcyAoYW5k
IEkgYW0gbm90IHN1cmUKPiBpdCBpcyB0aGUgZmlyc3QgdGltZSB5b3UgaGF2ZSBjb21wbGFpbmVk
IGFib3V0IGl0KS4gQW55d2F5LCBJIGhhdmUKPiBzb21lIGZvbGxvdyBvbiBwYXRjaGVzIHRoYXQg
d2lsbCBpbXByb3ZlIHRoZSBsYXRlX2luaXRjYWxsIHRoaW5nLCBhbmQKPiBwZW9wbGUgc2VlbWVk
IG9rYXkgd2l0aCBkaXNjdXNzaW5nIHRoZSBmb2xsb3cgb24gcGF0Y2hlcyBhcyBwYXJ0IG9mIGEK
PiBzdWJzZXF1ZW50IHBhdGNoc2V0IGFmdGVyIHRoaXMgZ2V0cyBtZXJnZWQuCj4gCj4gSSB3aWxs
IG5ldmVydGhlbGVzcyBkb2N1bWVudCB0aGUgcmVzdHJpY3Rpb24gdW50aWwgdGhlbi4KClRvIGJl
IGNsZWFyLCBJIGFtIG5vdCBjb21wbGFpbmluZyBhYm91dCBpdC4gSSBqdXN0IGZpbmQgaXQgc2lt
cGx5CmNyaXRpY2FsIHRvIGRvY3VtZW50IGl0cyBsaW1pdGF0aW9ucywgc28gZm9sa3MgZG9uJ3Qg
dHJ5IHRvIGludmVzdAp0aW1lIGFuZCBlbmVyZ3kgb24ga3VuaXQgcmlnaHQgYXdheSBmb3IgYW4g
ZWFybHkgaW5pdCB0ZXN0LCBpZiBpdApjYW5ub3Qgc3VwcG9ydCBpdC4KCklmIHN1cHBvcnQgZm9y
IHRoYXQgcmVxdWlyZXMgc29tZSB3b3JrLCBpdCBtYXkgYmUgd29ydGggbWVudGlvbmluZwphcyB3
ZWxsLgoKPiA+ID4gK3N0YXRpYyB2b2lkIGt1bml0X3ByaW50X3RhcF92ZXJzaW9uKHZvaWQpCj4g
PiA+ICt7Cj4gPiA+ICsgICAgIGlmICgha3VuaXRfaGFzX3ByaW50ZWRfdGFwX3ZlcnNpb24pIHsK
PiA+ID4gKyAgICAgICAgICAgICBrdW5pdF9wcmludGtfZW1pdChMT0dMRVZFTF9JTkZPLCAiVEFQ
IHZlcnNpb24gMTRcbiIpOwo+ID4KPiA+IFdoYXQgaXMgdGhpcyBUQVAgdGhpbmc/IFdoeSBzaG91
bGQgd2UgY2FyZSB3aGF0IHZlcnNpb24gaXQgaXMgb24/Cj4gPiBXaHkgYXJlIHdlIHByaW50aW5n
IHRoaXM/Cj4gCj4gSXQncyBwYXJ0IG9mIHRoZSBUQVAgc3BlY2lmaWNhdGlvblsxXS4gR3JlZyBh
bmQgRnJhbmsgYXNrZWQgbWUgdG8gbWFrZQo+IHRoZSBpbnRlcm1lZGlhdGUgZm9ybWF0IGNvbmZv
cm0gdG8gVEFQLiBTZWVtcyBsaWtlIHNvbWV0aGluZyBlbHNlIEkKPiBzaG91bGQgcHJvYmFibGUg
ZG9jdW1lbnQuLi4KClllcyB0aGFua3MhCgo+ID4gPiArICAgICAgICAgICAgIGt1bml0X2hhc19w
cmludGVkX3RhcF92ZXJzaW9uID0gdHJ1ZTsKPiA+ID4gKyAgICAgfQo+ID4gPiArfQo+ID4gPiAr
Cj4gPiA+ICtzdGF0aWMgc2l6ZV90IGt1bml0X3Rlc3RfY2FzZXNfbGVuKHN0cnVjdCBrdW5pdF9j
YXNlICp0ZXN0X2Nhc2VzKQo+ID4gPiArewo+ID4gPiArICAgICBzdHJ1Y3Qga3VuaXRfY2FzZSAq
dGVzdF9jYXNlOwo+ID4gPiArICAgICBzaXplX3QgbGVuID0gMDsKPiA+ID4gKwo+ID4gPiArICAg
ICBmb3IgKHRlc3RfY2FzZSA9IHRlc3RfY2FzZXM7IHRlc3RfY2FzZS0+cnVuX2Nhc2U7IHRlc3Rf
Y2FzZSsrKQo+ID4KPiA+IElmIHdlIG1ha2UgdGhlIGxhc3QgdGVzdCBjYXNlIE5VTEwsIHdlJ2Qg
anVzdCBjaGVjayBmb3IgdGVzdF9jYXNlIGhlcmUsCj4gPiBhbmQgc2F2ZSBvdXJzZWx2ZXMgYW4g
ZXh0cmEgZmV3IGJ5dGVzIHBlciB0ZXN0IG1vZHVsZS4gQW55IHJlYXNvbiB3aHkKPiA+IHRoZSBs
YXN0IHRlc3QgY2FzZSBjYW5ub3QgYmUgTlVMTD8KPiAKPiBJcyB0aGVyZSBhbnl3YXkgdG8gbWFr
ZSB0aGF0IHdvcmsgd2l0aCBhIHN0YXRpY2FsbHkgZGVmaW5lZCBhcnJheT8KCk5vIHlvdSdyZSBy
aWdodC4KCj4gQmFzaWNhbGx5LCBJIHdhbnQgdG8gYmUgYWJsZSB0byBkbyBzb21ldGhpbmcgbGlr
ZToKPiAKPiBzdGF0aWMgc3RydWN0IGt1bml0X2Nhc2UgZXhhbXBsZV90ZXN0X2Nhc2VzW10gPSB7
Cj4gICAgICAgICBLVU5JVF9DQVNFKGV4YW1wbGVfc2ltcGxlX3Rlc3QpLAo+ICAgICAgICAgS1VO
SVRfQ0FTRShleGFtcGxlX21vY2tfdGVzdCksCj4gICAgICAgICB7fQo+IH07Cj4gCj4gRllJLAo+
ICNkZWZpbmUgS1VOSVRfQ0FTRSh0ZXN0X25hbWUpIHsgLnJ1bl9jYXNlID0gdGVzdF9uYW1lLCAu
bmFtZSA9ICN0ZXN0X25hbWUgfQoKPiAKPiBJbiBvcmRlciB0byBkbyB3aGF0IHlvdSBhcmUgcHJv
cG9zaW5nLCBJIHRoaW5rIEkgbmVlZCBhbiBhcnJheSBvZgo+IHBvaW50ZXJzIHRvIHRlc3QgY2Fz
ZXMsIHdoaWNoIGlzIG5vdCBpZGVhbC4KClllYWgsIHlvdSdyZSByaWdodC4gVGhlIG9ubHkgb3Ro
ZXIgYWx0ZXJuYXRpdmUgaXMgdG8gaGF2ZSBhOgoKc3RydWN0IGt1bml0X21vZHVsZSB7CiAgICAg
ICBjb25zdCBjaGFyIG5hbWVbMjU2XTsKICAgICAgIGludCAoKmluaXQpKHN0cnVjdCBrdW5pdCAq
dGVzdCk7CiAgICAgICB2b2lkICgqZXhpdCkoc3RydWN0IGt1bml0ICp0ZXN0KTsKICAgICAgIHN0
cnVjdCBrdW5pdF9jYXNlICp0ZXN0X2Nhc2VzOworICAgICAgIHVuc2lnbmVkIGludCBudW1fY2Fz
ZXM7Cn07CgpBbmQgdGhlbiBzb21ldGhpbmcgbGlrZToKCiNkZWZpbmUgS1VOSVRfTU9EVUxFKG5h
bWUsIGluaXQsIGV4aXQsIGNhc2VzKSB7IFwKCS5uYW1lID0gbmFtZSwgXAoJLmluaXQgPSBpbml0
LCBcCgkuZXhpdCA9IGV4aXQsIFwKCS50ZXN0X2Nhc2VzID0gY2FzZXMsCgludW1fY2FzZXMgPSBB
UlJBWV9TSVpFKGNhc2VzKSwgXAp9CgpMZXQncyBldmFsdWF0ZSB3aGljaCBpcyBiZXR0ZXI6IG9u
ZSBleHRyYSB0ZXN0IGNhc2UgcGVyIGFsbCB0ZXN0IGNhc2VzLCBvcgphbiBleHRyYSB1bnNpZ25l
ZCBpbnQgZm9yIGVhY2gga3VuaXQgbW9kdWxlLgoKICBMdWlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
