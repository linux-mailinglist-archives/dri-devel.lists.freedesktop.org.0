Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB256D0C6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF856E3EC;
	Thu, 18 Jul 2019 15:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69906E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 15:13:05 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 201so20716620qkm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qiq6mo8SuSLVGWvAOj/8rf0rOGcRje0ptMJyRuIppek=;
 b=ioqoBGr+hB7rC20qvAf8H6u84uY0e/YCtClrT2MasOTnAD2NNRsIGdhSJf9ZmQnHAr
 y8Ln53ImND6XVrbA2pvWRs0YhPBcrVkbrt8AMw5p8Ey/4al47Yg+jjyV7E/Mbmk2I8EA
 TbKZwmJQyQTSF7kPQ98l1iG0tmnJ0E8i/ti2A+BaV+CqR6yt3Y43qrOCczkl51sz2YO+
 PiJ1edF24ZdXM+Xx7y3yfjWjWK7PugKWg/SXpOYYEKMFI0cw8fxdnmGfVvM1d+k18mwl
 R6VHkR/m5o8MjN90Mcyp3MDJoyVlUKMugLpVLqs7uWv6HpYQzrEznv3H2QNia5dOuBrH
 omHw==
X-Gm-Message-State: APjAAAXicU+rmZvPrboXEnXtfLoFjvzMXA7wbZD9OPw2wWdPyqxrhHmR
 ocXpG+3g73/5UHtz0nrhebKLetBtEDZdkwi5vfs=
X-Google-Smtp-Source: APXvYqxnY0lfOEAOH/XvQdETK6Rku54hS6REry80H0mNybtT8Lr8Z0ZnkiBDE6H3VUatFtjpsNi5YxyqB7y4VRJ3Xjk=
X-Received: by 2002:a05:620a:b:: with SMTP id
 j11mr31499950qki.352.1563462784849; 
 Thu, 18 Jul 2019 08:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
 <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
 <CAK8P3a0q5xmi+mCvb1ET4d1uQmbnw+J2VkjRCzjemCXGy+5OBg@mail.gmail.com>
 <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
In-Reply-To: <7da08013-5ee0-1c39-e16b-8b6843a28381@samsung.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jul 2019 17:12:48 +0200
Message-ID: <CAK8P3a2nYArwNQrifW2xgzN=GUkN2wAjmZVo21JNw6YjHzwh7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDo1NiBQTSBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPiB3cm90ZToKPiBPbiAxOC4wNy4yMDE5IDE2OjIxLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDoxNiBQTSBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPiB3cm90ZToKPiA+PiBIaSBBcm5kLAo+ID4+Cj4gPj4gT24gMTgu
MDcuMjAxOSAxNTo0MiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+Pj4gVXNpbmcgJ2ltcGx5JyBj
YXVzZXMgYSBuZXcgcHJvYmxlbSwgYXMgaXQgYWxsb3dzIHRoZSBjYXNlIG9mCj4gPj4+IENPTkZJ
R19JTlBVVD1tIHdpdGggUkNfQ09SRT15LCB3aGljaCBmYWlscyB0byBsaW5rOgo+ID4+Pgo+ID4+
PiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rpb24gYGlyX2RvX2tleXVwJzoK
PiA+Pj4gcmMtbWFpbi5jOigudGV4dCsweDJiNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlu
cHV0X2V2ZW50Jwo+ID4+PiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rpb24g
YHJjX3JlcGVhdCc6Cj4gPj4+IHJjLW1haW4uYzooLnRleHQrMHgzNTApOiB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBpbnB1dF9ldmVudCcKPiA+Pj4gZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86
IEluIGZ1bmN0aW9uIGByY19hbGxvY2F0ZV9kZXZpY2UnOgo+ID4+PiByYy1tYWluLmM6KC50ZXh0
KzB4OTBjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfYWxsb2NhdGVfZGV2aWNlJwo+
ID4+Pgo+ID4+PiBBZGQgYSAnZGVwZW5kcyBvbicgdGhhdCBhbGxvd3MgYnVpbGRpbmcgYm90aCB3
aXRoIGFuZCB3aXRob3V0Cj4gPj4+IENPTkZJR19SQ19DT1JFLCBidXQgZGlzYWxsb3dzIGNvbWJp
bmF0aW9ucyB0aGF0IGRvbid0IGxpbmsuCj4gPj4+Cj4gPj4+IEZpeGVzOiA1MDIzY2YzMjIxMGQg
KCJkcm0vYnJpZGdlOiBtYWtlIHJlbW90ZSBjb250cm9sIG9wdGlvbmFsIikKPiA+Pj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+Pgo+ID4+IFByb3BlciBz
b2x1dGlvbiBoYXMgYmVlbiBhbHJlYWR5IG1lcmdlZCB2aWEgaW5wdXQgdHJlZVsxXS4KPiA+Pgo+
ID4+Cj4gPj4gWzFdOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FLZEFrUlRH
WE5iVXN1S0FTTkdMZndVd0M3QXNvZDlLNWJhWUxQV1BVN0VYLTQyLXlBQG1haWwuZ21haWwuY29t
Lwo+ID4gQXQgdGhhdCBsaW5rLCBJIG9ubHkgc2VlIHRoZSBwYXRjaCB0aGF0IGNhdXNlZCB0aGUg
cmVncmVzc2lvbiwgbm90Cj4gPiB0aGUgc29sdXRpb24uIEFyZSB5b3Ugc3VyZSBpdCdzIGZpeGVk
Pwo+Cj4KPiBVcHMsIHlvdSBhcmUgcmlnaHQsIEkgdGhvdWdoIHlvdSBhcmUgZml4aW5nIHdoYXQg
dGhpcyBwYXRjaCBhdHRlbXB0ZWQgdG8KPiBmaXggOikKPgo+IEFueXdheSwgd2Ugd2FudCB0byBh
dm9pZCBkZXBlbmRlbmN5IG9uIFJDX0NPUkUgLSB0aGlzIGRyaXZlciBkb2VzIG5vdAo+IHJlcXVp
cmUgaXQsIGJ1dCB3aXRoIFJDX0NPUkUgaXQgaGFzIGFkZGl0aW9uYWwgZmVhdHVyZXMuCgpSaWdo
dCwgdGhhdCdzIHdoYXQgbXkgcGF0Y2ggZG9lczogaWYgUkNfQ09SRSBpcyBkaXNhYmxlZCwgeW91
IGNhbgpzdGlsbCBzZXQgRFJNX1NJTF9TSUk4NjIwPXksIGJ1dCBpZiBSQ19DT1JFPW0sIERSTV9T
SUxfU0lJODYyMApjYW4gb25seSBiZSA9bSBvciA9bi4KCj4gTWF5YmUgImltcGx5IElOUFVUIiB3
b3VsZCBoZWxwPwoKTm8sIHRoYXQgd291bGQgbWFrZSBpdCB3b3JzZS4gRGV2aWNlIGRyaXZlcnMg
cmVhbGx5IGhhdmUgbm8gYnVzaW5lc3MKdHVybmluZyBvbiBvdGhlciBzdWJzeXN0ZW1zLgoKICAg
ICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
