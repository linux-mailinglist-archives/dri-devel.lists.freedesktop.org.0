Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBD1EB668
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FC96E393;
	Tue,  2 Jun 2020 07:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBAC89DEC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 07:59:25 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id m18so2198531vkk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+/lonEZ7lAjJM9p39P8BR7wI92X7wL1JFjHzHvAjHkM=;
 b=QJIC2sGSvW8+pkA3XwPz6SEdhDVwIlJXrSvgwrJz14gWv9GFyjtDG2MTUcUmBE9l/P
 bFNwlOPsXAWxexrOr1FTH77p7eziPmqwaCwGID1oap6GBKrL6bP3eKe5qkD6tXL7uk2X
 AsmB7QGgkZYU5ME7vUpGEwso2aVlQHv3oAdXI0rooRnnCqt1KHlc6NdJOf5WkBA/tLWk
 0HmRDDYVgBWOKM8wQwZO6+lG88hsmWd0K/Qcbpso+qCDMK6HjpYt5w6hR6ty4EmjPrjF
 ysAIR0YGSpqPj7ajyUokQlELevpS2gTch8EmZmHAPyqDvGWCwnC5SUywivMOGkZQ+Qmb
 hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+/lonEZ7lAjJM9p39P8BR7wI92X7wL1JFjHzHvAjHkM=;
 b=lO7xUONZbU6F07vcRQ8VqILy4zR2n79y+6YgVUEFroShEAlnHSe844XFS/nuYULoIS
 gGqabjblVTZwBDOkZMANrOqFN4/PoCM171XR1tYiQW6a/BvPfaE3g5PGiSyVWPLyUU7o
 b65aom39nOhe5jl5TwaPfKHNihTM2XdHEE5VME6lEXY6yEKAgg7eKUg2nKEKngEoH3K9
 4f3FggqtPTq8wyH+ofieCZeTE0k2NMw0S3bOgG5lFJIt6cdadHRw/DD6k4PbbXsJHpq2
 oXRf42LJepsNxAs6VAVaBzFV9YEcjZixrPHablVYaQgaCs3UPMwo6EoIuZiogiOWUDka
 tAIg==
X-Gm-Message-State: AOAM532JSJZ5kTB14471PkX/bo6kLhtDXPwA6c3PWUGSvRGpNWPsgoV6
 ZV6Zb1HpM83IgcpCf/Z4jpzcB/hEP6VXFKLBKIWyaw==
X-Google-Smtp-Source: ABdhPJz5/TY/hSbADj3oi4wF5cfCkxs3IZ3jGUJwi+iQ030QrAjfPx7lmoOmw/UVp6y5U0jhlKMWyCVws+HntU+xFxQ=
X-Received: by 2002:a1f:2d8e:: with SMTP id t136mr246292vkt.61.1590998364343; 
 Mon, 01 Jun 2020 00:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
 <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
 <20200528073055.znutrhkryzu3grrl@gilmour.lan>
In-Reply-To: <20200528073055.znutrhkryzu3grrl@gilmour.lan>
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Mon, 1 Jun 2020 15:58:26 +0800
Message-ID: <CAPpJ_ec1KRwUrHGVVZrReaDPz4iga-Nvj5H652-tTKmkXL=Xmg@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To: Maxime Ripard <maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-kernel@lists.infradead.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Drake <drake@endlessm.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IOaWvCAyMDIw5bm0NeaciDI45pelIOmA
seWbmyDkuIvljYgzOjMw5a+r6YGT77yaCj4KPiBIaSBEYW5pZWwsCj4KPiBPbiBXZWQsIE1heSAy
NywgMjAyMCBhdCAwNToxNToxMlBNICswODAwLCBEYW5pZWwgRHJha2Ugd3JvdGU6Cj4gPiBPbiBX
ZWQsIE1heSAyNywgMjAyMCBhdCA1OjEzIFBNIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50
ZWNoPiB3cm90ZToKPiA+ID4gSSdtIGFib3V0IHRvIHNlbmQgYSB2MyB0b2RheSBvciB0b21vcnJv
dywgSSBjYW4gQ2MgeW91IChhbmQgSmlhbi1Ib25nKSBpZiB5b3UKPiA+ID4gd2FudC4KPiA+Cj4g
PiBUaGF0IHdvdWxkIGJlIGdyZWF0LCBhbHRob3VnaCBnaXZlbiB0aGUgcG90ZW50aWFsbHkgaW5j
b25zaXN0ZW50Cj4gPiByZXN1bHRzIHdlJ3ZlIGJlZW4gc2VlaW5nIHNvIGZhciBpdCB3b3VsZCBi
ZSBncmVhdCBpZiB5b3UgY291bGQKPiA+IGFkZGl0aW9uYWxseSBwdXNoIGEgZ2l0IGJyYW5jaCBz
b21ld2hlcmUuCj4gPiBUaGF0IHdheSB3ZSBjYW4gaGF2ZSBoaWdoZXIgY29uZmlkZW5jZSB0aGF0
IHdlIGFyZSBhcHBseWluZyBleGFjdGx5Cj4gPiB0aGUgc2FtZSBwYXRjaGVzIHRvIHRoZSBzYW1l
IGJhc2UgZXRjLgo+Cj4gU28gSSBzZW50IGEgbmV3IGl0ZXJhdGlvbiB5ZXN0ZXJkYXksIGFuZCBv
ZiBjb3Vyc2UgZm9yZ290IHRvIGNjIHlvdS4uLiBTb3JyeSBmb3IKPiB0aGF0Lgo+Cj4gSSd2ZSBw
dXNoZWQgbXkgY3VycmVudCBicmFuY2ggaGVyZToKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tcmlwYXJkL2xpbnV4LmdpdC9sb2cvP2g9cnBpNC1rbXMK
ClRoYW5rcyB0byBNYXhpbWUhCgpJIGhhdmUgdHJpZWQgeW91ciByZXBvc2l0b3J5IG9uIGJyYW5j
aCBycGk0LWttcy4gIFRoZSBEUk0gVkM0IGlzIHVzZWQhCkJ1dCBnb3Qgc29tZSBpc3N1ZXM6CjEu
IFNvbWUgd2VpcmQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZy4gIE5vdCBzdXJlIGl0IGlzIHJlbGF0
ZWQsIG9yIG5vdApbICAgIDUuMjE5MzIxXSBbZHJtOnZjNV9oZG1pX2luaXRfcmVzb3VyY2VzXSAq
RVJST1IqIEZhaWxlZCB0byBnZXQKSERNSSBzdGF0ZSBtYWNoaW5lIGNsb2NrCmh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL3N0YXJuaWdodC8zZjMxN2RjYTEyMTA2NWEzNjFjZjA4ZTkxMjI1ZTM4OQoK
Mi4gVGhlIHNjcmVlbiBmbGFzaGVzIHN1ZGRlbmx5IHNvbWV0aW1lcy4KCjMuIFRoZSBoaWdoZXIg
cmVzb2x1dGlvbnMsIGxpa2UgMTkyMHgxMDgwIC4uLiBhcmUgbG9zdCBhZnRlciBob3QKcmUtcGx1
ZyBIRE1JIGNhYmxlIChIRE1JMCkKCkppYW4tSG9uZyBQYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
