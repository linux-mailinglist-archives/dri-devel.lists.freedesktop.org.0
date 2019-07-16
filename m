Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40F6ADF5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9F06E172;
	Tue, 16 Jul 2019 17:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8EF6E174
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 17:51:57 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r1so9453473pfq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxEnHLXatCKhmQ8tqkHkTC9RIIficSilWz6s4BKeyXQ=;
 b=PCLMBBKAezkTKWsAYNGvInY9oLQU1gvTY1E8+TYv3sDhT1oPyf6Ou95G1qsQ4BIDHl
 KIVFZAXeyUrr5vlp/tHPY9PXC8uKnzdqQ3/aexFyFfpE7I6/v/94d78eNCxMfsCoWeUh
 LuDSKFNH8UqUnT/rEvO3Z5gSx1I9ljrpsLTJPEbwXLHqktF40GAo0dDulHC+hk3fXwEe
 WKj7WWj9o+ecsBioRd/wuxgvf0mBGRAwAIdAolM8r6kWcGZGZgAc4PFi1sJ22QMjQSqt
 3SToGPe0TUnS18IZe5eYJQ9HR0inUXH62qR53alkgR5lPeXEHHlwSsDvKjJNAiRG9BOd
 h80Q==
X-Gm-Message-State: APjAAAWY6797Tvn14/hipGxs7ryRhi5VX1HSTwNGvfzf8ySq5LjK/qre
 mx8qfte1kzn9pCaGKyB+u3YKVfxsWu4K5vxIoVdxzA==
X-Google-Smtp-Source: APXvYqyaJ18vLD4kzF4vse9+yxk+DvjTEGfbRhJU4ABRtN/S/Q3OhUTQ5bxT7G2cnasvpqzT1qZSk1Dd9UfyhosJ/h0=
X-Received: by 2002:a63:b919:: with SMTP id z25mr35314546pge.201.1563299516676; 
 Tue, 16 Jul 2019 10:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
 <20190712081744.87097-5-brendanhiggins@google.com>
 <20190715221554.8417320665@mail.kernel.org>
 <CAFd5g47ikJmA0uGoavAFsh+hQvDmgsOi26tyii0612R=rt7iiw@mail.gmail.com>
 <CAFd5g44_axVHNMBzxSURQB_-R+Rif7cZcg7PyZ_SS+5hcy5jZA@mail.gmail.com>
 <20190716153002.49E292054F@mail.kernel.org>
