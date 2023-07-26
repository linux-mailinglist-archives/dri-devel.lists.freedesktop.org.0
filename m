Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D922F762AE7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 07:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9524A10E415;
	Wed, 26 Jul 2023 05:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD2010E415
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:41:26 +0000 (UTC)
X-UUID: 0c7be69a2b7711ee9cb5633481061a41-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/R9DVBf+LumkLXENZvdIxOy2nGw2kGfA8dFPQ8QVn3Q=; 
 b=HBMZ3sjAT04aPJ1pi4SqoP+NMwoQ0QQYu0udFemuMazvj247PI5so6si2txNNWuDwjMwtETpy+Eg7AwzTQ86xk1o2hSViHVMH1roXAKnxTawzdUrLw7Z1l8HxmdbiRnexapWt7CBM/ONgQP4MApRVaaCzJhYdkA3FvvLiRgp7kQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:75df9da4-0ce1-47a5-a802-5b14f660c323, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:7670ccb3-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0c7be69a2b7711ee9cb5633481061a41-20230726
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2029946861; Wed, 26 Jul 2023 13:41:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 13:41:19 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 13:41:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A77YqzJAz0yjhBD53M5HFzOuJDcojj7rcq5rXODpphOgi3Ng6ha1I1d3dwUavvQFwZGGmOmx8azKMB+UyEKyL8+E2tQkqYpnFNSFOwLdpDZNIyMfGVC29XOzi2k4N2bwaPyrwa0TyJpXlUklu9JvY/CF99yc0tOGZsN6wqMIHh4E0hcYjIXimC2rDH6ERVCI4tVTe4FT7j/bVDGDFKaw0h0H050qDt4PzHwfaoXOtvFY1IRDEPtJ6JpT9Xe0wmIufzA+ot4H3i2jQjzfLk+bS/mgyr4fykr04NFtmrgxrzX1ndDC64SfnPiFYmDvyJ1t9q0PuZblZKmf4dmWEy8cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjJdDtaCoUrOGEcXRehkGWGq0MoAOrISo/ecKFlB/lU=;
 b=Eh4k3Qf1v6FWge1Gu/lh6ek2l1LEoou6kAD9ss2hGdX6TqhHuboYLvntafzMrlnJODz/yEM6gx/UgMn2me1P/MRGzhgQSLcTVRFurTEuBXlSbmq2vunzqezEKyTYzZQwCanrz9hSbknzRM28ef3W4lmBz+eHSYBl0Y4MnNierm488p4UHG+CO5hKeLg4swKYGEuJyz8qjcCk9F8C0iCg9IF++nJJgHuKuir+CLH4SlloNFNW08DUVB98RdK12bQWEFPr3EnAlIaOej0ZhjK3IdFyODz4K8IJq6VmEQzyxlKECLeeNuApV7spLcIt/MRIi189uRaWjmlpy5sL4Pa09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjJdDtaCoUrOGEcXRehkGWGq0MoAOrISo/ecKFlB/lU=;
 b=Kxelyp5xdkAkavLD+Ip9KCui5cDvERFJLxXMgbGYPha05gDzl6tvoaJceORVwhphtxuhrqezula+f+Fr2jWuaqkxfhQMnAdfv4RFkJ2j8TY9y2ywrqmmRj6rymLJlSc5wHodaoGn6ZrzMZ/+Mv/JSgK0nfgvxE+PUpwktCzEjOM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7427.apcprd03.prod.outlook.com (2603:1096:400:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 05:41:16 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 05:41:16 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 3/6] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Thread-Topic: [PATCH v2 3/6] drm/mediatek: mtk_dpi: Switch to
 devm_drm_of_get_bridge()
