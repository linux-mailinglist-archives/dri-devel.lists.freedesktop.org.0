Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E73A12BEA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0DC89C07;
	Fri,  3 May 2019 11:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43EA89C07
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 11:00:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43B05uX076324;
 Fri, 3 May 2019 06:00:05 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43B04i7087326
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 06:00:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 06:00:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 06:00:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43B00td097642;
 Fri, 3 May 2019 06:00:01 -0500
Subject: Re: [PATCHv2 14/22] drm/bridge: tc358767: cleanup LT result check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-15-tomi.valkeinen@ti.com>
 <20190420220647.GQ4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <66582af4-5932-7863-a7a1-e509fc02c3fd@ti.com>
Date: Fri, 3 May 2019 14:00:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420220647.GQ4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556881205;
 bh=+SDVwnKoX4q1twgnPvAtxGyJs5VNKLHTWSvxYkZZfaw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i+yBrBXA8tlvqCTvW4yZD7Mg7UWUoZ3xR6s4NHUtfnro586WiT3LYW4VFpV/vsx0r
 cE3D561QsQj80svfW5hGai6lSIB8RRSw8Aiv8T20sd3jjWO1caNys5FazAXhdieMWd
 9gAORChZ+2rY1J1oDATiUjjNtrF8qRp71isRMpuY=
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

T24gMjEvMDQvMjAxOSAwMTowNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0
IDEyOjMxOjM4UE0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBUaGUgZHJpdmVyIGhh
cyBhIGxvb3AgYWZ0ZXIgZW5kaW5nIGxpbmsgdHJhaW5pbmcsIHdoZXJlIGl0IHJlYWRzIHRoZQo+
PiBEUENEIGxpbmsgc3RhdHVzIGFuZCBwcmludHMgYW4gZXJyb3IgaWYgdGhhdCBzdGF0dXMgaXMg
bm90IG9rLgo+Pgo+PiBUaGUgbG9vcCBpcyB1bm5lY2Vzc2FyeSwgYXMgZmFyIGFzIEkgY2FuIHVu
ZGVyc3RhbmQgZnJvbSBEUCBzcGVjcywgc28KPj4gbGV0J3MgcmVtb3ZlIGl0LiBXZSBjYW4gYWxz
byBwcmludCB0aGUgbW9yZSBzcGVjaWZpYyBlcnJvcnMgdG8gaGVscAo+PiBkZWJ1Z2dpbmcuCj4g
Cj4gSSBzZWUgaW4gdGNfbGlua190cmFpbmluZygpIHRoYXQgdGhlIGRyaXZlciBjaGVja3MgdGhl
IGNoYW5uZWwgRVEgYml0cwo+IHRocm91Z2ggdGhlIFRDMzU4NzY3IERQMF9MVFNUQVQgcmVnaXN0
ZXIuIERvZXMgdGhlIGNoaXAgcmVhZCB0aGUgbGluawo+IHN0YXR1cyBEUENEIHJlZ2lzdGVycyBi
eSBpdHNlbGYgdGhyb3VnaCB0aGUgQVVYIGxpbmsgPyBJZiBzbyB3ZSBjb3VsZAoKWWVzLiBJJ20g
bm90IGV4YWN0bHkgc3VyZSBhdCB3aGF0IHBvaW50IFRDMzU4NzY3IHJlYWRzIHRoZSByZWdpc3Rl
cnMsCmJ1dCBJIHRoaW5rIGl0IHJlYWRzIGl0IGF0IHRoZSBlbmQgb2YgbGluayB0cmFpbmluZyBs
b29wLiBJbiB0aGVvcnkgdGhlCmxpbmsgc2hvdWxkIHN0YXkgdXAgYWZ0ZXIgdGhhdCwgYnV0IGFz
IGRlc2NyaWJlZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2gsCnRoYXQgd2FzIG5vdCB3aGF0IEkgc2F3
IGluIGV2ZXJ5IGNhc2UuIFNvIEknZCByYXRoZXIgaGF2ZSBhbiBleHBsaWNpdApjaGVjayBoZXJl
IGF0IHRoZSBlbmQuCgogVG9taQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
