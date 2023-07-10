Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6474D17F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BF210E246;
	Mon, 10 Jul 2023 09:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FD810E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:32:21 +0000 (UTC)
X-UUID: a81504761f0411eeb20a276fd37b9834-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LWQe265F5O+r/o+IEM+zMt1m0cJDV2CDCM+vI0xVymc=; 
 b=b5k8mxF8QP6DD4O2NlL5I8VbG4R+29Fb9ertMz13QpQD/LixEAqxkxxVTTNOAcE2cMWxkvQlH05WVNy2mM8a9LfVrz0OCAGx75Flo2PYy4vwX5wFqynw3yCQCVu+eJ9W0auKbZEO7oBrFSR3CXTSmnH+97EZJRmylag5CdjzgWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:880d1cbb-27af-4e70-9657-61beb0aa0e26, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:73
X-CID-INFO: VERSION:1.1.27, REQID:880d1cbb-27af-4e70-9657-61beb0aa0e26, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:73
X-CID-META: VersionHash:01c9525, CLOUDID:677cc30d-26a8-467f-b838-f99719a9c083,
 B
 ulkID:230710111355BJ460XCR,BulkQuantity:20,Recheck:0,SF:28|17|19|48|38|29|
 102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS, TF_CID_SPAM_FSD, TF_CID_SPAM_OBB,
 TF_CID_SPAM_FCD, TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: a81504761f0411eeb20a276fd37b9834-20230710
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1199935159; Mon, 10 Jul 2023 17:32:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 17:32:14 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 17:32:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3qAkfhZieNPpbS6jdzJCFp7OXmpQsmspbL30n27TGLWopZ2iY73MKqeHMk0cJq2Uomh+mtgroPk2p+7exReUW2MYFVmlqBYsUcoeUoVpUhmDZqpvMwi/w8EWgdtlQpRC4XIq6yx4uGAa9CBZ2Zbd+KB/TcBxms9/beTvV7RuKWiCe9FdG/Ku/XU1Y27FTs6tSXXVv6RnrAo4gjtApt7RPJX72h8macFNV/WbgbzZxG0IaOq+CFjBYkkkiZPwKpodwqgODanjkipjEECVw6V0d5CB4nDcotaWXBc7bPBDvS6LFcxndL/LmC4FtkyuqKv20qH7RBwVQP7Th7yfzv0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97twSx+tssjHq6sYy0J1LN13I9UHOht8fnfCiNaxMUw=;
 b=ODP0XA8sG9fvNyFSR0yZ5iIoXnRf6YtvQUmiQ+u4FafvBGYFscFLv572PjcN/DLcB9UPjeq9RdtQrafhXzADJA3ECynGfh31R8JBonIDyNj7v2rsIZ/ovQoQc2py2OZkKm7T4JrllTwyhR0MhVnaVFK4Fk2m/JCzMOFFrGsjyoZ1GCSRqGzJkRYvIRpn84V0f8bIBZyyKPWYIIA6zWdiKmoLzXL0eRKrAXKXF4Nm8g81P1TYM2JwIX1NXu22ZAu0RbtdCe+Agh7wrjW53t8Xk5XFvy+a2sYQ3HkuLds/7iORcBcOxaTBgWD9OsTb0Qhl3ZuLazol5p0qxXLVl8di+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97twSx+tssjHq6sYy0J1LN13I9UHOht8fnfCiNaxMUw=;
 b=RWI+pRTXtfZ1U7Wln1EzFwwj8M04KMc36o/R5WnpHhvP3JZEhBfZi/UcNxAwoXa+3FZfkG2zM9zDTxdFZUac6H2HhZ5Cv0+gIsLQYgK92PBzRFn6vmEpt5clLnzduHbEgR5bFe71HjG6tPfvyf5WkzJqBMuinEiOsXwhT13Lqzw=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by SI2PR03MB6485.apcprd03.prod.outlook.com (2603:1096:4:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 09:32:12 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::937a:67d9:405c:7eec]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::937a:67d9:405c:7eec%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 09:32:12 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Topic: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Index: AQHZsoJHiSxKBEMvxEGs4Pxt5vriP6+yphIAgAAXt4A=
