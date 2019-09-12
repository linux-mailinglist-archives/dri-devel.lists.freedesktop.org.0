Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6D5B18D2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604F6EE95;
	Fri, 13 Sep 2019 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56406ED9A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 15:03:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CF3Aah046587;
 Thu, 12 Sep 2019 10:03:10 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CF3A4B029511
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Sep 2019 10:03:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 10:03:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 10:03:09 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CF39dk069556;
 Thu, 12 Sep 2019 10:03:09 -0500
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
To: Andreas Kemnade <andreas@kemnade.info>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-2-andreas@kemnade.info>
 <ff410d6c-e1e8-7c96-e8f7-0a0deb816f6a@ti.com>
 <20190912165808.3c38b7a2@kemnade.info>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <5c8d25ab-e780-4e60-9723-cd65553f4db3@ti.com>
Date: Thu, 12 Sep 2019 10:03:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912165808.3c38b7a2@kemnade.info>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568300590;
 bh=eju7yvlhMevpk8GMIglQpXBV9N/M17eV4ISPBCjwU3g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kofTgmSdQLex18tsgcah0ZbTuO/uSmNQEQaKu1CsVKhJD9woALdPBt0Zuwfuqe3ea
 /UdLDlUEJScXMRjUencauLX5F5YcouKRhw3dsEmRd4V/729PJKFPxHcCd7h3piz31p
 igneibNxmUgJPpXVu1e2WzW5E9sGWzFqRP+0P/kA=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhcwoKT24gOS8xMi8xOSA5OjU4IEFNLCBBbmRyZWFzIEtlbW5hZGUgd3JvdGU6Cj4gT24g
VGh1LCAxMiBTZXAgMjAxOSAwNjozOTo1MCAtMDUwMAo+IERhbiBNdXJwaHkgPGRtdXJwaHlAdGku
Y29tPiB3cm90ZToKPgo+PiBBbmRyZWFzCj4+Cj4+IE9uIDkvMTEvMTkgMTI6MjEgUE0sIEFuZHJl
YXMgS2VtbmFkZSB3cm90ZToKPj4+IGFkZCBlbmFibGUtZ3Bpb3MgdG8gZGVzY3JpYmUgSFdFTiBw
aW4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFk
ZS5pbmZvPgo+Pj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+Cj4+PiAtLS0KPj4+IGNoYW5nZXMgaW4gdjI6IGFkZGVkIGV4YW1wbGUKPj4+IGNo
YW5nZXMgaW4gdjM6IGFkZGVkIEFja2VkLWJ5Cj4+PiAgICAuLi4vYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAgICAgICAgfCA1ICsrKysrCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2ts
aWdodC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xp
Z2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKPj4+IGluZGV4IGRjMTI5ZDlhMzI5ZS4uMWZhODNm
ZWZmZTE2IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdo
dC55YW1sCj4+PiBAQCAtMjksNiArMjksMTAgQEAgcHJvcGVydGllczoKPj4+ICAgICAgJyNzaXpl
LWNlbGxzJzoKPj4+ICAgICAgICBjb25zdDogMAo+Pj4gICAgCj4+PiArICBlbmFibGUtZ3Bpb3M6
Cj4+PiArICAgIGRlc2NyaXB0aW9uOiBHUElPIHRvIHVzZSB0byBlbmFibGUvZGlzYWJsZSB0aGUg
YmFja2xpZ2h0IChIV0VOIHBpbikuCj4+PiArICAgIG1heEl0ZW1zOiAxCj4+PiArCj4+PiAgICBy
ZXF1aXJlZDoKPj4+ICAgICAgLSBjb21wYXRpYmxlCj4+PiAgICAgIC0gcmVnCj4+PiBAQCAtOTIs
NiArOTYsNyBAQCBleGFtcGxlczoKPj4+ICAgICAgICBpMmMgewo+Pj4gICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPj4+ICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4+PiAr
ICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8yIDUgR1BJT19BQ1RJVkVfSElHSD47Cj4+PiAg
ICAKPj4+ICAgICAgICAgICAgbGVkLWNvbnRyb2xsZXJAMzggewo+Pj4gICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidGksbG0zNjMwYSI7Cj4+IExvb2tzIGdvb2QgdG8gbWUKPj4KPiB3
ZWxsLCB0aGUgZW5hYmxlLWdwaW9zIGlzIHN0aWxsIGF0IHRoZSBzYW1lIHBsYWNlIGFzIGluIHYy
LiBUaGlzIHdhcyBzZW50Cj4gYmVmb3JlIHlvdXIgY29tbWVudHMgdG8gdjIgaGF2ZSBiZWVuIGFy
cml2ZWQuCgpBaCBJIG92ZXJsb29rZWQgdGhhdC7CoCBZZWFoIHRoYXQgc3RpbGwgbmVlZHMgdG8g
bW92ZSBJIGFzc3VtZWQgeW91IG1vdmVkIGl0LgoKRGFuCgoKPiBSZWdhcmRzLAo+IEFuZHJlYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
