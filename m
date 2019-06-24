Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8251DDB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C4689E26;
	Mon, 24 Jun 2019 22:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89689E26
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:02:17 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so14140456ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XtbMn3xFs7FmnICFe6DhpFIKouWcZNSxkCHmQ/+Ylc=;
 b=TMyns8tleZYcmgGxKxys4f295LakumIlqzPK4l9Htgu8Fhv48pXcADRB8Jp6DJB900
 zJnydGDlLMFoYnrhvjEzlzFKzDkIA9DhDQgM7SiewMFpFSvCU7FQzJWICBBF009A1TGo
 rTn63vCQoDNJVSg7As4PCxdeyz8Jlq/WspJrvktBLzLT4XJ25lL+qlKeBKsmd0/nC5cF
 CB9Kj+tI9pfxWmx4T6k/8uxtc+jQM22N40gACYbwGGHix2a8doop/PCVNBTFlN4jvYIi
 0TAt0y9CuQTgCnnpsGvDkInXN9osJbgXuH62iWCFe3GYjO+56HZgrwCbaJ3QDFxCqOXu
 s+Tg==
X-Gm-Message-State: APjAAAW2AJuO+P6PnLJc6hPVNOd+NFBhyPZXKWOqx4B2dTIR7fhoZApj
 aFdhUeU4yfPkg7mxNdPP6A41lVP8UmGRxMZaFgiYYg==
X-Google-Smtp-Source: APXvYqz94aRYtRYpNe6kqWgritXzE0c6aWIYSvz2gxrGE8hvN+/7y7do5SKF1vQxUBqEL72NonVRvHe+q4JNPmoe7sI=
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr31105577ljg.37.1561413735780; 
 Mon, 24 Jun 2019 15:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190522163428.7078-1-paul@crapouillou.net>
 <5b0f8bb3-e7b0-52c1-1f2f-9709992b76fc@linaro.org>
 <20190621135608.GB11839@ulmo>
In-Reply-To: <20190621135608.GB11839@ulmo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 00:02:02 +0200
Message-ID: <CACRpkdY4xgtYVto8fM-TSGWbDEsJpj=Fx2zXHPaZTJ6m1JuWQw@mail.gmail.com>
Subject: Re: [PATCH] backlight: pwm_bl: Set pin to sleep state when powered
 down
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4XtbMn3xFs7FmnICFe6DhpFIKouWcZNSxkCHmQ/+Ylc=;
 b=izb2Z46NzMUkEEC4KRpeTZxTRLJ0GQ/RzhAb8ief9AuLtSRsxtyGojyTaRXUHuLRF1
 Y1K1Hj+ItpQFmYCDMraMDoN6XKefXr/fA2S8lixYzb6lN+40iNMZAwugGK8wDaIMlihe
 GnpLw8qtECPRTbWEMTN4v6XVwOgmV0JI/tyVx9mdyNZyMPiICLek7nR5F+BVEJ6kQcqU
 ZPQK7vlfl2br4pdVVLyjIF2wmIT5LthddzXtyklfp3JOeQBYHHElDedyH9Pfi4UkF1mQ
 QU0A3nRr+NuNXpcAu8UNX2jUf/t5J1gt+oqip44qh7spUrxSVnv6owch92cePWrvXSMi
 c6gw==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMzo1NiBQTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKCj4gSSdtIG5vdCBzdXJlIHRoaXMgd291bGQgYWN0dWFs
