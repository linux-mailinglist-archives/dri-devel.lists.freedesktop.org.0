Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA614AAF0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377CC6E22A;
	Tue, 18 Jun 2019 19:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B55A6E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:17:52 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EAD7215EA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:17:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a25so10162456lfg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 12:17:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXjNbFUF9nprQnBwV2cE+JFNjDoC1UXEiUPyLQwMUa4KQZ8JxM2
 HNVC3RpxuUxHXAQNryj+7fMl/JJBWZ3uSXmIxkU=
X-Google-Smtp-Source: APXvYqzPJjXzgwHiYzzytAPPYZZVCa+SGp9n9sKYmF0r/LKdiMln5BTA1yn7nIrb6RGQBDcCjSOtkT5IHe2Wvc8o4Es=
X-Received: by 2002:a19:e308:: with SMTP id a8mr1782969lfh.69.1560885469745;
 Tue, 18 Jun 2019 12:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
 <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
 <20190617163634.GA16941@kozik-lap>
 <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
In-Reply-To: <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 18 Jun 2019 21:17:38 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeODKo+nNTfmk9z1DaULrJMyNzuspBbFXXEkFqJ2hHYuw@mail.gmail.com>
Message-ID: <CAJKOXPeODKo+nNTfmk9z1DaULrJMyNzuspBbFXXEkFqJ2hHYuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Joseph Kogut <joseph.kogut@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560885471;
 bh=ZWSK86V7NI7b40wV2ulvMwUX6gfBoaYFIEZv+jaBbAQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N3cQP/TQIfiQCkE4SosugroCeeMv81f7VN+IJUTKMSRSZMMv3XrX1pMK+oXUXAN1N
 6CeFt24hrYcRNSlnvsHwxnAjf2tvrQtodqrDzONLzIGY/M3lXRra5QYKzpLDUiIwPA
 nXWGebBJV66EJxreKLS8y/V4S+qnQAnFUKrV3UuA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 kgene@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBKdW4gMjAxOSBhdCAxOTo0MiwgSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRA
Z21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4
MTE4MDAwMDAgMHg1MDAwPjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDIxOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgIDxHSUNfU1BJIDc0ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDExNyBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImpvYiIsICJt
bXUiLCAiZ3B1IjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtf
RzNEPjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgbWFsaS1zdXBwbHkgPSA8JmJ1Y2s0X3JlZz47
Cj4gPiA+ID4KPiA+ID4gPiBQbGVhc2UgY2hlY2sgaWYgYWx3YXlzLW9uIHByb3BlcnR5IGNvdWxk
IGJlIHJlbW92ZWQgZnJvbSBidWNrNC4KPiA+ID4KPiA+ID4gSSd2ZSBjaGVja2VkLCBhbmQgdGhp
cyBwcm9wZXJ0eSBjYW4gYmUgcmVtb3ZlZCBzYWZlbHkuCj4gPiA+Cj4gPiA+ID4gQWxzbywgd2hh
dCBhYm91dCBMRE8yNz8gSXQgc2hvdWxkIGJlIHVzZWQgYXMgd2VsbCAobWF5YmUgdGhyb3VnaAo+
ID4gPiA+IHZlbmRvci1zcGVjaWZpYyBwcm9wZXJ0aWVzIHdoaWNoIHdvdWxkIGp1c3RpZnkgdGhl
IG5lZWQgb2YgbmV3IHZlbmRvcgo+ID4gPiA+IGNvbXBhdGlibGUpLgo+ID4gPiA+Cj4gPiA+Cj4g
PiA+IEknbSB1bnN1cmUgaG93IExETzI3IGlzIHVzZWQsIGNhbiB5b3UgZWxhYm9yYXRlPwo+ID4K
PiA+IEl0IGlzIHN1cHBseWluZyB0aGUgVkREX0czRFMgKHdpdGggYSBub3RlICJTUkFNIHBvd2Vy
IikuIEkgZG8gbm90IGhhdmUKPiA+IGFueSBtb3JlIGRhdGEgb24gaXQuIEhvd2V2ZXIgSSBkaWQg
bm90IGNoZWNrIGluIHZlbmRvciBrZXJuZWwgZm9yIGl0Lgo+ID4KPgo+IEFmdGVyIGNoZWNraW5n
IChhIGZvcmsgb2YpIHRoZSB2ZW5kb3Igc291cmNlcyBbMV0sIGl0IHNlZW1zIHRvIG1lIHRoYXQK
PiB0aGlzIHJlZ3VsYXRvciBpcyB1c2VkIGZvciBtZW1vcnkgdm9sdGFnZSByZWxhdGVkIHRvIFNh
bXN1bmcncwo+IEFkYXB0aXZlIFN1cHBseSBWb2x0YWdlLCBmb3Igd2hpY2ggdGhlcmUgaXMgYSBw
ZW5kaW5nIHBhdGNoc2V0IFsyXS4KPgo+IFRoaXMgc2VlbXMgdG8gbWUgdG8gYmUgb3V0IG9mIHRo
ZSBzY29wZSBvZiB0aGlzIHBhdGNoc2V0LCBjb3VsZCB5b3UgY29uZmlybT8KPgo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20va3VtYWpheWEvYW5kcm9pZF9rZXJuZWxfc2Ftc3VuZ191bml2ZXJzYWw1
NDIyL2Jsb2IvYWQ0MTEwNGQ0M2U2NDcwZjhkNDg4MGQ2NWIyNTlkYzdiOTAzY2MwZC9hcmNoL2Fy
bS9tYWNoLWV4eW5vcy9hc3YtZXh5bm9zNTQyMi5jI0wxMDUyCj4gWzJdIGh0dHBzOi8vbHduLm5l
dC9BcnRpY2xlcy83ODQ5NTgvCgpIaSwKCkluZGVlZCB0aGUgdmVuZG9yIHNvdXJjZXMgc3VnZ2Vz
dCB0aGF0IHZvbHRhZ2Ugc2NhbGluZyBvZiB0aGlzCnJlZ3VsYXRvciBkZXBlbmRzIG9uIEFTViwg
bm90IG9uIGZyZXF1ZW5jeS4gSG93ZXZlciBzdGlsbCB0aGUKcmVndWxhdG9yIGlzIHRoZXJlIGlu
IHRoZSBoYXJkd2FyZSBzbyBpdCBzaG91bGQgYmUgaW4gdGhlIGJpbmRpbmdzIGFzCndlbGwgKHNw
ZWNpZmljIHRvIEV4eW5vcykuIEkgZ3Vlc3MgdGhlIGRyaXZlciBzaG91bGQgYWxzbyBlbmFibGUg
aXQKYnV0IHRoaXMgaXMgc2VwYXJhdGUgdG9waWMgKGFkZGluZyBwZXItcGxhdGZvcm0gcXVpcmtz
IHRvIFBhbmZyb3N0CmRyaXZlcikuIFB1dHRpbmcgaXQgdG8gYmluZGluZ3MgYWxzbyBmb2xsb3dz
IGFkdmljZSBmcm9tIGxpbmUgMTI6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1
LjItcmM1L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1i
aW5kaW5ncy50eHQjTDEyCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
