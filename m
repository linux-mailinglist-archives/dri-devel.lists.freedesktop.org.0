Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0B43393
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BE389471;
	Thu, 13 Jun 2019 07:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0A892F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:26:11 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id y6so12003397oix.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rz3C5X2ZficPM5fC/clkHKOTUhiHq0hb1gx6dWIr0bE=;
 b=iSnixMBjiuMLfi3BDxfKb7JZ6aPAcZCgyri8JddVMXIqyvL4CS0xCOmJDmUC2UsuBk
 EjVM/Yx7wBVoEMwh9H6tJTe2xfSGyr6qOY1sP+mPTELpT7dsj2H7hQwbKr7IZfFa2ntv
 SIFZG1tNoaA48Y179b7szQacexBDd8IrcpdgA2nL5vzYxKP2T4XgWAqkLD8v4TmeN8hq
 CVU9vnNgIWKCQ0104u+/2oRtmXfm8vJ/Jwhs3Ewvon2kjkwv/+5ib6Q21qBGcnjovmG3
 LaNK/5hhb/x5oNTWEBTB8PeSXaPWC4QJ7XmYVbyuvoxEisO4QHD7iizo+PdNm/wUgMiq
 aadg==
X-Gm-Message-State: APjAAAXcw5GZaT4MgfIt+i/YxOADU4qpyET93CRtH9Am9QDnQZOwmH37
 ng0/h33cPd+2scnzGZjfVk1acQEUKHRx44Sm1kQ=
X-Google-Smtp-Source: APXvYqz+iC621ewCSn0vEB+DvXR7qNgrLXazzIKhafJF+CoUbpRxI8PM+PacV3XapHNWPLeUbrprPJ4PDsL4lLflYug=
X-Received: by 2002:aca:cf0f:: with SMTP id f15mr18650324oig.169.1560353171013; 
 Wed, 12 Jun 2019 08:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190611110052.iw6qbw2yvypxus6t@shell.armlinux.org.uk>
 <E1haeXD-0001xs-Na@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1haeXD-0001xs-Na@rmk-PC.armlinux.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Wed, 12 Jun 2019 11:25:59 -0400
Message-ID: <CAGngYiV5FCU8RPfn2TFEJSWSWvD9VmpKWcPb_0TBpWc6nwho+g@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/i2c: tda998x: improve programming of audio
 divisor
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Rz3C5X2ZficPM5fC/clkHKOTUhiHq0hb1gx6dWIr0bE=;
 b=lrEQiwUujUWRF+RYN3g/WsrM7P9D8pJUVXlI8kpGX0kfZGme3e3KhTyAX3U3NxP0Su
 qZ9YZKPV+1tFTnSbhSyzReyWbLpmYjBFBsWA+OLWJdaD5POyGxuLCnKBrosnjGg484mg
 g1Glzb0kgxhqae2Q+TKlEXxottDEBXFjUQ2bERFaYEPeDvpHCkG9m4S/qS2NLSuNjb2o
 Z6WNe1/Nz5Eu+QUujdzLWaiJjNJIDB2NwvpAcWdWy6nkY7NAatbtReN5rqXI14O1hCC4
 RaXlGu45mK7r/uzznA2/qXms68ksL/54Uqnvx7YVRU+dBiNFU3AwgQ0See6Mxt4pt3uF
 RzIA==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgNzowMiBBTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IEltcHJvdmUgdGhlIHNlbGVjdGlvbiBvZiB0aGUg
YXVkaW8gY2xvY2sgZGl2aXNvciBzbyB0aGF0IG1vcmUgbW9kZXMKPiBhbmQgc2FtcGxlIHJhdGVz
IHdvcmsuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrPgo+IC0tLQoKK3N0YXRpYyB1OCB0ZGE5OTh4X2dldF9hZGl2KHN0cnVjdCB0ZGE5
OTh4X3ByaXYgKnByaXYsIHVuc2lnbmVkIGludCBmcykKK3sKKyAgICAgICB1bnNpZ25lZCBsb25n
IG1pbl9hdWRpb19jbGsgPSBmcyAqIDEyODsKKyAgICAgICB1bnNpZ25lZCBsb25nIHNlcl9jbGsg
PSBwcml2LT50bWRzX2Nsb2NrICogMTAwMDsKKyAgICAgICB1OCBhZGl2OworCisgICAgICAgZm9y
IChhZGl2ID0gQVVESU9fRElWX1NFUkNMS18zMjsgYWRpdiAhPSBBVURJT19ESVZfU0VSQ0xLXzE7
IGFkaXYtLSkKKyAgICAgICAgICAgICAgIGlmIChzZXJfY2xrID4gbWluX2F1ZGlvX2NsayA8PCBh
ZGl2KQorICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKKworICAgICAgIGRldl9kYmcoJnBy
aXYtPmhkbWktPmRldiwKKyAgICAgICAgICAgICAgICJzZXJfY2xrPSVsdUh6IGZzPSV1SHogbWlu
X2FjbGs9JWx1SHogYWRpdj0lZFxuIiwKKyAgICAgICAgICAgICAgIHNlcl9jbGssIGZzLCBtaW5f
YXVkaW9fY2xrLCBhZGl2KTsKKworICAgICAgIHJldHVybiBhZGl2OwoKRG9lc24ndCB0aGlzIGZ1
bmN0aW9uIG5lZWQgYW4gZXJyb3IgcmV0dXJuIGluIGNhc2UgbWluX2F1ZGlvX2NsayA+IHNlcl9j
bGsgPwpPciBpcyB0aGF0IGEgc2l0dWF0aW9uIHRoYXQgY2FuIG5ldmVyIGFyaXNlPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
