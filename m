Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16BCFC66
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29CC6E7D7;
	Tue,  8 Oct 2019 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBF96E7D7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:29:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f22so3372454wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YE0D8Jghzw7CVdBybcskFRzbxtu5Ddla3G2nKPd70nY=;
 b=nw00f0YPsIKV9vQ4/I7wON1TiWo3ldUF3r0aDAXfxymElpjpDF4NMIXespnKdPRXVV
 7IrblgPpJjPsYarHtcrguLoug6C5C1hbm/G8a6KA610AfVIc+bmbqbbrP9g+QAwMFfyA
 TsoDJU1TKpCvrlANKj8gUpRFAI2jR6AZNlLDdCiLmoenV1J0oi9RIlz3rQQPfgDj+SQa
 PxV8oMtugD4OKXQSRzl6FqYrpVNy6XrTDGGnVCWLB0hxU08vWbxVJv5IGeYggQJClM1y
 GV3lD81fjLXH8jtsJ8nwvYAzHfad4jV3JaHwjCv9HoSqjtOARbBhL6cFzYrvw/aqQ/H1
 d7RQ==
X-Gm-Message-State: APjAAAWChSotAedYgybMWKwxpiZ0/hkZ4R4S1nQwhjOJH7pAqCOm2/9n
 EaCG5g8d8gqgV+ECJL50Z5s=
X-Google-Smtp-Source: APXvYqw13buOvMKCLr9dJbc+42LtMA0u9H09vXHDWUs/lreMeW+bzq3Dl290U336az+CLfiT3ep52A==
X-Received: by 2002:a1c:a6ca:: with SMTP id p193mr3960835wme.103.1570544942984; 
 Tue, 08 Oct 2019 07:29:02 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id 143sm4202466wmb.33.2019.10.08.07.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:29:02 -0700 (PDT)
Date: Tue, 8 Oct 2019 16:29:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
Message-ID: <20191008142900.GA2635@pi3>
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
 <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
 <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDk6MTc6MTZBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA5OjA1IEFNIFJvYiBIZXJyaW5nIDxyb2JoK2R0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgNzo1MCBB
TSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwNzozODoxNEFNIC0wNTAwLCBSb2IgSGVycmluZyB3
cm90ZToKPiA+ID4gPiBPbiBGcmksIE9jdCA0LCAyMDE5IGF0IDEwOjE0IEFNIEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
IGNsa291dE4gbmFtZXMgb2YgY2xvY2tzIG11c3QgYmUgdW5pcXVlIGJlY2F1c2UgdGhleSByZXBy
ZXNlbnQKPiA+ID4gPiA+IHVuaXF1ZSBpbnB1dHMgb2YgY2xvY2sgbXVsdGlwbGV4ZXIuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3BtdS55YW1sIHwgNiArKysrLS0KPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3NhbXN1bmcvcG11LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+ID4gPiA+IGluZGV4IDczYjU2ZmM1YmY1OC4uZDhlMDM3
MTZmNWQyIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9zYW1zdW5nL3BtdS55YW1sCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+ID4gPiA+IEBAIC01
Myw4ICs1MywxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gICAgICAgIExpc3Qgb2YgY2xvY2sg
bmFtZXMgZm9yIHBhcnRpY3VsYXIgQ0xLT1VUIG11eCBpbnB1dHMKPiA+ID4gPiA+ICAgICAgbWlu
SXRlbXM6IDEKPiA+ID4gPiA+ICAgICAgbWF4SXRlbXM6IDMyCj4gPiA+ID4gPiAtICAgIGl0ZW1z
Ogo+ID4gPiA+ID4gLSAgICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwzWzAt
MV0pJCcKPiA+ID4gPiA+ICsgICAgYWxsT2Y6Cj4gPiA+ID4gPiArICAgICAgLSBpdGVtczoKPiA+
ID4gPiA+ICsgICAgICAgICAgcGF0dGVybjogJ15jbGtvdXQoWzAtOV18WzEyXVswLTldfDNbMC0x
XSkkJwo+ID4gPiA+ID4gKyAgICAgIC0gdW5pcXVlSXRlbXM6IHRydWUKPiA+ID4gPgo+ID4gPiA+
IFlvdSBzaG91bGRuJ3QgbmVlZCB0aGUgJ2FsbE9mJywganVzdCBhZGQgdW5pcXVlSXRlbXMgYXQg
dGhlIHNhbWUgbGV2ZWwgYXMgaXRlbXMuCj4gPiA+Cj4gPiA+IElmIHlvdSBtZWFuIHNvbWV0aGlu
ZyBsaWtlOgo+ID4gPiAgIDU2ICAgICB1bmlxdWVJdGVtczogdHJ1ZQo+ID4gPiAgIDU3ICAgICBp
dGVtczoKPiA+ID4gICA1OCAgICAgICBwYXR0ZXJuOiAnXmNsa291dChbMC05XXxbMTJdWzAtOV18
M1swLTFdKSQnCj4gPiA+Cj4gPiA+IFRoZW4gdGhlIGR0X2JpbmRpbmdfY2hlY2sgZmFpbHM6Cj4g
PiA+Cj4gPiA+IGRldi9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L3NhbXN1bmcvcG11LnlhbWw6IHByb3BlcnRpZXM6Y2xvY2stbmFtZXM6Cj4gPiA+ICd1bmlxdWVJ
dGVtcycgaXMgbm90IG9uZSBvZiBbJyRyZWYnLCAnYWRkaXRpb25hbEl0ZW1zJywgJ2FkZGl0aW9u
YWxQcm9wZXJ0aWVzJywgJ2FsbE9mJywgJ2FueU9mJywgJ2NvbnN0JywgJ2NvbnRhaW5zJywgJ2Rl
ZmF1bHQnLCAnZGVwZW5kZW5jaWVzJywgJ2RlcHJlY2F0ZWQnLCAnZGVzY3JpcHRpb24nLCAnZWxz
ZScsICdlbnVtJywgJ2l0ZW1zJywgJ2lmJywgJ21pbkl0ZW1zJywgJ21pbmltdW0nLCAnbWF4SXRl
bXMnLCAnbWF4aW11bScsICdub3QnLCAnb25lT2YnLCAncGF0dGVybicsICdwYXR0ZXJuUHJvcGVy
dGllcycsICdwcm9wZXJ0aWVzJywgJ3JlcXVpcmVkJywgJ3RoZW4nLCAndHlwZScsICd0eXBlU2l6
ZScsICd1bmV2YWx1YXRlZFByb3BlcnRpZXMnXQo+ID4KPiA+IEkgY2FuIGFkZCBpdC4KPiA+Cj4g
PiBUaGUgb3RoZXIgb3B0aW9uIGlzIHRvIGZpeCB0aGlzIGluIHRoZSBjbG9jayBzY2hlbWEuIEkn
bSBub3Qgc3VyZSBpZgo+ID4gdGhlcmUncyBhIG5lZWQgZm9yIGR1cGxpY2F0ZSBjbG9jay1uYW1l
cy4gU2VlbXMgdW5saWtlbHkuIEknbGwgdGVzdAo+ID4gdGhhdC4KPiAKPiBBY3R1YWxseSwgY2xv
Y2stbmFtZXMgaXMgYWxyZWFkeSBzZXQgdG8gYmUgdW5pcXVlLiBEaWQgeW91IHNlZSBvdGhlcndp
c2U/CgpZZWFoLCBJIGR1cGxpY2F0ZWQgb24gcHVycG9zZSAiY2xrb3V0MSIgYW5kIGl0IHdhcyBu
b3QgcmVwb3J0ZWQgYXMgYW4KZXJyb3IuIFRoYXQncyB3aHkgSSBhZGRlZCAidW5pcXVlSXRlbXMi
LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
