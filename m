Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9055DE8A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CF96E0E8;
	Wed,  3 Jul 2019 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E9C89A08
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:12:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62BC2JS031649;
 Tue, 2 Jul 2019 06:12:02 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62BC2Y0014936
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Jul 2019 06:12:02 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 06:12:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 06:12:01 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62BBxcv094660;
 Tue, 2 Jul 2019 06:11:59 -0500
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
 <20190702095849.fxlmiqcioihsi3zk@holly.lan>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <0a2c7f84-ea1f-cab2-c812-b5cefed1f517@ti.com>
Date: Tue, 2 Jul 2019 13:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702095849.fxlmiqcioihsi3zk@holly.lan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562065922;
 bh=+qyv7XjsTOTtMSTv+FRGxorhXPdAQbJcT2AcWylw+us=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KruCJmk6gwyvYxozPk/DrvwPNdrPFVBJUrxJvlr5ydC5nzONpEzDIh1dFUS0Zhvg6
 RaGzAypyplCy7u3VbGSE0ErOegEMJeg87pH1H0BryahZxqxZbaUA0PEM1feNfRTfiJ
 GfVck1+oeXvIFlA/V7m2jnH1QYBf7dXvBp5TsFZk=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsLAoKT24gMDIvMDcvMjAxOSAxMTo1OCwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9u
IE1vbiwgSnVsIDAxLCAyMDE5IGF0IDA1OjE0OjIzUE0gKzAyMDAsIEplYW4tSmFjcXVlcyBIaWJs
b3Qgd3JvdGU6Cj4+IEZyb206IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
Cj4+Cj4+IEFkZCBEVCBiaW5kaW5nIGZvciBsZWQtYmFja2xpZ2h0Lgo+IEkgdGhpbmsgdGhlIHBh
dGNoc2V0IGlzIGluIHRoZSB3cm9uZyBvcmRlcjsgdGhlIERUIGJpbmRpbmdzCj4gZG9jdW1lbnRh
dGlvbiBzaG91bGQgYXBwZWFyICpiZWZvcmUqIHRoZSBiaW5kaW5nIGlzCj4gaW1wbGVtZW50ZWQg
KGFtb3VuZyBvdGhlciB0aGluZ3MgdGhpcyBwcmV2ZW50IHRyYW5zaWVudCBjaGVja3BhdGNoCj4g
d2FybmluZ3MgYXMgdGhlIHBhdGNoc2V0IGlzIGFwcGxpZWQpLgo+Cm9rCj4+IFNpZ25lZC1vZmYt
Ynk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPj4gQ2M6IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnCj4+IC0tLQo+PiAgIC4uLi92aWRlby9iYWNrbGlnaHQvbGVkLWJh
Y2tsaWdodC50eHQgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQu
dHh0Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dmlkZW8vYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3ZpZGVvL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjIxNmNkNTJkNjI0YQo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRl
by9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKPj4gQEAgLTAsMCArMSwzOSBAQAo+PiArbGVk
LWJhY2tsaWdodCBiaW5kaW5ncwo+PiArCj4+ICtUaGUgbm9kZSBvZiB0aGUgYmFja2xpZ2h0IGRy
aXZlciBJUyB0aGUgbm9kZSBvZiB0aGUgTEVELgo+PiArCj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVz
Ogo+PiArICAtIGNvbXBhdGlibGU6ICJsZWQtYmFja2xpZ2h0Igo+PiArICAtIGJyaWdodG5lc3Mt
bGV2ZWxzOiBBcnJheSBvZiBkaXN0aW5jdCBMRUQgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZXNlCj4+
ICsgICAgICBhcmUgaW4gdGhlIHJhbmdlIGZyb20gMCB0byAyNTUsIHBhc3NlZCB0byB0aGUgTEVE
IGNsYXNzIGRyaXZlci4KPj4gKyAgLSBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWw6IHRoZSBkZWZh
dWx0IGJyaWdodG5lc3MgbGV2ZWwgKGluZGV4IGludG8gdGhlCj4+ICsgICAgICBhcnJheSBkZWZp
bmVkIGJ5IHRoZSAiYnJpZ2h0bmVzcy1sZXZlbHMiIHByb3BlcnR5KQo+IEkgdGhpbmsgYnJpZ2h0
bmVzcy1sZXZlbHMgYW5kIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCBjb3VsZCBiZQo+IG9wdGlv
bmFsIHByb3BlcnRpZXMgc2luY2UgYSBkZWZhdWx0IDE6MSBtYXBwaW5nIHNlZW1zIHJlYXNvbmFi
bGUgZ2l2ZW4KPiBob3cgY29uc3RyYWluZWQgdGhlIExFRCBicmlnaHRuZXNzIHZhbHVlcyBhcmUu
CgpUaGF0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLiBFeHBlY3QgaXQgaW4gdjIKClRoYW5rcywK
CkpKCgo+Cj4KPiBEYW5pZWwuCj4KPgo+PiArCj4+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+PiAr
ICAtIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIGZvciBzdXBwbHkgdm9sdGFnZQo+PiArICAtIGVu
YWJsZS1ncGlvczogY29udGFpbnMgYSBzaW5nbGUgR1BJTyBzcGVjaWZpZXIgZm9yIHRoZSBHUElP
IHdoaWNoIGVuYWJsZXMKPj4gKyAgICAgICAgICAgICAgICAgIGFuZCBkaXNhYmxlcyB0aGUgYmFj
a2xpZ2h0IChzZWUgR1BJTyBiaW5kaW5nWzBdKQo+PiArCj4+ICtbMF06IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8udHh0Cj4+ICsKPj4gK0V4YW1wbGU6Cj4+ICsK
Pj4gK2xlZF9jdHJsIHsKPj4gKwlyZWRfbGVkQDEgewo+PiArCSAgICAgICAgbGFiZWwgPSAicmVk
IjsKPj4gKwkJcmVnID0gPDE+Owo+PiArCX0KPj4gKwo+PiArCWJhY2tsaWdodF9sZWRAMiB7Cj4+
ICsJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0JBQ0tMSUdIVDsKPj4gKwkJcmVnID0gPDI+Owo+
PiArCj4+ICsJCWNvbXBhdGlibGUgPSAibGVkLWJhY2tsaWdodCI7Cj4+ICsKPj4gKwkJYnJpZ2h0
bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQgMTI4IDI1NT47Cj4+ICsJCWRlZmF1bHQtYnJp
Z2h0bmVzcy1sZXZlbCA9IDw2PjsKPj4gKwo+PiArCQlwb3dlci1zdXBwbHkgPSA8JnZkZF9ibF9y
ZWc+Owo+PiArCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8gNTggMD47Cj4+ICsJfTsKPj4gK307Cj4+
IC0tIAo+PiAyLjE3LjEKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