Thread-Index: AQHZuhXc9/G0G4OGk0+2ewuRsPheuK/Lk2qA
Date: Wed, 26 Jul 2023 05:41:16 +0000
Message-ID: <d7265ef4cf8f302abfda4c29c31254f6fdb39a9e.camel@mediatek.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-4-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7427:EE_
x-ms-office365-filtering-correlation-id: 119b117e-49cd-4e85-c331-08db8d9aedfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RdC73Vr8XC+dLbme1D0GOJbJKct8pIhksDbqGPwnzGphOq/I+D/fAFg2UD/NlhZ3FYW5UW/e4j7TczcU/4w70GgHuLUK/AaGEf756LOsE2s9NcL7WLXozx0BdTxZvZti4PuhgheyH0Rmf1Yf81feGZqq3O4d8SBKgxCo5Hu48s+ACtkphg9nWm9rqljX0j//eIlaCorUhbM2+md6GXp52ge6HIfTZKsvpH2VNglpTeWgkgFcLFnxmeih1bRxWxiuBo+KUGTJCF6QPIidvsvrNMkRXBccn1ant8jdG921nD/zS6l6Eky5S1x+sT1EIlD1RXqrNXfnLF4jRpJSfG+Sx8Ud6FeNYSORNm7tKBXxDbGiVLBb5QWggXfpBx3OmXM5yUix7tuExHsbiJr+lpj49fbzZc1HyOEURoq3UDkptuN1KTQiaobs35iXImH6sNRmuXy4WzA4fnFN6Dh6bedf2wyYQDvmBu/Y7JTNwf2dD5WmXI1NzxFmz1Euod/152aC/yz9eT25+H1kgqczNQoER3czZVlBsVyKeB8UtRZkKxPMqsNRNF/nc4M3jmtiIrJ72KTNoWKqKUsV+Hdf23tDl6zCNrgH6BxZnKTdg3rC1AG1Tp5Lc8ii6oCTVFF7Gp8Xt4jeU6o/sIhx/K6zoT0eYo5oHvvFrJNx4kzc3s68Glg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(2616005)(66946007)(64756008)(66476007)(83380400001)(66446008)(85182001)(38100700002)(36756003)(86362001)(41300700001)(38070700005)(5660300002)(8676002)(8936002)(122000001)(54906003)(6486002)(478600001)(71200400001)(110136005)(66556008)(4326008)(186003)(316002)(6512007)(2906002)(76116006)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXM1WDVsdGhaYmgyejdlTGxseGlOQUo0Zm8zWUQrS2ZPaVBhbHRiNEFXdUJn?=
 =?utf-8?B?SEs2VHVtMXNnTkpqS3JTc2xZU0M4UXVCNHlpdmtDUFFlWi9heHpHRDhGb2E5?=
 =?utf-8?B?VGRSWGlEeHYrcTA4eE5BejI4NG52ajhCV2VPY2JvME1aNCtlOEw2T09LQWtQ?=
 =?utf-8?B?Q0hPZFQvTTNiLzFvb2NJQUVxbkJjaCtDU3ArWnZ3dEJodUNzT3RHbC9jakd1?=
 =?utf-8?B?SXpZMC9vNXpVZTRMWTdvQXpXcWkvZllCN0F3RVdBaExTdy84MFU0azJXUUxN?=
 =?utf-8?B?dWpndjBZam12MjhtTHhEZkF0anU5K3REdjBBcDhHZkJwM1RMSXNZYml6M1Zl?=
 =?utf-8?B?VVYrRFVsK0VpSzhZTE1hU0RBREhEbzdia25EUXlyUzE5b252dndmeFhoTXBX?=
 =?utf-8?B?c3puTkJsVk9RenZtUFJhaU5aUG5FN2VkYjUvK3ZFNGloYkxEemV3blgzMWM0?=
 =?utf-8?B?WnAyM0JXL1FxME5UTE4rcC85YkpHdEZxaEQrbGVJdE5uYncvVWZzOE1tKzNa?=
 =?utf-8?B?bE5Ba0p5NjA4VHY5VFdCOTJhVGFaN1p6VFBnWDA1RjVkYkJQcTVNcTlOelFr?=
 =?utf-8?B?WVRtUjVwL3Rod2Iwc251OWZ6OVQxNzFxUkcwNFZiZ0ZGTWFTVlgrdFJMbVRV?=
 =?utf-8?B?SGErRWVyUm5PcXA4S2RqNWk0bFpkb0c2R1o0enBlbDZtaXIvMExVZFh3bkpR?=
 =?utf-8?B?dkpUZEZvTXA3dTNkTnE4MW5oOTMxUCtqbjNqNG9ndUhydndYSW5laHdoM3VC?=
 =?utf-8?B?RHc5WWlpV1E0b21EendkZzJUamY1c2t4dDZIcEtQNVVVRThUTFZDa0oweStq?=
 =?utf-8?B?LytuRHpZS29tTnk5NzVnTVlyYXBNdzV0Z0Rka0NtODVSajY5SDlkUVB5Ymx0?=
 =?utf-8?B?UUZycEpZeStNRmJpRUxYVytmZ09jYTUxZDdHeEJxTUxOcWFaa1JDWVd2MjJi?=
 =?utf-8?B?Tlcza3hCWDVla3B6eEljcUV4b0VnUVgvYUhrNmk2emFURHZpS1hqS3NoaUFq?=
 =?utf-8?B?UFZOSjdZd1hNQ2wvUWt5cnhpcHV5RWZtdlptb1o0ZnFRelEwYzF3UjJFZWZ3?=
 =?utf-8?B?OXN1US9RdHMrSUp1NENiQ0REeThYeUhsSGpvdWkxT1RVL2xiN2xKQWtyeFJu?=
 =?utf-8?B?N3JuVVU1a3dJTVZJc1F5dU1TWjVCSW1RL2tuV0Nlb2JwYUVjc1ZJOVhGSFE2?=
 =?utf-8?B?czRqZGtmV0wvRUJHYVpkVG1uNmRmUDhSSHdWWGZ4QXhzdVFBa0psdDU5Um13?=
 =?utf-8?B?aFBjaWFKLzZRblJIdjhYaWdEdWxJQjB2MVphaUVhalYvaGl6Y0wxRFpSMHZw?=
 =?utf-8?B?NWorS0F3QW9iZmxGTEpUalYwc2Fjb1JWMVBKYU1BN3U2S0JQOFoxY3dpVE1K?=
 =?utf-8?B?My9EMDZoVElHQ3lacEpWdmFCY1NvbEdtdWpBcDNSRjh4b1RUazVJTWhjMDhT?=
 =?utf-8?B?Y0hSUEZqZHB3QkZta3FtS3B6K1diMHh1N3llS3pTdE9YaGVhTkFtNzMxOE5y?=
 =?utf-8?B?Umlzb2R1UmpEbWhacTRka3I0Rk8zWVBPYXp5enBHeTZQWnBWYUYrNUREeXM2?=
 =?utf-8?B?Y05nUnNXR01ndWpQQjQyTldVVzdJamdxNGwxbWtsK3RUTElIbWZvYmgzMVMv?=
 =?utf-8?B?L1Qza3h3UVJqdU5zQkdER0cvMGNyd0pIUnQ3S2IwVW12dzdDRnN6dlluL3JJ?=
 =?utf-8?B?WkRCL3V4d093Z3Fmb05aMHlDcng1VVZTam9LRHYvRjJhcnIzbXNIMW1QZ0to?=
 =?utf-8?B?d3hib2tRbTIvZVFic3VpNW9GME0vRE1lTmRxSnNPeGE0TkJ6WnhsSUdnZmJM?=
 =?utf-8?B?a1F5aG5NZ2tidVFMK05mdDFqc3JSY1E3WERKU0RJSFJlR00rZmRLUWgyblRN?=
 =?utf-8?B?R1VLRkhkR1BuMDJkZUZVNFZFNWZXZThLVy9ZdkxmeDFoNzNmWjlLaUdZejVP?=
 =?utf-8?B?N1BiT0FGaEQ0d1NaVUw2c0hiSmhvY2F3andJbjltYkp1ckF3VFRjTGpENXFQ?=
 =?utf-8?B?UUpSb1d5R0djaDE4WTVoYkZYYmtFUUlpMkhXeUoyV0RVa1l0OW02MDJXQmti?=
 =?utf-8?B?TWRLamNqMDY2UFVZQkJoREU4WjVOSlpWeE5hVkdGcFY5VmxJMzhhQzI4VzhK?=
 =?utf-8?Q?vxLgvrH+DM0VOW2PPq2jWZWCY?=
