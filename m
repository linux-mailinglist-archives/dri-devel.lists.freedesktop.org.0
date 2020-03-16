Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BDB186853
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073D26E3C6;
	Mon, 16 Mar 2020 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 666B389FC5;
 Mon, 16 Mar 2020 09:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 104992A6042;
 Mon, 16 Mar 2020 10:57:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 2PtkzY5dlS6y; Mon, 16 Mar 2020 10:57:47 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8F0442A6016;
 Mon, 16 Mar 2020 10:57:47 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jDmVH-000X4G-3f; Mon, 16 Mar 2020 10:57:47 +0100
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
Date: Mon, 16 Mar 2020 10:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMy0xNiA0OjUwIGEubS4sIE1hcmVrIE9sxaHDoWsgd3JvdGU6Cj4gVGhlIHN5bmNo
cm9uaXphdGlvbiB3b3JrcyBiZWNhdXNlIHRoZSBNZXNhIGRyaXZlciB3YWl0cyBmb3IgaWRsZSAo
ZHJhaW5zCj4gdGhlIEdGWCBwaXBlbGluZSkgYXQgdGhlIGVuZCBvZiBjb21tYW5kIGJ1ZmZlcnMg
YW5kIHRoZXJlIGlzIG9ubHkgMQo+IGdyYXBoaWNzIHF1ZXVlLCBzbyBldmVyeXRoaW5nIGlzIG9y
ZGVyZWQuCj4gCj4gVGhlIEdGWCBwaXBlbGluZSBydW5zIGFzeW5jaHJvbm91c2x5IHRvIHRoZSBj
b21tYW5kIGJ1ZmZlciwgbWVhbmluZyB0aGUKPiBjb21tYW5kIGJ1ZmZlciBvbmx5IHN0YXJ0cyBk
cmF3cyBhbmQgZG9lc24ndCB3YWl0IGZvciBjb21wbGV0aW9uLiBJZiB0aGUKPiBNZXNhIGRyaXZl
ciBkaWRuJ3Qgd2FpdCBhdCB0aGUgZW5kIG9mIHRoZSBjb21tYW5kIGJ1ZmZlciwgdGhlIGNvbW1h
bmQKPiBidWZmZXIgd291bGQgZmluaXNoIGFuZCBhIGRpZmZlcmVudCBwcm9jZXNzIGNvdWxkIHN0
YXJ0IGV4ZWN1dGlvbiBvZiBpdHMKPiBvd24gY29tbWFuZCBidWZmZXIgd2hpbGUgc2hhZGVycyBv
ZiB0aGUgcHJldmlvdXMgcHJvY2VzcyBhcmUgc3RpbGwgcnVubmluZy4KPiAKPiBJZiB0aGUgTWVz
YSBkcml2ZXIgc3VibWl0cyBhIGNvbW1hbmQgYnVmZmVyIGludGVybmFsbHkgKGJlY2F1c2UgaXQn
cyBmdWxsKSwKPiBpdCBkb2Vzbid0IHdhaXQsIHNvIHRoZSBHRlggcGlwZWxpbmUgZG9lc24ndCBu
b3RpY2UgdGhhdCBhIGNvbW1hbmQgYnVmZmVyCj4gZW5kZWQgYW5kIGEgbmV3IG9uZSBzdGFydGVk
Lgo+IAo+IFRoZSB3YWl0aW5nIGF0IHRoZSBlbmQgb2YgY29tbWFuZCBidWZmZXJzIGhhcHBlbnMg
b25seSB3aGVuIHRoZSBmbHVzaCBpcwo+IGV4dGVybmFsIChTd2FwIGJ1ZmZlcnMsIGdsRmx1c2gp
Lgo+IAo+IEl0J3MgYSBwZXJmb3JtYW5jZSBwcm9ibGVtLCBiZWNhdXNlIHRoZSBHRlggcXVldWUg
aXMgYmxvY2tlZCB1bnRpbCB0aGUgR0ZYCj4gcGlwZWxpbmUgaXMgZHJhaW5lZCBhdCB0aGUgZW5k
IG9mIGV2ZXJ5IGZyYW1lIGF0IGxlYXN0Lgo+IAo+IFNvIGV4cGxpY2l0IGZlbmNlcyBmb3IgU3dh
cEJ1ZmZlcnMgd291bGQgaGVscC4KCk5vdCBzdXJlIHdoYXQgZGlmZmVyZW5jZSBpdCB3b3VsZCBt
YWtlLCBzaW5jZSB0aGUgc2FtZSB0aGluZyBuZWVkcyB0byBiZQpkb25lIGZvciBleHBsaWNpdCBm
ZW5jZXMgYXMgd2VsbCwgZG9lc24ndCBpdD8KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVy
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBz
b2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBk
ZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
