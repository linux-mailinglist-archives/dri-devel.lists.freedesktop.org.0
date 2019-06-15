Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2691E4708F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 16:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F43892BB;
	Sat, 15 Jun 2019 14:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76D3892BB
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 14:54:55 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54201
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hcA4z-0006Hh-OZ; Sat, 15 Jun 2019 16:54:53 +0200
Subject: Re: [PATCH v4 08/12] drm/connector: Introduce a TV margins structure
To: Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <06f9c2fdbca44d9c04a0420cc78265c83ccd0d41.1560514379.git-series.maxime.ripard@bootlin.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <bbdae758-1964-2891-f82d-d020adba9f8e@tronnes.org>
Date: Sat, 15 Jun 2019 16:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <06f9c2fdbca44d9c04a0420cc78265c83ccd0d41.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=B+uqqynN4mH/2Ogm2FosLTGCZbrbohWe7l+SY/ukVaI=; 
 b=s0+cbQ+dhIRh75mZUE41cvtBjtVTPujKJ0HXWkn7M3qLPMagjhqJ8wQbZo2gtwp884SafSGR5d4MmrsxIplqW3LSKKSASb9Zu7Kd75kFieEmr6RWnLJXCyWntXI1kwRe56Z2Ne8MQWM3uvQVyo8rAFHrYgte7gqOb4kOuKziGzuzP5f7ylSyE3d6A47hwSTOyq20Kbpcrrf+2gQI3V+ZHGGPaFLb3UIpXDkj5xZYIeRTK+bQrpJ6WXQkRLtDAo14iH1wMZ9nLNvxFE8MnyoYDUgDy+329Heie7TmMAN3GLiM+IYxLp47P/AMWdWZW5IFyuL1ujZZXySYcQHfizke4A==;
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTQuMDYuMjAxOSAxNC4xMywgc2tyZXYgTWF4aW1lIFJpcGFyZDoKPiBUaGUgVFYgbWFy
Z2lucyBoYXMgYmVlbiBkZWZpbmVkIGFzIGEgc3RydWN0dXJlIGluc2lkZSB0aGUKPiBkcm1fY29u
bmVjdG9yX3N0YXRlIHN0cnVjdHVyZSBzbyBmYXIuIEhvd2V2ZXIsIHdlIHdpbGwgbmVlZCBpdCBp
biBvdGhlcgo+IHN0cnVjdHVyZXMgYXMgd2VsbCwgc28gbGV0J3MgbW92ZSB0aGF0IHN0cnVjdHVy
ZSBkZWZpbml0aW9uIHNvIHRoYXQgaXQgY2FuCj4gYmUgcmV1c2VkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDY4YTA0MTY5ZWEzNi4uYzU4YTM1YjM0YzFh
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC00NjQsMTMgKzQ2NCwzNyBAQCBpbnQgZHJtX2Rp
c3BsYXlfaW5mb19zZXRfYnVzX2Zvcm1hdHMoc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm8s
Cj4gIAkJCQkgICAgIHVuc2lnbmVkIGludCBudW1fZm9ybWF0cyk7Cj4gIAo+ICAvKioKPiArICog
c3RydWN0IGRybV9jb25uZWN0b3JfdHZfbWFyZ2lucyAtIFRWIGNvbm5lY3RvciByZWxhdGVkIG1h
cmdpbnMKPiArICoKPiArICogRGVzY3JpYmVzIHRoZSBtYXJnaW5zIGluIHBpeGVscyB0byBwdXQg
YXJvdW5kIHRoZSBpbWFnZSBvbiBUVgo+ICsgKiBjb25uZWN0b3JzIHRvIGRlYWwgd2l0aCBvdmVy
c2Nhbi4KPiArICovCj4gK3N0cnVjdCBkcm1fY29ubmVjdG9yX3R2X21hcmdpbnMgewo+ICsJLyoq
Cj4gKwkgKiBAYm90dG9tOiBCb3R0b20gbWFyZ2luIGluIHBpeGVscy4KPiArCSAqLwo+ICsJdW5z
aWduZWQgaW50IGJvdHRvbTsKPiArCj4gKwkvKioKPiArCSAqIEBsZWZ0OiBMZWZ0IG1hcmdpbiBp
biBwaXhlbHMuCj4gKwkgKi8KPiArCXVuc2lnbmVkIGludCBsZWZ0Owo+ICsKPiArCS8qKgo+ICsJ
ICogQHJpZ2h0OiBSaWdodCBtYXJnaW4gaW4gcGl4ZWxzLgo+ICsJICovCj4gKwl1bnNpZ25lZCBp
bnQgcmlnaHQ7Cj4gKwo+ICsJLyoqCj4gKwkgKiBAdG9wOiBUb3AgbWFyZ2luIGluIHBpeGVscy4K
PiArCSAqLwo+ICsJdW5zaWduZWQgaW50IHRvcDsKPiArfTsKPiArCj4gKy8qKgo+ICAgKiBzdHJ1
Y3QgZHJtX3R2X2Nvbm5lY3Rvcl9zdGF0ZSAtIFRWIGNvbm5lY3RvciByZWxhdGVkIHN0YXRlcwo+
ICAgKiBAc3ViY29ubmVjdG9yOiBzZWxlY3RlZCBzdWJjb25uZWN0b3IKPiAtICogQG1hcmdpbnM6
IG1hcmdpbnMgKGFsbCBtYXJnaW5zIGFyZSBleHByZXNzZWQgaW4gcGl4ZWxzKQo+IC0gKiBAbWFy
Z2lucy5sZWZ0OiBsZWZ0IG1hcmdpbgo+IC0gKiBAbWFyZ2lucy5yaWdodDogcmlnaHQgbWFyZ2lu
Cj4gLSAqIEBtYXJnaW5zLnRvcDogdG9wIG1hcmdpbgo+IC0gKiBAbWFyZ2lucy5ib3R0b206IGJv
dHRvbSBtYXJnaW4KPiArICogQG1hcmdpbnM6IFRWIG1hcmdpbnMKPiAgICogQG1vZGU6IFRWIG1v
ZGUKPiAgICogQGJyaWdodG5lc3M6IGJyaWdodG5lc3MgaW4gcGVyY2VudAo+ICAgKiBAY29udHJh
c3Q6IGNvbnRyYXN0IGluIHBlcmNlbnQKPiAKClRoZSBhY3R1YWwgc3RydWN0IGNvbnZlcnNpb24g
aXMgbWlzc2luZyBoZXJlLCBpdCBoYXMgZW5kZWQgdXAgaW46CgpbUEFUQ0ggdjQgMTAvMTJdIGRy
bS9tb2RlczogUGFyc2Ugb3ZlcnNjYW4gcHJvcGVydGllcwoKV2l0aCB0aGF0IG1vdmVkIGluIGhl
cmU6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
