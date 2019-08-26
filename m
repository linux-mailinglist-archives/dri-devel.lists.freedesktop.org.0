Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B79D7F2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 23:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49936E266;
	Mon, 26 Aug 2019 21:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700088.outbound.protection.outlook.com [40.107.70.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECDD6E266
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 21:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nn7pzXW9xbLfKbjDERh9mQNdEKYf+PZBILuTe6pzLgNJ5agheyLo7k6A5TYV2jkS6rACJLvFjLel4+GCHPXhtCUFTR/t/aPjDNCo7HGiK2eR87Qg9ys+g/jM8/6C/Us/8UUtQPS6Uj+yzW5iZbUy1KoZWg47YFko55bETIOKz7MsP5GN75ynV0ugNgOcJbxJlfLFsue2l0funNS123BB6fkTv2IBwy9vsqbkMxV1DMZgppfrGy50uacodqP2waOeTdXxm3mU6UfIwJWAjF5jthuAWc4lTDpHiiGlkP6GY5PY/j5kd8fg1roEmC8pFHpOn4QyOkBB8ErwFoWRob4t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XrEZ+pKl0mpIIIdBqGfAjfj1fmXQuCIq7FLZpRCLG0=;
 b=XECc7bTPzVwyqRYRg41qWPL5EorSQ3cZiKeb/heiGNFGe5JjFVngK8AAP5XEb2Uw08R5NtxjEpUmk/yXSSrwoGasasa1qYrxIGh1ZQQWeMRPzXKURs1SpcRV+8Sl+eeEB/MbdQ5gxf/55mR67qzW0Ky6Af2Hvorx+2KeCRUvGv3Bh0xlaNDZmj9PsOfYmEfZsvUuxEjM04K4lwdGt3I7UZL7ZtXAcbGBTdehJ/IFI6IyZPIbnS3Ymp3RbxaNWjJ8Aj8jYdgGeCOZd+ipg9vbsmfUatz/Zygatjgl5j8kSN9d3Y1GMZZMte/cnW1ky6MvmLs2XLaWvMF41w8ufBLXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0232.namprd12.prod.outlook.com (10.174.52.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 21:12:57 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 21:12:57 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Dave Airlie <airlied@gmail.com>, "Francis, David" <David.Francis@amd.com>
Subject: Re: [PATCH v4 0/5] MST DSC support in drm-mst
Thread-Topic: [PATCH v4 0/5] MST DSC support in drm-mst
Thread-Index: AQHVWPGWSCdj/c3IHUauPGfajcy6MacH2o8AgAFVAQCABK2wAIAAFuoA
Date: Mon, 26 Aug 2019 21:12:56 +0000
Message-ID: <dee304ae-d674-cc05-d7cb-42433206309d@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
 <f9d4069b4ff7818db49177527820ebcb5e8b8dc1.camel@redhat.com>
 <BN8PR12MB3217665BEE3614FD2396520BEFA40@BN8PR12MB3217.namprd12.prod.outlook.com>
 <CAPM=9tw8501utfWGV6m+kFGTuO4AsKmxZ5bfHi9A_vXmf9_ogg@mail.gmail.com>
In-Reply-To: <CAPM=9tw8501utfWGV6m+kFGTuO4AsKmxZ5bfHi9A_vXmf9_ogg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 368ac65f-7f4b-4b17-d378-08d72a6a2aaa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0232; 
x-ms-traffictypediagnostic: CY4PR1201MB0232:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0232534822CFB3BFB789330D8CA10@CY4PR1201MB0232.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(54906003)(2906002)(110136005)(305945005)(7736002)(4326008)(316002)(11346002)(8936002)(2616005)(476003)(486006)(8676002)(81156014)(81166006)(36756003)(6246003)(25786009)(58126008)(14444005)(53546011)(229853002)(386003)(478600001)(5660300002)(6506007)(71200400001)(6486002)(76176011)(71190400001)(6436002)(446003)(186003)(26005)(6306002)(966005)(6512007)(66066001)(65956001)(65806001)(102836004)(66476007)(64756008)(66556008)(66446008)(66946007)(6116002)(3846002)(6636002)(99286004)(31686004)(14454004)(256004)(53936002)(52116002)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0232;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3wCnqZyQLOEKq1nXHh9nI8lvss8JVXNvaxNb1JdX+4cugOqq93TrAQRMsxezU0VppX6sNzqXztT8H+uOgsjEvWL8EA/KrCsWmCqwP9zgU4nwt8UMytcpHtxMJJiB+9GbkjpBjUdKtuW8Et5bCcj24DXgDzoeuHrNnlpwAKDUMq2v9l5WKGIrvAwbljPWBbeS/zmvT1homaXpsN6HBVIEIXA0hPkEwfxrb1PdMmGJOWR60wZyU3IO7GNvznk//nSgGTGXMaNngUlxlM376esBMMHKG9hLYk5Jg1hbBDEXoizMw5mqLYQjdkkOUYUHiKZm8n3ry1KQF4hpD/yEPocafAer64dt+dkunrX3pdGNxEpWhhnc7EGS2W1zTlpWS8IJErHTtxUUqCTefII9xadpHAbO3tCJ1cpArgm31+6FQcg=
Content-ID: <7B3CB26953654E4EBA05B14F9744521D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ac65f-7f4b-4b17-d378-08d72a6a2aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 21:12:56.9301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dvSONoPuRnkIChg4zAj+yf765+xitO5v4pZR2yMoQjrguoNE0eS/JBiD0VC1/VPd1N7QwZfyxr32T7ByTVOR/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XrEZ+pKl0mpIIIdBqGfAjfj1fmXQuCIq7FLZpRCLG0=;
 b=ABhN86Gfna8Jyd/3quUx5pIXMnN7zSiIq1GmJ8u3QyA+/VALmw1X8bjowI4CVnCVcIJmtScuBQwodlA8Chepou5PkSb0PqRotKmwPs/9ig70wk7cdysKzewPjWjUPHi5Ag61insSyZ7uzXTnfcIiSigTU4phJuhTzXtIrtMJ0W0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, "Lipski,
 Mikita" <Mikita.Lipski@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAzOjUwIHAubS4sIERhdmUgQWlybGllIHdyb3RlOg0KPiBPbiBTYXQsIDI0
IEF1ZyAyMDE5IGF0IDA2OjI0LCBGcmFuY2lzLCBEYXZpZCA8RGF2aWQuRnJhbmNpc0BhbWQuY29t
PiB3cm90ZToNCj4+DQo+PiBBZGRpbmcgRFNDIGZ1bmN0aW9uYWxpdHkgdG8gZHJtX2RwX21zdF9h
dG9taWNfY2hlY2soKSBpcyBhIGdvb2QgaWRlYS4NCj4+IEhvd2V2ZXIsIHVudGlsIGFtZGdwdSBz
d2l0Y2hlcyBvdmVyIHRvIHRoYXQgc3lzdGVtLCBJIHdvdWxkbid0IGJlIGFibGUNCj4+IHRvIHRl
c3QgdGhvc2UgY2hhbmdlcy4gTWFraW5nIHRoYXQgc3dpdGNoIGlzIG9uIG91ciBUT0RPIGxpc3Qs
IGFuZCBpdCB3b3VsZA0KPj4gZml4IGEgbnVtYmVyIG9mIHByb2JsZW1zIHdpdGggb3VyIGN1cnJl
bnQgTVNUIGltcGxlbWVudGF0aW9uLCBidXQNCj4+IGl0J3MgZ29pbmcgdG8gYmUgYSBtYWpvciBy
ZXdyaXRlLg0KPj4NCj4+IE1TVCBEU0MgaGFyZHdhcmUgaXMgYWxyZWFkeSBvbiB0aGUgbWFya2V0
LiBJdCB3b3VsZCBiZSBleHBlZGllbnQgdG8NCj4+IG1lcmdlIHRoZSBwYXRjaGVzIHdlIG5lZWQg
Zm9yIE5hdmkgc3VwcG9ydCBzb29uZXIgYW5kIHVwZGF0ZQ0KPj4gZHJtX2RwX21zdF9hdG9taWNf
Y2hlY2sgd2hlbiB3ZSdyZSBhYmxlIHRvIHRlc3QgaXQuDQo+IA0KPiBJcyB0aGVyZSBhbnkgY29t
bWl0bWVudCB0byByZXdyaXRpbmcgaXQsIGEgdGltZWxpbmUgb3IgYW55dGhpbmc/DQo+IA0KPiBU
aGUgcHJvYmxlbSB3aXRoIHRoaXMgc2l0dWF0aW9uIGlzIHRoZXJlIGlzIGFsd2F5cyBuZXcgaGFy
ZHdhcmUgY29taW5nDQo+IG9udG8gdGhlIG1hcmtldCwgYW5kIHRoZXJlIGlzIGFsd2F5cyBwcmVz
c3VyZSB0byBzdXBwb3J0IGFsbCB0aGUNCj4gZmVhdHVyZXMgb2YgdGhhdCBuZXcgaGFyZHdhcmUs
IGFuZCB0aGUgcHJlc3N1cmUgYWx3YXlzIGNvbWVzIGxpa2UgdGhpcw0KPiBhbmQgYmVpbmcgZXhw
ZWRpZW50LiBIb3dldmVyIEkndmUgZm91bmQgdGhhdCBhIGxvdCBvZiB0aGUgdGltZSB0aGUNCj4g
cmVxdWlyZWQgcmVmYWN0b3Igb3Igd29yayBpcyBuZXZlciBkb25lLCBiZWNhdXNlIHRoZSB0aW1l
IGlzIGJlaW5nDQo+IGFsbG9jYXRlZCBub3cgdG8gdGhlIG5leHQgR1BVIHRoYXQgaXMgY29taW5n
IG9uIHRoZSBtYXJrZXQsIGFuZCBub2JvZHkNCj4gZXZlciBjYXJlcyBlbm91Z2ggdG8gY2xlYW4g
dXAgdGhlaXIgdGVjaG5pY2FsIGRlYnQuDQo+IA0KPiBIb3cgY29tZSB0aGUgbmVlZHMgZm9yIE1T
VCBEU0Mgc3VwcG9ydCB3YXNuJ3QgaWRlbnRpZmllZCBlYXJsaWVyLA0KPiBibG9ja2VkIG9uIHJl
ZmFjdG9yaW5nIG9mIHRoZSBjb2RlIHRvIHVzZSBjb21tb24gY29kZSwgYW5kIHRoZW4gdGhhdA0K
PiB0YXNrIG1hZGUgYSBoaWdoZXIgcHJpb3JpdHk/DQo+IA0KDQpkcm1fZHBfbXN0X2F0b21pY19j
aGVjayB3YXMgaW50cm9kdWNlZCBieSBMeXVkZSBiYWNrIGluIEphbnVhcnkgd2l0aA0KaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI3NjQwNS8gYXMgcGFydCBvZg0KaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81NDAzMS8NCg0KQXQgdGhlIHRp
bWUgTHl1ZGUgdXBkYXRlZCBpOTE1IGFuZCBub3V2ZWF1IHRvIHVzZSB0aGVzZSBoZWxwZXJzLiBh
bWRncHUNCndhc24ndCB1cGRhdGVkLg0KDQo+IEknbSBzb3J0YSBpbmNsaW5lZCB0byBzYXkgbm8g
d2Ugc2hvdWxkbid0IGJlIG1lcmdpbmcgYW55IGRyaXZlcg0KPiBzcGVjaWZpYyBjb2RlIGhlcmUs
IGJlY2F1c2UgdGhpcyBpcyB0aGUgb25seSBwb2ludCB3ZSBjYW4gcHVzaA0KPiBwcmVzc3VyZSBv
biB0byByZWZhY3RvciB0aGUgTVNUIGltcGxlbWVudGF0aW9uLCB3aGljaCBJIGd1ZXNzDQo+IG90
aGVyd2lzZSB3ZSdsbCBqdXN0IGtlZXAgYXZvaWRpbmcgdW50aWwgTHl1ZGUgZW5kcyB1cCBkb2lu
ZyBpdCBmb3INCj4geW91Lg0KPiANCg0KVGhhdCdzIGZhaXIuIEkgYWdyZWUgdGhhdCB0aGUgcmVm
YWN0b3Igc2hvdWxkIGJlIGRvbmUgYW5kIEkgdW5kZXJzdGFuZA0Kd2hlcmUgeW91J3JlIGNvbWlu
ZyBmcm9tLiBTaW5jZSBEYXZpZCBpcyBoZWFkaW5nIGJhY2sgdG8gc2Nob29sIGluIGxlc3MNCnRo
YW4gYSB3ZWVrIEkgd2FzIGluY2xpbmVkIHRvIHNlZSBpZiB3ZSBjYW4gcHVzaCBiYWNrIGEgbGl0
dGxlIHNvIGhlIGNhbg0KZ2V0IGhpcyBjaGFuZ2UgaW4uIE90aGVyIHRoYW4gdGhhdCBJIGRvbid0
IG1pbmQgaG9sZGluZyBvZmYgb24gdGhlIG1lcmdlDQp1bmxlc3MgdGhlIHJlZmFjdG9yIGlzIGRv
bmUuDQoNCkFkZGluZyBNaWtpdGEgd2hvJ2xsIHBpY2sgdXAgRFNDIHN0dWZmIGZyb20gRGF2aWQg
YW5kIHdpbGwgaXRlcmF0ZSBvbg0KdGhlc2UgcGF0Y2hlcyBpZiBuZWNlc3NhcnkgYW5kIGxvb2sg
YXQgdGhlIE1TVCByZWZhY3Rvci4NCg0KVGhhbmtzIGZvciBrZWVwaW5nIHVzIGhvbmVzdC4NCg0K
SGFycnkNCg0KPiBEYXZlLg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
