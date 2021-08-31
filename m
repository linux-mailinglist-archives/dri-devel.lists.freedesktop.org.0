Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760683FC5C2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 12:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFFD89805;
	Tue, 31 Aug 2021 10:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D4489805
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 10:45:21 +0000 (UTC)
X-UUID: b6045a5a351a49c0a0b98c205a2f48de-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=; 
 b=bHJc8wjrQQX01lRkhQulo48BOhlYo5XR3yWHpBGr+kfHPvSuCGwCKWxqIjPjvLvb+SAzvF7lYeM7mtREPnTEGBbKuI2BM6J5L4wR0Jf9O6xNrAje4DzsM+6iJkpuDr2N3sVyK2LQTT0M2SDqp04UvVqWaE4/XU+2oJJqSbi/iOU=;
X-UUID: b6045a5a351a49c0a0b98c205a2f48de-20210831
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122042693; Tue, 31 Aug 2021 18:45:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 18:45:15 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Aug 2021 18:45:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMAXYF/BcmTfpToo49CxrBo96Txabtqqt8ttcUwy3PTjJnc5WbzrNaAJoEffnMKOKwxO30BeQi/UJ1mb9xfY3V4PEIQyG2eBtUKbLybc4IEwskgPRABCSWJ4BCe5WsDamRTrK6egqn3YYs2BucDzL76oeB7p1BH57dvXm9eY0NWGUNhK2Mwwu6xocqYnCQk/cdIOEUTc1Bdal+0INakYmy65RDqPq3dgRkMD+ArC0Hz8O9Xa+qSyOzg5OVg4YNtTxVV525mq1yZ03RT99jTEdBVChmNBR4lj4TQLGg2v7GDbBDxqw4pmFNQZjBYxJ3Ofv0X4vm5g9luwsji2OoEYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=;
 b=MD9SkBwLv/1MiaOq/HmZc8536g+BdmFwIuzH6TLicovUHVvJWPL5PISgKyBIWIqoTOtQm43H++qqauNFbRLpGTd01PYFxOS4HDhyDCnL9vBSwTOn3ESxVl5PSOj0c4fFZ4KQE6Y8BteFp7zfxeNfBLEMesm9KuXkbvbfVQo0Z/LXmqSkv3MrkNXkf/EpXT9F3yq1bPp14rTE7vqcHe4Cqu9UMNy476PGmo+NHv+JR4GrpNDCHa3dmINS8GLBvSconAzQoFPM4UoM1mWGJsf8a/f79Bu6BBO7QJhoeqib95cCHKEk6gpeuMnReoCfa4FQI2wvurZiJi9wdObWoJkyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phNHXum76mAZ4qYmxK28Mp4u++IBnPR+ThnSGtip/xI=;
 b=icrP/PO7FK+gGiQmcKbZpWaFHOnOD4OTf5TurY5udFhoMpatC7dQwicfIlg8i/dKl9Ca0VCbs1fZg2bsYEh/n0cIcnthgdBHO/H5HTRaLOYATZn4h57FagGF9v0vF3CrU1f9PbN82x2rQybjuha6MmcxQuJ6NY5pEVWW2iBboDY=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK2PR0302MB2499.apcprd03.prod.outlook.com (2603:1096:202:3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.16; Tue, 31 Aug
 2021 10:45:03 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::6595:af4e:bda9:801e%6]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 10:45:02 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, =?utf-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?=
 <Xia.Jiang@mediatek.com>, "eizan@chromium.org" <eizan@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?WWkgS3VvICjpg63mh78p?= <Yi.Kuo@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "evgreen@chromium.org" <evgreen@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QW50aG9ueSBIdWFuZyAo6buD5bu65ZiJKQ==?=
 <Anthony.Huang@mediatek.com>, =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?=
 <tiffany.lin@mediatek.com>, "acourbot@chromium.org" <acourbot@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "drinkcat@chromium.org"
 <drinkcat@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
 <Ming-Fan.Chen@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Topic: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Index: AQHXhO4/B+asb7CmWUi2ITwnwJWoI6uNoJ8A
