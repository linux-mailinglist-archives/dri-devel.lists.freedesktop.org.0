Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0E6F6656
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE9010E3CA;
	Thu,  4 May 2023 07:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B82810E3C7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:53:42 +0000 (UTC)
X-UUID: c65c5db4ea5011ed9cb5633481061a41-20230504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=58vN6oI0dBOsyATx96d4XdS/VcwzzoPTkvatM7cUWXY=; 
 b=Mx69deHyf40y7f7gH50YQ3PHjU1LxMI8wljl9bQbPl9vYjyzblceX3vyQjPsjt9tNtBi7506GMbhertWKD8mN9TKqLtF/v0RtLxxPw4jJ/8hhEHpJCyfUVsAvyYxDy22Hv8H33zfS6UV4MGHUhjvCxdxCgribDFh5owS4UpDJx4=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23, REQID:165a8fdc-c30b-43c3-8293-829ef0f5d3ef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:4,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:4
X-CID-INFO: VERSION:1.1.23, REQID:165a8fdc-c30b-43c3-8293-829ef0f5d3ef, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:4,FILE:0,BULK:0,RULE:Release_HamU,ACTION:r
 elease,TS:4
X-CID-META: VersionHash:697ab71, CLOUDID:ae8dc3bf-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:2305041553392RE0HW40,BulkQuantity:0,Recheck:0,SF:38|16|19|102,TC:nil
 ,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
 SI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: c65c5db4ea5011ed9cb5633481061a41-20230504
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1266210725; Thu, 04 May 2023 15:53:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 May 2023 15:53:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 May 2023 15:53:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzhO0AgL7kBadYygcPZZ6jAHeUyGwZJe4Cgdbm3nxgwRqqvM7FfQEmLP4BocGiJpfJdhfiSTa6JnzpvkrFqlCPxP6qTkq1pPdDNO9cN51bJwDlQxwb2AeszTg9eQrEZxOYURdbaFPrW+QZEyZYdYHnWLPvpe1SiVkli+hZ1t4djFVK7x6mtvgT1e35OLr3VSXhxxGkux+y7FWuOyzloMGaFRHHFgrZ7sfmsjwkrGF73uPtJDs+z6ZfDwlLEJdpfFh3+cA2A/ztDXiU7nGTJFHQ019wAArdItNIDThDGcA/5JzOgTZtlQFLaBMuLH3V7uNFrq9tFxGBMTjm93isDYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58vN6oI0dBOsyATx96d4XdS/VcwzzoPTkvatM7cUWXY=;
 b=T+nL3Sa2eQbsSkFl7OI2s5IXhCOjWrCJilvfUFL5dxDzeX+D8nstxetaVvZTAyXaXRVuojYTQtOIImnYULTGLniysFqGuwYMRCDuHZTrviF4GL1180z6QbDZRmAcs9J/+4lKAabPV7syVpXGKZHcJSuwySsT5dSGVxTuVR3iOwXudD7IF5Jyj1PR1dt7vRms9FqbUPdtAC0bflx9CYjCGXsqAZ780MNiPiAtV1wQ4GGMiRI9eZlvdpPv6bAnVCIzM0bEE4l/YU3ieVhIgv1x7qV4eb6Ljz3u7S+CyAVtlmSPXZ8CPyoCmSNtfk//6BLVr2b6Tsmz+lBJbGMPEVdulw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58vN6oI0dBOsyATx96d4XdS/VcwzzoPTkvatM7cUWXY=;
 b=NtrXZ41zfhsrvHTfrICM2wW4a7mvePnTzpg8TspFd6GIaCUBjm00NHgWsKuMlEwz9fNttAD5F9PKBzYJ2RAXdMJ2acCHOzxJNNddtlGL9ozR70/iskZgYD4NNvxpCSrqfoLZfhHI0GKNjq0KuHJkp9k6f2CESYL/sRn7LLnpC8I=
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com (2603:1096:820:1a::22)
 by SEZPR03MB6641.apcprd03.prod.outlook.com (2603:1096:101:79::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Thu, 4 May
 2023 07:53:33 +0000
Received: from KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::7050:a778:5abe:27d2]) by KL1PR03MB5062.apcprd03.prod.outlook.com
 ([fe80::7050:a778:5abe:27d2%4]) with mapi id 15.20.6340.032; Thu, 4 May 2023
 07:53:33 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "trix@redhat.com" <trix@redhat.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "kishon@kernel.org"
 <kishon@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
