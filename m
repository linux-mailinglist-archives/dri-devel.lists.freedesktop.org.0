Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2A1ECABA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1889CD3;
	Wed,  3 Jun 2020 07:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAF089C89
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 07:43:23 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id s21so981817oic.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vY4y0JhXv/D29rjsVD+kS4QfopuULHMmvhUHPgT7K/Y=;
 b=ctkqnrn9huKuehDcyS1rw+N1T+nGQivzy3aseSSjf3Q/z44MJenzC9MdrLVrtPMI3L
 vtt+M7DcGGUIk6YuhV9NYsQ4FE9UkoDgUYvN1jEgxrDqW55kj70makupwI3s5LGhDbDM
 IHUD++GPvKUGLvbVb7pNoyvRQLJpNm3Sj2bpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vY4y0JhXv/D29rjsVD+kS4QfopuULHMmvhUHPgT7K/Y=;
 b=W3SYt8rVs7k8/erjdd7ZWEaWpqCKkHw3lyCCiaqrjsddZXK0OuO+SmJB6RQGYHbc2j
 m0hI5FafXA79U54kE30G9NRoiglX502i2CqEFByquIwYQokxOOUjHG7WIViuSdtDAAEq
 S3hqMYfX09iQqPVdpoFev6yzRXvukOq17QCAcWimRnfkK5GioXNDPvuzmkJMidLBlJvI
 /OzxmRGfltTNqzvKVR0rF1Y5UHOVDdwW7Gtw5buEuM5ED12dc4SaD/vJ/K3g4k7G3UXy
 sPLfd2W9onctbd17z75NJUYbjrQKBveU3oIAzwHFpC88k+FLW8qHxIE/k23HyWk4qfx6
 tbuA==
X-Gm-Message-State: AOAM533FzKut8RcouNh1fBhtuASWnBSgKPqbUW7lWug6RB2CAkmxQADE
 4s3o8XShRuWOHpWMnzlZe+7S9SIW1B9Y+mkDbXDiJQ==
X-Google-Smtp-Source: ABdhPJymYFBB4qTO2iV3fKajN0kRnUfnpqF2m8adj5PkYKr/CCvXSuR4yN5GXbv2TV/lXEz6BonxwqCrFy1m4alvzs4=
X-Received: by 2002:aca:4b91:: with SMTP id y139mr5374242oia.128.1591170202838; 
 Wed, 03 Jun 2020 00:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
 <CAHk-=wiug3vS=J7obQsyCLp+6qQvT5v6ctOddHRXbVgsLFTLwQ@mail.gmail.com>
 <e75218b1-985a-0ec8-483d-9780f668d8c3@suse.de>
In-Reply-To: <e75218b1-985a-0ec8-483d-9780f668d8c3@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 3 Jun 2020 09:43:11 +0200
Message-ID: <CAKMK7uHfS-R+03u=kXfCUjcqVRohKYtNLxaSZ98KoYRbeTNOvw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMywgMjAyMCBhdCA5OjE4IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwMi4wNi4yMCB1bSAyMzo1NiBzY2hy
aWViIExpbnVzIFRvcnZhbGRzOgo+ID4gT24gVHVlLCBKdW4gMiwgMjAyMCBhdCAyOjIxIFBNIExp
bnVzIFRvcnZhbGRzCj4gPiA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+
ID4+Cj4gPj4gSSdtIHN0aWxsIHdvcmtpbmcgdGhyb3VnaCB0aGUgcmVzdCBvZiB0aGUgbWVyZ2Us
IHNvIGZhciB0aGF0IHdhcyB0aGUKPiA+PiBvbmx5IG9uZSB0aGF0IG1hZGUgbWUgZ28gIldoYWE/
Ii4KPiA+Cj4gPiBIbW0uIEknbSBhbHNvIGVuZGluZyB1cCBlZmZlY3RpdmVseSByZXZlcnRpbmcg
dGhlIGRybSBjb21taXQKPiA+IGIyOGFkN2RlYjJmMiAoImRybS90aWRzczogVXNlIHNpbXBsZSBl
bmNvZGVyIikgYmVjYXVzZSBjb21taXQKPiA+IDlkYTY3NDMzZjY0ZSAoImRybS90aWRzczogZml4
IGNyYXNoIHJlbGF0ZWQgdG8gYWNjZXNzaW5nIGZyZWVkCj4gPiBtZW1vcnkiKSBtYWRlIHRoZSBw
cmVtaXNlIG9mIHRoYXQgc2ltcGx5IGVuY29kZXIgY29tbWl0IG5vIGxvbmdlciBiZQo+ID4gdHJ1
ZS4KPgo+IFRoYXQncyBPSy4gVGhlIHNpbXBsZSBlbmNvZGVyIGlzIGp1c3QgZm9yIGNvbnNvbGlk
YXRpbmcgdGhlc2UKPiBhbG1vc3QtZW1wdHkgZW5jb2RlcnMgYXQgYSBzaW5nbGUgcGxhY2UuCj4K
PiA+IElmIHRoZXJlIGlzIGEgYmV0dGVyIHdheSB0byBzb3J0IHRoYXQgb3V0IChpZSBzb21ldGhp
bmcgbGlrZSAidXNlCj4gPiBzaW1wbGUgZW5jb2RlciBidXQgbWFrZSBpdCBmcmVlIHRoaW5ncyBh
dCBkZXN0cm95IHRpbWUiKSwgSSBkb24ndCBrbm93Cj4gPiBvZiBpdC4KPgo+IFRoZXJlJ3Mgbm93
IGRybW1fa21hbGxvYygpIHRvIGF1dG8tZnJlZSB0aGUgbWVtb3J5IHdoZW4gRFJNIHJlbGVhc2Vz
IGEKPiBkZXZpY2UuCgpZZWFoIEkgdGhpbmsgd2UgZGlzY3Vzc2VkIHRoYXQgdGlkc3MgcGF0Y2gg
b24gZHJpLWRldmVsIHdoZW4gaXQgc2hvd2VkCnVwLCByaWdodCBmaXggaXMgdG8gZXNzZW50aWFs
bHkgdW5kbyBpdCwgcmVwbGFjZSB3aXRoIGEKcy9kZXZtX2t6YWxsb2MvZHJtbV9rbWFsbG9jLyBh
bmQgdGhlbiByZS1hcHBseSB0aGUgc2ltcGxlIGVuY29kZXIKY29udmVyc2lvbi4gV2UgaGFkIChh
bmQgSSB0aGluayBzdGlsbCBoYXZlKSBzb21lIGRldGFpbHMgdG8gc29ydCBvdXQKaW4gYWxsIHRo
aXMsIHNvIHNvbWUgYmFjayZmb3J0aCBpcyBlbnRpcmVseSBleHBlY3RlZCBoZXJlLiBBbHNvIGl0
J3MKanVzdCBkcml2ZXIgdW5sb2FkLCB3aGljaCBhdCBsZWFzdCBmb3IgaW50ZWdyYXRlZCBncHUg
bm8gdXNlciBldmVyCmNhcmVzIGFib3V0LCBvbmx5IGRldmVsb3BlcnMuCi1EYW5pZWwKCj4KPiBC
ZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+ID4KPiA+IEknbGwgbGV0IHlvdSBndXlzIGZpZ2h0IGl0
IG91dCAoYWRkZWQgcGVvcGxlIGludm9sdmVkIHdpdGggdGhvc2UKPiA+IGNvbW1pdHMgdG8gdGhl
IHBhcnRpY2lwYW50cywKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgIExpbnVzCj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+
Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+
IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4KCgotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDgg
LSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
