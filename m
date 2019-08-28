Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B8A0A0E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 20:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876A889E1B;
	Wed, 28 Aug 2019 18:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84F289E1B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:56:51 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id k18so897237otr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nS9sghIUIPx7g755mVLBuxz1Z71NtFQBCRRvUjCx70o=;
 b=Ev2i97L6nAswU+FjAis2Et6BR4I8rI4oEc6tt5MMGk36rC0dUf0TS/jYveNT3plAJk
 hlf7664zQCbMYAzXNjyZ5fydLs0ecOVtiPmM6wt+imHi7t14mW5I3KUjJ+nU2VBdnT0o
 fRIqQvmNzM8iBvvabeJIPAOrLlaabi1RwdygofBj9K/wmuPrqFIat+3NKufwwiEmbKQ7
 lCYJ4k14WDoFE2VhqdLDbQF8smW4AWnKz24exbkmNeFBetkwXJ1UqfIyjkEoBu1DaAQ+
 1UVp8S4iAHP4bbNMwbAG8aI3d9gALH+t3IBd204jMmtbAwBI8lJ0bD+H/f0hXXzfQjzU
 AgAg==
X-Gm-Message-State: APjAAAUMfuOdCWIX0QmjpVtOp9UPR2ssWtAsgoAKHMLXsrPU9ryftkUr
 PNmiTCKHF4lX8Fil20e9wl3444QYLeFd16qXNlrXLQ==
X-Google-Smtp-Source: APXvYqyggOyk01nC8FZIwN+CbjL/bjhI1aZtVdsQYi3h4hYy3se1Usiy90hGVxmIIjB8FzpqdJKGP5apV2lekxdVIBg=
X-Received: by 2002:a9d:6955:: with SMTP id p21mr283847oto.204.1567018610863; 
 Wed, 28 Aug 2019 11:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
 <20190827225002.GB30700@ziepe.ca>
 <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
 <20190828184330.GD933@ziepe.ca>
