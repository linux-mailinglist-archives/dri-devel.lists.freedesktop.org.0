Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4EA345C16
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAFA89EAC;
	Tue, 23 Mar 2021 10:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A469889E32
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:42:34 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so12014323pjh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oMvMOVIe+KU4qjnJSB+FFaD+jlcKrEz6x5eQRXRwwRI=;
 b=vfDRr9dLtgwajRZGiE6ZTC+K+UbG3v8Bjrr35GBxq491Aiq80BSsEOv/TLmKhLI2RP
 fhrx+2/V1r779BvbKgOQTcrgv5syb6qISCe50pZyKExoBQF3tFhhDFBzYiCcI2FnfEZy
 4NCNaK72KZ+PihDt5FlcIVRqVJ4VOlTjnG3cU1mW4j5+3kfZ9ghPPZGxFCxAhc8wDy3K
 etgt8Bh38ixtJnPyGKEuy99WvyLARXYYdoM37RbzYClLwywgeD7P6Nuf5XAGm+CmX9zR
 DHY6xtOuVPRdwvPV0fBlr2wrD3PZ4rGHamjZe5t30mZhj/0kZVTXspdT58nC+2JGyWSJ
 Ecjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oMvMOVIe+KU4qjnJSB+FFaD+jlcKrEz6x5eQRXRwwRI=;
 b=TGwtlaS/Y58QDxR6jPyiyERmldbgOcaeo/0DmjefbOu+rQgiRXzZQFnS1Ba7G0Ai4J
 x9uLf7E85vIjDrX1q61DxFRd1z6n7kTmAeT+NKmfxmIADhlCF7oosWDFTlTLN1x7204O
 1PGCGarloHRpsCw+uTZCuIsbhFfIfgN9q3z+kMNaj55oF08fV5euOuN0IVJKNh0QCFkH
 JZZTji9OpUCcIABxOXJrETvVNS5P6hseBln/6hOw/BuIgvEEiEvLT+67gjZF2XbD6E7a
 xUg585pF+0xWGulTaZ817HiD97nqDJDulGpEmrEWtpWJGjVeTA1IJsgrSF6B6uylsp97
 cNMQ==
X-Gm-Message-State: AOAM531D1n6D1Y1Xb6s1dh7tS0lEcY9JKJITSRrJaC9Ok9aymfs5TaOc
 kwMEuMLYCn2/1Bj4ka4KWQwB2XQHMwcOSr8pppMdnw==
X-Google-Smtp-Source: ABdhPJzRh+arBWIbSBRi7xCksNcb/8or1R21ANpA1lUfvc8SPGjzUr89S/mzolqQ2jQU+cBUiIU1E0XmrwmFbQduOtk=
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr4016666pjs.75.1616496154215; 
 Tue, 23 Mar 2021 03:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210308120555.252524-1-adrien.grassein@gmail.com>
 <20210308120555.252524-3-adrien.grassein@gmail.com>
 <CAG3jFytoE9hWvq2e2Caqn4qP_RuEOnm4r9VQ85ffbAcguSLf+w@mail.gmail.com>
 <CABkfQAGvPy3DzXQnDJqm1q_rOLWR7BQTXb8z05iML3s3Mc8LJw@mail.gmail.com>
