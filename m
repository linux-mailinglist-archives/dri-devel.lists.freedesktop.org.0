Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E226C2DD9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0480D6E516;
	Tue,  1 Oct 2019 07:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3A76E037
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 05:13:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x915CnIx005144;
 Tue, 1 Oct 2019 00:12:49 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x915Cn3X100427;
 Tue, 1 Oct 2019 00:12:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 00:12:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 00:12:48 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x915CjD7053183;
 Tue, 1 Oct 2019 00:12:46 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
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
 <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <2cff2d77-485d-c9a5-ea9b-a9146a81218e@ti.com>
Date: Tue, 1 Oct 2019 08:12:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569906769;
 bh=4AH9Rku5UAfzvf7FCp4zmCl9cmUhkBiAtoPrnnSOE8Q=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=XmkiTIUGZb5Mtvqe2EYoaup70LorYQU7ZYPKDyC+253KGhwPUxoVn4ugNW+j7Abwu
 aI7jI6X+Aymvl7rOahgoSF1OzuJJhVZPj0fVfIsnZjsxQ+/ZsSdQlUJEVwslyVe7tP
 Wn6ibrAfw4Hf6HVQxjDTwn0Iemsux3rfEtKbrq68=
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

T24gMDEvMTAvMjAxOSAwODowNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMzAvMDkvMjAx
OSAyMDo0OCwgVGVybyBLcmlzdG8gd3JvdGU6Cj4gCj4+IEhtbWgsIGFmdGVyIHNvbWUgdGVzdGlu
ZywgaXQgc2VlbXMgdGhlcmUgaXMgYmFkIHN0dWZmIGhhcHBlbmluZyB3aXRoIAo+PiB0aGUgZGl2
aWRlciBjbG9jayBpbXBsZW1lbnRhdGlvbiwgSSBhbSByZS13b3JraW5nIGl0IGFzIG9mIG5vdy4g
Cj4+IEJhc2ljYWxseSB3aGF0IGlzIHdyb25nIGlzIHRoYXQgd2l0aCBhIGRpdmlkZXIgbWF4IHZh
bHVlIG9mIHNheSAxNiwgCj4+IHRoZSBkcml2ZXIgYXR0ZW1wdHMgdG8gY3JhZnQgdGhlIG1heCB2
YWx1ZSBpbnRvIGEgbWFzaywgYnV0IHRoaXMgZW5kcyAKPj4gdXAgYmVpbmcgMHgxZi4gSWYgdGhl
IG1heCB2YWx1ZSBpcyAxNSwgaXQgZW5kcyB1cCBpbnRvIDB4ZiB3aGljaCBpcyAKPj4gY29ycmVj
dC4KPiAKPiBPaywgdGhhdCBleHBsYWlucyB0aGUgbWF4IG5vdCB3b3JraW5nLgo+IAo+IEl0IGRv
ZXNuJ3QgZXhwbGFpbiB0aGUgb3RoZXIgaXNzdWUsIHdoZXJlIHRoZSBUUk0gc2F5cyB0aGUgbWF4
IGRpdiBpcyAKPiAzMiwgYnV0IGl0IGRvZXMgbm90IHdvcmsuIEJ1dCB0YWtpbmcgdGhlIG1heCBk
aXYgZnJvbSB0aGUgb2xkIFNvQ3MsIDE2LCAKPiBpcyBub3QgY29ycmVjdCBlaXRoZXIsIGFzIGl0
IHNlZW1zIHRoYXQgZGl2aWRlcnMgdXAgdG8gMzEgd29yayBvay4KCklmIHNvbWVvbmUga25vd3Mg
Zm9yIHN1cmUgdGhhdCBkaXZpZGVycyBoaWdoZXIgdGhhbiAxNiBhcmUgZmluZSBvbiAKb21hcDM2
eHgsIHdlIGNhbiBhZGQgdGhpcyB1bmRlciBvbWFwMzZ4eC1jbG9ja3MuZHRzaS4gQW55d2F5LCBs
ZXQgbWUgZml4IAp0aGUgYnJva2VuIGRpdmlkZXIgbWF4IGxvZ2ljIGZpcnN0LCB0aGF0IHNlZW1z
IHRvIGJlIG1vcmUgcHJlc3NpbmcgaXNzdWUuCgotVGVybwoKLS0KVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