bHkgd29yayBiZWNhdXNlIEkgdGhpbmsgdGhlIHdheSB0aGF0Cj4gcGluY3RybCBoYW5kbGVzIHN0
YXRlcyBib3RoICJpbml0IiBhbmQgImlkbGUiIHdvdWxkIGJlIHRoZSBzYW1lIHBvaW50ZXIKPiB2
YWx1ZXMgYW5kIHRoZXJlZm9yZSBwaW5jdHJsX2luaXRfZG9uZSgpIHdvdWxkIHRoaW5rIHRoZSBk
cml2ZXIgZGlkbid0Cj4gY2hhbmdlIGF3YXkgZnJvbSB0aGUgImluaXQiIHN0YXRlIGJlY2F1c2Ug
aXQgaXMgdGhlIHNhbWUgcG9pbnRlciB2YWx1ZQo+IGFzIHRoZSAiaWRsZSIgc3RhdGUgdGhhdCB0
aGUgZHJpdmVyIHNlbGVjdGVkLgoKUmlnaHQuCgo+IE9uZSB3YXkgdG8gd29yayBhcm91bmQKPiB0
aGF0IHdvdWxkIGJlIHRvIGR1cGxpY2F0ZSB0aGUgImlkbGUiIHN0YXRlIGRlZmluaXRpb24gYW5k
IGFzc29jaWF0ZSBvbmUKPiBpbnN0YW5jZSBvZiBpdCB3aXRoIHRoZSAiaWRsZSIgc3RhdGUgYW5k
IHRoZSBvdGhlciB3aXRoIHRoZSAiaW5pdCIKPiBzdGF0ZS4gQXQgdGhhdCBwb2ludCBib3RoIHN0
YXRlcyBzaG91bGQgYmUgZGlmZmVyZW50IChkaWZmZXJlbnQgcG9pbnRlcgo+IHZhbHVlcykgYW5k
IHdlJ2QgZ2V0IHRoZSBpbml0IHN0YXRlIHNlbGVjdGVkIGF1dG9tYXRpY2FsbHkgYmVmb3JlIHBy
b2JlLAo+IHNlbGVjdCAiaWRsZSIgZHVyaW5nIHByb2JlIGFuZCB0aGVuIHRoZSBjb3JlIHdpbGwg
bGVhdmUgaXQgYWxvbmUuIFRoYXQncwo+IG9mIGNvdXJzZSB1Z2x5IGJlY2F1c2Ugd2UgZHVwbGlj
YXRlIHRoZSBwaW5jdHJsIHN0YXRlIGluIERULCBidXQgcGVyaGFwcwo+IGl0J3MgdGhlIGxlYXN0
IHVnbHkgc29sdXRpb24uCgpJZiBzb21ldGhpbmcgbmVlZHMgc3BlY2lhbCBtb2NrZXJ5IGFuZCBp
cyBub3QgZ2VuZXJpYywgSSdkIGp1c3QKY29tZSB1cCB3aXRoIHdoYXRldmVyIHN0cmluZyBQV00g
bmVlZHMsIGxpa2UKInB3bS1pZGxlIiwgInB3bS1zbGVlcCIsICJwd20taW5pdCIgZXRjIGluc3Rl
YWQgb2YKY29tcGxpY2F0aW5nIHRoZSBzdHVmZiBkb25lIGJlZm9yZSBwcm9iZSgpLiBUaGVzZSBz
dGF0ZXMgYXJlCm9ubHkgaGFuZGxlZCB0aGVyZSB0byBtYWtlIHByb2JlKCkgc2ltcGxlIGluIHNp
bXBsZSBjYXNlcy4KCj4gQWRkaW5nIExpbnVzIGZvciB2aXNpYmlsaXR5LiBQZXJoYXBzIGhlIGNh
biBzaGFyZSBzb21lIGluc2lnaHQuCgpJIHRoaW5rIFBhdWwgaGFzaGVkIGl0IG91dC4gT3Igd2ls
bC4KCj4gT24gdGhhdCBub3RlLCBJJ20gd29uZGVyaW5nIGlmIHBlcmhhcHMgaXQnZCBtYWtlIHNl
bnNlIGZvciBwaW5jdHJsIHRvCj4gc3VwcG9ydCBzb21lIG1vZGUgd2hlcmUgYSBkZXZpY2Ugd291
bGQgc3RhcnQgb3V0IGluIGlkbGUgbW9kZS4gVGhhdCBpcywKPiB3aGVyZSBwaW5jdHJsX2JpbmRf
cGlucygpIHdvdWxkIHNlbGVjdCB0aGUgImlkbGUiIG1vZGUgYXMgdGhlIGRlZmF1bHQKPiBiZWZv
cmUgcHJvYmUuIFdpdGggc29tZXRoaW5nIGxpa2UgdGhhdCB3ZSBjb3VsZCBlYXNpbHkgc3VwcG9y
dCB0aGlzCj4gdXNlLWNhc2Ugd2l0aG91dCBnbGl0Y2hpbmcuCgpJIHdvdWxkIHNheSB0aGUgZHJp
dmVyIGNhbiBjb21lIHVwIHdpdGggd2hhdGV2ZXIgc3RhdGUgaXQgbmVlZCBmb3IKdGhhdCBhbmQg
aGFuZGxlIGl0IGV4cGxpY2l0bHkuIFdoZW4gdGhlcmUgYXJlIHNvIG1hbnkgb2YgdGhlbSB0aGF0
Cml0IHdhcnJhbnRzIGdyb3dpbmcgdGhlIGRldmljZSBjb3JlLCB3ZSBjYW4gbW92ZSBpdCBpbnRv
CmRyaXZlcnMvYmFzZS9waW5jdHJsLmMuIEJ1dCBubyB1cGZyb250IGRlc2lnbi4KCj4gSSBzdXBw
b3NlIHlldCBhbm90aGVyIHZhcmlhbnQgd291bGQgYmUgZm9yIHRoZSBQV00gYmFja2xpZ2h0IHRv
IG5vdCB1c2UKPiBhbnkgb2YgdGhlIHN0YW5kYXJkIHBpbmN0cmwgc3RhdGVzIGF0IGFsbC4gSW5z
dGVhZCBpdCBjb3VsZCBqdXN0IGRlZmluZQo+IGN1c3RvbSBzdGF0ZXMsIHNheSAiYWN0aXZlIiBh
bmQgImluYWN0aXZlIi4KCkkgd291bGQgc3VnZ2VzdCBkb2luZyB0aGF0LgoKPiBMb29raW5nIGF0
IHRoZSBjb2RlIHRoYXQKPiB3b3VsZCBwcmV2ZW50IHBpbmN0cmxfYmluZF9waW5zKCkgZnJvbSBk
b2luZyBhbnl0aGluZyB3aXRoIHBpbmN0cmwKPiBzdGF0ZXMgYW5kIGdpdmVuIHRoZSBkcml2ZXIg
ZXhhY3QgY29udHJvbCBvdmVyIHdoZW4gZWFjaCBvZiB0aGUgc3RhdGVzCj4gd2lsbCBiZSBzZWxl
Y3RlZC4gVGhhdCdzIHNvbWV3aGF0IHN1Ym9wdGltYWwgYmVjYXVzZSB3ZSBjYW4ndCBtYWtlIHVz
ZQo+IG9mIHRoZSBwaW5jdHJsIFBNIGhlbHBlcnMgYW5kIGl0J2QgcmVxdWlyZSBtb3JlIGJvaWxl
cnBsYXRlLgoKVGhlIGhlbHBlcnMgYXJlIGp1c3QgZm9yIHRoZSBkaXJ0LXNpbXBsZSBjYXNlcyBh
bnl3YXkuCkF0IG9uZSBwb2ludCBvbmUgZGV2ZWxvcGVyIHRob3VnaHQgdGhhdCB0aGUgImRlZmF1
bHQiIHNldCB1cApiZWZvcmUgcHJvYmUgd291bGQgYmUgdGhlIG9ubHkgdGhpbmcgYW55IHN5c3Rl
bSB3b3VsZCBldmVyCndhbnQgdG8gZG8gd2l0aCBwaW4gY29udHJvbC4gSXQgc2VlbXMgbGlrZSBu
b3QuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
