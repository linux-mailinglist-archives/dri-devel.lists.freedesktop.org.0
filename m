Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3EB358F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AC46E84C;
	Mon, 16 Sep 2019 07:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD24F6F3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 14:06:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DE6Q4g085351;
 Fri, 13 Sep 2019 09:06:26 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DE6QNb056725
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Sep 2019 09:06:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 09:06:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 09:06:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DE6PlR112383;
 Fri, 13 Sep 2019 09:06:25 -0500
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To: Andreas Kemnade <andreas@kemnade.info>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
 <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b6d9fa2c-c23b-7310-e192-cff6185a72b1@ti.com>
Date: Fri, 13 Sep 2019 09:06:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568383586;
 bh=rF+4FIKlVSHlEEHXf6QhcIJo8Cxci4JVbaPWe8BeTLU=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Fau/Eh2RkxT2FjWYINFwq5ybCkEMljIcv/34t118YnCLwX7NW6QTXF//tC0XsvuEr
 ql/gd1dKIh53WiL5srBH0sxo3Qs8zcVuJMZqTC6/VIniqVf/Vtcwz5ixYYq2M1tRyu
 v+sIGtV0rhH7HozaZPTqdhqoMy2Py9vWLbZS3o5w=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhcwoKT24gOS8xMi8xOSA0OjMyIFBNLCBBbmRyZWFzIEtlbW5hZGUgd3JvdGU6Cj4gYWRk
IGVuYWJsZS1ncGlvcyB0byBkZXNjcmliZSBIV0VOIHBpbgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KPiBBY2tlZC1ieTogRGFuaWVsIFRo
b21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBEYW4gTXVy
cGh5IDxkbXVycGh5QHRpLmNvbT4KCgo+IC0tLQo+IGNoYW5nZXMgaW4gdjI6IGFkZGVkIGV4YW1w
bGUKPiBjaGFuZ2VzIGluIHYzOiBhZGRlZCBBY2tlZC1ieQo+IGNoYW5nZXMgaW4gdjQ6IG1vdmVk
IGVuYWJsZS1ncGlvcyB0byB0aGUgcmlnaHQgcG9zaXRpb24KPiAgICBpbiB0aGUgZXhhbXBsZQo+
ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwgICAg
ICAgICAgIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2ts
aWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKPiBpbmRleCBkYzEy
OWQ5YTMyOWUuLmM4NDcwNjI4ZmUwMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2
MzBhLWJhY2tsaWdodC55YW1sCj4gQEAgLTI5LDYgKzI5LDEwIEBAIHByb3BlcnRpZXM6Cj4gICAg
ICcjc2l6ZS1jZWxscyc6Cj4gICAgICAgY29uc3Q6IDAKPiAgIAo+ICsgIGVuYWJsZS1ncGlvczoK
PiArICAgIGRlc2NyaXB0aW9uOiBHUElPIHRvIHVzZSB0byBlbmFibGUvZGlzYWJsZSB0aGUgYmFj
a2xpZ2h0IChIV0VOIHBpbikuCj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAgIHJlcXVpcmVkOgo+
ICAgICAtIGNvbXBhdGlibGUKPiAgICAgLSByZWcKPiBAQCAtOTYsNiArMTAwLDcgQEAgZXhhbXBs
ZXM6Cj4gICAgICAgICAgIGxlZC1jb250cm9sbGVyQDM4IHsKPiAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInRpLGxtMzYzMGEiOwo+ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDM4
PjsKPiArICAgICAgICAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3BpbzIgNSBHUElPX0FDVElW
RV9ISUdIPjsKPiAgIAo+ICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
ICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
