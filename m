Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E6C63B9E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E9E10E08F;
	Mon, 17 Nov 2025 11:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=szczodrzynski.pl header.i=@szczodrzynski.pl header.b="NLxuGAVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s2.avantea.pl (s2.avantea.pl [46.242.128.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ADA10E08F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
 :From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5vQb0kOt03xdg4mAHFEyfGbNg93voYMkCIDEWmXv3sI=; b=NLxuGAVPYfKBLjm4HnYWIROAnw
 vT+06H8WujBGR7lc09kFGCBepd4Dd9c3qIavE9GdezJcI2PEJEwezcKKK9+8gVcPj/joeHBsXFKlo
 6b8yTpe9dRV7Ix1CMyGZHZ7edl2it8qDxYd+j5zy4ycaCWIw8Es9K/N9Vzd16VBMYtyOox1raf64h
 tREEzAV2+hHOnQVp3Trjdtk1gN/rF5pjpgoTXx/3a5wzzh6IshemL0ZZSDFazANJhUYF7rzZj4fUC
 DcIbErlQPnj5VR+V+kMPmZqDsl5mFDpPujp5Q3VDq3qzyhZMy9oiXsFY3mwPFQiVHSL9F3pdl/Hi0
 JWLoRscg==;
Received: from d100-116.icpnet.pl ([77.65.100.116] helo=[192.168.0.120])
 by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <kuba@szczodrzynski.pl>)
 id 1vKx6F-0000000GvqE-1Xuy; Mon, 17 Nov 2025 12:08:47 +0100
Message-ID: <a0347d10-475d-4dd2-b53e-ca7905869887@szczodrzynski.pl>
Date: Mon, 17 Nov 2025 12:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 parthiban@linumiz.com, paulk@sys-base.io
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
 <20251117-faithful-unique-millipede-d8bae5@kuoka>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <20251117-faithful-unique-millipede-d8bae5@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Authenticated-Id: kuba@szczodrzynski.pl
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDIwMjUtMTEtMTcgb8KgMDg6MDU6MzMsIEtyenlzenRvZiBLb3psb3dza2kgcGlz
emU6DQoNCj4gT24gU3VuLCBOb3YgMTYsIDIwMjUgYXQgMDI6NDk6NDNQTSArMDEwMCwgS3Vi
YSBTemN6b2RyennFhHNraSB3cm90ZToNCj4+IFRoZSBzdW40aSBUQ09OIG5lZWRzIGEgcmVm
ZXJlbmNlIHRvIHRoZSBELVBIWSBpbiBvcmRlciB0byBzdXBwb3J0IExWRFMNCj4+IG9uIEFs
bHdpbm5lciBEMXMvVDExMy4NCj4+DQo+PiBBZGQgcGh5cyBhbmQgcGh5LW5hbWVzIHRvIERU
IGJpbmRpbmdzLg0KPiBEbyBub3QgYXR0YWNoICh0aHJlYWQpIHlvdXIgcGF0Y2hzZXRzIHRv
IHNvbWUgb3RoZXIgdGhyZWFkcyAodW5yZWxhdGVkDQo+IG9yIG9sZGVyIHZlcnNpb25zKS4g
VGhpcyBidXJpZXMgdGhlbSBkZWVwIGluIHRoZSBtYWlsYm94IGFuZCBtaWdodA0KPiBpbnRl
cmZlcmUgd2l0aCBhcHBseWluZyBlbnRpcmUgc2V0cy4gU2VlIGFsc286DQo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2LXJjMi9zb3VyY2UvRG9jdW1lbnRhdGlv
bi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDgzMA0KDQpJJ2xsIHJlc2VuZCB2
NCBhcyBhIG5ldyBwYXRjaHNldC4NCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogS3ViYSBTemN6
b2RyennFhHNraSA8a3ViYUBzemN6b2Ryenluc2tpLnBsPg0KPj4gLS0tDQo+PiAgIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNvbi55YW1sICAgICAgICAg
IHwgNiArKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNvbi55YW1s
DQo+PiBpbmRleCA3MjRkOTNiOTEuLjUyNTg5MzQxZiAxMDA2NDQNCj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1h
MTAtdGNvbi55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbA0KPj4gQEAgLTExNSw2
ICsxMTUsMTIgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgICAgIC0gY29uc3Q6IGVkcA0K
Pj4gICAgICAgICAgICAgLSBjb25zdDogbHZkcw0KPj4gICANCj4+ICsgIHBoeXM6DQo+PiAr
ICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBwaHktbmFtZXM6DQo+PiArICAgIGNvbnN0
OiBjb21iby1waHkNCj4gRHJvcCBwaHkgc3VmZml4LiBDYW4gYSAicGh5IiBwcm9wZXJ0eSBo
b2xkIHJlZmVyZW5jZSB0byBzb21ldGhpbmcgZWxzZQ0KPiB0aGFuIHBoeT8NCg0KV2lsbCBk
by4NCg0KPiBZb3UgZG9uJ3QgbmVlZCBuYW1lcyBpbiB0aGUgZmlyc3QgcGxhY2UsIHlvdSBo
YXZlIG9ubHkgb25lDQo+IGVudHJ5Lg0KDQpIb3dldmVyLCBwaHktbmFtZXMgd2FzIGFkZGVk
IGJlY2F1c2Ugb2YgaG93IG90aGVyIGJpbmRpbmdzIGFyZSBtYWRlLCBzdWNoIGFzICJhbGx3
aW5uZXIsc3VuNGktYTEwLW11c2IiIChzaW5nbGUgcGh5IGVudHJ5IHdpdGggY29uc3QgbmFt
ZSkuDQoNClNvIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8ga2VlcCBpdCwgaW4gbGluZSB3
aXRoIG90aGVyIGRyaXZlcnMuDQoNClJlZ2FyZHMNCkt1YmENCg0KPg0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPg0K
