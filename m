Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91328ADB4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DBE6E620;
	Tue, 13 Aug 2019 04:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333C86E620
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:27:17 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 129so3921816pfa.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 21:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQL9RUtIML/PZe8MNFP8yQiCjWtKgPLyEfIL1k8PJhc=;
 b=ig7oUGIhYFYUXvIvkq487/g+kKEBrcAo0xezaaKjvL96IIc9jvXfLYgE6NVlYKBR/Z
 99xwBu2BXjW5yHA5uy96P19cFz65mxRNKYvN5fix59tQk7CbomYBbTF9f0x9c9052o+q
 oqeIxseoDpKxQ09Ztzl0Z60jgd01i5q770A0eMdfY2MhbhZ6xNj6pN08vkDxaU+67wpf
 P218L2XmPMQCQi8WjcMgzTTTJucA8ywoYLDWpClhIzcb89VQFxayOKFUTFQqnnyIs2Z6
 pWkxU6oIC8iWVr3x7FKARGP6emaMFi80OUXYEI3r+tPKokb3DT2hYTAAKOf3cLkVIA44
 f3+g==
X-Gm-Message-State: APjAAAUam94W4jy1oEz+e8TyMCG7dJcJH515XULqnRNmgAtuVCiLJFnZ
 I6DihutJTi62aYxvsN8vJoicOo3+iVcqFxB6OcVbqQ==
X-Google-Smtp-Source: APXvYqyDNtjg1vEeMDr2gVCEsRefZmM7lb53WZNnRaIftMCnD83RA48eWcYK2L1Qi2YiTKmhvzfk7GUpdRuiK3gA3Wg=
X-Received: by 2002:a63:b919:: with SMTP id z25mr32569272pge.201.1565670436109; 
 Mon, 12 Aug 2019 21:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-5-brendanhiggins@google.com>
 <20190812234644.E054D20679@mail.kernel.org>
 <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