Thread-Topic: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
Thread-Index: AQHZfQV81URy17qdI0C9ImDknEnuhq9JwP8A
Date: Thu, 4 May 2023 07:53:33 +0000
Message-ID: <f48580115b4fddf07a1dfabaf240a17d8d712ce9.camel@mediatek.com>
References: <20230502145005.2927101-1-trix@redhat.com>
In-Reply-To: <20230502145005.2927101-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5062:EE_|SEZPR03MB6641:EE_
x-ms-office365-filtering-correlation-id: 3a974396-5479-498c-66b3-08db4c74a8bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zY5JZdKndaysoeo1nrrxkN+IEu2A5+Yht85tW8k8013JaVJE2zU/slsr5z3/cK8kUXUZMyshuWutDpyiMweVTTda6yIiV2C4JAG1RhhXQptQKiUecC2ZCp1srpxaC1oXi7WjWmJ2NeHlkLveDknysQKOEnjR7Sa6V2ELaN1w82Sd53Cf80oBC+hHd/Qcz2UVbcwDslsykOyh/w22GDhYjNE3zMqB5OfEgW5WDDG2O7htEzLI7H5m7ydn3xuGxrtx0oFmepKhdp5n0bmGKEm00Ec5tCH3RotG2RitURZzRYNkzsjU/bWbC3WRy+qnztNGVBI7HHNo3F0NG4bl6C+ZBYN0z5rDNu5FfieysH871ls8NF4Dm+ExZWDOblpImS3lmuXmhp9BIe1Ywdq5gxRNSwyTY1955bunYysnvxOwQzZdrZ8q21B1Id5eM+acyGollXDjqT54pv/M4uVv+LAyzu4AKuwM3dXUd7Q2jtvmf72rqrTfzOMIk5Mic4G3Iaf+A0/vfxySwwApT3PFciDkAGqpxXPjoVudDXYyUE9TdHR1Tecw6yCJTTdKkYgDB7GoA9q5mSYC139lOu7KWdSFCOVXFe7Zx5/NM2pXukjry3hZ17vlVL75U3c/YbNTszmuVD7RuPrM+BPWVKB4BH5lVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(316002)(2906002)(186003)(41300700001)(66446008)(26005)(6512007)(54906003)(2616005)(110136005)(71200400001)(86362001)(85182001)(6486002)(91956017)(6506007)(4326008)(64756008)(83380400001)(66476007)(76116006)(66556008)(66946007)(38070700005)(36756003)(478600001)(38100700002)(8676002)(8936002)(5660300002)(122000001)(7416002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STdrbGtTZkJERFhRQlBqTVpzTzdKMmtlSzZyUHErOThDcFFKcWh1UTk2dUZN?=
 =?utf-8?B?TjA5QVpuMjAzUlBhR2RkTWZpd1J5TFI3K3JGNStBejlvRVNOT2NFT3VHWmRM?=
 =?utf-8?B?cUVSQTBXdTEvNUFGVXducE5COUxENGpDbjZYYXdCV0Erd1A2elhPR1VYcis1?=
 =?utf-8?B?emZBUGFmSWlZYlF5d0pGYk8zclNaYTZNSndvZzZ3K2RjWWVrLzBxWVRaSFJh?=
 =?utf-8?B?K3F6eGlBWktFcjlmWTU0YmtYQTRqM0xLZVJzOFVlaDRIaEcrVTYzTDFxWm5v?=
 =?utf-8?B?TjErWUsrUlp4Q292QkNWQ3JVMTVYanVoUngrSThYdk16dDE3MGRiS3pNVExO?=
 =?utf-8?B?Z2hBOG5SSkdHTXB4S2dhNTFpbmlseFhlY0hrQit5S0lRRDRVUDUrdDY2RlZ6?=
 =?utf-8?B?N21pL3ZyTWxkOElxeGhEc1pYTDEzNHNXVENNemxLS1dqbjNZTHFmMnVsYUxG?=
 =?utf-8?B?K2E5ZmZtcGUxS2ljK2FzUWNTQWRnREdudU1rL3ZVVFFucnI4K1dLRHZHSXRK?=
 =?utf-8?B?cVdFemRmSDkzSHlxaGRua1hXVkdSSDd0Um0vTE40T2lnYzN6MlpBTU9kRTlL?=
 =?utf-8?B?ZkY3a3B0UVFrUENjODkzUzhwUmZIN210NVMzbDUrbFdXaUxscVFmdzV3dldz?=
 =?utf-8?B?aVdpRXVKREYxU2txVkdFWXd5Wld2VGdmVXhVTmdIWURINWNQWEhPakxrd0Jq?=
 =?utf-8?B?WVdIeHlYZUxFTkFuSHdyTklmNlZVZ0ROcXJmTXpSdFlweHdoZFpXREd3NUJu?=
 =?utf-8?B?Z2M5OHZVdnNuemtoUDArQjJkRnhzMWpCVUlFdGNSRHFUK284QVNKK0VNcjZF?=
 =?utf-8?B?akU1NXBSVHc1aDJVeldDNmdiTlpoZjEzeU95ZHZzN2tPckY3b0N2Q3E1d2h2?=
 =?utf-8?B?eHJNSnhpNU9GU3dLTi81OUxPT1RsT05Ed1Z6alZCYWNpVGs3YngwaUVRODZZ?=
 =?utf-8?B?aUlrNW9JeDcxTnBmY1hxNGM5WTh4NHpvV0NTclNKU3k1dGlkdGJtTkZGMnJi?=
 =?utf-8?B?WTlUeWtJQmFsLzRBcllwOWhBeW9zOER1djZMUVlVZENCc2N3NkFEWWZsR1Ix?=
 =?utf-8?B?TWtFRUx2MjlrQTNEZ3JvYUp2VkUrandJYzBlZTduMkVROVMvVkJpVDVtdzJ2?=
 =?utf-8?B?L0NWb3BFMWpYN0tTM0JEN1AwdFZYcTNFaXZvYm1OK1g1KzFTKzljdDFuajdW?=
 =?utf-8?B?dklKNmxGeE9VaGhueWM1aUlIcy9SWUc1Q1dqZE82QzZqNnVOejVxNDUybWNR?=
 =?utf-8?B?MG0zR1JLY3VzTzVUc3Y3aG00M2htc3ZVZkxtby9KQnF4ZVNrd0JnbzFNeWpE?=
 =?utf-8?B?T2dCUmFtaE5SamdmeUtRZWdNODc4UHJFMVlVcE1DRFJHUTRwM1R5cVM0a1ps?=
 =?utf-8?B?SUJ2SGhSUEJXa0FidEovZ1R0MWcwYS9Gcnk4dmorNHljeFRPTUZpeGFocGtl?=
 =?utf-8?B?NmRUblppSWc3L2g0WjV1WXdEWXdZalFtYTFNY2c1MCtZdk1VeDIwRTI3QUtu?=
 =?utf-8?B?aVdueHk0dTI2N2FzMW5hMEdILzNNaGExQ01YZ0R0SlZsdEFOeGM5NDJqS0o0?=
 =?utf-8?B?bll1bmlpMWl6V3JXd3hDWWp5enhPelgwNFpnRDdpdGdaNmdTTGluaVkyU0FR?=
 =?utf-8?B?MkNBS1hmQm5iRVZyYUFsaXhLazFXWTg3a3QwQU04RlVFZmZpeWdXdW1NNnFF?=
 =?utf-8?B?bEpidW5pcGRHa1doMHNYQWlsb2dWUWpxVmtIWnZZWVlUUmozMDljZVlzS3Zt?=
 =?utf-8?B?MFdMZnhJbjNqTlVwczZPaXpVZmVRNGNIS0xzSHBpTzZjMS9xMVdrTXBVUVlG?=
 =?utf-8?B?aS9SM0libm1aUHlsZVpVZzJHRU9ENFBBdlNVYWoyRi83VzVTcENyMXF0S21x?=
 =?utf-8?B?Qkd4dTJ5V3QxMk1CRGtCL2taamJUKzZaQ0x5SWt4NG9IVnJxTHkwNDNMd1Jp?=
 =?utf-8?B?VmZaVllBc2sxTWtWeWowUWw0S0ZURFZXV0cwNlM1RmUxMXJhM0wvRkF4V3Yx?=
 =?utf-8?B?VGRoeGIxSTBaeCt6MnQycmpVK2Y0MkhaKzJXaGhVRWIvbERlbmlabGM1bGZQ?=
 =?utf-8?B?MlpHSUZidFp1Y3gzeVp2b3ErbWcvdkE1cmJ4ekxZRVE0NVZ2Mk9nVWJiTmZw?=
 =?utf-8?B?MUxaVmg5M3pVRUNTb3FZeDVQbkJBNkdTNjZOazd5TFdRL0l5SmVYQTVXaERO?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <791E789FB3FFC34AAB3BE6112EFAA756@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a974396-5479-498c-66b3-08db4c74a8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 07:53:33.3534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1yAzjxGhg5qkw4XlJ3NknPImtNHizP5je6u+CWEXjSEpvevMe7KU5dgB7rIqJRfPHQfYFTyHwGdIymwMqneN0v2gU5xob/n9VgRzr78QlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6641
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
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA1LTAyIGF0IDEwOjUwIC0wNDAwLCBUb20gUml4IHdyb3RlOg0KPiBFeHRl
cm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0K
PiANCj4gDQo+IGdjYyBvbiBhYXJjaDY0IHJlcG9ydHMNCj4gZHJpdmVycy9waHkvbWVkaWF0ZWsv
cGh5LW10ay1oZG1pLW10ODE5NS5jOiBJbiBmdW5jdGlvbg0KPiDigJhtdGtfaGRtaV9wbGxfc2V0
X3JhdGXigJk6DQo+IGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDgxOTUuYzoy
NDA6NTI6IGVycm9yOiDigJgtbWdlbmVyYWwtDQo+IHJlZ3Mtb25seeKAmQ0KPiAgIGlzIGluY29t
cGF0aWJsZSB3aXRoIHRoZSB1c2Ugb2YgZmxvYXRpbmctcG9pbnQgdHlwZXMNCj4gICAyNDAgfCAg
ICAgICAgIGVsc2UgaWYgKHRtZHNfY2xrID49IDU0ICogTUVHQSAmJiB0bWRzX2NsayA8IDE0OC4z
NSAqDQo+IE1FR0EpDQo+IA0KPiBGbG9hdGluZyBwb2ludCBzaG91bGQgbm90IGJlIHVzZWQsIHNv
IHJld29yayB0aGUgZmxvYXRpbmcgcG9pbnQNCj4gY29tcGFyaXNvbnMNCj4gdG8gZml4ZWQgcG9p
bnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUb20gUml4IDx0cml4QHJlZGhhdC5jb20+DQo+IC0t
LQ0KPiB2Mjogc2lsZW5jZSByb2JvdCBieSBjYXN0aW5nIHR5cGVzIHRvIHU2NA0KPiANCj4gLS0t
DQo+IGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDgxOTUuYyB8IDEwICsrKysr
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10
ODE5NS5jDQo+IGIvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10ODE5NS5jDQo+
IGluZGV4IGFiZmMwNzdmYjBhOC4uMDkzYzRkMWRhNTU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWktbXQ4MTk1LmMNCj4gKysrIGIvZHJpdmVycy9waHkv
bWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10ODE5NS5jDQo+IEBAIC0yMzcsMTEgKzIzNywxMSBAQCBz
dGF0aWMgaW50IG10a19oZG1pX3BsbF9jYWxjKHN0cnVjdA0KPiBtdGtfaGRtaV9waHkgKmhkbWlf
cGh5LCBzdHJ1Y3QgY2xrX2h3ICpodywNCj4gICAgICAgICAgKi8NCj4gICAgICAgICBpZiAodG1k
c19jbGsgPCA1NCAqIE1FR0EpDQo+ICAgICAgICAgICAgICAgICB0eHBvc2RpdiA9IDg7DQo+IC0g
ICAgICAgZWxzZSBpZiAodG1kc19jbGsgPj0gNTQgKiBNRUdBICYmIHRtZHNfY2xrIDwgMTQ4LjM1
ICogTUVHQSkNCj4gKyAgICAgICBlbHNlIGlmICh0bWRzX2NsayA+PSA1NCAqIE1FR0EgJiYgKHRt
ZHNfY2xrICogMTAwKSA8IDE0ODM1ICoNCj4gTUVHQSkNCj4gICAgICAgICAgICAgICAgIHR4cG9z
ZGl2ID0gNDsNCj4gLSAgICAgICBlbHNlIGlmICh0bWRzX2NsayA+PSAxNDguMzUgKiBNRUdBICYm
IHRtZHNfY2xrIDwgMjk2LjcgKg0KPiBNRUdBKQ0KPiArICAgICAgIGVsc2UgaWYgKCh0bWRzX2Ns
ayAqIDEwMCkgPj0gMTQ4MzUgKiBNRUdBICYmICh0bWRzX2NsayAqIDEwKQ0KPiA8IDI5NjcgKiBN
RUdBKQ0KPiAgICAgICAgICAgICAgICAgdHhwb3NkaXYgPSAyOw0KPiAtICAgICAgIGVsc2UgaWYg
KHRtZHNfY2xrID49IDI5Ni43ICogTUVHQSAmJiB0bWRzX2NsayA8PSA1OTQgKiBNRUdBKQ0KPiAr
ICAgICAgIGVsc2UgaWYgKCh0bWRzX2NsayAqIDEwKSA+PSAyOTY3ICogTUVHQSAmJiB0bWRzX2Ns
ayA8PSA1OTQgKg0KPiBNRUdBKQ0KPiAgICAgICAgICAgICAgICAgdHhwb3NkaXYgPSAxOw0KPiAg
ICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiBAQCAtMzI4
LDEyICszMjgsMTIgQEAgc3RhdGljIGludCBtdGtfaGRtaV9wbGxfZHJ2X3NldHRpbmcoc3RydWN0
DQo+IGNsa19odyAqaHcpDQo+ICAgICAgICAgICAgICAgICBjbGtfY2hhbm5lbF9iaWFzID0gMHgz
NDsgLyogMjBtQSAqLw0KPiAgICAgICAgICAgICAgICAgaW1wZWRhbmNlX2VuID0gMHhmOw0KPiAg
ICAgICAgICAgICAgICAgaW1wZWRhbmNlID0gMHgzNjsgLyogMTAwb2htICovDQo+IC0gICAgICAg
fSBlbHNlIGlmIChwaXhlbF9jbGsgPj0gNzQuMTc1ICogTUVHQSAmJiBwaXhlbF9jbGsgPD0gMzAw
ICoNCj4gTUVHQSkgew0KPiArICAgICAgIH0gZWxzZSBpZiAoKCh1NjQpcGl4ZWxfY2xrICogMTAw
MCkgPj0gNzQxNzUgKiBNRUdBICYmDQo+IHBpeGVsX2NsayA8PSAzMDAgKiBNRUdBKSB7DQo+ICAg
ICAgICAgICAgICAgICBkYXRhX2NoYW5uZWxfYmlhcyA9IDB4MzQ7IC8qIDIwbUEgKi8NCj4gICAg
ICAgICAgICAgICAgIGNsa19jaGFubmVsX2JpYXMgPSAweDJjOyAvKiAxNm1BICovDQo+ICAgICAg
ICAgICAgICAgICBpbXBlZGFuY2VfZW4gPSAweGY7DQo+ICAgICAgICAgICAgICAgICBpbXBlZGFu
Y2UgPSAweDM2OyAvKiAxMDBvaG0gKi8NCj4gLSAgICAgICB9IGVsc2UgaWYgKHBpeGVsX2NsayA+
PSAyNyAqIE1FR0EgJiYgcGl4ZWxfY2xrIDwgNzQuMTc1ICoNCj4gTUVHQSkgew0KPiArICAgICAg
IH0gZWxzZSBpZiAocGl4ZWxfY2xrID49IDI3ICogTUVHQSAmJiAoKHU2NClwaXhlbF9jbGsgKiAx
MDAwKQ0KPiA8IDc0MTc1ICogTUVHQSkgew0KPiAgICAgICAgICAgICAgICAgZGF0YV9jaGFubmVs
X2JpYXMgPSAweDE0OyAvKiAxMG1BICovDQo+ICAgICAgICAgICAgICAgICBjbGtfY2hhbm5lbF9i
aWFzID0gMHgxNDsgLyogMTBtQSAqLw0KPiAgICAgICAgICAgICAgICAgaW1wZWRhbmNlX2VuID0g
MHgwOw0KPiAtLQ0KPiAyLjI3LjANCg0KUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZl
bmcueXVuQG1lZGlhdGVrLmNvbT4NCg0KVGhhbmtzDQo+IA0K
