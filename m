Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C81281D
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4032F89623;
	Fri,  3 May 2019 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF62896ED
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 15:36:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6DF5AB91;
 Thu,  2 May 2019 15:36:28 +0000 (UTC)
Subject: Re: [PATCH v9 2/2] phy: Add driver for mixel mipi dphy found on NXP's
 i.MX8 SoCs
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>
References: <cover.1556633413.git.agx@sigxcpu.org>
 <b999b07673e59c676d2e43a786b635beb056e9bf.1556633413.git.agx@sigxcpu.org>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Openpgp: preference=signencrypt
Organization: SUSE Linux GmbH
Message-ID: <4ce62b78-64ac-ca84-733f-bc4d10a67c54@suse.de>
Date: Thu, 2 May 2019 17:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b999b07673e59c676d2e43a786b635beb056e9bf.1556633413.git.agx@sigxcpu.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Li Jun <jun.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Abel Vesa <abel.vesa@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMTkgdW0gMTY6NDAgc2NocmllYiBHdWlkbyBHw7xudGhlcjoKPiBUaGlzIGFkZHMg
c3VwcG9ydCBmb3IgdGhlIE1peGVsIERQSFkgYXMgZm91bmQgb24gaS5NWDggQ1BVcyBidXQgc2lu
Y2UKPiB0aGlzIGlzIGFuIElQIGNvcmUgaXQgd2lsbCBsaWtlbHkgYmUgZm91bmQgb24gb3RoZXJz
IGluIHRoZSBmdXR1cmUuIFNvCj4gaW5zdGVhZCBvZiBhZGRpbmcgdGhpcyB0byB0aGUgbndsIGhv
c3QgZHJpdmVyIG1ha2UgaXQgYSBnZW5lcmljIFBIWQo+IGRyaXZlci4KPiAKPiBUaGUgZHJpdmVy
IHN1cHBvcnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBj
YW4gYmUKPiBhZGRlZCBvbmNlIHRoZSBuZWNlc3Nhcnkgc3lzdGVtIGNvbnRyb2xsZXIgYml0cyBh
cmUgaW4gdmlhCj4gbWl4ZWxfZHBoeV9kZXZkYXRhLgo+IAo+IENvLWF1dGhvcmVkLWJ5OiBSb2Jl
cnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+CgpUaGlzIHNob3VsZCBiZSBDby1kZXZl
bG9wZWQtYnkgYW5kIGlzIGxhY2tpbmcgYSBTaWduZWQtb2ZmLWJ5IGZyb20gdGhhdAphdXRob3Iu
IFJvYmVydCwgY2FuIHlvdSBwbGVhc2UgcHJvdmlkZSBvbmU/CgpodHRwczovL3d3dy5rZXJuZWwu
b3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3doZW4t
dG8tdXNlLWFja2VkLWJ5LWNjLWFuZC1jby1kZXZlbG9wZWQtYnkKCj4gU2lnbmVkLW9mZi1ieTog
R3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KVGhhbmtzLApBbmRyZWFzCgotLSAKU1VT
RSBMaW51eCBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKR0Y6
IEZlbGl4IEltZW5kw7ZyZmZlciwgTWFyeSBIaWdnaW5zLCBTcmkgUmFzaWFoCkhSQiAyMTI4NCAo
QUcgTsO8cm5iZXJnKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
