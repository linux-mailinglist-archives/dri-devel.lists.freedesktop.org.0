Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D391A4A6A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 18:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5197C89A20;
	Sun,  1 Sep 2019 16:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071032.outbound.protection.outlook.com [40.92.71.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2F89A20
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 16:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkhux6+AE/1DOHChi7fUlubTn3/6pSvBz/1rVnqovlg0oLFpSDyx2b2pyPfTsYWUftD5EAds1OQ5f8z2vLu4uYqtqylEbRAh/sobs4YuLGtYHtElytseivzkoj+ttQKqKdtKtbqeE5dproyXs+yDchetwwkRNh05VgrMfDyMhWRaVQOQzI99Q3Lgknz4HZObak721Vp9kYOiZFbUpRTErJdpgZj+rig/6ZCl+w2N8NaBdcRoFcFy+Q3GbcA143pT5CY1k6WqZAFF5023z3TTZiU45T+5L871OATB95v+Hroh3k5aRkMmZnMpQeDqwMhytTiqAkyUtQF7tNwQNDjXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLJtoCzDJNY/CcxNHHJl9o4t3FBNoV7rKe7pevnZ9m0=;
 b=AY7WLoSXV844bAgngg9zkkf9m5/4ahkUhUTD1hDukbsFtGr4W2OmdY02lieHCGhCgN48GUxIXjXgpeJIs4YhXiBeSNg/9PqWYnSG9QMcWAXwhRNywvJxmUQg4QIZHErf9Pr/H4Oot1Ks2r3NRgTm+HfvxdEcT1SXLWH5PxG+tDkGEdigF6vAEp4gL9UVXTzenxBxIqaNXQSErSjPmvA7cd4U0ns7+6BX++tE9VuEM4jzXylybRDfiy4S6fidOiY2DC99u+mDXDf42O4HyFB3QvzU1By2BPOwvjThJG+8VpOFNPSs8MRAxWizRFPDq28GHq6/zd81wal71K3aV5uV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (10.152.16.53) by AM5EUR03HT188.eop-EUR03.prod.protection.outlook.com
 (10.152.16.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 16:13:02 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 16:13:02 +0000
Received: from AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87]) by AM0PR06MB4004.eurprd06.prod.outlook.com
 ([fe80::f13e:4f8e:6777:bb87%5]) with mapi id 15.20.2220.021; Sun, 1 Sep 2019
 16:13:02 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 0/5] drm: dw-hdmi: update CEC phys addr, EDID and ELD on HPD
 event
Thread-Topic: [PATCH 0/5] drm: dw-hdmi: update CEC phys addr, EDID and ELD on
 HPD event
Thread-Index: AQHVYOAhowBdBz5xQkqSWjvcRAQJSg==
Date: Sun, 1 Sep 2019 16:13:02 +0000
Message-ID: <AM0PR06MB40049562E295DD62302C8DB7ACBF0@AM0PR06MB4004.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::18) To AM0PR06MB4004.eurprd06.prod.outlook.com
 (2603:10a6:208:b9::12)
x-incomingtopheadermarker: OriginalChecksum:E4393DA71E2F410A12F8981015122C62AF4711F9ED2DFF715BC0D5C8D3F970C9;
 UpperCasedChecksum:F6DE029D5D00FC6FD7AEAE39E5F9E9D8625C04949083F24216688045CCD3EA41;
 SizeAsReceived:7840; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [a7AvW449qzZxs58lixq1hRuVn+jLdMQo]
