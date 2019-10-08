Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0FCF614
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3636E2BC;
	Tue,  8 Oct 2019 09:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929006E2BC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 09:33:50 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f5so16768902ljg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 02:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCnyIqALFCp0qPH0ujbWcPnKBORnlFWhZx6oeMdHtVs=;
 b=em3WaVAwrfHUZKtfeOtEOlpUJKL7xeEVor7NtnllnopCA9b7EbiKQC7WF58/d7Jiq3
 toUMTASe+L8SGTYguNlRe/aQ5HTpN/aG6E29Fi44wI6ntgZzulOqR3XikRS7/owoA2vC
 jPXlEIW1IZtpRqvPOBKTH4ifhFe3oE1cw9ebJyQIFEjA9uofYqLa8FptWmc98dqmejnz
 RnR8syT21hR6gi6uxgtH4GlcEvcsgbZjgDMSxrql9Vp3FvQvzkyHXkXayGCeSTUqTakY
 0NCi9ufHxRjylCVg+sFX8WIabD1HwrNLrAwWpSIg9yVIBOF+ZKOMQM6l3R/i42qM11eG
 c6jw==
X-Gm-Message-State: APjAAAWv9z4lkX40fcOy3IPlZID1jjVWdflwKvPlZ/GNAttp7cA7a16j
 TeR9jjzJEnxjfMAQec7WqnBEnlc9QYPLwmIwgnGKZA==
X-Google-Smtp-Source: APXvYqxS3hzj68Gb80FKbjcCHonOYpxULb7cs8Xl0MXzVg3XCZVh7yRV5Yrl38nceYyySL2y0rCvWckb9NTGG+hJOn8=
X-Received: by 2002:a2e:9702:: with SMTP id r2mr21853827lji.190.1570527228717; 
 Tue, 08 Oct 2019 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
 <871rvopgjj.fsf@keithp.com>
In-Reply-To: <871rvopgjj.fsf@keithp.com>
From: Heinrich Fink <heinrich.fink@daqri.com>
Date: Tue, 8 Oct 2019 11:33:37 +0200
Message-ID: <CAB6MLDYY_Xq6emaFuDGwQdaXEG-nkAKCuN4EBxuCeN9sPJbqYQ@mail.gmail.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daqri.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wCnyIqALFCp0qPH0ujbWcPnKBORnlFWhZx6oeMdHtVs=;
 b=XlU5NT92bgZ06BnhQL5oHNYMDCj5qawVHuordzJq6JNp9DjuoixP+fnrx0nxALSKU5
 nr2Z2udP15Y+osGOXqJANfvSofjK3pa2pauuoVEq0V0xqb/CIGtD9G8jalv5usgc2wuT
 +JWUS1NRnxaeU75q3dnsOzcH7cH4W7aJa8FpM=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA3IE9jdCAyMDE5IGF0IDIwOjE2LCBLZWl0aCBQYWNrYXJkIDxrZWl0aHBAa2VpdGhw
LmNvbT4gd3JvdGU6Cj4KPiBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29pc2hiYXIub3JnPiB3cml0
ZXM6Cj4KPiA+IEkgdGhpbmsgdGhlcmUgd291bGQgYmUgYSBsb2FkIG9mIHZhbHVlIGluIHN0YXJ0
aW5nIHdpdGggc2ltcGxlIGhlbHBlcnMKPiA+IHdoaWNoIGNhbiBiZSB1c2VkIGluZGVwZW5kZW50
bHkgb2YgYW55IGxhcmdlciBzY2hlbWUsIHRhY2tsaW5nIHRoYXQKPiA+IGxpc3QgYWJvdmUuCj4K
PiBZZWFoLCBhIGhlbHBlciBsaWJyYXJ5IHRoYXQgZGlkbid0IGVuZm9yY2UgYXQgdG9ubmUgb2Yg
cG9saWN5IGFuZCBqdXN0Cj4gbGV0IHRoZSB1c2VyIGdsdWUgdGhpbmdzIHRvZ2V0aGVyIG9uIHRo
ZWlyIG93biBpcyBwcm9iYWJseSBnb2luZyB0byBiZQo+IG1vcmUgZ2VuZXJhbGx5IHVzYWJsZSBi
eSBleGlzdGluZyBhbmQgbmV3IHN5c3RlbXMuCgpJIHJlYWxseSBsaWtlIHRoYXQgaWRlYS4gRm9y
IHByb2R1Y3QgZGV2ZWxvcG1lbnQgd2hlcmUgdGhlIGNvbXBvc2l0b3IKaXRzZWxmIG1pZ2h0IG5v
dCBiZSBvcGVuLXNvdXJjZSwgaXQgd291bGQgYWxzbyByZWFsbHkgaGVscCBjb21wYW5pZXMKYmVo
aW5kIHRoZXNlIHByb2R1Y3RzIHRvIGJldHRlciB3b3JrIHdpdGggdGhlIG9wZW4tc291cmNlIGNv
bW11bml0eSwKaS5lLiBiZWluZyBhYmxlIHRvIGNvbnRyaWJ1dGUgdG8gYSBzZXQgb2Ygc2hhcmVk
IGhlbHBlciBsaWJyYXJpZXMuCgotIEhlaW5yaWNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
