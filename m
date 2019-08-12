Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3768AB8E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 01:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C397B6E604;
	Mon, 12 Aug 2019 23:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2F46E604
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 23:56:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f17so46519635pfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYpSAuCXXKxryh8QTeN+G2zHTLzdvz4q0W6bw5kxZF4=;
 b=lyRyYFVTc1LPEGb80vuV9nFtJUp/919kvFDv+Aqy6krdQLsqynwUzm8eAFDy+vnXWE
 YAvXhymcNDx3P6UuxNhSS3T1HZ9Gzo7TlUEK2pmlD3uarq72VNHjFPpwRcxq8nZJ+g9v
 LMnlyBZ2foJ3uHiuw2DGkV3kI/PTI95eGnKDZNFMnLnsHRDuRW7esb0oPT3LIdstwXxs
 jfkse6/gLMry/LVRxUcaRY/xPohoTiEnlPNh+mUjyRynIBFj7Pp5aXcGjg3NQNkjenem
 Hrw9Q8z8yp5J7jI+32oDB+xeAyhEKPz4XgeVZQYdqWWErgWv5lq5SoEyAsAI6BzHb09S
 WKDA==
X-Gm-Message-State: APjAAAV4jiJ7DKxKdZJjmRG8F6uf9AkoC/0odxWCIBJJl54IYj6tDdG+
 1vbMURqHz148Pz3flahPbDPtF32c3raccXJGnIvjJw==
X-Google-Smtp-Source: APXvYqw7Md+FhMdhe7gt7ZbaYFjad4Qutk9q143YLYnyDZF1R0tUF3skBOerqPAJS3PaDxgm1xGa9mrupUlIDIlaGXw=
X-Received: by 2002:a63:b919:: with SMTP id z25mr31882885pge.201.1565654201390; 
 Mon, 12 Aug 2019 16:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com>
 <20190812234644.E054D20679@mail.kernel.org>
In-Reply-To: <20190812234644.E054D20679@mail.kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 16:56:29 -0700
Message-ID: <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=gYpSAuCXXKxryh8QTeN+G2zHTLzdvz4q0W6bw5kxZF4=;
 b=kj+TnowRhwNBHJOh8ghz79tlvll8x/4UGw5bdSUzfSM675Bmppn0T+5pwwMqUi1Pj8
 SkfxC53wkTjuPEqLDzqpMT8o02usB1hT7ISXFNR37RoScwW9mBXE4G6OWWcEhGxQ4RjE
 ZULQCeKPfhmyKaUvhvxsP1ztH072L3pIFOOb1mQPoepGl9JYtada5S4xJGf8kTW6G2ed
 agtpkDcP4Se/8cfElAOE/jMH6pWLmTG0sCRAYFHxhMUFNN99If6/5pZXWUcydlo5gP79
 cH+LRfP7b/BQG+d1ym6KyAQRfa3JaLfiK6f13kXjD96rm3bbdFV/J9GFHUpWjzV//M/H
 yS1Q==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNDo0NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6
