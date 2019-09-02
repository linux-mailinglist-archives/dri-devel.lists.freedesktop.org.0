Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C1A540C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 12:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CB89B11;
	Mon,  2 Sep 2019 10:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03olkn0807.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::807])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5021B89B11
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 10:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7RL4JzppThEOGuni15BfXQKo4eraxoUWeYC5SS+EC/O6myKg+q0rXwYK03QFGa6qIhvITEsg5SyOOmOHKrIVmPJyfNKKHWv3/zPQR+hA+4t6JQtSTkVFho7a94S//JdUQqgSbytC7pDQE+kDBf4K5BbDDYJQ27TGkaBl16TsOYWgJDnOyAL4+rVdwRTOUr+dqp1au5hiJFtY2T2q63GvCmwuXY9rOftEAVxbhIeDS76rVxl8E421mIIturOK8TRdMRi9ypMLXRcAaLXlZZ/zU+1pDfY3nIj0PDPL1pXE0fWCN/Ucc/p1T1UtYpkpmnLo9hz06fDF954Wy7rCtb9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMy0bYrDmhv8lbTruCvXNPgcPqXv372WjYxd1S80E7s=;
 b=PqtFtgL9qfsy0+lXQqm0r+aiFCzXFgUKeEHG0vuhKuqsbJWTnpU/8WabxMADJi0tvNEF8iU3AyTPyJdvOpNZh4KADA7pFGOmngtsalc/1M4jgebM2TGfUxLdnRONL1p0GhLjCVB9clb51XFUSjKkNvr95BzCQwX0VRqqqwTupgH/w3H+RbqGIpmtI14qQ0UJWXOd5tNBddYlm/9B9OEjSG0rm4C4rQWBX4Hh5ZvtdIcaB/+sWZEQz9iALGOaw6UePy9r+uAK1EY06msfjXm6YgP6PdkhlHyfTXjPXJSeZQOsUmE/NpBgg7EDslji/8znAj9zGoB/P+4BQaKfwBHuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (10.152.16.56) by AM5EUR03HT039.eop-EUR03.prod.protection.outlook.com
 (10.152.17.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Mon, 2 Sep
 2019 10:32:38 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.16.60) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Mon, 2 Sep 2019 10:32:38 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:32:37 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <narmstrong@baylibre.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Topic: [PATCH v2] drm: dw-hdmi-i2s: enable audio clock in audio_startup
Thread-Index: AQHVYUIsW0s7539kVU2Jt4QPypUBOKcYIv4AgAAN9AA=
Date: Mon, 2 Sep 2019 10:32:37 +0000
Message-ID: <HE1PR06MB4011E2F58875F30446D902BFACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190902035435.44463-1-cychiang@chromium.org>
 <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
In-Reply-To: <241fd791-3792-34c8-ac35-a81a0a41070c@baylibre.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0020.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::30) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:11AFA484E24FBB2CDB4BF31F98FE745128D47FBAE604F925178CCA20798AFEF0;
 UpperCasedChecksum:CEAEE32EF148EBB03EB444A95DF68042F6507D089325A6FC5FE9125E539400DE;
 SizeAsReceived:8557; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [A8LugvH9kj5T4xfRlk+80mbCfMFbMrmW]
