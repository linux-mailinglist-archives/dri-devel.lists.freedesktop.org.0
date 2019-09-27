Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F9C0537
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3526E0D9;
	Fri, 27 Sep 2019 12:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39A6E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:34:02 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h144so15817681iof.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 05:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7d51AEqyE848wkPOLeJprFG9jyWEBZYHtKze/WYS4w=;
 b=RSB+jzDorD5Kjwh/PHyisl9dpOQX3mQn7X659IgYQgDYGruSJNdcYkhJQqIWCj8IxU
 bxUZzGkuuubmUzlOHPR6ASlug/NpWFFcmPrGvGnQ3jlRcvyVKww2vcZoaxGLOT+FGSF2
 rAeM4zXrMqv0jOekWjvNWX5ZYtndliXxPGBwqmch2RCuAQGvqgUXzRMu4bVBx9DgxOuC
 qsLx9cAwgml1WyZh7/V23BGrpHzKCD7gtupthD/7w6Uf0u04eshZadCWeoFBbNoA0Gbd
 0ZXRLwgxvGCTeUUFKnaevGD7DtZyQT3AYTJwlMgpVl6FTGmlR+yA0FrNS9f4fYpix9p/
 Nd7g==
X-Gm-Message-State: APjAAAWW6rbIKOqx4ZNVtPhs5QTgCb3Bh3mMZa2u8jg66pboRqhTDgjs
 8PWIGziM94kKHn1IIcaC7czooYsgb2mNPh1Y+wo=
X-Google-Smtp-Source: APXvYqyUHMQeWPmJ5lzBV5BB3t5fjqgkf5iuXKrGK12pwMzKhwgqK7OWh4iVg4iwmB77u1+QNcYJGNuPXVDMXoOrZuo=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr7682327iof.58.1569587642060; 
 Fri, 27 Sep 2019 05:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
In-Reply-To: <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2019 07:33:50 -0500
Message-ID: <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=k7d51AEqyE848wkPOLeJprFG9jyWEBZYHtKze/WYS4w=;
 b=OkcngvAZiKPfuIboTpBONfv7BLGF5R/Iq4MnzDRe5U13ORHYdP24mC9azh4Zc/Cd5Q
 zjc/eFi7DxQTt2gfFVEGlz4Zxs03GBIbzFDE/3rK5RvUDj+A1zGCnRrN8YdAGLoBwyRD
 1SvsdCK0DQMAlsxjPDLcx8NpJ9PfZHFCDWlVx7XQv3ibTNAxJPUr7lXN4J+IqpwsMP11
 p5RjNdSw0K+Uj7oL3izhL7pOv+40rEefZwUOMJ8fmBPf5BGQi2sSODcTOMGyjm7Sz/eq
 5EylEn4Z6pYPsCxYY6hFmT/ZqrXxPPjxDhE/2yuR1xYG5IQEnERXL9KfdKmKsrdBRBc9
 YitA==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMjo1NSBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPiB3cm90ZToKPgo+IChkcm9wcGluZyBmb2xrcyB3aG8ncmUgcHJvYmFibHkg
bm90IGludGVyZXN0ZWQuLi4pCj4KPiBPbiAyNi8wOS8yMDE5IDE3OjEyLCBBZGFtIEZvcmQgd3Jv
dGU6Cj4gPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxOjU1IEFNIFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjUvMDkvMjAxOSAyMzo1
MSwgQWRhbSBGb3JkIHdyb3RlOgo+ID4+Cj4gPj4+PiBIYXMgYW55b25lIGRlYnVnZ2VkIHdoeSB0
aGUgaGFuZyBpcyBoYXBwZW5pbmc/Cj4gPj4+IEkgc3RhcnRlZCB0byBkZWJ1ZyB0aGlzLCBidXQg
SSBnb3QgZGlzdHJhY3RlZCB3aGVuIEkgbm90aWNlZCB0aGUgTENECj4gPj4+IGRpZCd0IHdvcmsg
YXQgYWxsIG9uIG1vZGVybiBrZXJuZWxzLiAgSSBoYXZlIHRoYXQgZml4ZWQgbm93LCBzbyBJIGNh
bgo+ID4+PiBnbyBiYWNrIHRvIGludmVzdGlnYXRpbmcgdGhpcy4KPgo+IEkgZG9udCcgaGF2ZSB0
aGUgc2FtZSBib2FyZCwgYnV0IEkgd2FzIHRlc3Rpbmcgd2l0aCBvbWFwMyBiZWFnbGUgeG0uIEkK
PiBjYW4gcmVwcm9kdWNlIHJhdGhlciBzaW1pbGFyIGlzc3VlLCBhbHRob3VnaCBJIGRvbid0IGdl
dCBhIGhhbmcgYnV0Cj4gaW5zdGVhZCBzeW5jIGxvc3QgYW5kIHVuZGVyZmxvdyBmbG9vZCAod2hp
Y2ggbWFrZXMgdGhlIGRldmljZSB1bnVzYWJsZSkuCj4KPiBJdCBsb29rcyBsaWtlIGEgYnVnIGlu
IG9tYXAgY2xvY2sgaGFuZGxpbmcuCj4KPiBEU1MgdXNlcyBkc3MxX2Fsd29uX2Zja18zNDMwZXMy
IGFzIGZjbGsuIGRzczFfYWx3b25fZmNrXzM0MzBlczIgY29tZXMKPiBmcm9tIGRwbGw0X2NrLCBh
bmQgdGhlcmUncyBhIGRpdmlkZXIgYWZ0ZXIgdGhlIFBMTCwgZHBsbDRfbTRfY2suCj4KPiBXaGVu
IHRoZSBEU1MgZHJpdmVyIHNldHMgZHNzMV9hbHdvbl9mY2tfMzQzMGVzMiByYXRlIHRvIDI3MDAw
MDAwIG9yCj4gMjc4NzA5NjcsIHdoaWNoIGNhbiBiZSBjcmVhdGVkIHdpdGggbTQgZGl2aWRlcnMg
MzIgYW5kIDMxLCBpdCBsb29rcyBsaWtlCj4gdGhlIGRpdmlkZXIgZ29lcyB0byBieXBhc3MsIG9y
IHRvIGEgdmVyeSBzbWFsbCB2YWx1ZS4gRFNTIGdldHMgYSB2ZXJ5Cj4gaGlnaCBjbG9jayByYXRl
IGFuZCBicmVha3MgZG93bi4KCklzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGhlbHAgdHJv
dWJsZXNob290IHRoaXM/ICBJIGNvdWxkIGluc2VydAphIGhhY2sgdGhhdCBjaGVja3MgaWYgd2Un
cmUgb21hcDMgYW5kIGlmIHNvIG1ha2UgdGhlIGRpdmlkZXIgZXF1YWwgdG8KNCwgYnV0IHRoYXQg
c2VlbXMgbGlrZSBqdXN0IGEgaGFjay4KSSBjYW4gcnVuIG1vcmUgdGVzdHMgb3IgaW5zZXJ0IGNv
ZGUgc29tZXdoZXJlIGlmIHlvdSB3YW50LgoKYWRhbQo+Cj4gICBUb21pCj4KPiAtLQo+IFRleGFz
IEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtp
Lgo+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
