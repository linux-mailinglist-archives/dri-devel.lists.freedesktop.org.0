Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55940CFC8C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89C6E7E2;
	Tue,  8 Oct 2019 14:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10C6E7E2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:38:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BE5F21835
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:38:27 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id n7so25626827qtb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:38:27 -0700 (PDT)
X-Gm-Message-State: APjAAAUj2vf25e8p4f+KWdhxFOuxypnQxdhgU4VKwEscqF4ekH7hnz2v
 5whj8zGq6TJhWfVf0wCzR7030cvpH8WFcNL/yg==
X-Google-Smtp-Source: APXvYqyTiDBKsgu4+AG5Pntyh3cdGaf1r6LnkyAMi4aS1suYyJJDpHx4CMSAkGYGBnyIWM7DQIrHIaFzaWMBtTBS7B8=
X-Received: by 2002:a05:6214:1590:: with SMTP id
 m16mr32958286qvw.20.1570545506528; 
 Tue, 08 Oct 2019 07:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
 <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
 <CAL_JsqKBzZCShxx99aB4z15XYNbUionVicmfNNXEfq=iohWLCA@mail.gmail.com>
 <20191008142900.GA2635@pi3>
In-Reply-To: <20191008142900.GA2635@pi3>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 09:38:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ObMD=inkMFqkZbKFoKZUxw53gUMnjsC1pU5GwumK8LQ@mail.gmail.com>
Message-ID: <CAL_Jsq+ObMD=inkMFqkZbKFoKZUxw53gUMnjsC1pU5GwumK8LQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570545507;
 bh=1Q4mMsOb96kylNfFxUq+jNGhofo0vA75cx96BsraELc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uHp1KfTNQWDdfSngQbG2a61L+AfiFcIuxX05zWvcMEkTqqrjwkoMahdNpPRCZmhIE
 tVQ3fNX1NmBrY9KHHIFaQ4zNPuZjGbiRB5ZesilRKdAOxL+BPAI1T/DOb0BmSvVELs
 1jc6/vhHbdHTBxIGs2mMmAIIDgK/7nDthGD7t1KQ=
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

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA5OjI5IEFNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOToxNzoxNkFN
IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgOTow
NSBBTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA3OjUwIEFNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBh
dCAwNzozODoxNEFNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwg
T2N0IDQsIDIwMTkgYXQgMTA6MTQgQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIGNsa291dE4gbmFtZXMgb2Yg
Y2xvY2tzIG11c3QgYmUgdW5pcXVlIGJlY2F1c2UgdGhleSByZXByZXNlbnQKPiA+ID4gPiA+ID4g
dW5pcXVlIGlucHV0cyBvZiBjbG9jayBtdWx0aXBsZXhlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbCB8IDYgKysrKy0tCj4gPiA+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9zYW1zdW5nL3BtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9zYW1zdW5nL3BtdS55YW1sCj4gPiA+ID4gPiA+IGluZGV4IDczYjU2ZmM1YmY1OC4uZDhlMDM3
MTZmNWQyIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3BtdS55YW1sCj4gPiA+ID4gPiA+
IEBAIC01Myw4ICs1MywxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gPiAgICAgICAgTGlzdCBv
ZiBjbG9jayBuYW1lcyBmb3IgcGFydGljdWxhciBDTEtPVVQgbXV4IGlucHV0cwo+ID4gPiA+ID4g
PiAgICAgIG1pbkl0ZW1zOiAxCj4gPiA+ID4gPiA+ICAgICAgbWF4SXRlbXM6IDMyCj4gPiA+ID4g
PiA+IC0gICAgaXRlbXM6Cj4gPiA+ID4gPiA+IC0gICAgICBwYXR0ZXJuOiAnXmNsa291dChbMC05
XXxbMTJdWzAtOV18M1swLTFdKSQnCj4gPiA+ID4gPiA+ICsgICAgYWxsT2Y6Cj4gPiA+ID4gPiA+
ICsgICAgICAtIGl0ZW1zOgo+ID4gPiA+ID4gPiArICAgICAgICAgIHBhdHRlcm46ICdeY2xrb3V0
KFswLTldfFsxMl1bMC05XXwzWzAtMV0pJCcKPiA+ID4gPiA+ID4gKyAgICAgIC0gdW5pcXVlSXRl
bXM6IHRydWUKPiA+ID4gPiA+Cj4gPiA+ID4gPiBZb3Ugc2hvdWxkbid0IG5lZWQgdGhlICdhbGxP
ZicsIGp1c3QgYWRkIHVuaXF1ZUl0ZW1zIGF0IHRoZSBzYW1lIGxldmVsIGFzIGl0ZW1zLgo+ID4g
PiA+Cj4gPiA+ID4gSWYgeW91IG1lYW4gc29tZXRoaW5nIGxpa2U6Cj4gPiA+ID4gICA1NiAgICAg
dW5pcXVlSXRlbXM6IHRydWUKPiA+ID4gPiAgIDU3ICAgICBpdGVtczoKPiA+ID4gPiAgIDU4ICAg
ICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwzWzAtMV0pJCcKPiA+ID4gPgo+
ID4gPiA+IFRoZW4gdGhlIGR0X2JpbmRpbmdfY2hlY2sgZmFpbHM6Cj4gPiA+ID4KPiA+ID4gPiBk
ZXYvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3Bt
dS55YW1sOiBwcm9wZXJ0aWVzOmNsb2NrLW5hbWVzOgo+ID4gPiA+ICd1bmlxdWVJdGVtcycgaXMg
bm90IG9uZSBvZiBbJyRyZWYnLCAnYWRkaXRpb25hbEl0ZW1zJywgJ2FkZGl0aW9uYWxQcm9wZXJ0
aWVzJywgJ2FsbE9mJywgJ2FueU9mJywgJ2NvbnN0JywgJ2NvbnRhaW5zJywgJ2RlZmF1bHQnLCAn
ZGVwZW5kZW5jaWVzJywgJ2RlcHJlY2F0ZWQnLCAnZGVzY3JpcHRpb24nLCAnZWxzZScsICdlbnVt
JywgJ2l0ZW1zJywgJ2lmJywgJ21pbkl0ZW1zJywgJ21pbmltdW0nLCAnbWF4SXRlbXMnLCAnbWF4
aW11bScsICdub3QnLCAnb25lT2YnLCAncGF0dGVybicsICdwYXR0ZXJuUHJvcGVydGllcycsICdw
cm9wZXJ0aWVzJywgJ3JlcXVpcmVkJywgJ3RoZW4nLCAndHlwZScsICd0eXBlU2l6ZScsICd1bmV2
YWx1YXRlZFByb3BlcnRpZXMnXQo+ID4gPgo+ID4gPiBJIGNhbiBhZGQgaXQuCj4gPiA+Cj4gPiA+
IFRoZSBvdGhlciBvcHRpb24gaXMgdG8gZml4IHRoaXMgaW4gdGhlIGNsb2NrIHNjaGVtYS4gSSdt
IG5vdCBzdXJlIGlmCj4gPiA+IHRoZXJlJ3MgYSBuZWVkIGZvciBkdXBsaWNhdGUgY2xvY2stbmFt
ZXMuIFNlZW1zIHVubGlrZWx5LiBJJ2xsIHRlc3QKPiA+ID4gdGhhdC4KPiA+Cj4gPiBBY3R1YWxs
eSwgY2xvY2stbmFtZXMgaXMgYWxyZWFkeSBzZXQgdG8gYmUgdW5pcXVlLiBEaWQgeW91IHNlZSBv
dGhlcndpc2U/Cj4KPiBZZWFoLCBJIGR1cGxpY2F0ZWQgb24gcHVycG9zZSAiY2xrb3V0MSIgYW5k
IGl0IHdhcyBub3QgcmVwb3J0ZWQgYXMgYW4KPiBlcnJvci4gVGhhdCdzIHdoeSBJIGFkZGVkICJ1
bmlxdWVJdGVtcyIuCgpBcmUgeW91IHJ1bm5pbmcgdXNpbmcgRFRfU0NIRU1BX0ZJTEVTPyBJZiBz
bywgeW91IHdvbid0IGdldCB0aGUgY29yZSBzY2hlbWEuCgpSb2IKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
