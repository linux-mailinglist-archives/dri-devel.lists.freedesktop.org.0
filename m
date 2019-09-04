Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0FA7C6B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018B389206;
	Wed,  4 Sep 2019 07:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7C1899B3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 03:53:51 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v7so643668oib.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 20:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1hELw/mZnhRRWFbYJGQfmaEmlzEA69NHvGeKH1N6R60=;
 b=hIRPI6ep/bZMyeDOGWHof/0ytkAC9j9EV77EAxdbjy43M4S/LmarjX6fCZE6/wlJB/
 C3YiSy5C0ulrLweIC4QNtGQymIfgXH66Fbv/lpcrPAX+THwhfsURY+235rdjRMUMtBEL
 Ggvs1thpn1M4xTb/bXYkJuLPM3nmIaxSC9q8GFvXxNHJLjhbcEQnENoYFz9I8MQkwL0N
 fh/CRdpNEdPJJUrK2a5DO/7fhu2jowKAoPJckNHCNUv9Mvn1qqMODf4SAlrS2fSRxpqS
 ZpsjjbVj2L32JwLTJxg7HOES0lHO7SThZSlig0w3W+Wkh2FlKbRefy3MmtETZ0d22m72
 H67g==
X-Gm-Message-State: APjAAAWU5irOpbkX8MfHvOIg2raoIXn6SZ3IgkHPUUmf8C6fM+8jT4gS
 tDllpjy/wlTLHtnBHXrfEl6QP1OTLdiUhuZUQhw=
X-Google-Smtp-Source: APXvYqywjnQrOYyG/0Vo1URo5XN9A+74iJSQj3enSTQm4NvEFIcxSsO2HPkNjccMdGNejmM2xbL0vdtEDYOH/irtuwU=
X-Received: by 2002:aca:574c:: with SMTP id l73mr1980400oib.47.1567569230893; 
 Tue, 03 Sep 2019 20:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190813085855.8302-1-nishkadg.linux@gmail.com>
 <20190813091251.2nyxtivsvp47aahp@holly.lan>
 <20190903161923.5d2fvrwpvgims4va@holly.lan>
