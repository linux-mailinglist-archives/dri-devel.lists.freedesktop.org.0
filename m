Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C67ACF95
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 07:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7E310E055;
	Mon, 25 Sep 2023 05:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D3910E055
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:48:32 +0000 (UTC)
X-UUID: 25d2f8ac5b6711ee8051498923ad61e6-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mEWmJMBJvJVq3pJ/f5+WETW1WPOiVQnkif1luxCBWpo=; 
 b=rnE2deBBN7wb9QzmjWo+z0lYDCvl6i8pbMQ7CzPq+MihJA/+1fMsmRoCJzzNayIt1PgxZb/xBBz3dK8/g+YTwOwC3vqNmSdjDiYBzUFTRLac6MZydCBwnW+r4t0yEMNS5joZrVGpaEBcgjdJ3+pMWlGY7UcXFYMhgBOrVQ+SOCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:1487b2fe-62e9-40fc-8037-c237608d7ca2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:022d6cc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 25d2f8ac5b6711ee8051498923ad61e6-20230925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1114664246; Mon, 25 Sep 2023 13:48:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 13:48:25 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 13:48:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8C0tWTysxO8qMiGrcLNgomQgtWuSeVRscQa1FPLVIIFtfkcpbo2BVuVcT3oda83sJPHRh8f0mr+z1lfqsVep6YIbuFalABwa/7JysZad7l4Xsf7ZvkMSF3SbfUO1y+AJP9wOuU9Hp/vmFzTvlicE8EfDVsdz4cpPq0r09hdIGaahpUlZJbiIINkvS5Z1Cqc0MNMeyl5NK3mRR0ECHdDUeQHGtVOXyFVnMY0yBJqVkTgwQbULTl2JeB9+E8QgYDSEeVte99WJF5r3Pxnu6AvkHUnladas095sE+uYntOVG8pF8C90UCu0qN+WldRhRGf7BeRQNNN9olLboCWAin9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lkOo4iawjzBGi4HpV3f1HEM0KebWgZOKvz6tHMcyEs=;
 b=lMwStTQqS09J/G3LBDaxWjp6YSefv5Po24GY9BmW5+icSa+2+1Ip2VFBeLgfrf5pfd+DsGemphZwqxX7ys2DC35EVCTKNFJ73+Y11GcWR2XGnenvcV4yJYzRTvrGDExdwNLIa9oVS9HmisJVGE2BmwPwlDW5PyVQ5wa8+mcI0AocxGU2J7rs1cxair5c/mvOqG8RsGPb47kMcIU4Wobf4t+wGc5V0CNvDrOpG/yAAT/H6tpd59nxz4gkCUtcBWAmB079Hev7gYotoEVCPnM71RM+gmYJLuVAsnRwdpuPfGF6ZDUtlx2sJwJBGrdP494ydvpbKJeeT2BIvsMdeu3ajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lkOo4iawjzBGi4HpV3f1HEM0KebWgZOKvz6tHMcyEs=;
 b=M78CxpIWFyHOewSrMFSTJMhqGeu0yaHE+UtdHSQXswTHcc3mPB3pk4Yf+5AnweLm1BYo6Aj+RNpE7x1EHjd8P+StN4nnCBCyLYyHhsi1+6hzxkBTDIeJxhBsbEUaKwIHjd5Ij8Eym75Z4EMXyPw+b5A/8TZkah1G5WnbqFzXN20=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB5788.apcprd03.prod.outlook.com (2603:1096:4:158::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 05:48:23 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 05:48:22 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 14/15] mailbox: mediatek: Add mt8195 support for CMDQ
 secure driver
Thread-Topic: [PATCH 14/15] mailbox: mediatek: Add mt8195 support for CMDQ
 secure driver
Thread-Index: AQHZ6mWFwHNDC9eh6UWvh8FuBMsvqbAovTyAgAJVwYA=
Date: Mon, 25 Sep 2023 05:48:22 +0000
Message-ID: <3eb13240413f87faf6fa838cc6e8b27cf1deef2f.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-15-jason-jh.lin@mediatek.com>
 <a1dbb788-d2c8-c358-9f9e-54ca664dc6df@linaro.org>