Content-ID: <6A5C95A200C8AE4AA3527262DD1AE827@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119b117e-49cd-4e85-c331-08db8d9aedfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:41:16.0226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mrno/bCkaH3ZF/xQePKnrPiNoJbcP56cKMhmIC0G6iQGUCh8ZslbsbTcPP1rDH4/PcU2m9M/6uRHC8lkB3dr1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7427
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_130520581.1987509378"
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_130520581.1987509378
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0xOSYjMzI7
YXQmIzMyOzA5OjUwJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7RnVuY3Rpb24mIzMyO2RybV9vZl9maW5kX3BhbmVs
X29yX2JyaWRnZSgpJiMzMjtpcyYjMzI7bWFya2VkJiMzMjthcyYjMzI7ZGVwcmVjYXRlZDomIzMy
O3NpbmNlDQomZ3Q7JiMzMjt0aGUmIzMyO3VzYWdlJiMzMjtvZiYjMzI7dGhhdCYjMzI7aW4mIzMy
O3RoaXMmIzMyO2RyaXZlciYjMzI7ZXhhY3RseSYjMzI7Y29ycmVzcG9uZHMmIzMyO3RvJiMzMjt0
aGUmIzMyO25ldw0KJmd0OyYjMzI7ZnVuY3Rpb24NCiZndDsmIzMyO2Rldm1fZHJtX29mX2dldF9i
cmlkZ2UoKSwmIzMyO3N3aXRjaCYjMzI7dG8mIzMyO2l0Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7
Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0
Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtGZWkmIzMyO1NoYW8mIzMyOyZsdDtmc2hhb0Bj
aHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7MTAmIzMyOysrKystLS0tLS0NCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2luc2VydGlvbnMoKyks
JiMzMjs2JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1n
aXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7Yi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MDNh
MmI5MDBiYjUwLi5lOWM1YTBmNDQ1MzcmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEwNjMsMTAm
IzMyOysxMDYzLDEwJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlfcHJvYmUo
c3RydWN0DQomZ3Q7JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMz
MjtpZiYjMzI7KGRwaS0mZ3Q7aXJxJiMzMjsmbHQ7PSYjMzI7MCkNCiZndDsmIzMyOyYjMzI7cmV0
dXJuJiMzMjstRUlOVkFMOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1yZXQmIzMyOz0mIzMy
O2RybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtJmd0O29mX25vZGUsJiMzMjswLCYjMzI7
MCwNCiZndDsmIzMyOy0mIzMyOyYjMzI7TlVMTCwmIzMyOyZhbXA7ZHBpLSZndDtuZXh0X2JyaWRn
ZSk7DQomZ3Q7JiMzMjstaWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjstcmV0dXJuJiMzMjtyZXQ7DQom
Z3Q7JiMzMjsrZHBpLSZndDtuZXh0X2JyaWRnZSYjMzI7PSYjMzI7ZGV2bV9kcm1fb2ZfZ2V0X2Jy
aWRnZShkZXYsJiMzMjtkZXYtJmd0O29mX25vZGUsJiMzMjswLA0KJmd0OyYjMzI7MCk7DQomZ3Q7
JiMzMjsraWYmIzMyOyhJU19FUlIoZHBpLSZndDtuZXh0X2JyaWRnZSkpDQomZ3Q7JiMzMjsrcmV0
dXJuJiMzMjtkZXZfZXJyX3Byb2JlKGRldiwmIzMyO1BUUl9FUlIoZHBpLSZndDtuZXh0X2JyaWRn
ZSksDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZxdW90O0ZhaWxlZCYjMzI7
dG8mIzMyO2dldCYjMzI7YnJpZGdlJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7
JiMzMjsmIzMyO2Rldl9pbmZvKGRldiwmIzMyOyZxdW90O0ZvdW5kJiMzMjticmlkZ2UmIzMyO25v
ZGU6JiMzMjslcE9GJiM5MjtuJnF1b3Q7LCYjMzI7ZHBpLSZndDtuZXh0X2JyaWRnZS0NCiZndDsm
IzMyOyZndDtvZl9ub2RlKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtAQCYjMzI7LTEwODks
OCYjMzI7KzEwODksNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3Byb2Jl
KHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlDQomZ3Q7JiMzMjsqcGRldikNCiZndDsmIzMyOyYj
MzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3JlbW92ZShzdHJ1
Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsm
IzMyOy1zdHJ1Y3QmIzMyO210a19kcGkmIzMyOypkcGkmIzMyOz0mIzMyO3BsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOw0KDQpNb3ZlJiMzMjt0aGlzJiMzMjt0byYjMzI7dGhlJiMzMjtwYXRjaCYj
MzI7b2YmIzMyOyZxdW90O1NpbXBsaWZ5JiMzMjt3aXRoJiMzMjtkZXZtX2RybV9icmlkZ2VfYWRk
KCkmcXVvdDsuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjstDQomZ3Q7JiMzMjsmIzMyO2Nv
bXBvbmVudF9kZWwoJmFtcDtwZGV2LSZndDtkZXYsJiMzMjsmYW1wO210a19kcGlfY29tcG9uZW50
X29wcyk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQoNCjwv
cHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmlt
bWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFs
bCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJv
bSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBl
LW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_130520581.1987509378
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTE5IGF0IDA5OjUwICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRnVuY3Rpb24gZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKCkgaXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQ6IHNpbmNlDQo+IHRoZSB1c2FnZSBv
ZiB0aGF0IGluIHRoaXMgZHJpdmVyIGV4YWN0bHkgY29ycmVzcG9uZHMgdG8gdGhlIG5ldw0KPiBm
dW5jdGlvbg0KPiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCksIHN3aXRjaCB0byBpdC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBSZXZpZXdlZC1ieTogRmVpIFNoYW8g
PGZzaGFvQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jIHwgMTAgKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Yw0KPiBpbmRleCAwM2EyYjkwMGJiNTAuLmU5YzVhMGY0NDUzNyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC0xMDYzLDEwICsxMDYzLDEwIEBAIHN0YXRpYyBpbnQg
bXRrX2RwaV9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChk
cGktPmlycSA8PSAwKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiAtCXJldCA9IGRybV9v
Zl9maW5kX3BhbmVsX29yX2JyaWRnZShkZXYtPm9mX25vZGUsIDAsIDAsDQo+IC0JCQkJCSAgTlVM
TCwgJmRwaS0+bmV4dF9icmlkZ2UpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+
ICsJZHBpLT5uZXh0X2JyaWRnZSA9IGRldm1fZHJtX29mX2dldF9icmlkZ2UoZGV2LCBkZXYtPm9m
X25vZGUsIDAsDQo+IDApOw0KPiArCWlmIChJU19FUlIoZHBpLT5uZXh0X2JyaWRnZSkpDQo+ICsJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkcGktPm5leHRfYnJpZGdlKSwNCj4g
KwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IGJyaWRnZVxuIik7DQo+ICANCj4gIAlkZXZfaW5mbyhk
ZXYsICJGb3VuZCBicmlkZ2Ugbm9kZTogJXBPRlxuIiwgZHBpLT5uZXh0X2JyaWRnZS0NCj4gPm9m
X25vZGUpOw0KPiAgDQo+IEBAIC0xMDg5LDggKzEwODksNiBAQCBzdGF0aWMgaW50IG10a19kcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gIA0KPiAgc3RhdGljIGlu
dCBtdGtfZHBpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAt
CXN0cnVjdCBtdGtfZHBpICpkcGkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCg0KTW92
ZSB0aGlzIHRvIHRoZSBwYXRjaCBvZiAiU2ltcGxpZnkgd2l0aCBkZXZtX2RybV9icmlkZ2VfYWRk
KCkiLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAtDQo+ICAJY29tcG9uZW50X2RlbCgmcGRldi0+ZGV2
LCAmbXRrX2RwaV9jb21wb25lbnRfb3BzKTsNCj4gIA0KPiAgCXJldHVybiAwOw0K

--__=_Part_Boundary_005_130520581.1987509378--

