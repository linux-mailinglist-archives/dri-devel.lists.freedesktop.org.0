Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E0BE50F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36678924A;
	Mon, 29 Apr 2019 14:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A458930B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 14:44:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o25so14431050wmf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOwo8p6O9JVGq46oG1qdhAAdQCgtDLRDrmk8NzplEKs=;
 b=N6oOYK+6Q7KbDn9iDFKwWMOj+Y0dVn0B8x7qRrxzpEOMsLbMOnQVo7hU4UEvuXZqcO
 O7fTx/9YkAa9K8a34ZfGuwQWJFx4yEBjbs5vsif2Rd17JDXBIk9Pf2OM1avEx/h1cSV9
 +Rk5yfHLiwKytQVoBIt20U5mgvMinTpeppRc17EWe+bsz0ZJYxGkc6s6KTi64VNm1nfG
 bUOh9kirTbOCFs+OwSDGkP6dX6ty2DzcW9CHVHSVksi1pCr4fiQPHdrpYjOeG0bsaBNy
 xZJjqsiCmAQye7YMrCaUcwjiYeACioUoJJaBOGrK+Twpm3pcmZt7UHDDclfgyuop8WgN
 5vIg==
X-Gm-Message-State: APjAAAWI2Qtw8D4AxlNrurLKpmVKP/U5bGUBTYw4IO1YcAXGj6RCYUCA
 CMxTTwLqqIIdDuOIppnYP/oKMA==
X-Google-Smtp-Source: APXvYqwMiQqAWrnvfEtchKgbolcQkhB+FEQ4jJKXXW2CpjEx72nlBmbwVFrX64ZEuV4FqS16pCBFow==
X-Received: by 2002:a1c:9617:: with SMTP id y23mr19066575wmd.31.1556549048622; 
 Mon, 29 Apr 2019 07:44:08 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id 7sm10542337wro.85.2019.04.29.07.44.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 07:44:07 -0700 (PDT)
Subject: Re: [PATCH] drm/gma500/cdv: Check vbt config bits when detecting lvds
 panels
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20190416114607.1072-1-patrik.r.jakobsson@gmail.com>
 <7abdd013-1006-9f09-0d28-33f9fc0d2571@redhat.com>
 <CAMeQTsaxZmZZ3rtLR7=Bjp475OQBei2UegM2qoQ5a392j4w=dw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d6489376-e5a9-8a41-e3c7-68d9f6581094@redhat.com>
