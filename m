Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F4E7C6C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 23:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53166EABB;
	Mon, 28 Oct 2019 22:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03A6EABB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 22:37:38 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id y5so9638474ilb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3tX+ks7PoiFwrJMh00/G0a0ftQIDY3RWS8pN1PA/BQ=;
 b=SNeYHp2GwH9ZYIaNmg3FLhPHjjLiEY1d8j8q+pvFiy7p+OeXIw3kfBFOPmJdV49NXG
 PFVV7W85Y4Z63sxZ2mwKpQwSFtIVDgFRTMYE0lsUaeYM3eQDKLOvFUlYhe37iDgVozJI
 p+lpG+C/Q/FBGdL/JfdaPoh1OVCV6tGFcoDnOrDRN2BYB1C9o2a7Wy5vm6KErA8QgUU8
 twJQeKTbUJPqQ/AtFpiPEjZN0hr6wP8UBt/U5VY641du32i4Uax+vtth0/IG218L0Ygn
 4i6Kkq3UZlmt307lMdGg1NbQ+Z00lPmjYkmv4EA5qDbHxLWPbsjcXiAVeEYAJp3BkveI
 VGLA==
X-Gm-Message-State: APjAAAWvwAjaLyCK9P0zlk8Ghr3xAVa75ziQGGa3oPsCPYR+P4AMETKI
 V9HBEdh/ix8LugSNdetxHwHwkMk8OUxXLg6X+UKx7hGD
X-Google-Smtp-Source: APXvYqwIZOpM2fC3dmpYbeGTVPOWxOzVO5pYPcw3MFmyjgnC+e3sCBKiQMsTwG3PiO7rE0i53YmxyINxh4//HXXlb2c=
X-Received: by 2002:a92:91d3:: with SMTP id e80mr24149380ill.77.1572302257323; 
 Mon, 28 Oct 2019 15:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-3-jagan@amarulasolutions.com>
 <20191027211737.GA30896@bogus>
In-Reply-To: <20191027211737.GA30896@bogus>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 29 Oct 2019 04:07:26 +0530
Message-ID: <CAMty3ZD8P1KGS+6AZOCbYyLpV=c7wowUdwoJXYvEMq211xbM1g@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] dt-bindings: sun6i-dsi: Add A64 DPHY compatible
 (w/ A31 fallback)
To: Rob Herring <robh@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z3tX+ks7PoiFwrJMh00/G0a0ftQIDY3RWS8pN1PA/BQ=;
 b=SKuPRKpveC6kpd0ROoNvdHULXUx99U0LlGRXDpWC4BPC2PLCNKrud8USuQ9T6iTjuu
 yY/RhELZCceNf3/45XZWM6GsNyRX8KOElh1Wg6prkLUzt27uk4jeSXYo/9oCWj7trUCm
 /4sm/8LdQPwR0vw2Ic0Nb7446p1joXFqG8Khw=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMjo0NyBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMjUgT2N0IDIwMTkgMjM6MjY6MjAgKzA1MzAsIEphZ2Fu
IFRla2kgd3JvdGU6Cj4gPiBUaGUgTUlQSSBEU0kgUEhZIGNvbnRyb2xsZXIgb24gQWxsd2lubmVy
IEE2NCBpcyBzaW1pbGFyCj4gPiBvbiB0aGUgb25lIG9uIEEzMS4KPiA+Cj4gPiBBZGQgQTY0IGNv
bXBhdGlibGUgYW5kIGFwcGVuZCBBMzEgY29tcGF0aWJsZSBhcyBmYWxsYmFjay4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+
IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9waHkvYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRwaHku
eWFtbCAgICAgICAgIHwgNiArKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+Cj4gUGxlYXNlIGFkZCBBY2tlZC1ieS9SZXZpZXdlZC1i
eSB0YWdzIHdoZW4gcG9zdGluZyBuZXcgdmVyc2lvbnMuIEhvd2V2ZXIsCj4gdGhlcmUncyBubyBu
ZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVh
bQo+IG1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tzIHJlY2VpdmVkIG9uIHRoZSB2ZXJz
aW9uIHRoZXkgYXBwbHkuCj4KPiBJZiBhIHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBs
ZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4KCkkgdXN1YWxseSBjb2xsZWN0IHRoZSB0
YWdzIHdoZW4gSSBzZW5kIG5leHQgdmVyc2lvbiB3L28gYW55IGNoYW5nZS4KYnV0IHRoaXMgZHQt
YmluZGluZyBwYXRjaCBoYXMgYSBmaXhlZCB2ZXJzaW9uIGNvbXBhcmVkIHRvIHByZXZpb3VzCnZl
cnNpb24uIEkgaGF2ZSB1cGRhdGVkIGNoYW5nZWxvZyBvbiBjb3ZlciBwYXRjaCBhbmQgbWF5IGJl
IHdpbGwgd3JpdGUKaXQgb24gcmVzcGVjdGl2ZSBwYXRjaCBpdHNlbGYuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
