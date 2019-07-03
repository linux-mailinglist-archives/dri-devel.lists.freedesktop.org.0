Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87B5ECCF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 21:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F906E1BA;
	Wed,  3 Jul 2019 19:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072976E1BA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 19:36:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b2so2853799wrx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 12:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZrIncsFb2XbVt8gYJ6XL/Afg4bsZgxtDJ8pkU7/Fg2o=;
 b=Ri99qKsBJqEuKo7XaYndHWBHDp/P2pT9Tky94KPUfq39IlWs+3ef7XAJUMOQtiS+LM
 4726ghUsIS5CKJM6k62hxZLbe5nUMyQsn82vAzx4ZB/UEMMGbwKzRdzUnDYLkAD5rsSS
 qLA7umjqmMrQozgAwqBKtlzjwKFyh2ZgRr/qxAKU5d/1cby0KAg351i4rUmGahIH8Ox8
 tfislg7wl6V1/rRnSXPJlqpIsO+McYlhHbyrhQBX4aHlNI4NB7dUYmZkCFmSjClJCYgZ
 Hy9RbVVY9ybPe9uLUs4yJFw4FqFcnRLQYYRXgPAOt1062owThzWqaEO+idZJqLnZEh3k
 mBRw==
X-Gm-Message-State: APjAAAWTeL13SGLFxw3wH5x4W4jCvcR6OW9asjZsljyMpKDxSiD2Y0GL
 oIPLHPABTJRdLSGfiIPsGpsQzrWM1ZzUAd7M3+oMLQ==
X-Google-Smtp-Source: APXvYqw1q6SHE/IpfbNzvKq9H4+8uNw+R7FjPQlQRrC7n5MY48KnfoJyYmXEkUg6tRzFiFSyBS2w8aU+Bf3uzd7IdmI=
X-Received: by 2002:adf:afe8:: with SMTP id y40mr28449792wrd.328.1562182584497; 
 Wed, 03 Jul 2019 12:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
 <20190703083745.GB8996@kroah.com>
 <CAKMK7uFAaw3sL_A6gGOeot80fvukjZqprLptLER=riA1_p4zWw@mail.gmail.com>
 <759555d8-98bf-44d3-4fa3-3d927f9a33db@redhat.com>
