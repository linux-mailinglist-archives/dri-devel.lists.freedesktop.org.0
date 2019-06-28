Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC85A65D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 23:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11B6E922;
	Fri, 28 Jun 2019 21:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FE16E922
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 21:37:34 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t7so3928704plr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 14:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgAuNdeYgPOaJAXJWPitQxb9O77ltQQoo3H5OkHlS/c=;
 b=fKvCTxtsqRFoHrSqyBIfIczjq+C1vRbQ5sInsMOpyJkY/ySXLfzfZhgk3TcNvldxfX
 XM/3ueDCgyvI/rA2AOEnNP1UnQwMOZBn6jvvEe9PZNxLAZ2U3WmqR2JXdjgO7oEo5iaf
 znao+MeZj/TpjfonnH05VxVyBs34IZ2jG3l0RRaE4diKmIvGRUVh31JcDzWihOdLgyC1
 dLqnWsEEjYwhHmdNFJ28r61PRNwScFC0fRWA9ItRfaaN0nm7lVOSKE1XtfNYnVXe8KQg
 wR91K51iplh7GOuODuhtcadrz+ye1QvwoGbTW6aSlH2w7DcExxGIa6zWEoiP37zW6d6a
 6uuA==
X-Gm-Message-State: APjAAAX9kPLiz4JkRk4fEcLrfIPk2dVshsH9EVjufR4B6+hsBTKPNp9I
 P0fI+FsMuKQwpoyQXTX168c=
X-Google-Smtp-Source: APXvYqy5ELfDL2fyyn/y9lJ8x6ZZyU+/eE48fR92CyznGhgcBuNDCxdNuVcUesc0a2YsMUSVisIbkg==
X-Received: by 2002:a17:902:a60d:: with SMTP id
 u13mr6000172plq.144.1561757853454; 
 Fri, 28 Jun 2019 14:37:33 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id b15sm3215119pfi.141.2019.06.28.14.37.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 14:37:32 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 8049D402AC; Fri, 28 Jun 2019 21:37:31 +0000 (UTC)
Date: Fri, 28 Jun 2019 21:37:31 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v5 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190628213731.GJ19023@42.do-not-panic.com>
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-18-brendanhiggins@google.com>
 <20190626021744.GU19023@42.do-not-panic.com>
 <CAAXuY3p+kVhjQ4LYtzormqVcH2vKu1abc_K9Z0XY=JX=bp8NcQ@mail.gmail.com>
 <20190627061021.GE19023@42.do-not-panic.com>
 <CAFd5g45VJ9yfuESUc=E0ydJyN+mk1b1kyHSCYvO2x9KPC7+3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g45VJ9yfuESUc=E0ydJyN+mk1b1kyHSCYvO2x9KPC7+3GQ@mail.gmail.com>
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
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 David Rientjes <rientjes@google.com>, Iurii Zaikin <yzaikin@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, Kees Cook <keescook@google.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Josh Poimboeuf <jpoimboe@redhat.com>,
 kunit-dev@googlegroups.com, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDE6MDE6NTRBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDExOjEwIFBNIEx1aXMgQ2hhbWJlcmxh
