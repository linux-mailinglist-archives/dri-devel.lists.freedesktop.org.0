Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61725C4B1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E1089D61;
	Mon,  1 Jul 2019 20:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8619689C17
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:21:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FLPgv080598;
 Mon, 1 Jul 2019 10:21:25 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FLPTr063483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 10:21:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:21:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:21:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FLOJ7014304;
 Mon, 1 Jul 2019 10:21:24 -0500
Subject: Re: [PATCH 2/4] devicetree: Update led binding
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
 <jingoohan1@gmail.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-3-jjhiblot@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <837afe49-18f3-722e-aa63-7d47d3a8bea0@ti.com>
Date: Mon, 1 Jul 2019 10:20:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701151423.30768-3-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561994485;
 bh=auzATPVyNKdOnTHoDAScy5Y6lvxrhGQU3UFJL70OEVY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=L/M6Ab2fDX4e9H3F84f3eLLiimlHMgKCY3PzYN1zgwNPWL7DSX+G/RkCOE5ayc/0f
 hCTOtBLBE91AzP8PJQFclbU4OaVFmPP030NXFx4SRHnXnNU5BQUbgAMAcdm+t+nJ4I
 RBNtJKDHyo3HF0BIGWgMNnxqvB0QfdZv7MGHakcY=
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SkoKCk9uIDcvMS8xOSAxMDoxNCBBTSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBVcGRh
dGUgdGhlIGxlZCBiaW5kaW5nIHRvIGRlc2NyaWJlIHRoZSBwb3NzaWJpbGl0eSB0byBhZGQgYSAi
Y29tcGF0aWJsZSIKPiBvcHRpb24gdG8gY3JlYXRlIGEgY2hpbGQtZGV2aWNlLCB1c2VyIG9mIHRo
ZSBMRUQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0
aS5jb20+Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0IHwgMyArKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAo+IGluZGV4IDcwODc2YWMxMTM2Ny4u
MmY3ODgyNTI4ZDk3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2NvbW1vbi50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbGVkcy9jb21tb24udHh0Cj4gQEAgLTExLDYgKzExLDkgQEAgaGF2ZSB0byBiZSB0aWdo
dGx5IGNvdXBsZWQgd2l0aCB0aGUgTEVEIGRldmljZSBiaW5kaW5nLiBUaGV5IGFyZSByZXByZXNl
bnRlZAo+ICAgYnkgY2hpbGQgbm9kZXMgb2YgdGhlIHBhcmVudCBMRUQgZGV2aWNlIGJpbmRpbmcu
Cj4gICAKPiAgIE9wdGlvbmFsIHByb3BlcnRpZXMgZm9yIGNoaWxkIG5vZGVzOgo+ICstIGNvbXBh
dGlibGUgOiBkcml2ZXIgbmFtZSBmb3IgYSBjaGlsZC1kZXZpY2UuIFRoaXMgY2hpbGQtZGV2aWNl
IGlzIHRoZSB1c2VyCj4gKyAgICAgICAgICAgICAgIG9mIHRoZSBMRUQuIEl0IGlzIGNyZWF0ZWQg
d2hlbiB0aGUgTEVEIGlzIHJlZ2lzdGVyZWQgYW5kCj4gKwkgICAgICAgZGVzdHJveWVkIHdoZW4g
dGhlIExFRCBpcyB1bnJlZ2lzdGVyZWQuCgpDYW4geW91IHVwZGF0ZSB0aGUgZXhhbXBsZSB0byBz
aG93IHVzYWdlPwoKRGFuCgoKPiAgIC0gbGVkLXNvdXJjZXMgOiBMaXN0IG9mIGRldmljZSBjdXJy
ZW50IG91dHB1dHMgdGhlIExFRCBpcyBjb25uZWN0ZWQgdG8uIFRoZQo+ICAgCQlvdXRwdXRzIGFy
ZSBpZGVudGlmaWVkIGJ5IHRoZSBudW1iZXJzIHRoYXQgbXVzdCBiZSBkZWZpbmVkCj4gICAJCWlu
IHRoZSBMRUQgZGV2aWNlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbi4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
