Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E538012A41
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 11:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6239899E6;
	Fri,  3 May 2019 09:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AF899E6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 09:12:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x439CGkr053113;
 Fri, 3 May 2019 04:12:16 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x439CG1I033338
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 04:12:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 04:12:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 04:12:13 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x439C8I0075751;
 Fri, 3 May 2019 04:12:08 -0500
Subject: Re: [PATCHv2 07/22] drm/bridge: tc358767: move video stream setup to
 tc_main_link_stream
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-8-tomi.valkeinen@ti.com>
 <20190420212534.GJ4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <60d26b6a-d535-56e2-1017-2684a3c97131@ti.com>
Date: Fri, 3 May 2019 12:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420212534.GJ4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556874736;
 bh=CtathpoDnvFWMwzU8I3Hx2MyB0Ic91s0kWTYMM92aHU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Yom15y5pOn2uNFP35l4Hhoo29yhIP/EIIMZUpCytm0l7VWgWcrOFOrrGZaRJiAskA
 AAeDL8p9LqV6LsLTzNb82TuNYWPue5fslj3Jo2Nkja8F0z2e8DDzDq0K5uviXMqb6I
 pFPIDWTExWWj8KdG50QtulPf9h0fM0A7/lO+o9Uw=
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

T24gMjEvMDQvMjAxOSAwMDoyNSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0
IDEyOjMxOjMxUE0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBUaGUgZHJpdmVyIGN1
cnJlbnRseSBzZXRzIHRoZSB2aWRlbyBzdHJlYW0gcmVnaXN0ZXJzIGluCj4+IHRjX21haW5fbGlu
a19zZXR1cC4gT25lIHNob3VsZCBiZSBhYmxlIHRvIGVzdGFibGlzaCB0aGUgRFAgbGluayB3aXRo
b3V0Cj4+IGFueSB2aWRlbyBzdHJlYW0sIHNvIGEgbW9yZSBsb2dpY2FsIHBsYWNlIGlzIHRvIGNv
bmZpZ3VyZSB0aGUgc3RyZWFtIGluCj4+IHRoZSB0Y19tYWluX2xpbmtfc3RyZWFtLiBTbyBtb3Zl
IHRoZW0gdGhlcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4+
IGluZGV4IGY1YzIzMmE5MDY0ZS4uODZiMjcyNDIyMjgxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jCj4+IEBAIC0xMDAzLDE1ICsxMDAzLDYgQEAgc3RhdGljIGludCB0Y19tYWlu
X2xpbmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQo+PiAgCQlyZXR1cm4gLUVBR0FJTjsKPj4g
IAl9Cj4+ICAKPj4gLQlyZXQgPSB0Y19zZXRfdmlkZW9fbW9kZSh0YywgdGMtPm1vZGUpOwo+PiAt
CWlmIChyZXQpCj4+IC0JCWdvdG8gZXJyOwo+PiAtCj4+IC0JLyogU2V0IE0vTiAqLwo+PiAtCXJl
dCA9IHRjX3N0cmVhbV9jbG9ja19jYWxjKHRjKTsKPj4gLQlpZiAocmV0KQo+PiAtCQlnb3RvIGVy
cjsKPj4gLQo+PiAgCXJldHVybiAwOwo+PiAgZXJyX2RwY2RfcmVhZDoKPj4gIAlkZXZfZXJyKHRj
LT5kZXYsICJGYWlsZWQgdG8gcmVhZCBEUENEOiAlZFxuIiwgcmV0KTsKPj4gQEAgLTEwMzAsNiAr
MTAyMSwxNSBAQCBzdGF0aWMgaW50IHRjX21haW5fbGlua19zdHJlYW0oc3RydWN0IHRjX2RhdGEg
KnRjLCBpbnQgc3RhdGUpCj4+ICAJZGV2X2RiZyh0Yy0+ZGV2LCAic3RyZWFtOiAlZFxuIiwgc3Rh
dGUpOwo+PiAgCj4+ICAJaWYgKHN0YXRlKSB7Cj4+ICsJCXJldCA9IHRjX3NldF92aWRlb19tb2Rl
KHRjLCB0Yy0+bW9kZSk7Cj4+ICsJCWlmIChyZXQpCj4+ICsJCQlnb3RvIGVycjsKPj4gKwo+PiAr
CQkvKiBTZXQgTS9OICovCj4+ICsJCXJldCA9IHRjX3N0cmVhbV9jbG9ja19jYWxjKHRjKTsKPj4g
KwkJaWYgKHJldCkKPj4gKwkJCWdvdG8gZXJyOwo+PiArCj4gCj4gQXNzdW1pbmcgdGhpcyBjaGFu
Z2Ugd2lsbCBoYXZlIGEgcHVycG9zZSBmdXJ0aGVyIGRvd24gaW4gdGhlIHNlcmllcywKClRoZSBw
dXJwb3NlIGlzIG1haW5seSBjbGVhbnVwLiBUaGUgc2VyaWVzIGRvZXNuJ3QgZ28gdG8gdGhlIHBv
aW50IHdoZXJlCnRoZSBsaW5rIGFuZCB0aGUgc3RyZWFtIGNvdWxkIGJlIGVuYWJsZWQvZGlzYWJs
ZWQgaW5kZXBlbmRlbnRseSwgYnV0IGl0CnRyaWVzIHRvIHNlcGFyYXRlIHRob3NlIGZ1bmN0aW9u
YWxpdGllcyBmb3IgY2xhcml0eS4KCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAKPiBPbiBhIHNpZGUgbm90ZSB5b3Ug
bWF5IHdhbnQgdG8gcmVtb3ZlIHRoZSBlcnIgbGFiZWwgaW4KPiB0Y19zdHJlYW1fY2xvY2tfY2Fs
YygpLCBvciBldmVuIGlubGluZSB0aGUgd3JpdGUgdG8gRFAwX1ZJRE1OR0VOMSBoZXJlCj4gZGly
ZWN0bHkuCgplcnIgbGFiZWwgaXMgbmVlZGVkIGJ5IHRoZSB0Y193cml0ZSBtYWNyby4gWWVzLCB1
Z2x5LiBUaGVyZSdzIGFub3RoZXIKc2VyaWVzIHRoYXQgY2xlYW5zIHRob3NlIHVwLgoKIFRvbWkK
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
