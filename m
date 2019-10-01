Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C7CC2CC8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 07:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFAD6E027;
	Tue,  1 Oct 2019 05:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1306E027
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 05:07:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91579HI123814;
 Tue, 1 Oct 2019 00:07:09 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91579E2057589
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 00:07:09 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 00:06:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 00:06:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91576QY023304;
 Tue, 1 Oct 2019 00:07:06 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com>
 <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
 <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
 <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
Date: Tue, 1 Oct 2019 08:07:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569906429;
 bh=noXDxeYUUM74ghwgtc9meLrez0A25pS+/YPUPz/R6GQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wYQnXQJ1eGweNGaMBSOsoiMDDRVJa0dl8PX5hIgjA78oyr9y01o+foZcUytgIR6G+
 Gqu+OLpn9+63PkP8MyCfSPkYjMM0Lgfuy3Hds71AQWTN11mZOigA02FCpmgy0TiqsG
 3k8w56MIoTbRq9/mR3yL2ZmtlRm4jaOQXOFbQ0dc=
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAyMDo0OCwgVGVybyBLcmlzdG8gd3JvdGU6Cgo+IEhtbWgsIGFmdGVyIHNv
bWUgdGVzdGluZywgaXQgc2VlbXMgdGhlcmUgaXMgYmFkIHN0dWZmIGhhcHBlbmluZyB3aXRoIHRo
ZSAKPiBkaXZpZGVyIGNsb2NrIGltcGxlbWVudGF0aW9uLCBJIGFtIHJlLXdvcmtpbmcgaXQgYXMg
b2Ygbm93LiBCYXNpY2FsbHkgCj4gd2hhdCBpcyB3cm9uZyBpcyB0aGF0IHdpdGggYSBkaXZpZGVy
IG1heCB2YWx1ZSBvZiBzYXkgMTYsIHRoZSBkcml2ZXIgCj4gYXR0ZW1wdHMgdG8gY3JhZnQgdGhl
IG1heCB2YWx1ZSBpbnRvIGEgbWFzaywgYnV0IHRoaXMgZW5kcyB1cCBiZWluZyAKPiAweDFmLiBJ
ZiB0aGUgbWF4IHZhbHVlIGlzIDE1LCBpdCBlbmRzIHVwIGludG8gMHhmIHdoaWNoIGlzIGNvcnJl
Y3QuCgpPaywgdGhhdCBleHBsYWlucyB0aGUgbWF4IG5vdCB3b3JraW5nLgoKSXQgZG9lc24ndCBl
eHBsYWluIHRoZSBvdGhlciBpc3N1ZSwgd2hlcmUgdGhlIFRSTSBzYXlzIHRoZSBtYXggZGl2IGlz
IAozMiwgYnV0IGl0IGRvZXMgbm90IHdvcmsuIEJ1dCB0YWtpbmcgdGhlIG1heCBkaXYgZnJvbSB0
aGUgb2xkIFNvQ3MsIDE2LCAKaXMgbm90IGNvcnJlY3QgZWl0aGVyLCBhcyBpdCBzZWVtcyB0aGF0
IGRpdmlkZXJzIHVwIHRvIDMxIHdvcmsgb2suCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50
cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMv
QnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