In-Reply-To: <CABkfQAGvPy3DzXQnDJqm1q_rOLWR7BQTXb8z05iML3s3Mc8LJw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Mar 2021 11:42:23 +0100
Message-ID: <CAG3jFytmJSjvWp0Bu7MaJ7EVuJov8gbs6cguatoOtTJpXTGVLA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Introduce LT8912B DSI to HDMI bridge
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBNYXIgMjAyMSBhdCAxMTowMSwgQWRyaWVuIEdyYXNzZWluIDxhZHJpZW4uZ3Jh
c3NlaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEhleSBSb2JlcnQsCj4KPiBUaGFua3MgZm9yIHRo
ZSB1cGRhdGUuCj4KPiBMZSBtYXIuIDIzIG1hcnMgMjAyMSDDoCAxMDoxMCwgUm9iZXJ0IEZvc3Mg
PHJvYmVydC5mb3NzQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPiA+Cj4gPiBIZXkgQWRyaWVuLAo+
ID4KPiA+IFNvcnJ5IGFib3V0IHRoZSBzbG93IHJlcGx5LCBidXQgSSBqdXN0IHJlY2VpdmVkIHRo
ZSBkb2N1bWVudGF0aW9uIGZyb20KPiA+IHRoZSB2ZW5kb3IuIFNvIGxldCdzIGRpZyBpbiB0byB0
aGUgSFBEIGlzc3VlLgo+Cj4gTm8gcHJvYmxlbSA6KQo+ID4KPiA+ID4gK3N0YXRpYyBlbnVtIGRy
bV9jb25uZWN0b3Jfc3RhdHVzIGx0ODkxMl9jaGVja19jYWJsZV9zdGF0dXMoc3RydWN0IGx0ODkx
MiAqbHQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgaW50IHJldDsKPiA+ID4gKyAgICAgICB1bnNp
Z25lZCBpbnQgcmVnX3ZhbDsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldCA9IHJlZ21hcF9yZWFk
KGx0LT5yZWdtYXBbSTJDX01BSU5dLCAweEMxLCAmcmVnX3ZhbCk7Cj4gPiA+ICsgICAgICAgaWYg
KHJldCkKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBjb25uZWN0b3Jfc3RhdHVzX3Vua25v
d247Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAocmVnX3ZhbCAmIEJJVCg3KSkKPiA+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsKPiA+Cj4gPiBS
ZWdpc3RlciAweGMwICYgQklUKDcpIC0gSFBEIHNpZ25hbCBhZnRlciBkZWJvdW5jZQo+ID4gUmVn
aXN0ZXIgMHhjMCAmIEJJVCg2KSAtIEhQRCBzaWduYWwgZm9yIFRYIEhQRCBwYWQKPgo+IFNvLCBp
ZiBJIHVuZGVyc3RhbmQgd2VsbCwgSSBuZWVkIHRvIHdyaXRlIDB4YzAgJiBCSVQoNikgd2l0aCAx
IHRvCj4gZW5hYmxlIHRoZSBIUEQgcGluLgoKQWgsIHNvcnJ5IGFib3V0IGJlaW5nIGEgYml0IHRl
cnNlLgoKQm90aCBiaXQgNiAmIDcgYXJlIHJlYWQgb25seSwgYW5kIGFyZSBwcm9iYWJseSBiZXN0
IHJlYWQgYWZ0ZXIgYW4gSVJRLgoKPiA+Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgbHQ4OTEy
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gPiA+ICsgICAgICAgIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBzdGF0aWMgc3Ry
dWN0IGx0ODkxMiAqbHQ7Cj4gPiA+ICsgICAgICAgaW50IHJldCA9IDA7Cj4gPiA+ICsgICAgICAg
c3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Owo+ID4gPiArCj4gPiA+ICsgICAgICAg
bHQgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0IGx0ODkxMiksIEdGUF9LRVJORUwp
Owo+ID4gPiArICAgICAgIGlmICghbHQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGx0LT5kZXYgPSBkZXY7Cj4gPiA+ICsgICAgICAg
bHQtPmkyY19jbGllbnRbMF0gPSBjbGllbnQ7Cj4gPiA+ICsgICAgICAgbHQtPmNhYmxlX3N0YXR1
cyA9IGNvbm5lY3Rvcl9zdGF0dXNfdW5rbm93bjsKPiA+ID4gKyAgICAgICBsdC0+d29ya3EgPSBj
cmVhdGVfd29ya3F1ZXVlKCJsdDg5MTJfd29ya3EiKTsKPiA+Cj4gPiBMb29raW5nIGF0IFsxXSBh
bmQgbWF5YmUgZXZlbiBiZXR0ZXIgWzJdLCBJIHRoaW5rIHRoaXMgcG9sbGluZwo+ID4gYXBwcm9h
Y2ggaXMgdGhlIHdyb25nIHdheSB0byBnby4gQW5kIHdpdGggYWNjZXNzIHRvIGRvY3VtZW50YXRp
b24sIEkKPiA+IHRoaW5rIHdlIHNob3VsZCBiZSBhYmxlIHRvIHNvcnQgdGhpcyBvdXQuCj4KPiBJ
IG5laXRoZXIgbGlrZSB0aGUgcG9sbGluZyBhcHByb2FjaCB0b28uIEkgZGlkIGl0IHRvIGdvIG9u
IHRoaXMgaXNzdWUuCj4gSSB3aWxsIHRvdGFsbHkgcmVtb3ZlIGl0IG9uY2UgdGhlIEhQRCBpc3N1
ZSB3aWxsIGJlIHJlc29sdmVkLgo+ID4KPiA+IFVzaW5nIHRoZSBpcnEgZHJpdmVyIGFwcHJvYWNo
IHJlcXVpcmVzIHRoZSBpbnRlcnJ1cHQgcGluIHRvIGJlCj4gPiBjb25maWd1cmVkLiBQaW4gNjMg
b2YgdGhlIGx0ODkxMmIgaXMgdGhlIElSUSBvdXRwdXQgcGluLgo+ID4KPiA+IEluIG9yZGVyIHRv
IHRyaWdnZXIgaW50ZXJydXB0cyBiYXNlZCBvbiBpdCwgdGhlIGR0LWJpbmRpbmcgd291bGQgbmVl
ZAo+ID4gdG8gYmUgdXBkYXRlZFszXVs0XSBhcyB3ZWxsIGFzIHdoaWNoZXZlciBEVFMgeW91J3Jl
IHVzaW5nLgo+ID4KPgo+IFRoZSBJUlEgcGFydCBpcyB3b3JraW5nIHdlbGwgaW4gbXkgRFRCLiBJ
dCB0ZXN0IGl0IGJ5IGFkZGluZyBzb21lCj4gZWxlY3Ryb25pY3MgdG8gZW11bGF0ZSB0aGUgSFBE
IHBpbiBvbiB0aGUgR1BJTyBleHBhbmRlciB3aGVyZSB0aGUgSFBECj4gcGluIGlzIGxpbmtlZC4K
Ckxvb2tpbmcgYXQgdGhlIGR0LWJpbmRpbmcgcGF0Y2gsIGl0IGRvZXMgbm90IHNlZW0gdG8gbGlz
dCBhbnkKaW50ZXJydXB0cy4gU28gdGhhdCBzaG91bGQgYmUgYWRkZWQuIEkgdGhpbmsgdGhlIGly
cSBzdXBwb3J0IGZyb20gWzNdCiYgWzRdIGNhbiBiZSBwcmV0dHkgbXVjaCBjb3BpZWQuCgpUaGVu
IHdlIGNhbiBjb21lIGJhY2sgYW5kIHJlcGxhY2UgdGhlIHBvbGxpbmcgY29kZSB3aXRoIHRoZSBJ
UlEgZHJpdmVuCmNvZGUgZnJvbSBbMl0uCgo+Cj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4L2FueDc2MjUuYyNMMTc1MQo+ID4KPiA+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvYmxvYi92NS4xMS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5NjEx
LmMjTDExNjAKPiA+Cj4gPiBbM10gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvdjUuMTEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2xvbnRpdW0sbHQ5NjExLnlhbWwjTDI3Cj4gPgo+ID4gWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iL3Y1LjExL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9sb250aXVtLGx0OTYxMS55YW1sI0wxNDQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
