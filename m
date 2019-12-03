Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81610F7DE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 07:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370AB6E3A0;
	Tue,  3 Dec 2019 06:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632D6E3A0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 06:38:18 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id x1so2424853iop.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 22:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wpTQKnkngieuqXuzL7uZpLiKACy2LcoAuQquti9jps=;
 b=CCMV61LE7A3QlxClrVXhKGmc7IgwPtZ82fsa2uibX1Wh7leNFy4+mpDDMkejT+eE8v
 5k1PREoPUlCVm6dDjHvTrD07RSDvvfrKyH5++YZ0qR0tM1oyr7RGFbZyb9S8y7Nf5Uho
 XtUHDAia5oUDYlao5LDk7btx04ohl728s63DQ6YfDXaRnyulb3lDIEvLISxlj/sYY8CZ
 ztG7zw/YfO33LabBqRpIdsfkaiu1tENL7pmeRqCJPPPZAWv3D5Xhn4JdK77WkzvoplaK
 DQs+7iADteXDX9scLYZZFneDaPLwVtCw8Vd03iMNe2sGqD6B9FL7K6DrApWXYRDP9JTr
 tUhw==
X-Gm-Message-State: APjAAAXAhm1qCTLByhLMzZoDQ9WVxu5vI5cvJkwfWzBesJw0AOfjKmqw
 eo/Z+NOaKzW+7gxzebvUjpOrl5U7ZwQmDK2O1Qpyl294SEk=
X-Google-Smtp-Source: APXvYqzw5MRI9bLbpC8aBKtEMr/lv/4bW1UrRcpCmyT5f0lq7NP3QUXl7E1sr2Kqyin1ufYe3yt6t3462BRba831Hcg=
X-Received: by 2002:a5d:804e:: with SMTP id b14mr1170073ior.77.1575355097154; 
 Mon, 02 Dec 2019 22:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
 <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
 <20191029085401.gvqpwmmpyml75vis@hendrix>
 <CAMty3ZAWPZSHtAZDf_0Dpx588YGGv3pJX1cXMfkZus3+WF94cA@mail.gmail.com>
 <20191103173227.GF7001@gilmour>
 <CAMty3ZD5uxU=xb0z7PWaXzodYbWRJkP9HjGX-HZYFT4bwk0GOg@mail.gmail.com>
 <20191122181820.GQ4345@gilmour.lan>
 <CAMty3ZDePC=B-DgfCcjRhJTeciwZmSEU-c4u1=sN_Hs0RgbC7Q@mail.gmail.com>
 <20191128175134.kcgtylfo4ax6ifz7@gilmour.lan>
In-Reply-To: <20191128175134.kcgtylfo4ax6ifz7@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 3 Dec 2019 12:08:06 +0530
Message-ID: <CAMty3ZBBkAk3==9u9XS3utms8GZD-5wPKu1WSR3byh5h-tY8aw@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
To: Maxime Ripard <maxime@cerno.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=+wpTQKnkngieuqXuzL7uZpLiKACy2LcoAuQquti9jps=;
 b=NbCUwlhamyMm8r7AOBEKPKTnKIR8a03HSnFaFm5T29JB6EoEHzTfUYuqeWVTovEJuR
 PEi7n0RtUBpm5MP+F4XmS8zG/MtaaUPC4wP/N8wkWP+6nC5rZS1IdlTcS+wAa/1hrZO1
 UZDjYdywaEr0Jq66vc3clKK8ZF6mQZ1KuGSP8=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMTE6MjEgUE0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNl
