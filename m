Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CDE10C512
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08A76E673;
	Thu, 28 Nov 2019 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F056E60E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:24:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l136so6996070oig.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 00:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l5fqMmUNReujsv5mY+kIqlKaupS4t3J/Kc11qOQPdNo=;
 b=ALA+TYhjs8zCoF7hnuT+ta+2qCcZWaS9PHbQ1AUSLGv4NXTjyQz/fqGm/FSReHORLr
 44E8hw3hcD8LD7qE0N+78EMiMSxa4VOITYrI6fBImetWibLszGJFNPj7voZk8yBoYFNs
 82OLWaTuTp3sodxlG30Y40Mx+tCkCB/tWxp3zFgKkWzeZ5TJrOtLhl75AH1QOqwXjVAY
 FUrEVOtQqj8+DLGsceU5++wlSYqb4vF/3Iqcnm9sgQuj3+tp/GBy/7yl5uOCUd0B+RsY
 NuwZnuqLffGH6+vVGDKlwhazbsnwWJqfhZPibMaI5MorGhAuodbHJ7UwafzdQ0yS01zF
 9fIg==
X-Gm-Message-State: APjAAAVyTXvM0kfqaeQbORzj81dqVkqMcNUNSqgNThRsb+CYi6WynbcS
 WpMqkYsSnHr7+GaxvyHP/Rvk92TA1JohJDR9DzY=
X-Google-Smtp-Source: APXvYqycbAMxGlaSD5L5BseNryZGFxDnCXfuKW6pGe7r8T6U4wC0IuGryD5puwgUkJwx/PQ1sBUWALSpdqcqaOAfXSE=
X-Received: by 2002:a05:6808:5d9:: with SMTP id
 d25mr7669477oij.54.1574929464618; 
 Thu, 28 Nov 2019 00:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-4-jacopo+renesas@jmondi.org>
 <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
 <20191128080946.GF4711@pendragon.ideasonboard.com>
In-Reply-To: <20191128080946.GF4711@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2019 09:24:13 +0100
Message-ID: <CAMuHMdUeeV23qqfi6AH5S_KG2Ly3J1sbEKc0hg0eJcJ91JCtQA@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] drm: rcar-du: Add support for CMM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCk9uIFRodSwgTm92IDI4LCAyMDE5IGF0IDk6MDkgQU0gTGF1cmVudCBQaW5j
aGFydAo8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiBPbiBUaHUs
IE5vdiAyOCwgMjAxOSBhdCAwODo1NjoxNEFNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAxMTowNCBBTSBKYWNvcG8gTW9uZGkgPGph
Y29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+ID4gPiBBZGQgYSBkcml2ZXIgZm9yIHRo
ZSBSLUNhciBEaXNwbGF5IFVuaXQgQ29sb3IgQ29ycmVjdGlvbiBNb2R1bGUuCj4gPiA+IEluIG1v
c3Qgb2YgR2VuMyBTb0NzLCBlYWNoIERVIG91dHB1dCBjaGFubmVsIGlzIHByb3ZpZGVkIHdpdGgg
YSBDTU0gdW5pdAo+ID4gPiB0byBwZXJmb3JtIGltYWdlIGVuaGFuY2VtZW50IGFuZCBjb2xvciBj
b3JyZWN0aW9uLgo+ID4gPgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgQ01NIHRocm91Z2ggYSBkcml2
ZXIgdGhhdCBzdXBwb3J0cyBjb25maWd1cmF0aW9uIG9mCj4gPiA+IHRoZSAxLWRpbWVuc2lvbmFs
IExVVCB0YWJsZS4gTW9yZSBhZHZhbmNlZCBDTU0gZmVhdHVyZXMgd2lsbCBiZQo+ID4gPiBpbXBs
ZW1lbnRlZCBvbiB0b3Agb2YgdGhpcyBpbml0aWFsIG9uZS4KPiA+ID4KPiA+ID4gUmV2aWV3ZWQt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4K
PiA+ID4gUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2Fz
QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFj
b3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L0tjb25maWcKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvS2NvbmZp
Zwo+ID4gPiBAQCAtNSw2ICs1LDcgQEAgY29uZmlnIERSTV9SQ0FSX0RVCj4gPiA+ICAgICAgICAg
ZGVwZW5kcyBvbiBBUk0gfHwgQVJNNjQKPiA+ID4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfUkVO
RVNBUyB8fCBDT01QSUxFX1RFU1QKPiA+ID4gICAgICAgICBpbXBseSBEUk1fUkNBUl9MVkRTCj4g
PiA+ICsgICAgICAgaW1wbHkgRFJNX1JDQVJfQ01NCj4gPiA+ICAgICAgICAgc2VsZWN0IERSTV9L
TVNfSEVMUEVSCj4gPiA+ICAgICAgICAgc2VsZWN0IERSTV9LTVNfQ01BX0hFTFBFUgo+ID4gPiAg
ICAgICAgIHNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVIKPiA+ID4gQEAgLTEzLDYgKzE0LDEzIEBA
IGNvbmZpZyBEUk1fUkNBUl9EVQo+ID4gPiAgICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlm
IHlvdSBoYXZlIGFuIFItQ2FyIGNoaXBzZXQuCj4gPiA+ICAgICAgICAgICBJZiBNIGlzIHNlbGVj
dGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgcmNhci1kdS1kcm0uCj4gPiA+Cj4gPiA+ICtj
b25maWcgRFJNX1JDQVJfQ01NCj4gPiA+ICsgICAgICAgdHJpc3RhdGUgIlItQ2FyIERVIENvbG9y
IE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pIFN1cHBvcnQiCj4gPiA+ICsgICAgICAgZGVwZW5kcyBv
biBEUk0gJiYgT0YKPiA+ID4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9SQ0FSX0RVCj4gPgo+ID4g
RFJNX1JDQVJfRFUgYWxyZWFkeSBkZXBlbmRzIG9uIERSTSAmJiBPRiwgc28gdGhlIGxpbmUgYWJv
dmUKPiA+IGNhbiBiZSByZW1vdmVkLgo+Cj4gSSd2ZSBzZW50IGEgcHVsbCByZXF1ZXN0IGFscmVh
ZHkuIENhbiB3ZSBhZGRyZXNzIHRoaXMgb24gdG9wID8gT3IgaXMgaXQKPiB3b3J0aCBhIHNlcGFy
YXRlIHBhdGNoLCBzaG91bGQgd2Ugd2FpdCB1bnRpbCB3ZSBoYXZlIHRvIHRvdWNoIHRoaXMgYW5k
Cj4gdGhlbiBmaXggaXQgaW4gYSAid2hpbGUgYXQgaXQiIGZhc2hpb24gPwoKU3VyZS4gIndoaWxl
IGF0IGl0IiBpcyBmaW5lIGZvciBtZS4gIEl0J3Mgbm90IGJsb2NrZXIuCgpHcntvZXRqZSxlZXRp
bmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
