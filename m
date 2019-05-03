Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E312C9A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFFA89CC4;
	Fri,  3 May 2019 11:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE73E89CC4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 11:43:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43BhtdY021986;
 Fri, 3 May 2019 06:43:55 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43Bhthv063352
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 06:43:55 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 06:43:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 06:43:53 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43BhpOb018430;
 Fri, 3 May 2019 06:43:52 -0500
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrey Gusakov
 <andrey.gusakov@cogentembedded.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
Date: Fri, 3 May 2019 14:43:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423145632.GC16111@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556883835;
 bh=kk13L2iMDWIAWXEljQ3tOaHT5IieyApQ58+WFrWcDvM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NGC2JUHErXhoHHC6TOZa1W68ptezO4L0kXA9/mMaUbLx8w4tiW5qml8kHd8/1pv8x
 Wjs7dLVq+9+tRIK/l9/lnuS6rozRLVGEYrPH8L9t26mLqNgubaUUg8minblevGB9h9
 aTEPYMkWr0dJ84eW95wXWLmRPZt62m3h5xE8JRWU=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDQvMjAxOSAxNzo1NiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKCj4+IER1cmluZyBp
bml0aWFsIGRyaXZlciBkZXZlbG9wbWVudCBJIGhhZCBvbmUgZURQIGRpc3BsYXkgdGhhdCByZXBv
cnRzIDAgaW4gQml0IDAKPj4gKEFOU0kgOEIvMTBCKSBvZiBEUENEIHJlZyAweDAwMDYgKE1BSU5f
TElOS19DSEFOTkVMX0NPRElORykuCj4+IEFsc28gaXQgZG9lcyBub3QgcmVhY3Qgb24gc2V0dGlu
ZyBCaXQgMCAoU0VUX0FOU0kgOEIxMEIpIGluIDB4MDEwOAo+PiAoTUFJTl9MSU5LX0NIQU5ORUxf
Q09ESU5HX1NFVCkgLSBhZnRlciByZWFkaW5nIGJhY2sgaXQgd2FzIDAgYWdhaW4uCj4+IFNvIEkg
aGFkIHRvIGRpc2FibGUgOEIxMCBlbmNvZGluZyBvbiB0YzM1ODc2NyBzaWRlIHRvIG1ha2UgdGhp
cyBkaXNwbGF5Cj4+IHdvcmsuCj4gCj4gT3V0IG9mIGN1cmlvc2l0eSwgaG93IGRvZXMgdGhlIGVE
UCBkaXNwbGF5IHJlY292ZXIgdGhlIGNsb2NrIHdpdGhvdXQKPiA4Qi8xMEIgZW5jb2RpbmcgPwo+
IAo+PiBPbiBvdGhlciBoYW5kIGlmIHRoZXJlIGFyZSBkaXNwbGF5cyB0aGF0IHJlcG9ydCB6ZXJv
IGJpdCAwIGluCj4+IE1BSU5fTElOS19DSEFOTkVMX0NPRElORyB3aGlsZSBuZWVkaW5nIDhiMTBi
IHRoZW4gdGhpcyBwYXRjaCBsb29rcwo+PiByZWFzb25hYmxlLgo+Pgo+PiBNYXkgYmUgZHJpdmVy
IHNob3VsZCByZWFkIGJhY2sgTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVAo+PiByZWdpc3Rl
ciBhZnRlciBzZXR0aW5nIGl0IGFuZCBjaGVjayBpZiA4YjEwYiBhY3R1YWxseSBlbmFibGVkPwo+
IAo+IFRoaXMgc291bmRzIGxpa2UgYSByZWFzb25hYmxlIHRoaW5nIHRvIHRyeS4gVG9taSwgZG8g
eW91IHN0aWxsIGhhdmUKPiBhY2Nlc3NzIHRvIHRob3NlIGZhdWx0eSBtb25pdG9ycyA/CgpPbiBt
eSBtb25pdG9yIGl0IGRvZXMgbm90IHNlZW0gdG8gbWF0dGVyIHdoZXRoZXIgSSB3cml0ZSAwIG9y
IDEgdG8KTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVCwgYXMgbG9uZyBhcyBJIGhhdmUgOGIx
MGIgZW5hYmxlZCBvbgpUQzM1ODc2NyBzaWRlLiBUaGUgd3JpdGVzIGRvIGdvIHRocm91Z2gsIGFu
ZCBJIGNhbiByZWFkIHRoZSB3cml0dGVuIGJpdApiYWNrLgoKU28uLi4gSSBndWVzcyB3aGVuIHdl
IHRhbGsgYWJvdXQgZURQIHBhbmVscywgdGhlcmUgbWF5IGJlIGFsbCBraW5kcyBvZgpvZGRpdGll
cywgYXMgdGhleSdyZSB1c3VhbGx5IG1lYW50IHRvIGJlIHVzZWQgd2l0aCBhIGNlcnRhaW4gY29u
ZmlndXJhdGlvbi4KCkJ1dCBpZiBldmVyeW9uZSBhZ3JlZXMgdGhhdCA4QjEwQiBpcyBhIG5vcm1h
bCwgcmVxdWlyZWQgZmVhdHVyZSBvZiBEUCwKYW5kIHRoZXJlIGlzIGFuIGVEUCBwYW5lbCB0aGF0
IG5lZWRzIDhCMTBCIGRpc2FibGVkLCBtYXliZSB0aGF0IHBhbmVsCmhhcyB0byBiZSBoYW5kbGVk
IHNlcGFyYXRlbHkgYXMgYSBzcGVjaWFsIGNhc2U/IEEgZHRzIGVudHJ5IHRvIGRpc2FibGUKOEIx
MEI/IE9yIHNvbWV0aGluZy4gQnV0IGl0IGRvZXMgbm90IHNvdW5kIGxpa2UgYSBnb29kIGlkZWEg
Zm9yIHRoZQpkcml2ZXIgdG8gdHJ5IHRvIGd1ZXNzIHRoaXMuCgogVG9taQoKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
