Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D27A1330
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939836E03F;
	Thu, 29 Aug 2019 08:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6413689DEC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:43:33 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i4so697240qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 11:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OjPkEOv+DLtOkFTqeu8lwQuWyFpGs0nrOsZbcx7SOSc=;
 b=e2hl8n4kJA8iGE5cs73zrDj2tnR2nJpJZbHUrXhEcqygG2ilnGwjB5qTljlm4IWkyS
 VkjxYIvCdIXA/XMMgQitbWNSizjRKno8N4Af3+eB5ca4Lsft6LBcgmR1wx8pEt9caLtD
 gUZbqngWZOhGB/7PguR8e4vcGJnQZr4FJsikDp0FAzG16ZonaQshy1YPu3JXmX8bSN2k
 N3zR8PtQEXUeCpKP82iUJA+7XKRA8T43w95befEG2X2DAbbO+LjONIVcmqS/+Q+pv7Hw
 GFl+99C2KaTuVopOEAiIfpWqqZgev6D1EbDETi8PphMjrusHIJIp16ytC1zawc9ijwlI
 m7wA==
X-Gm-Message-State: APjAAAXkMD5F62m/ay9uf8WYIiQ7HMw/bw4D2qGPFUUqJz7PGHCvekew
 0NDT2X5i+dFcRO6GO3l+7rXN2w==
X-Google-Smtp-Source: APXvYqyEQcVWQf49+hXcQCirgyPBJnM1VH//y0tMVxtn+SNqmDh6w+F0CMCxwxOy8DpklWetu0fhmA==
X-Received: by 2002:ac8:750e:: with SMTP id u14mr5800709qtq.282.1567017812387; 
 Wed, 28 Aug 2019 11:43:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id k11sm21089qtp.26.2019.08.28.11.43.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Aug 2019 11:43:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i32uo-0006U8-Rg; Wed, 28 Aug 2019 15:43:30 -0300
