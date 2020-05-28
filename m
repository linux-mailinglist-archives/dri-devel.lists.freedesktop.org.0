Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04B1E6D5A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 23:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001B6E5D5;
	Thu, 28 May 2020 21:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55A6E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 21:12:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858602A8;
 Thu, 28 May 2020 23:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590700348;
 bh=mBPwghkxCn/U41zxI9xPuO+7LoQVh7Lh56biCkGXlQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLz8ATsR9sYMn576TdhXMznzLqdtPWMRJV9YwBHepqQT+e4Nm2JQBViTVVPJ8tjhc
 pedNkvB8zTtsi2pRAOgWBA/vC6ZWlBh/94N6Za9W2Vhe7GYEM2c+Wpr0zb7oowJugC
 rNucBfzOAdbsTAwI8Kjl18NZJVXA7EC6gQrJWk+Y=
Date: Fri, 29 May 2020 00:12:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] ARM: dts: dove: Make the DT compliant with the
 ti,tfp410 binding
Message-ID: <20200528211214.GA14756@pendragon.ideasonboard.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-2-ricardo.canuelo@collabora.com>
 <20200528173755.GA113289@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528173755.GA113289@bogus>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 shawnguo@kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 kernel@collabora.com,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMTE6Mzc6NTVBTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMTQsIDIwMjAgYXQgMDQ6MzY6MDlQTSArMDIwMCwg
UmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiA+IERlZmluZSBhICdwb3J0cycgbm9kZSBmb3IgJ2R2
aTogdmlkZW9AMzknIGFuZCB1c2UgdGhlIHByb3BlciBuYW1pbmcgZm9yCj4gPiB0aGUgcG93ZXJk
b3duLWdwaW9zIHByb3BlcnR5IHRvIG1ha2UgaXQgY29tcGxpYW50IHdpdGggdGhlIHRpLHRmcDQx
MAo+ID4gYmluZGluZy4KPiA+IAo+ID4gVGhpcyBmaWxscyB0aGUgbWluaW11bSByZXF1aXJlbWVu
dHMgdG8gbWVldCB0aGUgYmluZGluZyByZXF1aXJlbWVudHMsCj4gPiBwb3J0IGVuZHBvaW50cyBh
cmUgbm90IGRlZmluZWQuCj4gCj4gSnVzdCBtYWtlICdwb3J0cycgb3B0aW9uYWwuIFRoaXMgaXNu
J3QgcmVhbGx5IGFueSBiZXR0ZXIgdW5sZXNzIHlvdSBhZGQgCj4gZW5kcG9pbnRzIHRvby4KCkkg
d29uZGVyIGhvdyB0aGlzIGlzIHN1cHBvc2VkIHRvIHdvcmsgdGhvdWdoLiBUaGUgdGktdGZwNDEw
IGRyaXZlciB3aWxsCmZhaWwgdG8gcHJvYmUgaWYgdGhlcmUncyBubyBlbmRwb2ludC4gSSdkIHJh
dGhlciBhbHJlYWR5IGFkZCBhIG5vZGUgZm9yCnRoZSBEVkkgY29ubmVjdG9yIGFuZCBjb25uZWN0
IGl0IHRvIHBvcnRAMSBvZiB0aGUgVEZQNDEwLgoKPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8g
Q2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9hcm0vYm9vdC9kdHMvZG92ZS1zYmMtYTUxMC5kdHMgfCAxMyArKysrKysrKysrKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2RvdmUtc2JjLWE1MTAuZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvZG92ZS1zYmMtYTUxMC5kdHMKPiA+IGluZGV4IDJiYjg1YTliNzYxNC4uMzI4
MDRjOTgxNjI1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZG92ZS1zYmMtYTUx
MC5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RvdmUtc2JjLWE1MTAuZHRzCj4gPiBA
QCAtMTMyLDcgKzEzMiwxOCBAQAo+ID4gIAlkdmk6IHZpZGVvQDM5IHsKPiA+ICAJCWNvbXBhdGli
bGUgPSAidGksdGZwNDEwIjsKPiA+ICAJCXJlZyA9IDwweDM5PjsKPiA+IC0JCXBvd2VyZG93bi1n
cGlvID0gPCZncGlvX2V4dCAzIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArCQlwb3dlcmRvd24tZ3Bp
b3MgPSA8JmdwaW9fZXh0IDMgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICsKPiA+ICsJCXBvcnRzIHsK
PiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
PiA+ICsJCQlwb3J0QDAgewo+ID4gKwkJCQlyZWcgPSA8MD47Cj4gPiArCQkJfTsKPiA+ICsJCQlw
b3J0QDEgewo+ID4gKwkJCQlyZWcgPSA8MT47Cj4gPiArCQkJfTsKPiA+ICsJCX07Cj4gPiAgCX07
Cj4gPiAgfTsKPiA+ICAKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
