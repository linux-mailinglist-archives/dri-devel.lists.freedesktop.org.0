Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E21102A64
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 18:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED126E9C2;
	Tue, 19 Nov 2019 17:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27F96E9C2;
 Tue, 19 Nov 2019 17:02:23 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BCE022400;
 Tue, 19 Nov 2019 17:02:23 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 71so18478750qkl.0;
 Tue, 19 Nov 2019 09:02:23 -0800 (PST)
X-Gm-Message-State: APjAAAUpwd6NvNjEIrfq6z18rzwmZ1/Ygg9eOjn+THAszJSZ67+/ryzn
 C6hIywpN26toMZavAqf07esH1F6zIKKxiTDetg==
X-Google-Smtp-Source: APXvYqxucfdWSXPgW2vd8l9633HeMvIH864eMJ/p+Bk0FhDvh444Pum/yEC+Gs6buUxeu7x2jucgvrCcmOz57phmAkg=
X-Received: by 2002:a05:620a:205d:: with SMTP id
 d29mr30290391qka.152.1574182942398; 
 Tue, 19 Nov 2019 09:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20191119144315.11261-1-krzk@kernel.org>
In-Reply-To: <20191119144315.11261-1-krzk@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Nov 2019 11:02:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1hHneSW5DzLNxU00AqQJ49chTyULJ0S3JR-CqfOfTgA@mail.gmail.com>
Message-ID: <CAL_Jsq+1hHneSW5DzLNxU00AqQJ49chTyULJ0S3JR-CqfOfTgA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Fix path to power-domain.txt bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574182943;
 bh=9xlP6l6zc8LrRTuryqi4QOF5/Hg74NZf0SPlZK2mEU8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hHdDFqFWJkwOuMKZk0NzaOxgeAE6UqGlvZAVH+WTtjEaZ3CCkLs6cDI5yFhIl9SRE
 54T4E31B4t+satNSKMSJ+416Ec7m0NKdD49RPHEpukOMZs6k0mxIRc9AHYb5zIBbTG
 bNPOVvg5RSncACs08sPyTJmxe1NXOpvf8io01pqY=
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
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 Linux USB List <linux-usb@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, PCI <linux-pci@vger.kernel.org>,
 linux-tegra@vger.kernel.org, freedreno <freedreno@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgODo0MyBBTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gV2l0aCBzcGxpdCBvZiBwb3dlciBkb21haW4gY29udHJv
bGxlciBiaW5kaW5ncyB0byBwb3dlci1kb21haW4ueWFtbCwgdGhlCj4gY29uc3VtZXIgcGFydCB3
YXMgcmVuYW1lZCB0byBwb3dlci1kb21haW4udHh0LiAgVXBkYXRlIHRoZSByZWZlcmVuY2VzIGlu
Cj4gb3RoZXIgYmluZGluZ3MuCj4KPiBSZXBvcnRlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KPiBGaXhlczogYWJiNDgwNWUzNDNhICgiZHQtYmluZGluZ3M6
IHBvd2VyOiBDb252ZXJ0IFNhbXN1bmcgRXh5bm9zIFBvd2VyIERvbWFpbiBiaW5kaW5ncyB0byBq
c29uLXNjaGVtYSIpCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svY2xrLWV4eW5vcy1hdWRzcy50eHQgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svZXh5bm9zNTQzMy1jbG9jay50eHQgIHwgMiArLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI4YTc3NzgtY3BnLWNsb2Nrcy50eHQgIHwg
MiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI4YTc3NzktY3Bn
LWNsb2Nrcy50eHQgIHwgMiArLQo+ICAuLi4vYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyY2FyLWdl
bjItY3BnLWNsb2Nrcy50eHQgICAgICAgICAgIHwgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9jbG9jay9yZW5lc2FzLHJ6LWNwZy1jbG9ja3MudHh0ICAgICAgIHwgMiArLQo+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2V0bmF2aXYvZXRuYXZpdi1kcm0udHh0ICAgICAg
IHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
ZHB1LnR4dCAgICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tc20vbWRwNS50eHQgICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZHNwL2ZzbCxkc3AueWFtbCAgICAgICAgICAgIHwgMiArLQo+ICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaW14Ny1taXBpLWNzaTIudHh0
ICAgIHwgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVn
LWRlY29kZXIudHh0ICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWstbWRwLnR4dCAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvb3BwL3Fjb20tbnZtZW0tY3B1ZnJlcS50eHQgIHwgMiArLQo+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3BjaS1rZXlzdG9uZS50eHQg
ICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Rp
LHBoeS1hbTY1NC1zZXJkZXMudHh0IHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcG93ZXIvcWNvbSxycG1wZC50eHQgICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcmVuZXNhcyxyY2FyLXN5c2MudHh0IHwgMiAr
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbnZpZGlhLHRlZ3JhMTI0LXh1c2IudHh0
ICAgICAgICAgIHwgNCArKy0tCj4gIDE5IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQoKUGxlYXNlIG5vLiBDYW4geW91IGp1c3QgdW5kbyB0aGUgcmVuYW1p
bmcgYmFjayB0byBwb3dlcl9kb21haW4udHh0CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
