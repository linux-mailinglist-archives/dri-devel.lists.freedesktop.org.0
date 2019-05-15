Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33211EA80
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 10:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252708941E;
	Wed, 15 May 2019 08:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BA58941E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 08:57:04 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y6so1205196vsb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 01:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=96iRfZdib+4eTVJWWY+B4LN2z0sGbIorx6gOZw+wIXU=;
 b=LviZonFSRSy4tc/Yn/vOPcd8cGjkRRRAVFlX8Lz2pR5UK9XKGXoQf/wx68TPvT+uUg
 VlXhIuk/AoPD0uLs8xjFoNPG3sJlGdLKKqfTRdt5uLPXh4QrJrVjCYrx/mYnVBfQkBdJ
 kkeXW+zwvaGfB9DLgECcEvSMY5Q4jHmSWAZcnUpqV1a1dWAMthU1DUDFc9Yt86BR4mOO
 RPkguhU4Qam8S92URHSen+KtE4Xb01guLC1DvjzZogf+lDxwRbvN2bdgo07GFjntl63T
 dD365kPQar2+5EA6KyLy103etBxj7FoBAKyj0gUTx/4gNTue+lg93HkHGdQiY4S/7vPc
 XUkQ==
X-Gm-Message-State: APjAAAUXcDM0lCpcQybiy1+bxBDrEZ16zU2w38pG41bqmHZITk1e1sVr
 W4tiqOlI0Ihf7/RU8k0Z14vT0kn3e5WAkg6Mq68=
X-Google-Smtp-Source: APXvYqxNXAHO4EY+qM+hpU3GaoFiF2m86JQAAagisY1V/FjL61yHVIJWOqozst81BAiD6TqTNyLFIbBrhe1VCUUlE4M=
X-Received: by 2002:a67:f303:: with SMTP id p3mr8190626vsf.166.1557910623342; 
 Wed, 15 May 2019 01:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190117133336.19737-1-shc_work@mail.ru>
In-Reply-To: <20190117133336.19737-1-shc_work@mail.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 10:56:51 +0200
Message-ID: <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] video: lcd: Remove useless BACKLIGHT_LCD_SUPPORT
 kernel symbol
