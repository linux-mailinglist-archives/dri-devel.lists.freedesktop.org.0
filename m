Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3DC23FA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E266E46C;
	Mon, 30 Sep 2019 15:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771556E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:10:23 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id v2so39114891iob.10
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 08:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDc8+7cL7Y/4C0a6+07Pf5UoiAcCuQN9j9naZA92m/0=;
 b=AydFe+qYP7GDEavHOvCW0QcLpHtgiLsR3PlWYw20xGIxHjsAKIs8T5na9aVNCluf6m
 aigNPU47/8cxny/XC0hYdLAojXwJBGNZzJNdSKU9uZoJaPU7jaNuJw4YLswaR6vq8pgO
 Xa03XX06bzy5hB8+VaJJLRLW5p7XjEp+2c0cnM5p3SBjns6N7FDR526/wPtDgia5DwVU
 LX0lLMRj90miTVdbCGwColwWioD18pGvCKfHvPDrqaAjdmVYDOnGTA9ykEdUb0fY0xgk
 86YInfFiVfsFXPz1yuFT8fnRN8vJKLJTTVVnV9dYXg8AssPDiOb8NQHcy+tq3NHcAran
 7krA==
X-Gm-Message-State: APjAAAU7NtWuI8GqoERROXb80kO2B7UoObF17LmmZobj0SHjwhjQ9hO8
 ZgY6hdXwWZp0/eqjjQPEFpoMi79wp2CNuIRn2wpBtr5s
X-Google-Smtp-Source: APXvYqyzDMlPXrOMXU8uR89U0O8jpXzWwYfcO5kKUr3rMEw1nkiaNwzvwL+uFQHt7SWZhkPxpu0e2/wrwcUd0IP2oeU=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr823617iof.58.1569856222518;
 Mon, 30 Sep 2019 08:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
 <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
In-Reply-To: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 30 Sep 2019 10:10:11 -0500
Message-ID: <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pDc8+7cL7Y/4C0a6+07Pf5UoiAcCuQN9j9naZA92m/0=;
 b=XAxgqcVCJ0KTsEs61oTy/OJohBiI9uvP3rdzYsBtljp2uXLIhWrCfKkri/Tu5Wl+Wr
 BaRtLcYL7krs2ngV78Nkhx6J8pM/8T1eofwTwlgYcg6rheQnSzc9IASx3Fm4mkFvIUG2
 Lo2Gn/siHlqy+GFLeYsW3+m1RYN+O2WSyflAEtRyXDs+9xQuCvZUUOcjRsONfB81CuZT
 FnY1zzPD7jtNJWcLhLUps8URe4kC+hK4GvFY/C8F1d+yLgMutc0q6Nxd61Obgu1tGIpT
 psffbZDtzaaf7lUDzIdZeoevfZxGTm6B3IBZW2QrS1x9P6/W10IsX6W4vbDcXN/Zszbt
 6wCQ==
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgOToyNyBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IE9uIDMwLzA5LzIwMTkgMTc6MjAsIFRvbWkgVmFsa2Vp
bmVuIHdyb3RlOgo+Cj4gPiBMZXQncyBzZWUgd2hhdCBUZXJvIHNheXMsIGJ1dCB5ZWFoLCBzb21l
dGhpbmcgaXMgb2RkIGhlcmUuIEkgZXhwZWN0ZWQKPiA+IHRoZSBtYXggZGl2aWRlciB0byBiZSAx
NiB3aXRoIFRlcm8ncyBwYXRjaCwgYnV0IEkgZG9uJ3Qgc2VlIGl0IGhhdmluZwo+ID4gdGhhdCBl
ZmZlY3QuIEkgY2FuIGdldCB0aGUgZGl2IHRvIDMxLgo+ID4KPiA+IFlvdSBjYW4gc2VlIHRoaXMg
ZnJvbSB0aGUgY2xvY2sgcmVnaXN0ZXIgMHg0ODAwNGU0MCAoQ01fQ0xLU0VMX0RTUykuIFRoZQo+
ID4gbG93ZXN0IGJpdHMgYXJlIHRoZSBkaXZpZGVyLCA1IHRvIDAuIFRoZSBUUk0gc2F5cyBtYXgg
ZGl2IGlzIDMyLgo+ID4KPiA+IFRlcm8gc2FpZCBmb3IgaGltIHRoZSBkaXZpZGVycyA+IDE2IGRp
ZG4ndCAic3RpY2siIHRvIHRoZSByZWdpc3Rlci4gSSdtCj4gPiBub3cgd29uZGVyaW5nIGlmIGhl
IGhhcyBhbiBvbGQgYmVhZ2xlYm9hcmQgd2l0aCBPTUFQMzR4eCwgd2hpY2ggaGFzIG1heAo+ID4g
ZGl2IDE2Lgo+Cj4gU28gdGVzdGluZyBhIGJpdCBtb3JlIGhlcmUsIEkgY2FuIHNlZSB0aGUgRFNT
IHdvcmtpbmcgZmluZSBhbmQgZnBzIGFzCj4gZXhwZWN0ZWQgd2hlbiBJIHdyaXRlIHZhbHVlcyBk
aXJlY3RseSB0byBDTV9DTEtTRUxfRFNTOjU6MCwgd2l0aAo+IGRpdmlkZXJzIHVwIHRvIDMxLiBX
aXRoIDMyLCBEU1MgYnJlYWtzLiBUaGUgVFJNIChBTS9ETTM3eCkgc2F5cyB2YWx1ZSAzMgo+IGlz
IHZhbGlkLgoKSSB3b25kZXIgaWYgaXQncyBzb21laG93IGJlaW5nIG1hc2tlZCB3aXRoIGJpdHMg
NDowIGluc3RlYWQgb2YgNTowCndoaWNoIGNvdWxkIHBvdGVudGlhbGx5IG1ha2UgdGhlIGRpdmlk
ZXIgMCBhbmQgdGhhdCB2YWx1ZSBkb2Vzbid0CmFwcGVhciB0byBiZSB2YWxpZC4KCmFkYW0KCj4K
PiAgIFRvbWkKPgo+IC0tCj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFu
a2F0dSAyMiwgMDAxODAgSGVsc2lua2kuCj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEt
NC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
