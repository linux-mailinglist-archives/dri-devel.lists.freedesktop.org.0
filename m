Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24362D78
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DE989CCE;
	Tue,  9 Jul 2019 01:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606B89CCE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:35:25 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C064121537
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:35:24 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id n11so20048757qtl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:35:24 -0700 (PDT)
X-Gm-Message-State: APjAAAXcsdWO35sgCvIxwyn704TKMuxWCagk0qNDsofIEC77kNZ4Ihbv
 V2WoLkcLYihZmQE+lQGQBXHIfojjBx4YZtH67Q==
X-Google-Smtp-Source: APXvYqyqmZeIkbto+17UZjfxGBJMlMWVcDAdvvmQ5T/erxPr9rb4UuIEp0K074iP8kNoQ+hmFRpW6TQL61jNAR0UsVY=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr16339056qtb.224.1562636124028; 
 Mon, 08 Jul 2019 18:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-14-laurent.pinchart@ideasonboard.com>
 <CAL_JsqLJy=UCeQ_Ex7tFh2OjtitNFVjT4v=PDZSbseva+ZrGDQ@mail.gmail.com>
 <20190709010004.GD4819@pendragon.ideasonboard.com>
In-Reply-To: <20190709010004.GD4819@pendragon.ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 8 Jul 2019 19:35:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0ABZ_Qg_uHoZJU6krV7VB5rwyYWhcFoxDVhiYFpPS5Q@mail.gmail.com>
Message-ID: <CAL_JsqJ0ABZ_Qg_uHoZJU6krV7VB5rwyYWhcFoxDVhiYFpPS5Q@mail.gmail.com>
Subject: Re: [PATCH 17/60] dt-bindings: Add legacy 'toppoly' vendor prefix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562636124;
 bh=xPZoq9ebLBZ4qc4AlgGWCh4n4FLriLhzXe2xjvwKQy0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fnx2iJxxVQb+EUs7VzLKalGezEvz7TEyljm+xz3X3/Yii9Ju5mdfC0kSA7WIzKDPp
 nLyerE8mFHe8PgSag1bvQ/rZnweKGzGdMEpXsLnMAo/NOO4gN7DPK87i7082WjYqYt
 Vgl5NN6ykGnrPUP6sYHjK/p05qtxXCaee9jeyKUc=
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA3OjAwIFBNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiBNb24s
IEp1bCAwOCwgMjAxOSBhdCAwMTowMDozNVBNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+
IE9uIFN1biwgSnVsIDcsIDIwMTkgYXQgMTI6MjUgUE0gTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiA+ID4KPiA+ID4gVGhlICd0b3Bwb2x5JyB2ZW5kb3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVm
ZXJzIHRvIFRQTywgd2hvc2UgRFQgdmVuZG9yCj4gPiA+IHByZWZpeCBpcyBhbHJlYWR5IGRlZmlu
ZWQgYXMgJ3RwbycuIEFkZCAndG9wcG9seScgYXMgYW4gYWx0ZXJuYXRpdmUgYW5kCj4gPiA+IGRv
Y3VtZW50IGl0IGFzIGxlZ2FjeS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFt
bCB8IDIgKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbAo+ID4gPiBpbmRleCAyNTE0NDYzZjJjNjMuLmQ3ODUyN2ViODI1NCAxMDA2
NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ID4gPiBAQCAtODY3LDYgKzg2Nyw4IEBAIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4gPiAgICAgIGRlc2NyaXB0aW9uOiBUZWNvbiBNaWNyb3Byb2Nlc3NvciBU
ZWNobm9sb2dpZXMsIExMQy4KPiA+ID4gICAgIl50b3BlZXQsLioiOgo+ID4gPiAgICAgIGRlc2Ny
aXB0aW9uOiBUb3BlZXQKPiA+ID4gKyAgIl50b3Bwb2x5LC4qIjoKPiA+ID4gKyAgICBkZXNjcmlw
dGlvbjogVFBPIChsZWdhY3kgcHJlZml4LCBzZWUgJ3RwbycpCj4gPgo+ID4gQWRkICdkZXByZWNh
dGVkOiB0cnVlJyBhbHNvLiBUaGF0J3MgYSBuZXcgcHJvcGVydHkgaW4ganNvbi1zY2hlbWEKPiA+
IGRyYWZ0OC4gSXQncyBub3QgdXNlZCBmb3IgYW55dGhpbmcgeWV0IG90aGVyIHRoYW4gZG9jdW1l
bnRhdGlvbi4KPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHBvaW50ZXIuCj4KPiBCeSB0aGUgd2F5IHRo
aXMgc2VyaWVzIGNvbmZsaWN0cyB3aXRoIHlvdXIgcGF0Y2hlcyB0aGF0IG1vdmUgYWxsIHBhbmVs
Cj4gYmluZGluZ3MgdG8geWFtbC4gSSdsbCByZWJhc2UgaXQgb24gdG9wIGlmIHlvdXJzIGdldHMg
bWVyZ2VkIGZpcnN0LgoKSSBjb21taXR0ZWQgdGhlIHNlcmllcyB0b2RheSwgYnV0IEkgZG9uJ3Qg
c2VlIHdoYXQgY29uZmxpY3RzIHRob3VnaC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
