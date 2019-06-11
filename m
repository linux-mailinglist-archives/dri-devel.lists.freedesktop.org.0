Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A53D56E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07889243;
	Tue, 11 Jun 2019 18:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFC189243
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:23:43 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s27so7429859pgl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=fGpL/BqPj2Fpc/cxpUUX/zPaRfBUYMyLQqydm8Jtm/zjawjneiN6+0e3sFIvnkLNkc
 W+EwvuWYk3QMr9vpNAcI1RvyXWwl+8YA1ByFsVrPbZD5L/Pb12c0KsfFKDBAjnhEvE1A
 u+O+pwruGpS8co8mP9HEAzhhQGwgafNR4430wgsEfz7fpQOx5GKAt38tfNJ9ummjiYMX
 fi86yC5Fp+Nkdr3KvP3Q+yY2rJ7J2myDheh0I3b7Av4o3g1y7NSWbg8dfc066DYYka43
 m+aG/Q3VGSDPddNyn95DLTZ8x5FOmwwDn1JXkVZZ/hMveteaF1RqI+FNWHbICIuxxnyB
 NEbg==
X-Gm-Message-State: APjAAAXH0ukAtzFSg7VHt9P3amO4X4F0N4F0qrn7wb8RjNckz8pOFKNa
 2sLmcxo8rdHRWKdtxfuA7abvCjG58v4YbIfTYtlkQUXa
X-Google-Smtp-Source: APXvYqz0tqszhCDpzjSzH68sStNjjm2tLdRCgCOXbFIcDIoXYykPNvT0ZevAXzhMLOzrGgeFEbCuT5n6tl8XXCDe+dk=
X-Received: by 2002:a17:90b:d8b:: with SMTP id
 bg11mr28168554pjb.30.1560277423232; 
 Tue, 11 Jun 2019 11:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
 <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
 <20190611140501.11ba091b@coco.lan>
In-Reply-To: <20190611140501.11ba091b@coco.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 21:23:32 +0300
Message-ID: <CAHp75VcdMXHf=hz_m5ySZ-=fBU=qkFxry9Q-Dos9Jx0qoyHCXQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=GiGCJBrmLCcwdoXR/hfEWhxRxVXP0yUu9sUUZqvg4wVFwA5vVS81R3w7B/Hws02GBs
 bQf5m5LzSY2evhzZIaPcrTxdlRnOKG6JcgzyoPlFQaOBfdx4zG/zxciv5YgK+lrLTrxM
 cYO9J/gPwcAT2TpewnRYZ31E6KAMbCy2diEh13IEFyvzxVtxzxo7VvptCqzuA/hlCovh
 ZjKXMOGRmPvdeF+5XJnjjjFZqUja5TFKSjRPTAWJT6DPCrYdGGCmiq3H5dJ2O/MfvLXb
 zKyrSiVi+o3Z7jKpHKP2VcOUjPmBH9gPMgDgTzpANCDXfrsR2Ml+cEgzRas33f/OlAYk
 2KbA==
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Sean Paul <sean@poorly.run>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgODowNSBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IEVtIFR1ZSwgMTEgSnVuIDIwMTkg
MTk6NTI6MDQgKzAzMDAKPiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5j
b20+IGVzY3JldmV1Ogo+Cj4gPiBPbiBGcmksIEp1biA3LCAyMDE5IGF0IDEwOjA0IFBNIE1hdXJv
IENhcnZhbGhvIENoZWhhYgo+ID4gPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToK
PiA+ID4gU3BoaW54IGRvZXNuJ3QgbGlrZSBvcnBoYW4gZG9jdW1lbnRzOgo+ID4KPiA+ID4gICAg
IERvY3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0OiBXQVJOSU5HOiBkb2N1bWVudCBp
c24ndCBpbmNsdWRlZCBpbiBhbnkgdG9jdHJlZQo+ID4KPiA+ID4gIERvY3VtZW50YXRpb24vbGFw
dG9wcy9sZy1sYXB0b3AucnN0ICAgICAgICAgICAgIHwgMiArKwo+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0IGIvRG9jdW1lbnRhdGlvbi9s
YXB0b3BzL2xnLWxhcHRvcC5yc3QKPiA+ID4gaW5kZXggYWE1MDNlZTliM2JjLi5mMmMyZmZlMzEx
MDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0
Cj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vbGFwdG9wcy9sZy1sYXB0b3AucnN0Cj4gPiA+IEBA
IC0xLDUgKzEsNyBAQAo+ID4gPiAgLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
Cj4gPiA+Cj4gPiA+ICs6b3JwaGFuOgo+ID4gPiArCj4gPiA+ICBMRyBHcmFtIGxhcHRvcCBleHRy
YSBmZWF0dXJlcwo+ID4gPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4KPiA+
Cj4gPiBDYW4gd2UgcmF0aGVyIGNyZWF0ZSBhIHRvYyB0cmVlIHRoZXJlPwo+ID4gSXQgd2FzIGEg
Zmlyc3QgZG9jdW1lbnQgaW4gcmVTVCBmb3JtYXQgaW4gdGhhdCBmb2xkZXIuCj4KPiBTdXJlLCBi
dXQ6Cj4KPiAxKSBJIGhhdmUgYSBwYXRjaCBjb252ZXJ0aW5nIHRoZSBvdGhlciBmaWxlcyBvbiB0
aGlzIGRpciB0byByc3Q6Cj4KPiAgICAgICAgIGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL21jaGVo
YWIvZXhwZXJpbWVudGFsLmdpdC9jb21taXQvP2g9Y29udmVydF9yc3RfcmVuYW1lc192NC4xJmlk
PWFiYzEzMjMzMDM1ZmRmZGJjNWVmMmYyZmJkM2QxMjdhMWFiMTU1MzAKPgo+IDIpIEl0IHByb2Jh
Ymx5IG1ha2VzIHNlbnNlIHRvIG1vdmUgdGhlIGVudGlyZSBkaXIgdG8KPiBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlLgo+Cj4gU28sIEkgd291bGQgcHJlZmVyIHRvIGhhdmUgdGhlIDpvcnBoYW46
IGhlcmUgd2hpbGUgKDEpIGlzIG5vdCBtZXJnZWQuCgpGaW5lIHRvIG1lIGFzIGxvbmcgYXMgeW91
IHdpbGwgZHJvcCBpdCBieSB0aGUgbWVudGlvbmVkIGVmZm9ydC4KCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
