Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA9C3548
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 15:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A634B89A32;
	Tue,  1 Oct 2019 13:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3180289AA6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 13:15:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91DEtVV112678;
 Tue, 1 Oct 2019 08:14:55 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91DEtao001216
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 08:14:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 08:14:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 08:14:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91DEqr4014344;
 Tue, 1 Oct 2019 08:14:53 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
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
 <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
 <f01bf6ec-e531-371b-4f66-312b12379273@ti.com>
 <CAHCN7xLbcQGEEVzLgP3MTp_ej0JnSdOXMgULt4EVSg9B+AjPdw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2690bef6-eb69-8849-1300-1a85f71245fd@ti.com>
Date: Tue, 1 Oct 2019 16:14:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLbcQGEEVzLgP3MTp_ej0JnSdOXMgULt4EVSg9B+AjPdw@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569935695;
 bh=TU5IhD4zN9rSfnafOcghDi7JScumLFM7TgDr0D8042s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=J4zboSf7MkGabO5X1pVBRgwdy82jYNWTf4gnyGuEvtqnPjTBZ3IT8AvWWUHk8Zfev
 oUCiCS9PIlBQfDW/hPFUOt+S2HXFEDjV8HA6dYvMlduGX95qtluE0AacY3fX7tbsop
 KVsDxyIZPemfPNuJwvkNUfFJD8nbHsdxmWaKpcLs=
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
 dri-devel <dri-devel@lists.freedesktop.org>, Tero Kristo <t-kristo@ti.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMTAvMjAxOSAxNjowNiwgQWRhbSBGb3JkIHdyb3RlOgoKPiBEbyB5b3Ugd2FudCBtZSB0
byBwdXNoIGEgcGF0Y2ggdG8gcmVtb3ZlIHRoZQo+IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19Q
RVJfUENLIGhhY2sgb25jZSB0aGVzZSBwYXRjaGVzIGhhdmUgYmVlbgo+IHBvc3RlZD8gIEl0IHNl
ZW1zIGxpa2UgdGhlIGRpdmlkZXIgZml4IGVsaW1pbmF0ZXMgdGhlIG5lZWQgZm9yIHRoaXMKPiBo
YWNrLgoKTm8sIHRoZSBwb2ludCBvZiBPTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLIHdhcyBuZXZl
ciB0byB3b3JrIGFyb3VuZCAKZGl2aWRlciBidWdzLiBJdCdzIGZvciBzY2FsaW5nLgoKICBUb21p
CgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
