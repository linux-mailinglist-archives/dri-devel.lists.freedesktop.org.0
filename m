Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0310CFEA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 00:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8F6E055;
	Thu, 28 Nov 2019 23:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E46E055
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 23:13:29 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r14so4896119lfm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DsTwhFwKQ/dPIkHx6bZaD64lIEnLpBlz/is03aIxIEk=;
 b=MRNutH9TtRL7rjMWWodfNL4JJOJdoKEn7cRpgRU4HbvJ6bzegYS2gWl1sM5R1tQhn0
 LNkJHy8QxwuDUNIBkaZZX63xgRcRXBOpdIXfDI0cdJWQSYM7PxyHn+nYO6RdjyYeIq3A
 rzArhxxkxFQcSVR1MTf/LVXiNs1uR2e1EvRsmjDWUviIETj0rejDFakSmf0FTeSCIpiB
 2pzLhZDMRGJVrlGDmARfASYfYe3hZCU4IIgzFuy62s/ovyxfeYH1cDzaQRESana8mZXC
 sIkDxP76l81VM938ELuIwLcub48Q+dYLvydSTtJh6nUnkOd7oh3zwU91KL7hlN69CnXq
 ATrQ==
X-Gm-Message-State: APjAAAUroxifr2SrhHEmxk+oT0cOd0LtianRJM8pn/ZAzVBVFsiccUcz
 F+KMVSlzo8/BkKeGkpRXBpDJR+l/GiUzwcOh7h5PBONS
X-Google-Smtp-Source: APXvYqynSnsQwmBCmzDKq2Z+bZR37xEFqy+9Z2KCtDRSXoKnzhC/sTDTWcQr/QC83NqPA9AKm4bgRnYplHceWA8Nt90=
X-Received: by 2002:ac2:41d8:: with SMTP id d24mr18394485lfi.98.1574982807332; 
 Thu, 28 Nov 2019 15:13:27 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9ty6MLNc4qYKOAO3-eFDpQtm9hGPg9hPQOm4iRg_8MkmNw@mail.gmail.com>
 <CAHk-=whdhd69G1AiYTQKSB-RApOVbmzmAzO=+oW+yHO-NXLhkQ@mail.gmail.com>
 <CAPM=9tz3pFTOO45pGcZv+nGf29He-p03fXHbG4sNoCYxZzXkRQ@mail.gmail.com>
 <20191129085502.3e9ffed4@canb.auug.org.au>
In-Reply-To: <20191129085502.3e9ffed4@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 29 Nov 2019 09:13:16 +1000
Message-ID: <CAPM=9txFZ+sCXXV3WA0CtFjsmLrY7qziJqrGfr1h+5B-fsqWRA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.5-rc1
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DsTwhFwKQ/dPIkHx6bZaD64lIEnLpBlz/is03aIxIEk=;
 b=GfaaUJ/y2wIh9Btfh7s7HvF4gJTZNFXxrYsCSzKDghMVl1qgaNy9S6pPuXbb0i0tSI
 xNr72FY/qlASeGXTClNVcHWcU8X1YIsKClalUhtYD4HKbK1X1nAYiQLcyzzZzuCEVih3
 V/kUrhfFsFXPxqG0m6O+dqy8/gNuvB6UYYdl+1q/Ka6cXzU4N1q3iF7XgM01Vw44kg28
 fzY425WA5Vnv6J0vTRozNSmZbgVqj2wzKhwWQbxyVx+NCObNFyTUPetc1nienr5aHbw8
 zZbWrB8xU8PKTZku7yQ0W7TyfLaTJgdXv4r9srzJaXPpkSTuYhRn8PcbM6FSzQk2FVUe
 ef4w==
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

T24gRnJpLCAyOSBOb3YgMjAxOSBhdCAwNzo1NSwgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+IHdyb3RlOgo+Cj4gSGkgRGF2ZSwKPgo+IE9uIFRodSwgMjggTm92IDIwMTkg
MTI6Mzc6MDYgKzEwMDAgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiA+IEFuZCBhcHBhcmVudGx5IG5vYm9keSBib3RoZXJlZCB0byB0ZWxsIG1lIGFib3V0IHRo
ZSBzZW1hbnRpYyBjb25mbGljdAo+ID4gPiB3aXRoIHRoZSBtZWRpYSB0cmVlIGR1ZSB0byB0aGUg
Y2hhbmdlZCBjYWxsaW5nIGNvbnZlbnRpb24gb2YKPiA+ID4gY2VjX25vdGlmaWVyX2NlY19hZGFw
X3VucmVnaXN0ZXIoKS4gRGlkbid0IHRoYXQgc2hvdyB1cCBpbiBsaW51eC1uZXh0Pwo+ID4KPiA+
IEkgY2FuIHNlZSBubyBtZW50aW9uIG9mIGl0LCBJJ3ZlIGdvdAo+ID4KPiA+IEhhbnMgc2F5aW5n
Cj4gPgo+ID4gIlRoaXMgd2lsbCBvbmx5IGJlIGEgcHJvYmxlbSBpZiBhIG5ldyBDRUMgYWRhcHRl
ciBkcml2ZXIgaXMgYWRkZWQgdG8gdGhlIG1lZGlhCj4gPiBzdWJzeXN0ZW0gZm9yIHY1LjUsIGJ1
dCBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgcGxhbnMgZm9yIHRoYXQuIiB3aGVuIEkKPiA+IGxhbmRl
ZCB0aGF0Cj4gPiBpbiBteSB0cmVlLCBidXQgSSBhc3N1bWUgdGhlIGFvLWNlYyBjaGFuZ2UgaW4g
dGhlIG1lZGlhIHRyZWUgY29sbGlkZWQgd2l0aCBpdC4KPiA+Cj4gPiBCdXQgSSBoYWRuJ3Qgc2Vl
biBhbnkgbWVudGlvbiBvZiBpdCBmcm9tIC1uZXh0IGJlZm9yZSB5b3UgbWVudGlvbmVkIGl0IG5v
dy4KPgo+IFNlZSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkxMDE0MTExMjI1LjY2
YjM2MDM1QGNhbmIuYXV1Zy5vcmcuYXUvCgpJbmRlZWQsIHRoZSBtaXNjIHRlYW0gZGlkbid0IHJl
bWVudGlvbiB0aGF0IHRvIG1lLCB3aGVuIEkgcHVsbGVkIHRoZWlyCnRyZWUsIHBlcmhhcHMgSSBz
aG91bGQgbWFrZSB0aGVtIGRvIHNvLCBub3Qgc3VyZSB3aHkgbXkgc2VhcmNoCnllc3RlcmRheSBm
YWlsZWQgdG8gZmluZCB0aGlzIGluIG15IGluYm94LgoKVGhhbmtzLApEYXZlLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