Date: Tue, 31 Aug 2021 10:45:02 +0000
Message-ID: <271b63107031f6bfa1b746e70ccdcee6d86db8b7.camel@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74c22ace-4c7a-4b3f-8624-08d96c6c635b
x-ms-traffictypediagnostic: HK2PR0302MB2499:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0302MB249906CC89596137FA88C2C898CC9@HK2PR0302MB2499.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICJs5sYJxBYBYD8Oubv8I/7rjityPVUeoC/5N9Imn52AmsSMw76NqBv80QAqEaRLHfWpMo6z98AflyeNViBrDS18tOfkK4WA7/qKaul7n7++EJ4spdQBjXvyY0F6cWtQx3Uybv7yWI760NWTBDekUg07QoE8at20pgw0WzudeWDi/rYOZ6NgwM1eV+skoAaVxCGAKcQftUus43hjsN1MAqm7arPOjwpl/Cb351WCduYV0/UGufzk2YfYgTHAe9IHLcKqXj4UexJWwGp3x/q1dVCGyo7em4FDAaCMqCJBL6v4goGNQOwrn8viAnKU3+hJCehKe1qExYP39Xc1w+H0nBQbtxjuZ82ygIe3o2SlHHIFPMf/SoZAH2vPIKSUDenjX8xMAr154L6HEsEPvmp0ALsSRGh2mNaWJvXB7Sw/AvBw9LVezqoLe5i4E153Fn1Nk8udDIGK6ABixgBw9uYY1CKgA0BEiqvc+/KNbkAZ5A3ygNeLRxwLjPQVU/os+LO09/U+bakaiBLeIllgMxyHf2sQo4RaB+8asKN622wwkEeyJ5GYLMLiS1XJy4tB7PK8/uA4kJILKp4AckfRDuK9pE87zk/QkV/6p6PtbIaLOJbhAc5RzLwOPKHPfREVQFkRkUNtTKJZKE7YOXMRT61bF1BbJgvRwezln6RhL8wRtU0UP9vA/XyCdAH+gcgWbKgYLazyybP+k1MQQ0MPGsuwo+ikgDsYeNJEs4wg8VcwVjUxmAKhrQix3lTxuYvpma/Q9RgR8f2iKrzyO96tkiJPM5zc8GPUCAsvpBfJVZSK2ruGTjCylW/Pejt2Vn6FmnRc8WNZL54h1vwIY5R2isdptY8GULO8f5pVy66HZopXIeA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(85182001)(66476007)(66556008)(64756008)(316002)(38100700002)(66946007)(66446008)(6506007)(122000001)(91956017)(76116006)(6486002)(2906002)(36756003)(6512007)(54906003)(5660300002)(83380400001)(2616005)(71200400001)(966005)(186003)(86362001)(26005)(7416002)(4326008)(6916009)(38070700005)(508600001)(8676002)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHpPTzRIRnJUWXJQODREV1NIVzd0N1JXeEZLVHNQdWV6eDlmeWR2VUxYaWpS?=
 =?utf-8?B?eC92VjN5UDNaVXpZSWt0NVRLbHNKU1Z1RXZ1NFE2V0NOUWpVZ3R4RFRGUTlE?=
 =?utf-8?B?bWFrUXZGQU1NTDJRRlVLdjNMcUEyYlZlRjhUTTU4NUhLM1BGRVM2SHZVK08y?=
 =?utf-8?B?Q254RTlCbTR0SUpiemJWYmNrcGFKNDBubXVBZWtYaGpaVEpnUGV3SUdibkNw?=
 =?utf-8?B?TVpndkZjZ1l1ZUNRNjVwODZQSDdNbkFoVnRxa1dYa0Nua2ZZYTNOZnl0QjZQ?=
 =?utf-8?B?endQemxSSG91WUNrSWZaanpWNWNROGt5TUpSMkszdm5jb1BqbHA4NG56Rmp3?=
 =?utf-8?B?UDY1OFNPWXhQbWZ5T01MOXJhRHhQbkl1TFhzSERWdXZTc3VWMnEvY2ZubU4r?=
 =?utf-8?B?ZWJwTExPSkhweFh2VHYvVnVnbkxFcm1PRXFwdlhsYklQYjc0cGtPV1B0QlRT?=
 =?utf-8?B?YUNuYmsrL0dOa0lhQU1FeVQ5cUNkYlN1R3l1dVVWTk1SVXJzVzdxb3NXS2Va?=
 =?utf-8?B?TlRnSThDenhZZnZFSlN6ZzJ4SnhqaDdTTDgrNmVIWEIzQUcrNU5iMGRZaDZN?=
 =?utf-8?B?amxIeFFUUGtGQUhSQ29LTm42cG42Q29YMVdDMS9Bc0RnSzIzQVkvZEkvK0hR?=
 =?utf-8?B?Uk1OQUVSbXZFeCtObDBlYVlEWndFV0lPb3RJR3o4TjM1c2ltSGRVaVZKalRP?=
 =?utf-8?B?WVQvd1pNQ1N2dTMyWGNQL2gyZG1uTWwyNDcrWmJCRExMZWRtTTdMQlRWaFBY?=
 =?utf-8?B?VGdxU04wMUI2MWFjTTJPY3NUNWFUMUFYL05BWUgzTUZpQ3dlYWZRZ24ycXpX?=
 =?utf-8?B?bVBKYm5hQkk0TGxkUXhmdTZLNkhYaWhzT1U2YjFTNEpteDJXcnErQjNNYUFC?=
 =?utf-8?B?ZVVGOGVudk9OQmZ1RWVmelFLSFgyaFl4VXBBSnNOekg3YU9HYTF3YlpDelRl?=
 =?utf-8?B?eVlTYUFHVzJVQzhWTEcrL0I3b3hXTGpITStwcUVqRWNWSThkeWc2bnM2Q1Vn?=
 =?utf-8?B?TVZOcFgvTUxIOFVBZ3huM2FPVE5PZ0pybGtPZHc1Q1hQd0RieFFVNVRBakt5?=
 =?utf-8?B?Njc1R3BLeFdZV3NUMEFvK0VuV29Kc0hQbzFlQTV3S2JjYVRBaTNTOWNpZU1l?=
 =?utf-8?B?d0NyTHd4aXlyRXBMbWNSU0VhZlFUc2FwMjVnUUFtUFF0b0dkazR3WlI0UXlU?=
 =?utf-8?B?ZzZMb0UydVYxOHFiMXJXbFBRYXU3RUZ5T1pkb09jaS9HVUp4YTNYOUxNT1pl?=
 =?utf-8?B?T1NLWExTa2xzZFhkcDcreERESVhCQ3VseDZFSFpFdUxubVNFaGpPRzZFMExX?=
 =?utf-8?B?Rm9HYVhTZW04bElGOTQ0RFFoVkRrdHoxQVRXNDVxMWtFaGlrc3doS2JUL2RY?=
 =?utf-8?B?MC84TE1RRVdWNlFPdnNIYmNhRDA1bHlSSDVIditHQU92S251M0QySFRDWDFZ?=
 =?utf-8?B?RlkyWXZtWVd1WG9USXpxNmRHS0tyU2RuWWhRLzBRaGVxeXd4NjcrOTY2Z0NP?=
 =?utf-8?B?eHJWQTduS0FZVGFQbkdkSFphMkh2UWdlbkFlMlZLaExOcTIyODZUeUNCNzBV?=
 =?utf-8?B?NFZGQWRjY1JQR0IrVmljYzNuVWhseXlvMit3cWhLWUdRUDN2RUhzTDBBZWo4?=
 =?utf-8?B?QzlDNXVWVW1kc0lybmJmTHVsc0tlMGIzaC83cEppM0QxdEtJTCs2eEg4Wmhk?=
 =?utf-8?B?Z0lVRWZ6OVh0VGNHTE02dG96NGxQRFh3MDlMbWt6Um9ZQmlKQ0NUNGoxSjZU?=
 =?utf-8?Q?UFtR7qKBws/0BmZsw+cQnc3CZiweAiPaGSkWWtk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <985F7259908913478FD1B549BAC23552@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c22ace-4c7a-4b3f-8624-08d96c6c635b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 10:45:02.5578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTX8d5gunTqX53RnrogGC7P0520rFxArZo2rqvwf9WiHMiyrjV8MIR4MY933sB/d0+reTUhoDsKG+Bcra80bMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0302MB2499
