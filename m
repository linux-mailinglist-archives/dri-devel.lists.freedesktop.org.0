Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6307C352
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ED189E11;
	Wed, 31 Jul 2019 13:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124D189E11
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:23:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VDNAlG080355;
 Wed, 31 Jul 2019 08:23:10 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VDNAhi048603
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Jul 2019 08:23:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 08:23:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 08:23:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VDN720083249;
 Wed, 31 Jul 2019 08:23:08 -0500
Subject: Re: [PATCH v4 2/4] leds: Add managed API to get a LED from a device
 driver
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <lee.jones@linaro.org>, <daniel.thompson@linaro.org>,
 <jingoohan1@gmail.com>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <20190717141514.21171-3-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <94bdabf4-0922-5016-ed96-9916ed6bda9d@ti.com>
Date: Wed, 31 Jul 2019 16:23:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141514.21171-3-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564579390;
 bh=0fUgRNTdr1H1z9bwTUX3/k1AsGS3eKBtv0BltL7AUXU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZfCkNYHwDcVMQFgdZ6MOFeaj3KK7HpxBfPeP4ixWJ8+pnkRx8TtUIZvKtYM+Ijs+8
 avV1JIDdTM52t8tytAKP8XzvbFGRA50+0RJQboZnPnCYcKUTHVejPZZ/698H0Arf77
 8aYY/E8fs9IEUBn0lXpcuFkennebLTmbC3cDfBNU=
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

T24gMTcvMDcvMjAxOSAxNzoxNSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKCj4gK3N0cnVj
dCBsZWRfY2xhc3NkZXYgKl9fbXVzdF9jaGVjayBkZXZtX2xlZF9nZXQoc3RydWN0IGRldmljZSAq
ZGV2LAo+ICsJCQkJCSAgICAgICBpbnQgaW5kZXgpCj4gK3sKPiArCXN0cnVjdCBsZWRfY2xhc3Nk
ZXYgKmxlZDsKPiArCXN0cnVjdCBsZWRfY2xhc3NkZXYgKipkcjsKPiArCgpTaG91bGQgeW91IGNo
ZWNrIGhlcmUgaWYgZGV2LT5vZl9ub2RlID09IE5VTEw/IE9yIHNob3VsZCBvZl9sZWRfZ2V0KCkg
CmNoZWNrIGl0LgoKPiArCWxlZCA9IG9mX2xlZF9nZXQoZGV2LT5vZl9ub2RlLCBpbmRleCk7Cj4g
KwlpZiAoSVNfRVJSKGxlZCkpCj4gKwkJcmV0dXJuIGxlZDsKPiArCj4gKwlkciA9IGRldnJlc19h
bGxvYyhkZXZtX2xlZF9yZWxlYXNlLCBzaXplb2Yoc3RydWN0IGxlZF9jbGFzc2RldiAqKSwKPiAr
CQkJICBHRlBfS0VSTkVMKTsKPiArCWlmICghZHIpIHsKPiArCQlsZWRfcHV0KGxlZCk7Cj4gKwkJ
cmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gKwl9Cj4gKwo+ICsJKmRyID0gbGVkOwo+ICsJZGV2
cmVzX2FkZChkZXYsIGRyKTsKPiArCj4gKwlyZXR1cm4gbGVkOwo+ICt9CgogIFRvbWkKCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