In-Reply-To: <a1dbb788-d2c8-c358-9f9e-54ca664dc6df@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB5788:EE_
x-ms-office365-filtering-correlation-id: d18d1671-a400-45f8-28e6-08dbbd8b0773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t62eqHKLVkAl4b9NFbJQk/0f/mco2PpdRhL41l3lWo1liw59zSRzHSFTzW4N6+M4tqQqQ6C9RySUMjqTLoj7ZkqYqmR9y+JCqWRKRxUoQG7ZeNWAbVfqKmqNURsowGqhV2jNBLvLi3NlJGFZ3ptktXkPruoL9GzHMFV8zM0n1jECeKk2V04HNqv/erPWgbgbhQ07YH6P3nOItce2vAc5oaz4R0wdlMdHDmGvxujWi4YW4TL7zydUfuAUlbAnUrEcpthlNnZ3k5wW+m9QmEmwoGuoz/IFYBTTupM9AfP0uzdyWottctUjkcH41mbI6cZi+wk23bBwRTQ083n+TRb1hm+zNg+GYBteQe8L9xvtoehGnJf1ba8zuCEb5cRYgG8AjFGxpAJB5pDecIdsAcXJ4QY6m6GjrrRQxBiN9FlEPb546v1HmdHGk6PasWX2Cr0BWmWzHQj8NOCZzENi4+iMXKzy1OqzlUTj9krSZjm2Pl+daZ+GazZAf2uHgU20OrV5/6FvJY+7qGrkLQtoHkVcvBx+if+dT5QfA2Jl/f51L/P3cglLeHYjbTtug0VQVO5BAcssVVlxW5DVj6r5OAVcINYo75a/apj6kmu9dNd+5SCvnH02UygQ56TRDhepr6czO4V13HlkcByMOZwbIzHCM06UlLe81VuQKGMiCsrt1aY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(107886003)(26005)(8936002)(8676002)(4326008)(478600001)(66476007)(41300700001)(66446008)(64756008)(54906003)(66946007)(110136005)(91956017)(66556008)(76116006)(316002)(5660300002)(15650500001)(6512007)(53546011)(2616005)(2906002)(7416002)(6486002)(6506007)(71200400001)(85182001)(36756003)(38070700005)(38100700002)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnVITWxRanBJc1VZWEN2WWdmL1pvUk83c3o3S3B2eGhicWFtck1LcU1RazFM?=
 =?utf-8?B?Ym1MVVp5YmRaQWFWdHNFTHdyK05SL3NxeW85eEg1TFZLWVMycXEwS2ROMzFy?=
 =?utf-8?B?TzdMN3N2Nm1xR1BTUC83cjBZR0ZrRS9pSklSS2NVWVZxbzZGa0E2MHR4UEFX?=
 =?utf-8?B?OHY3d2VQajcxbHZxUGJVdXpjYmw4RHlGeHJ2Zis1dUQ4TjkyZDVBQ3pXYVMx?=
 =?utf-8?B?eHo2NmdPaDFhd21xRTRMQU5hcWs1dC8wd0lkemllRklLMldQeURLWk5WNHpS?=
 =?utf-8?B?SHl1V2pmQUJXamtQdXg0ZTdNRDhueHBxbW5iMjlodzJEVWFVTDVaUWt5OFFZ?=
 =?utf-8?B?bjJvempSNTlTaVRtRm9SK1Y1OEhmMzVCRjJxUStaNEhseHFRQmFUZFNlTTZD?=
 =?utf-8?B?L0VCN0ZibG0zWnZhVGpzQ0N4MlM2cXNFNDdGRkJlZXJoRndKd3lmZGNxSXpS?=
 =?utf-8?B?cDJBcUMxNnVXVTltYUQvZjlSUExmYlprcVk0ZnMvbE5wbDlXWVJqbW03bDFw?=
 =?utf-8?B?UEgvMzNTVnptMkFjQi93azNXb0VsbjlqV0hvdENUazg1OTNTeUtpTlVjVkVU?=
 =?utf-8?B?b3g5OHYxOU8rVW94OTNPVTE4cUlZeEFsZXhXSXpnd2hHMVQ4bHoxTGVqNlRm?=
 =?utf-8?B?YnVTRkZqSERwRHNNMUQvVGRESThwdmxvMXVRNHduRGFoaWc5YUlhS3VIRTVr?=
 =?utf-8?B?aFkxc0pLZTI2ekxtQ3B5azc0MnNleG9lbSt4UTlNWHEyTWxtUGZVQ3Q3eXRw?=
 =?utf-8?B?MzhYUW9oZExxdkFET3R3eDBVckJLZmQ0eldBb0t5ZGYyL3Q5aS8wY0hZeXFu?=
 =?utf-8?B?QlhEalZ0WllmbFgrSG1CQnVtQm9GSy9ZOHoxSk01dzE1eXpNNzNjd08wTzJX?=
 =?utf-8?B?MGFmRFdraXBDMWtPbVZRblkxc3A0MjE2NStnTUlya3o2TENyZ0VDSzEvUE5F?=
 =?utf-8?B?TjVUUHJiMnNVMFZ0T0Z1Wm5Ec1NpSmVWcjl1QmZPRWh3cHF0d3FPSHFvbGxW?=
 =?utf-8?B?WVNHMWJMWVRySWhEMVFTVG15dWNtaVI3dzZIcmE5WFhxUm1sU3NRQ3pidk9u?=
 =?utf-8?B?VU5TdEkzSFdsR2N5ZlF5ZkNmZXhKOG5UdnpBdVQyaHJGM2IzTkJJWG5lMUxJ?=
 =?utf-8?B?VWh6K2lLL0JnVWRUeUduWnFhQ1dpV0NQcUpKNGRIbU9WbDJEdEJleDhwMlpG?=
 =?utf-8?B?M1FvWWVHa2FVaUROamxHbkZYU1cyVzcyckI2VjJnQmpuanNqb3lsOEF0V1or?=
 =?utf-8?B?WnJQTHo5ZXhodmxUQXovdzMyYTlnejNYMXhDNkc5YUMzd2RielE4MjhUUFVu?=
 =?utf-8?B?dnJ4RUhzWXVIRGdzSmgzaElJZk11UFhUdENiUXMxSm5uQW9MVnh3TWpyYXdv?=
 =?utf-8?B?aXRNdDZ2UW1rMm0xMnRhamw4SFMwNWIzOU5PR3BzQnNXUHlKTlVNeVdXcTlO?=
 =?utf-8?B?WGpINDRpd20rdUU2RnFxMHlmYVVHUVppczFadFNkYmh3djd1WFhad0JZbDJC?=
 =?utf-8?B?SWcyR3ZFcktVNUVMS002djRqZ0NITFVDSzVpd3pIUWJhTGNRWmJzTEpzZ3pS?=
 =?utf-8?B?WXk3QVRDRDhQU0luYzhGUHpkTWg1QzRtQWEyQlJWYXdQU0FaUWNyLyttUnNj?=
 =?utf-8?B?UjNXeWd5S0p4OEdzR2V1bmhEakhhK2VDNktWVXZvU256bUZZK3pGL0E4QytP?=
 =?utf-8?B?a3ZsbGZiR3JiamJEZ0JtWGRNdVpQdDYzOERIb2JvRWxYZGYzaTYxVThsQmRP?=
 =?utf-8?B?SlJnYmMrT2trYnlBdG1NS1pEbjdrblBSUjFGdVZzNFI5dGY4TTJTY2FOMTJ6?=
 =?utf-8?B?dkhjbmNnMnNuMHNKWW9XRmRSODlHSzUyWVd5WDBFbDdVaVNqalFseiswNnR1?=
 =?utf-8?B?QTllSDVDWmJKSU9XVUVFcDZHSEJTUEl2ODZYTjFPYURFV0docWREZzQrZUdT?=
 =?utf-8?B?RVg1bTFsR2lkQ2d1OU1lRUwxb2htLzluVVI5VWovWUM0K29CK1oyc2o5SGc2?=
 =?utf-8?B?ZkJweDF5Qjk2Qk13Q29nVjBnSTZYNjl2T3pVY1VYbVhhdWRlaStYdGZBNEJs?=
 =?utf-8?B?YklOQXJyUzRnTmxzSkdDZ3orMmQ0REJxU1Rna21XZUFEd0l5UlZJNlMybnl0?=
 =?utf-8?B?Y1V5RFlrcitUVHcvaDVnWmozZ3ozMWlNTHBQQUNxMDUzWVZFcGdtWDFJNUdV?=
 =?utf-8?B?Znc9PQ==?=
