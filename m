Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A16708F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4D96E0AC;
	Fri, 12 Jul 2019 13:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ADB6E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 13:52:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CDqd9i084341;
 Fri, 12 Jul 2019 08:52:39 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CDqd3F094482
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jul 2019 08:52:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Jul 2019 08:52:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Jul 2019 08:52:39 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CDqabN012751;
 Fri, 12 Jul 2019 08:52:37 -0500
Subject: Re: [PATCH v3 1/4] leds: Add of_led_get() and led_put()
To: Pavel Machek <pavel@ucw.cz>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-2-jjhiblot@ti.com> <20190710190949.GA22995@amd>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <da911df6-876e-802e-2953-5293b01789f7@ti.com>
Date: Fri, 12 Jul 2019 15:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710190949.GA22995@amd>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562939559;
 bh=meFXgNrWFMAJFlDbssv3deEMf3ehyrCBz7/CcuE5Iis=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i638SYldqyQVmOzdQj9fgCo6Ip9tBbbaugPy7+4iWUJX+5FD2/OnPE+WB8Tu4m5X1
 xm8U+xfWBVHzJRSfXkikGu/PLMWx4kNyb/kN0ancSag5/jNuepDwKQopHubhAZGCPI
 H8kxSwtZomlLTNq7YGRiBNcJW00QF5TkMCN5AYjw=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkgUGF2ZWwKCk9uIDEwLzA3LzIwMTkgMjE6MDksIFBhdmVsIE1hY2hlayB3cm90ZToKPiBPbiBX
ZWQgMjAxOS0wNy0xMCAxNDozOToyOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4gRnJv
bTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4KPj4gVGhpcyBwYXRj
aCBhZGRzIGJhc2ljIHN1cHBvcnQgZm9yIGEga2VybmVsIGRyaXZlciB0byBnZXQgYSBMRUQgZGV2
aWNlLgo+PiBUaGlzIHdpbGwgYmUgdXNlZCBieSB0aGUgbGVkLWJhY2tsaWdodCBkcml2ZXIuCj4+
Cj4+IE9ubHkgT0YgdmVyc2lvbiBpcyBpbXBsZW1lbnRlZCBmb3Igbm93LCBhbmQgdGhlIGJlaGF2
aW9yIGlzIHNpbWlsYXIgdG8KPj4gUFdNJ3Mgb2ZfcHdtX2dldCgpIGFuZCBwd21fcHV0KCkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4K
Pj4KPj4KPj4gQEAgLTIxNCw2ICsyMTUsNTUgQEAgc3RhdGljIGludCBsZWRfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPj4gICAKPj4gICBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobGVkc19j
bGFzc19kZXZfcG1fb3BzLCBsZWRfc3VzcGVuZCwgbGVkX3Jlc3VtZSk7Cj4+ICAgCj4+ICtzdGF0
aWMgaW50IGxlZF9tYXRjaF9sZWRfbm9kZShzdHJ1Y3QgZGV2aWNlICpsZWRfZGV2LCBjb25zdCB2
b2lkICpkYXRhKQo+PiArewo+PiArCXJldHVybiBsZWRfZGV2LT5vZl9ub2RlID09IGRhdGEgPyAx
IDogMDsKPj4gK30KPiBHZXQgcmlkIG9mIHRoZSAiPyAxIDogMCI/Ck9LCj4KPgo+PiArCWxlZF9u
b2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImxlZHMiLCBpbmRleCk7Cj4+ICsJaWYgKCFsZWRf
bm9kZSkKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7Cj4+ICsJbGVkX2RldiA9IGNsYXNz
X2ZpbmRfZGV2aWNlKGxlZHNfY2xhc3MsIE5VTEwsIGxlZF9ub2RlLAo+PiArCQlsZWRfbWF0Y2hf
bGVkX25vZGUpOwo+PiArCW9mX25vZGVfcHV0KGxlZF9ub2RlKTsKPj4gKwo+PiArCWlmICghbGVk
X2RldikKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7Cj4gV29uJ3QgdGhpcyBk
ZWZlciBwcm9iZSAiZm9yZXZlciIgd2hlbiB0aGUgZHJpdmVyIGlzIG5vdCBhdmFpbGFibGU/CgpZ
ZXMgaXQgd2lsbC4KCkhvd2V2ZXIgSSBkb24ndCBzZWUgaG93IHdlIGNhbiBmaXggdGhpcyBiZWNh
dXNlIHdlIGRvbid0IGtub3cgZm9yIHN1cmUgCnRoYXQgdGhlIExFRCBkcml2ZXIgd2lsbCBub3Qg
YmVjb21lIGF2YWlsYWJsZSBhdCBhIGxhdGVyIHRpbWUuCgpKSgoKCgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
