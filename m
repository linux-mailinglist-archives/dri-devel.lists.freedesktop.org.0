Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C144855CCD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 02:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E266E1BE;
	Wed, 26 Jun 2019 00:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CE36E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 00:07:45 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w10so237965pgj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0CKSZbZdZTCXDsFevmx6xy0jVDdxhx+j1rEEB3vl63s=;
 b=Y0YPX9FyMahYjzwJfGLZRUm/GaogWP7Rd8+rCsG3AbzBJpmAe35iYQixw2gKjAgbHv
 kCG648wttqwKvzqYdF4GLjqXoimJFblo0mteniMVg8enEg92Cuqvcg/2yDWYPQog1+NL
 1srNCqm4yGp4M3teDPOmVqXJLO8uRW3TNsvbgLE20vZQ+9wBsXNb8wB/uAoPBXMi0+Z5
 Efk0JjYQRm9KUiH3hx8wfo2JwCjBRnm5NCKah9FBctTQObT05stuBAnhAH6sWLEfAxja
 /JnWfrUXwqP9nrWMnWp5zL/bRYw3fQwU/Y2IdW6EsodGzcG9vhJIzJa/2kr224VYqtfB
 XhkQ==
X-Gm-Message-State: APjAAAX1V8JAbrULsZMrHVxH41TIj7Sg5M2m09gPz2NeP2gpu8mxBcIC
 zwCwEYsu3tiQxpG9HlPgGKLslyeqk72Pnk4MMzF8FA==
X-Google-Smtp-Source: APXvYqwFUlf+fXcTuEW4suwRhf8sO2Hw8q7BLLIj3tSrVcwKVl/cK8K/AXXabwkRnwCip/wX7DtGYsxR83H1S/Y9Z64=
X-Received: by 2002:a17:90a:be0d:: with SMTP id
 a13mr657604pjs.84.1561507663974; 
 Tue, 25 Jun 2019 17:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-2-brendanhiggins@google.com>
 <20190625223312.GP19023@42.do-not-panic.com>
In-Reply-To: <20190625223312.GP19023@42.do-not-panic.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Jun 2019 17:07:32 -0700
Message-ID: <CAFd5g46TLAONgXiZkFM98BPd-sariMTwhmYG9hSJ+M9=r-ixeg@mail.gmail.com>
Subject: Re: [PATCH v5 01/18] kunit: test: add KUnit test runner core
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0CKSZbZdZTCXDsFevmx6xy0jVDdxhx+j1rEEB3vl63s=;
 b=Udp0DSI1eicbAQ93CL5kbvi8Xp/6zCCrOWD+4my5+Z2KobfpntEZptXwNDN+m1HYdl
 aWzrSvRzjBSRt+1Ke5gfgolTpuldTSDWCwjjFSm2u0fallCYK2AWnGnpndlL89sFN0Zl
 GTwNluZIxE+q2xxZzY/SPhBF2gsVikHJ199bU9KJdjOqqrHUctG5Or1EMQYsJztcsOoC
 DiYGphxIA91H14nI8J5aNbvthpK6V9fOCpd2OHMJOcinqK81dIeXjiZaAKjLmKAP2Jwx
 0nEa6ArcVSNjpUjZHNws6GQlmspmdwUJ/ZxXDeWnV3qF6zllsbtRDaXwGrbAJh9mZIai
 k2MA==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMzozMyBQTSBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwMToyNTo1NkFN