Content-ID: <201BC54986F2BE40B7FE8323BCF12A29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18d1671-a400-45f8-28e6-08dbbd8b0773
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 05:48:22.6106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dv5ODhQbhfAMBuI+jcxMTk5ubMNsN1Cosq9UqI1py9dFaoi3f4vikTUdwGObQ2v7oH1uwrob/dRjY0eMvnVxvK1dIQlXfG0saHGR9YpL3Xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5788
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.165800-8.000000
X-TMASE-MatchedRID: nVQUmLJJeyanykMun0J1wmjZ8q/Oc1nAjLOy13Cgb4/n0eNPmPPe5KWz
 WoIRiV9DM/Se/q/gEyf5MiS7M8c1eGmXMi7Ntyo2mlaAItiONP0xmbT6wQT2a/dsGrGaOKdNGU3
 GI9BKWeeCOaywoSyAEgG2ORx9Eyap1RbX+21X57MVglQa/gMvfD2Zm52NqgyJmyiLZetSf8n5kv
 mj69FXvEl4W8WVUOR/joczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.165800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EE3ADECD1BC9E329840118D0409AE03854D97FF17A5FEB242CC4325955F448992000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1928887247.300263026"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1928887247.300263026
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtLcnp5c3p0b2YsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlld3MuDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6MDgmIzMy
OyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2Um
IzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0
dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsm
IzMyO09uJiMzMjsxOC8wOS8yMDIzJiMzMjsyMToyMiwmIzMyO0phc29uLUpILkxpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO210ODE5NSYjMzI7c3VwcG9ydCYjMzI7Zm9y
JiMzMjtDTURRJiMzMjtzZWN1cmUmIzMyO2RyaXZlci4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SG93
JiMzMjtpcyYjMzI7aXQmIzMyO2FueWhvdyYjMzI7cmVsYXRlZCYjMzI7dG8mIzMyO3lvdXImIzMy
O3BhdGNoJiMzMjtjb250ZW50JiM2MzsNCg0KVGhpcyYjMzI7cGF0aCYjMzI7aXMmIzMyO2RlcGVu
ZGVudCYjMzI7b24mIzMyO2NtZHFfcHJvYmUoKSYjMzI7aW4mIzMyO1tQQVRDSCYjMzI7OS8xNV0u
DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWdu
ZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVr
LmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtk
cml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jJiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNl
cnRpb24oKykNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KJmd0OyYjMzI7
Yi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtp
bmRleCYjMzI7NGUwNDdkYzkxNmI5Li5kMjdkMDMzYzU4N2QmIzMyOzEwMDY0NA0KJmd0OyYjMzI7
Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCiZn
dDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJv
eC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTczNSw2JiMzMjsrNzM1LDcmIzMyO0BAJiMz
MjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO2djZV9wbGF0JiMzMjtnY2VfcGxhdF92
NiYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsudGhyZWFkX25yJiMzMjs9JiMz
MjsyNCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7LnNoaWZ0JiMzMjs9JiMzMjszLA0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsuY29udHJvbF9ieV9zdyYjMzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMy
OyZndDsmIzMyOysuaGFzX3NlYyYjMzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMyOw0KJmd0OyYjMzI7
UmVhbGx5LCYjMzI7aG93JiM2MzsNCg0KV2l0aGluJiMzMjt0aGlzJiMzMjtmbGFnLCYjMzI7Y21k
cV9wcm9iZSgpJiMzMjt3aWxsJiMzMjtjYWxsDQpwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0
YSgpJiMzMjt0byYjMzI7c2V0dXAmIzMyO2EmIzMyO0NNRFEmIzMyO3NlY3VyZSYjMzI7ZHJpdmVy
Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7QmVzdCYj
MzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0K
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

