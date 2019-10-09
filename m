Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C6D0D2D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032906E978;
	Wed,  9 Oct 2019 10:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49D06E978
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:52:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Aq8Ax054543;
 Wed, 9 Oct 2019 05:52:08 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Aq8dN114672
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 05:52:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 05:52:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 05:52:08 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99Aq5Ig029117;
 Wed, 9 Oct 2019 05:52:06 -0500
Subject: Re: [PATCH v10 1/6] leds: populate the device's of_node
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <sre@kernel.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-2-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2291da29-22d4-0637-a711-07c480120be6@ti.com>
Date: Wed, 9 Oct 2019 13:52:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009085127.22843-2-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570618328;
 bh=ktaw6ZnLw43SX95dpH3rXIgCjNUTGzTpN+8L4m/vs/Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=X1yDGh7j+sP2kNWxJn5JnuCiiLGI3v4qBTGsbDfS0dsxdBrgiUCxVNcOU4FDs9oNw
 b7YWKBh40kM9kw/QPHp59SjF8371NF0L/e/N/Kl8dCqRhiFdPUmjfOImt2e6LloLed
 ot8oonamk3lff7E8XNCm8Xea7qPTaoa2qxR98STg=
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
Cc: dri-devel@lists.freedesktop.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSkosCgpPbiAwOS8xMC8yMDE5IDExOjUxLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+
IElmIGluaXRpYWxpemF0aW9uIGRhdGEgaXMgYXZhaWxhYmxlIGFuZCBpdHMgZndub2RlIGlzIGFj
dHVhbGx5IGEgb2Zfbm9kZSwKPiBzdG9yZSB0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBsZWQgZGV2
aWNlJ3Mgc3RydWN0dXJlLiBUaGlzIHdpbGwgYWxsb3cgdGhlCj4gZGV2aWNlIHRvIHVzZSBvciBw
cm92aWRlIE9GLWJhc2VkIEFQSSBzdWNoIChkZXZtX3h4eCkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtY2xh
c3MuYyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwo+IGluZGV4IDY0N2IxMjYzYzU3OS4uYmZh
MWIxMDMzMjc0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwo+ICsrKyBi
L2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwo+IEBAIC0yNzYsOCArMjc2LDEwIEBAIGludCBsZWRf
Y2xhc3NkZXZfcmVnaXN0ZXJfZXh0KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPiAgIAkJbXV0ZXhf
dW5sb2NrKCZsZWRfY2Rldi0+bGVkX2FjY2Vzcyk7Cj4gICAJCXJldHVybiBQVFJfRVJSKGxlZF9j
ZGV2LT5kZXYpOwo+ICAgCX0KPiAtCWlmIChpbml0X2RhdGEgJiYgaW5pdF9kYXRhLT5md25vZGUp
Cj4gKwlpZiAoaW5pdF9kYXRhICYmIGluaXRfZGF0YS0+Zndub2RlKSB7Cj4gICAJCWxlZF9jZGV2
LT5kZXYtPmZ3bm9kZSA9IGluaXRfZGF0YS0+Zndub2RlOwo+ICsJCWxlZF9jZGV2LT5kZXYtPm9m
X25vZGUgPSB0b19vZl9ub2RlKGluaXRfZGF0YS0+Zndub2RlKTsKPiArCX0KPiAgIAo+ICAgCWlm
IChyZXQpCj4gICAJCWRldl93YXJuKHBhcmVudCwgIkxlZCAlcyByZW5hbWVkIHRvICVzIGR1ZSB0
byBuYW1lIGNvbGxpc2lvbiIsCgpUaGlzIGRvZXNuJ3QgY29tcGlsZSwgYXMgaXQncyBtaXNzaW5n
ICNpbmNsdWRlIDxsaW51eC9vZi5oPiAod2hpY2ggeW91IAphZGQgaW4gdGhlIG5leHQgcGF0Y2gp
LgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0
dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtv
dGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