Date: Wed, 28 Aug 2019 15:43:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/5] kernel.h: Add non_block_start/end()
Message-ID: <20190828184330.GD933@ziepe.ca>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
 <20190826201425.17547-4-daniel.vetter@ffwll.ch>
 <20190827225002.GB30700@ziepe.ca>
 <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHKiLwXLHd1xThZVM1dH-oKrtpDZ=FxLBBwtY7XmJKgtA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OjPkEOv+DLtOkFTqeu8lwQuWyFpGs0nrOsZbcx7SOSc=;
 b=HbHXDrzLqc3lpVU55Nd/0BI2SIQ2x72GzuKH/C2UAiJOAp38bcuMdbQptguyCeoa8S
 XtS6TSStn/7XppLzX0ltVtzjXABmeo1iBZlbJIsc4IjxoQVNK0XgHoe5qnT8leWBFLKp
 ygUAeNgUsdCWiSK9m1VX/B1VNJIeObqWI6AHSZGYIK+Qowf5xQW46ccAvDBEfsckznWb
 MmKN+mdFBQ6Nzf54I3ucE1GI2CyvGbcHp7ySqkRKMENGHCY7dCaaAu8QWTMfUcwQtNxa
 Ro8JrnGi/uzzbWR34UB7mEtJw9KlHNFZfY2+dANrWQiodo233hpz5sMhLvpLGJJjf8W7
 2liA==
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
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDg6MzM6MTNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCAxMjo1MCBBTSBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9rZXJuZWwuaCBiL2luY2x1ZGUvbGludXgva2VybmVsLmgKPiA+ID4gaW5kZXggNGZhMzYwYTEz
YzFlLi44MmY4NGNmZTM3MmYgMTAwNjQ0Cj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgva2VybmVs
LmgKPiA+ID4gQEAgLTIxNyw3ICsyMTcsOSBAQCBleHRlcm4gdm9pZCBfX2NhbnRfc2xlZXAoY29u
c3QgY2hhciAqZmlsZSwgaW50IGxpbmUsIGludCBwcmVlbXB0X29mZnNldCk7Cj4gPiA+ICAgKiBt
aWdodF9zbGVlcCAtIGFubm90YXRpb24gZm9yIGZ1bmN0aW9ucyB0aGF0IGNhbiBzbGVlcAo+ID4g
PiAgICoKPiA+ID4gICAqIHRoaXMgbWFjcm8gd2lsbCBwcmludCBhIHN0YWNrIHRyYWNlIGlmIGl0
IGlzIGV4ZWN1dGVkIGluIGFuIGF0b21pYwo+ID4gPiAtICogY29udGV4dCAoc3BpbmxvY2ssIGly
cS1oYW5kbGVyLCAuLi4pLgo+ID4gPiArICogY29udGV4dCAoc3BpbmxvY2ssIGlycS1oYW5kbGVy
LCAuLi4pLiBBZGRpdGlvbmFsIHNlY3Rpb25zIHdoZXJlIGJsb2NraW5nIGlzCj4gPiA+ICsgKiBu
b3QgYWxsb3dlZCBjYW4gYmUgYW5ub3RhdGVkIHdpdGggbm9uX2Jsb2NrX3N0YXJ0KCkgYW5kIG5v
bl9ibG9ja19lbmQoKQo+ID4gPiArICogcGFpcnMuCj4gPiA+ICAgKgo+ID4gPiAgICogVGhpcyBp
cyBhIHVzZWZ1bCBkZWJ1Z2dpbmcgaGVscCB0byBiZSBhYmxlIHRvIGNhdGNoIHByb2JsZW1zIGVh
cmx5IGFuZCBub3QKPiA+ID4gICAqIGJlIGJpdHRlbiBsYXRlciB3aGVuIHRoZSBjYWxsaW5nIGZ1
bmN0aW9uIGhhcHBlbnMgdG8gc2xlZXAgd2hlbiBpdCBpcyBub3QKPiA+ID4gQEAgLTIzMyw2ICsy
MzUsMjUgQEAgZXh0ZXJuIHZvaWQgX19jYW50X3NsZWVwKGNvbnN0IGNoYXIgKmZpbGUsIGludCBs
aW5lLCBpbnQgcHJlZW1wdF9vZmZzZXQpOwo+ID4gPiAgIyBkZWZpbmUgY2FudF9zbGVlcCgpIFwK
PiA+ID4gICAgICAgZG8geyBfX2NhbnRfc2xlZXAoX19GSUxFX18sIF9fTElORV9fLCAwKTsgfSB3
aGlsZSAoMCkKPiA+ID4gICMgZGVmaW5lIHNjaGVkX2Fubm90YXRlX3NsZWVwKCkgICAgICAoY3Vy
cmVudC0+dGFza19zdGF0ZV9jaGFuZ2UgPSAwKQo+ID4gPiArLyoqCj4gPiA+ICsgKiBub25fYmxv
Y2tfc3RhcnQgLSBhbm5vdGF0ZSB0aGUgc3RhcnQgb2Ygc2VjdGlvbiB3aGVyZSBzbGVlcGluZyBp
cyBwcm9oaWJpdGVkCj4gPiA+ICsgKgo+ID4gPiArICogVGhpcyBpcyBvbiBiZWhhbGYgb2YgdGhl
IG9vbSByZWFwZXIsIHNwZWNpZmljYWxseSB3aGVuIGl0IGlzIGNhbGxpbmcgdGhlIG1tdQo+ID4g
PiArICogbm90aWZpZXJzLiBUaGUgcHJvYmxlbSBpcyB0aGF0IGlmIHRoZSBub3RpZmllciB3ZXJl
IHRvIGJsb2NrIG9uLCBmb3IgZXhhbXBsZSwKPiA+ID4gKyAqIG11dGV4X2xvY2soKSBhbmQgaWYg
dGhlIHByb2Nlc3Mgd2hpY2ggaG9sZHMgdGhhdCBtdXRleCB3ZXJlIHRvIHBlcmZvcm0gYQo+ID4g
PiArICogc2xlZXBpbmcgbWVtb3J5IGFsbG9jYXRpb24sIHRoZSBvb20gcmVhcGVyIGlzIG5vdyBi
bG9ja2VkIG9uIGNvbXBsZXRpb24gb2YKPiA+ID4gKyAqIHRoYXQgbWVtb3J5IGFsbG9jYXRpb24u
IE90aGVyIGJsb2NraW5nIGNhbGxzIGxpa2Ugd2FpdF9ldmVudCgpIHBvc2Ugc2ltaWxhcgo+ID4g
PiArICogaXNzdWVzLgo+ID4gPiArICovCj4gPiA+ICsjIGRlZmluZSBub25fYmxvY2tfc3RhcnQo
KSBcCj4gPiA+ICsgICAgIGRvIHsgY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50Kys7IH0gd2hpbGUg
KDApCj4gPiA+ICsvKioKPiA+ID4gKyAqIG5vbl9ibG9ja19lbmQgLSBhbm5vdGF0ZSB0aGUgZW5k
IG9mIHNlY3Rpb24gd2hlcmUgc2xlZXBpbmcgaXMgcHJvaGliaXRlZAo+ID4gPiArICoKPiA+ID4g
KyAqIENsb3NlcyBhIHNlY3Rpb24gb3BlbmVkIGJ5IG5vbl9ibG9ja19zdGFydCgpLgo+ID4gPiAr
ICovCj4gPiA+ICsjIGRlZmluZSBub25fYmxvY2tfZW5kKCkgXAo+ID4gPiArICAgICBkbyB7IFdB
Uk5fT04oY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50LS0gPT0gMCk7IH0gd2hpbGUgKDApCj4gPgo+
ID4gY2hlY2stcGF0Y2ggZG9lcyBub3QgbGlrZSB0aGVzZSwgYW5kIEkgYWdyZWUKPiA+Cj4gPiAj
MTAxOiBGSUxFOiBpbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjI0ODoKPiA+ICsjIGRlZmluZSBub25f
YmxvY2tfc3RhcnQoKSBcCj4gPiArICAgICAgIGRvIHsgY3VycmVudC0+bm9uX2Jsb2NrX2NvdW50
Kys7IH0gd2hpbGUgKDApCj4gPgo+ID4gL3RtcC90bXAxc3BmeHVmeS8wMDA2LWtlcm5lbC1oLUFk
ZC1ub25fYmxvY2tfc3RhcnQtZW5kLS5wYXRjaDoxMDg6IFdBUk5JTkc6IFNpbmdsZSBzdGF0ZW1l
bnQgbWFjcm9zIHNob3VsZCBub3QgdXNlIGEgZG8ge30gd2hpbGUgKDApIGxvb3AKPiA+ICMxMDg6
IEZJTEU6IGluY2x1ZGUvbGludXgva2VybmVsLmg6MjU1Ogo+ID4gKyMgZGVmaW5lIG5vbl9ibG9j
a19lbmQoKSBcCj4gPiArICAgICAgIGRvIHsgV0FSTl9PTihjdXJyZW50LT5ub25fYmxvY2tfY291
bnQtLSA9PSAwKTsgfSB3aGlsZSAoMCkKPiA+Cj4gPiBQbGVhc2UgdXNlIGEgc3RhdGljIGlubGlu
ZT8KPiAKPiBXZSBuZWVkIGdldF9jdXJyZW50KCkgcGx1cyB0aGUgdGFza19zdHJ1Y3QsIHNvIHRo
aXMgZ2V0cyByZWFsIG1lc3N5Cj4gcmVhbCBmYXN0LiBOb3QgZXZlbiBzdXJlIHdoaWNoIGhlYWRl
ciB0aGlzIHdvdWxkIGZpdCBpbiwgb3Igd2hldGhlcgo+IEknZCBuZWVkIHRvIGNyZWF0ZSBhIG5l
dyBvbmUuIFlvdSdyZSBpbnNpc3Rpbmcgb24gdGhpcyBvciByZXNwaW5uaW5nCj4gd2l0aCB0aGUg
ZG8geyB9IHdoaWxlICgwKSBkcm9wcGVkIG9rLgoKTXkgcHJlZmVybmNlIGlzIGFsd2F5cyBhIHN0
YXRpYyBpbmxpbmUsIGJ1dCBpZiB0aGUgaGVhZGVycyBhcmUgc28KdHdpc3R5IHdlIG5lZWQgdG8g
dXNlICNkZWZpbmUgdG8gc29sdmUgYSBtaXNzaW5nIGluY2x1ZGUsIHRoZW4gSQp3b3VsZG4ndCBp
bnNpc3Qgb24gaXQuCgpJZiBkcm9wcGluZyBkbyB3aGlsZSBpcyB0aGUgb25seSBjaGFuZ2UgdGhl
biBJIGNhbiBlZGl0IGl0IGluLi4KSSB0aGluayB3ZSBoYXZlIHRoZSBhY2tzIG5vdwoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