Date: Mon, 10 Jul 2023 09:32:12 +0000
Message-ID: <efaa46e998e3ca3db787ab178e2f88276977b84f.camel@mediatek.com>
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
 <20230709162641.6405-3-jason-jh.lin@mediatek.com>
 <56a8fc90-337b-5ac2-be13-5420f2de6c5a@collabora.com>
In-Reply-To: <56a8fc90-337b-5ac2-be13-5420f2de6c5a@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|SI2PR03MB6485:EE_
x-ms-office365-filtering-correlation-id: 5c820a1a-b3a8-49aa-3d54-08db81288a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0hyVsCnHhAPCQ6pVj2y2TUYImPNsj93k5YXZqR6NnoI03VZZwRfYoa63pPdOeIaD68oeYF0/eeut77tMYFp3CDiCiv2koK0ogjbZZ20+VWinKWlMqeYeLwiQq1fKHnWTCgX/DmH9sJk1mYrLQuaPUMef/2iPqKKX/7DJldq87i6vEV/4nwB/NN1r/gdr5RJPlxKO2ot/cJCEqC3jpGPhuPRRzOwSQI3nYIdpG03JJ2wDLDkZ1QC0yiZOUjpcYKohTp774Fv4wsFkGxbmx3/7fwIGmwBDcZj4ZYElgvszAyZKdrs7ObB6rLrlJikr/ZgiklzETq7Gow8+GAZnOuaBcfX/wOCmnpDAZ07pAKA8TERHOZ5Y+zLlE3jFyOQzdzvAGd+uMpoLOb9B9ytYJaGqnTDbNwJqxdep3O9XQuQKn1MqyypvxMfEXaKA6MkYmaXUrKi+cZHr5Fw1ZOHLtRzE4C+rKhfpyoLWyEZ+b901/QwgR7I9opfyfy68qpbHCnLsnJUrd/GkbdtcN6jzKwlZNPRCT5s3gXtvy+5dI0Ozsb+4V1iJuT2JgG3emOEx4RBH6OVU8q+QC8m9ZGSJyw/xYWsjFZCi+Y0umZifwKt7D26QjXdpYVLvZH3p3SAwOIIOtPNT5wG9dwkL1hrlWOZ4CnCiyBKbJw74Gu1X7EbDZvs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB7669.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(86362001)(38100700002)(38070700005)(36756003)(85182001)(71200400001)(6486002)(110136005)(54906003)(76116006)(91956017)(122000001)(26005)(6506007)(186003)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(64756008)(66446008)(4744005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTAzSW0xTzNFNUREVU1HNzc4Wmc5bHpLNWRabGpJUGl6OFU0ZVdUMExqUFFJ?=
 =?utf-8?B?SHR1ZldqUHpjdndGYUVObm4zaFJuMjNTOG12U1NJL1AyTDI1azlxeGZEM256?=
 =?utf-8?B?bDV5eWt3Z2hOMlE1ZWFna2RYVHhiYWpISmZBU3ZaRTdhNW5oVVJQd1JnN3NS?=
 =?utf-8?B?S0IzV01jN0duTWl1MW9nZ0kyYVRaeTErN0NLdFAvR2Z1L0c0WFNqOHBVWjN3?=
 =?utf-8?B?Q09oNHo3NUhhbDVkSHlkL1FCYUZuUXBlT09qQ3dxY3BncG45bTBXdTdRRGti?=
 =?utf-8?B?eGlCK1NOMTRMYVpzdEsxOWlXWXQyMlJSQWx5ZGRFZ0s4K2gzWVZ4TzlIRjJp?=
 =?utf-8?B?UUYyRWhsWlg0VEMwTmIzcUdxRis0R1Irdi9OUjl5SkowNUlHTlMyaEtwTFNP?=
 =?utf-8?B?aDZPMEN4VnV5UUhJNUxlbFZxRWY3NGNNZjZoZHVDZ1lxYnhXSUttbVdFWFBG?=
 =?utf-8?B?UGNuWjNZMVk0Zk1iU3d0UHgwRndlM3VOeDhZWDhRdWRVN25seFNrbW5Ja0cz?=
 =?utf-8?B?dW05NjBjVzFaSm5BV2V6YThxZWx4bXE5OWRNdVZOZ3JRd3FWOVZOYUt5bHJH?=
 =?utf-8?B?RDVacFJZamg2NGJMcVpyb2txR0tCam9hNVZBQTBjTGV3WGttd0RnbzRJTjNM?=
 =?utf-8?B?U1RNQ3ZxVFkyMFNQVjJnV3R0VU94MFdqWU5BWStNTGZtbzNkTXc4Y1BPM0cw?=
 =?utf-8?B?U0JnUHhMMUpjYTdzMlZESGdVcXljZWdBWTNZeERhbUdsSFhGQkVkTFlNbDQr?=
 =?utf-8?B?TzRIb1BTSWMyeU9XQnREcVZpcWxDWEpmWTN4RDNUV2U2MnROOGxnaUhYTEtr?=
 =?utf-8?B?MTZhRldXQ3c3bitNV29aSTRldUVZRDRzRmpOL3FqTTdGU1c4MDJnL3MybUM0?=
 =?utf-8?B?ZWNwSGhCY29nSlViMFpBN1NqWGhIMTJGRDhaWnVueUVvVU1hZjcyN1R2Ymwr?=
 =?utf-8?B?VGRLcXEwTW5BS2pyK3hSci85SmVJa3RQMHQ4c0NzVEtMODk3NmtQdnRqcmhv?=
 =?utf-8?B?cE5tcGhNcjFlS21xR1FTUzJVemp2elR1WTJnVXV2Q28wZlpkalFTS3ozQjAw?=
 =?utf-8?B?bXlwRExzQ0FFN2h4S1AyREhOdUJ1ZmdLdU9mVm5PNmhJNTFLVUVsNE8xbVBU?=
 =?utf-8?B?WnZ0eDJRc1FHTWI3Rm15aVJZQnhmTWNmbExBTHRCa1dHY24xWUtzc1dpZXRu?=
 =?utf-8?B?OTl4eE82MjlpL1RWa01adUZVSVU1cEZpc2g5WTVyRWdSZU1pcVg2RHRQU29q?=
 =?utf-8?B?RUw4aDR0a3F4MUJ4dWhsTGVTWkVKdjNheGZEVldQQWhnbktaUk56RUhNVjdq?=
 =?utf-8?B?d2NBSWJOaytITFZHV2Y4TDVKQVE5TkVrV08rZXBWTFluWHB6MkorRDl1SDNC?=
 =?utf-8?B?TXI0QkJjRjBXZHVpcjB5L3hyTFRjWWdHaVFwRFVHNzVZcTg1ZVhmcUV5MnV0?=
 =?utf-8?B?eVlwTzdPaEt1cVh5d25QR3RXbFNoYStYUnVVbWRMVndwOVNNRXZva0xCd3FG?=
 =?utf-8?B?YUMzMTZDbnNZSW9qREFvNURFL2wzSXNaK3doRmJSNWNyellsU2VLLy9ac0s2?=
 =?utf-8?B?QWg4YTAvSlk5a1FrcTlVWGtlRFBJSWxlWld5bUNiREcwcnZCQlM5U01kMEVw?=
 =?utf-8?B?ZFlVS3psTXhjK2orK0lJNW9xQ0tlMlBaMFJld3NiV09CZVJ1VXkvN3pHcVVk?=
 =?utf-8?B?OFVOdW9IbnI4SzUwTE1DVFpHVnpaS2VsRWxWRDZmc08xd3h1T1EwM0NUeFNB?=
 =?utf-8?B?dVhKNlFkV2hvQ1NTWGJqR0xNeGhZVC9hb1ZUMTNZcE1JdktEVnJOdGlyZXRX?=
 =?utf-8?B?YmltL2RLcmFvMXpka3hmcGdGRG9iVFZJc2ZWbCtiUDBMdklLeld4dTRPbDV0?=
 =?utf-8?B?R3haUy9HcklRYkpyN3U4VTdWdlkrMStwVUR4aVdYOEs2SzEzNWNBc2c5Z1Q2?=
 =?utf-8?B?VkNJQk1RcVpNeUJNQkZ4RXNlWGR5aVNQdlFXYzJmSUo1R3dNdHBqUk5pa240?=
 =?utf-8?B?ZXBJZzFIaVdMRERCWGlLSU42bFJFTC9oNkxwbjV5ajlrUTRWODJBNlZJZGRa?=
 =?utf-8?B?T3AzV3YxWXVHMW9iTDR2OXRqSmwyREV3RTVlb3UySDBFSDF6dmJYOSt4SWpU?=
 =?utf-8?B?a0NMTzVuL1FKT0VodXN6K0FPR25WQy9VR0Fad0xHTzZXb1NCYW5PRE1JNzJ6?=
 =?utf-8?B?SGc9PQ==?=
Content-ID: <6065B93182B0844E80DCB3A4BF5A60FC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c820a1a-b3a8-49aa-3d54-08db81288a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 09:32:12.5708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzEbgkJTivPEqSh6A7yIKxotD+ZoE93DT6OtrrDk5T7QPo092SUFkkNix2zF3Qe7Paxe61rDkb656gP/ZG0UdZvUzuagpjLMA24592kqoYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6485
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_532501470.499418044"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_532501470.499418044
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmll
d3MuDQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA3LTEwJiMzMjthdCYjMzI7MTA6MDcmIzMyOysw
MjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMy
O1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3Bl
biYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zl
cmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZn
dDsmIzMyOyYjMzI7SWwmIzMyOzA5LzA3LzIzJiMzMjsxODoyNiwmIzMyO0phc29uLUpILkxpbiYj
MzI7aGEmIzMyO3Njcml0dG86DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPVkwmIzMyO2xheWVyJiMzMjtz
aG91bGQmIzMyO25vdCYjMzI7YmUmIzMyO2VuYWJsZWQmIzMyO2JlZm9yZSYjMzI7Y3J0YyYjMzI7
aXMmIzMyO2VuYWJsZWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUmIzMyO3BsYW5lX3N0YXRlJiMz
MjtvZiYjMzI7ZHJtX2F0b21pY19zdGF0ZSYjMzI7aXMmIzMyO25vdCYjMzI7c3luYyYjMzI7dG8N
CiZndDsmIzMyOyZndDsmIzMyO3RoZSYjMzI7cGxhbmVfc3RhdGUmIzMyO3N0b3JlZCYjMzI7aW4m
IzMyO210a19jcnRjJiMzMjtkdXJpbmcmIzMyO2NydGMmIzMyO2VuYWJsaW5nLA0KJmd0OyYjMzI7
Jmd0OyYjMzI7c28mIzMyO2p1c3QmIzMyO3NldCYjMzI7YWxsJiMzMjtwbGFuZXMmIzMyO3RvJiMz
MjtkaXNhYmxlZC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtQbGVh
c2UmIzMyO2FkZCYjMzI7dGhlJiMzMjtyZWxldmFudCYjMzI7Rml4ZXMmIzMyO3RhZyYjMzI7YW5k
JiMzMjtyZXNlbmQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYW5rcywNCiZndDsmIzMyO0FuZ2Vs
bw0KDQpPSywmIzMyO0kmIzM5O2xsJiMzMjthZGQmIzMyO0ZpeGVzJiMzMjt0YWcmIzMyO2F0JiMz
Mjt0aGUmIzMyO25leHQmIzMyO3ZlcnNpb24uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0K
PC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_532501470.499418044
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBNb24sIDIwMjMtMDct
MTAgYXQgMTA6MDcgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiAg
CSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gIElsIDA5LzA3LzIzIDE4OjI2LCBKYXNvbi1KSC5MaW4gaGEgc2NyaXR0bzoN
Cj4gPiBPVkwgbGF5ZXIgc2hvdWxkIG5vdCBiZSBlbmFibGVkIGJlZm9yZSBjcnRjIGlzIGVuYWJs
ZWQuDQo+ID4gVGhlIHBsYW5lX3N0YXRlIG9mIGRybV9hdG9taWNfc3RhdGUgaXMgbm90IHN5bmMg
dG8NCj4gPiB0aGUgcGxhbmVfc3RhdGUgc3RvcmVkIGluIG10a19jcnRjIGR1cmluZyBjcnRjIGVu
YWJsaW5nLA0KPiA+IHNvIGp1c3Qgc2V0IGFsbCBwbGFuZXMgdG8gZGlzYWJsZWQuDQo+ID4gDQo+
IA0KPiBQbGVhc2UgYWRkIHRoZSByZWxldmFudCBGaXhlcyB0YWcgYW5kIHJlc2VuZC4NCj4gDQo+
IFRoYW5rcywNCj4gQW5nZWxvDQoNCk9LLCBJJ2xsIGFkZCBGaXhlcyB0YWcgYXQgdGhlIG5leHQg
dmVyc2lvbi4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_001_532501470.499418044--

