Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E908112BA5
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 12:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB24789BF0;
	Fri,  3 May 2019 10:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF45D89BF0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 10:42:30 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id w18so175581vke.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 03:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dk+RDDVYeKZje/8yURfseyKnVeA6UiFaM9Kdn1ybUGc=;
 b=CNTR7HFUNUSY7yRb2zYkWHjFz17ryqWgwNAwBNCutpp+7RylSGb1A4D6YPIjC4NMIB
 vG5HzhrUt7C00ttN+W+kFR667DH1IQ4PTTby9o0wpcjPrw6+HJGZqhmbt9h7ihAog/gA
 WlMTXwp0MPilw8uktULqi0Q8ZqYgJaO3qmKtsbxL8fo2TdA2wxM/ek1uisFYUoyd3YlB
 CDtiSjqhRTWGpjkbkzplp0BIbGsWMNXrurW6l7ds3CCQkdCCbpJNPszyJ9mOxXnPyt7N
 7ceElG2zOWPeWMtHcobZU2p6AztQDhNEIBF/H0F4utXDSiDmikUL84oe/CJygHqmeGOw
 b01w==
X-Gm-Message-State: APjAAAW1CR1k8peUkr+mo8uhDxzeiVtxbrTZc+wIXOOS5xtdq++9BHsu
 TAc7yo4zm8MxmQ2WrVrF+NDbtlML0GSbjO4B5fQ=
X-Google-Smtp-Source: APXvYqygzHLcCoI2gQ1lBdVd11Jw5psaBpPMg6mk58ql9Gplpt+tf8izJxqd81lXcpKNDcVjxueOUdtqjHhtpFXF3MM=
X-Received: by 2002:a1f:6d46:: with SMTP id i67mr4782475vkc.50.1556880149948; 
 Fri, 03 May 2019 03:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
 <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
 <CALQgHdmcPgGrW+0TfH6V3UGPwkf5i6SBsDPbag-4zNpvxJ+qAg@mail.gmail.com>
 <CAJs_Fx6ZjeVKL2pSs7TKO3DAxg0-O7KPzwc_y6jk-rm6A9CgGg@mail.gmail.com>
In-Reply-To: <CAJs_Fx6ZjeVKL2pSs7TKO3DAxg0-O7KPzwc_y6jk-rm6A9CgGg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 3 May 2019 11:41:42 +0100
Message-ID: <CACvgo50x7jbnQU_AvNw_ASa3f_=oy+LDWTNbchCEx97Ncamcbw@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: Rob Clark <robdclark@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dk+RDDVYeKZje/8yURfseyKnVeA6UiFaM9Kdn1ybUGc=;
 b=TLWY9kmgeC4F0ce83uPnPzQyiFBSl7C8XmlJ0MF5a+MTQlLSOSQvUmqDA1X2d2LAD4
 OKPqXoD6PjfivJWuFM5ejtFALjNo53xwWCfdAwffjqCm3DGsw23XiBW4Z5pLGKOoDKq1
 Nvya7zm/DHdaVx4jCJuRzOkX3Owf85kyMvBciuaCGFDfAhdc2Zt6WetMPOF+UUJ2+3bH
 Q3kARHnhRQEFDbQ4am+rn9psIM7ZC7RYn8lGK7MdKaqqXzaJ8hutio7piI34rVDhr3o5
 P0Ah3A7lLEevXyUpL5uhyBoS7wpFLYGlhyOpzO60OOaUYxXIBjQLRCQTCsj6gv1OVy0L
 KJaw==
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Greg Hartman <ghartman@google.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Willemsen <dwillemsen@google.com>, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyIE1heSAyMDE5IGF0IDIzOjE5LCBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1
bS5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMiwgMjAxOSBhdCAyOjU3IFBNIERhbiBXaWxs
ZW1zZW4gPGR3aWxsZW1zZW5AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBNYXkg
MiwgMjAxOSBhdCAxOjUyIFBNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gV2UgbmVlZCBzb2x1dGlvbnMgZm9yIHRoZSB4Z2V0dGV4dCBhbmQg
dGhlIHB5dGhvbi1tYWtvIHVzYWdlLgo+ID4KPiA+ICBBbmRyb2lkIGRvZXNuJ3Qgc3VwcG9ydCB0
cmFuc2xhdGlvbnMgYXQgdGhpcyBsZXZlbCwgc28geW91IG1heSBiZQo+ID4gYWJsZSB0byBqdXN0
IHNraXAgeGdldHRleHQgYWx0b2dldGhlci4KPiA+Cj4KPiBmcm9tIHF1aWNrIGxvb2ssIGdldHRl
eHQgaXMganVzdCBuZWVkZWQgZm9yIGRvY3MgYnVpbGQgKHdoaWNoIEkgZ3Vlc3MKPiBhbmRyb2lk
IGRvZXNuJ3QgZG8pIGFuZCBkcmljb25mIChub3Qgc3VwcG9ydGVkIG9uIGFuZHJvaWQgYWZhaXUs
Cj4gYWx0aG91Z2ggaXQgY291bGQgYmUgbmljZSBpZiB0aGVyZSB3YXMgYSB3YXkgdG8gc3VwcG9y
dCBzb21ldGhpbmcgbGlrZQo+IGRyaWNvbmYgb24gYW5kcm9pZCwgYnV0IEkgZ3Vlc3MgYSBkaWZm
ZXJlbnQgdG9waWNbMV0pLi4gc28geWVhaCwKPiBwcm9iYWJseSBub3QgbmVlZGVkCj4KUHJldHR5
IG11Y2ggd2hhdCBJJ3ZlIG1lbnRpb25lZCBsYXN0IHRpbWUgSm9obiBicm91Z2h0IHRoZSBnZXR0
ZXh0CnBhdGNoZXMgLSBzaW1wbHkgZGlzYWJsZS9kcm9wIHRoZSB0aGluZyBmb3IgQW5kcm9pZC4K
Ck9uZSBvZiB0aGVzZSBkYXlzIHdlIHNob3VsZCBldmVuIGxvb2sgY2xvc2VseSBhdCB0aGVzZSAi
d2FubmEtYmUKdHJhbnNsYXRpb25zLCB5ZXQgOTAlIG5vdCB0cmFuc2xhdGVkIiBhbmQgZHJvcCBh
bGwgdG9nZXRoZXI/CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
