Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055D79C748
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 08:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ED410E1EB;
	Tue, 12 Sep 2023 06:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26F410E1EB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:57:58 +0000 (UTC)
X-UUID: b0a1cb62513911ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=E2dG4Y8D7+uYoVduAcigZ5zK8Lt2dfN98Orzex4b5hA=; 
 b=RzLS0h4V2ovb8u7xqkTigH+1lfBeL9yga1SbClN9wZLedNLF0kZwOIpNLdJ6SU2W9DPtSNHqK/1A6NoAA5LGOT+Em+kO0RzuG109vwAwkHO3snoG+Y1QutygKUjYQeQ9C7OIl40h0NYQdgEVPQ99wPpyHiuw+XnjelE2lHL/6Jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:2e4e9814-99bc-4a12-8753-980348e00e97, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:34,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:29
X-CID-META: VersionHash:0ad78a4, CLOUDID:338f98ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b0a1cb62513911ee8051498923ad61e6-20230912
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <shuijing.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1577019288; Tue, 12 Sep 2023 14:57:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 14:57:49 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 14:57:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcpAy9KVGADRw9RL0wv0JQOoy02PyAwvBpztA6/d+83I7sE8JDbvyLjBWUhUdYmXNdWkKEVPOLW/fylZBaYyKMSbvam5dqw+td5d2wP3YqezOIF1ylUqzHP09bPlu+wZB2PBl9tZxI4C2m6g3hSqPHr1qx8wgB4hZynZD6H6BaI1FY42Dgz3q/IruGAuDXCejXOUV9g0uTw7AuDo24NfqEgRWHlmNSqcGHtBleGHQvgA96vkOalCdKCQ6hx9ijRO82QVpzYZPKaKaDoRB5IICWPitwUpkKq76P/kzxNFblpwuIp4cZBP3rvZY/slZY96zwae3gXyunvfii6IDAZNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3EmCjLYNxlM/rBnq4BpxPhJrzWCNBQew96VjYSWfzQ=;
 b=j7byuwUKFc7OXm36gz0yEpnhz8pu8IU24kQ0PagsiMISwbrrhZzLew2nboDVVyp1/wAKG+V0e8+ZTXgZ0ZDHDCIT0Sj9i1uvZATre6XGkdlXNVtZN4/RORuWEhB/OWvtP2SkywAvYDMs1pMvpzhX7AIOJuO256k376/vzSdgaSQc0Y4ch6XCHWRM/hJ/D0evFWhxHARR/GMougfxBkSrClJXMjmgTxY529ByImoub3EZ+QmAEy1t6TLI3XcMi7c20KGkQQQ26bRa6Z756zxRJXoLsZ784Vmh+feU7LpY83QPEOEWLYpDZWHYu3HXtH/hLGhFKW8DLYXmGQsx3CfVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3EmCjLYNxlM/rBnq4BpxPhJrzWCNBQew96VjYSWfzQ=;
 b=ktmIllyLkjWI2urD+Y/phf/8bSAa3qKU3ElpJPf7kW+LyOK3V/T+mkbin5N3Z+4bGPoQHoEAzXSlsGkXbw9PJUs0xCfAa85T/HOIEq1xo7caLkfAznslGDk+a1zM6uOEc7z4m7bhYFGq9OPgWiu69wJCwt0VSREUIDug6PmKxw0=
