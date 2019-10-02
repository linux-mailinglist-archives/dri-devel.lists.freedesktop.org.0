Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F785C8A5B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84CB6E11C;
	Wed,  2 Oct 2019 13:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA289017
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 13:59:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Dwqcj111590;
 Wed, 2 Oct 2019 08:58:52 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Dwqja096089
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Oct 2019 08:58:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:58:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:58:51 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DwnDw091205;
 Wed, 2 Oct 2019 08:58:49 -0500
Subject: Re: [PATCH v7 1/5] leds: populate the device's of_node when possible
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-2-jjhiblot@ti.com>
 <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e9588e03-20d4-7e6d-e514-0b79dae12cce@ti.com>
Date: Wed, 2 Oct 2019 15:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f543e757-e000-6de4-694b-e75f388e5908@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570024732;
 bh=RaDMxu07D9M++yaf5vgHDeabPM3lihqxOYytrbBSUU0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=s4hfO8XBCPZmABJZKz9xLcLV1xumo+2UHZ2+aNDDakouuzaZaCbuwZMrUk437umz5
 vJJjNFUrEhcWyXN1MrOJc/+9swQCw5J872R3gux1SIxbhBacPPqfup96xK3T3tOE7e
 atmDEnMg2+05Cf54/a6FST1u/zcePHJ8aUvZfG2o=
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
Cc: dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjZWssCgpPbiAyNC8wOS8yMDE5IDIzOjAzLCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOgo+
IEhpIEplYW4sCj4KPiBUaGFuayB5b3UgZm9yIHJlYmFzaW5nIHRoZSBzZXQKPgo+IE9uIDkvMTgv
MTkgNDo1NyBQTSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4gSWYgaW5pdGlhbGl6YXRp
b24gZGF0YSBpcyBhdmFpbGFibGUgYW5kIGl0cyBmd25vZGUgaXMgYWN0dWFsbHkgYSBvZl9ub2Rl
LAo+PiBzdG9yZSB0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBsZWQgZGV2aWNlJ3Mgc3RydWN0dXJl
LiBUaGlzIHdpbGwgYWxsb3cgdGhlCj4+IGRldmljZSB0byB1c2Ugb3IgcHJvdmlkZSBPRi1iYXNl
ZCBBUEkgc3VjaCAoZGV2bV94eHgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMg
SGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbGVkcy9sZWQtY2xh
c3MuYyB8IDUgKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgYi9k
cml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMKPj4gaW5kZXggNjQ3YjEyNjNjNTc5Li5jMjE2N2I2NmI2
MWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwo+PiArKysgYi9kcml2
ZXJzL2xlZHMvbGVkLWNsYXNzLmMKPj4gQEAgLTI3Niw4ICsyNzYsMTEgQEAgaW50IGxlZF9jbGFz
c2Rldl9yZWdpc3Rlcl9leHQoc3RydWN0IGRldmljZSAqcGFyZW50LAo+PiAgIAkJbXV0ZXhfdW5s
b2NrKCZsZWRfY2Rldi0+bGVkX2FjY2Vzcyk7Cj4+ICAgCQlyZXR1cm4gUFRSX0VSUihsZWRfY2Rl
di0+ZGV2KTsKPj4gICAJfQo+PiAtCWlmIChpbml0X2RhdGEgJiYgaW5pdF9kYXRhLT5md25vZGUp
Cj4+ICsJaWYgKGluaXRfZGF0YSAmJiBpbml0X2RhdGEtPmZ3bm9kZSkgewo+PiAgIAkJbGVkX2Nk
ZXYtPmRldi0+Zndub2RlID0gaW5pdF9kYXRhLT5md25vZGU7Cj4+ICsJCWlmIChpc19vZl9ub2Rl
KGluaXRfZGF0YS0+Zndub2RlKSkKPj4gKwkJCWxlZF9jZGV2LT5kZXYtPm9mX25vZGUgPSB0b19v
Zl9ub2RlKGluaXRfZGF0YS0+Zndub2RlKTsKPiBJdCB3b3VsZCBiZSBzdGVwIGJhY2t3YXJkcy4g
WW91IGNhbiBkbyB0aGUgY29udmVyc2lvbiBpbiB0aGUgcGxhY2Ugb2YKPiB1c2UgaS5lLiBpbiBk
ZXZtX2xlZF9nZXQoKS4KCkNvdWxkIGJlIGRvbmUuIEJ1dCBpdCB3b3VsZCBicmVhayBhbm90aGVy
IHVzZSBjYXNlIEkgaGF2ZS4gSSdtIGFsc28gCndvcmtpbmcgb24gdGhlIHJlZ3VsYXRvciBzdXBw
b3J0IGFuZCBmb3IgdGhpcyBvbmUsIG9mX25vZGUgbmVlZHMgdG8gYmUgCnBvcHVsYXRlZC4KCklz
IHRoZXJlIGEgcHJvYmxlbSBwb3B1bGF0aW5nIG9mX25vZGUgaWYgdGhlIExFRCBpcyBpbmRlZWQg
ZGVzY3JpYmVkIGluIAp0aGUgRFQgPwoKSkoKCj4KPj4gKwl9Cj4+ICAgCj4+ICAgCWlmIChyZXQp
Cj4+ICAgCQlkZXZfd2FybihwYXJlbnQsICJMZWQgJXMgcmVuYW1lZCB0byAlcyBkdWUgdG8gbmFt
ZSBjb2xsaXNpb24iLAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