In-Reply-To: <759555d8-98bf-44d3-4fa3-3d927f9a33db@redhat.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 3 Jul 2019 12:36:13 -0700
Message-ID: <CALAqxLVvEjTbp9P=btOhTugFONWT9wS6Bjmync=WubYknvnE6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
To: Laura Abbott <labbott@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZrIncsFb2XbVt8gYJ6XL/Afg4bsZgxtDJ8pkU7/Fg2o=;
 b=bjpt+nLU+gbgbmbsSfBF3BsVRKeV/L7MxX+noqPRlNeKcKJIKfT+ekgwXRUm+4fnao
 wyQHTb5lqZbfXj7dA1VfgXrhUTnANw1JlIGP4YWxphG0W8/8c80tefkTJsLBqrp/pfkv
 9a0uz/4aeihNuexVWNj4VrGTXAtEiM3yJWMEJa/Qf/tLmuN0Tww9Jr9XYLANqjvj8ss7
 27jzV5Ijzv00Dml/Q3x7J0tc6bVQuZVxwzsw+SSRgsgCjuVFqyy3E8RQHtp0JTOLWZEt
 Tur9F9+E+lisy9wuAC1FjSlki7TsxPJsLG9nZifswG7SOgbC4cxkZnRHIvDkwSIJ2s38
 HtWg==
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Todd Kjos <tkjos@android.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, John Reitan <John.Reitan@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 christian@brauner.io
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCA0OjMyIEFNIExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIDcvMy8xOSA1OjUwIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gT24gV2VkLCBKdWwgMywgMjAxOSBhdCAxMDozNyBBTSBHcmVnIEtIIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBXZWQsIEp1bCAwMywgMjAxOSBh
dCAwMTo0ODo0MVBNICswNTMwLCBOaXNoa2EgRGFzZ3VwdGEgd3JvdGU6Cj4gPj4+IFJlbW92ZSBm
aWxlIGlvbl9jYXJ2ZW91dF9oZWFwLmMgYXMgaXRzIGZ1bmN0aW9ucyBhbmQgZGVmaW5pdGlvbnMg
YXJlIG5vdAo+ID4+PiB1c2VkIGFueXdoZXJlLgo+ID4+PiBJc3N1ZSBmb3VuZCB3aXRoIENvY2Np
bmVsbGUuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGth
ZGcubGludXhAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICBkcml2ZXJzL3N0YWdpbmcvYW5k
cm9pZC9pb24vS2NvbmZpZyAgICAgICAgICAgfCAgIDkgLS0KPiA+Pj4gICBkcml2ZXJzL3N0YWdp
bmcvYW5kcm9pZC9pb24vTWFrZWZpbGUgICAgICAgICAgfCAgIDEgLQo+ID4+PiAgIC4uLi9zdGFn
aW5nL2FuZHJvaWQvaW9uL2lvbl9jYXJ2ZW91dF9oZWFwLmMgICB8IDEzMyAtLS0tLS0tLS0tLS0t
LS0tLS0KPiA+Pgo+ID4+IEkga2VlcCB0cnlpbmcgdG8gZG8gdGhpcywgYnV0IG90aGVycyBwb2lu
dCBvdXQgdGhhdCB0aGUgaW9uIGNvZGUgaXMKPiA+PiAiZ29pbmcgdG8gYmUgZml4ZWQgdXAgc29v
biIgYW5kIHRoYXQgcGVvcGxlIHJlbHkgb24gdGhpcyBpbnRlcmZhY2Ugbm93Lgo+ID4+IFdlbGws
ICJjb2RlIG91dHNpZGUgb2YgdGhlIGtlcm5lbCB0cmVlIiByZWxpZXMgb24gdGhpcywgd2hpY2gg
aXMgbm90IG9rLAo+ID4+IGJ1dCB0aGUgInNvb24iIHBlb3BsZSBrZWVwIGluc2lzdGluZyBvbiBp
dC4uLgo+ID4+Cj4gPj4gT2RkcyBhcmUgSSBzaG91bGQganVzdCBkZWxldGUgYWxsIG9mIElPTiwg
YXMgdGhlcmUgaGFzbid0IGJlZW4gYW55Cj4gPj4gZm9yd2FyZCBwcm9ncmVzcyBvbiBpdCBpbiBh
IGxvbmcgdGltZS4KPiA+Pgo+ID4+IEhvcGVmdWxseSB0aGF0IHdha2VzIHNvbWUgcGVvcGxlIHVw
Li4uCj4gPgo+ID4gSm9obiBTdHVsdHogaGFzIGRvbmUgYSBzdGVhZHkgc3RyZWFtIG9uIGlvbiBk
ZXN0YWdpbmcgcGF0Y2ggc2VyaWVzCj4gPiBwYXN0IGZldyBtb250aHMsIHVuZCB0aGUgaGVhZGlu
ZyBvZiAiRE1BLUJVRiBIZWFwcyIsIHRhcmdldGluZwo+ID4gZHJpdmVycy9kbWEtYnVmLiBJJ20g
bm90IGZvbGxvd2luZyB0aGUgZGV0YWlscywgYW5kIGl0IHNlZW1zIGEgYml0IGEKPiA+IGNyYXds
LCBidXQgdGhlcmUncyBkZWZpbml0ZWx5IHdvcmsgZ29pbmcgb24gLi4uIEp1c3QgcHJvYmFibHkg
bm90Cj4gPiBpbi1wbGFjZSBpbiBzdGFnaW5nIEkgdGhpbmsuCj4gPiAtRGFuaWVsCj4gPgo+Cj4K
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1K
dW5lLzIyMzcwNS5odG1sCj4KPiBJdCBpcyBtYWtpbmcgc2xvdyBhbmQgc3RlYWR5IHByb2dyZXNz
LiBQYXJ0IG9mIHRoaXMgaXMgdHJ5aW5nIHRvCj4gbWFrZSBzdXJlIHdlIGFjdHVhbGx5IGdldCB0
aGlzIHJpZ2h0IGJlZm9yZSBtb3ZpbmcgYW55dGhpbmcKPiBvdXQgb2Ygc3RhZ2luZy4KCkhvcGVm
dWxseSBub3QgdG9vIG11Y2ggbG9uZ2VyLiBUaGUgcmV2aWV3IGZlZWRiYWNrIGhhcyBnb3R0ZW4g
cXVpZXQKcmVjZW50bHkgc28gaG9wZWZ1bGx5IGV2ZXJ5b25lIGlzIG5vZGRpbmcuCgpOb3RlLCBJ
J2QgYWxzbyBmaW5kIGl0IHVzZWZ1bCB0byAqbm90KiBlamVjdCBJT04gaW1tZWRpYXRlbHkgYWZ0
ZXIKZG1hYnVmIGhlYXBzIGxhbmQsIHNpbmNlIGJlaW5nIGFibGUgdG8gZG8gQS9CIHZhbGlkYXRp
b24gb24gdGhlIHNhbWUKa2VybmVsIGlzIHVzZWZ1bCBpZiBmb2xrcyBydW4gaW50byBhbnkgbmV3
IHBlcmYgcmVncmVzc2lvbnMuIEJ1dApob3BlZnVsbHkgdGhhdCB0cmFuc2l0aW9uIHRpbWUgaXMg
ZmFpcmx5IHNtYWxsLgoKPiBUaGF0IHNhaWQsIEkgdGhpbmsgd2UncmUgYXQgdGhlIHBvaW50IHdo
ZXJlIG5vYm9keSB3YW50cyB0aGUKPiBjYXJ2ZW91dCBhbmQgY2h1bmsgaGVhcHMgc28gSSdkIGFj
dHVhbGx5IGJlIG9rYXkgd2l0aCByZW1vdmluZwo+IHRob3NlIGZpbGVzLiBKdXN0IHRvIGJlIGV4
cGxpY2l0Ogo+Cj4gQWNrZWQtYnk6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgoK
QWdyZWVkLiBJIHRoaW5rIHRoZXJlIGFyZSBzb21lIG91dCBvZiB0cmVlIHVzZXMgYnkgQVJNIGFu
ZCBvdGhlcnMgZm9yCnRoZSBjYXJ2ZW91dCBoZWFwcywgYnV0IEkgZG9uJ3Qga25vdyBpZiBhbnlv
bmUgaXMgdXNpbmcgdGhvc2UKdW5tb2RpZmllZCBhbnl3YXkuICBTbyBubyBvYmplY3Rpb24gZnJv
bSBtZSwgYXMgdGhlcmUgaXMgbm8gd2F5IHRvIHVzZQp0aGVtIHVwc3RyZWFtLgoKdGhhbmtzCi1q
b2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