X-MTK: N
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

SGkgTWF0dGhpYXMsDQoNCkp1c3QgcGluZyBmb3IgdGhpcyBwYXRjaHNldC4NCg0KVGhhbmtzLg0K
DQpPbiBGcmksIDIwMjEtMDctMzAgYXQgMTA6NTIgKzA4MDAsIFlvbmcgV3Ugd3JvdGU6DQo+IE1l
ZGlhVGVrIElPTU1VIGJsb2NrIGRpYWdyYW0gYWx3YXlzIGxpa2UgYmVsb3c6DQo+IA0KPiAgICAg
ICAgIE00VQ0KPiAgICAgICAgICB8DQo+ICAgICBzbWktY29tbW9uDQo+ICAgICAgICAgIHwNCj4g
ICAtLS0tLS0tLS0tLS0tDQo+ICAgfCAgICAgICAgIHwgIC4uLg0KPiAgIHwgICAgICAgICB8DQo+
IGxhcmIxICAgICBsYXJiMg0KPiAgIHwgICAgICAgICB8DQo+IHZkZWMgICAgICAgdmVuYw0KPiAN
Cj4gQWxsIHRoZSBjb25zdW1lciBjb25uZWN0IHdpdGggc21pLWxhcmIsIHRoZW4gY29ubmVjdCB3
aXRoIHNtaS1jb21tb24uDQo+IA0KPiBXaGVuIHRoZSBjb25zdW1lciB3b3JrcywgaXQgc2hvdWxk
IGVuYWJsZSB0aGUgc21pLWxhcmIncyBwb3dlciB3aGljaA0KPiBhbHNvDQo+IG5lZWQgZW5hYmxl
IHRoZSBzbWktY29tbW9uJ3MgcG93ZXIgZmlyc3RseS4NCj4gDQo+IFRodXMsIEZpcnN0bHksIHVz
ZSB0aGUgZGV2aWNlIGxpbmsgY29ubmVjdCB0aGUgY29uc3VtZXIgYW5kIHRoZQ0KPiBzbWktbGFy
YnMuIHRoZW4gYWRkIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIHNtaS1sYXJiIGFuZCBzbWktY29t
bW9uLg0KPiANCj4gQWZ0ZXIgYWRkaW5nIHRoZSBkZXZpY2VfbGluaywgdGhlbiAibWVkaWF0ZWss
bGFyYiIgcHJvcGVydHkgY2FuIGJlDQo+IHJlbW92ZWQuDQo+IHRoZSBpb21tdSBjb25zdW1lciBk
b24ndCBuZWVkIGNhbGwgdGhlIG10a19zbWlfbGFyYl9nZXQvcHV0IHRvIGVuYWJsZQ0KPiB0aGUg
cG93ZXIgYW5kIGNsb2NrIG9mIHNtaS1sYXJiIGFuZCBzbWktY29tbW9uLg0KPiANCj4gQmFzZSBv
biB2NS4xNC1yYzEsIGFuZCBhIGpwZWdbMV0gYW5kIG1kcFsyXSBwYXRjaHNldC4NCj4gDQo+IFsx
XSANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMTA3MDIxMDIz
MDQuMzM0NjQyOS0xLWhzaW55aUBjaHJvbWl1bS5vcmcvDQo+IFsyXSANCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMTA3MDkwMjIzMjQuMTYwNzg4NC0xLWVpemFu
QGNocm9taXVtLm9yZy8NCj4gDQo+IENoYW5nZSBub3RlczoNCj4gdjc6IDEpIEZpeCBhIGFybTMy
IGJvb3QgZmFpbCBpc3N1ZS4gcmVwb3J0ZWQgZnJvbSBGcmFuay4NCj4gICAgIDIpIEFkZCBhIHJl
dHVybiBmYWlsIGluIHRoZSBtdGsgZHJtLiBzdWdnZXN0ZWQgYnkgRGFmbmEuDQoNCg==
