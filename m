Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7EF18C3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 15:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F56ED8D;
	Wed,  6 Nov 2019 14:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0C96ED8D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:36:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECED321A49
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 14:36:52 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id f4so18232990lfk.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 06:36:52 -0800 (PST)
X-Gm-Message-State: APjAAAUg9442YyR8rkOQGD+jUAqvpahFcIPvC7uY7HmI83o3lPI4YzW9
 ZksYGxm89OydmCLBP5SbFCVlvDLvjBf4eD5+AEA=
X-Google-Smtp-Source: APXvYqy81A/2+lWcpeO2gkzgbqW8TQsAHsbUEDFF+X+/DsCRQrIr3qeMIW85fIoFrSsx9XX2WotPoKKCooOri+vcmco=
X-Received: by 2002:a19:22d3:: with SMTP id i202mr24254981lfi.69.1573051011148; 
 Wed, 06 Nov 2019 06:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-2-afaerber@suse.de>
 <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
In-Reply-To: <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 6 Nov 2019 15:36:40 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdiE=L-8ymra=GC22=5QqOpJWW+hWqTUvNmwi5+caOPrA@mail.gmail.com>
Message-ID: <CAJKOXPdiE=L-8ymra=GC22=5QqOpJWW+hWqTUvNmwi5+caOPrA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion to
 YAML
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573051013;
 bh=vlXZpNZoJiZw0moABeBNaD+/PavQRurfOu7gykExpKY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rXLXKG77ox5Exb7OgGuWzYQD0J5wZe5xWO7ETkwRJ2xIvJJyINp+/DaL6OApB5q1n
 UMU5V6hzFG5xbIJRAJtA3J/MdMyejfWPumsFOcwymxnETkNJTAFRBpX9F+rd27rBPh
 CSMfhdfiyd4LIEHgQd5MAZX3TP+eGwFablygUjbs=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Guillaume Gardet <guillaume.gardet@arm.com>,
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA2IE5vdiAyMDE5IGF0IDE1OjI1LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIFN1biwgTm92IDMsIDIwMTkgYXQgNzo0MCBQTSBBbmRyZWFzIEbDpHJi
ZXIgPGFmYWVyYmVyQHN1c2UuZGU+IHdyb3RlOgo+ID4KPiA+IEluc3RlYWQgb2YgZ3JvdXBpbmcg
YWxwaGFiZXRpY2FsbHkgYnkgdGhpcmQtcGFydHkgdmVuZG9yLCBsZWFkaW5nIHRvCj4gPiBvbmUt
ZWxlbWVudCBlbnVtcywgc29ydCBieSBNYWxpIG1vZGVsIG51bWJlciwgYXMgZG9uZSBmb3IgVXRn
YXJkLgo+ID4KPiA+IFRoaXMgYWxyZWFkeSBhbGxvd3MgdXMgdG8gZGUtZHVwbGljYXRlIHR3byAi
YXJtLG1hbGktdDc2MCIgc2VjdGlvbnMgYW5kCj4gPiB3aWxsIG1ha2UgaXQgZWFzaWVyIHRvIGFk
ZCBuZXcgdmVuZG9yIGNvbXBhdGlibGVzLgo+Cj4gVGhhdCB3YXMgdGhlIGludGVudC4gTm90IHN1
cmUgaG93IEkgbWVzc2VkIHRoYXQgdXAuLi4KPgo+IFRoaXMgcGF0Y2ggaXMgcHJvYmxlbWF0aWMg
YmVjYXVzZSB0aGVyZSdzIGNoYW5nZXMgaW4gYXJtLXNvYyBqdW5vL2R0Cj4gYnJhbmNoIGFuZCB0
aGVyZSdzIG5vdyBhIHBhdGNoIGZvciBleHlub3M1NDIwICh0NjI4KS4gSSdkIHByb3Bvc2UgSQo+
IGFwcGx5IHRoaXMgc3VjaCB0aGF0IHdlIGRvbid0IGdldCBhIG1lcmdlIGNvbmZsaWN0IHdpdGgg
anVuby9kdCBhbmQgd2UKPiBmaW5pc2ggcmVzb3J0aW5nIGFmdGVyIHJjMSAob3Igd2hlbiBib3Ro
IGJyYW5jaGVzIGFyZSBpbiBMaW51cycgdHJlZSkuCgpBZnRlciByZXN1Ym1pdCwgeW91IGNvdWxk
IHRha2UgdGhlIGV4eW5vczU0MjAgYmluZGluZ3Mgb25lIChhbmQgSSdsbAp0YWtlIHRoZSBEVFMp
LiBIb3dldmVyIHRoZSBzdWJtaXR0ZXIgc2hvdWxkIGJhc2UgdGhlbiBvbiBsYXRlc3QgbmV4dCwK
YXNzdW1pbmcgeW91J2xsIGFwcGx5IHRoaXMgb25lLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