In-Reply-To: <20190828184330.GD933@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 28 Aug 2019 20:56:39 +0200
Message-ID: <CAKMK7uFJESH1XHTCqYoDb4iMfThxnib3Uz=RUcd7h=SS-TJWbg@mail.gmail.com>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nS9sghIUIPx7g755mVLBuxz1Z71NtFQBCRRvUjCx70o=;
 b=MTI+KanpTuhTrzzLxlbtZ1+swgBPtUkHfSSiiksg4bSXV8X0K5yvq031Ly+YoDSY5V
 ZymtBakgNC8hjLexb5QVq0atw4I+AobGrh1I4snAozgBTC+pTzLQaFbJPhDtNNw9RE4u
 2mRKcWVUunztUfQpODM6eEjC8xJ49wiw3XGFA=
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgODo0MyBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDg6MzM6MTNQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEyOjUwIEFN
IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZXJuZWwuaCBiL2luY2x1ZGUvbGludXgva2VybmVsLmgK
PiA+ID4gPiBpbmRleCA0ZmEzNjBhMTNjMWUuLjgyZjg0Y2ZlMzcyZiAxMDA2NDQKPiA+ID4gPiAr
KysgYi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oCj4gPiA+ID4gQEAgLTIxNyw3ICsyMTcsOSBAQCBl
eHRlcm4gdm9pZCBfX2NhbnRfc2xlZXAoY29uc3QgY2hhciAqZmlsZSwgaW50IGxpbmUsIGludCBw
cmVlbXB0X29mZnNldCk7Cj4gPiA+ID4gICAqIG1pZ2h0X3NsZWVwIC0gYW5ub3RhdGlvbiBmb3Ig
ZnVuY3Rpb25zIHRoYXQgY2FuIHNsZWVwCj4gPiA+ID4gICAqCj4gPiA+ID4gICAqIHRoaXMgbWFj
cm8gd2lsbCBwcmludCBhIHN0YWNrIHRyYWNlIGlmIGl0IGlzIGV4ZWN1dGVkIGluIGFuIGF0b21p
Ywo+ID4gPiA+IC0gKiBjb250ZXh0IChzcGlubG9jaywgaXJxLWhhbmRsZXIsIC4uLikuCj4gPiA+
ID4gKyAqIGNvbnRleHQgKHNwaW5sb2NrLCBpcnEtaGFuZGxlciwgLi4uKS4gQWRkaXRpb25hbCBz
ZWN0aW9ucyB3aGVyZSBibG9ja2luZyBpcwo+ID4gPiA+ICsgKiBub3QgYWxsb3dlZCBjYW4gYmUg
YW5ub3RhdGVkIHdpdGggbm9uX2Jsb2NrX3N0YXJ0KCkgYW5kIG5vbl9ibG9ja19lbmQoKQo+ID4g
PiA+ICsgKiBwYWlycy4KPiA+ID4gPiAgICoKPiA+ID4gPiAgICogVGhpcyBpcyBhIHVzZWZ1bCBk
ZWJ1Z2dpbmcgaGVscCB0byBiZSBhYmxlIHRvIGNhdGNoIHByb2JsZW1zIGVhcmx5IGFuZCBub3QK
PiA+ID4gPiAgICogYmUgYml0dGVuIGxhdGVyIHdoZW4gdGhlIGNhbGxpbmcgZnVuY3Rpb24gaGFw
cGVucyB0byBzbGVlcCB3aGVuIGl0IGlzIG5vdAo+ID4gPiA+IEBAIC0yMzMsNiArMjM1LDI1IEBA
IGV4dGVybiB2b2lkIF9fY2FudF9zbGVlcChjb25zdCBjaGFyICpmaWxlLCBpbnQgbGluZSwgaW50
IHByZWVtcHRfb2Zmc2V0KTsKPiA+ID4gPiAgIyBkZWZpbmUgY2FudF9zbGVlcCgpIFwKPiA+ID4g
PiAgICAgICBkbyB7IF9fY2FudF9zbGVlcChfX0ZJTEVfXywgX19MSU5FX18sIDApOyB9IHdoaWxl
ICgwKQo+ID4gPiA+ICAjIGRlZmluZSBzY2hlZF9hbm5vdGF0ZV9zbGVlcCgpICAgICAgKGN1cnJl
bnQtPnRhc2tfc3RhdGVfY2hhbmdlID0gMCkKPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAqIG5vbl9i
bG9ja19zdGFydCAtIGFubm90YXRlIHRoZSBzdGFydCBvZiBzZWN0aW9uIHdoZXJlIHNsZWVwaW5n
IGlzIHByb2hpYml0ZWQKPiA+ID4gPiArICoKPiA+ID4gPiArICogVGhpcyBpcyBvbiBiZWhhbGYg
b2YgdGhlIG9vbSByZWFwZXIsIHNwZWNpZmljYWxseSB3aGVuIGl0IGlzIGNhbGxpbmcgdGhlIG1t
dQo+ID4gPiA+ICsgKiBub3RpZmllcnMuIFRoZSBwcm9ibGVtIGlzIHRoYXQgaWYgdGhlIG5vdGlm
aWVyIHdlcmUgdG8gYmxvY2sgb24sIGZvciBleGFtcGxlLAo+ID4gPiA+ICsgKiBtdXRleF9sb2Nr
KCkgYW5kIGlmIHRoZSBwcm9jZXNzIHdoaWNoIGhvbGRzIHRoYXQgbXV0ZXggd2VyZSB0byBwZXJm
b3JtIGEKPiA+ID4gPiArICogc2xlZXBpbmcgbWVtb3J5IGFsbG9jYXRpb24sIHRoZSBvb20gcmVh
cGVyIGlzIG5vdyBibG9ja2VkIG9uIGNvbXBsZXRpb24gb2YKPiA+ID4gPiArICogdGhhdCBtZW1v
cnkgYWxsb2NhdGlvbi4gT3RoZXIgYmxvY2tpbmcgY2FsbHMgbGlrZSB3YWl0X2V2ZW50KCkgcG9z
ZSBzaW1pbGFyCj4gPiA+ID4gKyAqIGlzc3Vlcy4KPiA+ID4gPiArICovCj4gPiA+ID4gKyMgZGVm
aW5lIG5vbl9ibG9ja19zdGFydCgpIFwKPiA+ID4gPiArICAgICBkbyB7IGN1cnJlbnQtPm5vbl9i
bG9ja19jb3VudCsrOyB9IHdoaWxlICgwKQo+ID4gPiA+ICsvKioKPiA+ID4gPiArICogbm9uX2Js
b2NrX2VuZCAtIGFubm90YXRlIHRoZSBlbmQgb2Ygc2VjdGlvbiB3aGVyZSBzbGVlcGluZyBpcyBw
cm9oaWJpdGVkCj4gPiA+ID4gKyAqCj4gPiA+ID4gKyAqIENsb3NlcyBhIHNlY3Rpb24gb3BlbmVk
IGJ5IG5vbl9ibG9ja19zdGFydCgpLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArIyBkZWZpbmUgbm9u
X2Jsb2NrX2VuZCgpIFwKPiA+ID4gPiArICAgICBkbyB7IFdBUk5fT04oY3VycmVudC0+bm9uX2Js
b2NrX2NvdW50LS0gPT0gMCk7IH0gd2hpbGUgKDApCj4gPiA+Cj4gPiA+IGNoZWNrLXBhdGNoIGRv
ZXMgbm90IGxpa2UgdGhlc2UsIGFuZCBJIGFncmVlCj4gPiA+Cj4gPiA+ICMxMDE6IEZJTEU6IGlu
Y2x1ZGUvbGludXgva2VybmVsLmg6MjQ4Ogo+ID4gPiArIyBkZWZpbmUgbm9uX2Jsb2NrX3N0YXJ0
KCkgXAo+ID4gPiArICAgICAgIGRvIHsgY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50Kys7IH0gd2hp
bGUgKDApCj4gPiA+Cj4gPiA+IC90bXAvdG1wMXNwZnh1ZnkvMDAwNi1rZXJuZWwtaC1BZGQtbm9u
X2Jsb2NrX3N0YXJ0LWVuZC0ucGF0Y2g6MTA4OiBXQVJOSU5HOiBTaW5nbGUgc3RhdGVtZW50IG1h
Y3JvcyBzaG91bGQgbm90IHVzZSBhIGRvIHt9IHdoaWxlICgwKSBsb29wCj4gPiA+ICMxMDg6IEZJ
TEU6IGluY2x1ZGUvbGludXgva2VybmVsLmg6MjU1Ogo+ID4gPiArIyBkZWZpbmUgbm9uX2Jsb2Nr
X2VuZCgpIFwKPiA+ID4gKyAgICAgICBkbyB7IFdBUk5fT04oY3VycmVudC0+bm9uX2Jsb2NrX2Nv
dW50LS0gPT0gMCk7IH0gd2hpbGUgKDApCj4gPiA+Cj4gPiA+IFBsZWFzZSB1c2UgYSBzdGF0aWMg
aW5saW5lPwo+ID4KPiA+IFdlIG5lZWQgZ2V0X2N1cnJlbnQoKSBwbHVzIHRoZSB0YXNrX3N0cnVj
dCwgc28gdGhpcyBnZXRzIHJlYWwgbWVzc3kKPiA+IHJlYWwgZmFzdC4gTm90IGV2ZW4gc3VyZSB3
aGljaCBoZWFkZXIgdGhpcyB3b3VsZCBmaXQgaW4sIG9yIHdoZXRoZXIKPiA+IEknZCBuZWVkIHRv
IGNyZWF0ZSBhIG5ldyBvbmUuIFlvdSdyZSBpbnNpc3Rpbmcgb24gdGhpcyBvciByZXNwaW5uaW5n
Cj4gPiB3aXRoIHRoZSBkbyB7IH0gd2hpbGUgKDApIGRyb3BwZWQgb2suCj4KPiBNeSBwcmVmZXJu
Y2UgaXMgYWx3YXlzIGEgc3RhdGljIGlubGluZSwgYnV0IGlmIHRoZSBoZWFkZXJzIGFyZSBzbwo+
IHR3aXN0eSB3ZSBuZWVkIHRvIHVzZSAjZGVmaW5lIHRvIHNvbHZlIGEgbWlzc2luZyBpbmNsdWRl
LCB0aGVuIEkKPiB3b3VsZG4ndCBpbnNpc3Qgb24gaXQuCgpDbGVhbmVzdCB3b3VsZCBiZSBhIG5l
dyBoZWFkZXIgSSBndWVzcywgdG9nZXRoZXIgd2l0aCBtaWdodF9zbGVlcCgpLgpCdXQgbW92aW5n
IHRoYXQgaXMgYSBiaXQgbXVjaCBJIHRoaW5rLCB0aGVyZSdzIGFsbW9zdCA1MDAgY2FsbGVycyBv
Zgp0aGF0IG9uZSBmcm9tIGEgcXVpY2sgZ2l0IGdyZXAKCj4gSWYgZHJvcHBpbmcgZG8gd2hpbGUg
aXMgdGhlIG9ubHkgY2hhbmdlIHRoZW4gSSBjYW4gZWRpdCBpdCBpbi4uCj4gSSB0aGluayB3ZSBo
YXZlIHRoZSBhY2tzIG5vdwoKWWVhaCBzb3VuZHMgc2ltcGxlc3QsIHRoYW5rcy4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
