Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7EA626E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF689624;
	Tue,  3 Sep 2019 07:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E00D89624
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 07:28:35 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n7so8343581otk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 00:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdMoRPg0KlVqze0pTkNC9rfXaDd7uPSTe82szx43jMg=;
 b=YqEHB3JQLQQVNPjwiRhreFSKZy/j1nmK8HQZ6Y60LYw96NgKMx4zBt2cKNObakGdT6
 MhCsiMnhCSAIGKex9yZuO8t/Lao7JBWT8839q0VEEE5lwm/ba1j8MUSQx/5ZO2wnyi8w
 j9XCGen3tfr8Q1STvZ38W6vYCU7Ao1h1GZeKyjWmMIO2JbPwfb0SI3hAdtqcHMBULy9w
 uFoWZIkeOe+gToXkWtX/KC8tPMh5HcBEU+XCv1lX3+MaQ9WK8BEW5w0BqE4QIUbGnwSt
 ZebhkflC7Mm8GiDwPB/4yb0ZEHJPAQCU1Yw5eiNoLOapOKwRarTKIbET+2TAe0tAhMbL
 EQBg==
X-Gm-Message-State: APjAAAWTvzMcTi5CDj0oPYddoD/r4kz1eiZg9qFB3Ck7/6aFUHgujuQ+
 Y3tIi+pOAEjmybOYCayfrAE1UIk0Ezh90PNiVXhiNw==
X-Google-Smtp-Source: APXvYqxNdE/m5cDoeoduzif078Rn/h+XzpbDyvLbalFH6g7b9CtJip46QdskaojSElyMHAM5lUrtBDY5YQw43Yn2gis=
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr1193992otr.188.1567495714412; 
 Tue, 03 Sep 2019 00:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
 <20190827225002.GB30700@ziepe.ca>
 <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
 <20190828184330.GD933@ziepe.ca>
 <CAKMK7uFJESH1XHTCqYoDb4iMfThxnib3Uz=RUcd7h=SS-TJWbg@mail.gmail.com>
