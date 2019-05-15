Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6741F3B9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 14:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3AB89319;
	Wed, 15 May 2019 12:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979589319
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 12:17:26 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id q64so1549957vsd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 05:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GoZqRtO1DJyDd5x1ykt89wHuMqf3mXxoCzfB/cokj1U=;
 b=n15C9qXY+vANi0jKhIJuAfucqwYp+0/cBG4Ame+9p9x8DnBXdaVQwx9/1pBSf4QUEf
 Psug/5AYyW3of07Tz+RJ1y+/vII64eE7R8I+U1exC/3kRM4x3xys4BNOO5ni0OmaTnMk
 hJ+2AaisU7zmeLaV0EaAC/cMzS6d6oSXJd1cjRH5NowARRjh7geFCIxoSkiKlz1eZLg/
 6DeFA/m4FQew6KbUNrc9z1GSIw29Wcf5MU4Qo51S5DvBvIwj66WKaEwEqxo9DMR1RKdR
 dJxF2syMq7IYvfTRpfDyQDiAT1MQkKX+WhGMnX9AvlpiseXnwp+Pv/9euumR+cbBgEC9
 CbSw==
X-Gm-Message-State: APjAAAUWUrCM34mh4Ekv5oiruHShafNnSsiLvMHS6QeyfWVJ5OtBynP6
 OXILnRFWqcRrBe/allLNyvUaktMwyGMBAe1xoa0=
X-Google-Smtp-Source: APXvYqw1XFiQjVa/JMiq4S60gQIlK2cXL5b+8BOXQspv8ti/3HOAAmRtxBpaHNn1XhlzBo/rYNR9VuOso144yYjW6L8=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr12143867vsc.96.1557922645694; 
 Wed, 15 May 2019 05:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190117133336.19737-1-shc_work@mail.ru>
 <CAMuHMdXrAaZoqsnY_adE=jn-hmTrgmsvJ2tDo+5ByxZ4sz_S7Q@mail.gmail.com>
 <1557916437.354393786@f383.i.mail.ru>
In-Reply-To: <1557916437.354393786@f383.i.mail.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 14:17:14 +0200
Message-ID: <CAMuHMdXBpneVGLULk2kE0BT336BBn0+NQsEqmMnGqsSEQy5D3g@mail.gmail.com>
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

