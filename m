Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E184EE2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 16:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EEB6E71B;
	Wed,  7 Aug 2019 14:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9AF6E71B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 14:38:29 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id c4so8285816uad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 07:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujKI0iSC5aElrr15iWxGsrnDIVRzv5E97M6AZASsPkw=;
 b=XZ6ZRyMKavzg/UZi+bdj+38m0aY6d05oMEB7cfpUyvP9i00K2tIH4RKalSgZS1Su7C
 sKCIXltIrY72DVbQITUkyz3Y3JFvNTb5Q222Q5PGgds5l7VKsqF4T5MuM205EzBIeau4
 EMQcFcAfwP8RJ3cUA68esv74wW0bAs9g/ADaBwZLWmdKD9DApXxtKmHxxVlfVqeNJWnc
 vjdUVz4QeiVocLPFwX1sTj9Eih33mxQC3/LIZE6z1ViIB+pQrfy1cwN3Au7zx8UVC8Xb
 nfyZoqSDxXhNC8qoV4+2BZvB5pZmTihidPp/IBnKjNuHy2/6qBaPnhgTZuQNbYhIHzLY
 zJig==
X-Gm-Message-State: APjAAAXODhqI1w+QUDEiMZCJIyEL5kFp3x83inPCYxVtxc7KibWaykRA
 rKqWO7KL7Lo6utn7rgWsN6AyKwmiFXfs0d5HzJw=
X-Google-Smtp-Source: APXvYqzWdUrmDgGN07RylYwgnkCat16GLLj57N98XI6shyu5lgKfZVbLVMBCIlfoS+Rfy6d0R5ApvwD0HWj5cdKUa/o=
X-Received: by 2002:ab0:2789:: with SMTP id t9mr5963746uap.69.1565188708440;
 Wed, 07 Aug 2019 07:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190807142101.251400-1-sean@poorly.run>
In-Reply-To: <20190807142101.251400-1-sean@poorly.run>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 7 Aug 2019 15:37:37 +0100
Message-ID: <CACvgo508VnzOica6K37HUYLLcE_BxGjEny8uS-ZsHMminCHoaA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm-misc-next: Revert patches missing reviews
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ujKI0iSC5aElrr15iWxGsrnDIVRzv5E97M6AZASsPkw=;
 b=aF9j9R6cXkCGPLm1CG4x1FXs2lm8AQMFrD7InGI5xaAQha8ZsdQvx1ziJT6XclUi/p
 4yhKHL31qtxtvinRGef+nkBMhpNpXb9VVngJWRhKlwPxlWrPT6UlAwFxZbr86MFQR8kC
 xE4MytA4ziLxfa2/+eVUWzzHMgvuNnbYa4OwQzNKTClr+aOMfh66csZRT1awFfbp5XTO
 VSE1LmP1sQxirmhV8MKy1dRP37gAYZ/KYbX/XNKbSSFLH5i+sXXkFlYjXlOZC66v4A/m
 OAEWR1iG91noy/5hCpmngJUatfj2vw31g73zCq5IblnTBMrP1Mqm8NzF24oCmslKU5SN
 4lDA==
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
Cc: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA3IEF1ZyAyMDE5IGF0IDE1OjIxLCBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4g
d3JvdGU6Cj4KPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPgo+IEhl
bGxvb28sCj4gVGhpcyBoYXMgYmVlbiBjb3ZlcmVkIGFkIG5hdXNlYW0gb24gdGhlIG0tbCBhbmQg
aXJjLCBidXQgZm9yIHRoZSByZWNvcmQ6Cj4KPiBSZXZpZXdzIGFyZSBhIG1hbmRhdG9yeSByZXF1
aXJlbWVudCBmb3IgcGF0Y2hlcyBpbiBkcm0tbWlzYy1uZXh0LCBpdCdzCj4gd2hhdCBrZWVwcyB1
cyBhbGwgaG9uZXN0IGluIHRoZSBjb21taXR0ZXIgbW9kZWwuIFRoZSBtb3N0IHJlY2VudAo+IGRy
bS1taXNjLW5leHQgcHVsbCBpbmNsdWRlZCBhIGhhbmRmdWwgb2YgcGF0Y2hlcyB0aGF0IHdlcmUg
bWlzc2luZwo+IHJldmlld3MuIFRoZXJlIHdhcyBhYnNvbHV0ZWx5IHplcm8gbmVmYXJpb3VzIGlu
dGVudCwgYnV0IHJ1bGVzIGFyZQo+IHJ1bGVzLCBzbyB3ZSdyZSByZXZlcnRpbmcgdGhlbS4KPgo+
IEkgZmVlbCBjb25maWRlbnQgcmUtYXBwbHlpbmcgYWxsIG9mIHRoZXNlIHdpdGggbXkgU29CLCBz
byBJIHBsYW4gb24KPiBkb2luZyB0aGF0IGluIHRoZSBzYW1lIHB1c2guCj4KVGhhbmtzLgoKPiBU
aGFua3MgdG8gZXZlcnlvbmUgZm9yIGhhbmRsaW5nIHRoaXMgc28gd2VsbCwgc2VyaW91c2x5IGF3
ZXNvbWUgdGhhdAo+IHdlIGNhbiBzdGF5IGNvbnN0cnVjdGl2ZSBhcyBhIGNvbW11bml0eSBcby8u
Cj4KPiBMYXN0bHksIHRoaXMgd2lsbCBiZSBjYXVnaHQgYnkgb3VyIHRvb2xpbmcgaW4gdGhlIGZ1
dHVyZSBzbyB0aGlzIHNob3VsZAo+IGJlIHRoZSBsYXN0IHRpbWUgdGhpcyBoYXBwZW5zIChvbiBh
Y2NpZGVudCkuCj4KSGVhciwgaGVhci4KCj4gU2Vhbgo+Cj4gU2VhbiBQYXVsICg1KToKCj4gICBS
ZXZlcnQgImRybS92Z2VtOiBkcm9wIERSTV9BVVRIIHVzYWdlIGZyb20gdGhlIGRyaXZlciIKPiAg
IFJldmVydCAiZHJtL21zbTogZHJvcCBEUk1fQVVUSCB1c2FnZSBmcm9tIHRoZSBkcml2ZXIiCj4g
ICBSZXZlcnQgImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1jb2RlZCBkcm1faW52YWxpZF9vcCgp
Igo+CkZvciB0aGVzZSB0aHJlZToKQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292
QGNvbGxhYm9yYS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
