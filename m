Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8E5742F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 00:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C2C6E52F;
	Wed, 26 Jun 2019 22:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D916E52F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 22:16:49 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d126so154081pfd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 15:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GeRJM7RinPoMIQ6Cxu4JfD/FJhf/Q7830l4heE4Z/70=;
 b=XKKHRX9n+CpA1MAAjuH9PFci6rNKkaHs/lcuM6w+kkiuFJ9vsT+V4u5myg/tEXtu5G
 +ObOLRhjVAm88N7Kcw3HPQtHuev6WlHfo2jNrPI9Iqt5oS9AZ/qfml6EdZD97Vj+0XW3
 1oIml3wsAI5p1asRY6dgyov2B6xgZ5jdseVbP2NluoH2GoWcGnTkJDRwFk+IE+rqbUC/
 5NNXExQXeN9xfyJY7ioXojFA+vtwZWAG09fRQcfHijMse2uOvfs6IgqAk0wofJq7VbkR
 LiaFtznkd3r+vPj6m2BdjO2XLO94FolTf38nrn7G+3Q4RvtsKGzdhS3iD4dy3SiROvuN
 NjkQ==
X-Gm-Message-State: APjAAAV/oRXOw8Cje9DE5echwpoZ739dWNYoXlDgivI3kahOsNw4MW4F
 feSA8+8ikDXig0npsVQu/xnafL4MTFTvgekvF+5adQ==
X-Google-Smtp-Source: APXvYqzsQMLB7isztv92bzu5YXVWaHFQchBB4ZbMDdOvCDM8VotktY7nYV0uIl6GRCqZMb6GciobJW+UAft7ArjB2vg=
X-Received: by 2002:a17:90b:f0e:: with SMTP id
 br14mr1630712pjb.117.1561587408779; 
 Wed, 26 Jun 2019 15:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190625223312.GP19023@42.do-not-panic.com>
 <CAFd5g46TLAONgXiZkFM98BPd-sariMTwhmYG9hSJ+M9=r-ixeg@mail.gmail.com>
 <20190626033643.GX19023@42.do-not-panic.com>
In-Reply-To: <20190626033643.GX19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 26 Jun 2019 15:16:36 -0700
Message-ID: <CAFd5g45PTtPumkpp1i41kkixZaR55pbqaF2DsuKNmh5UyAVwOg@mail.gmail.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=GeRJM7RinPoMIQ6Cxu4JfD/FJhf/Q7830l4heE4Z/70=;
 b=S6f2tU7Miw4rgiEW47807L33bYsjxaGq9kSV5FlqDefi2WxZ9lTn6WNXPehPhg/T1u
 QlukqMtHkRexD1aKOxiS1bTcFztoPMq6vRmfl07xvAlF8qkmKEYcRYv6yewHpyrNh/C2
 b54UNQQh2z4Ml5QHakDNUwkkVSa3wpee9qOwZX656U2rr12uOzmYMsnmgvSxd7nO2lJu
 uPRgbm1UzaYtxmtry6zEXpmUHhjd6DhSWjC+3Gn8V/HQxryzbZ7pGyLo06Eq0gUDpp5U
 DjOJXTOOdEhiALmttRxHwycmxPuBaL40MgKhCWjDKs1lUcvOyyLeVeXFZ4cT8o8pd53u
 IzAw==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgODozNiBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwNTowNzozMlBN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBh
dCAzOjMzIFBNIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MjU6NTZBTSAtMDcwMCwgQnJlbmRh
biBIaWdnaW5zIHdyb3RlOgo+ID4gPiA+ICsvKioKPiA+ID4gPiArICogbW9kdWxlX3Rlc3QoKSAt
IHVzZWQgdG8gcmVnaXN0ZXIgYSAmc3RydWN0IGt1bml0X21vZHVsZSB3aXRoIEtVbml0Lgo+ID4g
PiA+ICsgKiBAbW9kdWxlOiBhIHN0YXRpY2FsbHkgYWxsb2NhdGVkICZzdHJ1Y3Qga3VuaXRfbW9k
dWxlLgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBSZWdpc3RlcnMgQG1vZHVsZSB3aXRoIHRoZSB0
ZXN0IGZyYW1ld29yay4gU2VlICZzdHJ1Y3Qga3VuaXRfbW9kdWxlIGZvciBtb3JlCj4gPiA+ID4g
KyAqIGluZm9ybWF0aW9uLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArI2RlZmluZSBtb2R1bGVfdGVz
dChtb2R1bGUpIFwKPiA+ID4gPiArICAgICAgICAgICAgIHN0YXRpYyBpbnQgbW9kdWxlX2t1bml0
X2luaXQjI21vZHVsZSh2b2lkKSBcCj4gPiA+ID4gKyAgICAgICAgICAgICB7IFwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGt1bml0X3J1bl90ZXN0cygmbW9kdWxlKTsgXAo+
ID4gPiA+ICsgICAgICAgICAgICAgfSBcCj4gPiA+ID4gKyAgICAgICAgICAgICBsYXRlX2luaXRj
YWxsKG1vZHVsZV9rdW5pdF9pbml0IyNtb2R1bGUpCj4gPiA+Cj4gPiA+IEJlY3Vhc2UgbGF0ZV9p
bml0Y2FsbCgpIGlzIHVzZWQsIGlmIHRoZXNlIG1vZHVsZXMgYXJlIGJ1aWx0LWluLCB0aGlzCj4g
PiA+IHdvdWxkIHByZWNsdWRlIHRoZSBhYmlsaXR5IHRvIHRlc3QgdGhpbmdzIHByaW9yIHRvIHRo
aXMgcGFydCBvZiB0aGUKPiA+ID4ga2VybmVsIHVuZGVyIFVNTCBvciB3aGF0ZXZlciBhcmNoaXRl
Y3R1cmUgcnVucyB0aGUgdGVzdHMuIFNvLCB0aGlzCj4gPiA+IGxpbWl0cyB0aGUgc2NvcGUgb2Yg
dGVzdGluZy4gU21hbGwgZGV0YWlsIGJ1dCB0aGUgc2NvcGUgd2hvdWxkIGJlCj4gPiA+IGRvY3Vt
ZW50ZWQuCj4gPgo+ID4gWW91IGFyZW4ndCB0aGUgZmlyc3QgcGVyc29uIHRvIGNvbXBsYWluIGFi
b3V0IHRoaXMgKGFuZCBJIGFtIG5vdCBzdXJlCj4gPiBpdCBpcyB0aGUgZmlyc3QgdGltZSB5b3Ug
aGF2ZSBjb21wbGFpbmVkIGFib3V0IGl0KS4gQW55d2F5LCBJIGhhdmUKPiA+IHNvbWUgZm9sbG93
IG9uIHBhdGNoZXMgdGhhdCB3aWxsIGltcHJvdmUgdGhlIGxhdGVfaW5pdGNhbGwgdGhpbmcsIGFu
ZAo+ID4gcGVvcGxlIHNlZW1lZCBva2F5IHdpdGggZGlzY3Vzc2luZyB0aGUgZm9sbG93IG9uIHBh
dGNoZXMgYXMgcGFydCBvZiBhCj4gPiBzdWJzZXF1ZW50IHBhdGNoc2V0IGFmdGVyIHRoaXMgZ2V0
cyBtZXJnZWQuCj4gPgo+ID4gSSB3aWxsIG5ldmVydGhlbGVzcyBkb2N1bWVudCB0aGUgcmVzdHJp
Y3Rpb24gdW50aWwgdGhlbi4KPgo+IFRvIGJlIGNsZWFyLCBJIGFtIG5vdCBjb21wbGFpbmluZyBh
Ym91dCBpdC4gSSBqdXN0IGZpbmQgaXQgc2ltcGx5Cj4gY3JpdGljYWwgdG8gZG9jdW1lbnQgaXRz
IGxpbWl0YXRpb25zLCBzbyBmb2xrcyBkb24ndCB0cnkgdG8gaW52ZXN0Cj4gdGltZSBhbmQgZW5l
cmd5IG9uIGt1bml0IHJpZ2h0IGF3YXkgZm9yIGFuIGVhcmx5IGluaXQgdGVzdCwgaWYgaXQKPiBj
YW5ub3Qgc3VwcG9ydCBpdC4KPgo+IElmIHN1cHBvcnQgZm9yIHRoYXQgcmVxdWlyZXMgc29tZSB3
b3JrLCBpdCBtYXkgYmUgd29ydGggbWVudGlvbmluZwo+IGFzIHdlbGwuCgpNYWtlcyBzZW5zZS4g
QW5kIGluIGFueWNhc2UsIGl0IGlzIHNvbWV0aGluZyBJIGRvIHdhbnQgdG8gZG8sIGp1c3Qgbm90
CnJpZ2h0IG5vdy4gSSB3aWxsIHB1dCBhIFRPRE8gaGVyZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4K
Cj4gPiA+ID4gK3N0YXRpYyB2b2lkIGt1bml0X3ByaW50X3RhcF92ZXJzaW9uKHZvaWQpCj4gPiA+
ID4gK3sKPiA+ID4gPiArICAgICBpZiAoIWt1bml0X2hhc19wcmludGVkX3RhcF92ZXJzaW9uKSB7
Cj4gPiA+ID4gKyAgICAgICAgICAgICBrdW5pdF9wcmludGtfZW1pdChMT0dMRVZFTF9JTkZPLCAi
VEFQIHZlcnNpb24gMTRcbiIpOwo+ID4gPgo+ID4gPiBXaGF0IGlzIHRoaXMgVEFQIHRoaW5nPyBX
aHkgc2hvdWxkIHdlIGNhcmUgd2hhdCB2ZXJzaW9uIGl0IGlzIG9uPwo+ID4gPiBXaHkgYXJlIHdl
IHByaW50aW5nIHRoaXM/Cj4gPgo+ID4gSXQncyBwYXJ0IG9mIHRoZSBUQVAgc3BlY2lmaWNhdGlv
blsxXS4gR3JlZyBhbmQgRnJhbmsgYXNrZWQgbWUgdG8gbWFrZQo+ID4gdGhlIGludGVybWVkaWF0
ZSBmb3JtYXQgY29uZm9ybSB0byBUQVAuIFNlZW1zIGxpa2Ugc29tZXRoaW5nIGVsc2UgSQo+ID4g
c2hvdWxkIHByb2JhYmxlIGRvY3VtZW50Li4uCj4KPiBZZXMgdGhhbmtzIQo+Cj4gPiA+ID4gKyAg
ICAgICAgICAgICBrdW5pdF9oYXNfcHJpbnRlZF90YXBfdmVyc2lvbiA9IHRydWU7Cj4gPiA+ID4g
KyAgICAgfQo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgc2l6ZV90IGt1bml0
X3Rlc3RfY2FzZXNfbGVuKHN0cnVjdCBrdW5pdF9jYXNlICp0ZXN0X2Nhc2VzKQo+ID4gPiA+ICt7
Cj4gPiA+ID4gKyAgICAgc3RydWN0IGt1bml0X2Nhc2UgKnRlc3RfY2FzZTsKPiA+ID4gPiArICAg
ICBzaXplX3QgbGVuID0gMDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgZm9yICh0ZXN0X2Nhc2Ug
PSB0ZXN0X2Nhc2VzOyB0ZXN0X2Nhc2UtPnJ1bl9jYXNlOyB0ZXN0X2Nhc2UrKykKPiA+ID4KPiA+
ID4gSWYgd2UgbWFrZSB0aGUgbGFzdCB0ZXN0IGNhc2UgTlVMTCwgd2UnZCBqdXN0IGNoZWNrIGZv
ciB0ZXN0X2Nhc2UgaGVyZSwKPiA+ID4gYW5kIHNhdmUgb3Vyc2VsdmVzIGFuIGV4dHJhIGZldyBi
eXRlcyBwZXIgdGVzdCBtb2R1bGUuIEFueSByZWFzb24gd2h5Cj4gPiA+IHRoZSBsYXN0IHRlc3Qg
Y2FzZSBjYW5ub3QgYmUgTlVMTD8KPiA+Cj4gPiBJcyB0aGVyZSBhbnl3YXkgdG8gbWFrZSB0aGF0
IHdvcmsgd2l0aCBhIHN0YXRpY2FsbHkgZGVmaW5lZCBhcnJheT8KPgo+IE5vIHlvdSdyZSByaWdo
dC4KPgo+ID4gQmFzaWNhbGx5LCBJIHdhbnQgdG8gYmUgYWJsZSB0byBkbyBzb21ldGhpbmcgbGlr
ZToKPiA+Cj4gPiBzdGF0aWMgc3RydWN0IGt1bml0X2Nhc2UgZXhhbXBsZV90ZXN0X2Nhc2VzW10g
PSB7Cj4gPiAgICAgICAgIEtVTklUX0NBU0UoZXhhbXBsZV9zaW1wbGVfdGVzdCksCj4gPiAgICAg
ICAgIEtVTklUX0NBU0UoZXhhbXBsZV9tb2NrX3Rlc3QpLAo+ID4gICAgICAgICB7fQo+ID4gfTsK
PiA+Cj4gPiBGWUksCj4gPiAjZGVmaW5lIEtVTklUX0NBU0UodGVzdF9uYW1lKSB7IC5ydW5fY2Fz
ZSA9IHRlc3RfbmFtZSwgLm5hbWUgPSAjdGVzdF9uYW1lIH0KPgo+ID4KPiA+IEluIG9yZGVyIHRv
IGRvIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcsIEkgdGhpbmsgSSBuZWVkIGFuIGFycmF5IG9mCj4g
PiBwb2ludGVycyB0byB0ZXN0IGNhc2VzLCB3aGljaCBpcyBub3QgaWRlYWwuCj4KPiBZZWFoLCB5
b3UncmUgcmlnaHQuIFRoZSBvbmx5IG90aGVyIGFsdGVybmF0aXZlIGlzIHRvIGhhdmUgYToKPgo+
IHN0cnVjdCBrdW5pdF9tb2R1bGUgewo+ICAgICAgICBjb25zdCBjaGFyIG5hbWVbMjU2XTsKPiAg
ICAgICAgaW50ICgqaW5pdCkoc3RydWN0IGt1bml0ICp0ZXN0KTsKPiAgICAgICAgdm9pZCAoKmV4
aXQpKHN0cnVjdCBrdW5pdCAqdGVzdCk7Cj4gICAgICAgIHN0cnVjdCBrdW5pdF9jYXNlICp0ZXN0
X2Nhc2VzOwo+ICsgICAgICAgdW5zaWduZWQgaW50IG51bV9jYXNlczsKPiB9Owo+Cj4gQW5kIHRo
ZW4gc29tZXRoaW5nIGxpa2U6Cj4KPiAjZGVmaW5lIEtVTklUX01PRFVMRShuYW1lLCBpbml0LCBl
eGl0LCBjYXNlcykgeyBcCj4gICAgICAgICAubmFtZSA9IG5hbWUsIFwKPiAgICAgICAgIC5pbml0
ID0gaW5pdCwgXAo+ICAgICAgICAgLmV4aXQgPSBleGl0LCBcCj4gICAgICAgICAudGVzdF9jYXNl
cyA9IGNhc2VzLAo+ICAgICAgICAgbnVtX2Nhc2VzID0gQVJSQVlfU0laRShjYXNlcyksIFwKPiB9
Cj4KPiBMZXQncyBldmFsdWF0ZSB3aGljaCBpcyBiZXR0ZXI6IG9uZSBleHRyYSB0ZXN0IGNhc2Ug
cGVyIGFsbCB0ZXN0IGNhc2VzLCBvcgo+IGFuIGV4dHJhIHVuc2lnbmVkIGludCBmb3IgZWFjaCBr
dW5pdCBtb2R1bGUuCgpJIGFtIGluIGZhdm9yIG9mIHRoZSBjdXJyZW50IG1ldGhvZCBzaW5jZSBp
bml0IGFuZCBleGl0IGFyZSBvcHRpb25hbAphcmd1bWVudHMuIEkgY291bGQgc2VlIG15c2VsZiAo
YWN0dWFsbHkgSSBhbSBwbGFubmluZyBvbikgYWRkaW5nIG1vcmUKb3B0aW9uYWwgdGhpbmdzIHRv
IHRoZSBrdW5pdF9tb2R1bGUsIHNvIGhhdmluZyBvcHRpb25hbCBhcmd1bWVudHMgd2lsbAptYWtl
IG15IGxpZmUgYSBsb3QgZWFzaWVyIHNpbmNlIEkgd29uJ3QgaGF2ZSB0byBnbyB0aHJvdWdoIGJp
ZwpyZWZhY3RvcmluZ3MgYXJvdW5kIHRoZSBrZXJuZWwgdG8gc3VwcG9ydCBuZXcgZmVhdHVyZXMg
dGhhdCB0aWUgaW4KaGVyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
