Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E591641CD6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED6789265;
	Wed, 12 Jun 2019 06:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C56890E4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:37:32 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id j194so5323769ite.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0317WyxAHetn0NHNS7xAQoK7fjU4Bd3mmAZamc45khg=;
 b=YhuBNdeHLOIjRUS0pk2f/ob3vPPiA/41RkUcgdxWAQbGqzyVGwmyWbGrPZiTvfcvfA
 WiOgNxSxDzpaW+qrEnZaLTd/U/N1zhrbebtokYo8c2GUhooXAeNmNU+XajbY/9voHvHB
 Pa8uKUjERQOB1/g4z4UcCjIMP79pisXTQ0VovvYt2vCQ7/sa2vdCtLWd6+VK9QkOmIj2
 nNLU42AZPlu32Y0ZHzSYyHkqEF0wMFRt/SKRIyX1ip6NqOh2LluacEAUam1JQnNvDCcf
 FCUfU6tOwsCudBTIHf83wTAM+xeiqjd6jtqBfKz8hc3IyrNa75zTPIJLG9XBrW4mcgOW
 A2xw==
X-Gm-Message-State: APjAAAWBLYTELCrIst5a8ZDvEzEVJWn3Ir7grbPIkyNZCNlJZLRVxUCH
 jToRQX4kDDj0tC6U8xfla3mDGhPiGka/1vPkXudDZg==
X-Google-Smtp-Source: APXvYqzP3djssPZsqWAOo+HhK3d3yrF7GY/buRBsZMACgJJGWptbspYa1GgGU0bIpky0yCyTvQOmNxy6YkUGRaxWR3k=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr49518874jar.2.1560263851619; 
 Tue, 11 Jun 2019 07:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190529154635.2659-1-hdegoede@redhat.com>
 <CAKv+Gu8bLcDROFNFfqHaN1Z+EK5bnXMNDSJbBK-pCmq5XP_kBw@mail.gmail.com>
 <CAKv+Gu8w2Vj-AS-cfaB8cms+ZJ7qppS-Du_334_xm51rz0CYsA@mail.gmail.com>
 <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
In-Reply-To: <3065d32f-add7-4e48-164b-c248cc116cea@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 11 Jun 2019 16:37:19 +0200
Message-ID: <CAKv+Gu8_+6MNtM3_muP8YqHYYij58LzRFgV_UPaWp4vbjPkm5w@mail.gmail.com>
Subject: Re: [PATCH] efifb: BGRT: Add check for new BGRT status field rotation
 bits