In-Reply-To: <CAKMK7uFJESH1XHTCqYoDb4iMfThxnib3Uz=RUcd7h=SS-TJWbg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 3 Sep 2019 09:28:23 +0200
Message-ID: <CAKMK7uET7GL-nmRd_wxkxu0KsiYiSZcGTsSstcUpqaT=mKTbmg@mail.gmail.com>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UdMoRPg0KlVqze0pTkNC9rfXaDd7uPSTe82szx43jMg=;
 b=BRXYASXfXrSYdvQ7cHvdL8g1FGYY5yc7fn4k3rf1HqK5cdyf7DVE1ZRs2ggL6FBlZY
 jhOxSfrYQhY9BD157Pi5jnSxIhZjG9EG4xisQBVknT3mt+l8TxsfMTbDpomdpXG0MF88
 /Ul9+UZc5rqz3oUInM3tk4DRzAXTmO9p25Eds=
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgODo1NiBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCA4OjQzIFBNIEph
c29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDI4LCAy
MDE5IGF0IDA4OjMzOjEzUE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIFdl
ZCwgQXVnIDI4LCAyMDE5IGF0IDEyOjUwIEFNIEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNh
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2Vy
bmVsLmggYi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oCj4gPiA+ID4gPiBpbmRleCA0ZmEzNjBhMTNj
MWUuLjgyZjg0Y2ZlMzcyZiAxMDA2NDQKPiA+ID4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgva2Vy
bmVsLmgKPiA+ID4gPiA+IEBAIC0yMTcsNyArMjE3LDkgQEAgZXh0ZXJuIHZvaWQgX19jYW50X3Ns
ZWVwKGNvbnN0IGNoYXIgKmZpbGUsIGludCBsaW5lLCBpbnQgcHJlZW1wdF9vZmZzZXQpOwo+ID4g
PiA+ID4gICAqIG1pZ2h0X3NsZWVwIC0gYW5ub3RhdGlvbiBmb3IgZnVuY3Rpb25zIHRoYXQgY2Fu
IHNsZWVwCj4gPiA+ID4gPiAgICoKPiA+ID4gPiA+ICAgKiB0aGlzIG1hY3JvIHdpbGwgcHJpbnQg
YSBzdGFjayB0cmFjZSBpZiBpdCBpcyBleGVjdXRlZCBpbiBhbiBhdG9taWMKPiA+ID4gPiA+IC0g
KiBjb250ZXh0IChzcGlubG9jaywgaXJxLWhhbmRsZXIsIC4uLikuCj4gPiA+ID4gPiArICogY29u
dGV4dCAoc3BpbmxvY2ssIGlycS1oYW5kbGVyLCAuLi4pLiBBZGRpdGlvbmFsIHNlY3Rpb25zIHdo
ZXJlIGJsb2NraW5nIGlzCj4gPiA+ID4gPiArICogbm90IGFsbG93ZWQgY2FuIGJlIGFubm90YXRl
ZCB3aXRoIG5vbl9ibG9ja19zdGFydCgpIGFuZCBub25fYmxvY2tfZW5kKCkKPiA+ID4gPiA+ICsg
KiBwYWlycy4KPiA+ID4gPiA+ICAgKgo+ID4gPiA+ID4gICAqIFRoaXMgaXMgYSB1c2VmdWwgZGVi
dWdnaW5nIGhlbHAgdG8gYmUgYWJsZSB0byBjYXRjaCBwcm9ibGVtcyBlYXJseSBhbmQgbm90Cj4g
PiA+ID4gPiAgICogYmUgYml0dGVuIGxhdGVyIHdoZW4gdGhlIGNhbGxpbmcgZnVuY3Rpb24gaGFw
cGVucyB0byBzbGVlcCB3aGVuIGl0IGlzIG5vdAo+ID4gPiA+ID4gQEAgLTIzMyw2ICsyMzUsMjUg
QEAgZXh0ZXJuIHZvaWQgX19jYW50X3NsZWVwKGNvbnN0IGNoYXIgKmZpbGUsIGludCBsaW5lLCBp
bnQgcHJlZW1wdF9vZmZzZXQpOwo+ID4gPiA+ID4gICMgZGVmaW5lIGNhbnRfc2xlZXAoKSBcCj4g
PiA+ID4gPiAgICAgICBkbyB7IF9fY2FudF9zbGVlcChfX0ZJTEVfXywgX19MSU5FX18sIDApOyB9
IHdoaWxlICgwKQo+ID4gPiA+ID4gICMgZGVmaW5lIHNjaGVkX2Fubm90YXRlX3NsZWVwKCkgICAg
ICAoY3VycmVudC0+dGFza19zdGF0ZV9jaGFuZ2UgPSAwKQo+ID4gPiA+ID4gKy8qKgo+ID4gPiA+
ID4gKyAqIG5vbl9ibG9ja19zdGFydCAtIGFubm90YXRlIHRoZSBzdGFydCBvZiBzZWN0aW9uIHdo
ZXJlIHNsZWVwaW5nIGlzIHByb2hpYml0ZWQKPiA+ID4gPiA+ICsgKgo+ID4gPiA+ID4gKyAqIFRo
aXMgaXMgb24gYmVoYWxmIG9mIHRoZSBvb20gcmVhcGVyLCBzcGVjaWZpY2FsbHkgd2hlbiBpdCBp
cyBjYWxsaW5nIHRoZSBtbXUKPiA+ID4gPiA+ICsgKiBub3RpZmllcnMuIFRoZSBwcm9ibGVtIGlz
IHRoYXQgaWYgdGhlIG5vdGlmaWVyIHdlcmUgdG8gYmxvY2sgb24sIGZvciBleGFtcGxlLAo+ID4g
PiA+ID4gKyAqIG11dGV4X2xvY2soKSBhbmQgaWYgdGhlIHByb2Nlc3Mgd2hpY2ggaG9sZHMgdGhh
dCBtdXRleCB3ZXJlIHRvIHBlcmZvcm0gYQo+ID4gPiA+ID4gKyAqIHNsZWVwaW5nIG1lbW9yeSBh
bGxvY2F0aW9uLCB0aGUgb29tIHJlYXBlciBpcyBub3cgYmxvY2tlZCBvbiBjb21wbGV0aW9uIG9m
Cj4gPiA+ID4gPiArICogdGhhdCBtZW1vcnkgYWxsb2NhdGlvbi4gT3RoZXIgYmxvY2tpbmcgY2Fs
bHMgbGlrZSB3YWl0X2V2ZW50KCkgcG9zZSBzaW1pbGFyCj4gPiA+ID4gPiArICogaXNzdWVzLgo+
ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gKyMgZGVmaW5lIG5vbl9ibG9ja19zdGFydCgpIFwKPiA+
ID4gPiA+ICsgICAgIGRvIHsgY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50Kys7IH0gd2hpbGUgKDAp
Cj4gPiA+ID4gPiArLyoqCj4gPiA+ID4gPiArICogbm9uX2Jsb2NrX2VuZCAtIGFubm90YXRlIHRo
ZSBlbmQgb2Ygc2VjdGlvbiB3aGVyZSBzbGVlcGluZyBpcyBwcm9oaWJpdGVkCj4gPiA+ID4gPiAr
ICoKPiA+ID4gPiA+ICsgKiBDbG9zZXMgYSBzZWN0aW9uIG9wZW5lZCBieSBub25fYmxvY2tfc3Rh
cnQoKS4KPiA+ID4gPiA+ICsgKi8KPiA+ID4gPiA+ICsjIGRlZmluZSBub25fYmxvY2tfZW5kKCkg
XAo+ID4gPiA+ID4gKyAgICAgZG8geyBXQVJOX09OKGN1cnJlbnQtPm5vbl9ibG9ja19jb3VudC0t
ID09IDApOyB9IHdoaWxlICgwKQo+ID4gPiA+Cj4gPiA+ID4gY2hlY2stcGF0Y2ggZG9lcyBub3Qg
bGlrZSB0aGVzZSwgYW5kIEkgYWdyZWUKPiA+ID4gPgo+ID4gPiA+ICMxMDE6IEZJTEU6IGluY2x1
ZGUvbGludXgva2VybmVsLmg6MjQ4Ogo+ID4gPiA+ICsjIGRlZmluZSBub25fYmxvY2tfc3RhcnQo
KSBcCj4gPiA+ID4gKyAgICAgICBkbyB7IGN1cnJlbnQtPm5vbl9ibG9ja19jb3VudCsrOyB9IHdo
aWxlICgwKQo+ID4gPiA+Cj4gPiA+ID4gL3RtcC90bXAxc3BmeHVmeS8wMDA2LWtlcm5lbC1oLUFk
ZC1ub25fYmxvY2tfc3RhcnQtZW5kLS5wYXRjaDoxMDg6IFdBUk5JTkc6IFNpbmdsZSBzdGF0ZW1l
bnQgbWFjcm9zIHNob3VsZCBub3QgdXNlIGEgZG8ge30gd2hpbGUgKDApIGxvb3AKPiA+ID4gPiAj
MTA4OiBGSUxFOiBpbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjI1NToKPiA+ID4gPiArIyBkZWZpbmUg
bm9uX2Jsb2NrX2VuZCgpIFwKPiA+ID4gPiArICAgICAgIGRvIHsgV0FSTl9PTihjdXJyZW50LT5u
b25fYmxvY2tfY291bnQtLSA9PSAwKTsgfSB3aGlsZSAoMCkKPiA+ID4gPgo+ID4gPiA+IFBsZWFz
ZSB1c2UgYSBzdGF0aWMgaW5saW5lPwo+ID4gPgo+ID4gPiBXZSBuZWVkIGdldF9jdXJyZW50KCkg
cGx1cyB0aGUgdGFza19zdHJ1Y3QsIHNvIHRoaXMgZ2V0cyByZWFsIG1lc3N5Cj4gPiA+IHJlYWwg
ZmFzdC4gTm90IGV2ZW4gc3VyZSB3aGljaCBoZWFkZXIgdGhpcyB3b3VsZCBmaXQgaW4sIG9yIHdo
ZXRoZXIKPiA+ID4gSSdkIG5lZWQgdG8gY3JlYXRlIGEgbmV3IG9uZS4gWW91J3JlIGluc2lzdGlu
ZyBvbiB0aGlzIG9yIHJlc3Bpbm5pbmcKPiA+ID4gd2l0aCB0aGUgZG8geyB9IHdoaWxlICgwKSBk
cm9wcGVkIG9rLgo+ID4KPiA+IE15IHByZWZlcm5jZSBpcyBhbHdheXMgYSBzdGF0aWMgaW5saW5l
LCBidXQgaWYgdGhlIGhlYWRlcnMgYXJlIHNvCj4gPiB0d2lzdHkgd2UgbmVlZCB0byB1c2UgI2Rl
ZmluZSB0byBzb2x2ZSBhIG1pc3NpbmcgaW5jbHVkZSwgdGhlbiBJCj4gPiB3b3VsZG4ndCBpbnNp
c3Qgb24gaXQuCj4KPiBDbGVhbmVzdCB3b3VsZCBiZSBhIG5ldyBoZWFkZXIgSSBndWVzcywgdG9n
ZXRoZXIgd2l0aCBtaWdodF9zbGVlcCgpLgo+IEJ1dCBtb3ZpbmcgdGhhdCBpcyBhIGJpdCBtdWNo
IEkgdGhpbmssIHRoZXJlJ3MgYWxtb3N0IDUwMCBjYWxsZXJzIG9mCj4gdGhhdCBvbmUgZnJvbSBh
IHF1aWNrIGdpdCBncmVwCj4KPiA+IElmIGRyb3BwaW5nIGRvIHdoaWxlIGlzIHRoZSBvbmx5IGNo
YW5nZSB0aGVuIEkgY2FuIGVkaXQgaXQgaW4uLgo+ID4gSSB0aGluayB3ZSBoYXZlIHRoZSBhY2tz
IG5vdwo+Cj4gWWVhaCBzb3VuZHMgc2ltcGxlc3QsIHRoYW5rcy4KCkhpIEphc29uLAoKRG8geW91
IGV4cGVjdCBtZSB0byByZXNlbmQgbm93LCBvciBkbyB5b3UgcGxhbiB0byBkbyB0aGUgcGF0Y2h3
b3JrCmFwcGVhc2VtZW50IHdoZW4gYXBwbHlpbmc/IEkndmUgc2VlbiB5b3UgbWVyZ2VkIHRoZSBv
dGhlciBwYXRjaGVzCih0aGFua3MhKSwgYnV0IG5vdCB0aGVzZSB0d28gaGVyZS4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
