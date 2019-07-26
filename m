Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D978628
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5789CDE;
	Mon, 29 Jul 2019 07:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1206ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:45:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i21so51221494ljj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIyzRbatR38ttllEYMMotwwVkanyqchmaJcpYBpIki0=;
 b=DT/bcKvBhsYHOpKGQYoL7SQfaOqSl27vJiXmkKmrOp3WaMLNWHy5hyNj1wrW28FJWw
 cx4j245TmCGchtjVaUhVVIRJVTvpdZfjXREc2TIoEBUQ/kDAKca5UeYw4IVWbIssVnbg
 F1VDFR/HGifTGJCKGQyDWocoWV5rWY9UwScJCSGKqYh6SaQNP/pcRPpXxXj1Krm0t0eJ
 sK3G3jeQiQ/byHzOFpSxmnn/wogeaiLmxURIGnTu41ivYVvH8iw56h/YL2gQs/NlH1Xb
 mPNrBYYRVqi5fRC5XpKC5ljwUUdbUmGsIzsXHae1cBmvKdyI+Zafc0oQ1VdnCx1g/xOH
 nErQ==
X-Gm-Message-State: APjAAAW6MeCdLTPrvXubfAe4SEiqyG2Wlc4PTBLIGfxARUxK6d7h4dDZ
 fiAVGgIM5y2sWTRS9Ne9fnMaNhs28Qd9nnEPbF4=
X-Google-Smtp-Source: APXvYqy1v+K91LR9Uqf7ttTOrc82KHvHW4Tm7nxGruwvykh6mSwzjj9McmHGuJKaCGbsiBx37LheJaMcKc4BiMCDW/c=
X-Received: by 2002:a2e:3602:: with SMTP id d2mr13542107lja.112.1564141528767; 
 Fri, 26 Jul 2019 04:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <3b922aa4-c6d4-e4a4-766d-f324ff77f7b5@linux.com>
 <40f8b7d8-fafa-ad99-34fb-9c63e34917e2@redhat.com>
 <CALAqxLU199ATrMFa2ARmHOZ3K6ZnOuDLSAqNrTfwOWJaYiW7Yg@mail.gmail.com>
 <CALAqxLU0VUp=PGx5=JuVp6c5gwLqpSZJxs7ieL631QhdzNQTyA@mail.gmail.com>
In-Reply-To: <CALAqxLU0VUp=PGx5=JuVp6c5gwLqpSZJxs7ieL631QhdzNQTyA@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Fri, 26 Jul 2019 07:45:17 -0400
Message-ID: <CAEXW_YQFKhfS=2-LkkDkSg_1XzWh9WUa__nWjqxL0Uts9yyDdg@mail.gmail.com>
Subject: Re: Limits for ION Memory Allocator
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IIyzRbatR38ttllEYMMotwwVkanyqchmaJcpYBpIki0=;
 b=pETxnGiWkSphfi8/+4c4u+22brSho8PFLYphcLagT7bB4i3SZD16fRKJ1ZGb4qp9QL
 XlEsF8oKodWUi4PTu9/XdlUG9gA1pNqyjoA1KsmDLbgysBzBCd4nQcFsDELuCIbpAPhL
 21AoZAsF7HFuXv/4+6Ros9QR2I6qyBtvICViA=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 driverdevel <devel@driverdev.osuosl.org>, Erick Reyes <erickreyes@google.com>,
 Christian Brauner <christian@brauner.io>, Dmitry Vyukov <dvyukov@google.com>,
 alex.popov@linux.com, Alistair Delva <adelva@google.com>,
 Todd Kjos <tkjos@android.com>, Andrey Konovalov <andreyknvl@google.com>,
 Chenbo Feng <fengc@google.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Riley Andrews <riandrews@android.com>, syzkaller <syzkaller@googlegroups.com>,
 Martijn Coenen <maco@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Mark Brown <broonie@kernel.org>, Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgNDoyNCBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAxOjE4IFBNIEpv