To: Hans de Goede <hdegoede@redhat.com>
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0317WyxAHetn0NHNS7xAQoK7fjU4Bd3mmAZamc45khg=;
 b=ngMkOizS56BSDZza15iZDm5M/DEVXntMYcvUuLixdoX2PeyfEJWlPPiXvsLqveMenM
 3Ceol3hAHxIsto5dkisy12B7OUMbuE4IiE+NSD13xCWMhhMzSYBR4VpOXLKxI6OTWMwO
 n8rAQtUx0Jb0oYXhLmSZI4AImlK6gwvGmpwR0b6h8KcI5+mTwFTdY3Zw6HjcizVGOC64
 NsTR2Urbgari4QKganY21zTOrTrrEn2a+PhkaooteMtkhHWoYToQn+n42DvpJ/F/fcd+
 Pz60NJsPwRrKpsz40oLKrAy1U32HDWsa48LcRvaY62dlseYvyZq6OgnKfT2OkZHnPTO8
 KAmg==
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 Peter Jones <pjones@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSBhdCAxNjoyNCwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDExLTA2LTE5IDE2OjA0LCBBcmQgQmllc2hl
dXZlbCB3cm90ZToKPiA+IE9uIE1vbiwgMTAgSnVuIDIwMTkgYXQgMTc6MTIsIEFyZCBCaWVzaGV1
dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFdlZCwg
MjkgTWF5IDIwMTkgYXQgMTc6NDYsIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+
IHdyb3RlOgo+ID4+Pgo+ID4+PiBTdGFydGluZyB3aXRoIEFDUEkgNi4yIGJpdHMgMSBhbmQgMiBv
ZiB0aGUgQkdSVCBzdGF0dXMgZmllbGQgYXJlIG5vIGxvbmdlcgo+ID4+PiByZXNlcnZlZC4gVGhl
c2UgYml0cyBhcmUgbm93IHVzZWQgdG8gaW5kaWNhdGUgaWYgdGhlIGltYWdlIG5lZWRzIHRvIGJl
Cj4gPj4+IHJvdGF0ZWQgYmVmb3JlIGJlaW5nIGRpc3BsYXllZC4KPiA+Pj4KPiA+Pj4gVGhlIGVm
aWZiIGNvZGUgZG9lcyBub3Qgc3VwcG9ydCByb3RhdGluZyB0aGUgaW1hZ2UgYmVmb3JlIGNvcHlp
bmcgaXQgdG8KPiA+Pj4gdGhlIHNjcmVlbi4KPiA+Pj4KPiA+Pj4gVGhpcyBjb21taXQgYWRkcyBh
IGNoZWNrIGZvciB0aGVzZSBuZXcgYml0cyBhbmQgaWYgdGhleSBhcmUgc2V0IGxlYXZlcyB0aGUK
PiA+Pj4gZmIgY29udGVudHMgYXMgaXMgaW5zdGVhZCBvZiB0cnlpbmcgdG8gdXNlIHRoZSB1bi1y
b3RhdGVkIEJHUlQgaW1hZ2UuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gPj4KPiA+PiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2
ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+Cj4gPj4KPiA+Cj4gPiBCVFcgc2hvdWxkIHdl
IG1ha2Ugc3VyZSB0aGF0IHRoaXMgcGF0Y2ggYW5kIHRoZSBlZmktYmdydCBwYXRjaCBnZXQKPiA+
IG1lcmdlZCBhdCB0aGUgc2FtZSB0aW1lPwo+Cj4gVGhlIDIgcGF0Y2hlcyBhcmUgcmVsYXRlZCBi
dXQgbWVyZ2luZyB0aGVtIGF0IHRoZSBzYW1lIHRpbWUgaXMgbm90Cj4gbmVjZXNzYXJ5Lgo+Cj4g
PiBJIGd1ZXNzIHRoZSBuZXQgcmVzdWx0IGlzIGp1c3QgdGhhdCB3ZSBnZXQKPiA+IHJpZCBvZiBz
b21lIGVycm9yIGluIHRoZSBsb2csIGJ1dCBhIHJvdGF0ZWQgQk1QIHdpbGwgYmUgaWdub3JlZAo+
ID4gb3RoZXJ3aXNlLgo+Cj4gUmlnaHQsIHdvcnNlIGNhc2UgKGlmIHRoZSBibXAgZml0cyBwcmUt
cm90YXRpb24pIGl0IHdpbGwgYmUgZGlzcGxheWVkCj4gcm90YXRlZC4gTm90ZSBvbiB0aGUgb25l
IG1hY2hpbmUgSSdtIGF3YXJlIG9mIHdoaWNoIHVzZXMgdGhlc2UgYml0cwo+IHRoZSBibXAgZG9l
cyBub3QgZml0IHByZS1yb3RhdGlvbiwgc28gd2UgZW5kIHVwIHRyaWdnZXJpbmc6Cj4KPiBlcnJv
cjoKPiAgICAgICAgICBtZW11bm1hcChiZ3J0X2ltYWdlKTsKPiAgICAgICAgICBwcl93YXJuKCJl
ZmlmYjogSWdub3JpbmcgQkdSVDogdW5leHBlY3RlZCBvciBpbnZhbGlkIEJNUCBkYXRhXG4iKTsK
PiB9Cj4KCkRvZXNuJ3QgdGhhdCBtZWFuIHdlIG1heSBub3cgZW5kIHVwIGJyZWFraW5nICdxdWll
dCcsIGJ5IGV4Y2hhbmdpbmcgYQpwcl9ub3RpY2UoKSBpbiB0aGUgZWZpLWJncnQgZHJpdmVyIGZv
ciBhIHByX3dhcm4oKSBpbiB0aGlzIG9uZT8KCj4gV2hpY2ggdGhpcyBwYXRjaCByZXBsYWNlcyB3
aXRoIGhpdHRpbmc6Cj4KPiAgICAgICAgICBpZiAoYmdydF90YWIuc3RhdHVzICYgMHgwNikgewo+
ICAgICAgICAgICAgICAgICAgcHJfaW5mbygiZWZpZmI6IEJHUlQgcm90YXRpb24gYml0cyBzZXQs
IG5vdCBzaG93aW5nIGJvb3QgZ3JhcGhpY3NcbiIpOwo+ICAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+ICAgICAgICAgIH0KPgo+IEluc3RlYWQuIFNvIGF0IGxlYXN0IG9uIHRoZSBvbmUgbWFjaGlu
ZSBJIGtub3cgb2YgdGhpcyBpcyA5OSUgY29zbWV0aWMuCj4KPiA+IE9yIGlzIGl0IHJlbGV2YW50
IGZvciB1c2VybGFuZCBpbiBzb21lIG90aGVyIHdheT8KPgo+IE5vLgo+Cj4gUmVnYXJkcywKPgo+
IEhhbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
