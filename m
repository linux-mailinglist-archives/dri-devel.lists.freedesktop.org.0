Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC12810CDBC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 18:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137956E86C;
	Thu, 28 Nov 2019 17:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866136E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 17:23:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xASHNs1O077580;
 Thu, 28 Nov 2019 11:23:54 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xASHNsg2049108
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Nov 2019 11:23:54 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 11:23:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 11:23:54 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASHNq5A090527;
 Thu, 28 Nov 2019 11:23:52 -0600
Subject: Re: [PATCH 1/2] dt-bindings: display: DT schema for
 rocktech,rk101ii01d-ct panel
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <cover.1574959312.git.jsarha@ti.com>
 <bc69f06adb9e5e590ae58bdb47717699a0b404ff.1574959312.git.jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2cd39857-5f26-69a5-03e6-8caac22fa3c1@ti.com>
Date: Thu, 28 Nov 2019 19:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bc69f06adb9e5e590ae58bdb47717699a0b404ff.1574959312.git.jsarha@ti.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574961834;
 bh=fyEEhFLEkTE4uBbbeJVnSZXAYziqOvTgN4t84uXZRts=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=ewv75zbWlE5kUNQw0f+BwIc/iapupiTDo4GrO3NF/yWS1lrj9+O7T1CDYkXVVV+q4
 U0B35hT/HZpjhQOO2Y74H6aMWDwLgEjkPncUDqYdzf7uySN8S3kFnyfPBS+ufggz88
 kMsam50RtonfluZTk554HYM2uEg5HlGlH8G5PW7g=
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com, robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMTEvMjAxOSAxODo0NSwgSnlyaSBTYXJoYSB3cm90ZToKPiBBZGQgRFQgc2NoZW1hIGJp
bmRpbmcgZm9yIFJvY2t0ZWNoIERpc3BsYXlzIExpbWl0ZWQgUksxMDFJSTAxRC1DVAo+IDEwLjEi
IFRGVCAxMjgweDgwMCBQaXhlbHMgd2l0aCBMVkRTIGludGVyZmFjZSwgTEVEIEJhY2tsaWdodCBh
bmQKPiBjYXBhY2l0aXZlIHRvdWNoIHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2Fy
aGEgPGpzYXJoYUB0aS5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLHJr
MTAxaWkwMWQtY3QueWFtbCB8IDQ4ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQ4IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3Qu
eWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxyazEwMWlpMDFkLWN0LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxyazEwMWlpMDFkLWN0
LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDljYWVl
ZTg3MDFkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFtbAo+IEBAIC0w
LDAgKzEsNDggQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNE
LTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwjCkFyZ2gsIGF0
IGxlYXN0IG9uZSBjb3B5LXBhc3RlIGVycm9yIGhlcmU6ICAgICAgICAgIF5eXl5eXl5eXl5eXl5e
Xl5eXl5eXgoKU28gbm90IHRvIGJlIGFwcGxpZWQgYXMgc3VjaC4KCkJSLApKeXJpCgovbWUgd29u
ZGVycyB3aHkgaGUgYWx3YXlzIHNlZXMgdGhlc2Ugb25seSByaWdodCBhZnRlciBzZW5kaW5nIHRo
ZSBwYXRjaC4KCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFJvY2t0ZWNoIERpc3BsYXlzIEx0ZCBSSzEwMUlJMDFE
LUNUIDEwLjEiIFRGVCAxMjgweDgwMCBQaXhlbHMKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0g
SnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiArICAtIFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+Cj4gKwo+ICthbGxPZjoKPiArICAtICRyZWY6IHBhbmVsLWNvbW1v
bi55YW1sIwo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBSb2NrdGVjaCBEaXNwbGF5cyBMaW1p
dGVkIFJLMTAxSUkwMUQtQ1QgMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscwo+ICsgIHdpdGggTFZE
UyBpbnRlcmZhY2UsIExFRCBCYWNrbGlnaHQgYW5kIGNhcGFjaXRpdmUgdG91Y2ggcGFuZWwuIEZv
cgo+ICsgIHRvdWNoIHNjcmVlbiBkZXRhaWxzIHNlZSAiZ29vZGl4LGd0OTI4IiBpbjoKPiArICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4
LnR4dAo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHJv
Y2t0ZWNoLHJrMTAxaWkwMWQtY3QKPiArCj4gKyAgcmVzZXQtZ3Bpb3M6IHRydWUKPiArICBlbmFi
bGUtZ3Bpb3M6IHRydWUKPiArICBiYWNrbGlnaHQ6IHRydWUKPiArICBwb3J0OiB0cnVlCj4gKwo+
ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHBvd2VyLXN1cHBseQo+ICsKPiAr
ZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAgICAgZGlzcGxheTAgewo+ICsgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJyb2NrdGVjaCxyazEwMWlpMDFkLWN0IjsKPiArICAgICAgICAgICAg
ICAgIGJhY2tsaWdodCA9IDwmbGNkX2JsPjsKPiArICAgICAgICAgICAgICAgIGVuYWJsZS1ncGlv
cyA9IDwmcGNhOTU1NSA4IEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsgICAgICAgICAgICAgICAgcG93
ZXItc3VwcGx5ID0gPCZkdW1teV9zdXBwbHk+Owo+ICsKPiArICAgICAgICAgICAgICAgIHBvcnQg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICBsY2RfaW4wOiBlbmRwb2ludCB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZvbGRpX291dDA+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAgICAgfTsKPiAr
ICAgICAgICB9Owo+IAoKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2Fs
YW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEt
NC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
