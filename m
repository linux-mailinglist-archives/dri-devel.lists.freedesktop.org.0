Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694547ACF77
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 07:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECEB10E1E2;
	Mon, 25 Sep 2023 05:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E6D10E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:25:55 +0000 (UTC)
X-UUID: fd9b8f3c5b6311eea33bb35ae8d461a2-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4izzXtzjn3xF4hZIVWEGHHeYf/N7eBLJNY8dKXXu8Is=; 
 b=sZ9bwAgvJ66sm51RYkAAJqPdhGjS6tuM39qybYyea6BRH4IIR6UTU+LIzVab+HZiDjesFTiR/FTC2Dia20XUhjnqHoPoL48Jlv89YA9LBY+bf/NbG6Uk6gP1F5sJGJmIJmB6tMlfoRTnJU0U+hLhw9AnKAwh0V3EJIr8uCXpd04=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:a1304a13-66a5-489a-9ce9-6ac8a86fb0ab, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:b2ee6bc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fd9b8f3c5b6311eea33bb35ae8d461a2-20230925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1389233895; Mon, 25 Sep 2023 13:25:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 13:25:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 13:25:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5IBrIxj57M1gR/jQqWodX3JV2NA8icqTb9YhCVYojPw0zvxzAKYplJ8lfwVz4faO64+EdbH+02Ya5OR3fGBvRAkVcm8+5IARGHZtOBnG8Q80+FN8qBktcMFpu3yujFKM287C5d2Crk9pMeuZy4BX3ACunT+Xo7LFK7qPQio5JEsc2cGwRpukkM3a2ewtrUMLghFWsXgHUeNzU3ktkTZvzMwzKNMTgcNtTczNeivjUnSOOvJtTfA++Hj6mZawmrxiFCp/0/6ZEHsbXIW3qvxs48vcaDJahIvL0clM9p67MsOOrJyx/GlMNxOVzXl8++LXUxo9uWu3oM8D3T25dRsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTr3KaNL2fRMy0pAuIFzNDlbEN3GLG13s4g37YfyAgI=;
 b=ePzQdPso5v+ghUplFLpsusceS55FFb8f7TtVIszr8DA/Hp6OvatqESOn2XmcWWXdQLXjDPJCf+tYIBmRpFNjC8t1yLY+H848gGqZ1wspcOM+BeeO5+KR+NiM6MWRO0TqZV1ot6iNOIZYMyNHZ8NSyPTK+u4Oqb38I32ihHxXzuFVAMRQCPgJq5zeA43EVYKdaKUD+ZnHI29fYEDzAeHMiaCnFUIO1ax5GuBledpgOMCpcFIiUBowqsQbssjmOOtstcV6MXsX5INNI06SdyFmDmXG61AO3H22A7uXPr6LvjUDKco+p6afbJ7cSje5uV61NAoyUOhZhoSuyGinobpg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTr3KaNL2fRMy0pAuIFzNDlbEN3GLG13s4g37YfyAgI=;
 b=tW4Or+DWp6bTgtEEjRz7goJ26MKTbf40rs10qWAwIZEKzAO/25AsJkWsMkAXIlIv+HTVvppQoijKGW+pZUJpq4CFttSXyfk4FTUwkH/ndEGuC1BSCCf0d8umNy+bHd84gdoMsnVsnL7a6sWP85jk2dkOohsFngt23ffnOwXkBGc=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB5666.apcprd03.prod.outlook.com (2603:1096:820:7c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 05:25:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 05:25:46 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Thread-Topic: [PATCH 06/15] mailbox: mediatek: Add cmdq_mbox_stop to disable
 GCE thread
Thread-Index: AQHZ6mVzAB+DDXoZvUWdOhEu85xiW7AovLmAgAJP84A=
Date: Mon, 25 Sep 2023 05:25:46 +0000
Message-ID: <5b21cafedc1de59d358d1b2b7e5985f97cc78d1f.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-7-jason-jh.lin@mediatek.com>
 <84655695-52bf-a67f-e0f1-7ad46fe44e6e@linaro.org>
In-Reply-To: <84655695-52bf-a67f-e0f1-7ad46fe44e6e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB5666:EE_
x-ms-office365-filtering-correlation-id: 77489e0b-51c6-4e23-8fad-08dbbd87deef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C2c2dP7PLQWL+sw8u0/zOlx8sigtf1bgA+FnsoUI6yDPM9TXjf/Q6Xr2Ot4OaXR0TRIUhLdDnTeOikxMO5mnYa/44PHqidTEDdK3F5c5aZLyztf0qy1NXzxi16UsHnsgNVjIsMuKpdKG/7dt96vP5URyWMmFSCaPsy4k5td0ZyPpXQivnQZ7Fyk9FGTqPNq61i0NpW8QYuN/cyU0JvnWpEd7JVRD11rFqmROP0T5jc4zGqFuQoRNUNW8/FG97iO+DNspBB08TPs86RJn0XXAiBJTHEVHZQd/9DWQr6ZX9ZEeNov9xw6XRSh4YBowh/TZsbI8SmTFpItfz/DioMdooOkgP8OULQ7963Re5WAoq8hETZS+6B6xRNimA89mBQwwH6kYScuG4MBtz5Oe7K2zcAO6h6vVVxEqsjbNdw895ZN/V+ESqb5JBF/bzT4y04Hgv9eiK+qFGuF8DTF/DnCe826YAChUDqPVdPsqkq66SUrRhdtDYctSLKPYB0Bfmo14prELUwMzA6zLKEJejQHvRVI9reXEEWdLmKFU6d0rC0kvfmxv4P3PvcygR77GyUqaYbh/XGD17S6Ya8MCAhUOkvfH22VMnDWtdZbNGdNkm7X89B9beZrCKxYYfsHL5UzMi3Fc6095FmFqRxg/M3kC0XWJM/Ied6V3LFSmDiDBd7Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(316002)(41300700001)(107886003)(2616005)(6512007)(71200400001)(26005)(53546011)(6486002)(6506007)(83380400001)(85182001)(478600001)(36756003)(38070700005)(122000001)(38100700002)(86362001)(66556008)(64756008)(66446008)(91956017)(110136005)(54906003)(66476007)(66946007)(76116006)(15650500001)(7416002)(2906002)(8676002)(8936002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUIyUFNHekV1VG5WUkJsbkd1b3gybmYyMXRJcG9pZXJTRkZtRlJycDlxRDRC?=
 =?utf-8?B?U0VkREJFYWsvT0xVTHJHam5MVDZWbS9mbUVyaU1zVXhhRGh1Q2J5amFIZVQ5?=
 =?utf-8?B?VUF2NHNXMUdnL0tEUWdBSXEzSjVORmVPRXlKa20xSG16dEo3OFFiWnNoci92?=
 =?utf-8?B?bVFxMG9VVkxNcm8zbXdaRDd2cW1JNUtIeUtaWDZzRWtxYzFibzQybGRuRjQ3?=
 =?utf-8?B?Y2VNcXlRTkNIRXAvQ1NXN3JHcW02WFd4VVhrQTQ1KzN2ay9hVjEwblhpanp3?=
 =?utf-8?B?YWxsWmEzVWZPQ2JmV04yb3lUSmR3TG1kaUxoZWRPM1FVdGtzM1NtaXhmaTZh?=
 =?utf-8?B?M2x1VDRmZ2J6ckExZG8rWEJ2NWJUcFNRUjVIeFF3a2lLUWRvSU9oVkVQdzVq?=
 =?utf-8?B?bW1oZUlWK1Z4cGJNbjd6NWN5VTFaSTZSZzBqRVVxRk5kbU5nYU93RDRGRjJz?=
 =?utf-8?B?TlZJR2lGTSs2U0hXU0pNdjE0Mm5MSjhPQUcyZFBrb2c3U2pJMGw3RHFLYWlX?=
 =?utf-8?B?U1JudUkrWnVWeDhacVJTUU9NY0tCWnk0YXRLSUIxZVBSTDkxV2MxUE83WmpE?=
 =?utf-8?B?eUJjb1p2N2R2TFd4VFFFQXAvM3RlQ0FORnFiTFVPWUNuRHZVMDZnSkVQL0Zv?=
 =?utf-8?B?OG1CMThtYUNqbldvb3lUeTRPelVuTzBwdWZqcEJsUGNsWm5GbGJYMU1RVzhI?=
 =?utf-8?B?MUpLV2taWEd6TkdKRVJMc1RxUUJmUDN4Nm9BbnBtbHJFbEZPM0MydForNlhB?=
 =?utf-8?B?MU10ejR2dGFSYnBNb0dyZFRVRXB0T0xsNWNjOENmdHRTZzlCZ29Ldm5iSW04?=
 =?utf-8?B?SG8xODRzdXgwUEV2VEg2VVhLRW91L2ZBMW9iM3FlVkV4RGl4MnVzQVkzOTFz?=
 =?utf-8?B?aGovbDRBbUUxdmtQNm9QOEloaEhWQmd3WWsyZ2xRaWhyUGZiRndXK0VsUUhB?=
 =?utf-8?B?bWpja1BRbVd6dU5UY21FOE0ybVoxdElscXBFTXJ3RjZUU25HZDAyb2c0MzJS?=
 =?utf-8?B?NkVTdEZZNW5BSk16OW9RZkoyZVpXZ2FKdEg5Kzhpbkt0Qkk1Wmk4cXFoRG5Y?=
 =?utf-8?B?RlpjTjRCUXhaLzRya0JmT3dPVStUL0dVNS82S2thVkdxYS9nSmt5dFlvakE4?=
 =?utf-8?B?QnQvSGNra1pLaG12NHJ3eEJkRHN4eXhmZzJwUFlxK3FSRVdzcWFKb04yR1Y1?=
 =?utf-8?B?dmZ6ZEZlVGoza0xQVENLcnhyQWlkTVYzd3ZmK21MUVF4M3N5Y21rcm9wOVgw?=
 =?utf-8?B?SGYzaEhibHREeGU1WDRjRDNTdWdGWXdmcVY1em5KeHA3cG4zYmp3N0dkYW5q?=
 =?utf-8?B?MUVONjJuVjh3NDlrUWlyLzRaejRsNUVyZkFvaGVCZzBhRmNOS1VrNXF4emRt?=
 =?utf-8?B?d2lsdDl1c0VVUmo1L0RTNi9iM3JINy91bmRlQnN5b2Q2N3NobmJOb09qSklJ?=
 =?utf-8?B?TERtTnl1VExGUU5rQWg1M1pnckR2SEhKdU5YUTFXdC82OUFLU202VGxFdXh2?=
 =?utf-8?B?WFUvNm1zQldRSXprS1RoNStFVGNTcmNubGRVM0VtODFIa0VTM0tQd25BUnpF?=
 =?utf-8?B?K0RNU2dTYjdGbStJQUs2LzA0Nk5zWXJHSlBISlpMZFp1OHRQaVVXYjZCd2RG?=
 =?utf-8?B?YkMzZDdVWThZNm1ERlBFRmNZOVA4cVozaDZreTdoaUVSNkhJbEx2c3dNSE53?=
 =?utf-8?B?aDlWNENzSFlsT0JjQlVWekg0b2pQM1Z2OGoxM3JJUDIyWWZTZjZ5N3JJd3Az?=
 =?utf-8?B?elExTmxPc3I4RnRaUlVYYUZEVVNUeHNLUTVmWGdtdTB4enNJeE9TMzJpWnpC?=
 =?utf-8?B?UkQ2dG9MWEVTM2hVT0M1YXAzbU5JbXdyOGN0eHBSQlRQQjhmMTkyMWtPaEpn?=
 =?utf-8?B?eVFmMTRIbUwvV1VXVk4xeWhGSDZrSFl0cmlUZFh5ZkFSQ2tFT1dQR2libWhS?=
 =?utf-8?B?cXVVYjg2NlNlSFdsNkJjYnhHNm1ZMlhXbnBjdzJrYUZQUkh2QmNkUDdNOUk4?=
 =?utf-8?B?RVY1dFpBSVhCdDU0K3pFeVF1Qko2cDg3ckozdmMvTmpwT1Y4WXVOdythMDVV?=
 =?utf-8?B?SkRKUDRtdzJENGVmVFA0dEFPY24vWUxTMHlDOTZGT1VNSzUvZ1FlRkVZMEhr?=
 =?utf-8?B?cU9Pb0hPZVp4UzNiR1B2U2laMEIzci94MWhHMnNVaUsyeEFINlVuc0wwVmph?=
 =?utf-8?B?SFE9PQ==?=
Content-ID: <4877C2C7B497F748BB60033FCAB02FF3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77489e0b-51c6-4e23-8fad-08dbbd87deef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 05:25:46.1291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aaq7Plk6A2BbIys9QdywQJJF2f+qEMhzIO77E1DnrXu7Xid3mSuKly8RblyARN8qXXjYkdk+o4iEQ8octDHDIo+TLu8lSgctHOQxpBCZFCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5666
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_909086041.760718807"
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

--__=_Part_Boundary_009_909086041.760718807
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtLcnp5c3p0b2YsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlld3MuDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6MDcmIzMy
OyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2Um
IzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0
dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsm
IzMyO09uJiMzMjsxOC8wOS8yMDIzJiMzMjsyMToyMSwmIzMyO0phc29uLUpILkxpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO2NtZHFfbWJveF9zdG9wJiMzMjt0byYjMzI7
ZGlzYWJsZSYjMzI7R0NFJiMzMjt0aHJlYWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1RvJiMzMjtzdXBwb3J0JiMzMjt0aGUmIzMyO2Vycm9yJiMzMjtoYW5kbGluZyYj
MzI7b3ImIzMyO3RoZSYjMzI7c3RvcCYjMzI7ZmxvdyYjMzI7b2YmIzMyO3RoZSYjMzI7R0NFJiMz
Mjtsb29wcGluZw0KJmd0OyYjMzI7Jmd0OyYjMzI7dGhyZWFkLCYjMzI7bG9wcGluZyYjMzI7dGhy
ZWFkJiMzMjt1c2VyJiMzMjtjYW4mIzMyO2NhbGwmIzMyO2NtZHFfbWJveF9zdG9wJiMzMjt0byYj
MzI7ZGlzYWJsZSYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtHQ0UmIzMyO0hXJiMzMjt0aHJl
YWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0K
Jmd0OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O3wmIzMyOzYmIzMyOysrKysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtpbmNsdWRlL2xpbnV4
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oJiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYjMzI7NyYjMzI7aW5zZXJ0aW9u
cygrKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdp
dCYjMzI7YS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjtiL2Ry
aXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4
JiMzMjs0ZDYyYjA3YzE0MTEuLjhiZDM5ZmVjYmYwMCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjstLS0mIzMyO2EvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMN
CiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNDY5LDYmIzMyOys0NjksMTImIzMyO0BAJiMzMjtz
dGF0aWMmIzMyO3ZvaWQmIzMyO2NtZHFfbWJveF9zaHV0ZG93bihzdHJ1Y3QNCiZndDsmIzMyO21i
b3hfY2hhbiYjMzI7KmNoYW4pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3NwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmFtcDt0aHJlYWQtJmd0O2NoYW4tJmd0O2xvY2ssJiMzMjtmbGFncyk7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrdm9pZCYjMzI7Y21kcV9tYm94X3N0b3Aoc3RydWN0JiMzMjttYm94X2NoYW4mIzMy
OypjaGFuKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K3sNCiZndDsmIzMyOyZndDsmIzMyOytjbWRxX21i
b3hfc2h1dGRvd24oY2hhbik7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7K0VYUE9SVF9TWU1CT0woY21kcV9tYm94X3N0b3ApOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtQ
bHVzJiMzMjt0aGVyZSYjMzI7YXJlJiMzMjtubyYjMzI7dXNlcnMuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO05BSy4mIzMyO1RoaXMmIzMyO2lzJiMzMjtub3QmIzMyO2NvZGUmIzMyO3doaWNoJiMzMjtz
aG91bGQmIzMyO2JlJiMzMjtwb3N0ZWQmIzMyO3Vwc3RyZWFtLg0KJmd0OyYjMzI7DQpJdCYjMzk7
bGwmIzMyO2JlJiMzMjt1c2VkJiMzMjtpbiYjMzI7Y21kcV9zZWNfaXJxX25vdGlmeV9zdGFydCgp
JiMzMjthdCYjMzI7W1BBVENIJiMzMjsxMC8xNV0uDQpBZnRlciYjMzI7cmV2aWV3aW5nJiMzMjti
eSYjMzI7Q0ssJiMzMjtJJiMzMjt0aGluayYjMzI7SSYjMzk7bGwmIzMyO3RyeSYjMzI7dG8mIzMy
O2Ryb3AmIzMyO3RoaXMmIzMyO3BhdGNoLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZn
dDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMsDQomZ3Q7JiMzMjtLcnp5c3p0b2YNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_909086041.760718807
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBTYXQsIDIwMjMt
MDktMjMgYXQgMjA6MDcgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgT24gMTgvMDkvMjAyMyAyMToyMSwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IEFk
ZCBjbWRxX21ib3hfc3RvcCB0byBkaXNhYmxlIEdDRSB0aHJlYWQuDQo+ID4gDQo+ID4gVG8gc3Vw
cG9ydCB0aGUgZXJyb3IgaGFuZGxpbmcgb3IgdGhlIHN0b3AgZmxvdyBvZiB0aGUgR0NFIGxvb3Bw
aW5nDQo+ID4gdGhyZWFkLCBsb3BwaW5nIHRocmVhZCB1c2VyIGNhbiBjYWxsIGNtZHFfbWJveF9z
dG9wIHRvIGRpc2FibGUgdGhlDQo+ID4gR0NFIEhXIHRocmVhZC4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgICAgICAgfCA2ICsrKysr
Kw0KPiA+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHwgMSArDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gYi9kcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gaW5kZXggNGQ2MmIwN2MxNDExLi44YmQzOWZlY2Jm
MDAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0K
PiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBAQCAtNDY5
LDYgKzQ2OSwxMiBAQCBzdGF0aWMgdm9pZCBjbWRxX21ib3hfc2h1dGRvd24oc3RydWN0DQo+IG1i
b3hfY2hhbiAqY2hhbikNCj4gPiAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdGhyZWFkLT5jaGFu
LT5sb2NrLCBmbGFncyk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gK3ZvaWQgY21kcV9tYm94X3N0b3Ao
c3RydWN0IG1ib3hfY2hhbiAqY2hhbikNCj4gPiArew0KPiA+ICtjbWRxX21ib3hfc2h1dGRvd24o
Y2hhbik7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTChjbWRxX21ib3hfc3RvcCk7DQo+IA0K
PiBQbHVzIHRoZXJlIGFyZSBubyB1c2Vycy4NCj4gDQo+IE5BSy4gVGhpcyBpcyBub3QgY29kZSB3
aGljaCBzaG91bGQgYmUgcG9zdGVkIHVwc3RyZWFtLg0KPiANCkl0J2xsIGJlIHVzZWQgaW4gY21k
cV9zZWNfaXJxX25vdGlmeV9zdGFydCgpIGF0IFtQQVRDSCAxMC8xNV0uDQpBZnRlciByZXZpZXdp
bmcgYnkgQ0ssIEkgdGhpbmsgSSdsbCB0cnkgdG8gZHJvcCB0aGlzIHBhdGNoLg0KDQpSZWdhcmRz
LA0KSmFzb24tSkguTGluDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo+IA0K

--__=_Part_Boundary_009_909086041.760718807--

