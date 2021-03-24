Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63034759A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93F6E9AA;
	Wed, 24 Mar 2021 10:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BA746E9A7;
 Wed, 24 Mar 2021 10:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 97BB92A6045;
 Wed, 24 Mar 2021 11:13:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id XFM4zYS7LqyR; Wed, 24 Mar 2021 11:13:50 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 2EEB92A6016;
 Wed, 24 Mar 2021 11:13:50 +0100 (CET)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lP0WL-000jKo-2t; Wed, 24 Mar 2021 11:13:49 +0100
To: Mark Yacoub <markyacoub@google.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210310161444.1015500-1-markyacoub@chromium.org>
 <CADnq5_P9aYcedOP2qduSz7VN1fCSnmQEtPa+FdjYu9Co7TwPog@mail.gmail.com>
 <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
Message-ID: <b4070483-5aa5-c712-6435-dcb4a206ca76@daenzer.net>
Date: Wed, 24 Mar 2021 11:13:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAC0gqY7Y2WxtAZ3GnWmASPYq7ahYTfmPhOHAAX5UjMNS9k098w@mail.gmail.com>
Content-Language: en-CA
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMy0yMyA0OjMyIHAubS4sIE1hcmsgWWFjb3ViIHdyb3RlOgo+IE9uIFR1ZSwgTWFy
IDIzLCAyMDIxIGF0IDExOjAyIEFNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29t
PiB3cm90ZToKPj4KPj4gT24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMTE6MTUgQU0gTWFyayBZYWNv
dWIgPG1hcmt5YWNvdWJAY2hyb21pdW0ub3JnPiB3cm90ZToKPj4+Cj4+PiBGcm9tOiBNYXJrIFlh
Y291YiA8bWFya3lhY291YkBnb29nbGUuY29tPgo+Pj4KPj4+IE9uIGluaXRpYWxpemluZyB0aGUg
ZnJhbWVidWZmZXIsIGNhbGwgZHJtX2FueV9wbGFuZV9oYXNfZm9ybWF0IHRvIGRvIGEKPj4+IGNo
ZWNrIGlmIHRoZSBtb2RpZmllciBpcyBzdXBwb3J0ZWQuIGRybV9hbnlfcGxhbmVfaGFzX2Zvcm1h
dCBjYWxscwo+Pj4gZG1fcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWQgd2hpY2ggaXMgZXh0ZW5k
ZWQgdG8gdmFsaWRhdGUgdGhhdCB0aGUKPj4+IG1vZGlmaWVyIGlzIG9uIHRoZSBsaXN0IG9mIHRo
ZSBwbGFuZSdzIHN1cHBvcnRlZCBtb2RpZmllcnMuCj4+Pgo+Pj4gVGhlIGJ1ZyB3YXMgY2F1Z2h0
IHVzaW5nIGlndC1ncHUtdG9vbHMgdGVzdDoga21zX2FkZGZiX2Jhc2ljLmFkZGZiMjUtYmFkLW1v
ZGlmaWVyCj4+Pgo+Pj4gVGVzdGVkIG9uIENocm9tZU9TIFpvcmsgYnkgdHVybmluZyBvbiB0aGUg
ZGlzcGxheSwgcnVubmluZyBhbiBvdmVybGF5Cj4+PiB0ZXN0LCBhbmQgcnVubmluZyBhIFlUIHZp
ZGVvLgo+Pj4KPj4+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4+PiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+Pj4g
U2lnbmVkLW9mZi1ieTogZGVmYXVsdCBhdmF0YXJNYXJrIFlhY291YiA8bWFya3lhY291YkBjaHJv
bWl1bS5vcmc+Cj4+Cj4+IEknbSBub3QgYW4gZXhwZXJ0IHdpdGggbW9kaWZpZXJzIHlldC4gIFdp
bGwgdGhpcyBicmVhayBjaGlwcyB3aGljaAo+PiBkb24ndCBjdXJyZW50bHkgc3VwcG9ydCBtb2Rp
ZmllcnM/Cj4gTm8gaXQgc2hvdWxkbid0LiBXaGVuIHlvdSBkb24ndCBzdXBwb3J0IG1vZGlmaWVy
cyB5ZXQsIHlvdXIgd2lsbAo+IGRlZmF1bHQgdG8gTGluZWFyIE1vZGlmaWVyIChEUk1fRk9STUFU
X01PRF9MSU5FQVIpLAo+IFsuLi5dCk5vIG1vZGlmaWVyIHN1cHBvcnQgZG9lcyBub3QgaW1wbHkg
bGluZWFyLiBJdCdzIGdlbmVyYWxseSBzaWduYWxsZWQgdmlhIERSTV9GT1JNQVRfTU9EX0lOVkFM
SUQsIHdoaWNoIHJvdWdobHkgbWVhbnMgInRpbGluZyBpcyBkZXRlcm1pbmVkIGJ5IGRyaXZlciBz
cGVjaWZpYyBtZWNoYW5pc21zIi4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
