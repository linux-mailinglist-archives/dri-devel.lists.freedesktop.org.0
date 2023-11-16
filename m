Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B07EDFF5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F7C10E5E1;
	Thu, 16 Nov 2023 11:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AE010E5C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEOOtSEtcZKeszKvydBICdLf5CTQgp6MYsw5ZQ5qpK6IRNg/G94YHPwSZvF0BP+iaFZ2rBP8dN5/ZTr+ZNyamQ61rR+FEblxS0IBJswMByQ6SaJOCjPv7luM610sPpXn9LJeHQwpF5A5Ki79VKqADPRhc4wK9du7hRQ2fZQMHamc8CKY46kmP4tGOgmvnOAzBAmJ8bYcr+t4TiiH8YrjYkrUmzYNcpeKj0uu621Nk49CbURDg7WAzq00FiW+XVFWg+O2ZgmSbKf00p9iZDbnz0SEFbE/P05hmLDzpv3dUA+rgxIKkXXCq6af99peqwq07ML4xqQJvuxvWgtd7huMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWcga8stenfmcPFcQz03A9glB82OCOjc2C3GWFkBVl4=;
 b=P/EEfUZFIhwFyDD+djSdxiTzRut8LrcSHCHjc9OYMNe8QL9OcAEcfJBsEVC0sEcn6BOPG9CL/vVpOrpz/CUsMemOqUDd7HBVMw3/SmTYEu30JOkzavJ7fGr9fQkYOlHyIquCs7BtT4RnpKCk7yfn2cKP1n1Alb8HRO/5noIfV/InjWhw295EuKBNgi5VFTmmyIoi/XV0s/bEEE6Zk98G67NbgOWKEcL38j2kBFsT392H4Ny+a1hvei+Y6WCtWRXoTR3uPqSt4Af6SNQRGYMWzMSXeTydc+LVICnVEoAIQnSxtszKFEykELZNZFPtGSksCpik5MilM8lYtCV/tZgw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWcga8stenfmcPFcQz03A9glB82OCOjc2C3GWFkBVl4=;
 b=kAish3/gwiH1TU2cmhru7AUvGyuatIy0l+SSfg2WjeetaCWWZj3+BtvjCQX5VwHFW0IV52tQgMIXl9W7rMlMlrmyp1XksX1CYBwRrUZX/xBBY0axPe0QmIR5B6pLxIj8ZPR57zPJomArEJ2GHDrT/9DbCg3h/P8XslPSSCUNfI8=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYWPR01MB11275.jpnprd01.prod.outlook.com
 (2603:1096:400:3f5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 11:39:06 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 11:39:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v13 4/4] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Topic: [PATCH v13 4/4] MAINTAINERS: Add maintainer for RZ DU drivers
Thread-Index: AQHaF/AqzXsaQWdv5kWbK6bGHDF9irB80sUw
Date: Thu, 16 Nov 2023 11:39:06 +0000
Message-ID: <TYVPR01MB11279530AA7524B6903AB89FA86B0A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231115181807.138292-1-biju.das.jz@bp.renesas.com>
 <20231115181807.138292-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231115181807.138292-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYWPR01MB11275:EE_
