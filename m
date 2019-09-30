Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56ADC2DD3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0656E509;
	Tue,  1 Oct 2019 07:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AC86E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:48:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UHmPhm061772;
 Mon, 30 Sep 2019 12:48:25 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UHmPJS070578
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 12:48:25 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 12:48:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 12:48:15 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UHmK0R117112;
 Mon, 30 Sep 2019 12:48:21 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
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
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com>
Date: Mon, 30 Sep 2019 20:48:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569865705;
 bh=QNVK9aqnamqVKs2ieTsZhQ72/wiNcVA3/7UIFUG5FOc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BHbsTAOuj8sLvQOROqK2l+5nIG8Mnr45lF20es/l3dVWF5SydCoiPBI0pBY9pdgDj
 yf9wNopJuKFRnldepyYYeWsrFHayRT5G1MDK9QLootceqmxKPZe2Gc1bKr/5D8qAjn
 bsDSUwhkIdeCt/C4ub0GlqtIjj3FDmY5VBt2s5oc=
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

T24gMzAvMDkvMjAxOSAxODoxMCwgQWRhbSBGb3JkIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAy
MDE5IGF0IDk6MjcgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDMwLzA5LzIwMTkgMTc6MjAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+Pgo+
Pj4gTGV0J3Mgc2VlIHdoYXQgVGVybyBzYXlzLCBidXQgeWVhaCwgc29tZXRoaW5nIGlzIG9kZCBo
ZXJlLiBJIGV4cGVjdGVkCj4+PiB0aGUgbWF4IGRpdmlkZXIgdG8gYmUgMTYgd2l0aCBUZXJvJ3Mg
cGF0Y2gsIGJ1dCBJIGRvbid0IHNlZSBpdCBoYXZpbmcKPj4+IHRoYXQgZWZmZWN0LiBJIGNhbiBn
ZXQgdGhlIGRpdiB0byAzMS4KPj4+Cj4+PiBZb3UgY2FuIHNlZSB0aGlzIGZyb20gdGhlIGNsb2Nr
IHJlZ2lzdGVyIDB4NDgwMDRlNDAgKENNX0NMS1NFTF9EU1MpLiBUaGUKPj4+IGxvd2VzdCBiaXRz
IGFyZSB0aGUgZGl2aWRlciwgNSB0byAwLiBUaGUgVFJNIHNheXMgbWF4IGRpdiBpcyAzMi4KPj4+
Cj4+PiBUZXJvIHNhaWQgZm9yIGhpbSB0aGUgZGl2aWRlcnMgPiAxNiBkaWRuJ3QgInN0aWNrIiB0
byB0aGUgcmVnaXN0ZXIuIEknbQo+Pj4gbm93IHdvbmRlcmluZyBpZiBoZSBoYXMgYW4gb2xkIGJl
YWdsZWJvYXJkIHdpdGggT01BUDM0eHgsIHdoaWNoIGhhcyBtYXgKPj4+IGRpdiAxNi4KPj4KPj4g
U28gdGVzdGluZyBhIGJpdCBtb3JlIGhlcmUsIEkgY2FuIHNlZSB0aGUgRFNTIHdvcmtpbmcgZmlu
ZSBhbmQgZnBzIGFzCj4+IGV4cGVjdGVkIHdoZW4gSSB3cml0ZSB2YWx1ZXMgZGlyZWN0bHkgdG8g
Q01fQ0xLU0VMX0RTUzo1OjAsIHdpdGgKPj4gZGl2aWRlcnMgdXAgdG8gMzEuIFdpdGggMzIsIERT
UyBicmVha3MuIFRoZSBUUk0gKEFNL0RNMzd4KSBzYXlzIHZhbHVlIDMyCj4+IGlzIHZhbGlkLgo+
IAo+IEkgd29uZGVyIGlmIGl0J3Mgc29tZWhvdyBiZWluZyBtYXNrZWQgd2l0aCBiaXRzIDQ6MCBp
bnN0ZWFkIG9mIDU6MAo+IHdoaWNoIGNvdWxkIHBvdGVudGlhbGx5IG1ha2UgdGhlIGRpdmlkZXIg
MCBhbmQgdGhhdCB2YWx1ZSBkb2Vzbid0Cj4gYXBwZWFyIHRvIGJlIHZhbGlkLgoKSG1taCwgYWZ0
ZXIgc29tZSB0ZXN0aW5nLCBpdCBzZWVtcyB0aGVyZSBpcyBiYWQgc3R1ZmYgaGFwcGVuaW5nIHdp
dGggdGhlIApkaXZpZGVyIGNsb2NrIGltcGxlbWVudGF0aW9uLCBJIGFtIHJlLXdvcmtpbmcgaXQg
YXMgb2Ygbm93LiBCYXNpY2FsbHkgCndoYXQgaXMgd3JvbmcgaXMgdGhhdCB3aXRoIGEgZGl2aWRl
ciBtYXggdmFsdWUgb2Ygc2F5IDE2LCB0aGUgZHJpdmVyIAphdHRlbXB0cyB0byBjcmFmdCB0aGUg
bWF4IHZhbHVlIGludG8gYSBtYXNrLCBidXQgdGhpcyBlbmRzIHVwIGJlaW5nIAoweDFmLiBJZiB0
aGUgbWF4IHZhbHVlIGlzIDE1LCBpdCBlbmRzIHVwIGludG8gMHhmIHdoaWNoIGlzIGNvcnJlY3Qu
CgotVGVybwotLQpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