In-Reply-To: <20190903161923.5d2fvrwpvgims4va@holly.lan>
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Date: Wed, 4 Sep 2019 09:23:40 +0530
Message-ID: <CAKJjNbCkFA0Bri7q0BaNVzj_03LPwcHutn_+7b5gTTnJnq-tZQ@mail.gmail.com>
Subject: Re: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props
 constant
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1hELw/mZnhRRWFbYJGQfmaEmlzEA69NHvGeKH1N6R60=;
 b=iqdM/8KeRJuuyZ/effs20gF6ShFqEIhVkMnvw87QlRPtdpJXwhfQYcmL6+l2IDM7w0
 n6GtzfphN4CDqJtp+CBT3VM8Gv22sfxS95VRUPkDD/2Ae+HSwIUKIWroKNLZGibTBL2d
 m+RUsnaspczfc6vyCGCrjgXPbT+XDn/1PS9sGNWY13rEKZTpcVTx1P1Wf1FXt/+TfWCa
 BWDc75l+DmFlKLRkSAIFkMpvtuUyuD8LVXOnhEGrjFYLPKGugH8mrxkarU9VpbW6cmgd
 lwXoOEeFm7EYaXzjE3G2G7c4UMZ/cSyYcwoLYkzfRAQztxiotMVT/9bYlCj7+VTtr2Ib
 y2ow==
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAzIFNlcCAyMDE5IGF0IDIxOjQ5LCBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEwOjEy
OjUxQU0gKzAxMDAsIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDEzLCAy
MDE5IGF0IDAyOjI4OjU1UE0gKzA1MzAsIE5pc2hrYSBEYXNndXB0YSB3cm90ZToKPiA+ID4gU3Rh
dGljIHN0cnVjdHVyZSBtaWNyb19ibF9wcm9wcywgaGF2aW5nIHR5cGUgYmFja2xpZ2h0X3Byb3Bl
cnRpZXMsIGlzCj4gPiA+IHVzZWQgb25seSBvbmNlLCB3aGVuIGl0IGlzIHBhc3NlZCBhcyB0aGUg
bGFzdCBhcmd1bWVudCB0byBmdW5jdGlvbgo+ID4gPiBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVn
aXN0ZXIoKS4gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKCkgaXMKPiA+ID4gZGVmaW5l
ZCB3aXRoIGl0cyBsYXN0IHBhcmFtZXRlciBiZWluZyBkZWNsYXJlZCBjb25zdGFudC4gSGVuY2Ug
bWFrZQo+ID4gPiBtaWNyb19ibF9wcm9wcyBpdHNlbGYgY29uc3RhbnQgYXMgd2VsbC4KPiA+ID4g
SXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+ID4KPiA+IERpZCB5b3UgZG8gYW55IHJldmll
dyB0byBzZWUgaWYgdGhpcyBwYXR0ZXJuIG9jY3VycyBpbiBvdGhlciBiYWNrbGlnaHQKPiA+IGRy
aXZlcnMgKGl0IGxvb2tzIHRvIG1lIGxpa2UgdGhlIHNhbWUgcGF0dGVybiBhcHBlYXJzIGluCj4g
PiByYXZlLXNwLWJhY2tsaWdodC5jLi4uIGRvIHRoZSB0b29scyBicmluZyB0aGF0IG9uZSBvdXQg
YXMgd2VsbCkuCj4KPiBQaW5nPwoKU29ycnksIGRpZCBteSByZXBseSBub3QgZ28gdGhyb3VnaD8K
SSBoYWQgc2FpZDoKTm8sIHRoZSBDb2NjaW5lbGxlIHNjcmlwdCBJJ20gdXNpbmcgZG9lc24ndCBm
bGFnIGFueSBvdGhlciBiYWNrbGlnaHQKZHJpdmVycy4gSXQncyBwb3NzaWJsZSB0aGF0IHRoZSBz
Y3JpcHQganVzdCBtaXNzZWQgc29tZXRoaW5nLiBXaGljaApzdHJ1Y3R1cmUgaW4gcmF2ZS1zcC1i
YWNrbGlnaHQuYyBjb3VsZCBwb3RlbnRpYWxseSBiZSBtYWRlIGNvbnN0PwoKVGhhbmtpbmcgeW91
LApOaXNoa2EKCj4KPgo+IERhbmllbC4KPgo+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBE
YXNndXB0YSA8bmlzaGthZGcubGludXhAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2lwYXFfbWljcm9fYmwuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jIGIvZHJpdmVycy92
aWRlby9iYWNrbGlnaHQvaXBhcV9taWNyb19ibC5jCj4gPiA+IGluZGV4IDExMjNmNjdjMTJiMy4u
ODViMTZjYzgyODc4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9p
cGFxX21pY3JvX2JsLmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaXBhcV9t
aWNyb19ibC5jCj4gPiA+IEBAIC00NCw3ICs0NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFj
a2xpZ2h0X29wcyBtaWNyb19ibF9vcHMgPSB7Cj4gPiA+ICAgICAudXBkYXRlX3N0YXR1cyAgPSBt
aWNyb19ibF91cGRhdGVfc3RhdHVzLAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gLXN0YXRpYyBzdHJ1
Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgbWljcm9fYmxfcHJvcHMgPSB7Cj4gPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIG1pY3JvX2JsX3Byb3BzID0gewo+ID4g
PiAgICAgLnR5cGUgPSBCQUNLTElHSFRfUkFXLAo+ID4gPiAgICAgLm1heF9icmlnaHRuZXNzID0g
MjU1LAo+ID4gPiAgICAgLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSywKPiA+ID4gLS0KPiA+ID4g
Mi4xOS4xCj4gPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
