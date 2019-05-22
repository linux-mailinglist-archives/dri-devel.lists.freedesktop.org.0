Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27F26601
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4BB89B7B;
	Wed, 22 May 2019 14:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795F9895E2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 00:54:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4M0rrNi104919;
 Tue, 21 May 2019 19:53:53 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4M0rr6i049645
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2019 19:53:53 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 19:53:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 19:53:53 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4M0rq2m075698;
 Tue, 21 May 2019 19:53:52 -0500
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
To: Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring
 <robh+dt@kernel.org>
References: <20190520085846.22320-1-masneyb@onstation.org>
 <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
 <20190520133007.gymbonmq635gp73b@holly.lan>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <6bc54c69-0c7b-69e5-6dce-aef631e20247@ti.com>
Date: Tue, 21 May 2019 19:53:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520133007.gymbonmq635gp73b@holly.lan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558486433;
 bh=64tMQrAiwm3hei2eRN/7GchhSAwDNydo9l0KJu+r9+U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dF1ZqMn2aoGlrvNL4lHcpk79UeWJYebjo1j/YywbCyhukwMNBLotx+PDPNVeUNxzb
 mwM6HTEJZsHDJ2O8aXSG5G2tdmpfH2l5QcC6QDKbNzQJBDV8oX8BcHxZwL3Jf3duAn
 Ufi2WPfcCaskqh9SCCAiSNLL+j0OQvP3CCjaB9VY=
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
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzIwLzE5IDg6MzAgQU0sIERhbmllbCBUaG9tcHNvbiB3cm90ZToKPiBPbiBNb24sIE1h
eSAyMCwgMjAxOSBhdCAwODoxNDowM0FNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24g
TW9uLCBNYXkgMjAsIDIwMTkgYXQgMzo1OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0
aW9uLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gVGhlICcjYWRkcmVzcy1jZWxscycgYW5kICcjc2l6ZS1j
ZWxscycgcHJvcGVydGllcyB3ZXJlIG5vdCBkZWZpbmVkIGluCj4+PiB0aGUgbG0zNjMwYSBiaW5k
aW5ncyBhbmQgd291bGQgY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuCj4+PiBhdHRlbXB0
aW5nIHRvIHZhbGlkYXRlIHRoZSBleGFtcGxlcyBhZ2FpbnN0IHRoZSBzY2hlbWE6Cj4+Pgo+Pj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEt
YmFja2xpZ2h0LmV4YW1wbGUuZHQueWFtbDoKPj4+ICcjYWRkcmVzcy1jZWxscycsICcjc2l6ZS1j
ZWxscycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKPj4+ICdebGVkQFswMV0kJywg
J3BpbmN0cmwtWzAtOV0rJwo+Pj4KPj4+IENvcnJlY3QgdGhpcyBieSBhZGRpbmcgdGhvc2UgdHdv
IHByb3BlcnRpZXMuCj4+Pgo+Pj4gV2hpbGUgd2UncmUgaGVyZSwgbW92ZSB0aGUgdGksbGluZWFy
LW1hcHBpbmctbW9kZSBwcm9wZXJ0eSB0byB0aGUKPj4+IGxlZEBbMDFdIGNoaWxkIG5vZGVzIHRv
IGNvcnJlY3QgdGhlIGZvbGxvd2luZyB2YWxpZGF0aW9uIGVycm9yOgo+Pj4KPj4+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdo
dC5leGFtcGxlLmR0LnlhbWw6Cj4+PiBsZWRAMDogJ3RpLGxpbmVhci1tYXBwaW5nLW1vZGUnIGRv
ZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKPj4+ICdwaW5jdHJsLVswLTldKycKPj4+
Cj4+PiBGaXhlczogMzJmY2I3NWM2NmEwICgiZHQtYmluZGluZ3M6IGJhY2tsaWdodDogQWRkIGxt
MzYzMGEgYmluZGluZ3MiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+Cj4+PiBSZXBvcnRlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz4KPj4+IC0tLQo+Pj4gIC4uLi9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdo
dC55YW1sICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gCj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gCgpBY2tlZC1ieTogRGFuIE11cnBoeSA8ZG11
cnBoeUB0aS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
