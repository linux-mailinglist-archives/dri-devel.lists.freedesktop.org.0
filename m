Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47AC55A31
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46C16E252;
	Tue, 25 Jun 2019 21:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571D6E252
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 21:47:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r9so20394ljg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 14:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z/7iY+DnLcZ0LezbOS35sy0HgPdj0Ewcwnm4oaB/nKo=;
 b=EKl3HTDTEnoHtLHMeMYPZ81WhFT+DUr3vOSaJV4XpfEgtnPRosRWiVx/9C8I7u+JM9
 JnSQowdhqB7imtP9cC5w4cpTY1RoZ+1x2t0lPxP2jh5zQBDu4bdT9pQ3WiEt6nv6jq1+
 wmH7E0wAzmynzbBoBz354a4jItynHc7wxNwf+r6UhenjMUX40JKApRgM2JxK0A3viAFk
 Dee+0F1wMKHeBFwCypbTDGHsherY2RrK5sEkEBs7wmmdhwI/Q/pJ/0vXkr0ETICg/+Bs
 fRN9DvcB+cG7FCIDqrDKG2u37GsKPQ42ZKzeq+lXU4eRf/eCwcOu+If1Dwb8nRFDW7fC
 B3dg==
X-Gm-Message-State: APjAAAUR0Lc+cbi6Zbg6XhhGd3A1+69naQLJQqPZ5rgvgl+Z0dcgByxn
 xWeyoJ8W1mjysQ74PyuynvFHDY/ltZKE8tsxv76tyg==
X-Google-Smtp-Source: APXvYqzMR10l93rViwuhFQNu55fJ5C0Pn/GPzn97xvFQHwI302OTE+IuljHXJI9gRVYElTANqxFQchnBMEROTxTabkA=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr463722ljm.180.1561499238305; 
 Tue, 25 Jun 2019 14:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190624215649.8939-1-robh@kernel.org>
 <20190624215649.8939-11-robh@kernel.org>
 <CACRpkdYKE=zLJhmTeTWYGRCQNt3K8+rNNqsp5UDa2d31GG6Y2g@mail.gmail.com>
 <CAL_Jsq+uCMKhUFgCCK3uUetL9OwokQPaq74GJHQS2VS=UjVH8w@mail.gmail.com>
 <CACRpkdYnSZibUyhe5D8W259fCJBm05rG0_EmX+uoi=uqbrqEYA@mail.gmail.com>
 <CAL_Jsq+45dKRMdRCjfKgEkvsk1MLyeXnY4fjZmh50WLweyJfCg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+45dKRMdRCjfKgEkvsk1MLyeXnY4fjZmh50WLweyJfCg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Jun 2019 23:47:06 +0200
Message-ID: <CACRpkdYEYcvxVai9kjLyz_Sudiz=JPD7oKU4sVL-bxOmWN0dkg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel
 to DT schema
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z/7iY+DnLcZ0LezbOS35sy0HgPdj0Ewcwnm4oaB/nKo=;
 b=W9CPOfods70wf/mb0mzHG5wJJRKM+sddo446tb0HsZyJTxvQCyJ/CtsdhdqbFMCGe0
 m2CZRzhDrc2+rhlxoVr1/AN07ukD7FfT8PZuoF0kNl1Tq2rmvT5fxpDD20YOv/tN2yra
 5ixXEccCb2M2cZtGDh+8vJqcltnX9vaCsn+T7VPMK4okAhweQMd03C9eoIuOk1m7KErs
 FDvxQLdPA3NpqdXOfJisP9QM1eKoUJcnuEBZTqj40V0d8ujg4aON8dMMvINLzOxs9atc
 gyF030AxBKO08/Om7d9GbN/WFuvZzWi+JPdqsdoiuPN7LukX4vv+/e2F+p0P5GQbgBOg
 G5DA==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNDoyNiBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAyOjI2IEFNIExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+ID4gQ2FuIEkgc2ltcGx5IGp1
c3QgbWVyZ2UgdGhlIHBhbmVsLWNvbW1vbiBwYXRjaCBhcyB3ZWxsIGFuZCB3ZQo+ID4gYXJlIGFs
bCBoYXBweT8KPgo+IEkgaGF2ZSBkcm0tbWlzYyBjb21taXQgcmlnaHRzIHRvbywgc28gSSdsbCBh
cHBseSB0aGUgd2hvbGUgbG90IHdoZW4gaXQncyByZWFkeS4KPgo+ID4gSSBjYW4gYWxzbyBwaWNr
IHVwIG1vcmUgcGFuZWwgYmluZGluZyBwYXRjaGVzLCBJTU8gdGhlIHlhbWwKPiA+IGNvbnZlcnNp
b25zIGFyZSBlc3BlY2lhbGx5IHVuY29udHJvdmVyc2lhbCBhbmQgc2hvdWxkIGhhdmUgbG93Cj4g
PiB0aHJlc2hvbGQgZm9yIG1lcmdpbmcuCj4KPiBZZXMsIGJ1dCB0aGUgdGhyZXNob2xkIGlzIGF0
IGxlYXN0ICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIHNob3VsZCBub3QKPiBicmVhay4gQnV0IGRv
bid0IHdvcnJ5LCB0aGVyZSBhcmUgMiBvdGhlciBicmVha2FnZXMgaW4gbGludXgtbmV4dAo+IGN1
cnJlbnRseS4KCk9LIGxldCdzIHRyeSB0byBsaXZlIHdpdGggaXQgZm9yIG5vdywgaWYgaXQgbWFr
ZXMgeW91IHRvbyBtdWNoIHRyb3VibGUKd2UgY2FuIGp1c3QgcmV2ZXJ0IGl0LCBhY2NpZGVudHMg
aGFwcGVuLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