aW4gPG1jZ3JvZkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAx
OSBhdCAwOTowNzo0M1BNIC0wNzAwLCBJdXJpaSBaYWlraW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwg
SnVuIDI1LCAyMDE5IGF0IDc6MTcgUE0gTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIHN5c2N0bF90ZXN0X2RvaW50dmVjX3Rh
YmxlX21heGxlbl91bnNldChzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gPiA+ID4gPiArewo+ID4gPiA+
ID4gKyAgICAgc3RydWN0IGN0bF90YWJsZSB0YWJsZSA9IHsKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgLnByb2NuYW1lID0gImZvbyIsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5kYXRhICAgICAg
ICAgICA9ICZ0ZXN0X2RhdGEuaW50XzAwMDEsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5tYXhs
ZW4gICAgICAgICA9IDAsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5tb2RlICAgICAgICAgICA9
IDA2NDQsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5wcm9jX2hhbmRsZXIgICA9IHByb2NfZG9p
bnR2ZWMsCj4gPiA+ID4gPiArICAgICAgICAgICAgIC5leHRyYTEgICAgICAgICA9ICZpX3plcm8s
Cj4gPiA+ID4gPiArICAgICAgICAgICAgIC5leHRyYTIgICAgICAgICA9ICZpX29uZV9odW5kcmVk
LAo+ID4gPiA+ID4gKyAgICAgfTsKPiA+ID4gPiA+ICsgICAgIHZvaWQgICpidWZmZXIgPSBrdW5p
dF9remFsbG9jKHRlc3QsIHNpemVvZihpbnQpLCBHRlBfVVNFUik7Cj4gPiA+ID4gPiArICAgICBz
aXplX3QgbGVuOwo+ID4gPiA+ID4gKyAgICAgbG9mZl90IHBvczsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsgICAgIGxlbiA9IDEyMzQ7Cj4gPiA+ID4gPiArICAgICBLVU5JVF9FWFBFQ1RfRVEodGVz
dCwgMCwgcHJvY19kb2ludHZlYygmdGFibGUsIDAsIGJ1ZmZlciwgJmxlbiwgJnBvcykpOwo+ID4g
PiA+ID4gKyAgICAgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIChzaXplX3QpMCwgbGVuKTsKPiA+ID4g
PiA+ICsgICAgIGxlbiA9IDEyMzQ7Cj4gPiA+ID4gPiArICAgICBLVU5JVF9FWFBFQ1RfRVEodGVz
dCwgMCwgcHJvY19kb2ludHZlYygmdGFibGUsIDEsIGJ1ZmZlciwgJmxlbiwgJnBvcykpOwo+ID4g
PiA+ID4gKyAgICAgS1VOSVRfRVhQRUNUX0VRKHRlc3QsIChzaXplX3QpMCwgbGVuKTsKPiA+ID4g
PiA+ICt9Cj4gPiA+ID4KPiA+ID4gPiBJbiBhIHdheSB0aGlzIGlzIGFsc28gdGVzdGluZyBmb3Ig
Z2VuZXJhbCBrZXJuZWwgQVBJIGNoYW5nZXMuIFRoaXMgaXMgYW5kIHRoZQo+ID4gPiA+IGxhc3Qg
b25lIHdlcmUgZ29vZCBleGFtcGxlcy4gU28gdGhpcyBpcyBub3QganVzdCB0ZXN0aW5nIGZ1bmN0
aW9uYWxpdHkKPiA+ID4gPiBoZXJlLiBUaGVyZSBpcyBubyB3cm9uZyBvciB3cml0ZSBhbnN3ZXIg
aWYgMCBvciAtRUlOVkFMIHdhcyByZXR1cm5lZAo+ID4gPiA+IG90aGVyIHRoYW4gdGhlIGZhY3Qg
dGhhdCB3ZSBoYXZlIGJlZW4gZG9pbmcgdGhpcyBmb3IgeWVhcnMuCj4gPiA+ID4KPiA+ID4gPiBJ
dHMgYSBwZXJoYXBzIHNtYWxsIGJ1dCBpbXBvcnRhbnQgZGlmZmVyZW5jZSBmb3Igc29tZSBvZiB0
aGVzZSB0ZXN0cy4gIEkKPiA+ID4gPiAqZG8qIHRoaW5rIGl0cyB3b3J0aCBjbGFyaWZ5aW5nIHRo
cm91Z2ggZG9jdW1lbnRhdGlvbiB3aGljaCBvbmVzIGFyZQo+ID4gPiA+IHRlc3RpbmcgZm9yIEFQ
SSBjb25zaXN0ZW5jeSBWcyBwcm9wZXIgY29ycmVjdG5lc3MuCj4gPiA+Cj4gPiA+IFlvdSBtYWtl
IGEgZ29vZCBwb2ludCB0aGF0IHRoZSB0ZXN0IGNvZGlmaWVzIHRoZSBleGlzdGluZyBiZWhhdmlv
ciBvZgo+ID4gPiB0aGUgZnVuY3Rpb24gaW4gbGlldSBvZiBmb3JtYWwgZG9jdW1lbnRhdGlvbi4g
IEhvd2V2ZXIsIHRoZSB0ZXN0IGNhc2VzCj4gPiA+IHdlcmUgZGVyaXZlZCBmcm9tIGV4YW1pbmlu
ZyB0aGUgc291cmNlIGNvZGUgb2YgdGhlIGZ1bmN0aW9uIHVuZGVyIHRlc3QKPiA+ID4gYW5kIGF0
dGVtcHRpbmcgdG8gY292ZXIgYWxsIGJyYW5jaGVzLiBUaGUgYXNzZXJ0aW9ucyB3ZXJlIGFkZGVk
IG9ubHkKPiA+ID4gZm9yIHRoZSB2YWx1ZXMgdGhhdCBhcHBlYXJlZCB0byBiZSBzZXQgZGVsaWJl
cmF0ZWx5IGluIHRoZQo+ID4gPiBpbXBsZW1lbnRhdGlvbi4gQW5kIGl0IG1ha2VzIHNlbnNlIHRv
IG1lIHRvIHRlc3QgdGhhdCB0aGUgY29kZSBkb2VzCj4gPiA+IGV4YWN0bHkgd2hhdCB0aGUgaW1w
bGVtZW50YXRpb24gYXV0aG9yIGludGVuZGVkLgo+ID4KPiA+IEknbSBub3QgYXJndWluZyBhZ2Fp
bnN0IGFkZGluZyB0aGVtLiBJJ20gc3VnZ2VzdGluZyB0aGF0IGl0IGlzIGRpZmZlcmVudAo+ID4g
dG8gdGVzdCBmb3IgQVBJIHRoYW4gZm9yIGNvcnJlY3RuZXNzIG9mIGludGVuZGVkIGZ1bmN0aW9u
YWxpdHksIGFuZAo+ID4gaXQgd291bGQgYmUgd2lzZSB0byBtYWtlIGl0IGNsZWFyIHdoaWNoIHRl
c3QgY2FzZXMgYXJlIGZvciBBUEkgYW5kIHdoaWNoCj4gPiBmb3IgY29ycmVjdG5lc3MuCj4gCj4g
SSBzZWUgbGF0ZXIgb24gdGhhdCBzb21lIG9mIHRoZSBBUEkgc3R1ZmYgeW91IGFyZSB0YWxraW5n
IGFib3V0IGlzCj4gcHVibGljIEFQSXMgZnJvbSB0aGUgc3RhbmRwb2ludCBvZiB1c2VyIChvdXRz
aWRlIG9mIExJbnV4KSB2aXNpYmxlLgoKUmlnaHQsIFVBUEkuCgo+IFRvCj4gYmUgY2xlYXIsIGlz
IHRoYXQgd2hhdCB5b3UgbWVhbiBieSBwdWJsaWMgQVBJcyB0aHJvdWdob3V0LCBvciB3b3VsZAo+
IHlvdSBkaXN0aW5ndWlzaCBiZXR3ZWVuIGNvcnJlY3RuZXNzIHRlc3RzLCBpbnRlcm5hbCBBUEkg
dGVzdHMsIGFuZAo+IGV4dGVybmFsIEFQSSB0ZXN0cz8KCkkgd291bGQgZGVmaW5pdGVseSByZWNv
bW1lbmQgZGlzdGluZ2lzaGluZyBiZXR3ZWVuIGFsbCBvZiB0aGVzZS4KS2VybmVsIEFQSSAob3Ig
anVzdCBjYWxsIGl0IEFQSSksIFVBUEksIGFuZCBjb3JyZWN0bmVzcy4KCj4gPiBUaGlzIHdpbGwg
Y29tZSB1cCBsYXRlciBmb3Igb3RoZXIga3VuaXQgdGVzdHMgYW5kIGl0IHdvdWxkIGJlIGdyZWF0
Cj4gPiB0byBzZXQgcHJlY2VuZGVudCBzbyB0aGF0IG90aGVyIGt1bml0IHRlc3RzIGNhbiBmb2xs
b3cgc2ltaWxhcgo+ID4gcHJhY3RpY2VzIHRvIGVuc3VyZSBpdHMgY2xlYXIgd2hhdCBpcyBBUEkg
cmVhbHRlZCBWcyBjb3JyZWN0bmVzcyBvZgo+ID4gaW50ZW5kZWQgZnVuY3Rpb25hbGl0eS4KPiA+
Cj4gPiBJbiBmYWN0LCBJJ20gbm90IHlldCBzdXJlIGlmIGl0cyBwb3NzaWJsZSB0byB0ZXN0IHB1
YmxpYyBrZXJuZWwgQVBJIHRvCj4gPiB1c2Vyc3BhY2Ugd2l0aCBrdW5pdCwgYnV0IGlmIGl0IGlz
IHBvc3NpYmxlLi4uIHdlbGwsIHRoYXQgY291bGQgbWFrZQo+ID4gbGludXgtYXBpIGZvbGtzIGhh
cHB5IGFzIHRoZXkgY291bGQgZW5hYmxlIHVzIHRvIGNvZGlmeSBpbnRlcnByZWF0aW9uIG9mCj4g
PiB3aGF0IGlzIGV4cGVjdGVkIGludG8ga3VuaXQgdGVzdCBjYXNlcywgYW5kIHdlJ2QgZW5zdXJl
IHRoYXQgdGhlCj4gPiBjb2RpZmllZCBpbnRlcnByZXRhdGlvbiBpcyBub3Qgb25seSBkb2N1bWVu
dGVkIGluIG1hbiBwYWdlcyBidXQgYWxzbwo+ID4gdGhyb3VnaCBmb3JtYWwga3VuaXQgdGVzdCBj
YXNlcy4KPiA+Cj4gPiBBIHJlZ3Jlc3Npb24gaW4gbGludXgtYXBpIHRoZW4gY291bGQgYmUgZm9y
bWFsaXplZCB0aHJvdWdoIGEgcHJvcGVyCj4gPiBrdW5pdCB0ZXN0cyBjYXNlLiBBbmQgaWYgYW4g
QVBJIGV2b2x2ZXMsIGl0IHdvdWxkIGZvcmNlIGRldmVsb3BlcnMgdG8KPiA+IHVwZGF0ZSB0aGUg
cmVzcGVjdGl2ZSBrdW5pdCB3aGljaCBjb2RpZmllcyB0aGF0IGNvbnRyYWN0Lgo+IAo+IFllcCwg
SSB0aGluayB0aGF0IGlzIGxvbmcgdGVybSBob3BlLiBTb21lIG9mIHRoZSBmaWxlIHN5c3RlbSBp
bnRlcmZhY2UKPiBzdHVmZiB0aGF0IHJlcXVpcmVzIGEgZmlsZXN5c3RlbSB0byBiZSBtb3VudGVk
IHNvbWV3aGVyZSBtaWdodCBnZXQgYQo+IGxpdHRsZSB3ZWlyZC9kaWZmaWN1bHQsIGJ1dCBJIHN1
c3BlY3Qgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gaXQKPiBldmVudHVhbGx5LiBJIG1lYW4gaXQn
cyBhbGwganVzdCBDIGNvZGUgcmlnaHQ/IFNob3VsZCBtb3N0bHkgYm9pbCBkb3duCj4gdG8gc29t
ZW9uZSBmaWd1cmluZyBvdXQgaG93IHRvIGRvIGl0IHRoZSBmaXJzdCB0aW1lLgoKVGhlcmUgdXNl
ZCB0byBiZSBoYWNrcyBpbiB0aGUga2VybmVsIHRoZSBjYWxsIHN5c2NhbGxzIGluIGEgZmV3IHBs
YWNlcy4KVGhpcyB3YXMgY2xlYW5lZCB1cCBhbmQgYWRkcmVzc2VkIHZpYSBEb21pbmlrIEJyb2Rv
d3NraSdzIHNlcmllcyBsYXN0CnllYXIgaW4gTWFyY2g6CgpodHRwOi8vbGttbC5rZXJuZWwub3Jn
L3IvMjAxODAzMjUxNjI1MjcuR0ExNzQ5MkBsaWdodC5kb21pbmlrYnJvZG93c2tpLm5ldAoKQW4g
ZXhhbXBsZSBjb21taXQ6IGQzMDBiNjEwODEyZjMgKCJrZXJuZWw6IHVzZSBrZXJuZWxfd2FpdDQo
KSBpbnN0ZWFkIG9mCnN5c193YWl0NCgpIikuCgpTbyBpdCB3b3VsZCBzZWVtIHRoZSB3b3JrIGlz
IGRvbmUsIGFuZCB5b3UnZCBqdXN0IGhhdmUgdG8gdXNlIHRoZQpyZXNwZWN0aXZlIGV4cG9zZWQg
a2VybmVsX3N5c2NhbGxuYW1lKCkgY2FsbHMsIG9yIGFkZCBzb21lIGlmIHlvdQp3YW50IHRvIHRl
c3QgYSBzcGVjaWZpYyBzeXNjYWxsIGluIGtlcm5lbCBzcGFjZS4KCiAgTHVpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