Received: from SG2PR03MB4165.apcprd03.prod.outlook.com (2603:1096:4:3d::11) by
 SEYPR03MB6436.apcprd03.prod.outlook.com (2603:1096:101:50::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Tue, 12 Sep 2023 06:57:46 +0000
Received: from SG2PR03MB4165.apcprd03.prod.outlook.com
 ([fe80::29bf:7550:bfbe:50e3]) by SG2PR03MB4165.apcprd03.prod.outlook.com
 ([fe80::29bf:7550:bfbe:50e3%3]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:57:45 +0000
From: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Add mode_valid callback to DSI
 bridge
Thread-Topic: [PATCH v2] drm/mediatek: dsi: Add mode_valid callback to DSI
 bridge
Thread-Index: AQHZ1aMoPnXG2uitG02Cg9XrlCB/gbAW4asA
Date: Tue, 12 Sep 2023 06:57:45 +0000
Message-ID: <2404434f5fd2975ef3e4a4873a57051cb174ddfa.camel@mediatek.com>
References: <20230823092047.32258-1-shuijing.li@mediatek.com>
In-Reply-To: <20230823092047.32258-1-shuijing.li@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4165:EE_|SEYPR03MB6436:EE_
x-ms-office365-filtering-correlation-id: d52048a0-3c7f-4ad9-c19c-08dbb35d9182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U94xGnrtTfOgGpySQTeIXBOIP0zA6gYWjSsfUZb/fB23aLT23iYNYfF0HUS6rU+bGntOx1/4WTz7knaMOO7wygbTFjYRAOgqTQzuwHzy+qhkFa0k5h+TTRkC5vCVxD6qsmyUqxFl+TFaQ+LUsa00HwPX0DlFMhaA+KTTSRtYbwrs3s4jhyy80PGJxc/5aXFZDYhNJ5/Wgc3Rq5Ca748yrzSCmbqcGxdPRFrnc4tEZ0ruLLmQSnHddvZutBD3ClCZYqqjvTeg6gQrdHZU/k+OK60kwSPjSEDP7XdLY9zQYxZo2ja3ZIY2c7tQZLgNwDU2CgOx7x7tYLtxBvyP4jjvoLaMbilADWvBCU2foWoGPi4v/rZ1nEG1uNLGQZygmC2V15i2LUkxAIJgGDVY19nfHBNKdF8R7o2WqwbDx03hZzeCyeWJwIJHkR5BtST18vrTUcCqJ+bwStPBUxpgdQIZtyUbDCbEM5HPHr8I5PYWIipn6740BDRkaXG4ioO27V+W0XzUzEwwHDBfDDjFBS3FzBwGGo5NeoBJRVFER5WKeOrvH/DaAyLEyi8xpHna2h7KVm0L1FhVL/ne1kHFUReUviX8T/+zIY01h1nMlVYuO7ydwisZEHLhQ4g025Ps9eJzikGz+ZxJ0Hn6qlEhiN2AvJ1mP/rZxlwve7AOIJDImu6Pv4PFRczyPFSMdeRDnICEUgHnLygtHikgvsxGOc35tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB4165.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(1800799009)(451199024)(186009)(316002)(6506007)(71200400001)(6486002)(66556008)(54906003)(6512007)(26005)(83380400001)(86362001)(66446008)(66946007)(66476007)(76116006)(2616005)(41300700001)(110136005)(64756008)(5660300002)(4326008)(8936002)(7416002)(8676002)(2906002)(107886003)(478600001)(85182001)(36756003)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDVtMmJtR0JUNW90bzRSN2tMc1hKbDBkbXdjQ1Y2cFBVSTRsZTdBU0c5RGo0?=
 =?utf-8?B?akFiZThVNGNrOFp6bVl1RnRzVDI3M0EyTW8wT3FrV1dUTDZUU1F3ZkNpNTEv?=
 =?utf-8?B?M09TR2Ivb24yd3YyNTQ3THRJUW56bEprMTFSR0ZoUWlsRG9tSy83N29IR2ZN?=
 =?utf-8?B?clpHeGxNalNhRzk4V3IzaFh4bEl3cjRpeDlOOGE2MnlnZ0FjREZIVWZTMm84?=
 =?utf-8?B?OFpITGdXa1dsMCtxMG0wemJ5dHBHdGwycW50UkFHZFM4cXM3YThyQncwUGY4?=
 =?utf-8?B?UjVCQzhmaFJTL05mandneHd3emo0amM1ZWJ4N2Y3K0lqVlJwUEVjd1JmTzV0?=
 =?utf-8?B?eDY1ckVtWkR4OWdGakhNU0pnTXhvVTlpMFphTWR3dnRiRkdUbnc4dzJXM2pT?=
 =?utf-8?B?Sm5hZlR0a2VoOFJjWnZqYzFNKzFNNmhQcVVyZGx6S2RIcGVEeFcxRHJMd3Mw?=
 =?utf-8?B?ZzdoNlB2WjBYVDdQd25hckQyWHBybndCQmQ1VkRLNTlvaFdaSFZXZHoxd24z?=
 =?utf-8?B?NisyZ25iTkJkMVoxaklhQzI2Y0lsS0xlOEp6aXgzSEdiQmg1UnNFRkxwMFRs?=
 =?utf-8?B?cmVGRVhPNzM2UUJMcElCK3JUT0R5KzkwSDBod28xUEtTWmV3QllnLzBJdTlL?=
 =?utf-8?B?OGR2RTBnQzc2ZER0ZXp4eW5PTTVrUkxjVm51YmZobUNlUlV4RFd0OHZHdVhM?=
 =?utf-8?B?aHFYUjdjMWtWTThwN2hObW9LZWxaZVhBVGJwRE5wdmorUGh2N0VGeHowclM4?=
 =?utf-8?B?M296Sm1yMHF3TWVxTnVXNWNlU0o3dGYzY25Hb3pUNGVZTERmTnJFS3lPR3pC?=
 =?utf-8?B?Y295SXNCNDhjWFRhTXVBWVFTdWgrQzRpUjVuVW5yOHBJb0xxNzBkbHpWTmlV?=
 =?utf-8?B?ZWxMVzlrdjBBM21oZS9WR21wbyt1MkVWTFQ1d3J4QjJxQ3kwN0tBdUNtN2Vj?=
 =?utf-8?B?U1ZtbXJzSVVOcFdPMjR6cG1uNWJlblJEazh1RGxhM0VkdVI5V2UwMkE1cDlV?=
 =?utf-8?B?U2dOZ0RjcWMxdHMxSStBRVBCbTAvN0VOQXI1Vnc1QWR6d3hmL2NsbTVGNmtl?=
 =?utf-8?B?dkdrY3FQMnFaYThCTUh3dC94STlaLzdweVJGTFo4ZnJaQUtUZU5adkRyMGlD?=
 =?utf-8?B?VXppVUFGVHUvcXRHRERjWXQ5dVVwNFJKeGRqZFNpOTgxeW1BckkvSHJhc0t1?=
 =?utf-8?B?UFR5d1VaZUlrdXF5bXMwS0o4aEMzZkhOU2Myc2FEZzExMW92Z0E3M3FCcDhj?=
 =?utf-8?B?NmhHR0ZsOWJCcWZjMmxjKzVLUllYTGRUZ0ZaNjBTbXp0VlR2RE4zUkQ0OUVl?=
 =?utf-8?B?SnlkSXdibVVhOTdJQ2IwbmNMVGZFUDZzVzdFTUhTOEpzMWZMWE95OFNVb1Zl?=
 =?utf-8?B?UW5WRWZxa0tCbm5VU2EzVFZNYVBqRk1KVUl3dDFYSk40MU9PcW5oa2ZraTE4?=
 =?utf-8?B?YnBMWWNmTUd2Y2tPU2NIYzFpRXVISTJlN0NoQUhLSUNHb2phRlp6KzRLbHRP?=
 =?utf-8?B?R1B6OGVDQWh6elhtZ3VSeDkrMVNGampPdkI4NW9sclJGbW1CV3JhdEZiSDVM?=
 =?utf-8?B?WTErVU1mTExjbzBGSEdzZDRyUll4U3BDUTFVYTdSdGVYazhjRzYreHlZVEhO?=
 =?utf-8?B?by9XVkJTN3lYeGIwUFJ6aURpY2FSMWxuQzd6TGhPYVFDalUxL3gxOThxVHJv?=
 =?utf-8?B?REh6eEJGdW9lMDYrSjFQdytSdTZkdTlRQ2VMNzR2ZDl2L1hiNnAreTE3RE5q?=
 =?utf-8?B?RVh4SkFFSzgvYTFITkVua1ZKYUxGYzRWL0JHaEVNUDdZb1JuRXFVS1BIZzRO?=
 =?utf-8?B?SDBISGtpVmxyV0dJMGRpWlAxT1NFY0Q0RkdibDhNZzhSRWs3ZXVCRGNaeUxE?=
 =?utf-8?B?N0ZVbVZtS3cvZHdPM2VrVUVtZkNGcjVBOURaUjZnNnA2UkpyYWFxOUttL1dt?=
 =?utf-8?B?VzZsdUV1TGQwRjFudFVqeUd2YmswNW5RZWVEODFzcXo2TkphYkk5bzhtcmQz?=
 =?utf-8?B?MCtxTnRoZDBtSGQvQm14R0xMSUcyZGNHeGx2Qjk4ZGozclFaWUU1aUI0K1lj?=
 =?utf-8?B?OGhZNHZ3clhHYXp1RjcyR2FLK0VySzNVREY2QTZ0M3ZYWGFHcHVsTnVKdU1l?=
 =?utf-8?B?dWVsVGdxZGdmR3Fydm5YZjBkbzZKaVM3YmJJR2FJUjlkdnBTaW90NjAycTZF?=
 =?utf-8?B?a2c9PQ==?=
Content-ID: <77973F924CE0F04D8EE26342AF6F274F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4165.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52048a0-3c7f-4ad9-c19c-08dbb35d9182
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 06:57:45.7113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5uQK6/liD0wjEGYthaoJXroREUD8TWtUfny8eBdi8yJKiSGJ2xXzrRYP+9P49xZx2jNGzVyfiunuReNffRsqnaC157M3fLvpIXdFOu/jKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6436
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.213500-8.000000
X-TMASE-MatchedRID: dwNgap4H9hjUL3YCMmnG4khEDfw/93BuIfyQNHR2naZd9fDYSm945fvt
 4ENurW241Fc61VCGvh2Mu8KJ7LZY2ZRho78T5P9DbBu6+EIezdyiNCtus+nPOlwpnAAvAwaz5gc
 Q9o9yjpt5b5gB3zTPzgG2ORx9Eyap5UyftFAR/CcOSj4RiINDEVg3VqSTJ7So47ndse0z1beXBZ
 /v/hLIO0830Ozl7eLjkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJJE9L
 7/Iw7XjG/FSO+COaTImxKO4OD+H4g7YQiyyrxCfftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.213500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A1C3BF5C6F98979FE097FCB4B44C0063F3F904161A9DE8E72C90A9ADC6A63ECB2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1298914007.1093602861"
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
Cc: =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_1298914007.1093602861
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KR2VudGxlJiMzMjtwaW5nJiMzMjtmb3ImIzMyO3RoaXMmIzMy
O3BhdGNoLCYjMzI7aWYmIzMyO3RoZXJlJiMzMjtpcyYjMzI7YW55dGhpbmcmIzMyO0kmIzMyO25l
ZWQmIzMyO3RvJiMzMjttb2RpZnksDQpwbGVhc2UmIzMyO2tpbmRseSYjMzI7bGV0JiMzMjttZSYj
MzI7a25vdy4NCg0KVGhhbmtzLg0KDQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTA4LTIzJiMzMjth
dCYjMzI7MTc6MjAmIzMyOyswODAwLCYjMzI7U2h1aWppbmcmIzMyO0xpJiMzMjt3cm90ZToNCiZn
dDsmIzMyO1N1cHBvcnQmIzMyO0lHVCYjMzI7KEludGVsJiMzMjtHUFUmIzMyO1Rvb2xzKSYjMzI7
aW4mIzMyO01lZGlhdGVrJiMzMjtEU0kmIzMyO2RyaXZlci4NCiZndDsmIzMyO0FjY29yZGluZyYj
MzI7dG8mIzMyO3RoZSYjMzI7ZGVzY3JpcHRpb24mIzMyO29mJiMzMjtNSVBJJiMzMjtBbGxpYW5j
ZSYjMzI7U3BlY2lmaWNhdGlvbiYjMzI7Zm9yJiMzMjtELQ0KJmd0OyYjMzI7UEhZJiMzMjsNCiZn
dDsmIzMyO1ZlcnNpb24mIzMyOzEuMSwmIzMyO3RoZSYjMzI7bWF4aW11bSYjMzI7c3VwcG9ydGVk
JiMzMjtkYXRhJiMzMjtyYXRlJiMzMjtpcyYjMzI7MS41R2JwcywmIzMyO3NvJiMzMjthZGQNCiZn
dDsmIzMyO21vZGVfdmFsaWQNCiZndDsmIzMyO2NhbGxiYWNrJiMzMjt0byYjMzI7ZHNpJiMzMjti
cmlkZ2UmIzMyO3RvJiMzMjtmaWx0ZXImIzMyO291dCYjMzI7dGhlJiMzMjtkYXRhJiMzMjtyYXRl
JiMzMjtleGNlZWRpbmcmIzMyO3RoZQ0KJmd0OyYjMzI7U3BlY2lmaWNhdGlvbi4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NodWlqaW5nJiMzMjtMaSYjMzI7Jmx0O3No
dWlqaW5nLmxpQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Q2hhbmdl
cyYjMzI7aW4mIzMyO3YyOg0KJmd0OyYjMzI7Q29ycmVjdCYjMzI7ZGVzY3JpcHRpb25zJiMzMjtv
ZiYjMzI7dGl0bGUmIzMyO2FuZCYjMzI7Y29tbWl0JiMzMjttZXNzYWdlLg0KJmd0OyYjMzI7LS0t
DQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMmIzMyO3wm
IzMyOzIwJiMzMjsrKysrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxl
JiMzMjtjaGFuZ2VkLCYjMzI7MjAmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Yw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMz
MjtpbmRleCYjMzI7N2Q1MjUwMzUxMTkzLi5hNDk0ZTA0ZjBkZGYmIzMyOzEwMDY0NA0KJmd0OyYj
MzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMy
OysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtA
QCYjMzI7LTgwNiw2JiMzMjsrODA2LDI1JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkDQomZ3Q7
JiMzMjttdGtfZHNpX2JyaWRnZV9hdG9taWNfcG9zdF9kaXNhYmxlKHN0cnVjdCYjMzI7ZHJtX2Jy
aWRnZSYjMzI7KmJyaWRnZSwNCiZndDsmIzMyOyYjMzI7bXRrX2RzaV9wb3dlcm9mZihkc2kpOw0K
Jmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7ZW51
bSYjMzI7ZHJtX21vZGVfc3RhdHVzDQomZ3Q7JiMzMjsrbXRrX2RzaV9icmlkZ2VfbW9kZV92YWxp
ZChzdHJ1Y3QmIzMyO2RybV9icmlkZ2UmIzMyOypicmlkZ2UsDQomZ3Q7JiMzMjsrJiMzMjsmIzMy
O2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO2RybV9kaXNwbGF5X2luZm8mIzMyOyppbmZvLA0KJmd0OyYj
MzI7KyYjMzI7JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtkcm1fZGlzcGxheV9tb2RlJiMzMjsq
bW9kZSkNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfZHNpJiMzMjsqZHNp
JiMzMjs9JiMzMjticmlkZ2VfdG9fZHNpKGJyaWRnZSk7DQomZ3Q7JiMzMjsrdTMyJiMzMjticHA7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyhkc2ktJmd0O2Zvcm1hdCYjMzI7PT0mIzMy
O01JUElfRFNJX0ZNVF9SR0I1NjUpDQomZ3Q7JiMzMjsrYnBwJiMzMjs9JiMzMjsxNjsNCiZndDsm
IzMyOytlbHNlDQomZ3Q7JiMzMjsrYnBwJiMzMjs9JiMzMjsyNDsNCiZndDsmIzMyOysNCiZndDsm
IzMyOytpZiYjMzI7KG1vZGUtJmd0O2Nsb2NrJiMzMjsqJiMzMjticHAmIzMyOy8mIzMyO2RzaS0m
Z3Q7bGFuZXMmIzMyOyZndDsmIzMyOzE1MDAwMDApDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtNT0RF
X0NMT0NLX0hJR0g7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtNT0RFX09LOw0K
Jmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYj
MzI7c3RydWN0JiMzMjtkcm1fYnJpZGdlX2Z1bmNzJiMzMjttdGtfZHNpX2JyaWRnZV9mdW5jcyYj
MzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsuYXR0YWNoJiMzMjs9JiMzMjttdGtfZHNpX2JyaWRn
ZV9hdHRhY2gsDQomZ3Q7JiMzMjsmIzMyOy5hdG9taWNfZGVzdHJveV9zdGF0ZSYjMzI7PSYjMzI7
ZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2Rlc3Ryb3lfc3RhdGUsDQomZ3Q7JiMzMjtAQCYjMzI7
LTgxNSw2JiMzMjsrODM0LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3Qm
IzMyO2RybV9icmlkZ2VfZnVuY3MNCiZndDsmIzMyO210a19kc2lfYnJpZGdlX2Z1bmNzJiMzMjs9
JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5hdG9taWNfcHJlX2VuYWJsZSYjMzI7PSYjMzI7bXRrX2Rz
aV9icmlkZ2VfYXRvbWljX3ByZV9lbmFibGUsDQomZ3Q7JiMzMjsmIzMyOy5hdG9taWNfcG9zdF9k
aXNhYmxlJiMzMjs9JiMzMjttdGtfZHNpX2JyaWRnZV9hdG9taWNfcG9zdF9kaXNhYmxlLA0KJmd0
OyYjMzI7JiMzMjsuYXRvbWljX3Jlc2V0JiMzMjs9JiMzMjtkcm1fYXRvbWljX2hlbHBlcl9icmlk
Z2VfcmVzZXQsDQomZ3Q7JiMzMjsrLm1vZGVfdmFsaWQmIzMyOz0mIzMyO210a19kc2lfYnJpZGdl
X21vZGVfdmFsaWQsDQomZ3Q7JiMzMjsmIzMyOy5tb2RlX3NldCYjMzI7PSYjMzI7bXRrX2RzaV9i
cmlkZ2VfbW9kZV9zZXQsDQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyOw0KDQo8L3By
ZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1298914007.1093602861
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCkdlbnRsZSBwaW5nIGZvciB0aGlzIHBhdGNoLCBpZiB0aGVyZSBpcyBhbnl0aGlu
ZyBJIG5lZWQgdG8gbW9kaWZ5LA0KcGxlYXNlIGtpbmRseSBsZXQgbWUga25vdy4NCg0KVGhhbmtz
Lg0KDQoNCk9uIFdlZCwgMjAyMy0wOC0yMyBhdCAxNzoyMCArMDgwMCwgU2h1aWppbmcgTGkgd3Jv
dGU6DQo+IFN1cHBvcnQgSUdUIChJbnRlbCBHUFUgVG9vbHMpIGluIE1lZGlhdGVrIERTSSBkcml2
ZXIuDQo+IEFjY29yZGluZyB0byB0aGUgZGVzY3JpcHRpb24gb2YgTUlQSSBBbGxpYW5jZSBTcGVj
aWZpY2F0aW9uIGZvciBELQ0KPiBQSFkgDQo+IFZlcnNpb24gMS4xLCB0aGUgbWF4aW11bSBzdXBw
b3J0ZWQgZGF0YSByYXRlIGlzIDEuNUdicHMsIHNvIGFkZA0KPiBtb2RlX3ZhbGlkDQo+IGNhbGxi
YWNrIHRvIGRzaSBicmlkZ2UgdG8gZmlsdGVyIG91dCB0aGUgZGF0YSByYXRlIGV4Y2VlZGluZyB0
aGUNCj4gU3BlY2lmaWNhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodWlqaW5nIExpIDxz
aHVpamluZy5saUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiBDb3Jy
ZWN0IGRlc2NyaXB0aW9ucyBvZiB0aXRsZSBhbmQgY29tbWl0IG1lc3NhZ2UuDQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDIwICsrKysrKysrKysrKysrKysr
KysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IGluZGV4IDdkNTI1MDM1MTE5My4uYTQ5NGUwNGYwZGRm
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTgwNiw2ICs4MDYs
MjUgQEAgc3RhdGljIHZvaWQNCj4gbXRrX2RzaV9icmlkZ2VfYXRvbWljX3Bvc3RfZGlzYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiAgCW10a19kc2lfcG93ZXJvZmYoZHNpKTsNCj4g
IH0NCj4gIA0KPiArc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzDQo+ICttdGtfZHNpX2JyaWRn
ZV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ICsJCQkgIGNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvLA0KPiArCQkJICBjb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSAqbW9kZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gYnJpZGdl
X3RvX2RzaShicmlkZ2UpOw0KPiArCXUzMiBicHA7DQo+ICsNCj4gKwlpZiAoZHNpLT5mb3JtYXQg
PT0gTUlQSV9EU0lfRk1UX1JHQjU2NSkNCj4gKwkJYnBwID0gMTY7DQo+ICsJZWxzZQ0KPiArCQli
cHAgPSAyNDsNCj4gKw0KPiArCWlmIChtb2RlLT5jbG9jayAqIGJwcCAvIGRzaS0+bGFuZXMgPiAx
NTAwMDAwKQ0KPiArCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOw0KPiArDQo+ICsJcmV0dXJuIE1P
REVfT0s7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5j
cyBtdGtfZHNpX2JyaWRnZV9mdW5jcyA9IHsNCj4gIAkuYXR0YWNoID0gbXRrX2RzaV9icmlkZ2Vf
YXR0YWNoLA0KPiAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Jy
aWRnZV9kZXN0cm95X3N0YXRlLA0KPiBAQCAtODE1LDYgKzgzNCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcw0KPiBtdGtfZHNpX2JyaWRnZV9mdW5jcyA9IHsNCj4gIAku
YXRvbWljX3ByZV9lbmFibGUgPSBtdGtfZHNpX2JyaWRnZV9hdG9taWNfcHJlX2VuYWJsZSwNCj4g
IAkuYXRvbWljX3Bvc3RfZGlzYWJsZSA9IG10a19kc2lfYnJpZGdlX2F0b21pY19wb3N0X2Rpc2Fi
bGUsDQo+ICAJLmF0b21pY19yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCwN
Cj4gKwkubW9kZV92YWxpZCA9IG10a19kc2lfYnJpZGdlX21vZGVfdmFsaWQsDQo+ICAJLm1vZGVf
c2V0ID0gbXRrX2RzaV9icmlkZ2VfbW9kZV9zZXQsDQo+ICB9Ow0KPiAgDQo=

--__=_Part_Boundary_004_1298914007.1093602861--

