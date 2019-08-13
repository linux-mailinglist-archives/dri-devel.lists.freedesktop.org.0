Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70BE8B15E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666756E07F;
	Tue, 13 Aug 2019 07:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DDE6E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:45:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7iwvZ130754;
 Tue, 13 Aug 2019 02:44:58 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7iwpa012186
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:44:58 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:44:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:44:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7itX0104478;
 Tue, 13 Aug 2019 02:44:55 -0500
Subject: Re: [PATCH 31/60] drm/omap: Add infrastructure to support drm_bridge
 local to DSS outputs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-28-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f050178e-1702-4ee3-0759-ed7e8f4c99b9@ti.com>
Date: Tue, 13 Aug 2019 10:44:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-28-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565682298;
 bh=eXo2iuodtPrk6knkMIAaU2MXpfdeylTIJso+DWo9S8g=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JnTKjnSolTC9Lztd1rnF8enasd8/hnyK8nE6Ueqd6WIlWcci8JBrzaEsZ3y7hFE3x
 r618BtmZBB99Vtl0HQ6rsBUE/6FHwrtImPsyW7YGFHinCIylQQ+f7drtObKGlAO/o4
 T4N3W9Nn9n4MMeR01T5k6SmrRtwdBzJHEH9e14Z8=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBJbiBvcmRlciB0
byBzdXBwb3J0IGRybV9icmlkZ2UtYmFzZWQgcGlwZWxpbmUsIHRoZSBpbnRlcm5hbCBIRE1JCj4g
ZW5jb2RlcnMgd2lsbCBuZWVkIHRvIGV4cG9zZSB0aGUgRURJRCByZWFkIG9wZXJhdGlvbiB0aHJv
dWdoIHRoZQo+IGRybV9icmlkZ2UgQVBJLCBhbmQgdGh1cyB0byBleHBvc2UgYSBkcm1fYnJpZGdl
IGluc3RhbmNlIGNvcnJlc3BvbmRpbmcKPiB0byB0aGUgZW5jb2Rlci4gVGhlIEhETUkgZW5jb2Rl
cnMgYXJlIGhvd2V2ZXIgaGFuZGxlZCBhcyBvbWFwX2Rzc19kZXZpY2UKPiBpbnN0YW5jZXMsIHdo
aWNoIGNvbmZsaWN0cyB3aXRoIHRoaXMgcmVxdWlyZW1lbnQuCj4gCj4gSW4gb3JkZXIgdG8gbW92
ZSBmb3J3YXJkIHdpdGggdGhlIGRybV9icmlkZ2UgdHJhbnNpdGlvbiwgYWRkIHN1cHBvcnQgZm9y
Cj4gY3JlYXRpbmcgZHJtX2JyaWRnZSBpbnN0YW5jZXMgbG9jYWwgdG8gRFNTIG91dHB1dHMuIElm
IGEgbG9jYWwgYnJpZGdlIGlzCj4gcGFzc2VkIHRvIHRoZSBvbWFwZHNzX2RldmljZV9pbml0X291
dHB1dCgpIGZ1bmN0aW9uLCBpdCBpcyB1c2VkIGFzIHRoZQo+IGZpcnN0IGJyaWRnZSBpbiB0aGUg
Y2hhaW4sIGFuZCB0aGUgb21hcF9kc3NfZGV2aWNlLm5leHRfYnJpZGdlIGZpZWxkIGlzCj4gc2V0
IHRvIHRoZSBuZXh0IGJyaWRnZSBmb3IgdGhlIHVzZSBvZiB0aGUgaW50ZXJuYWwgZW5jb2RlcnMn
IGJyaWRnZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5s
YW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5l
c3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