In-Reply-To: <20190716153002.49E292054F@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 16 Jul 2019 10:51:45 -0700
Message-ID: <CAFd5g44jruCZLunpQuDPnQS995x0F+Gxp99z4BoP_pLt=Hr1BQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/18] kunit: test: add kunit_stream a std::stream like
 logger
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nxEnHLXatCKhmQ8tqkHkTC9RIIficSilWz6s4BKeyXQ=;
 b=IR8gpax66RigZJS8zzOEEHslcoRtMBTJQr+BwYoG5krQI/IrW7RBJJOb1HnDxCU/yV
 QgfV9zvBkZxiaRdpVQ5UvleUCuWprZ5drSQYCn+Y2SQ0WJBxkU9y96Vg0A/X9/w6puUy
 wJPZSB5OIH+Fs7UZF2sgnWroJ6gzdmui3EJVbxSAUEw1zlnflSZQkCP2CyGkcZhrQ2Ik
 nTu4JglIMF5h/vJexddFclKM2bow42WXkycOAGCzBHj4V7nlFfCvnoPh2kZ9tat4r+lR
 ldeIM3HQ86qC69oeN4VGJIE3aUlKeqjYM8fm2x0XfJ1yNou0BI3BeFip69rcKSz9jBAN
 0rYw==
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
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgODozMCBBTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDctMTYgMDE6
Mzc6MzQpCj4gPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAxMjo1NyBBTSBCcmVuZGFuIEhpZ2dp
bnMKPiA+IDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
TW9uLCBKdWwgMTUsIDIwMTkgYXQgMzoxNSBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTkt
MDctMTIgMDE6MTc6MzApCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdW5pdC9rdW5p
dC1zdHJlYW0uaCBiL2luY2x1ZGUva3VuaXQva3VuaXQtc3RyZWFtLmgKPiA+ID4gPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5hN2I1M2VhYmY2
YmU0Cj4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2t1bml0
L2t1bml0LXN0cmVhbS5oCj4gPiA+ID4gPiArLyoqCj4gPiA+ID4gPiArICogc3RydWN0IGt1bml0
X3N0cmVhbSAtIGEgc3RkOjpzdHJlYW0gc3R5bGUgc3RyaW5nIGJ1aWxkZXIuCj4gPiA+ID4gPiAr
ICoKPiA+ID4gPiA+ICsgKiBBIHN0ZDo6c3RyZWFtIHN0eWxlIHN0cmluZyBidWlsZGVyLiBBbGxv
d3MgbWVzc2FnZXMgdG8gYmUgYnVpbHQgdXAgYW5kCj4gPiA+ID4gPiArICogcHJpbnRlZCBhbGwg
YXQgb25jZS4KPiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ICtzdHJ1Y3Qga3VuaXRfc3RyZWFtIHsK
PiA+ID4gPiA+ICsgICAgICAgLyogcHJpdmF0ZTogaW50ZXJuYWwgdXNlIG9ubHkuICovCj4gPiA+
ID4gPiArICAgICAgIHN0cnVjdCBrdW5pdCAqdGVzdDsKPiA+ID4gPiA+ICsgICAgICAgY29uc3Qg
Y2hhciAqbGV2ZWw7Cj4gPiA+ID4KPiA+ID4gPiBJcyB0aGUgbGV2ZWwgY2hhbmdlZD8gU2VlIG15
IGNvbW1lbnQgYmVsb3csIGJ1dCBJIHdvbmRlciBpZiB0aGlzIHdob2xlCj4gPiA+ID4gc3RydWN0
IGNhbiBnbyBhd2F5IGFuZCB0aGUgd3JhcHBlcnMgY2FuIGp1c3Qgb3BlcmF0ZSBvbiAnc3RydWN0
Cj4gPiA+ID4gc3RyaW5nX3N0cmVhbScgaW5zdGVhZC4KPiA+ID4KPiA+ID4gSSB3YXMgaW5jbGlu
ZWQgdG8gYWdyZWUgd2l0aCB5b3Ugd2hlbiBJIGZpcnN0IHJlYWQgeW91ciBjb21tZW50LCBidXQK
PiA+ID4gdGhlbiBJIHRob3VnaHQgYWJvdXQgdGhlIGNhc2UgdGhhdCBzb21lb25lIHdhbnRzIHRv
IGFkZCBpbiBhIGRlYnVnCj4gPiA+IG1lc3NhZ2UgKG9mIHdoaWNoIEkgY3VycmVudGx5IGhhdmUg
bm9uZSkuIEkgdGhpbmsgdW5kZXIgbW9zdAo+ID4gPiBjaXJjdW1zdGFuY2VzIGEgdXNlciBvZiBr
dW5pdF9zdHJlYW0gd291bGQgbGlrZWx5IHdhbnQgdG8gcGljayBhCj4gPiA+IGRlZmF1bHQgdmVy
Ym9zaXR5IHRoYXQgbWF5YmUgSSBzaG91bGQgcHJvdmlkZSwgYnV0IG1heSBzdGlsbCB3YW50Cj4g
PiA+IGRpZmZlcmVudCB2ZXJib3NpdHkgbGV2ZWxzLgo+ID4gPgo+ID4gPiBUaGUgbWFpbiByZWFz
b24gSSB3YW50IHRvIGtlZXAgdGhlIHR5cGVzIHNlcGFyYXRlLCBzdHJpbmdfc3RyZWFtIHZzLgo+
ID4gPiBrdW5pdF9zdHJlYW0sIGlzIHRoYXQgdGhleSBhcmUgaW50ZW5kZWQgdG8gYmUgdXNlZCBk
aWZmZXJlbnRseS4KPiA+ID4gc3RyaW5nX3N0cmVhbSBpcyBqdXN0IGEgZ2VuZXJpYyBzdHJpbmcg
YnVpbGRlci4gSWYgeW91IGFyZSB1c2luZyB0aGF0LAo+ID4gPiB5b3UgYXJlIGV4cGVjdGluZyB0
byBzZWUgc29tZW9uZSBidWlsZGluZyB0aGUgc3RyaW5nIGF0IHNvbWUgcG9pbnQgYW5kCj4gPiA+
IHRoZW4gZG9pbmcgc29tZXRoaW5nIGludGVyZXN0aW5nIHdpdGggaXQuIGt1bml0X3N0cmVhbSBy
ZWFsbHkgdGVsbHMKPiA+ID4geW91IHNwZWNpZmljYWxseSB0aGF0IEtVbml0IGlzIHB1dHRpbmcg
dG9nZXRoZXIgYSBtZXNzYWdlIHRvCj4gPiA+IGNvbW11bmljYXRlIHNvbWV0aGluZyB0byBhIHVz
ZXIgb2YgS1VuaXQuIEl0IGlzIHJlYWxseSB1c2VkIGluIGEgdmVyeQo+ID4gPiBzcGVjaWZpYyB3
YXksIGFuZCBJIHdvdWxkbid0IHdhbnQgdG8gZ2VuZXJhbGl6ZSBpdHMgdXNhZ2UgYmV5b25kIGhv
dwo+ID4gPiBpdCBpcyBjdXJyZW50bHkgdXNlZC4gSSB0aGluayBpbiBvcmRlciB0byBwcmVzZXJ2
ZSB0aGUgYXV0aG9yJ3MKPiA+ID4gaW50ZW50aW9uIGl0IGFkZHMgY2xhcml0eSB0byBrZWVwIHRo
ZSB0eXBlcyBzZXBhcmF0ZSByZWdhcmRsZXNzIG9mIGhvdwo+ID4gPiBzaW1pbGFyIHRoZXkgbWln
aHQgYmUgaW4gcmVhbGl0eS4KPgo+IFlvdSBtYXkgd2FudCB0byBhZGQgc29tZSBvZiB0aGVzZSBy
ZWFzb25zIHRvIHRoZSBjb21taXQgdGV4dC4KCldpbGwgZG8uCgo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gKyAgICAgICBpZiAoIXN0cmluZ19zdHJlYW1faXNfZW1wdHkoc3RyZWFtLT5pbnRlcm5hbF9z
dHJlYW0pKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAga3VuaXRfZXJyKHN0cmVhbS0+dGVz
dCwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIkVuZCBvZiB0ZXN0IGNhc2Ug
cmVhY2hlZCB3aXRoIHVuY29tbWl0dGVkIHN0cmVhbSBlbnRyaWVzXG4iKTsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBrdW5pdF9zdHJlYW1fY29tbWl0KHN0cmVhbSk7Cj4gPiA+ID4gPiArICAg
ICAgIH0KPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4KPiA+ID4gPiBOaXRwaWNrOiBE
cm9wIHRoaXMgZXh0cmEgbmV3bGluZS4KPiA+ID4KPiA+ID4gT29wcywgbmljZSBjYXRjaC4KPiA+
Cj4gPiBOb3Qgc3VwZXIgaW1wb3J0YW50LCBidXQgSSBkb24ndCB3YW50IHlvdSB0byB0aGluayB0
aGF0IEkgYW0gaWdub3JpbmcKPiA+IHlvdS4gSSB0aGluayB5b3UgbXVzdCBoYXZlIHVuaW50ZW50
aW9uYWxseSBkZWxldGVkIHRoZSBsYXN0IGZ1bmN0aW9uCj4gPiBpbiB0aGlzIGZpbGUsIG9yIG1h
eWJlIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHNvbWV0aGluZyB0aGF0IEkgYW0ganVzdAo+ID4gbm90
IHNlZWluZywgYnV0IEkgZG9uJ3Qgc2VlIHRoZSBleHRyYSBuZXdsaW5lIGhlcmUuCj4KPiBObyB3
b3JyaWVzLiBTb3JyeSBmb3IgdGhlIG5vaXNlLgo+Cj4gPiA+IHByb3BlcnR5IG9mIHRoZSBpbnB1
dCwgaXQgbWF5IG9yIG1heSBub3QgYmUgZW5vdWdoIGluZm9ybWF0aW9uIG9uIGl0cwo+ID4gPiBv
d24gZm9yIHRoZSBleHBlY3RhdGlvbiB0byBmYWlsLCBidXQgd2Ugd2FudCB0byBzaGFyZSB0aGUg
cmVzdWx0IG9mCj4gPiA+IHRoZSBwcm9wZXJ0eSBjaGVjayB3aXRoIHRoZSB1c2VyIHJlZ2FyZGxl
c3MsIEJVVCBvbmx5IGlmIHRoZQo+ID4gPiBleHBlY3RhdGlvbiBhcyBhIHdob2xlIGZhaWxzLgo+
ID4gPgo+ID4gPiBIZW5jZSwgd2UgY2FuIGhhdmUgbXVsdGlwbGUgYHN0cnVjdCBrdW5pdF9zdHJl
YW1gcyBhc3NvY2lhdGVkIHdpdGggYQo+ID4gPiBgc3RydWN0IGt1bml0YCBhY3RpdmUgYXQgYW55
IGdpdmVuIHRpbWUuCj4KPiBNYWtlcyBzZW5zZS4gSSB3YXNuJ3Qgc3VyZSBpZiB0aGVyZSB3ZXJl
IG1vcmUgdGhhbiBvbmUgc3RyZWFtIGFzc29jaWF0ZWQKPiB3aXRoIGEgdGVzdC4gU291bmRzIGxp
a2UgdGhlcmUgYXJlIG1hbnkgdG8gb25lIHNvIGl0IGNhbid0IGp1c3QgYmUgYQo+IG1lbWJlciBv
ZiB0aGUgdGVzdC4gVGhpcyBjb3VsZCBiZSBkb2N1bWVudGVkIHNvbWV3aGVyZSBzbyB0aGlzIHF1
ZXN0aW9uCj4gZG9lc24ndCBjb21lIHVwIGFnYWluLgoKU291bmRzIGdvb2QuIFdpbGwgZG8uCgpU
aGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
