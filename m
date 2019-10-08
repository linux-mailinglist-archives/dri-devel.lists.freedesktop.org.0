Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3ACFC2D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571D26E7C0;
	Tue,  8 Oct 2019 14:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565E36E7C0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:17:29 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEB9B218DE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:17:28 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id y144so16874174qkb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:17:28 -0700 (PDT)
X-Gm-Message-State: APjAAAVo8ZQBiHY+JTGkWMYj/HHR7Jc3/c1ahIMuDfGkB6pczH/0AavA
 y+rYNbA4hM6TCdkZxPTTM+DVCrT4OxVr+bHB5g==
X-Google-Smtp-Source: APXvYqyTPIbp6uB/NbQrlXR7mbW5oj8qd3GbQh+SZbdKWrINRREVDB6tFYwAesJBD5TWAI4QGnzN+RkckREb5FLBngg=
X-Received: by 2002:a05:620a:7da:: with SMTP id
 26mr27191277qkb.119.1570544248015; 
 Tue, 08 Oct 2019 07:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
 <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 09:17:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
Message-ID: <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570544249;
 bh=k4z9UTPnrwAqsKFn+N7lEY6KbuTPenqCQZ8tcmJoBhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UTZUXZWmKAZ+ukH2V5cR5yyrA+9EdRZtK3FpVZAV4WniOq8YQvCkqeVoAdDyf69Qc
 o9g71ju8By4N/y/+jdb/34FLQN3VUYdRqi5Nl06xPEZK+r667vLIJj/NALBGqpqFwC
 gMpYCctOvHKsCCJqxdhpxMOA2H6//QkiJwPLHgZk=
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

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA5OjA1IEFNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA3OjUwIEFNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBPY3Qg
MDgsIDIwMTkgYXQgMDc6Mzg6MTRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9u
IEZyaSwgT2N0IDQsIDIwMTkgYXQgMTA6MTQgQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoZSBjbGtvdXROIG5hbWVzIG9mIGNs
b2NrcyBtdXN0IGJlIHVuaXF1ZSBiZWNhdXNlIHRoZXkgcmVwcmVzZW50Cj4gPiA+ID4gdW5pcXVl
IGlucHV0cyBvZiBjbG9jayBtdWx0aXBsZXhlci4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3BtdS55
YW1sIHwgNiArKysrLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+ID4gPiBpbmRleCA3
M2I1NmZjNWJmNTguLmQ4ZTAzNzE2ZjVkMiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+ID4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwK
PiA+ID4gPiBAQCAtNTMsOCArNTMsMTAgQEAgcHJvcGVydGllczoKPiA+ID4gPiAgICAgICAgTGlz
dCBvZiBjbG9jayBuYW1lcyBmb3IgcGFydGljdWxhciBDTEtPVVQgbXV4IGlucHV0cwo+ID4gPiA+
ICAgICAgbWluSXRlbXM6IDEKPiA+ID4gPiAgICAgIG1heEl0ZW1zOiAzMgo+ID4gPiA+IC0gICAg
aXRlbXM6Cj4gPiA+ID4gLSAgICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwz
WzAtMV0pJCcKPiA+ID4gPiArICAgIGFsbE9mOgo+ID4gPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4g
PiA+ICsgICAgICAgICAgcGF0dGVybjogJ15jbGtvdXQoWzAtOV18WzEyXVswLTldfDNbMC0xXSkk
Jwo+ID4gPiA+ICsgICAgICAtIHVuaXF1ZUl0ZW1zOiB0cnVlCj4gPiA+Cj4gPiA+IFlvdSBzaG91
bGRuJ3QgbmVlZCB0aGUgJ2FsbE9mJywganVzdCBhZGQgdW5pcXVlSXRlbXMgYXQgdGhlIHNhbWUg
bGV2ZWwgYXMgaXRlbXMuCj4gPgo+ID4gSWYgeW91IG1lYW4gc29tZXRoaW5nIGxpa2U6Cj4gPiAg
IDU2ICAgICB1bmlxdWVJdGVtczogdHJ1ZQo+ID4gICA1NyAgICAgaXRlbXM6Cj4gPiAgIDU4ICAg
ICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwzWzAtMV0pJCcKPiA+Cj4gPiBU
aGVuIHRoZSBkdF9iaW5kaW5nX2NoZWNrIGZhaWxzOgo+ID4KPiA+IGRldi9saW51eC9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWw6IHByb3BlcnRp
ZXM6Y2xvY2stbmFtZXM6Cj4gPiAndW5pcXVlSXRlbXMnIGlzIG5vdCBvbmUgb2YgWyckcmVmJywg
J2FkZGl0aW9uYWxJdGVtcycsICdhZGRpdGlvbmFsUHJvcGVydGllcycsICdhbGxPZicsICdhbnlP
ZicsICdjb25zdCcsICdjb250YWlucycsICdkZWZhdWx0JywgJ2RlcGVuZGVuY2llcycsICdkZXBy
ZWNhdGVkJywgJ2Rlc2NyaXB0aW9uJywgJ2Vsc2UnLCAnZW51bScsICdpdGVtcycsICdpZicsICdt
aW5JdGVtcycsICdtaW5pbXVtJywgJ21heEl0ZW1zJywgJ21heGltdW0nLCAnbm90JywgJ29uZU9m
JywgJ3BhdHRlcm4nLCAncGF0dGVyblByb3BlcnRpZXMnLCAncHJvcGVydGllcycsICdyZXF1aXJl
ZCcsICd0aGVuJywgJ3R5cGUnLCAndHlwZVNpemUnLCAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJ10K
Pgo+IEkgY2FuIGFkZCBpdC4KPgo+IFRoZSBvdGhlciBvcHRpb24gaXMgdG8gZml4IHRoaXMgaW4g
dGhlIGNsb2NrIHNjaGVtYS4gSSdtIG5vdCBzdXJlIGlmCj4gdGhlcmUncyBhIG5lZWQgZm9yIGR1
cGxpY2F0ZSBjbG9jay1uYW1lcy4gU2VlbXMgdW5saWtlbHkuIEknbGwgdGVzdAo+IHRoYXQuCgpB
Y3R1YWxseSwgY2xvY2stbmFtZXMgaXMgYWxyZWFkeSBzZXQgdG8gYmUgdW5pcXVlLiBEaWQgeW91
IHNlZSBvdGhlcndpc2U/CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