aG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IEp1bCAyNCwgMjAxOSBhdCAxMjozNiBQTSBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDcvMTcvMTkgMTI6MzEgUE0sIEFsZXhhbmRlciBQb3Bv
diB3cm90ZToKPiA+ID4gPiBIZWxsbyEKPiA+ID4gPgo+ID4gPiA+IFRoZSBzeXprYWxsZXIgWzFd
IGhhcyBhIHRyb3VibGUgd2l0aCBmdXp6aW5nIHRoZSBMaW51eCBrZXJuZWwgd2l0aCBJT04gTWVt
b3J5Cj4gPiA+ID4gQWxsb2NhdG9yLgo+ID4gPiA+Cj4gPiA+ID4gU3l6a2FsbGVyIHVzZXMgc2V2
ZXJhbCBtZXRob2RzIFsyXSB0byBsaW1pdCBtZW1vcnkgY29uc3VtcHRpb24gb2YgdGhlIHVzZXJz
cGFjZQo+ID4gPiA+IHByb2Nlc3NlcyBjYWxsaW5nIHRoZSBzeXNjYWxscyBmb3IgdGVzdGluZyB0
aGUga2VybmVsOgo+ID4gPiA+ICAgLSBzZXRybGltaXQoKSwKPiA+ID4gPiAgIC0gY2dyb3VwcywK
PiA+ID4gPiAgIC0gdmFyaW91cyBzeXNjdGwuCj4gPiA+ID4gQnV0IHRoZXNlIG1ldGhvZHMgZG9u
J3Qgd29yayBmb3IgSU9OIE1lbW9yeSBBbGxvY2F0b3IsIHNvIGFueSB1c2Vyc3BhY2UgcHJvY2Vz
cwo+ID4gPiA+IHRoYXQgaGFzIGFjY2VzcyB0byAvZGV2L2lvbiBjYW4gYnJpbmcgdGhlIHN5c3Rl
bSB0byB0aGUgb3V0LW9mLW1lbW9yeSBzdGF0ZS4KPiA+ID4gPgo+ID4gPiA+IEFuIGV4YW1wbGUg
b2YgYSBwcm9ncmFtIGRvaW5nIHRoYXQ6Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ICNpbmNsdWRl
IDxzeXMvdHlwZXMuaD4KPiA+ID4gPiAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KPiA+ID4gPiAjaW5j
bHVkZSA8ZmNudGwuaD4KPiA+ID4gPiAjaW5jbHVkZSA8c3RkaW8uaD4KPiA+ID4gPiAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KPiA+ID4gPiAjaW5jbHVkZSA8c3lzL2lvY3RsLmg+Cj4gPiA+ID4K
PiA+ID4gPiAjZGVmaW5lIElPTl9JT0NfTUFHSUMgICAgICAgICAnSScKPiA+ID4gPiAjZGVmaW5l
IElPTl9JT0NfQUxMT0MgICAgICAgICBfSU9XUihJT05fSU9DX01BR0lDLCAwLCBcCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlvbl9hbGxvY2F0aW9u
X2RhdGEpCj4gPiA+ID4KPiA+ID4gPiBzdHJ1Y3QgaW9uX2FsbG9jYXRpb25fZGF0YSB7Cj4gPiA+
ID4gICAgICAgX191NjQgbGVuOwo+ID4gPiA+ICAgICAgIF9fdTMyIGhlYXBfaWRfbWFzazsKPiA+
ID4gPiAgICAgICBfX3UzMiBmbGFnczsKPiA+ID4gPiAgICAgICBfX3UzMiBmZDsKPiA+ID4gPiAg
ICAgICBfX3UzMiB1bnVzZWQ7Cj4gPiA+ID4gfTsKPiA+ID4gPgo+ID4gPiA+IGludCBtYWluKHZv
aWQpCj4gPiA+ID4gewo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgaSA9IDA7Cj4gPiA+ID4g
ICAgICAgaW50IGZkID0gLTE7Cj4gPiA+ID4gICAgICAgc3RydWN0IGlvbl9hbGxvY2F0aW9uX2Rh
dGEgZGF0YSA9IHsKPiA+ID4gPiAgICAgICAgICAgICAgIC5sZW4gPSAweDEzZjY1ZDhjLAo+ID4g
PiA+ICAgICAgICAgICAgICAgLmhlYXBfaWRfbWFzayA9IDEsCj4gPiA+ID4gICAgICAgICAgICAg
ICAuZmxhZ3MgPSAwLAo+ID4gPiA+ICAgICAgICAgICAgICAgLmZkID0gLTEsCj4gPiA+ID4gICAg
ICAgICAgICAgICAudW51c2VkID0gMAo+ID4gPiA+ICAgICAgIH07Cj4gPiA+ID4KPiA+ID4gPiAg
ICAgICBmZCA9IG9wZW4oIi9kZXYvaW9uIiwgMCk7Cj4gPiA+ID4gICAgICAgaWYgKGZkID09IC0x
KSB7Cj4gPiA+ID4gICAgICAgICAgICAgICBwZXJyb3IoIlstXSBvcGVuIC9kZXYvaW9uIik7Cj4g
PiA+ID4gICAgICAgICAgICAgICByZXR1cm4gMTsKPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4KPiA+
ID4gPiAgICAgICB3aGlsZSAoMSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgcHJpbnRmKCJpdGVy
ICVsdVxuIiwgaSk7Cj4gPiA+ID4gICAgICAgICAgICAgICBpb2N0bChmZCwgSU9OX0lPQ19BTExP
QywgJmRhdGEpOwo+ID4gPiA+ICAgICAgICAgICAgICAgaSsrOwo+ID4gPiA+ICAgICAgIH0KPiA+
ID4gPgo+ID4gPiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gSSBsb29rZWQgdGhyb3VnaCB0aGUgY29kZSBvZiBpb25fYWxsb2MoKSBhbmQgZGlkbid0
IGZpbmQgYW55IGxpbWl0IGNoZWNrcy4KPiA+ID4gPiBJcyBpdCBjdXJyZW50bHkgcG9zc2libGUg
dG8gbGltaXQgSU9OIGtlcm5lbCBhbGxvY2F0aW9ucyBmb3Igc29tZSBwcm9jZXNzPwo+ID4gPiA+
Cj4gPiA+ID4gSWYgbm90LCBpcyBpdCBhIHJpZ2h0IGlkZWEgdG8gZG8gdGhhdD8KPiA+ID4gPiBU
aGFua3MhCj4gPiA+ID4KPiA+ID4KPiA+ID4gWWVzLCBJIGRvIHRoaW5rIHRoYXQncyB0aGUgcmln
aHQgYXBwcm9hY2guIFdlJ3JlIHdvcmtpbmcgb24gbW92aW5nIElvbgo+ID4gPiBvdXQgb2Ygc3Rh
Z2luZyBhbmQgdGhpcyBpcyBzb21ldGhpbmcgSSBtZW50aW9uZWQgdG8gSm9obiBTdHVsdHouIEkg
ZG9uJ3QKPiA+ID4gdGhpbmsgd2UndmUgdGhvdWdodCB0b28gaGFyZCBhYm91dCBob3cgdG8gZG8g
dGhlIGFjdHVhbCBsaW1pdGluZyBzbwo+ID4gPiBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZS4KPiA+
Cj4gPiBJbiBwYXJ0IHRoZSBkbWFidWYgaGVhcHMgYWxsb3cgZm9yIHNlcGFyYXRlIGhlYXAgZGV2
aWNlcywgc28gd2UgY2FuCj4gPiBoYXZlIGZpbmVyIGdyYWluZWQgcGVybWlzc2lvbnMgdG8gdGhl
IHNwZWNpZmljIGhlYXBzLiAgQnV0IHRoYXQKPiA+IGRvZXNuJ3QgcHJvdmlkZSBhbnkgY29udHJv
bHMgb24gaG93IG11Y2ggbWVtb3J5IG9uZSBwcm9jZXNzIGNvdWxkCj4gPiBhbGxvY2F0ZSB1c2lu
ZyB0aGUgZGV2aWNlIGlmIGl0IGhhcyBwZXJtaXNzaW9uLgo+ID4KPiA+IEkgc3VzcGVjdCB0aGUg
c2FtZSBpc3N1ZSBpcyBwcmVzZW50IHdpdGggYW55IG9mIHRoZSBkbWFidWYgZXhwb3J0ZXJzCj4g
PiAoZ3B1L2Rpc3BsYXkgZHJpdmVycywgZXRjKSwgc28gdGhpcyBpcyBsZXNzIG9mIGFuIElPTi9k
bWFidWYgaGVhcAo+ID4gaXNzdWUgYW5kIG1vcmUgb2YgYSBkbWFidWYgY29yZSBhY2NvdW50aW5n
IGlzc3VlLgo+ID4KPgo+IEFsc28sIGRvIHVubWFwcGVkIG1lbWZkIGJ1ZmZlcnMgaGF2ZSBzaW1p
bGFyIGFjY291bnRpbmcgaXNzdWVzPwo+CgpUaGUgc3l6Y2FsbGVyIGJvdCBkaWRuJ3QgY29tcGxh
aW4gYWJvdXQgdGhpcyBmb3IgbWVtZmQgeWV0LCBzbyBJIHN1c3BlY3Qgbm90IDstKQoKV2l0aCBt
ZW1mZCBzaW5jZSBpdCB1c2VzIHNobWVtIHVuZGVybmVhdGgsIF9fdm1fZW5vdWdoX21lbW9yeSgp
IGlzCmNhbGxlZCBkdXJpbmcgc2htZW1fYWNjdF9ibG9jaygpIHdoaWNoIHNob3VsZCB0YWtlIHBl
ci1wcm9jZXNzIG1lbW9yeQppbnRvIGFjY291bnQgYWxyZWFkeSBhbmQgZmFpbCBpZiB0aGVyZSBp
cyBub3QgZW5vdWdoIG1lbW9yeS4KClNob3VsZCBJT04gYmUgZG9pbmcgc29tZXRoaW5nIHNpbWls
YXIgdG8gZmFpbCBpZiB0aGVyZSdzIG5vdCBlbm91Z2ggbWVtb3J5PwoKdGhhbmtzLAoKLSBKb2Vs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
