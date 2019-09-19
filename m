Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD222B8827
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 01:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2EB6FC07;
	Thu, 19 Sep 2019 23:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB306FC07
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 23:39:37 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y127so3661045lfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FNGFxL5BLhyvs37aNDD2u4JgDHGO5UPdmdnn3EHqLo=;
 b=Ht8v10o8F/7/APYu31bmJt2lZioUp1ZuCDlnI0tW5bdlKRygHLL0Ml1s64I9BkzTnv
 uwnHW/MC4q1v7/j5IZ9r0XCNUEAJyj3FeljhmPaIQAr3RKe6AbacDCf4xRDvhUEgEMU0
 0bM8gh8Kg14RRNOGoGtSWR3r4g63UJ9Oq5czVN/waEeINsKLV7Vws+eb9YKaloHNcRnc
 1jOSd22Evydy+g2MiTjQ4/4KlQaHKgKXArz2fcvnah3EMgvBtp2GVUV2uArwcLrLUGW9
 S+N7yjeuw9qxpLIXA/6+1uUhxwMLnGKCy+WwpJG/9l19Y8YQp4UKakZi9v5FQQzuBpxA
 4sOA==
X-Gm-Message-State: APjAAAXZ0u8Z3kCiqT4g041tFzwHokTtTW2fyp4nmAhu7tVGDwL0Cn+F
 YhhrMaJZz8cFL60pzYUgek6XGB+r8lk=
X-Google-Smtp-Source: APXvYqz3LN42ox19eD0oXs02xwm8bWNjhyJyIx7fmJH5WRr7hlsUPw8NR2s4yWSx34vXwEQUkI/nMg==
X-Received: by 2002:a19:7605:: with SMTP id c5mr492417lff.114.1568936375616;
 Thu, 19 Sep 2019 16:39:35 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id d26sm24967ljc.64.2019.09.19.16.39.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 16:39:35 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id c195so3612769lfg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:39:34 -0700 (PDT)
X-Received: by 2002:a19:7d55:: with SMTP id y82mr6397849lfc.106.1568936374113; 
 Thu, 19 Sep 2019 16:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txTjip6SonSATB-O38TGX9ituQaw+29PnAkNJ960R1z6g@mail.gmail.com>
In-Reply-To: <CAPM=9txTjip6SonSATB-O38TGX9ituQaw+29PnAkNJ960R1z6g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 16:39:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
Message-ID: <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
Subject: Re: [git pull] drm tree for 5.4-rc1
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5FNGFxL5BLhyvs37aNDD2u4JgDHGO5UPdmdnn3EHqLo=;
 b=SpEy3jPkCRJpYSb59pOS+GuECUW5l5+gVAswRj/iKNkELB5/NunWndHY13iq+Kk6OL
 rQoJupSBfhWOcfEiUrIZsCK/nOELDk9lHhQlXV/dRiocbMOemmpHSrl4qWuBsFz1AzVF
 mfz4fIf2/PIYYKHqLSFmX/7zeaeSOShoOouj8=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMTI6MDkgUE0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFRoZXJlIGFyZSBhIGZldyBtZXJnZSBjb25mbGljdHMgYWNyb3Nz
IHRoZSBib2FyZCwgd2UgaGF2ZSBhIHNoYXJlZAo+IHJlcmVyZSBjYWNoZSB3aGljaCBtZWFudCBJ
IGhhZG4ndCBub3RpY2VkIHRoZW0gdW50aWwgSSBhdm9pZGVkIHRoZQo+IGNhY2hlLgo+IGh0dHBz
Oi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS9sb2cvP2g9ZHJtLTUuNC1tZXJnZQo+IGNv
bnRhaW5zIHdoYXQgd2UndmUgZG9uZSwgbm9uZSBvZiB0aGVtIGFyZSB0b28gY3JhenkuCgpIbW0u
IE15IG1lcmdlIGlzbid0IGlkZW50aWNhbCB0byB0aGF0LiBJdCdzIGNsb3NlIHRob3VnaC4gRGlm
ZmVyZW50Cm9yZGVyIGZvciBvbmUgI2RlZmluZSB3aGljaCBtaWdodCBiZSBqdXN0IGZyb20geW91
IGFuZCBtZSBtZXJnaW5nCmRpZmZlcmVudCBkaXJlY3Rpb25zLgoKQnV0IEkgYWxzbyBlbmRlZCB1
cCByZW1vdmluZyB0aGUgLmdlbV9wcmltZV9leHBvcnQgaW5pdGlhbGl6YXRpb24gdG8KZHJtX2dl
bV9wcmltZV9leHBvcnQsIGJlY2F1c2UgaXQncyB0aGUgZGVmYXVsdCBpZiBub25lIGV4aXN0cy4g
VGhhdCdzCnRoZSBsZWZ0LW92ZXIgZnJvbQoKICAgIDNiYWVlYjIxOTgzYSAoImRybS9tdGs6IERy
b3AgZHJtX2dlbV9wcmltZV9leHBvcnQvaW1wb3J0IikKCmFmdGVyIHRoZSBpbXBvcnQgc3RheWVk
IGFyb3VuZCBiZWNhdXNlIGl0IGdvdCB0dXJuZWQgaW50byBhbiBhY3R1YWxseQpub24tZGVmYXVs
dCBvbmUuCgpJIHRoaW5rIHRoYXQgYm90aCBvZiBvdXIgbWVyZ2VzIGFyZSByaWdodCAtIGVxdWl2
YWxlbnQgYnV0IGp1c3QKc2xpZ2h0bHkgZGlmZmVyZW50LgoKQnV0IHRoZSByZWFzb24gSSdtIHBv
aW50aW5nIHRoaXMgb3V0IGlzIHRoYXQgSSBhbHNvIGdldCB0aGUgZmVlbGluZwp0aGF0IGlmIGl0
IG5lZWRzIHRoYXQgZGV2LT5kZXZfcHJpdmF0ZSBkaWZmZXJlbmNlIGZyb20gdGhlIGRlZmF1bHQK
ZnVuY3Rpb24gaW4gcHJpbWVfaW1wb3J0KCksIHdvdWxkbid0IGl0IG5lZWQgdGhlIHNhbWUgZm9y
IHByaW1lX2V4cG9ydAp0b28/CgpJIGRvbid0IGtub3cgdGhlIGNvZGUsIGFuZCBJIGRvbid0IGtu
b3cgdGhlIGhhcmR3YXJlLCBidXQganVzdCBmcm9tIGEKInBhdHRlcm4gbWF0Y2hpbmciIGFuZ2xl
IEkganVzdCB3YW50ZWQgdG8gY2hlY2sgd2hldGhlciBtYXliZSB0aGVyZSdzCm5lZWQgZm9yIGEg
bXRrX2RybV9nZW1fcHJpbWVfZXhwb3J0KCkgd3JhcHBlciB0aGF0IGRvZXMgdGhhdCBzYW1lCnRo
aW5nIHdpdGgKCiAgICAgICAgc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldi0+
ZGV2X3ByaXZhdGU7CgogICAgICAgIC4uIHVzZSBwcml2YXRlLT5kZXYgIGluc3RlYWQgb2YgZGV2
LT5kZXYgLi4KClNvIEknbSBqdXN0IGFza2luZyB0aGF0IHNvbWVib2R5IHRoYXQga25vd3MgdGhh
dCBkcm0vbXRrIGNvZGUgc2hvdWxkCmRvdWJsZS1jaGVjayB0aGF0IG9kZGl0eS4KClRoYW5rcywK
ICAgICAgICAgICAgICBMaW51cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
