Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929CC0026
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 09:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40896EE87;
	Fri, 27 Sep 2019 07:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0966ECC2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 14:40:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QEeSHP074841;
 Thu, 26 Sep 2019 09:40:28 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QEeSRT033545
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Sep 2019 09:40:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 09:40:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 09:40:20 -0500
Received: from [158.218.116.237] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QEeQDm111701;
 Thu, 26 Sep 2019 09:40:27 -0500
Subject: Re: [PATCH 2/7] drm/omap: tweak HDMI DDC timings
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-3-tomi.valkeinen@ti.com>
 <20190903142353.GE4812@pendragon.ideasonboard.com>
 <f103e3ac-3d50-c255-b036-d5638bc291dd@ti.com>
From: Alejandro Hernandez <ajhernandez@ti.com>
Message-ID: <35904653-f8b0-758e-fdfc-babec627070d@ti.com>
Date: Thu, 26 Sep 2019 10:40:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f103e3ac-3d50-c255-b036-d5638bc291dd@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 27 Sep 2019 07:40:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569508828;
 bh=snY7nD7l/y+uW5biPV0xjDR6zf7+OoLjcmq/uO5jxxE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Iwz+XciV4+/ZiIwEzkxoFflEMPD51odKs+yLpq/v4YOumy/HjJpsp4tO8Q3CxOLrM
 qn9jsDSu2u/wWdnq+i94NprDTvJ+aidxAhyEvHmYydOguhUr33kid0ZXY77RnjZHwV
 e0Yc7J21Ve7ooRtS/kd1JN5hYapj6qpr7IE2HFms=
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMjYvMTkgODo1NCBBTSwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMDMvMDkvMjAx
OSAxNzoyMywgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPj4gSGkgVG9taSwKPj4KPj4gVGhhbmsg
eW91IGZvciB0aGUgcGF0aC4KPj4KPj4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDM6NTM6NTRQ
TSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+PiBGcm9tOiBBbGVqYW5kcm8gSGVybmFu
ZGV6IDxhamhlcm5hbmRlekB0aS5jb20+Cj4+Pgo+Pj4gQSAiSERNSSBJMkMgTWFzdGVyIEVycm9y
IiBpcyBzb21ldGltZXMgcmVwb3J0ZWQgd2l0aCB0aGUgY3VycmVudCBEREMgCj4+PiBTQ0wKPj4+
IHRpbWluZ3MuIFRoZSBjdXJyZW50IHNldHRpbmdzIGZvciBhIDEwdXMgU0NMIHBlcmlvZCAoMTAw
IEtIeikgY2F1c2VzIAo+Pj4gdGhlCj4+PiBlcnJvciB3aXRoIHNvbWUgZGlzcGxheXMuwqAgVGhp
cyBwYXRjaCBpbmNyZWFzZXMgdGhlIFNDTCBzaWduYWwgcGVyaW9kCj4+PiBmcm9tIDEwdXMgdG8g
MTAuMnVzLCB3aXRoIHRoZSBuZXcgc2V0dGluZ3MgdGhlIGVycm9yIGlzIG5vdCBvYnNlcnZlZAo+
Pj4KPj4KPj4gSXQgd291bGQgYmUgdXNlZnVsIHRvIGRvY3VtZW50IHdoYXQgdGhvc2UgInNvbWUg
ZGlzcGxheXMiIGFyZSBpZiB5b3UKPj4gY2FuLgo+Cj4gVW5mb3J0dW5hdGVseSBJIGhhdmUgbm8g
aWRlYS4gVGhpcyB3YXMgcXVpdGUgYSB3aGlsZSBhZ28uCj4KPiBBbGVqYW5kcm8sIGRvIHlvdSBy
ZWNhbGw/CgpOb3QgYXQgdGhpcyBwb2ludCwgd2UgdGhyZXcgb3V0IGEgYnVuY2ggb2YgZXF1aXBt
ZW50IG91dCBkdXJpbmcgdGhlIG1vdmUgCnRvIHRoZSBuZXcgb2ZmaWNlIGxhc3QgeWVhci4gSSBj
b3VsZCBvbmx5IGZpbmQgb25lIGFuZCBpdCBoYXMgbm8gCmlkZW50aWZ5aW5nIGluZm9ybWF0aW9u
IG9uIGl0LgoKQWxlamFuZHJvCgo+Cj4gwqBUb21pCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
