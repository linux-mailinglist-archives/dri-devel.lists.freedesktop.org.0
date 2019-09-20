Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B4EB8BDD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2076F58D;
	Fri, 20 Sep 2019 07:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B62D6E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 05:26:26 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id e18so767711oii.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 22:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BR3Y1sgQYvbq1M6HSpy9hDVNEXYdCpLTznu5wS7Li8=;
 b=NHJEdyAKx/qrDe8mhx4MQxxvUpz3Cvyyyp/NLJ45+CgX/E2LM38Xz3UkYV+VNggONx
 j87tDlI+7HhjcKR/cr0rJSLLwUMaJBVwegx1Tw8v0ps2eqBzwA+RmK9Spd8iD7o6UuzC
 Y1L0fcm9M61cPzB38meYnoIZ+Fq6M9oN4txcEhA9ECeYMnei4C81XHhDII9Rl0EwhFHl
 zJ2LTyjVv8wSGqxaEJref+myFdKXDn5nAWP0SGV6EghQchRGlgBsOgJ6F4UfDXjpoUQL
 rYcEwW6gyeHyR6VisC7Fs9/k8GQX8YH+8g76y5OOAv6QT3AhyjZI6TE7hBK9E6vByIJe
 0amA==
X-Gm-Message-State: APjAAAU9Z64L3GM30QCO1w3eVjlmVvzQ9H8GFpPgIzcmCfV940w7oKY8
 WfLuzi3VsOVFIJ3E9lXjQWmbIQaag3I=
X-Google-Smtp-Source: APXvYqx3rqa2r2b6MBh3U8qozBklnQ3Wjnfg1g161iPK44SJdl3jGH4QKkWv5NYCk951bKDKxRW2KQ==
X-Received: by 2002:aca:4e97:: with SMTP id c145mr1384912oib.145.1568957185447; 
 Thu, 19 Sep 2019 22:26:25 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id i2sm419544otf.19.2019.09.19.22.26.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 22:26:24 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 41so5150691oti.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 22:26:24 -0700 (PDT)
X-Received: by 2002:a9d:4615:: with SMTP id y21mr2930384ote.97.1568957183906; 
 Thu, 19 Sep 2019 22:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txTjip6SonSATB-O38TGX9ituQaw+29PnAkNJ960R1z6g@mail.gmail.com>
 <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
 <CAPM=9tzLFenqZQo_NQqKd5xPQ5g-5WY+JxTotL7AHk_+6S89ow@mail.gmail.com>
In-Reply-To: <CAPM=9tzLFenqZQo_NQqKd5xPQ5g-5WY+JxTotL7AHk_+6S89ow@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 20 Sep 2019 14:26:12 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUhuk93Hm5Ba_HqcW9nRF0tGbEv28eLeh7pXRZZ8swV+w@mail.gmail.com>
Message-ID: <CAPBb6MUhuk93Hm5Ba_HqcW9nRF0tGbEv28eLeh7pXRZZ8swV+w@mail.gmail.com>
Subject: Re: [git pull] drm tree for 5.4-rc1
To: Dave Airlie <airlied@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Tomasz Figa <tfiga@chromium.org>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7BR3Y1sgQYvbq1M6HSpy9hDVNEXYdCpLTznu5wS7Li8=;
 b=ku69JyrMeh8u3IrHeMU7R0MsT10T22vF/fLLImEdozDQhdkk09sEWKMt4sKEhb7SxV
 EvrMV/pJtPhtWWEG7TmuGpc7wwjh2BTGsxvbu0zVjINbtNV+w9f3ubwnAx/l312mPGPR
 vsiIaIvw/VtiCTqFi43+jTujFXSSI/syBwWOk=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgOToxMSBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBIbW0uIE15IG1lcmdlIGlzbid0IGlkZW50aWNhbCB0byB0aGF0
