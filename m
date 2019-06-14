Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417494592E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC04895E2;
	Fri, 14 Jun 2019 09:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374FC895E2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:48:53 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h6so4462719ioh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKw06+cNAvnizMFXa6QBpBJf1TOMKPxvPHOwkRTL9lg=;
 b=PDHfBR9Ia9DxDUOrSSk2VVMJcpkBpfDLEEFRSYLViq5ya9mvyThlIuSgyYXJOe4Cb4
 QJL6t97U8ljJonoVBLFehVvadcfhvraeOAYd3wxS82zQhybJuFbeZ5I0BmpW3Wws1gls
 10BvD6oagAA3ZKU5MlV1mUh44L8ZojI9o+3aJRXIdP9QLrEo9xY+4sBx6KFpvuwybaZs
 p3HOaMtg5orjs+8zWHLDq/covzEkXQMH/QjV3DjA+404YsCxwNtZIt1GS7bFfwKYgg+K
 xHmJxXcfQIL0yOvFR29dEKtpeV/eQa900KeN7PHla8s1K+e6cw1pLW1UF/64OysjlESv
 RacA==
X-Gm-Message-State: APjAAAW08Y3dnNSvK4N9hH4WlW9KACgZeCBHKfWBvqdU1t8f/hmjT/y9
 lu7m68YenHNclHi2bXEN35FpCcYR5enbNCqgBdSWMg==
X-Google-Smtp-Source: APXvYqxH56vd8m0NL3s5K4g0SpMN6wIAo9CZa8erGisPkMwTglnDa7HWnaXEv9xSFHKy++9LqWSZcGfIftWfjL7A74M=
X-Received: by 2002:a05:6602:2253:: with SMTP id
 o19mr14187412ioo.297.1560505732488; 
 Fri, 14 Jun 2019 02:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-6-jagan@amarulasolutions.com>
 <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
In-Reply-To: <CAGb2v654p=HZuXCTJkrbWbFP_kEkpRWHwj-7_Ck_=XbyMFmvFw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Jun 2019 15:18:40 +0530
Message-ID: <CAMty3ZD0atS2uWJmPB-n1wmy324JEpwt42=_wpKeF-8uxM-GbQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BKw06+cNAvnizMFXa6QBpBJf1TOMKPxvPHOwkRTL9lg=;
 b=m2bzfO0vhzMnm6b4HKMSrNLfXIxCD14mTpXJsFvetKma+4zeeuN9k1Fn0wvtLtAfdt
 A94XWPxYmdr+edE0d/FZvljp+KD8syJfo3i46TyfWe3guYAgjUIl7E4G1PtvUQ2GIPGe
 Hni79nNR+YpRjp+XNO8oO4sjIeI8Nqpx+7eyo=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgOToxNiBBTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMjo1NCBBTSBKYWdhbiBUZWtp
IDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWNjb3JkaW5nIHRv
IEZpZyA3LTIuIFRDT04gVG9wIEJsb2NrIERpYWdyYW0gaW4gVXNlciBtYW51YWwuCj4gPgo+ID4g
VENPTiBUT1AgY2FuIGhhdmUgYW4gaGllcmFyY2h5IGZvciBUQ09OX0xDRDAsIExDRDEgbGlrZQo+
ID4gVENPTl9UVjAsIFRWMSBzbywgdGhlIHRjb24gdG9wIHdvdWxkIGhhbmRsZSB0aGUgY2xvY2tz
IG9mCj4gPiBUQ09OX0xDRDAsIExDRDEgc2ltaWxhciBsaWtlIFRWMCwgVFYxLgo+Cj4gVGhhdCBp
cyBub3QgZ3VhcmFudGVlZC4gVGhlIGRpYWdyYW0gc2hvd3MgdGhlIHBpeGVsIGRhdGEgcGF0aCwK
PiBub3QgbmVjZXNzYXJpbHkgdGhlIGNsb2Nrcy4gSW4gYWRkaXRpb24sIHRoZSBMQ0QgVENPTnMg
aGF2ZSBhbgo+IGludGVybmFsIGNsb2NrIGdhdGUgZm9yIHRoZSBkb3QtY2xvY2sgb3V0cHV0LCB3
aGljaCB0aGUgVFYgdmFyaWFudHMKPiBkbyBub3QuIFRoYXQgbWlnaHQgZXhwbGFpbiB0aGUgbmVl
ZCBmb3IgdGhlIGdhdGVzIGluIFRDT04gVE9QLgoKQ29ycmVjdCwgdGhlIGFjdHVhbCBpZGVhIGFi
b3V0IGV4cGxhbmF0aW9uIGhlcmUgaXMgdG8gbWVudGlvbiB0aGUKY2xvY2tzIGRlZmluaXRpb24g
aW4gdGNvbiB0b3AgbGV2ZWwgYW5kIGludGVybmFsIHR2IGFuZCBsY2QgY2FuIGhhbmRsZQphcyB5
b3UgZXhwbGFpbmVkLgoKPgo+ID4gQnV0LCB0aGUgY3VycmVudCB0Y29uX3RvcCBub2RlIGlzIHVz
aW5nIGRzaSBjbG9jayBuYW1lIHdpdGgKPiA+IENMS19EU0lfRFBIWSB3aGljaCBpcyBpZGVhbGx5
IGhhbmRsZSB2aWEgZHBoeSB3aGljaCBpbmRlZWQKPiA+IGEgc2VwYXJhdGUgaW50ZXJmYWNlIGJs
b2NrLgo+ID4KPiA+IFNvLCB1c2UgdGNvbi1sY2QwIGluc3RlYWQgb2YgZHNpIHdoaWNoIHdvdWxk
IHJlZmVyIHRoZQo+ID4gQ0xLX1RDT05fTENEMCBzaW1pbGFyIGxpa2UgQ0xLX1RDT05fVFYwIHdp
dGggdGNvbi10djAuCj4gPgo+ID4gVGhpcyB3YXkgd2UgY2FuIHJlZmVyIENMS19UQ09OX0xDRDAg
ZnJvbSB0Y29uX3RvcCBjbG9jayBpbgo+ID4gdGNvbl9sY2QwIG5vZGUgYW5kIHRoZSBhY3R1YWwg
RFNJX0RQSFkgY2xvY2sgbm9kZSB3b3VsZAo+ID4gcmVmZXIgaW4gZHBoeSBub2RlLgo+Cj4gVGhh
dCBkb2Vzbid0IG1ha2Ugc2Vuc2UuIFdoYXQgYWJvdXQgVENPTl9MQ0QxPwo+Cj4gVGhlIENDVSBh
bHJlYWR5IGhhcyBDTEtfVENPTl9MQ0QwIGFuZCBDTEtfVENPTl9MQ0QxLiBXaGF0IG1ha2VzCj4g
eW91IHRoaW5rIHRoYXQgdGhlIFRDT05zIGRvbid0IHVzZSB0aGVtIGRpcmVjdGx5Pwo+Cj4gT3Ig
bWF5YmUgdGhleSBkbyBnbyB0aHJvdWdoIFRDT05fVE9QLCBidXQgdGhlcmUncyBubyBnYXRlLAo+
IHNvIHdlIGRvbid0IGtub3cgYWJvdXQgaXQuCj4KPiBZb3UgbmVlZCB0byByZXRoaW5rIHRoaXMu
IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gZGVhbCB3aXRoPwoKWWVzLCBJIHVuZGVyc3RhbmQgd2hh
dCB5b3VyIGFza2luZyBmb3IgYW5kIGluZGVlZCB0aGlzIGlzIHdoZXJlIEkgZ2V0CmNvbmZ1c2Vk
IGFuZCB0cmllZCB0aGlzIHdheSBpbml0aWFsbHkgYW5kIGF0dGFjaCB0aGUgZHNpIHJlZmVyZW5j
ZSBpbgpkcGh5IHNvbWV0aGluZyBsaWtlCgp0Y29uX2xjZDAgewogICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZjY3UgQ0xLX0JVU19UQ09OX0xDRDA+LCA8JmNjdSBDTEtfVENPTl9MQ0QwPjsKICAg
ICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImFoYiIsICJ0Y29uLWNoMCI7Cn07CgpkcGh5IHsK
ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST4sCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmdGNvbl90b3AgQ0xLX1RDT05fVE9QX0RTST47CiAgICAg
ICAgICAgICAgIGNsb2NrLW5hbWVzID0gImJ1cyIsICJtb2QiOwp9OwoKVGhpcyB3b3VsZCBlbmRl
ZC11cCwgcGh5IHdvbnQgZ2V0dGluZyB0aGUgbW9kIGNsb2NrIGtlZXAgcHJvYmluZyBmb3IKLUVQ
Uk9CRS1ERUZFUiBzaW5jZSB0Y29uIHRvcCBkcml2ZXIgbWlnaHQgbm90IGJlIGxvYWRlZCBhdCB0
aGUgdGltZQptaXBpIGRyaXZlci4gVGhpcyB3YXkgd2UgaGF2ZSB0djAsIHR2MSBhbmQgZHNpIGdh
dGVzIHN1cHBvcnRlZCBhcwpleGlzdGVkLiBEb2VzIGl0IG1ha2Ugc2Vuc2U/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