In-Reply-To: <CAFd5g44huOiR9B0H1C2TtiPy63BDuwi_Qpb_exF3zmT3ttV8eg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 12 Aug 2019 21:27:05 -0700
Message-ID: <CAFd5g44GxE-p+Jk_46GYA-WWVHLW7w=yE+K_tbbdiniDfrk-2w@mail.gmail.com>
Subject: Re: [PATCH v12 04/18] kunit: test: add assertion printing library
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fQL9RUtIML/PZe8MNFP8yQiCjWtKgPLyEfIL1k8PJhc=;
 b=fbg8VeT4fWy8MdPE5NDtumx+KrkUlXY0FY4hQL0ZwFaSB+aAw9A23C2a0B2+TAgTcn
 QRSm6g30QyXjT5+Li/OxZJId+1mikYGNYaRjFswNcd6fvPG4iGcxHlUtL+YOAsZsA1S0
 rcxRRdXDnZm1MmAStKLyKDuVzVZJLX5Lpcsp/wnXCV2B+DSuCumnuklf6b0VFdNwZEgN
 UTua35jaJGosxDOytq+pTP+fwXsPV3GIbr3R559nMEJhIG1Zt9VqS/XG0JoEGRztyMPv
 pjPkYqPfyv4d0basCqZO32/EFQQWHTlJ0mQAVIAE2306A8Q+UbbHGf9TCQnW3CYkOtTX
 JP8Q==
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNDo1NiBQTSBCcmVuZGFuIEhpZ2dpbnMKPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNDo0
NiBQTSBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFF1b3Rp
bmcgQnJlbmRhbiBIaWdnaW5zICgyMDE5LTA4LTEyIDExOjI0OjA3KQo+ID4gPiBBZGQgYHN0cnVj
dCBrdW5pdF9hc3NlcnRgIGFuZCBmcmllbmRzIHdoaWNoIHByb3ZpZGUgYSBzdHJ1Y3R1cmVkIHdh
eSB0bwo+ID4gPiBjYXB0dXJlIGRhdGEgZnJvbSBhbiBleHBlY3RhdGlvbiBvciBhbiBhc3NlcnRp
b24gKGludHJvZHVjZWQgbGF0ZXIgaW4KPiA+ID4gdGhlIHNlcmllcykgc28gdGhhdCBpdCBtYXkg
YmUgcHJpbnRlZCBvdXQgaW4gdGhlIGV2ZW50IG9mIGEgZmFpbHVyZS4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGlnZ2luc0Bnb29nbGUuY29tPgo+
ID4gPiAtLS0KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPgo+ID4KPiA+IEp1c3Qgc29tZSBtaW5vciBuaXRzIGJlbG93Cj4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9rdW5pdC9hc3NlcnQuaCBiL2luY2x1ZGUva3VuaXQvYXNzZXJ0LmgKPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNTVmMWI4
OGIwY2I0ZAo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL2luY2x1ZGUva3VuaXQvYXNz
ZXJ0LmgKPiA+ID4gQEAgLTAsMCArMSwxODMgQEAKPiA+IFsuLi5dCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKTsKPiA+ID4gKwo+
ID4gPiArc3RydWN0IGt1bml0X2ZhaWxfYXNzZXJ0IHsKPiA+ID4gKyAgICAgICBzdHJ1Y3Qga3Vu
aXRfYXNzZXJ0IGFzc2VydDsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3ZvaWQga3VuaXRfZmFp
bF9hc3NlcnRfZm9ybWF0KGNvbnN0IHN0cnVjdCBrdW5pdF9hc3NlcnQgKmFzc2VydCwKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHN0cmluZ19zdHJlYW0gKnN0cmVh
bSk7Cj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUgS1VOSVRfSU5JVF9GQUlMX0FTU0VSVF9TVFJVQ1Qo
dGVzdCwgdHlwZSkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAg
ICAgICAgIC5hc3NlcnQgPSBLVU5JVF9JTklUX0FTU0VSVF9TVFJVQ1QodGVzdCwgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdHlwZSwgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3VuaXRfZmFpbF9h
c3NlcnRfZm9ybWF0KSAgIFwKPiA+Cj4gPiBUaGlzIG9uZSBnb3QgaW5kZW50ZWQgb25lIHRvbyBt
YW55IHRpbWVzPwo+Cj4gTm90IHVubGVzcyBJIGhhdmUgYmVlbiB1c2luZyB0aGUgd3JvbmcgZm9y
bWF0dGluZyBmb3IgbXVsdGlsaW5lCj4gbWFjcm9zLiBZb3UgY2FuIHNlZSB0aGlzIGNvbW1pdCBh
cHBsaWVkIGhlcmU6Cj4gaHR0cHM6Ly9rdW5pdC5nb29nbGVzb3VyY2UuY29tL2xpbnV4LysvODcw
OTY0ZGEyOTkwOTIwMDMwOTkwZGQxZmZiNjQ3ZWY0MDhlNTJkZi9pbmNsdWRlL2t1bml0L2Fzc2Vy
dC5oIzU5Cj4KPiBJIGhhdmUgdGVzdCwgdHlwZSwgYW5kIGt1bml0X2ZhaWxfYXNzZXJ0X2Zvcm1h
dCBhbGwgY29sdW1uIGFsaWduZWQgKGl0Cj4ganVzdCBkb2Vzbid0IHJlbmRlciBuaWNlbHkgaW4g
dGhlIHBhdGNoIGZvcm1hdCkuCgpEaXNyZWdhcmQgdGhhdCBsYXN0IGNvbW1lbnQuIEkganVzdCBs
b29rZWQgYXQgdGhlIGxpbmUgaW1tZWRpYXRlbHkKYWJvdmUgeW91ciBjb21tZW50IGFuZCB0aG91
Z2h0IGl0IGxvb2tlZCBjb3JyZWN0LiBTb3JyeSBhYm91dCB0aGF0Cih5b3Ugd2VyZSBwb2ludGlu
ZyBvdXQgdGhhdCB0aGUgLmFzc2VydCBsaW5lIGxvb2tlZCB3cm9uZywgY29ycmVjdD8pLgoKPiA+
ID4gK30KPiA+ID4gKwo+ID4gPiArc3RydWN0IGt1bml0X3VuYXJ5X2Fzc2VydCB7Cj4gPiA+ICsg
ICAgICAgc3RydWN0IGt1bml0X2Fzc2VydCBhc3NlcnQ7Cj4gPiA+ICsgICAgICAgY29uc3QgY2hh
ciAqY29uZGl0aW9uOwo+ID4gPiArICAgICAgIGJvb2wgZXhwZWN0ZWRfdHJ1ZTsKPiA+ID4gK307
Cj4gPiA+ICsKPiA+ID4gK3ZvaWQga3VuaXRfdW5hcnlfYXNzZXJ0X2Zvcm1hdChjb25zdCBzdHJ1
Y3Qga3VuaXRfYXNzZXJ0ICphc3NlcnQsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKTsKPiA+ID4gKwo+ID4gWy4uLl0KPiA+
ID4gKyNkZWZpbmUgS1VOSVRfSU5JVF9CSU5BUllfU1RSX0FTU0VSVF9TVFJVQ1QodGVzdCwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0eXBlLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcF9zdHIs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZWZ0X3N0ciwgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZWZ0
X3ZhbCwgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByaWdodF9zdHIsICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
aWdodF92YWwpIHsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAuYXNzZXJ0
ID0gS1VOSVRfSU5JVF9BU1NFUlRfU1RSVUNUKHRlc3QsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHR5cGUsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt1bml0X2JpbmFyeV9zdHJfYXNzZXJ0X2Zv
cm1hdCksICAgIFwKPiA+ID4gKyAgICAgICAub3BlcmF0aW9uID0gb3Bfc3RyLCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAu
bGVmdF90ZXh0ID0gbGVmdF9zdHIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAubGVmdF92YWx1ZSA9IGxlZnRfdmFsLCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAg
ICAucmlnaHRfdGV4dCA9IHJpZ2h0X3N0ciwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAucmlnaHRfdmFsdWUgPSByaWdodF92YWwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gK30K
PiA+Cj4gPiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUga2VybmVsIGRvYyBvbiB0aGVzZSBtYWNy
b3Mgc28gd2Uga25vdyBob3cgdG8KPiA+IHVzZSB0aGVtLgo+Cj4gU291bmRzIGdvb2QuIFdpbGwg
Zml4LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