x-ms-office365-filtering-correlation-id: 18670686-d9e9-4485-55c1-08dbe698a3d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: axRf3YXyaa0VZ5yh+mtu2TGKVYtdn31biWIOU06VXPdK+mnAnw8fcWlCcqDuLvgt3Dan5LYHKjICEG7G80hf5umAKL4wBo4rc8zKSL1j+AR+XpKmj5WxmZMgOzmecLjup/7EkuKlDXtjR11gPToj7tbkg2WZ/hcXmfpKpP3Syzs3ZOCSGzQkpHvhaIH/8aTMqApytTxLW320JGKQfR0LoogQeTQqtg8dlaippYZTdEUGrz1J7lrWgu1qTbi3Zp3iD8pZkOdH9pkGmcoGOEYTOgdtWVut3LDGlRz0AAwbR4PYtE1cu03MlbkVYqb6Fna9PjLw0f4GNpM8dj5AflvebD0Ker5P7KdgMYXzDeAqXDSBlmhh1GobEsTVs8Sl178ytWZIgTDD/o7eok+u5475IhPYm1eZwk0BXJ+3rGFEO+ZodA7MqZjR4mhKR02D3Qzi5LfDkVCJQEnZLJ6elOYQLJNYUt5XXwo43Z8en3VsJEtaGCHo57A3+yENzcgJYhmd46Puoe0bNXxXMyn33p1HsphoUn3liuoV7gAiw39oDjyXivHV0Zfmw62JGbjbqdyXCym5PyOSurVUYT4EDqD14KqPJNftyk7jCNHil50vW2eOpI8fkeYyh5/dXxQEXwSqYNl/tAJrufevLkn9Zz/qUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYVPR01MB11279.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(71200400001)(26005)(66574015)(7696005)(83380400001)(8936002)(7416002)(9686003)(5660300002)(52536014)(8676002)(4326008)(2906002)(76116006)(41300700001)(110136005)(478600001)(66556008)(64756008)(66446008)(66476007)(66946007)(316002)(54906003)(122000001)(86362001)(38100700002)(6506007)(33656002)(38070700009)(55016003)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qy9OcG9xZExjZENRT2dKSEVyeXhocmZCaFZIVFFsRVMxTy9ENko1Y3VVRW1R?=
 =?utf-8?B?Y1lscStyYnR4NGN5Vjh6UGRUc0dBN3ZKV3VnK0hvNlYwSFNCczlxR25ueEJz?=
 =?utf-8?B?VVN1RXdXM2VWYkEraDNxWEFFY2dCeGdEc001RHliZDQ5bm5CQXgveHRFclV2?=
 =?utf-8?B?VDE2d0NadWE5MzdqSEQ5VUtEcnBUWDhRMWZmK2haV0RJUGR2bHdjV2U1NmR3?=
 =?utf-8?B?QmVJU2c2NkFhdTRSeWppSVFNN1VkOUdSQm9IZE4xSmI2aG5zUGhabkRIczRM?=
 =?utf-8?B?cVdnVldreFZsdUFpbVlMOHFUYVN0d0xhM3cxOEZIVnNEVTlLMUoyenlwL3l0?=
 =?utf-8?B?QklHaDVMUldlNHM0L0RpRjJMUlpUaSsxN2U3anBGcjE2NmprQTYwUHVmOWlL?=
 =?utf-8?B?Tmd6TWd2MmtzWHJBZGljcG5VSWl0UldWOC96OEMvb2xuOVJ5NGszcVVjcVVE?=
 =?utf-8?B?UkJzWG1XU3NONVNRektreGhiVXd4Y295WXlRc3N2Q3JuUnJxWTd4TDlXTW8z?=
 =?utf-8?B?OWNrajRLb0xuRlBJYmYwcDlteVVlVlVKNkZSQURJV2ZCSi9tVFVOTnI3OUZ1?=
 =?utf-8?B?V0Vmams3QmNLUW9HbFRBSXM0Vi9jRnVCTWlKL0d4NCtNQTNkQjNyUHBBZHJO?=
 =?utf-8?B?ZzZHNzI4cUxhZUJZbDlFUWpsdHlJOGJCWjRYemR2VlJRT3pkSjduVng0bzBs?=
 =?utf-8?B?MDYwNWw0eWRXZEFJdkdKR2h4aGFTMnhWZ044cUhmc3lnK2Z5ZVVxSnhrQmtC?=
 =?utf-8?B?MmZKZDVaRG90MUdTb2VsLzRFUXhxRy9BbUhUbXRZUlRSK2FoR2FTbW9QVlJP?=
 =?utf-8?B?Q0xoTjlHa1hyLytRQ21SOEs2d3kwREZockJ5djBkd2dTdEU1NkZqRnhtaEk4?=
 =?utf-8?B?c2oyOUtJaENLU1ROMkFMaE45VWJ6OGJoOHhXZmE0cDBqWldPWlRkaEw4Tkh6?=
 =?utf-8?B?SytBVlI0TE9FK0pDM3NiSUNPNmx1Lzl4MittTEg4WWcxMFV1eEtxR25XY2hY?=
 =?utf-8?B?TGFWeGRWR2owZG45dFN3MFNQT1VjRUpiT0tQdUR0TzM5N2lJbDJjV2lsaHJo?=
 =?utf-8?B?U3RoZjBPL0k0REY5Ui9uSm4yd1lJOEhNRjdxSldPOHlXWHQ2bUJMajBMYUh1?=
 =?utf-8?B?Tk5SdUVUK0VMYTZ2cDZ2YisyTlVqdEZLM1Fibzl4ZjBsaG1paVBQTDFIb2dp?=
 =?utf-8?B?cXo3MUlBL0o0Y0ZWSlpOcGwrSytUNVduM0xPZ1dWaFU2aFRCREZIbzEzWW9v?=
 =?utf-8?B?NVZnVmtaeVIvMXZOOU9ISlFBb05Ma3graWlOQlVUTUFwS2hkTW1HK0VYV0tE?=
 =?utf-8?B?dldtTzZRTE56UGMvUGQzZkZISUFIV1RrWWQvVGwwQkZ3ZWRwV0JKeU91MHMw?=
 =?utf-8?B?L0RTV2tzaTQrTlNFMW1DeGxyNkx6UjdXTkUrbHNxclp0RjErRGZuei90MnJm?=
 =?utf-8?B?Wmx1K2RCYzJibTZsbW1vTFpQdVBrdTI0UmFXckdIRzJOMktUMi9uZVpvRU5T?=
 =?utf-8?B?Q05DQlJsUDAyUFZZb0RleHhIanFPNTF1UFZVWVdPNjFPb3FYOUMweWVaVmhZ?=
 =?utf-8?B?V1J6bWMrTGlwc3VpZ294WUJtUmNaRVFBWTVuNXdDTzEzd3E4S2dYSlBpWkZo?=
 =?utf-8?B?VUxyRmRNNklqOW50TmlWYnRwUm03cnBXemRVMEN2cy9XdTZrRHgvZ29Zb0xM?=
 =?utf-8?B?Y0xaK2FYbXJ1RWlmV2hLSllXRmxzbW1yOGNaSmxZbGcxKzNueDVVUll5eEQw?=
 =?utf-8?B?eW5ZRERaVEYrZjNIU29CNjgzRDJGMStVMmlpSTVnQlQ0ZCtKN0JJQlZxc2xN?=
 =?utf-8?B?OFpCRTNnMkJtVmxkN3cxYmR6VE9PWWFLOURDcDBUQklvM3ByWGVyMmFjQzB6?=
 =?utf-8?B?ZFk1cWxSOTk1WTZJMXcrRnhwV2REWWVRSGx5WUhqY21WYnhLUGdzWkR6L2FH?=
 =?utf-8?B?MDZzUCtSQUhLYmdsQmhnaGd6WkNlREFITy8wak4zd0VLcDhQUHJ0d2JMTjNX?=
 =?utf-8?B?RzZnTHdUSXVoaHdNKy8xQzFzUC96QzFGa254UTFSc29HK21mVzNabWJOTUdp?=
 =?utf-8?B?aEl5QXVXNXRIeVllNVJzMGFDeEhZd3kyc09kU0pXZDhnWU9DN1pXYUt3cE1Q?=
 =?utf-8?B?MXg2QmZVRXJCM21lRnhTWnl1S05XTzBkV0lOQ3RsZTVpNmk1WGpZcGFiN1Fq?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18670686-d9e9-4485-55c1-08dbe698a3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 11:39:06.0970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPKMLzlB4uLNWw6f2EaM3USHGENHZZVKtiD77B4RMoOtA3jFU+TSD36yDUt/YJq9Wtsbf8x/tewD9z1hVCvm/G+qupNcU11YQPDSfMYorKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11275
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLA0KDQpJIHNlZSBhIHBhdGNoIGNvbmZsaWN0IHdpdGggZHJtLW1pc2MtbmV4dC4gV2ls
bCBzZW5kIFYxNCBmaXhpbmcgaXQuDQoNCkNoZWVycywNCkJpanUNCg0KPiBTdWJqZWN0OiBbUEFU
Q0ggdjEzIDQvNF0gTUFJTlRBSU5FUlM6IEFkZCBtYWludGFpbmVyIGZvciBSWiBEVSBkcml2ZXJz
DQo+IA0KPiBBZGQgbXkgc2VsZiBhcyBtYWludGFpbmVyIGZvciBSWiBEVSBkcml2ZXJzLg0KPiBX
aGlsZSBhdCBpdCwgdXBkYXRlIHRoZSBlbnRyaWVzIGZvciBjb21tb24gcGFydHMsIHJjYXItZHUg
YW5kIHNobW9iaWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IC0tLQ0KPiB2MTItPnYxMzoN
Cj4gICogTm8gY2hhbmdlLg0KPiB2MTEtPnYxMjoNCj4gICogTm8gY2hhbmdlLg0KPiB2MTAtPnYx
MToNCj4gICogTm8gY2hhbmdlLg0KPiB2OS0+djEwOg0KPiAgKiBObyBjaGFuZ2UuDQo+IHY4LT52
OToNCj4gICogQWRkZWQgUmIgdGFnIGZyb20gTGF1cmVudC4NCj4gICogVXBkYXRlZCBlbnRyaWVz
IGZvciBjb21tb24gcGFydHMoTWFrZWZpbGUgYW5kIEtjb25maWcpLg0KPiB2ODoNCj4gICogTmV3
IHBhdGNoDQo+IC0tLQ0KPiAgTUFJTlRBSU5FUlMgfCAxNSArKysrKysrKysrKysrLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5kZXggZWM3OTg0M2Y4NDJh
Li5jMjBlZDRlNGEyY2MgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5U
QUlORVJTDQo+IEBAIC03MDMzLDcgKzcwMzMsNyBAQCBGOglkcml2ZXJzL2dwdS9ob3N0MXgvDQo+
ICBGOglpbmNsdWRlL2xpbnV4L2hvc3QxeC5oDQo+ICBGOglpbmNsdWRlL3VhcGkvZHJtL3RlZ3Jh
X2RybS5oDQo+IA0KPiAtRFJNIERSSVZFUlMgRk9SIFJFTkVTQVMNCj4gK0RSTSBEUklWRVJTIEZP
UiBSRU5FU0FTIFJDQVIgQU5EIFNITU9CSUxFDQo+ICBNOglMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ICBNOglLaWVyYW4gQmluZ2hhbSA8a2ll
cmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiAgTDoJZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBAQCAtNzA0NCw5ICs3MDQ0LDIwIEBAIEY6DQo+IAlEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxkc2kt
Y3NpMi0NCj4gdHgueWFtbA0KPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsZHctDQo+IGhkbWkueWFtbA0KPiAgRjoJRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy55YW1s
DQo+ICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2Fz
LGR1LnlhbWwNCj4gLUY6CWRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzLw0KPiArRjoJZHJpdmVycy9n
cHUvZHJtL3JlbmVzYXMvS2NvbmZpZw0KPiArRjoJZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvTWFr
ZWZpbGUNCj4gK0Y6CWRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvDQo+ICtGOglkcml2
ZXJzL2dwdS9kcm0vcmVuZXNhcy9zaG1vYmlsZS8NCj4gIEY6CWluY2x1ZGUvbGludXgvcGxhdGZv
cm1fZGF0YS9zaG1vYl9kcm0uaA0KPiANCj4gK0RSTSBEUklWRVJTIEZPUiBSRU5FU0FTIFJaDQo+
ICtNOglCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ICtMOglkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ICtMOglsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtl
cm5lbC5vcmcNCj4gK1M6CU1haW50YWluZWQNCj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiArRjoJZHJpdmVycy9n
cHUvZHJtL3JlbmVzYXMvcnotZHUvDQo+ICsNCj4gIERSTSBEUklWRVJTIEZPUiBST0NLQ0hJUA0K
PiAgTToJU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4NCj4gIE06CUhlaWtvIFN0w7xi
bmVyIDxoZWlrb0BzbnRlY2guZGU+DQo+IC0tDQo+IDIuMjUuMQ0KDQo=
