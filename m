Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7DC303B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 11:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57966E0B8;
	Tue,  1 Oct 2019 09:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2D46E0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 09:31:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x919Vftr060917;
 Tue, 1 Oct 2019 04:31:41 -0500
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x919VfeF015535
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 04:31:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:31:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:31:31 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919Vc21040870;
 Tue, 1 Oct 2019 04:31:39 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Tero Kristo <t-kristo@ti.com>, Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
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
 <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f01bf6ec-e531-371b-4f66-312b12379273@ti.com>
Date: Tue, 1 Oct 2019 12:31:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569922301;
 bh=9mRbJDk5sUd9pMs4IG5bnvQl42wchkWmZqaMcfc5vi8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LqKnd50sbKz0s3OYz0yOvmOOKcHUKZYgrUtGPjzpk1t9TpJJBrQ/ZfSKB1B+xq7On
 /ZEES/Bf0zGJ1yElhkb5EYpEDlwfh0MpOeH1b/ePVgliCCNkJVCidQGHNX6TMXYMt9
 OTljvacmw0m2thDKtFe0KN5xgcI0dY3DQGVRbc9I=
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

T24gMDEvMTAvMjAxOSAxMToxMiwgVGVybyBLcmlzdG8gd3JvdGU6Cj4gT24gMDEvMTAvMjAxOSAw
ODowNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IE9uIDMwLzA5LzIwMTkgMjA6NDgsIFRlcm8g
S3Jpc3RvIHdyb3RlOgo+Pgo+Pj4gSG1taCwgYWZ0ZXIgc29tZSB0ZXN0aW5nLCBpdCBzZWVtcyB0
aGVyZSBpcyBiYWQgc3R1ZmYgaGFwcGVuaW5nIHdpdGggCj4+PiB0aGUgZGl2aWRlciBjbG9jayBp
bXBsZW1lbnRhdGlvbiwgSSBhbSByZS13b3JraW5nIGl0IGFzIG9mIG5vdy4gCj4+PiBCYXNpY2Fs
bHkgd2hhdCBpcyB3cm9uZyBpcyB0aGF0IHdpdGggYSBkaXZpZGVyIG1heCB2YWx1ZSBvZiBzYXkg
MTYsIAo+Pj4gdGhlIGRyaXZlciBhdHRlbXB0cyB0byBjcmFmdCB0aGUgbWF4IHZhbHVlIGludG8g
YSBtYXNrLCBidXQgdGhpcyBlbmRzIAo+Pj4gdXAgYmVpbmcgMHgxZi4gSWYgdGhlIG1heCB2YWx1
ZSBpcyAxNSwgaXQgZW5kcyB1cCBpbnRvIDB4ZiB3aGljaCBpcyAKPj4+IGNvcnJlY3QuCj4+Cj4+
IE9rLCB0aGF0IGV4cGxhaW5zIHRoZSBtYXggbm90IHdvcmtpbmcuCj4+Cj4+IEl0IGRvZXNuJ3Qg
ZXhwbGFpbiB0aGUgb3RoZXIgaXNzdWUsIHdoZXJlIHRoZSBUUk0gc2F5cyB0aGUgbWF4IGRpdiBp
cyAKPj4gMzIsIGJ1dCBpdCBkb2VzIG5vdCB3b3JrLiBCdXQgdGFraW5nIHRoZSBtYXggZGl2IGZy
b20gdGhlIG9sZCBTb0NzLCAKPj4gMTYsIGlzIG5vdCBjb3JyZWN0IGVpdGhlciwgYXMgaXQgc2Vl
bXMgdGhhdCBkaXZpZGVycyB1cCB0byAzMSB3b3JrIG9rLgo+Pgo+PiDCoMKgVG9taQo+Pgo+IAo+
IE9rLCBhdHRhY2hlZCBhIHNlcmllcyB0aGF0IGhvcGVmdWxseSBmaXhlcyBpdCwgYW55IHRlc3Rp
bmcgZmVlZGJhY2sgCj4gd2VsY29tZSBiZWZvcmUgSSBwb3N0IHRoaXMgcHJvcGVybHkuCj4gCj4g
VGhpcyBhbHNvIHN1cHBvcnRzIG9tYXAzNnh4IGRwbGw0X200X2NrIGRpdmlkZXIgdXAtdG8gMzEs
IG90aGVyIG9tYXAzIAo+IGZhbWlseSBpcyBsaW1pdGVkIHRvIDE2LgoKV29ya3MgZm9yIG1lLiBU
aGlzIGFsc28gbmVlZHMgdGhlIGNoYW5nZSB0byBkc3MuYyB0byBjaGFuZ2UgdGhlIG1heCBmcm9t
IAozMiB0byAzMS4gSSdsbCBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQgc2VwYXJhdGVseS4KCiAgVG9t
aQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAw
MTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2th
L0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
