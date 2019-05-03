Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EF13643
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 01:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304488925A;
	Fri,  3 May 2019 23:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223358925A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 23:41:23 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id w6so6799959otl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 16:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKALN1OkcwtQhcysb+FWH3t2vFKNjrdMKVQt2ijO0Po=;
 b=e4wQf0NxwCOGf8alWW3aCb50tcGqUZ1vusodyxDKQNj7u214hIZZqJGEs+pQMuscGl
 IsAGs0HFie1v8MtYg/h5Z2wblXJygeBctRc8/wrsfxToh9JxbiKkva5nDB+pqU3/DS8v
 wjAYa1EbChAloHvtX4EWY8K1WtR53w6o3cAozZXJtIFxxXmQ4F2PgVep36D2URezfyyP
 J8FqtAifnDyB4BvcdeUeCyaqlj0eQi5KbI9Za2sD6v6wDIhHsI3ft82Nl1nGTzIazB+q
 FAZedO5zE5jjxVWkFIIupvc/Ai2jk5zw9l+efqxq0bcfsNFeivDOhvaeSb3VAt8/Vb3i
 Kr1Q==
X-Gm-Message-State: APjAAAXR1sqzvZrWH88ILnNpXKU3JVTnbI++CpRs8+i48ruUFoXAji1V
 ufldbhJgFJ1Y5Pxnh7kERSPYjXN1x8D3OJgpJCSBmA==
X-Google-Smtp-Source: APXvYqzBloPRnX50VrJGlf0zwqZMx4kE8jlcjkF1A4MmAb/1CmwV6C22Krcs7y2A5uFCH7cqu5h7HYnPPCqLvVBMptw=
X-Received: by 2002:a9d:5cc3:: with SMTP id r3mr8335667oti.338.1556926881968; 
 Fri, 03 May 2019 16:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-17-brendanhiggins@google.com>
 <20190502110347.GE12416@kroah.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF9770A3A0@USCULXMSG01.am.sony.com>
 <CAFd5g471Wawu6g14p0AO3aY8VPBKLA0mjHSdfR1qStFGzp3iGQ@mail.gmail.com>
 <20190503064241.GC20723@kroah.com>
In-Reply-To: <20190503064241.GC20723@kroah.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 3 May 2019 16:41:10 -0700
Message-ID: <CAFd5g44NrKM9WQCF1xW-BWpFNsC05UAS9jt1-S+vNRuBDZVsHQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mKALN1OkcwtQhcysb+FWH3t2vFKNjrdMKVQt2ijO0Po=;
 b=uHwVMflHMaQY3whJ1EE4nVizGRxOy/tr5WOjeZAzMUNneEi1VOxLR7ILboGXaDspKX
 EZdcTnWDLsjH5Xuv6Dpbla+mLd+ZOej6UTDsdicbg1f2NGRfNWvT53QLlViJ91MtO47Y
 +NMNZSv0/KOCCjGp/8Z6JcV8oAgctk1uHe5BjikYU+meECnNZzF0Xtb+m6Lql1RyQZ+f
 6pOCAlUul4FDKtOsuwcFiCf6Z4SU4Q97jpl1Ljx2pJqKs6Ok7cLSU5UcjCBf989disYo
 L1k/caWEqmSpv8hm8mIrQVDY6SOrZ43BcimXmBjT67ScyO4HOEunsbiGdbsaE+Lu0zj7
 pGEA==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Iurii Zaikin <yzaikin@google.com>, Jeff Dike <jdike@addtoit.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com,
 Richard Weinberger <richard@nod.at>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBUaHUsIE1heSAwMiwgMjAxOSBhdCAxMTo0NTo0M0FNIC0wNzAwLCBCcmVuZGFuIEhpZ2dp
bnMgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDExOjE1IEFNIDxUaW0uQmlyZEBz
b255LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBHcmVnIEtICj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQs
IE1heSAwMSwgMjAxOSBhdCAwNDowMToyNVBNIC0wNzAwLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6
Cj4gPiA+ID4gPiBGcm9tOiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNvbT4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBLVW5pdCB0ZXN0cyBmb3IgaW5pdGlhbGl6ZWQgZGF0YSBiZWhhdmlvciBv
ZiBwcm9jX2RvaW50dmVjIHRoYXQgaXMKPiA+ID4gPiA+IGV4cGxpY2l0bHkgY2hlY2tlZCBpbiB0
aGUgY29kZS4gSW5jbHVkZXMgYmFzaWMgcGFyc2luZyB0ZXN0cyBpbmNsdWRpbmcKPiA+ID4gPiA+
IGludCBtaW4vbWF4IG92ZXJmbG93Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAga2VybmVsL01ha2VmaWxlICAgICAgfCAgIDIgKwo+ID4gPiA+ID4gIGtl
cm5lbC9zeXNjdGwtdGVzdC5jIHwgMjkyCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gIGxpYi9LY29uZmlnLmRlYnVnICAgIHwgICA2
ICsKPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDMwMCBpbnNlcnRpb25zKCspCj4gPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zeXNjdGwtdGVzdC5jCj4gPiA+ID4gPgo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9NYWtlZmlsZSBiL2tlcm5lbC9NYWtlZmlsZQo+ID4g
PiA+ID4gaW5kZXggNmM1N2U3ODgxN2RhZC4uYzgxYTg5NzZiNmE0YiAxMDA2NDQKPiA+ID4gPiA+
IC0tLSBhL2tlcm5lbC9NYWtlZmlsZQo+ID4gPiA+ID4gKysrIGIva2VybmVsL01ha2VmaWxlCj4g
PiA+ID4gPiBAQCAtMTEyLDYgKzExMiw4IEBAIG9iai0kKENPTkZJR19IQVNfSU9NRU0pICs9IGlv
bWVtLm8KPiA+ID4gPiA+ICBvYmotJChDT05GSUdfWk9ORV9ERVZJQ0UpICs9IG1lbXJlbWFwLm8K
PiA+ID4gPiA+ICBvYmotJChDT05GSUdfUlNFUSkgKz0gcnNlcS5vCj4gPiA+ID4gPgo+ID4gPiA+
ID4gK29iai0kKENPTkZJR19TWVNDVExfS1VOSVRfVEVTVCkgKz0gc3lzY3RsLXRlc3Qubwo+ID4g
PiA+Cj4gPiA+ID4gWW91IGFyZSBnb2luZyB0byBoYXZlIHRvIGhhdmUgYSAic3RhbmRhcmQiIG5h
bWluZyBzY2hlbWUgZm9yIHRlc3QKPiA+ID4gPiBtb2R1bGVzLCBhcmUgeW91IGdvaW5nIHRvIHJl
Y29tbWVuZCAiZm9vLXRlc3QiIG92ZXIgInRlc3QtZm9vIj8gIElmIHNvLAo+ID4gPiA+IHRoYXQn
cyBmaW5lLCB3ZSBzaG91bGQganVzdCBiZSBjb25zaXN0YW50IGFuZCBkb2N1bWVudCBpdCBzb21l
d2hlcmUuCj4gPiA+ID4KPiA+ID4gPiBQZXJzb25hbGx5LCBJJ2QgcHJlZmVyICJ0ZXN0LWZvbyIs
IGJ1dCB0aGF0J3MganVzdCBtZSwgbmFtaW5nIGlzIGhhcmQuLi4KPiA+ID4KPiA+ID4gTXkgcHJl
ZmVyZW5jZSB3b3VsZCBiZSAidGVzdC1mb28iIGFzIHdlbGwuICBKdXN0IG15IDIgY2VudHMuCj4g
Pgo+ID4gSSBkZWZpbml0ZWx5IGFncmVlIHdlIHNob3VsZCBiZSBjb25zaXN0ZW50LiBNeSBwZXJz
b25hbCBiaWFzCj4gPiAodW5zdXJwcmlzaW5nbHkpIGlzICJmb28tdGVzdCwiIGJ1dCB0aGlzIGlz
IGp1c3QgYmVjYXVzZSB0aGF0IGlzIHRoZQo+ID4gY29udmVudGlvbiBJIGFtIHVzZWQgdG8gaW4g
b3RoZXIgcHJvamVjdHMgSSBoYXZlIHdvcmtlZCBvbi4KPiA+Cj4gPiBPbiBhbiB1bmJpYXNlZCBu
b3RlLCB3ZSBhcmUgY3VycmVudGx5IGFsbW9zdCBldmVubHkgc3BsaXQgYmV0d2VlbiB0aGUKPiA+
IHR3byBjb252ZW50aW9ucyB3aXRoICpzbGlnaHQqIHByZWZlcmVuY2UgZm9yICJmb28tdGVzdCI6
IEkgcmFuIHRoZSB0d28KPiA+IGZvbGxvd2luZyBncmVwIGNvbW1hbmRzIG9uIHY1LjEtcmM3Ogo+
ID4KPiA+IGdyZXAgLUhybiAtLWV4Y2x1ZGUtZGlyPSJidWlsZCIgLWUgImNvbmZpZyBbYS16QS1a
XzAtOV1cK19URVNUJCIgfCB3YyAtbAo+ID4gZ3JlcCAtSHJuIC0tZXhjbHVkZS1kaXI9ImJ1aWxk
IiAtZSAiY29uZmlnIFRFU1RfW2EtekEtWl8wLTldXCsiIHwgd2MgLWwKPiA+Cj4gPiAiZm9vLXRl
c3QiIGhhcyAzNiBvY2N1cnJlbmNlcy4KPiA+ICJ0ZXN0LWZvbyIgaGFzIDMzIG9jY3VycmVuY2Vz
Lgo+ID4KPiA+IFRoZSB0aGluZ3MgSSBhbSBtb3JlIGNvbmNlcm5lZCBhYm91dCBpcyBob3cgdGhp
cyB3b3VsZCBhZmZlY3QgZmlsZQo+ID4gbmFtaW5nLiBJZiB3ZSBoYXZlIGEgdW5pdCB0ZXN0IGZv
ciBmb28uYywgSSB0aGluayBmb29fdGVzdC5jIGlzIG1vcmUKPiA+IGNvbnNpc3RlbnQgd2l0aCBv
dXIgbmFtZXNwYWNpbmcgY29udmVudGlvbnMuIFRoZSBvdGhlciB0aGluZywgaXMgaWYgd2UKPiA+
IGFscmVhZHkgaGF2ZSBhIEtjb25maWcgc3ltYm9sIGNhbGxlZCBGT09fVEVTVCAob3IgVEVTVF9G
T08pIHdoYXQKPiA+IHNob3VsZCB3ZSBuYW1lIHRoZSBLVW5pdCB0ZXN0IGluIHRoaXMgY2FzZT8g
Rk9PX1VOSVRfVEVTVD8KPiA+IEZPT19LVU5JVF9URVNULCBsaWtlIEkgZGlkIGFib3ZlPwo+Cj4g
T2ssIEkgY2FuIGxpdmUgd2l0aCAiZm9vLXRlc3QiLCBhcyB5b3UgYXJlIHJpZ2h0LCBpbiBhIGRp
cmVjdG9yeSBsaXN0aW5nCj4gYW5kIGNvbmZpZyBvcHRpb24sIGl0IG1ha2VzIG1vcmUgc2Vuc2Ug
dG8gYWRkIGl0IGFzIGEgc3VmZml4LgoKQ29vbCwgc28ganVzdCBmb3IgZnV0dXJlIHJlZmVyZW5j
ZSwgaWYgd2UgYWxyZWFkeSBoYXZlIGEgS2NvbmZpZwpzeW1ib2wgY2FsbGVkIEZPT19URVNUIChv
ciBURVNUX0ZPTykgd2hhdCBzaG91bGQgd2UgbmFtZSB0aGUgS1VuaXQKdGVzdCBpbiB0aGlzIGNh
c2U/IEZPT19VTklUX1RFU1Q/IEZPT19LVU5JVF9URVNULCBsaWtlIEkgZGlkIGFib3ZlPwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
