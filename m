Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7692104AB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622816E822;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2545189E08
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 09:00:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05U903vZ093413;
 Tue, 30 Jun 2020 04:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593507603;
 bh=0HQcsWAVWf3W2shwVfdnWwI1iQ57DD5fcjRBXcqcjFA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t/F4Y9mz2e0EHQnkCHsvLyZAPFsmdc2DskZt3ySis6nDHjwJQwyzUSaw9iHAFpe7G
 WLLBbQxj157MQVFkmtXYSZpR4gGMeBvZuQWwi9qh4y3ZL1tuTtjgGwj8qWqIF7EQjL
 Wm6IFKsWuEBWGI+x+rlrknX17PwHJTyaY3CW0Vxs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05U902UX116084
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jun 2020 04:00:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 30
 Jun 2020 04:00:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 30 Jun 2020 04:00:02 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05U8xw6f084990;
 Tue, 30 Jun 2020 03:59:58 -0500
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
Date: Tue, 30 Jun 2020 11:59:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDI5LzA2LzIwMjAgMTQ6MjgsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gSGkgR3J5Z29y
aWksCj4gCj4gKC4uLikKPiAKPj4+ICDCoCAvKgo+Pj4gIMKgwqAgKiBkZWZlcnJlZF9kZXZzX3No
b3coKSAtIFNob3cgdGhlIGRldmljZXMgaW4gdGhlIGRlZmVycmVkIHByb2JlCj4+PiBwZW5kaW5n
IGxpc3QuCj4+PiAgwqDCoCAqLwo+Pj4gQEAgLTIyMSw3ICsyNDEsOCBAQCBzdGF0aWMgaW50IGRl
ZmVycmVkX2RldnNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsCj4+PiB2b2lkICpkYXRhKQo+Pj4g
IMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmZGVmZXJyZWRfcHJvYmVfbXV0ZXgpOwo+Pj4gIMKgIMKg
wqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShjdXJyLCAmZGVmZXJyZWRfcHJvYmVfcGVuZGlu
Z19saXN0LAo+Pj4gZGVmZXJyZWRfcHJvYmUpCj4+PiAtwqDCoMKgwqDCoMKgwqAgc2VxX3ByaW50
ZihzLCAiJXNcbiIsIGRldl9uYW1lKGN1cnItPmRldmljZSkpOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHNlcV9wcmludGYocywgIiVzXHQlcyIsIGRldl9uYW1lKGN1cnItPmRldmljZSksCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJyLT5kZXZpY2UtPnAtPmRlZmVycmVkX3Byb2Jl
X3JlYXNvbiA/OiAiXG4iKTsKPj4+ICDCoCDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmZGVmZXJy
ZWRfcHJvYmVfbXV0ZXgpOwo+Pj4KPj4KPj4gU3J5LCBtYXkgYmUgaSBtaXNzaW5nIHNtdGgsIGJ1
dCBzaG91bGRuJ3QgaXQgYmUgb3B0aW9uYWwKPj4gKENPTkZJR19ERUJVR19GUyBpcyBwcm9iYWJs
eSB0b28gZ2VuZXJpYykuCj4+Cj4gCj4gSSBhbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgYXJlIHlv
dSByZWZlcnJpbmcgdG8sIGJ1dCB0aGlzIHBhdGNoIGRvZXMgbm90Cj4gYWRkIG5ldyBwcm9wZXJ0
eSwgaXQganVzdCBleHRlbmRzIGZ1bmN0aW9uYWxpdHkgb2YgZXhpc3Rpbmcgb25lLgoKU3J5LCBu
ZWVkZWQgdG8gYmUgbW9yZSBzcGVjaWZpYy4KCllvdSd2ZSBhZGRlZCAgZGV2aWNlX3NldF9kZWZl
cnJlZF9wcm9iZV9yZXNvbihkZXYsICZ2YWYpOwp3aGljaCBleHBlY3RlZCB0byBiZSB1c2VkIG9u
IGV2ZXJ5IEVQUk9CRV9ERUZFUiBpbiBkZXZfZXJyX3Byb2JlKCkgaW4gY29tYmluYXRpb24gd2l0
aAoKKyAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAgZGV2aWNlX3NldF9kZWZlcnJlZF9w
cm9iZV9yZXNvbihkZXYsICZ2YWYpOwogICAgICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAiZXJy
b3IgJWQ6ICVwViIsIGVyciwgJnZhZik7CgpeXiBkZXZfZGJnKCkgZG9lcyBub3QgYWRkIGFueSBy
dW50aW1lIG92ZXJoZWFkIGR1cmluZyBib290IHVubGVzcyBlbmFibGVkCisgICAgICAgfQoKQnV0
OgoKK3ZvaWQgZGV2aWNlX3NldF9kZWZlcnJlZF9wcm9iZV9yZXNvbihjb25zdCBzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCB2YV9mb3JtYXQgKnZhZikKK3sKKyAgICAgICBjb25zdCBjaGFyICpk
cnYgPSBkZXZfZHJpdmVyX3N0cmluZyhkZXYpOworCisgICAgICAgbXV0ZXhfbG9jaygmZGVmZXJy
ZWRfcHJvYmVfbXV0ZXgpOworCisgICAgICAga2ZyZWUoZGV2LT5wLT5kZWZlcnJlZF9wcm9iZV9y
ZWFzb24pOworICAgICAgIGRldi0+cC0+ZGVmZXJyZWRfcHJvYmVfcmVhc29uID0ga2FzcHJpbnRm
KEdGUF9LRVJORUwsICIlczogJXBWIiwgZHJ2LCB2YWYpOworCisgICAgICAgbXV0ZXhfdW5sb2Nr
KCZkZWZlcnJlZF9wcm9iZV9tdXRleCk7Cit9CgpeXiBBZGRzIGxvY2tpbmcsIGtmcmVlKCkgYW5k
IGthc3ByaW50ZigpIGZvciBldmVyeSBkZWZlcnJlZCBwcm9iZSBkdXJpbmcgYm9vdCBhbmQgY2Fu
J3QgYmUgZGlzYWJsZWQuCgpSaWdodD8KCgotLSAKQmVzdCByZWdhcmRzLApncnlnb3JpaQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
