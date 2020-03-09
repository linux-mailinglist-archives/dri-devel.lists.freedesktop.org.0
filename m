Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5E17D7F9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 02:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446216E0CA;
	Mon,  9 Mar 2020 01:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEA16E0CA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 01:53:47 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id k26so5066494vso.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QImbxmTkHKil1pvHr+BDxiJL2XLBZLzoyGW6wsTn3oQ=;
 b=aWYnmvWGdbntSuhyucIIAMxrZHkM4G5/Q9vbOmCQsekZAYHvr4Eog74dsXDkMYl2xD
 KvL1zeXKamlcuQTyyvQgkSKnT1gNRPF5uTVUa4a4fHcg/kx4VnHTixsNdroZ764sU1Uy
 +tKikHrHiZuRBXkYz+/Z8bBjwf8qxvraCz7gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QImbxmTkHKil1pvHr+BDxiJL2XLBZLzoyGW6wsTn3oQ=;
 b=YbboqpGWNRdnW9vaV7mjRWPY1NNq8H5DO4Z83lUdxEsv1Uzug0BHxLd6iGU2FCtpwG
 fxASQdW1c3u6PQgHYBN8CgGWafRFYgLncSpx5bJ1IVIUW46e8rfQd14BqvWYTmBzA/xh
 zedWqRj/B9udif2ZD2lKkAY0OIowdC8ROCFKFTpwDbBerIMkvphnjSd++ewH0+RgElYI
 I4oRn2zw7kBzBWfa8662aRa0pxIhoHIpjhDMClRmGfgUkeWy8Q6TZxQgeXr1j9qgTFNx
 Q9jvDQMwCnCg2X9+WVdMM0wVSsLrglCfy/4bnHrQXKEJ5IyL5nBrKh9kxbgjTOAOWi1T
 Ci0w==
X-Gm-Message-State: ANhLgQ0DBKXLYOHECLdr64JE0CFhjiyUqdYP6P5DUjhg5sV2Tjcu8XG0
 KVlPZXKnwLc/qUUOtSE+YsXmeE/PNo9xWhAARipR2w==
X-Google-Smtp-Source: ADFU+vvYsFjqtY5zn3zCc01nvvuQjne4/YR7CEb/r3521XiWmW+BqevLE59/BQHtNHTJV1ro52aTXPZEfqp1TtQdFWA=
X-Received: by 2002:a05:6102:9c7:: with SMTP id
 g7mr8614280vsi.186.1583718826912; 
 Sun, 08 Mar 2020 18:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
 <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
 <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
 <e4e95aa7713344e8b43fe5fad05de3ee@mtkmbs01n1.mediatek.inc>