MjQ6MDcpCj4gPiBBZGQgYHN0cnVjdCBrdW5pdF9hc3NlcnRgIGFuZCBmcmllbmRzIHdoaWNoIHBy
b3ZpZGUgYSBzdHJ1Y3R1cmVkIHdheSB0bwo+ID4gY2FwdHVyZSBkYXRhIGZyb20gYW4gZXhwZWN0
YXRpb24gb3IgYW4gYXNzZXJ0aW9uIChpbnRyb2R1Y2VkIGxhdGVyIGluCj4gPiB0aGUgc2VyaWVz
KSBzbyB0aGF0IGl0IG1heSBiZSBwcmludGVkIG91dCBpbiB0aGUgZXZlbnQgb2YgYSBmYWlsdXJl
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNA
Z29vZ2xlLmNvbT4KPiA+IC0tLQo+Cj4gUmV2aWV3ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRA
a2VybmVsLm9yZz4KPgo+IEp1c3Qgc29tZSBtaW5vciBuaXRzIGJlbG93Cj4KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2t1bml0L2Fzc2VydC5oIGIvaW5jbHVkZS9rdW5pdC9hc3NlcnQuaAo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjU1ZjFiODhiMGNi
NGQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2luY2x1ZGUva3VuaXQvYXNzZXJ0LmgKPiA+
IEBAIC0wLDAgKzEsMTgzIEBACj4gWy4uLl0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKTsKPiA+ICsKPiA+ICtzdHJ1Y3Qga3VuaXRf
ZmFpbF9hc3NlcnQgewo+ID4gKyAgICAgICBzdHJ1Y3Qga3VuaXRfYXNzZXJ0IGFzc2VydDsKPiA+
ICt9Owo+ID4gKwo+ID4gK3ZvaWQga3VuaXRfZmFpbF9hc3NlcnRfZm9ybWF0KGNvbnN0IHN0cnVj
dCBrdW5pdF9hc3NlcnQgKmFzc2VydCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzdHJpbmdfc3RyZWFtICpzdHJlYW0pOwo+ID4gKwo+ID4gKyNkZWZpbmUgS1VOSVRf
SU5JVF9GQUlMX0FTU0VSVF9TVFJVQ1QodGVzdCwgdHlwZSkgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAuYXNzZXJ0ID0gS1VOSVRfSU5JVF9BU1NFUlRf
U1RSVUNUKHRlc3QsICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlLCAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAga3VuaXRfZmFpbF9hc3NlcnRfZm9ybWF0KSAgIFwKPgo+IFRoaXMgb25lIGdvdCBpbmRl
bnRlZCBvbmUgdG9vIG1hbnkgdGltZXM/CgpOb3QgdW5sZXNzIEkgaGF2ZSBiZWVuIHVzaW5nIHRo
ZSB3cm9uZyBmb3JtYXR0aW5nIGZvciBtdWx0aWxpbmUKbWFjcm9zLiBZb3UgY2FuIHNlZSB0aGlz
IGNvbW1pdCBhcHBsaWVkIGhlcmU6Cmh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51
eC8rLzg3MDk2NGRhMjk5MDkyMDAzMDk5MGRkMWZmYjY0N2VmNDA4ZTUyZGYvaW5jbHVkZS9rdW5p
dC9hc3NlcnQuaCM1OQoKSSBoYXZlIHRlc3QsIHR5cGUsIGFuZCBrdW5pdF9mYWlsX2Fzc2VydF9m
b3JtYXQgYWxsIGNvbHVtbiBhbGlnbmVkIChpdApqdXN0IGRvZXNuJ3QgcmVuZGVyIG5pY2VseSBp
biB0aGUgcGF0Y2ggZm9ybWF0KS4KCj4gPiArfQo+ID4gKwo+ID4gK3N0cnVjdCBrdW5pdF91bmFy
eV9hc3NlcnQgewo+ID4gKyAgICAgICBzdHJ1Y3Qga3VuaXRfYXNzZXJ0IGFzc2VydDsKPiA+ICsg
ICAgICAgY29uc3QgY2hhciAqY29uZGl0aW9uOwo+ID4gKyAgICAgICBib29sIGV4cGVjdGVkX3Ry
dWU7Cj4gPiArfTsKPiA+ICsKPiA+ICt2b2lkIGt1bml0X3VuYXJ5X2Fzc2VydF9mb3JtYXQoY29u
c3Qgc3RydWN0IGt1bml0X2Fzc2VydCAqYXNzZXJ0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBzdHJpbmdfc3RyZWFtICpzdHJlYW0pOwo+ID4gKwo+IFsuLi5dCj4g
PiArI2RlZmluZSBLVU5JVF9JTklUX0JJTkFSWV9TVFJfQVNTRVJUX1NUUlVDVCh0ZXN0LCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB0eXBlLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Bfc3RyLCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxlZnRfc3RyLCAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZWZ0X3ZhbCwgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmlnaHRfc3RyLCAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpZ2h0X3ZhbCkgeyAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAuYXNzZXJ0ID0gS1VOSVRfSU5JVF9B
U1NFUlRfU1RSVUNUKHRlc3QsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlLCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga3VuaXRfYmluYXJ5X3N0cl9hc3NlcnRfZm9ybWF0KSwgICAgXAo+ID4gKyAg
ICAgICAub3BlcmF0aW9uID0gb3Bfc3RyLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgLmxlZnRfdGV4dCA9IGxlZnRfc3RyLCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAgIC5sZWZ0X3ZhbHVlID0gbGVmdF92YWwsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAucmlnaHRfdGV4dCA9IHJpZ2h0X3N0ciwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAg
ICAgLnJpZ2h0X3ZhbHVlID0gcmlnaHRfdmFsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArfQo+Cj4gSXQgd291bGQgYmUgbmljZSB0byBoYXZlIGtl
cm5lbCBkb2Mgb24gdGhlc2UgbWFjcm9zIHNvIHdlIGtub3cgaG93IHRvCj4gdXNlIHRoZW0uCgpT
b3VuZHMgZ29vZC4gV2lsbCBmaXguCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
