Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9164E12A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F76E840;
	Fri, 21 Jun 2019 07:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15C86E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 08:50:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K8oPWT013042;
 Thu, 20 Jun 2019 03:50:25 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K8oPQN092929
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 03:50:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 03:50:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 03:50:25 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K8oIqb044496;
 Thu, 20 Jun 2019 03:50:19 -0500
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
From: Kishon Vijay Abraham I <kishon@ti.com>
To: Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Guido_G=c3=bcnther?=
 <agx@sigxcpu.org>
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
 <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
 <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
Message-ID: <9a872f5b-1544-32a0-bd93-1d6333468114@ti.com>
Date: Thu, 20 Jun 2019 14:18:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561020625;
 bh=ZvdTayQSZVxrbxnmLhuudH8+x8XODmTbZSOFAYzkOH0=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=yQcQxeYXgas589nX61LGHgsETt9+I5jlLjqKaFQO/0cV80Umo8zpuMb9/74EeQj+W
 pvcqdtOdUQsiPDP7w3uwKlyIXJzO7jrnZSRr+749ZIwZW5UpiNi2dr+dy5UG6528JU
 YkxAWMVgKoblEXhXllSZe43sV0TPyezzuTVh1UXc=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abel.vesa@nxp.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyNC8wNS8xOSA5OjMxIFBNLCBLaXNob24gVmlqYXkgQWJyYWhhbSBJIHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDI0LzA1LzE5IDU6NTMgUE0sIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4+IEhp
IEtpc2hvbiwKPj4KPj4gT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgNzo0OSBBTSBHdWlkbyBHw7xu
dGhlciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKPj4+Cj4+PiBUaGlzIGFkZHMgc3VwcG9ydCBm
b3IgdGhlIE1peGVsIERQSFkgYXMgZm91bmQgb24gaS5NWDggQ1BVcyBidXQgc2luY2UKPj4+IHRo
aXMgaXMgYW4gSVAgY29yZSBpdCB3aWxsIGxpa2VseSBiZSBmb3VuZCBvbiBvdGhlcnMgaW4gdGhl
IGZ1dHVyZS4gU28KPj4+IGluc3RlYWQgb2YgYWRkaW5nIHRoaXMgdG8gdGhlIG53bCBob3N0IGRy
aXZlciBtYWtlIGl0IGEgZ2VuZXJpYyBQSFkKPj4+IGRyaXZlci4KPj4+Cj4+PiBUaGUgZHJpdmVy
IHN1cHBvcnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBj
YW4gYmUKPj4+IGFkZGVkIG9uY2UgdGhlIG5lY2Vzc2FyeSBzeXN0ZW0gY29udHJvbGxlciBiaXRz
IGFyZSBpbiB2aWEKPj4+IG1peGVsX2RwaHlfZGV2ZGF0YS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBS
b2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogRmFi
aW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4KPj4gV291bGQgeW91IGhhdmUgYW55IGNvbW1lbnRz
IG9uIHRoaXMgc2VyaWVzLCBwbGVhc2U/Cj4gCj4gSSBkb24ndCBoYXZlIGFueSBjb21tZW50cy4g
SSdsbCBxdWV1ZSB0aGlzIG9uY2UgSSBzdGFydCBxdWV1aW5nIHBhdGNoZXMgZm9yIHRoZQo+IG5l
eHQgbWVyZ2Ugd2luZG93LgoKQ2FuIHlvdSBmaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdh
cm5pbmcgYW5kIHJlcG9zdD8KV0FSTklORzogcXVvdGVkIHN0cmluZyBzcGxpdCBhY3Jvc3MgbGlu
ZXMKIzQyMDogRklMRTogZHJpdmVycy9waHkvZnJlZXNjYWxlL3BoeS1mc2wtaW14OC1taXBpLWRw
aHkuYzoyODA6CisJZGV2X2RiZygmcGh5LT5kZXYsICJoc19wcmVwYXJlOiAldSwgY2xrX3ByZXBh
cmU6ICV1LCAiCisJCSJoc196ZXJvOiAldSwgY2xrX3plcm86ICV1LCAiCgpXQVJOSU5HOiBxdW90
ZWQgc3RyaW5nIHNwbGl0IGFjcm9zcyBsaW5lcwojNDIxOiBGSUxFOiBkcml2ZXJzL3BoeS9mcmVl
c2NhbGUvcGh5LWZzbC1pbXg4LW1pcGktZHBoeS5jOjI4MToKKwkJImhzX3plcm86ICV1LCBjbGtf
emVybzogJXUsICIKKwkJImhzX3RyYWlsOiAldSwgY2xrX3RyYWlsOiAldSwgIgoKV0FSTklORzog
cXVvdGVkIHN0cmluZyBzcGxpdCBhY3Jvc3MgbGluZXMKIzQyMjogRklMRTogZHJpdmVycy9waHkv
ZnJlZXNjYWxlL3BoeS1mc2wtaW14OC1taXBpLWRwaHkuYzoyODI6CisJCSJoc190cmFpbDogJXUs
IGNsa190cmFpbDogJXUsICIKKwkJInJ4aHNfc2V0dGxlOiAldVxuIiwKClRoYW5rcwpLaXNob24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