In-Reply-To: <e4e95aa7713344e8b43fe5fad05de3ee@mtkmbs01n1.mediatek.inc>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 9 Mar 2020 09:53:35 +0800
Message-ID: <CANMq1KDmvxQdKHgyvQb6xChFX5UkBqPyQKXxuxGV70=p1=ezKw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: =?UTF-8?B?TmljayBGYW4gKOiMg+WTsue2rSk=?= <Nick.Fan@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?V2VpeWkgTHUgKOWRguWogeWEgCk=?= <Weiyi.Lu@mediatek.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9vcGluZyBiYWNrIG9uIHRoaXMsIGFmdGVyIGRpZ2dpbmcgYSBiaXQgZGVlcGVyLi4uCgpPbiBG
cmksIEZlYiAxNCwgMjAyMCBhdCA5OjM4IEFNIE5pY2sgRmFuICjojIPlk7Lntq0pIDxOaWNrLkZh
bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+IFtzbmlwXQo+ID4gPiBBbm90aGVyIHRoaW5nIHRoYXQg
SSdtIG5vdCBpbXBsZW1lbnRpbmcgaXMgdGhlIGRhbmNlIHRoYXQgTWVkaWF0ZWsKPiA+ID4gZG9l
cyBpbiB0aGVpciBrYmFzZSBkcml2ZXIgd2hlbiBjaGFuZ2luZyB0aGUgY2xvY2sgKGRlc2NyaWJl
ZCBpbgo+ID4gPiBwYXRjaAo+ID4gPiAyLzcpOgo+ID4gPiAiIgo+ID4gPiBUaGUgYmluZGluZyB3
ZSB1c2Ugd2l0aCBvdXQtb2YtdHJlZSBNYWxpIGRyaXZlcnMgaW5jbHVkZXMgbW9yZQo+ID4gPiBj
bG9ja3MsIHRoaXMgaXMgdXNlZCBmb3IgZGV2ZnJlcTogdGhlIG91dC1vZi10cmVlIGRyaXZlciBz
d2l0Y2hlcwo+ID4gPiBjbGtfbXV4IHRvIGNsa19zdWJfcGFyZW50ICgyNk1oeiksIGFkanVzdHMg
Y2xrX21haW5fcGFyZW50LCB0aGVuCj4gPiA+IHN3aXRjaGVzIGNsa19tdXggYmFjayB0byBjbGtf
bWFpbl9wYXJlbnQ6Cj4gPiA+IChzZWUKPiA+ID4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3Vy
Y2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvY2gKPiA+ID4gcm9tZW9zLTQu
MTkvZHJpdmVycy9ncHUvYXJtL21pZGdhcmQvcGxhdGZvcm0vbWVkaWF0ZWsvbWFsaV9rYmFzZV9y
dW4KPiA+ID4gdGltZV9wbS5jIzQyMykKPiA+ID4gY2xvY2tzID0KPiA+ID4gICAgICAgICA8JnRv
cGNrZ2VuIENMS19UT1BfTUZHUExMX0NLPiwKPiA+ID4gICAgICAgICA8JnRvcGNrZ2VuIENMS19U
T1BfTVVYX01GRz4sCj4gPiA+ICAgICAgICAgPCZjbGsyNm0+LAo+ID4gPiAgICAgICAgIDwmbWZn
Y2ZnIENMS19NRkdfQkczRD47Cj4gPiA+IGNsb2NrLW5hbWVzID0KPiA+ID4gICAgICAgICAiY2xr
X21haW5fcGFyZW50IiwKPiA+ID4gICAgICAgICAiY2xrX211eCIsCj4gPiA+ICAgICAgICAgImNs
a19zdWJfcGFyZW50IiwKPiA+ID4gICAgICAgICAic3Vic3lzX21mZ19jZyI7Cj4gPiA+ICIiCj4g
PiA+IElzIHRoZXJlIGEgY2xlYW4vc2ltcGxlIHdheSB0byBpbXBsZW1lbnQgdGhpcyBpbiB0aGUg
Y2xvY2sKPiA+ID4gZnJhbWV3b3JrL2RldmljZSB0cmVlPyBPciBzaG91bGQgd2UgaW1wbGVtZW50
IHNvbWV0aGluZyBpbiB0aGUKPiA+ID4gcGFuZnJvc3QgZHJpdmVyPwo+ID4KPiA+IFB1dHRpbmcg
cGFyZW50IGNsb2NrcyBpbnRvICdjbG9ja3MnIGZvciBhIGRldmljZSBpcyBhIHByZXR0eSBjb21t
b24KPiA+IGFidXNlLiBUaGUgJ2Fzc2lnbmVkLWNsb2NrcycgYmluZGluZyBpcyB3aGF0J3MgdXNl
ZCBmb3IgcGFyZW50IGNsb2NrCj4gPiBzZXR1cC4gTm90IHN1cmUgdGhhdCdzIGdvaW5nIHRvIGhl
bHAgaGVyZSB0aG91Z2guIElzIHRoaXMgZGFuY2UKPiA+IGJlY2F1c2UgdGhlIHBhcmVudCBjbG9j
ayBmcmVxdWVuY3kgY2FuJ3QgYmUgY2hhbmdlZCBjbGVhbmx5Pwo+Cj4gTmljay9XZWl5aSwgYW55
IGlkZWEgd2h5IHdlIGRvIHRoYXQgZGFuY2UgaW4gdGhlIGZpcnN0IHBsYWNlPyAobWF5YmUgdGhl
IFBMTCBjbG9jayBpcyB1bnN0YWJsZSB3aGlsZSBpdCdzIGJlaW5nIGNoYW5nZWQ/KQo+Cj4gQ2xv
Y2sgc291cmNlIG1heSBiZWNvbWUgdW5zdGFibGUgZHVyaW5nIGNsb2NrIGZyZXF1ZW5jeSBjaGFu
Z2VzLCBzbyBpdCBpcyBhbHdheXMgc2FmZXIgdG8gc3dpdGNoIHRvIGEgbW9yZSByZWxpYWJsZSBj
bG9jayBzb3VyY2UuCj4gT3RoZXJ3aXNlLCBpdCBtYXkgY2F1c2Ugc29tZSBwcm9ibGVtIGluIHNv
bWUgY29ybmVyIGNhc2UuCj4gSSB3b3VsZCBzdWdnZXN0IHRvIGtlZXAgaXQuCgpUaGUgTWVkaWF0
ZWsgQ1BVZnJlcSBkcml2ZXIgYWN0dWFsbHkgZG9lcyBhIHZlcnkgc2ltaWxhciBkYW5jZToKaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvY3B1ZnJl
cS9tZWRpYXRlay1jcHVmcmVxLmMjTDI0OQoKV2hhdCB0aGV5IGhhdmUgaW4gdGhlIGRldmljZSB0
cmVlIGlzIHRoZSBtYWluIGNsb2NrLCBhbmQgdGhlCiJpbnRlcm1lZGlhdGUiIGNsb2NrIHRoYXQg
aXMgcmVxdWlyZWQgZHVyaW5nIHN3aXRjaGluZzoKY2xvY2tzID0gPCZtY3VjZmcgQ0xLX01DVV9N
UDBfU0VMPiwgPCZ0b3Bja2dlbiBDTEtfVE9QX0FSTVBMTF9ESVZfUExMMT47CmNsb2NrLW5hbWVz
ID0gImNwdSIsICJpbnRlcm1lZGlhdGUiOwoKVGhlIHRvcG9sb2d5IGxvb2tzIGxpa2UgdGhpczoK
IGNsazI2bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE1ICAgICAgIDE1ICAgICAgICAx
ICAgIDI2MDAwMDAwCiAgICAgICAgMCAgICAgMCAgNTAwMDAKICAgIGFybXBsbF9sbCAgICAgICAg
ICAgICAgICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAxNDE3MDAwMDAwCiAgICAgICAg
MCAgICAgMCAgNTAwMDAKICAgICAgIG1jdV9tcDBfc2VsICAgICAgICAgICAgICAgICAgICAwICAg
ICAgICAwICAgICAgICAwICAxNDE3MDAwMDAwCiAgICAgICAgMCAgICAgMCAgNTAwMDAKCkFuZCBk
ZXZpY2UgdHJlZSBwcm92aWRlcyBtY3VfbXAwX3NlbCBhcyAiY3B1IiwgYW5kIHRoZSBhcm1wbGxf
ZGl2X3BsbDEKYXMgImludGVybWVkaWF0ZSIuCgpUaGUgZHJpdmVyIGxvb2tzIHVwIGFybXBsbF9s
bCBieSBjYWxsaW5nIGdldF9wYXJlbnQsIHRoZW46CiAtIHNldF9wYXJlbnQobWN1X21wMF9zZWws
IGFybXBsbF9kaXZfcGxsMSkKIC0gc2V0X3JhdGUoYXJtcGxsX2xsLCBuZXdfcmF0ZSkKIC0gc2V0
X3BhcmVudChtY3VfbXAwX3NlbCwgYXJtcGxsX2xsKQoKT24gTVQ4MTgzJ3MgR1BVLCB0aGUgdG9w
b2xvZ3kgaXMgYSBsaXR0bGUgYml0IG1vcmUgY29tcGxpY2F0ZWQgKGJ1dCBJCnRoaW5rIHRoZXJl
IHNob3VsZCBiZSBhIHdheSB0byBtZXJnZSBtZmdfYmczZCBhbiBtZmdfc2VsIGluIHRoZSBjbG9j
awpjb3JlKQogY2xrMjZtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTUgICAgICAgMTUg
ICAgICAgIDEgICAgMjYwMDAwMDAKICAgICAgICAwICAgICAwICA1MDAwMAogICAgbWZncGxsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA0MTk5OTk4MTcK
ICAgICAgICAwICAgICAwICA1MDAwMAogICAgICAgbWZncGxsX2NrICAgICAgICAgICAgICAgICAg
ICAgIDIgICAgICAgIDIgICAgICAgIDAgICA0MTk5OTk4MTcKICAgICAgICAwICAgICAwICA1MDAw
MAogICAgICAgICAgbWZnX3NlbCAgICAgICAgICAgICAgICAgICAgIDMgICAgICAgIDMgICAgICAg
IDAgICA0MTk5OTk4MTcKICAgICAgICAwICAgICAwICA1MDAwMAogICAgICAgICAgICAgbWZnX2Jn
M2QgICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA0MTk5OTk4MTcKICAgICAg
ICAwICAgICAwICA1MDAwMAoKV2UncmUgZ29pbmcgdG8gbmVlZCBhIHNwZWNpYWwgcGFuZnJvc3Qg
ZGV2ZnJlcSBkcml2ZXIgZm9yIG10ODE4Mwphbnl3YXkgKHRvIGhhbmRsZSB0aGUgMiByZWd1bGF0
b3JzKSwgc28gaXQgd291bGQgYmUgZWFzeSB0byB0YWtlIGEKc2ltaWxhciBhcHByb2FjaDoKIC0g
QWRkICJpbnRlcm1lZGlhdGUiIGNsb2NrIGluIHRoZSBkZXZpY2UgdHJlZSAoY2xrMjZtKQogLSBG
aW5kIG1mZ19zZWwvbWZncGxsX2NrIHVzaW5nIDEvMiBjbGtfZ2V0X3BhcmVudCBjYWxscy4KIC0g
U3dpdGNoIG1mZ19zZWwgdG8gY2xrMjZtLCBzZXQgbWZncGxsX2NrIHJhdGUsIHN3aXRjaCBtZmdf
c2VsIGJhY2sKdG8gbWZncGxsX2NrLgoKKEJUVywgSSB0cmllZCB0byBsb29rLCBhbmQgY291bGRu
J3QgZmluZCBleGFtcGxlcyBvciByZXBhcmVudGluZwpkdXJpbmcgY2xvY2sgY2hhbmdlcyBpbiBk
cml2ZXJzL2NsaywgYXJlIHRoZXJlIGV4aXN0aW5nIGRyaXZlcnMgZG9pbmcKc2ltaWxhciB0aGlu
Z3M/IE9yIHRoaXMgd291bGQgYmUgbmV3PykuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