Date: Mon, 29 Apr 2019 16:44:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMeQTsaxZmZZ3rtLR7=Bjp475OQBei2UegM2qoQ5a392j4w=dw@mail.gmail.com>
Content-Language: en-US
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyMi0wNC0xOSAxOTo1NCwgUGF0cmlrIEpha29ic3NvbiB3cm90ZToKPiBPbiBTdW4s
IEFwciAyMSwgMjAxOSBhdCA4OjQ2IFBNIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4gT24gMTYtMDQtMTkgMTM6NDYsIFBhdHJpayBKYWtv
YnNzb24gd3JvdGU6Cj4+PiBTb21lIG1hY2hpbmVzIGhhdmUgYW4gbHZkcyBjaGlsZCBkZXZpY2Ug
aW4gdmJ0IGV2ZW4gdGhvdWdoIGEgcGFuZWwgaXMKPj4+IG5vdCBhdHRhY2hlZC4gVG8gbWFrZSBk
ZXRlY3Rpb24gbW9yZSByZWxpYWJsZSB3ZSBub3cgYWxzbyBjaGVjayB0aGUgbHZkcwo+Pj4gY29u
ZmlnIGJpdHMgYXZhaWxhYmxlIGluIHRoZSB2YnQuCj4+Pgo+Pj4gQnVnemlsbGE6IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTY2NTc2Ngo+Pj4gU2lnbmVkLW9m
Zi1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWlsLmNvbT4KPj4+
IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+Pj4gQ2M6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IFRoZSByZXBvcnRl
ciBvZiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE2NjU3NjYK
Pj4ganVzdCBnb3QgYmFjayB0byBtZSBhbmQgaGUgY29uZmlybXMgdGhhdCB0aGlzIHBhdGNoIGZp
eGVzIHRoZQo+PiBmYWxzZS1wb3NpdGl2ZSBMVkRTIHBhbmVsIGRldGVjdGlvbiBvbiBoaXMgTkFT
LCB3aXRob3V0IG5lZWRpbmcKPj4gYSBETUkgYmxhY2tsaXN0Lgo+Pgo+PiBTbyBpdCBsb29rcyBs
aWtlIHRoaXMgcGF0Y2ggaW5kZWVkIGlzIGEgYmV0dGVyIGZpeCB0aGVuIG15IGluaXRpYWwKPj4g
RE1JIGJsYWNrbGlzdCBhcHByb2FjaCBhbmQgZnJvbSBteSBwb3YgdGhpcyBwYXRjaCBpcyByZWFk
eSB0bwo+PiBnbyB1cHN0cmVhbS4KPiAKPiBUaGFua3MgSGFucywgY2FuIEkgYWRkIHlvdXIgcmV2
aWV3IHRhZz8KCkVybSwgdGhlbiBJIHdvdWxkIG5lZWQgdG8gYWN0dWFsbHkgcmV2aWV3IGl0IGZp
cnN0IC4uLiBkb25lOgoKUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+CgpSZWdhcmRzLAoKSGFucwoKCj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvY2R2X2ludGVsX2x2ZHMuYyB8IDMgKysrCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL2ludGVsX2Jpb3MuYyAgICAgfCAzICsrKwo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9wc2JfZHJ2LmggICAgICAgIHwgMSArCj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9p
bnRlbF9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9sdmRzLmMKPj4+
IGluZGV4IGRlOTUzMWNhYWNhMC4uOWM4NDQ2MTg0YjE3IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9jZHZfaW50ZWxfbHZkcy5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2Nkdl9pbnRlbF9sdmRzLmMKPj4+IEBAIC01OTQsNiArNTk0LDkgQEAgdm9pZCBj
ZHZfaW50ZWxfbHZkc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+PiAgICAgICAgaW50
IHBpcGU7Cj4+PiAgICAgICAgdTggcGluOwo+Pj4KPj4+ICsgICAgIGlmICghZGV2X3ByaXYtPmx2
ZHNfZW5hYmxlZF9pbl92YnQpCj4+PiArICAgICAgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICAg
ICAgICBwaW4gPSBHTUJVU19QT1JUX1BBTkVMOwo+Pj4gICAgICAgIGlmICghbHZkc19pc19wcmVz
ZW50X2luX3ZidChkZXYsICZwaW4pKSB7Cj4+PiAgICAgICAgICAgICAgICBEUk1fREVCVUdfS01T
KCJMVkRTIGlzIG5vdCBwcmVzZW50IGluIFZCVFxuIik7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9pbnRlbF9iaW9zLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2lu
dGVsX2Jpb3MuYwo+Pj4gaW5kZXggNjNiZGU0ZTg2YzZhLi5lMDE5ZWEyNzFmZmMgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ludGVsX2Jpb3MuYwo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2dtYTUwMC9pbnRlbF9iaW9zLmMKPj4+IEBAIC00MzYsNiArNDM2LDkgQEAg
cGFyc2VfZHJpdmVyX2ZlYXR1cmVzKHN0cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2LAo+
Pj4gICAgICAgIGlmIChkcml2ZXItPmx2ZHNfY29uZmlnID09IEJEQl9EUklWRVJfRkVBVFVSRV9F
RFApCj4+PiAgICAgICAgICAgICAgICBkZXZfcHJpdi0+ZWRwLnN1cHBvcnQgPSAxOwo+Pj4KPj4+
ICsgICAgIGRldl9wcml2LT5sdmRzX2VuYWJsZWRfaW5fdmJ0ID0gZHJpdmVyLT5sdmRzX2NvbmZp
ZyAhPSAwOwo+Pj4gKyAgICAgRFJNX0RFQlVHX0tNUygiTFZEUyBWQlQgY29uZmlnIGJpdHM6IDB4
JXhcbiIsIGRyaXZlci0+bHZkc19jb25maWcpOwo+Pj4gKwo+Pj4gICAgICAgIC8qIFRoaXMgYml0
IG1lYW5zIHRvIHVzZSA5Nk1oeiBmb3IgRFBMTF9BIG9yIG5vdCAqLwo+Pj4gICAgICAgIGlmIChk
cml2ZXItPnByaW1hcnlfbGZwX2lkKQo+Pj4gICAgICAgICAgICAgICAgZGV2X3ByaXYtPmRwbGxh
Xzk2bWh6ID0gdHJ1ZTsKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3Bz
Yl9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5oCj4+PiBpbmRleCA5NDFi
MjM4YmRjYzkuLmJjNjA4ZGRjM2JkMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9n
bWE1MDAvcHNiX2Rydi5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYu
aAo+Pj4gQEAgLTUzNyw2ICs1MzcsNyBAQCBzdHJ1Y3QgZHJtX3BzYl9wcml2YXRlIHsKPj4+ICAg
ICAgICBpbnQgbHZkc19zc2NfZnJlcTsKPj4+ICAgICAgICBib29sIGlzX2x2ZHNfb247Cj4+PiAg
ICAgICAgYm9vbCBpc19taXBpX29uOwo+Pj4gKyAgICAgYm9vbCBsdmRzX2VuYWJsZWRfaW5fdmJ0
Owo+Pj4gICAgICAgIHUzMiBtaXBpX2N0cmxfZGlzcGxheTsKPj4+Cj4+PiAgICAgICAgdW5zaWdu
ZWQgaW50IGNvcmVfZnJlcTsKPj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
