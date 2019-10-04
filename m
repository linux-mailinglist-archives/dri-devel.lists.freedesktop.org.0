Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41397CBFB7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 17:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742D16EBD7;
	Fri,  4 Oct 2019 15:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30006EBD7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 15:49:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94FnTC0127993;
 Fri, 4 Oct 2019 10:49:29 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94FnTru015563
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Oct 2019 10:49:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 10:49:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 10:49:28 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FnRPB101449;
 Fri, 4 Oct 2019 10:49:27 -0500
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
To: Lee Jones <lee.jones@linaro.org>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com> <20191004143900.GO18429@dell>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
Date: Fri, 4 Oct 2019 17:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004143900.GO18429@dell>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570204169;
 bh=K2QJeimlTTZ7Vlcc5fU4ztnPh1BdaHhigV1zt6llveQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MceddM7tVhfjnijXQPlzee+PrYIj5TQHXXmvtTimldCkYckgbzzD/IiSJNOjUB/F9
 HkX+Zo1wUIFsLeRFaMeaNPs/bMPknN7cLboOPdxB2YNLyapnjl3bA7qnvYBheq790+
 cRXhm6Xp7qPepLbuswiQDUYrMAtWTtTCWVCjy77E=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKT24gMDQvMTAvMjAxOSAxNjozOSwgTGVlIEpvbmVzIHdyb3RlOgo+IE9uIFdlZCwg
MTggU2VwIDIwMTksIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4KPj4gRnJvbTogVG9taSBW
YWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIGEg
bGVkLWJhY2tsaWdodCBkcml2ZXIgKGxlZF9ibCksIHdoaWNoIGlzIHNpbWlsYXIgdG8KPj4gcHdt
X2JsIGV4Y2VwdCB0aGUgZHJpdmVyIHVzZXMgYSBMRUQgY2xhc3MgZHJpdmVyIHRvIGFkanVzdCB0
aGUKPj4gYnJpZ2h0bmVzcyBpbiB0aGUgSFcuIE11bHRpcGxlIExFRHMgY2FuIGJlIHVzZWQgZm9y
IGEgc2luZ2xlIGJhY2tsaWdodC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhp
YmxvdCA8ampoaWJsb3RAdGkuY29tPgo+PiBBY2tlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1
Y3cuY3o+Cj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBs
aW5hcm8ub3JnPgo+PiAtLS0KPj4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnICB8
ICAgNyArCj4+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgfCAgIDEgKwo+PiAg
IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jIHwgMjYwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQsIDI2OCBpbnNlcnRpb25zKCspCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jCj4g
QXBwbGllZCwgdGhhbmtzLgoKSXQgd2lsbCBicmVhayB0aGUgYnVpbGQgYmVjYXVzZSBpdCByZWxp
ZXMgb24gZnVuY3Rpb25zIG5vdCB5ZXQgaW4gdGhlIApMRUQgY29yZSAoZGV2bV9sZWRfZ2V0KCkg
Zm9yIHY3IG9yIGRldm1fb2ZfbGVkX2dldCgpIGZvciB2OCkKCkpKCgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