To: Alexander Shiyan <shc_work@mail.ru>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleGFuZGVyLAoKT24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMjozOSBQTSBBbGV4YW5kZXIg
U2hpeWFuIDxzaGNfd29ya0BtYWlsLnJ1PiB3cm90ZToKPiBXZSBoYXZlIHR3byAqX0NMQVNTX0RF
VklDRSBrZXJuZWwgY29uZmlnIG9wdGlvbnMgKExDRF9DTEFTU19ERVZJQ0UKPiBhbmQgQkFDS0xJ
R0hUX0xDRF9ERVZJQ0UpIHRoYXQgZG8gdGhlIHNhbWUgam9iLgo+IFRoZSBwYXRjaCByZW1vdmVz
IHVzZWxlc3MgQkFDS0xJR0hUX0xDRF9TVVBQT1JUIG9wdGlvbgo+IGFuZCBjb252ZXJ0cyBMQ0Rf
Q0xBU1NfREVWSUNFIGludG8gYSBtZW51Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFNo
aXlhbiA8c2hjX3dvcmtAbWFpbC5ydT4KClRoaXMgaXMgbm93IGNvbW1pdCA4YzVkYzhkOWYxOWM3
OTkyICgidmlkZW86IGJhY2tsaWdodDogUmVtb3ZlIHVzZWxlc3MKQkFDS0xJR0hUX0xDRF9TVVBQ
T1JUIGtlcm5lbCBzeW1ib2wiKS4KCj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2Nv
bmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKPiBAQCAtMiwxMyAr
Miw3IEBACj4gICMgQmFja2xpZ2h0ICYgTENEIGRyaXZlcnMgY29uZmlndXJhdGlvbgo+ICAjCj4K
PiAtbWVudWNvbmZpZyBCQUNLTElHSFRfTENEX1NVUFBPUlQKPiAtICAgICAgIGJvb2wgIkJhY2ts
aWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydCIKPiAtICAgICAgIGhlbHAKPiAtICAgICAgICAgRW5h
YmxlIHRoaXMgdG8gYmUgYWJsZSB0byBjaG9vc2UgdGhlIGRyaXZlcnMgZm9yIGNvbnRyb2xsaW5n
IHRoZQo+IC0gICAgICAgICBiYWNrbGlnaHQgYW5kIHRoZSBMQ0QgcGFuZWwgb24gc29tZSBwbGF0
Zm9ybXMsIGZvciBleGFtcGxlIG9uIFBEQXMuCj4gLQo+IC1pZiBCQUNLTElHSFRfTENEX1NVUFBP
UlQKPiArbWVudSAiQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0Igo+Cj4gICMKPiAgIyBM
Q0QKCkJlbG93LCB3ZSBoYXZlOgoKICAgIGNvbmZpZyBMQ0RfQ0xBU1NfREVWSUNFCiAgICAgICAg
ICAgIHRyaXN0YXRlICJMb3dsZXZlbCBMQ0QgY29udHJvbHMiCiAgICAgICAgICAgIGRlZmF1bHQg
bQogICAgICAgICAgICBoZWxwCiAgICAgICAgICAgICAgVGhpcyBmcmFtZXdvcmsgYWRkcyBzdXBw
b3J0IGZvciBsb3ctbGV2ZWwgY29udHJvbCBvZiBMQ0QuCiAgICAgICAgICAgICAgU29tZSBmcmFt
ZWJ1ZmZlciBkZXZpY2VzIGNvbm5lY3QgdG8gcGxhdGZvcm0tc3BlY2lmaWMgTENEIG1vZHVsZXMK
ICAgICAgICAgICAgICBpbiBvcmRlciB0byBoYXZlIGEgcGxhdGZvcm0tc3BlY2lmaWMgd2F5IHRv
IGNvbnRyb2wgdGhlIGZsYXQgcGFuZWwKICAgICAgICAgICAgICAoY29udHJhc3QgYW5kIGFwcGx5
aW5nIHBvd2VyIHRvIHRoZSBMQ0QgKG5vdCB0byB0aGUgYmFja2xpZ2h0ISkpLgoKYW5kOgoKICAg
IGNvbmZpZyBCQUNLTElHSFRfQ0xBU1NfREVWSUNFCiAgICAgICAgICAgIHRyaXN0YXRlICJMb3ds
ZXZlbCBCYWNrbGlnaHQgY29udHJvbHMiCiAgICAgICAgICAgIGRlZmF1bHQgbQogICAgICAgICAg
ICBoZWxwCiAgICAgICAgICAgICAgVGhpcyBmcmFtZXdvcmsgYWRkcyBzdXBwb3J0IGZvciBsb3ct
bGV2ZWwgY29udHJvbCBvZiB0aGUgTENECiAgICAgICAgICAgICAgYmFja2xpZ2h0LiBUaGlzIGlu
Y2x1ZGVzIHN1cHBvcnQgZm9yIGJyaWdodG5lc3MgYW5kIHBvd2VyLgoKSGVuY2UgcnVubmluZyAi
bWFrZSBvbGRjb25maWciIG9uIGEgLmNvbmZpZyB3aGVyZQpDT05GSUdfQkFDS0xJR0hUX0xDRF9T
VVBQT1JUIHdhcyBub3Qgc2V0IGxlYWRzIHR3byB0byBuZXcKcXVlc3Rpb25zLCB3aGVyZSB0aGUg
YW5zd2VycyBkZWZhdWx0IHRvICJtIi4KClBlcmhhcHMgdGhlICJkZWZhdWx0IG0iIHN0YXRlbWVu
dHMgc2hvdWxkIGJlIHJlbW92ZWQ/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