cm5vLnRlY2g+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3YgMjMsIDIwMTkgYXQgMDE6MjA6MjFBTSAr
MDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+ID4gPiBQbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhp
cyBzbmlwcGV0LCBJIGhhdmUgdXNlZCB5b3VyIHNlY29uZAo+ID4gPiA+IHN1Z2dlc3Rpb25zLiBs
ZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgY29tbWVudHM/Cj4gPiA+ID4KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiA+ID4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCj4gPiA+ID4gaW5kZXggOGZh
OTBjZmMyYWM4Li45MWM5NWU1NmQ4NzAgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4gPiA+IEBAIC0xMTA5LDI0ICsxMTA5LDM2IEBAIHN0
YXRpYyBpbnQgc3VuNmlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
PiA+ID4gICAgICAgICAgcmV0dXJuIFBUUl9FUlIoZHNpLT5yZWd1bGF0b3IpOwo+ID4gPiA+ICAg
ICAgfQo+ID4gPiA+Cj4gPiA+ID4gLSAgICBkc2ktPnJlZ3MgPSBkZXZtX3JlZ21hcF9pbml0X21t
aW9fY2xrKGRldiwgImJ1cyIsIGJhc2UsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnN1bjZpX2RzaV9yZWdtYXBfY29uZmlnKTsKPiA+ID4gPiAtICAgIGlmIChJU19FUlIoZHNp
LT5yZWdzKSkgewo+ID4gPiA+IC0gICAgICAgIGRldl9lcnIoZGV2LCAiQ291bGRuJ3QgY3JlYXRl
IHRoZSBEU0kgZW5jb2RlciByZWdtYXBcbiIpOwo+ID4gPiA+IC0gICAgICAgIHJldHVybiBQVFJf
RVJSKGRzaS0+cmVncyk7Cj4gPiA+ID4gLSAgICB9Cj4gPiA+ID4gLQo+ID4gPiA+ICAgICAgZHNp
LT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfc2hhcmVkKGRldiwgTlVMTCk7Cj4gPiA+
ID4gICAgICBpZiAoSVNfRVJSKGRzaS0+cmVzZXQpKSB7Cj4gPiA+ID4gICAgICAgICAgZGV2X2Vy
cihkZXYsICJDb3VsZG4ndCBnZXQgb3VyIHJlc2V0IGxpbmVcbiIpOwo+ID4gPiA+ICAgICAgICAg
IHJldHVybiBQVFJfRVJSKGRzaS0+cmVzZXQpOwo+ID4gPiA+ICAgICAgfQo+ID4gPiA+Cj4gPiA+
ID4gKyAgICBkc2ktPnJlZ3MgPSByZWdtYXBfaW5pdF9tbWlvKGRldiwgYmFzZSwgJnN1bjZpX2Rz
aV9yZWdtYXBfY29uZmlnKTsKPiA+ID4KPiA+ID4gWW91IHNob3VsZCB1c2UgdGhlIGRldm0gdmFy
aWFudCBoZXJlCj4gPgo+ID4gU3VyZS4KPiA+Cj4gPiA+Cj4gPiA+ID4gKyAgICBpZiAoSVNfRVJS
KGRzaS0+cmVncykpIHsKPiA+ID4gPiArICAgICAgICBkZXZfZXJyKGRldiwgIkNvdWxkbid0IGlu
aXQgcmVnbWFwXG4iKTsKPiA+ID4gPiArICAgICAgICByZXR1cm4gUFRSX0VSUihkc2ktPnJlZ3Mp
Owo+ID4gPiA+ICsgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgIGRzaS0+YnVzX2NsayA9IGRl
dm1fY2xrX2dldChkZXYsIE5VTEwpOwo+ID4gPgo+ID4gPiBJIGd1ZXNzIHlvdSBzdGlsbCBuZWVk
IHRvIHBhc3MgJ2J1cycgaGVyZT8KPiA+Cj4gPiBCdXQgdGhlIGlkZWEgaGVyZSBpcyBub3QgdG8g
c3BlY2lmeSBjbG9jayBuYW1lIGV4cGxpY2l0bHkgdG8gc3VwcG9ydAo+ID4gQTY0LiBvdGhlcndp
c2UgQTY0IHdvdWxkIGZhaWwgYXMgd2UgYXJlIG5vdCBzcGVjaWZ5aW5nIHRoZSBjbG9jay1uYW1l
cwo+ID4gZXhwbGljaXRseSBvbiBkc2kgbm9kZS4KPgo+IFJpZ2h0LiBCdXQgeW91IGhhdmUgbm8g
Z3VhcmFudGVlIHRoYXQgdGhlIGJ1cyBjbG9jayBpcyBnb2luZyB0byBiZSB0aGUKPiBmaXJzdCBv
bmUgb24gdGhlIG90aGVyIFNvQ3MgZWl0aGVyLgo+Cj4gV2hhdCBhYm91dCBzb21ldGhpbmcgbGlr
ZSB0aGF0IGluc3RlYWQ6Cj4KPiBjaGFyICpjbGtfbmFtZSA9IE5VTEw7Cj4gaWYgKGRzaS0+aGFz
X21vZF9jbGspCj4gICAgIGNsa19uYW1lID0gImJ1cyI7Cj4KPiBjbGsgPSBkZXZtX2Nsa19nZXQo
ZGV2LCBjbGtfbmFtZSk7Cj4gaWYgKElTX0VSUihjbGspKQo+ICAgICByZXR1cm4gUFRSX0VSUihj
bGspKTsKPgo+IHJlZ21hcF9tbWlvX2F0dGFjaF9jbGsocmVnbWFwLCBjbGspOwoKVGhpcyBtYWtl
cyBzZW5zZSwgdGhhbmtzIGZvciB5b3VyIGlucHV0LiBJIGhhdmUgdGVzdGVkIGluIEEzMywgQTY0
LgoKPgo+ID4KPiA+IGRzaTogZHNpQDFjYTAwMDAgewo+ID4gICAgICAgIGNvbXBhdGlibGUgPSAi
YWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kiOwo+ID4gICAgICAgIHJlZyA9IDwweDAxY2Ew
MDAwIDB4MTAwMD47Cj4gPiAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDg5IElSUV9UWVBF
X0xFVkVMX0hJR0g+Owo+ID4gICAgICAgIGNsb2NrcyA9IDwmY2N1IENMS19CVVNfTUlQSV9EU0k+
Owo+ID4gICAgICAgIHJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+Owo+ID4gICAgICAg
cGh5cyA9IDwmZHBoeT47Cj4gPiAgICAgICBwaHktbmFtZXMgPSAiZHBoeSI7Cj4gPiAuLi4uLgo+
ID4gfTsKPiA+Cj4gPiA+Cj4gPiA+ID4gKyAgICBpZiAoSVNfRVJSKGRzaS0+YnVzX2NsaykpIHsK
PiA+ID4gPiArICAgICAgICBkZXZfZXJyKGRldiwgIkNvdWxkbid0IGdldCB0aGUgRFNJIGJ1cyBj
bG9ja1xuIik7Cj4gPiA+ID4gKyAgICAgICAgcmV0ID0gUFRSX0VSUihkc2ktPmJ1c19jbGspOwo+
ID4gPiA+ICsgICAgICAgIGdvdG8gZXJyX3JlZ21hcDsKPiA+ID4gPiArICAgIH0gZWxzZSB7Cj4g
PiA+ID4gKyAgICAgICAgcHJpbnRrKCJKYWdhbi4uIEdvdCB0aGUgQlVTIGNsb2NrXG4iKTsKPiA+
ID4gPiArICAgICAgICByZXQgPSByZWdtYXBfbW1pb19hdHRhY2hfY2xrKGRzaS0+cmVncywgZHNp
LT5idXNfY2xrKTsKPiA+ID4gPiArICAgICAgICBpZiAocmV0KQo+ID4gPiA+ICsgICAgICAgICAg
ICBnb3RvIGVycl9idXNfY2xrOwo+ID4gPiA+ICsgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiAgICAg
IGlmIChkc2ktPnZhcmlhbnQtPmhhc19tb2RfY2xrKSB7Cj4gPiA+ID4gICAgICAgICAgZHNpLT5t
b2RfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgIm1vZCIpOwo+ID4gPiA+ICAgICAgICAgIGlmIChJ
U19FUlIoZHNpLT5tb2RfY2xrKSkgewo+ID4gPiA+ICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IkNvdWxkbid0IGdldCB0aGUgRFNJIG1vZCBjbG9ja1xuIik7Cj4gPiA+ID4gLSAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKGRzaS0+bW9kX2Nsayk7Cj4gPiA+ID4gKyAgICAgICAgICAgIHJldCA9
IFBUUl9FUlIoZHNpLT5tb2RfY2xrKTsKPiA+ID4gPiArICAgICAgICAgICAgZ290byBlcnJfYXR0
YWNoX2NsazsKPiA+ID4gPiAgICAgICAgICB9Cj4gPiA+ID4gICAgICB9Cj4gPiA+ID4KPiA+ID4g
PiBAQCAtMTE2Nyw2ICsxMTc5LDE0IEBAIHN0YXRpYyBpbnQgc3VuNmlfZHNpX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gIGVycl91bnByb3RlY3RfY2xrOgo+ID4g
PiA+ICAgICAgaWYgKGRzaS0+dmFyaWFudC0+aGFzX21vZF9jbGspCj4gPiA+ID4gICAgICAgICAg
Y2xrX3JhdGVfZXhjbHVzaXZlX3B1dChkc2ktPm1vZF9jbGspOwo+ID4gPiA+ICtlcnJfYXR0YWNo
X2NsazoKPiA+ID4gPiArICAgIGlmICghSVNfRVJSKGRzaS0+YnVzX2NsaykpCj4gPiA+ID4gKyAg
ICAgICAgcmVnbWFwX21taW9fZGV0YWNoX2Nsayhkc2ktPnJlZ3MpOwo+ID4gPiA+ICtlcnJfYnVz
X2NsazoKPiA+ID4gPiArICAgIGlmICghSVNfRVJSKGRzaS0+YnVzX2NsaykpCj4gPiA+ID4gKyAg
ICAgICAgY2xrX3B1dChkc2ktPmJ1c19jbGspOwo+ID4gPiA+ICtlcnJfcmVnbWFwOgo+ID4gPiA+
ICsgICAgcmVnbWFwX2V4aXQoZHNpLT5yZWdzKTsKPiA+ID4gPiAgICAgIHJldHVybiByZXQ7Cj4g
PiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+IEBAIC0xMTgxLDYgKzEyMDEsMTMgQEAgc3RhdGljIGlu
dCBzdW42aV9kc2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4g
ICAgICBpZiAoZHNpLT52YXJpYW50LT5oYXNfbW9kX2NsaykKPiA+ID4gPiAgICAgICAgICBjbGtf
cmF0ZV9leGNsdXNpdmVfcHV0KGRzaS0+bW9kX2Nsayk7Cj4gPiA+ID4KPiA+ID4gPiArICAgIGlm
ICghSVNfRVJSKGRzaS0+YnVzX2NsaykpIHsKPiA+ID4gPiArICAgICAgICByZWdtYXBfbW1pb19k
ZXRhY2hfY2xrKGRzaS0+cmVncyk7Cj4gPiA+ID4gKyAgICAgICAgY2xrX3B1dChkc2ktPmJ1c19j
bGspOwo+ID4gPgo+ID4gPiBUaGlzIHdpbGwgdHJpZ2dlciBhIHdhcm5pbmcsIHlvdSBwdXQgZG93
biB0aGUgcmVmZXJlbmNlIHR3aWNlCj4gPgo+ID4gWW91IG1lYW4gcmVnbWFwX21taW9fZGV0YWNo
X2NsayB3aWxsIHB1dCB0aGUgY2xrPwo+Cj4gTm8sIGRldm1fY2xrX2dldCB3aWxsLgoKR290IGl0
LiBXaWxsIHVwZGF0ZSBhbmQgc2VuZCB2MTIuCgpKYWdhbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