LiBJdCdzIGNsb3NlIHRob3VnaC4gRGlmZmVyZW50Cj4gPiBvcmRlciBmb3Igb25lICNkZWZpbmUg
d2hpY2ggbWlnaHQgYmUganVzdCBmcm9tIHlvdSBhbmQgbWUgbWVyZ2luZwo+ID4gZGlmZmVyZW50
IGRpcmVjdGlvbnMuCj4gPgo+ID4gQnV0IEkgYWxzbyBlbmRlZCB1cCByZW1vdmluZyB0aGUgLmdl
bV9wcmltZV9leHBvcnQgaW5pdGlhbGl6YXRpb24gdG8KPiA+IGRybV9nZW1fcHJpbWVfZXhwb3J0
LCBiZWNhdXNlIGl0J3MgdGhlIGRlZmF1bHQgaWYgbm9uZSBleGlzdHMuIFRoYXQncwo+ID4gdGhl
IGxlZnQtb3ZlciBmcm9tCj4gPgo+ID4gICAgIDNiYWVlYjIxOTgzYSAoImRybS9tdGs6IERyb3Ag
ZHJtX2dlbV9wcmltZV9leHBvcnQvaW1wb3J0IikKPiA+Cj4gPiBhZnRlciB0aGUgaW1wb3J0IHN0
YXllZCBhcm91bmQgYmVjYXVzZSBpdCBnb3QgdHVybmVkIGludG8gYW4gYWN0dWFsbHkKPiA+IG5v
bi1kZWZhdWx0IG9uZS4KPiA+Cj4gPiBJIHRoaW5rIHRoYXQgYm90aCBvZiBvdXIgbWVyZ2VzIGFy
ZSByaWdodCAtIGVxdWl2YWxlbnQgYnV0IGp1c3QKPiA+IHNsaWdodGx5IGRpZmZlcmVudC4KPiA+
Cj4gPiBCdXQgdGhlIHJlYXNvbiBJJ20gcG9pbnRpbmcgdGhpcyBvdXQgaXMgdGhhdCBJIGFsc28g
Z2V0IHRoZSBmZWVsaW5nCj4gPiB0aGF0IGlmIGl0IG5lZWRzIHRoYXQgZGV2LT5kZXZfcHJpdmF0
ZSBkaWZmZXJlbmNlIGZyb20gdGhlIGRlZmF1bHQKPiA+IGZ1bmN0aW9uIGluIHByaW1lX2ltcG9y
dCgpLCB3b3VsZG4ndCBpdCBuZWVkIHRoZSBzYW1lIGZvciBwcmltZV9leHBvcnQKPiA+IHRvbz8K
PiA+Cj4gPiBJIGRvbid0IGtub3cgdGhlIGNvZGUsIGFuZCBJIGRvbid0IGtub3cgdGhlIGhhcmR3
YXJlLCBidXQganVzdCBmcm9tIGEKPiA+ICJwYXR0ZXJuIG1hdGNoaW5nIiBhbmdsZSBJIGp1c3Qg
d2FudGVkIHRvIGNoZWNrIHdoZXRoZXIgbWF5YmUgdGhlcmUncwo+ID4gbmVlZCBmb3IgYSBtdGtf
ZHJtX2dlbV9wcmltZV9leHBvcnQoKSB3cmFwcGVyIHRoYXQgZG9lcyB0aGF0IHNhbWUKPiA+IHRo
aW5nIHdpdGgKPiA+Cj4gPiAgICAgICAgIHN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGUg
PSBkZXYtPmRldl9wcml2YXRlOwo+ID4KPiA+ICAgICAgICAgLi4gdXNlIHByaXZhdGUtPmRldiAg
aW5zdGVhZCBvZiBkZXYtPmRldiAuLgo+ID4KPiA+IFNvIEknbSBqdXN0IGFza2luZyB0aGF0IHNv
bWVib2R5IHRoYXQga25vd3MgdGhhdCBkcm0vbXRrIGNvZGUgc2hvdWxkCj4gPiBkb3VibGUtY2hl
Y2sgdGhhdCBvZGRpdHkuCj4KPiBJJ3ZlIGNjJ2VkIEFsZXhhbmRyZSB3aG8gd3JvdGUgdGhlIGlt
cG9ydCBoYWxmIG9mIHRoaXMgY29kZSB0byBsb29rIGludG8gaXQuCgpJIGFtIG5vdCBzdXBlciBm
YW1pbGlhciB3aXRoIHRoaXMgZHJpdmVyIGVpdGhlciBzbyBJIG1heSBoYXZlCm92ZXJsb29rZWQg
dGhpcy4gVXNpbmcgZGV2LT5kZXZfcHJpdmF0ZSB3YXMgdG8gbWFrZSBzdXJlIHRoYXQgdGhlCmlt
cG9ydGVkIGJ1ZmZlcnMgd291bGQgYmUgbWFwcGVkIGNvbnRpZ3VvdXNseSBpbiB0aGUgZGV2aWNl
J3MgYWRkcmVzcwpzcGFjZSwgc28gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHdlIG5lZWQgdG8gZG8g
c29tZXRoaW5nIGluIHRoZSBjYXNlIG9mCmV4cG9ydC4KCkFkZGVkIENLIGFuZCBUb21hc3ogd2hv
IG1heSBoYXZlIGEgbW9yZSBpbmZvcm1lZCBvcGluaW9uIG9uIHRoaXMuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
