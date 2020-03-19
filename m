Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDAB18B266
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 12:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AE46EA00;
	Thu, 19 Mar 2020 11:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CC1D6EA00
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 36ABA2A6042;
 Thu, 19 Mar 2020 12:35:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qaHsfSbqLThe; Thu, 19 Mar 2020 12:35:02 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id E0B1D2A6016;
 Thu, 19 Mar 2020 12:35:01 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jEtS1-0014Mi-2c; Thu, 19 Mar 2020 12:35:01 +0100
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Simon Ser <contact@emersion.fr>, Hans de Goede <hdegoede@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
Date: Thu, 19 Mar 2020 12:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xOCA0OjIyIHAubS4sIFNpbW9uIFNlciB3cm90ZToKPj4KPj4gT24gMy8xOC8y
MCAzOjM4IFBNLCBTaW1vbiBTZXIgd3JvdGU6Cj4+Pgo+Pj4+IDEpIExldHRpbmcgdGhlIFZNLXZp
ZXdlciB3aW5kb3ctc3lzdGVtIGRyYXcgdGhlIGN1cnNvciBhcyBpdCBub3JtYWxseQo+Pj4+IHdv
dWxkIGRyYXcgaXQuCj4+Pgo+Pj4gV2h5IGlzIHRoaXMgaW1wb3J0YW50PyBDYW4ndCB0aGUgVk0g
dmlld2VyIGhpZGUgdGhlIGN1cnNvciBhbmQgdXNlIGEKPj4+IHN1Yi1zdXJmYWNlIHRvIG1hbnVh
bGx5IGRyYXcgdGhlIGN1cnNvciBwbGFuZSBjb25maWd1cmVkIGJ5IHRoZSBndWVzdD8KPj4KPj4g
QmVjYXVzZSB0aGVuIG1vdmluZyB0aGUgY3Vyc29yIGFzIHNlZW4gYnkgdGhlIHVzZXIgcmVxdWly
ZXMgYSByb3VuZCB0cmlwCj4+IHRocm91Z2ggdGhlIFZNIGFuZCB0aGF0IGFkZHMgbGF0ZW5jeSwg
ZXNwLiB3aGVuIHRoZSBWTSB2aWV3ZXIgaXMgdmlld2luZwo+PiBhIFZNIHdoaWNoIGlzIHJ1bm5p
bmcgc29tZXdoZXJlIGVsc2Ugb3ZlciB0aGUgbmV0d29yay4KPiAKPiBUaGUgdmlkZW8gb3V0cHV0
IGhhcyBsYXRlbmN5IGFueXdheS4KClNvdW5kcyBsaWtlIHlvdSd2ZSBuZXZlciB0cmllZCB0aGUg
dHdvIGRpZmZlcmVudCBtb2RlcyB5b3Vyc2VsZj8gOikgSU1FCml0IG1ha2VzIGEgYmlnIGRpZmZl
cmVuY2UgZXZlbiB3aXRoIGEgbG9jYWwgVk0uIEV2ZW4gdmVyeSBsaXR0bGUgbGF0ZW5jeQpjYW4g
bWFrZSB0aGUgY3Vyc29yIGZlZWwgYXdrd2FyZCwgbGlrZSBpdCdzIGJlaW5nIGhlbGQgYmFjayBi
eSBhIHJ1YmJlcgpiYW5kIG9yIHNvbWV0aGluZy4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6Ru
emVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJy
ZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQg
WCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
