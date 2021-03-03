Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732AB32BA69
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 21:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDBD6E091;
	Wed,  3 Mar 2021 20:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8F06E091
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 20:49:08 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id h10so14311726otm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iB/ACh6Vjkgd19j4zuYvvxXfGoSPQltsYU/5Vb0MU/0=;
 b=QHGBYd5Yx6ZYIC937KpwxvjCnRnYaRkSdoUlFJTVwgSh5nGv9isWk1zTInTUcrRthi
 uDVY+t2YzRldwgKK9zZRIMIgLfRhXXtv9cxSMUNwybDsGdZCQ6g8CQoXDEQsCulxuG0v
 dwmy8V8MMSnW650tcHiIf18Zfp2xHuTQAA/9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iB/ACh6Vjkgd19j4zuYvvxXfGoSPQltsYU/5Vb0MU/0=;
 b=qveoZ01QauaTnMBcfBewePNMxugW3ic0nZGQD9D/LVyBnKbwU5E1rXU7kw03Bb8vUD
 lAf70FvS4oC7ucSUXX1ununQhXI+6xpjDlG8U2liuixtfLexy9rnRdJ1K7AeYHODxnkE
 HuYu/FFZSevWxMO4I8STDPdqOCLqEnaX6wv8YRpIZ/7iQDJoXnRsGpm7LDah97QCE5am
 S7sp+KSKWTBwXgch7MThKL9Xcun2/ahfHKSyHFmCCgAECZkBWg1hN2lgST3l9cYgv/Vk
 WN6zgo32IwJB0gdM7UxWNZ6N0yuWomckR4s7vea1HYGlLKbKrtP08Cw6wnGzUiW3KnHF
 NLcA==
X-Gm-Message-State: AOAM530H9ZEwGvb7WnuaR+uXWF23X3Dw/zfJFK2z+ya3ZNYwf0IwGxUo
 Gc1+NjQ7QlKfaBalJ2K1IsUT5fxd9MvIlFsuvXWiirvjEhM=
X-Google-Smtp-Source: ABdhPJzXlP1qEMdOTDOPk9OGghI/NYNHDd6aWLeOVnQsrJxXjEqONgzndde9PaqRyCWgngzCjSW+m7EzBSoRXGr1yKo=
X-Received: by 2002:a9d:648f:: with SMTP id g15mr803238otl.188.1614804547664; 
 Wed, 03 Mar 2021 12:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20210303155757.82497-1-christian.koenig@amd.com>
 <CAKMK7uFgCxZeX3bPzfStdX0LMXc2MVTAZTY_jLJ66k+=Qnvgng@mail.gmail.com>
 <0636c6e8-4532-20eb-d361-3cfb30d62717@gmail.com>
In-Reply-To: <0636c6e8-4532-20eb-d361-3cfb30d62717@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Mar 2021 21:48:56 +0100
Message-ID: <CAKMK7uGtHyZ1VM1jQotxEJWyLobysWMnqgushJRNYg6t6O6XDw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: soften TTM warnings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMywgMjAyMSBhdCA5OjM2IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBBbSAwMy4wMy4yMSB1bSAx
ODoxOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIE1hciAzLCAyMDIxIGF0IDQ6
NTcgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwu
Y29tPiB3cm90ZToKPiA+PiBRWEwgaW5kZWVkIHVucmVmcyBwaW5uZWQgQk9zIGFuZCB0aGUgd2Fy
bmluZ3MgYXJlIHNwYW1taW5nIHBlb3BsZXMgbG9nIGZpbGVzLgo+ID4+Cj4gPj4gTWFrZSBzdXJl
IHdlIHdhcm4gb25seSBvbmNlIHVudGlsIHRoZSBRWEwgZHJpdmVyIGlzIGZpeGVkLgo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+ID4gQ2FuIHlvdSBwbHMgYWRkIEZJWE1FIGNvbW1lbnRzIHRvIGVhY2ggdGhhdCBxeGwg
aXMgYnJva2VuIGFuZCBuZWVkcyB0bwo+ID4gYmUgZml4ZWQgZmlyc3Q/IEFsc28gcGxlYXNlIGFk
ZCBhIFJlZmVyZW5jZXM6IGxpbmsgdG8gdGhlIGJ1ZyByZXBvcnQKPiA+IG9uIGxvcmUua2VybmVs
Lm9yZyBvciB3aGVyZXZlciBpdCB3YXMuCj4KPiBXYXMgdGhlcmUgYSBidWcgcmVwb3J0PyBJIG9u
bHkgZ290IG5vdGlmaWNhdGlvbnMgYnkgbWFpbCBzbyBmYXIuCgpXZWxsIHRoYXQncyBob3cgYnVn
IHJlcG9ydHMgd29yayBpbiB0aGUgd2lkZXIga2VybmVsIGNvbW11bml0eS4gWW91Cm5lZWQgdG8g
ZmlzaCBvdXQgdGhlIHJpZ2h0IGxpbmsgZnJvbSBtYWlsIGFyY2hpdmVzIGFuZCBsaW5rIHRvIHRo
b3NlLgoKWWVzIGl0J3Mgbm90IGdyZWF0LCBidXQgaXQncyBpbW8gYmV0dGVyIHRvIHJlZmVyZW5j
ZSB0aGVzZSBidWcgcmVwb3J0cwp0aGFuIGhhdmUgbm90aGluZyBhdCBhbGwuCi1EYW5pZWwKCj4K
PiBDaHJpc3RpYW4uCj4KPiA+Cj4gPiBXaXRoIHRoYXQ6IHItYjogbWUKPiA+IC1EYW5pZWwKPiA+
Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNSArKystLQo+
ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4+IGluZGV4IDIwYTI1NjYwYjM1Yi4uMjQ1ZmEyYzA1
OTI3IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiA+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPj4gQEAgLTEzNiw3ICsxMzYsOCBA
QCB2b2lkIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCj4gPj4gICAgICAgICAgc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsK
PiA+PiAgICAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsKPiA+Pgo+ID4+
IC0gICAgICAgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4gPj4gKyAgICAg
ICBpZiAoIWJvLT5kZWxldGVkKQo+ID4+ICsgICAgICAgICAgICAgICBkbWFfcmVzdl9hc3NlcnRf
aGVsZChiby0+YmFzZS5yZXN2KTsKPiA+Pgo+ID4+ICAgICAgICAgIGlmIChiby0+cGluX2NvdW50
KSB7Cj4gPj4gICAgICAgICAgICAgICAgICB0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKPiA+PiBA
QCAtNTA5LDcgKzUxMCw3IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVm
ICprcmVmKQo+ID4+ICAgICAgICAgICAgICAgICAgICogc2hyaW5rZXJzLCBub3cgdGhhdCB0aGV5
IGFyZSBxdWV1ZWQgZm9yCj4gPj4gICAgICAgICAgICAgICAgICAgKiBkZXN0cnVjdGlvbi4KPiA+
PiAgICAgICAgICAgICAgICAgICAqLwo+ID4+IC0gICAgICAgICAgICAgICBpZiAoV0FSTl9PTihi
by0+cGluX2NvdW50KSkgewo+ID4+ICsgICAgICAgICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKGJv
LT5waW5fY291bnQpKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJvLT5waW5fY291
bnQgPSAwOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICB0dG1fYm9fbW92ZV90b19scnVf
dGFpbChibywgJmJvLT5tZW0sIE5VTEwpOwo+ID4+ICAgICAgICAgICAgICAgICAgfQo+ID4+IC0t
Cj4gPj4gMi4yNS4xCj4gPj4KPiA+Cj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
