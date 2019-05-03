Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1C12A57
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22989A57;
	Fri,  3 May 2019 09:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292F89A57
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:21:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x439KsZg057571;
 Fri, 3 May 2019 04:20:54 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x439Kse0110127
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 04:20:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 04:20:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 04:20:52 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x439KoBS107749;
 Fri, 3 May 2019 04:20:50 -0500
Subject: Re: [PATCHv2 08/22] drm/bridge: tc358767: split stream enable/disable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-9-tomi.valkeinen@ti.com>
 <20190420212913.GK4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c5b5ca05-2c0a-7cb2-e916-e655138f3e58@ti.com>
Date: Fri, 3 May 2019 12:20:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420212913.GK4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556875255;
 bh=xCe3MITjHQfrPfRrsWwh1zbOyUSZdB6n9ttu+VcZcEc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ds2p9WkE2BM7ZYhK3wpMotVu7HFbWvQ7ph7TgxLcrhwf8jsnckfTXiVZCKr2x6sPE
 Vl2oWxzXh9wlTBXtALC93twxP2k+XOLpwRbPSriGLQ1+g4D+MlYIHfMTk1tZN2gcO8
 aXw1eF6Yeq4gzwBDEoNkUSG3MLeJ/WdHbOiNsoFo=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDQvMjAxOSAwMDoyOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0
IDEyOjMxOjMyUE0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBJdCBpcyBuaWNlciB0
byBoYXZlIGVuYWJsZS9kaXNhYmxlIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHNldChib29sIGVuYWJs
ZSkKPj4gc3R5bGUgZnVuY3Rpb24uCj4gCj4gV2hlbiB0aGUgdHdvIGZ1bmN0aW9ucyBoYXZlIG5v
dGhpbmcgaW4gY29tbW9uLCB5ZXMuCj4gCj4+IFNwbGl0IHRjX21haW5fbGlua19zdHJlYW0gaW50
byB0Y19zdHJlYW1fZW5hYmxlIGFuZCB0Y19zdHJlYW1fZGlzYWJsZS4KPiAKPiBTaG91bGQgeW91
IGtlZXAgdGhlIHRjX21haW5fbGlua18gcHJlZml4ID8gSSBzdXBwb3NlIGl0IGlzIGltcGxpZWQg
aW4gYQo+IHdheSwgYXMgdGhlIHN0cmVhbSBpcyBjYXJyaWVkIG92ZXIgdGhlIG1haW4gbGluay4K
Ckl0IHNvdW5kcyBhIGJpdCByZWR1bmRhbnQsIG9ubHkgbWFraW5nIHRoZSBmdW5jdGlvbnMgbmFt
ZXMgbG9uZ2VyLgoKPj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
fCA4MSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKPj4gaW5kZXggODZiMjcyNDIyMjgxLi5iZmM2NzNiZDU5ODYgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPj4gQEAgLTEwMTMsNDcgKzEwMTMsNTYgQEAgc3RhdGlj
IGludCB0Y19tYWluX2xpbmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQo+PiAgCXJldHVybiBy
ZXQ7Cj4+ICB9Cj4+ICAKPj4gLXN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3N0cmVhbShzdHJ1Y3Qg
dGNfZGF0YSAqdGMsIGludCBzdGF0ZSkKPj4gK3N0YXRpYyBpbnQgdGNfc3RyZWFtX2VuYWJsZShz
dHJ1Y3QgdGNfZGF0YSAqdGMpCj4+ICB7Cj4+ICAJaW50IHJldDsKPj4gIAl1MzIgdmFsdWU7Cj4+
ICAKPj4gLQlkZXZfZGJnKHRjLT5kZXYsICJzdHJlYW06ICVkXG4iLCBzdGF0ZSk7Cj4+ICsJZGV2
X2RiZyh0Yy0+ZGV2LCAic3RyZWFtIGVuYWJsZVxuIik7Cj4gCj4gTWF5YmUgImVuYWJsZSB2aWRl
byBzdHJlYW1cbiIgKGFuZCBzaW1pbGFybHkgZm9yIHRoZSB0Y19zdHJlYW1fZGlzYWJsZSgpCj4g
ZnVuY3Rpb24pID8KCk9rLgoKPj4gIAo+PiAtCWlmIChzdGF0ZSkgewo+PiAtCQlyZXQgPSB0Y19z
ZXRfdmlkZW9fbW9kZSh0YywgdGMtPm1vZGUpOwo+PiAtCQlpZiAocmV0KQo+PiAtCQkJZ290byBl
cnI7Cj4+ICsJcmV0ID0gdGNfc2V0X3ZpZGVvX21vZGUodGMsIHRjLT5tb2RlKTsKPj4gKwlpZiAo
cmV0KQo+PiArCQlnb3RvIGVycjsKPiAKPiBMZXQncyByZXR1cm4gcmV0IGRpcmVjdGx5IGFuZCBy
ZW1vdmUgdGhlIGVyciBsYWJlbC4KCkNhbid0IHJlbW92ZSB0aGUgZXJyIGxhYmVsLCBiZWNhdXNl
IG9mIHRoZSB0Y193cml0ZSgpIGNhbGxzLi4uCgogVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRz
IEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9C
dXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
