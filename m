Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB4A9F1B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066AA89FF9;
	Thu,  5 Sep 2019 10:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5F589FF9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 10:00:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x85A0trk069972;
 Thu, 5 Sep 2019 05:00:55 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x85A0tEv049005
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Sep 2019 05:00:55 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 5 Sep
 2019 05:00:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 5 Sep 2019 05:00:53 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x85A0qaS026354;
 Thu, 5 Sep 2019 05:00:52 -0500
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <20190904215200.GN5433@pendragon.ideasonboard.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <67eafe69-e947-5572-b29c-f306b792f8ee@ti.com>
Date: Thu, 5 Sep 2019 13:00:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904215200.GN5433@pendragon.ideasonboard.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1567677655;
 bh=2bVP/X25xbUmb5I+gtnS29RMX09ia5fJwz4M3nJaepo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZS72ngzeWqTBguZJKKUnU6AcpUDHMH9znBU1FjUFBc2zpA/EnTLS6ClY/7t/NiNB/
 Rmwxfk3nWaH2i7BwgfX26xf0wEURxWi/Cjy0tbf7TvMIuZN6QkojPRXRanjYjbvUpo
 ah3USRJSHA7ZPqq4xK2JmWFe1o/DxK/oOdRJXgo0=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDkvMjAxOSAwMDo1MiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4+Pj4+ICBzdGF0
aWMgdm9pZCBvbWFwX2NydGNfd3JpdGVfY3J0Y19wcm9wZXJ0aWVzKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykKPj4+Pj4+ICB7Cj4+Pj4+PiAgCXN0cnVjdCBvbWFwX2RybV9wcml2YXRlICpwcml2ID0g
Y3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsKPj4+Pj4+IEBAIC00MDIsNyArNDI4LDE2IEBAIHN0YXRp
YyB2b2lkIG9tYXBfY3J0Y193cml0ZV9jcnRjX3Byb3BlcnRpZXMoc3RydWN0IGRybV9jcnRjICpj
cnRjKQo+Pj4+Pj4gIAlpbmZvLmRlZmF1bHRfY29sb3IgPSAweDAwMDAwMDsKPj4+Pj4+ICAJaW5m
by50cmFuc19lbmFibGVkID0gZmFsc2U7Cj4+Pj4+PiAgCWluZm8ucGFydGlhbF9hbHBoYV9lbmFi
bGVkID0gZmFsc2U7Cj4+Pj4+PiAtCWluZm8uY3ByX2VuYWJsZSA9IGZhbHNlOwo+Pj4+Pj4gKwo+
Pj4+Pj4gKwlpZiAoY3J0Yy0+c3RhdGUtPmN0bSkgewo+Pj4+Pj4gKwkJc3RydWN0IGRybV9jb2xv
cl9jdG0gKmN0bSA9Cj4+Pj4+PiArCQkJKHN0cnVjdCBkcm1fY29sb3JfY3RtICopIGNydGMtPnN0
YXRlLT5jdG0tPmRhdGE7Cj4+Pj4+PiArCj4+Pj4+PiArCQlpbmZvLmNwcl9lbmFibGUgPSB0cnVl
Owo+Pj4+Pj4gKwkJb21hcF9jcnRjX2Nwcl9jb2Vmc19mcm9tX2N0bShjdG0sICZpbmZvLmNwcl9j
b2Vmcyk7Cj4+Pj4+IEFzIGFuIG9wdGltaXNhdGlvbiBpdCB3b3VsZCBiZSBuaWNlIHRvIG9ubHkg
d3JpdGUgdGhlIGNvZWZmaWNpZW50cyB3aGVuCj4+Pj4+IHRoZXkgYWN0dWFsbHkgY2hhbmdlLiBU
aGF0IGNvdWxkIGJlIGltcGxlbWVudGVkIG9uIHRvcCBvZiB0aGlzIHNlcmllcy4KPj4+PiBFLmcu
IGFwcGx5IHRoaXMgPwo+Pj4+Cj4+Pj4gLSBpZiAoY3J0Yy0+c3RhdGUtPmN0bSkKPj4+PiArIGlm
IChjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkICYmIGNydGMtPnN0YXRlLT5jdG0pCj4+
PiBTb21ldGhpbmcgbGlrZSB0aGF0LCBidXQgLm1ncl9zZXR1cCgpIHNob3VsZCB0aGVuIGJlIHRh
dWdodCBub3QgdG8gd3JpdGUKPj4+IHVuY2hhbmdlZCBDVE0gdGFibGVzIHRvIHJlZ2lzdGVycy4g
RG8geW91IHRoaW5rIGl0IHdvdWxkIGJlIHdvcnRoIGl0ID8KPj4gSG1tbSwgamVzcyBJIHNob3Vs
ZCBkbyBpdCBsaWtlIHRoaXM6Cj4+IGlmIChjcnRjLT5zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2Vk
KSB7Cj4+IAlpZiAoY3J0Yy0+c3RhdGUtPmN0bSkgewo+PiAuLi4KPj4+Pj4+ICsJfSBlbHNlIHsK
Pj4+Pj4+ICsJCWluZm8uY3ByX2VuYWJsZSA9IGZhbHNlOwo+Pj4+Pj4gKwl9Cj4+IH0KPj4KPj4g
VGhpcyB3YXkgdGhlIHdob2xlIENQUiBmdW5jdGlvbmFsaXR5IGlzIHR1cm5lZCBvZmYsIGlmIHRo
ZSB0aGVyZSBpcyBubwo+PiBDVE0gaW4gdGhlIGNydGMgc3RhdGUuCj4gWWVzLCBidXQgeW91IHdv
dWxkIGFsc28gbmVlZCB0byB1cGRhdGUgLm1ncl9zZXR1cCgpIDotKSBBIG5ldwo+IGNvbG9yX21n
bXRfY2hhbmdlZCBmbGFnIHdvdWxkIGJlIG5lZWRlZCBpbiB0aGUgaW5mbyBzdHJ1Y3R1cmUgdG9v
Lgo+IAoKSSBhbSBzdGFydGluZyB0byB0aGluZyB0aGF0IHN1Y2ggYW4gIm9wdGltaXphdGlvbiIg
bWF5IG5vdCBiZSB3b3J0aCB0aGUKYWRkZWQgY29tcGxleGl0eS4gVGhlIGFyaXRobWV0aWMgYW5k
IHdyaXRpbmcgdGhyZWUgcmVnaXN0ZXJzIGlzIG5vdCB0aGF0CmNvc3RseSBhbmQgd2UgZG8gbm90
IGNvbW1pdCBhIG5ldyBjcnRjIHN0YXRlIHRoYXQgb2Z0ZW4uCgpJZiB3ZSBsYXRlciBjb25zaWRl
ciBvdGhlcndpc2Ugd2UgY2FuIGFkZCB0aGUgb3B0aW1pemF0aW9uIGFzIGEgc2VwYXJhdGUKcGF0
Y2guCgpCUiwKSnlyaQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxh
bmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00
LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