SGkgQWxleGFuZGVyLAoKT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6MzQgUE0gQWxleGFuZGVy
IFNoaXlhbiA8c2hjX3dvcmtAbWFpbC5ydT4gd3JvdGU6Cj4gTG9va3MgbGlrZSB5b3UncmUgcmln
aHQuCj4gQ2FuIHlvdSBjcmVhdGUgYSBwYXRjaCB0byBmaXggdGhpcz8KClRoYW5rIHlvdSwgZG9u
ZS4KCj4gPtCh0YDQtdC00LAsIDE1INC80LDRjyAyMDE5LCAxMTo1NyArMDM6MDAg0L7RgiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPjoKPiA+Cj4gPkhpIEFsZXhhbmRl
ciwKPiA+Cj4gPk9uIFRodSwgSmFuIDE3LCAyMDE5IGF0IDI6MzkgUE0gQWxleGFuZGVyIFNoaXlh
biA8IHNoY193b3JrQG1haWwucnUgPiB3cm90ZToKPiA+PiBXZSBoYXZlIHR3byAqX0NMQVNTX0RF
VklDRSBrZXJuZWwgY29uZmlnIG9wdGlvbnMgKExDRF9DTEFTU19ERVZJQ0UKPiA+PiBhbmQgQkFD
S0xJR0hUX0xDRF9ERVZJQ0UpIHRoYXQgZG8gdGhlIHNhbWUgam9iLgo+ID4+IFRoZSBwYXRjaCBy
ZW1vdmVzIHVzZWxlc3MgQkFDS0xJR0hUX0xDRF9TVVBQT1JUIG9wdGlvbgo+ID4+IGFuZCBjb252
ZXJ0cyBMQ0RfQ0xBU1NfREVWSUNFIGludG8gYSBtZW51Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIFNoaXlhbiA8IHNoY193b3JrQG1haWwucnUgPgo+ID5UaGlzIGlzIG5vdyBj
b21taXQgOGM1ZGM4ZDlmMTljNzk5MiAoInZpZGVvOiBiYWNrbGlnaHQ6IFJlbW92ZSB1c2VsZXNz
Cj4gPkJBQ0tMSUdIVF9MQ0RfU1VQUE9SVCBrZXJuZWwgc3ltYm9sIikuCj4gPgo+ID4+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKPiA+PiArKysgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9LY29uZmlnCj4gPj4gQEAgLTIsMTMgKzIsNyBAQAo+ID4+ICAjIEJhY2tsaWdo
dCAmIExDRCBkcml2ZXJzIGNvbmZpZ3VyYXRpb24KPiA+PiAgIwo+ID4+Cj4gPj4gLW1lbnVjb25m
aWcgQkFDS0xJR0hUX0xDRF9TVVBQT1JUCj4gPj4gLSAgICAgICBib29sICJCYWNrbGlnaHQgJiBM
Q0QgZGV2aWNlIHN1cHBvcnQiCj4gPj4gLSAgICAgICBoZWxwCj4gPj4gLSAgICAgICAgIEVuYWJs
ZSB0aGlzIHRvIGJlIGFibGUgdG8gY2hvb3NlIHRoZSBkcml2ZXJzIGZvciBjb250cm9sbGluZyB0
aGUKPiA+PiAtICAgICAgICAgYmFja2xpZ2h0IGFuZCB0aGUgTENEIHBhbmVsIG9uIHNvbWUgcGxh
dGZvcm1zLCBmb3IgZXhhbXBsZSBvbiBQREFzLgo+ID4+IC0KPiA+PiAtaWYgQkFDS0xJR0hUX0xD
RF9TVVBQT1JUCj4gPj4gK21lbnUgIkJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydCIKPiA+
Pgo+ID4+ICAjCj4gPj4gICMgTENECj4gPgo+ID5CZWxvdywgd2UgaGF2ZToKPiA+Cj4gPiAgICBj
b25maWcgTENEX0NMQVNTX0RFVklDRQo+ID4gICAgICAgICAgICB0cmlzdGF0ZSAiTG93bGV2ZWwg
TENEIGNvbnRyb2xzIgo+ID4gICAgICAgICAgICBkZWZhdWx0IG0KPiA+ICAgICAgICAgICAgaGVs
cAo+ID4gICAgICAgICAgICAgIFRoaXMgZnJhbWV3b3JrIGFkZHMgc3VwcG9ydCBmb3IgbG93LWxl
dmVsIGNvbnRyb2wgb2YgTENELgo+ID4gICAgICAgICAgICAgIFNvbWUgZnJhbWVidWZmZXIgZGV2
aWNlcyBjb25uZWN0IHRvIHBsYXRmb3JtLXNwZWNpZmljIExDRCBtb2R1bGVzCj4gPiAgICAgICAg
ICAgICAgaW4gb3JkZXIgdG8gaGF2ZSBhIHBsYXRmb3JtLXNwZWNpZmljIHdheSB0byBjb250cm9s
IHRoZSBmbGF0IHBhbmVsCj4gPiAgICAgICAgICAgICAgKGNvbnRyYXN0IGFuZCBhcHBseWluZyBw
b3dlciB0byB0aGUgTENEIChub3QgdG8gdGhlIGJhY2tsaWdodCEpKS4KPiA+Cj4gPmFuZDoKPiA+
Cj4gPiAgICBjb25maWcgQkFDS0xJR0hUX0NMQVNTX0RFVklDRQo+ID4gICAgICAgICAgICB0cmlz
dGF0ZSAiTG93bGV2ZWwgQmFja2xpZ2h0IGNvbnRyb2xzIgo+ID4gICAgICAgICAgICBkZWZhdWx0
IG0KPiA+ICAgICAgICAgICAgaGVscAo+ID4gICAgICAgICAgICAgIFRoaXMgZnJhbWV3b3JrIGFk
ZHMgc3VwcG9ydCBmb3IgbG93LWxldmVsIGNvbnRyb2wgb2YgdGhlIExDRAo+ID4gICAgICAgICAg
ICAgIGJhY2tsaWdodC4gVGhpcyBpbmNsdWRlcyBzdXBwb3J0IGZvciBicmlnaHRuZXNzIGFuZCBw
b3dlci4KPiA+Cj4gPkhlbmNlIHJ1bm5pbmcgIm1ha2Ugb2xkY29uZmlnIiBvbiBhIC5jb25maWcg
d2hlcmUKPiA+Q09ORklHX0JBQ0tMSUdIVF9MQ0RfU1VQUE9SVCB3YXMgbm90IHNldCBsZWFkcyB0
d28gdG8gbmV3Cj4gPnF1ZXN0aW9ucywgd2hlcmUgdGhlIGFuc3dlcnMgZGVmYXVsdCB0byAibSIu
Cj4gPgo+ID5QZXJoYXBzIHRoZSAiZGVmYXVsdCBtIiBzdGF0ZW1lbnRzIHNob3VsZCBiZSByZW1v
dmVkPwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