--__=_Part_Boundary_002_1928887247.300263026
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBTYXQsIDIwMjMt
MDktMjMgYXQgMjA6MDggKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgT24gMTgvMDkvMjAyMyAyMToyMiwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IEFk
ZCBtdDgxOTUgc3VwcG9ydCBmb3IgQ01EUSBzZWN1cmUgZHJpdmVyLg0KPiANCj4gSG93IGlzIGl0
IGFueWhvdyByZWxhdGVkIHRvIHlvdXIgcGF0Y2ggY29udGVudD8NCg0KVGhpcyBwYXRoIGlzIGRl
cGVuZGVudCBvbiBjbWRxX3Byb2JlKCkgaW4gW1BBVENIIDkvMTVdLg0KDQo+IA0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDEgKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBiL2RyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBpbmRleCA0ZTA0N2RjOTE2YjkuLmQyN2QwMzNjNTg3
ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+
ID4gKysrIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+IEBAIC03MzUs
NiArNzM1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBnY2VfcGxhdCBnY2VfcGxhdF92NiA9IHsN
Cj4gPiAgLnRocmVhZF9uciA9IDI0LA0KPiA+ICAuc2hpZnQgPSAzLA0KPiA+ICAuY29udHJvbF9i
eV9zdyA9IHRydWUsDQo+ID4gKy5oYXNfc2VjID0gdHJ1ZSwNCj4gDQo+IFJlYWxseSwgaG93Pw0K
DQpXaXRoaW4gdGhpcyBmbGFnLCBjbWRxX3Byb2JlKCkgd2lsbCBjYWxsDQpwbGF0Zm9ybV9kZXZp
Y2VfcmVnaXN0ZXJfZGF0YSgpIHRvIHNldHVwIGEgQ01EUSBzZWN1cmUgZHJpdmVyLg0KDQpSZWdh
cmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+
IA0KPiANCg==

--__=_Part_Boundary_002_1928887247.300263026--