x-microsoft-original-message-id: <d6fa2d56-335b-e15d-da18-749ea0341fad@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:AM5EUR03HT039; 
x-ms-traffictypediagnostic: AM5EUR03HT039:
x-microsoft-antispam-message-info: aPYwSGaRGf/92nAQF7WaYOyubhfYLufZAH+FzJ9zdaNyO4ale39c/SDQ8VerWyS8qfidyZqVm3lWQUxlMf+YMp5pW0YO74TbIMgWC/2ck7aCNT3CyKJ20Wf8vQFlvNnlI8Z1eNL4y0AeZsmrzNHr8rmgL2Wq8nVdVEjB6Jo8ZgQeqi27NodGvdkrcyadRWyZ
x-ms-exchange-transport-forked: True
Content-ID: <28AEFB56CC9D7540A050CC1E73674443@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f14e6ad-372f-4349-ed8d-08d72f90dfc7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:32:37.8279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT039
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMiAxMTo0MiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAwMi8wOS8yMDE5IDA1OjU0LCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6DQo+PiBJbiB0aGUgZGVz
aWdud2FyZSBkYXRhYm9vaywgdGhlIHNlcXVlbmNlIG9mIGVuYWJsaW5nIGF1ZGlvIGNsb2NrIGFu
ZA0KPj4gc2V0dGluZyBmb3JtYXQgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkLg0KPj4gQ3VycmVu
dGx5LCBhdWRpbyBjbG9jayBpcyBlbmFibGVkIGluIHRoZSBlbmQgb2YgaHdfcGFyYW0gb3BzIGFm
dGVyDQo+PiBzZXR0aW5nIGZvcm1hdC4NCj4+DQo+PiBPbiBzb21lIG1vbml0b3JzLCB0aGVyZSBp
cyBhIHBvc3NpYmlsaXR5IHRoYXQgYXVkaW8gZG9lcyBub3QgY29tZSBvdXQuDQo+PiBGaXggdGhp
cyBieSBlbmFibGluZyBhdWRpbyBjbG9jayBpbiBhdWRpb19zdGFydHVwIG9wcw0KPj4gYmVmb3Jl
IGh3X3BhcmFtIG9wcyBzZXR0aW5nIGZvcm1hdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaGVu
Zy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4NCj4+IFJldmlld2VkLWJ5OiBEb3Vn
bGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+PiBSZXZpZXdlZC1ieTogSm9u
YXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KPj4gVGVzdGVkLWJ5OiBEb3VnbGFzIEFuZGVy
c29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+PiAtLS0NCj4+ICBDaGFuZ2VzIGZyb20gdjE6
DQo+PiAgMS4gTW92ZSBhdWRpb19zdGFydHVwIHRvIHRoZSBmcm9udCBvZiBhdWRpb19zaHV0ZG93
bi4NCj4+ICAyLiBGaXggdGhlIGluZGVudGF0aW9uIG9mIGF1ZGlvX3N0YXJ0dXAgZXF1YWwgc2ln
biB1c2luZyB0YWIuDQo+PiAgMy4gUmViYXNlIHRoZSBwYXRjaCBvbiBsaW51eC1uZXh0L21hc3Rl
ci4NCj4+ICA0LiBBZGQgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieSBmaWVsZHMgZnJvbSBkaWFu
ZGVyc0BjaHJvbWl1bS5vcmcuDQo+PiAgNS4gQWRkIFJldmlld2VkLWJ5IGZpZWxkIGZyb20gam9u
YXNAa3dpYm9vLnNlLg0KPj4NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWktaTJzLWF1ZGlvLmMgfCA5ICsrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWkycy1hdWRpby5jDQo+PiBpbmRleCAxZDE1Y2Y5YjY4MjEuLjM0ZDhlODM3
NTU1ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS1pMnMtYXVkaW8uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWkycy1hdWRpby5jDQo+PiBAQCAtMTA5LDYgKzEwOSwxNCBAQCBzdGF0aWMgaW50
IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+
PiAgCWhkbWlfd3JpdGUoYXVkaW8sIGNvbmYwLCBIRE1JX0FVRF9DT05GMCk7DQo+PiAgCWhkbWlf
d3JpdGUoYXVkaW8sIGNvbmYxLCBIRE1JX0FVRF9DT05GMSk7DQo+PiAgDQo+PiArCXJldHVybiAw
Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsJc3RydWN0IGR3X2hk
bWlfaTJzX2F1ZGlvX2RhdGEgKmF1ZGlvID0gZGF0YTsNCj4+ICsJc3RydWN0IGR3X2hkbWkgKmhk
bWkgPSBhdWRpby0+aGRtaTsNCj4+ICsNCj4+ICAJZHdfaGRtaV9hdWRpb19lbmFibGUoaGRtaSk7
DQo+PiAgDQo+PiAgCXJldHVybiAwOw0KPj4gQEAgLTE1Myw2ICsxNjEsNyBAQCBzdGF0aWMgaW50
IGR3X2hkbWlfaTJzX2dldF9kYWlfaWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25l
bnQsDQo+PiAgDQo+PiAgc3RhdGljIHN0cnVjdCBoZG1pX2NvZGVjX29wcyBkd19oZG1pX2kyc19v
cHMgPSB7DQo+PiAgCS5od19wYXJhbXMJPSBkd19oZG1pX2kyc19od19wYXJhbXMsDQo+PiArCS5h
dWRpb19zdGFydHVwICA9IGR3X2hkbWlfaTJzX2F1ZGlvX3N0YXJ0dXAsDQo+PiAgCS5hdWRpb19z
aHV0ZG93bgk9IGR3X2hkbWlfaTJzX2F1ZGlvX3NodXRkb3duLA0KPj4gIAkuZ2V0X2VsZAk9IGR3
X2hkbWlfaTJzX2dldF9lbGQsDQo+PiAgCS5nZXRfZGFpX2lkCT0gZHdfaGRtaV9pMnNfZ2V0X2Rh
aV9pZCwNCj4+DQo+IExvb2tzIHNhbmUsIEpvbmFzIHNob3VsZCBJIGFwcGx5IGl0IG5vdyBpdCdz
IHJlYmFzZWQgPw0KDQpTdXJlLCBsb29rcyBzYW5lIGFuZCBjb21waWxlcyB3aXRob3V0IHdhcm5p
bmdzIG9uIG15IGJ1aWxkIGhvc3QuDQoNClJlZ2FyZHMsDQpKb25hcw0KDQo+DQo+IE5laWwNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
