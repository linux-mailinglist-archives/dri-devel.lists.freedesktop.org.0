Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570BDBF37A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 14:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBC06ED0F;
	Thu, 26 Sep 2019 12:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58696ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:55:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QCtRUR046524;
 Thu, 26 Sep 2019 07:55:27 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QCtR40004527
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Sep 2019 07:55:27 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 07:55:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 07:55:19 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QCtP1u095739;
 Thu, 26 Sep 2019 07:55:26 -0500
Subject: Re: [PATCH 3/7] drm/omap: fix missing scaler pixel fmt limitations
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-4-tomi.valkeinen@ti.com>
 <20190903151245.GA8247@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6c3f41f7-7877-60ff-6628-ca5b95cd8a7d@ti.com>
Date: Thu, 26 Sep 2019 15:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903151245.GA8247@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569502527;
 bh=O0y4NHS8Poaz7wawv/kYI/Qf4FN0h1+Cx+GqUARoeoU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yYqABV29/cOiGjqVfjcMPtBMiZSogXJq79Winv2I0xayRhnzC0geypeHWbDr35KQ5
 oyD/O9RUZnSkyqTlC+o9unKwHR3aslZNaGvbZKaRkQ2HHSoRTisGIoyfVHzTwVDEDN
 5sXUQxKku8B//uXN10QYv7tBG+lWL1rHGoVxJC24=
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

T24gMDMvMDkvMjAxOSAxODoxMiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKCj4+IEBAIC0yNDk4
LDYgKzI0OTksMTkgQEAgc3RhdGljIGludCBkaXNwY19vdmxfY2FsY19zY2FsaW5nKHN0cnVjdCBk
aXNwY19kZXZpY2UgKmRpc3BjLAo+PiAgIAlpZiAod2lkdGggPT0gb3V0X3dpZHRoICYmIGhlaWdo
dCA9PSBvdXRfaGVpZ2h0KQo+PiAgIAkJcmV0dXJuIDA7Cj4+ICAgCj4+ICsJaWYgKGRpc3BjLT5m
ZWF0LT5zdXBwb3J0ZWRfc2NhbGVyX2NvbG9yX21vZGVzKSB7Cj4+ICsJCWNvbnN0IHUzMiAqbW9k
ZXMgPSBkaXNwYy0+ZmVhdC0+c3VwcG9ydGVkX3NjYWxlcl9jb2xvcl9tb2RlczsKPj4gKwkJaW50
IGk7Cj4gCj4gaSBpcyBuZXZlciBuZWdhdGl2ZSBhbmQgY2FuIHRodXMgYmUgYW4gdW5zaWduZWQg
aW50LiBBcGFydCBmcm9tIHRoYXQsCgpUaGFua3MsIGZpeGVkIHRoYXQuCgogIFRvbWkKCi0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