x-microsoft-original-message-id: <20190901161251.1500-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT188; 
x-ms-traffictypediagnostic: AM5EUR03HT188:
x-microsoft-antispam-message-info: DRht/ZvSsUtZBQwTwt15AkWglj+1EvE3FQOK80HJ/2AoF+bFa+cYomVMFM6hJHtzeNRJ9+sRHtQRA+zE53HoM3MmT84a26/sYmvPu5rupVs0zxh7HJhT35KeZyLyLy8TnnPUG/a/98ElkowSZhzXyhVRsNNZjoP6XFkGC6PMc8By2FOzBL5v+LYiFBmLWCPQ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c371f1c4-29dc-4be7-ed11-08d72ef74356
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 16:13:02.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT188
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgY2hhbmdlIGR3LWhkbWkgdG8gdXBkYXRlIENFQyBwaHlzIGFkZHIsIEVESUQg
YW5kIEVMRCBvbiBIUEQgZXZlbnQsCnRoaXMgZml4ZXMgbG9zdCBDRUMgcGh5cyBhZGRyIGFuZCBz
dGFsZSBFRElEL0VMRCB3aGVuIEhETUkgY2FibGUgaXMKdW5wbHVnZ2VkL3JlcGx1Z2dlZCBvciBB
VlIgaXMgcG93ZXJlZCBvbi9vZmYuCgpQYXRjaCAxIGFuZCAyIGV4dHJhY3RzIGNvZGUgaW50byBh
IGR3X2hkbWlfY29ubmVjdG9yX3VwZGF0ZV9lZGlkKCkgaGVscGVyCmFuZCBtb3ZlcyBkd19oZG1p
X2Nvbm5lY3Rvcl9kZXRlY3QoKSB0byBiZSBhYmxlIHRvIGNhbGwgdGhpcyBoZWxwZXIuCgpQYXRj
aCAzIG1vdmVzIENFQyBwaHlzIGFkZHIgaW52YWxpZGF0aW9uIGZyb20gZHdfaGRtaV9pcnEoKSB0
bwpkd19oZG1pX2Nvbm5lY3Rvcl9kZXRlY3QoKSBhbmQgZW5zdXJlIGNvbm5lY3RvciBFRElEIHBy
b3BlcnR5IGdldHMgdXBkYXRlZC4KSSBvcHRlZCB0byBub3QgdXNlIGNlY19ub3RpZmllcl9tdXRl
eCBhZnRlciB0aGUgbW92ZSwgcGxlYXNlIGFkdmlzZS4KClBhdGNoIDQgYW5kIDUgZW5zdXJlcyBF
TEQgZ2V0cyB1cGRhdGVkIGFsbG93aW5nIHVzZXJzcGFjZSB0byBxdWVyeSB0aGUgbGF0ZXN0CmNh
cGFiaWxpdGllcyB3aGVuIGEgQVZSIGlzIHBvd2VyZWQgb24gYW5kIEVESUQgZ2V0cyB1cGRhdGVk
LgpUaGlzIHJldmVydHMgYSBwcmV2aW91cyBjaGFuZ2UgdG8gbWFrZSBkcm1fZWRpZF90b19lbGQo
KSBzdGF0aWMsIHBsZWFzZSBhZHZpc2UuCgpOZXh0IHN0ZXAgYWZ0ZXIgdGhpcyB3b3VsZCBiZSB0
byBhZGQgc3VwcG9ydCBmb3Igc2lnbmFsaW5nClNORFJWX0NUTF9FVkVOVF9NQVNLX1ZBTFVFIHRv
IHVzZXJzcGFjZSB3aGVuIEVMRCBjaGFuZ2VzLgoKUmVnYXJkcywKSm9uYXMKCkpvbmFzIEthcmxt
YW4gKDUpOgogIGRybTogZHctaGRtaTogZXh0cmFjdCBkd19oZG1pX2Nvbm5lY3Rvcl91cGRhdGVf
ZWRpZCgpCiAgZHJtOiBkdy1oZG1pOiBtb3ZlIGR3X2hkbWlfY29ubmVjdG9yX2RldGVjdCgpCiAg
ZHJtOiBkdy1oZG1pOiB1cGRhdGUgQ0VDIHBoeXMgYWRkciBhbmQgRURJRCBvbiBIUEQgZXZlbnQK
ICBSZXZlcnQgImRybS9lZGlkOiBtYWtlIGRybV9lZGlkX3RvX2VsZCgpIHN0YXRpYyIKICBkcm06
IGR3LWhkbWk6IHVwZGF0ZSBFTEQgb24gSFBEIGV2ZW50CgogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA1NyArKysrKysrKysrKysrKy0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAgICAgICAgICAgfCAgNSArLQogaW5jbHVkZS9kcm0v
ZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