IC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiArLyoqCj4gPiArICogbW9kdWxlX3Rl
c3QoKSAtIHVzZWQgdG8gcmVnaXN0ZXIgYSAmc3RydWN0IGt1bml0X21vZHVsZSB3aXRoIEtVbml0
Lgo+ID4gKyAqIEBtb2R1bGU6IGEgc3RhdGljYWxseSBhbGxvY2F0ZWQgJnN0cnVjdCBrdW5pdF9t
b2R1bGUuCj4gPiArICoKPiA+ICsgKiBSZWdpc3RlcnMgQG1vZHVsZSB3aXRoIHRoZSB0ZXN0IGZy
YW1ld29yay4gU2VlICZzdHJ1Y3Qga3VuaXRfbW9kdWxlIGZvciBtb3JlCj4gPiArICogaW5mb3Jt
YXRpb24uCj4gPiArICovCj4gPiArI2RlZmluZSBtb2R1bGVfdGVzdChtb2R1bGUpIFwKPiA+ICsg
ICAgICAgICAgICAgc3RhdGljIGludCBtb2R1bGVfa3VuaXRfaW5pdCMjbW9kdWxlKHZvaWQpIFwK
PiA+ICsgICAgICAgICAgICAgeyBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGt1
bml0X3J1bl90ZXN0cygmbW9kdWxlKTsgXAo+ID4gKyAgICAgICAgICAgICB9IFwKPiA+ICsgICAg
ICAgICAgICAgbGF0ZV9pbml0Y2FsbChtb2R1bGVfa3VuaXRfaW5pdCMjbW9kdWxlKQo+Cj4gQmVj
dWFzZSBsYXRlX2luaXRjYWxsKCkgaXMgdXNlZCwgaWYgdGhlc2UgbW9kdWxlcyBhcmUgYnVpbHQt
aW4sIHRoaXMKPiB3b3VsZCBwcmVjbHVkZSB0aGUgYWJpbGl0eSB0byB0ZXN0IHRoaW5ncyBwcmlv
ciB0byB0aGlzIHBhcnQgb2YgdGhlCj4ga2VybmVsIHVuZGVyIFVNTCBvciB3aGF0ZXZlciBhcmNo
aXRlY3R1cmUgcnVucyB0aGUgdGVzdHMuIFNvLCB0aGlzCj4gbGltaXRzIHRoZSBzY29wZSBvZiB0
ZXN0aW5nLiBTbWFsbCBkZXRhaWwgYnV0IHRoZSBzY29wZSB3aG91bGQgYmUKPiBkb2N1bWVudGVk
LgoKWW91IGFyZW4ndCB0aGUgZmlyc3QgcGVyc29uIHRvIGNvbXBsYWluIGFib3V0IHRoaXMgKGFu
ZCBJIGFtIG5vdCBzdXJlCml0IGlzIHRoZSBmaXJzdCB0aW1lIHlvdSBoYXZlIGNvbXBsYWluZWQg
YWJvdXQgaXQpLiBBbnl3YXksIEkgaGF2ZQpzb21lIGZvbGxvdyBvbiBwYXRjaGVzIHRoYXQgd2ls
bCBpbXByb3ZlIHRoZSBsYXRlX2luaXRjYWxsIHRoaW5nLCBhbmQKcGVvcGxlIHNlZW1lZCBva2F5
IHdpdGggZGlzY3Vzc2luZyB0aGUgZm9sbG93IG9uIHBhdGNoZXMgYXMgcGFydCBvZiBhCnN1YnNl
cXVlbnQgcGF0Y2hzZXQgYWZ0ZXIgdGhpcyBnZXRzIG1lcmdlZC4KCkkgd2lsbCBuZXZlcnRoZWxl
c3MgZG9jdW1lbnQgdGhlIHJlc3RyaWN0aW9uIHVudGlsIHRoZW4uCgo+ID4gK3N0YXRpYyB2b2lk
IGt1bml0X3ByaW50X3RhcF92ZXJzaW9uKHZvaWQpCj4gPiArewo+ID4gKyAgICAgaWYgKCFrdW5p
dF9oYXNfcHJpbnRlZF90YXBfdmVyc2lvbikgewo+ID4gKyAgICAgICAgICAgICBrdW5pdF9wcmlu
dGtfZW1pdChMT0dMRVZFTF9JTkZPLCAiVEFQIHZlcnNpb24gMTRcbiIpOwo+Cj4gV2hhdCBpcyB0
aGlzIFRBUCB0aGluZz8gV2h5IHNob3VsZCB3ZSBjYXJlIHdoYXQgdmVyc2lvbiBpdCBpcyBvbj8K
PiBXaHkgYXJlIHdlIHByaW50aW5nIHRoaXM/CgpJdCdzIHBhcnQgb2YgdGhlIFRBUCBzcGVjaWZp
Y2F0aW9uWzFdLiBHcmVnIGFuZCBGcmFuayBhc2tlZCBtZSB0byBtYWtlCnRoZSBpbnRlcm1lZGlh
dGUgZm9ybWF0IGNvbmZvcm0gdG8gVEFQLiBTZWVtcyBsaWtlIHNvbWV0aGluZyBlbHNlIEkKc2hv
dWxkIHByb2JhYmxlIGRvY3VtZW50Li4uCgo+ID4gKyAgICAgICAgICAgICBrdW5pdF9oYXNfcHJp
bnRlZF90YXBfdmVyc2lvbiA9IHRydWU7Cj4gPiArICAgICB9Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyBzaXplX3Qga3VuaXRfdGVzdF9jYXNlc19sZW4oc3RydWN0IGt1bml0X2Nhc2UgKnRlc3Rf
Y2FzZXMpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGt1bml0X2Nhc2UgKnRlc3RfY2FzZTsKPiA+
ICsgICAgIHNpemVfdCBsZW4gPSAwOwo+ID4gKwo+ID4gKyAgICAgZm9yICh0ZXN0X2Nhc2UgPSB0
ZXN0X2Nhc2VzOyB0ZXN0X2Nhc2UtPnJ1bl9jYXNlOyB0ZXN0X2Nhc2UrKykKPgo+IElmIHdlIG1h
a2UgdGhlIGxhc3QgdGVzdCBjYXNlIE5VTEwsIHdlJ2QganVzdCBjaGVjayBmb3IgdGVzdF9jYXNl
IGhlcmUsCj4gYW5kIHNhdmUgb3Vyc2VsdmVzIGFuIGV4dHJhIGZldyBieXRlcyBwZXIgdGVzdCBt
b2R1bGUuIEFueSByZWFzb24gd2h5Cj4gdGhlIGxhc3QgdGVzdCBjYXNlIGNhbm5vdCBiZSBOVUxM
PwoKSXMgdGhlcmUgYW55d2F5IHRvIG1ha2UgdGhhdCB3b3JrIHdpdGggYSBzdGF0aWNhbGx5IGRl
ZmluZWQgYXJyYXk/CgpCYXNpY2FsbHksIEkgd2FudCB0byBiZSBhYmxlIHRvIGRvIHNvbWV0aGlu
ZyBsaWtlOgoKc3RhdGljIHN0cnVjdCBrdW5pdF9jYXNlIGV4YW1wbGVfdGVzdF9jYXNlc1tdID0g
ewogICAgICAgIEtVTklUX0NBU0UoZXhhbXBsZV9zaW1wbGVfdGVzdCksCiAgICAgICAgS1VOSVRf
Q0FTRShleGFtcGxlX21vY2tfdGVzdCksCiAgICAgICAge30KfTsKCkZZSSwKI2RlZmluZSBLVU5J
VF9DQVNFKHRlc3RfbmFtZSkgeyAucnVuX2Nhc2UgPSB0ZXN0X25hbWUsIC5uYW1lID0gI3Rlc3Rf
bmFtZSB9CgpJbiBvcmRlciB0byBkbyB3aGF0IHlvdSBhcmUgcHJvcG9zaW5nLCBJIHRoaW5rIEkg
bmVlZCBhbiBhcnJheSBvZgpwb2ludGVycyB0byB0ZXN0IGNhc2VzLCB3aGljaCBpcyBub3QgaWRl
YWwuCgo+ID4gK3ZvaWQga3VuaXRfaW5pdF90ZXN0KHN0cnVjdCBrdW5pdCAqdGVzdCwgY29uc3Qg
Y2hhciAqbmFtZSkKPiA+ICt7Cj4gPiArICAgICBzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9jayk7
Cj4gPiArICAgICB0ZXN0LT5uYW1lID0gbmFtZTsKPiA+ICsgICAgIHRlc3QtPnN1Y2Nlc3MgPSB0
cnVlOwo+ID4gK30KPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFBlcmZvcm1zIGFsbCBsb2dpYyB0byBy
dW4gYSB0ZXN0IGNhc2UuCj4gPiArICovCj4gPiArc3RhdGljIHZvaWQga3VuaXRfcnVuX2Nhc2Uo
c3RydWN0IGt1bml0X21vZHVsZSAqbW9kdWxlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBrdW5pdF9jYXNlICp0ZXN0X2Nhc2UpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGt1
bml0IHRlc3Q7Cj4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ICsKPiA+ICsgICAgIGt1bml0X2lu
aXRfdGVzdCgmdGVzdCwgdGVzdF9jYXNlLT5uYW1lKTsKPiA+ICsKPiA+ICsgICAgIGlmIChtb2R1
bGUtPmluaXQpIHsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gbW9kdWxlLT5pbml0KCZ0ZXN0KTsK
Pgo+IEkgYmVsaWV2ZSBpZiB3ZSB1c2VkIHN0cnVjdCBrdW5pdF9tb2R1bGUgKmttb2R1bGUgaXQg
d291bGQgYmUgbXVjaAo+IGNsZWFyZXIgd2hvJ3MgaW5pdCB0aGlzIGlzLgoKVGhhdCdzIHJlYXNv
bmFibGUuIEkgd2lsbCBmaXggaW4gbmV4dCByZXZpc2lvbi4KCkNoZWVycyEKClsxXSBodHRwczov
L2dpdGh1Yi5jb20vVGVzdEFueXRoaW5nL1NwZWNpZmljYXRpb24vYmxvYi90YXAtMTQtc3BlY2lm
aWNhdGlvbi9zcGVjaWZpY2F0aW9uLm1kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
