Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82997D6423
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3235410E57D;
	Wed, 25 Oct 2023 07:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BBA10E57D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:55:50 +0000 (UTC)
X-UUID: e5c6317c730b11ee8051498923ad61e6-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=q2Vx4skMqIBlw8WgpQ9dSGqvWAx24SsI4AusHZ7y7Wg=; 
 b=lKBgNCFObTHNvvIqB8zlaEkTYsshrnAZ0U5MD0V5ckjCJKV8e1i4ByT2uXH7leiSIYqi4yA5fW+gemkw3704sjmkUOApLJPbKXk2+dLmcbPHvBf2Ye5o3ZxysT6bZPkwwb1k11Zyj8hOdL75r2+sLDBDuQQkwYND2CIsD/XS0JE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:38a3b9ca-5124-406b-b2ea-8c04917c56c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:a1274cd7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5c6317c730b11ee8051498923ad61e6-20231025
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1835674643; Wed, 25 Oct 2023 15:55:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 15:55:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 15:55:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2xdufWE1uolYlhSKjZMkY5/Bm9YVna0LW+dzVqkU1nDQUsCzrfgzyY8khop53QHhrVR53WZhVJhL9pTJ1zBGIKG98wy/UJlEH8+zIR6md/yInY9b3yvpXr0ZcHj23GZhL1et4jR+xkKSUGeln1PyMeIdAiHEYBO4SREH2LF3ym3Apac0trLaqpDN0jeN572GMQj1bp3KlQiKAtA5OOYy+ge5RyDJ9JRTYSYbeR+fXggTBPvccB5GFTzENGZlYa4WRFEO1anZdF9yWDg+SdBKnEOXwR6m5PvhaLIs3Hnr6n6n07p/mw1rUxBXRG4xf9aSS2VaRrs85eGhhFR14RPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2Gde9uLBMO2nNwPJU0NjxA6SG0mrytLibGELssqiRk=;
 b=B1cHJ32lKXDJQAoWKrBCVmlZy6bUqQi61pbKqVuWvQd2eXA0Qsg0XExYL61kF5xwWOtx2aB7sViAZ85KDrJIoy7xoTbmhqA9UnDjgaoWFaVrtrFSUGz1dt1Dm6UknyS+eZkKlz5FnhOrSCji94tOk6+43YiBPYgP6TJJ/FG8AA96v5hROstKom+KAyMokpqN8b2vP1XmSBp7Dnv1WMAVkb4/4SNdjVjO6qLH17R+u2a0+ExVDLenUQdNBod5ku6Y90snryyiM2TWxhDQ8gxE4H2yItLUrRSf0CKhxpdE8isIIOPIPyeut3ZlI/PcWEyXGKqDWzohL/EtI78INV7gEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2Gde9uLBMO2nNwPJU0NjxA6SG0mrytLibGELssqiRk=;
 b=JholT0fC9S+udbJgmCP1v1W1pTU0C8aty2BQ5XVhZi+OU481GpNUZcaz767TGZOBZDnhW7lESEORgA6s3IlKpGjlt14Ca2Ytcf+2XLd2VQ5ZjITPy6ILmrcG3BeB/sgtzVinfDvqWDrWO2m5CjhcKXm4ANjy6FV7f9BjqKQhmcQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7054.apcprd03.prod.outlook.com (2603:1096:820:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 07:53:38 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d%7]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 07:53:38 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/mediatek: Add mtk_ddp_sec_write to config
 secure buffer info
Thread-Topic: [PATCH v2 05/11] drm/mediatek: Add mtk_ddp_sec_write to config
 secure buffer info
Thread-Index: AQHaBWvp9kNao3A7NEq8ivrRz8fRkbBYn90AgAGGA4A=
Date: Wed, 25 Oct 2023 07:53:38 +0000
Message-ID: <069e04f8be2007d0c3ffd4d9868a5eae0f6ab8c4.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-6-jason-jh.lin@mediatek.com>
 <e3198dd5-48da-498c-9f21-4f6845b37675@collabora.com>
In-Reply-To: <e3198dd5-48da-498c-9f21-4f6845b37675@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7054:EE_
x-ms-office365-filtering-correlation-id: 3546f30b-41b6-4f24-9f3a-08dbd52f7faf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTfQLIymiJKeAqAVs9j8i3ZV6CFrBT+E1+425RpCpucsKjTi0iqd3qkO4XskJ7PIwGYBshx7jz8i9/+0XjJJVZinAdhDnO2317KNS7+sMXOah4778h5yGitUH7iNw+Ej18ai7IZjNuqmDp3yO3jmnMZUPz1K3mGXPra6t+k13iYfMgm1UHvBisyTGJXa9UkmS0wXCe72BgWQgLS5sBj32VJ/02dUnCHyeGBa67XS4YOyJlbW1mvrnbIjz6kXGQUUVETY+ctC9j3L5IP4TuEBp8sbd9Q3dim5/wJSM5/DhHObA8kF/9ZD6Ms361w2XXRTfqLVg7FaE2tDMnkorOpNmT5DUkGZqnFrNtvlOkIwjo7fhasHONv9v6ClKg+KunWkkLM0vIQTAST7UK3miXuW+/OgpQGXJ4FhaQcpPrukYXmIZYCow2MUI/Ra8DGtRSaf/aI+tc0WSi94nQpk6rs1GNPHgDk8zstCi+n1Q963eI5UE8a1wseIuShsJkUOOdSjqpsop+eYjOFutfWYQAgpUEefWfCHcOdvpWW1Rc1iuco1qRWl5Q2sI8Z3yrG2umb13tHoIr89w2aaTOzhbeNYJ9tFO9SSr4FJTo/igTTnPTBE6urBuatQ2mSY6uzboYg9rgaFHD8WTPOK5LWQYgIlRK4NPphNMs2sgujIV3zwbwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(85182001)(110136005)(66476007)(66446008)(2616005)(66946007)(54906003)(316002)(66556008)(122000001)(38100700002)(91956017)(38070700009)(86362001)(6512007)(64756008)(2906002)(76116006)(26005)(71200400001)(6506007)(4001150100001)(8936002)(6486002)(4326008)(478600001)(7416002)(8676002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wmt5VmZLQkthQzFSZHlXSHlDQWkzckJoUVpTTkwxSHpkOFFLSDV5bURhVllG?=
 =?utf-8?B?STA0TjdkakpYYStCZ3BPZ2VzeWpZNGVyNFJDYXpVcDhpc2Fka3JXZVpwSlpT?=
 =?utf-8?B?bHVHeGI2VWcvMW9JRnZIMXVaRnliVmpVbFFuK2c1d0IxYitJWUN5U2l4a0NG?=
 =?utf-8?B?bFRJTWdVN2NBNG1nNUpwWXJub0pManJPV3BsU3E0RkRuSG5jTVUvK09JT0E4?=
 =?utf-8?B?TVZDak9FeGlkMmw1R3U4bEhTeElWMmZmUGlmK3VxZmV0ZzB2M21TZUEvTUVH?=
 =?utf-8?B?Rm5MN3Q1dXBYR1BGV09ibnRFK09SVHR0SHAzcWhhbVB3RWZqVmZ6azZ2WkFG?=
 =?utf-8?B?S1NhUU1TZzRLRjhPRlRoU1ZMdFhJVUdva3l6VG84bHZqUW1yRjEzb0c4RXBo?=
 =?utf-8?B?bSsrTmUzSXd1QlpERitPUW5uSURVeHpkR0E0aUpWUnk4SUdjQ0lEKzBOd05F?=
 =?utf-8?B?TGZwSjJoMjlSRXhFN1k2WGVTelRldHN6K1MrcG8yaUVHMFFWYUtCTldVTG9x?=
 =?utf-8?B?MVlIcklkOGdLeXc2TytZZHUzZUdGdGVyeW5xRUt0OEVjRjJwSDhrd0dSMzlk?=
 =?utf-8?B?V2JrSGJNNUJmVnpWaUpBR2ZzSm9MdG9nMk1CNm5XSlFiY1JJQlhWdE1hNXUw?=
 =?utf-8?B?WmYydG91dEF0d0owWUMwVkJMV0xRR0w3aHJPemJJbzdHRDVJUUtzU0Q0dng1?=
 =?utf-8?B?WktobWxVblBQSjFhZ1c0TmJXRFpoQ0VLUHNRdUk4Y3UrRTkzUXc3SHdMMFpH?=
 =?utf-8?B?RDJXRGlERTYvOEZDck5Za1g3M0F2dC82WmR4MUNCKzNnMGVNeVRuU2Uzdkpo?=
 =?utf-8?B?cC95Y05qKzEra1ZHVnRJZk1GSitxOVE2Yms5c0N5WEJ1NW9oQmZla3ovckZU?=
 =?utf-8?B?Y0hkcENWU0JyNjdDZHhQU1RhVXJCSXVHeDRsR244Z0VBMDlpejVybnF6VFRD?=
 =?utf-8?B?dFIvS2E3OWtTbEd5Ris3YWZuVXhXT3ZxTTBnalpTOFJ5WWF5NTBTbHdSc3ll?=
 =?utf-8?B?empRVlBUbjYxMGd1NzNtT1N6S2tjSWdxMWdrR0FVbktUeksyMStWYjVOemJM?=
 =?utf-8?B?ZkpLOWF1RTFKcWNBTzE0YzZmbFgvd0t3V2VNeG9ESDVraStsd1AvV3A2bG9o?=
 =?utf-8?B?VWwrNm1kd1VwUktvQ3hHK2tJUENDQlVBZDNzZUF5T2xKSWdiNzIrSDdHNk9Z?=
 =?utf-8?B?cFBmK3JnNmErNHdOTmtRTHhpdmhNL052WkpOOC9OS29EY1ZwVjhIK21yOTZM?=
 =?utf-8?B?VG5ucEhhUVhLdzJER09WQ01uOXlRQzk0dGQ3akVwOHVKZWJqMVZmN0RDaFVm?=
 =?utf-8?B?OFpjTGR4a1hrd3FBVmFZS0tBSHM3bnZxcWQ2QWVYY3diVVl2ajBYbkE5a1Bk?=
 =?utf-8?B?K1dkRVlmWnlOZFk0aWNPQ2RBbE5mTWY0TThkWTlKS3Q4NytiOWFCZytsekFr?=
 =?utf-8?B?NThNZnZ5K1hJUkJRNXRzM2ZCaWMvRkZvZnd6K2xQQmZTOGtZS2YxWGtQVW4v?=
 =?utf-8?B?cWxRS0tVSXorQ211SEZ0NXpYcWtFclVyY3JMWWUzUjhkNlYxWXZONXgzeEhZ?=
 =?utf-8?B?cmJTVEtIUFBRWlFBc2ltVzFXbXV4Y0VYSUpiQnZUSkxmTVVCVmo0VEE5WDZN?=
 =?utf-8?B?T1FQUUR6WUVJc08zT2VTMzc1enROZW1VdXRPZDM3TGo4U1JORzNOdFRrMUtV?=
 =?utf-8?B?eHVrTEcxOGYrZTZTYlBkRUZqck9xa2NvLzVoMElRM3VBdXZCbjRhZDEwbEkv?=
 =?utf-8?B?eDN6UGRLYXNwcHNHUU1rWUNweSsybnV0enVSTGYyRWdNZGVWWUh0S3hjZGFC?=
 =?utf-8?B?K1UvajB4aGJGYTA2S253TS9JTmtCRmJFUUp2c3BQb3I4NFR2Q3RqTnNhcCt3?=
 =?utf-8?B?d1p4Z0JndGFuRlI5YlJXTEw2NXpENUg3SWVtcDNKVzNOR0lybUkwK3hNTmxP?=
 =?utf-8?B?NStxZStvVWhlUmdpVHlkSXIrRTQwaVlIcnowMGErYTZwM0NRYm45cHlETWNw?=
 =?utf-8?B?aTQ4M2hGd25id250T2FIWnBmdVRVY1A0eU1CbUEwd2M1M3JIQ05hbGFSYkg4?=
 =?utf-8?B?STYxSkNBUDdGUjdFaVhheVc0ZzFPc0tLNWJML1NLZ1UzZnhKWHBQTDA2RDgy?=
 =?utf-8?B?Uml6Z2hGZ1lnZk1Ec0F0VjJrMEVzTkxBejJvSExOZE5Ea3pKdnplYk9vTGFE?=
 =?utf-8?B?WFE9PQ==?=
Content-ID: <E11F86DA1E3CB347BA34A6457BF64D20@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3546f30b-41b6-4f24-9f3a-08dbd52f7faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:53:38.5339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gG20n+cTEP+rmqyHX8JTDoH5ja+ii4YKBtC/DSrKhDML2O/zAHU3FlEKFo3Ouf/H2oQOKnDoAbeZBMyUN23V0hIYWhY5pVKtz0hbYWKauc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7054
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1435254647.747881266"
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1435254647.747881266
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmll
d3MuDQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTEwLTI0JiMzMjthdCYjMzI7MTA6MzcmIzMyOysw
MjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtJbCYjMzI7MjMvMTAvMjMmIzMyOzA2OjQ1LCYjMzI7SmFzb24tSkguTGluJiMzMjto
YSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7bXRrX2RkcF9zZWNfd3Jp
dGUmIzMyO3RvJiMzMjtjb25maWd1cmUmIzMyO3NlY3VyZSYjMzI7YnVmZmVyJiMzMjtpbmZvcm1h
dGlvbiYjMzI7dG8NCiZndDsmIzMyOyZndDsmIzMyO2NtZHEmIzMyO3NlY3VyZSYjMzI7cGFja2V0
JiMzMjtkYXRhLg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlbiYjMzI7c2VjdXJlJiMzMjtjbWRxJiMz
Mjtkcml2ZXImIzMyO3dpbGwmIzMyO3VzZSYjMzI7dGhlc2UmIzMyO2luZm9ybWF0aW9uJiMzMjt0
byYjMzI7Y29uZmlndXJlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjdXJyZXNwb25kaW5nJiMzMjtzZWN1
cmUmIzMyO0RSQU0mIzMyO2FkZHJlc3MmIzMyO3RvJiMzMjtIVyYjMzI7b3ZlcmxheSYjMzI7aW4m
IzMyO3NlY3VyZSYjMzI7d29ybGQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyYj
MzI7fCYjMzI7MTImIzMyOysrKysrKysrKysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgmIzMyO3wmIzMyOyYj
MzI7NCYjMzI7KysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMz
MjtjaGFuZ2VkLCYjMzI7MTYmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRl
eCYjMzI7NzcxZjRlMTczMzUzLi4zZGNhOTM2YjkxNDMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMNCiZndDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTExMSw2JiMzMjsr
MTExLDE4JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX2RkcF93cml0ZV9tYXNrKHN0cnVjdCYjMzI7
Y21kcV9wa3QNCiZndDsmIzMyOyZndDsmIzMyOypjbWRxX3BrdCwmIzMyO3Vuc2lnbmVkJiMzMjtp
bnQmIzMyO3ZhbHVlLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyNlbmRpZg0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOyt2b2lkJiMzMjttdGtfZGRwX3NlY193cml0ZShzdHJ1Y3QmIzMyO2Nt
ZHFfcGt0JiMzMjsqY21kcV9wa3QsJiMzMjt1MzImIzMyO2FkZHIsJiMzMjt1NjQNCiZndDsmIzMy
OyZndDsmIzMyO2Jhc2UsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtjb25zdCYjMzI7ZW51bSYjMzI7Y21kcV9pd2NfYWRkcl9tZXRhZGF0YV90
eXBlJiMzMjt0eXBlLA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7Y29uc3QmIzMyO3UzMiYjMzI7b2Zmc2V0LCYjMzI7Y29uc3QmIzMyO3UzMiYj
MzI7c2l6ZSwmIzMyO2NvbnN0JiMzMjt1MzINCiZndDsmIzMyOyZndDsmIzMyO3BvcnQpDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrew0KJmd0OyYjMzI7Jmd0OyYjMzI7KyNpZiYjMzI7SVNfUkVBQ0hBQkxF
KENPTkZJR19NVEtfQ01EUSkNCiZndDsmIzMyOyZndDsmIzMyOysvKiYjMzI7c2VjdXJlJiMzMjti
dWZmZXImIzMyO3dpbGwmIzMyO2JlJiMzMjs0SyYjMzI7YWxpZ25tZW50JiMzMjsqLw0KJmd0OyYj
MzI7Jmd0OyYjMzI7K2lmJiMzMjsoY21kcV9wa3QpDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2lmJiMz
MjsoIWNtZHFfcGt0KQ0KJmd0OyYjMzI7cmV0dXJuOw0KJmd0OyYjMzI7Y21kcV9zZWNfcGt0X3dy
aXRlLi4uLg0KJmd0OyYjMzI7DQpPSywmIzMyO0kmIzM5O2xsJiMzMjtjaGFuZ2UmIzMyO2l0Lg0K
DQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtB
bmdlbG8NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1435254647.747881266
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUdWUsIDIwMjMtMTAt
MjQgYXQgMTA6MzcgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAyMy8xMC8yMyAwNjo0NSwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gQWRkIG10a19k
ZHBfc2VjX3dyaXRlIHRvIGNvbmZpZ3VyZSBzZWN1cmUgYnVmZmVyIGluZm9ybWF0aW9uIHRvDQo+
ID4gY21kcSBzZWN1cmUgcGFja2V0IGRhdGEuDQo+ID4gVGhlbiBzZWN1cmUgY21kcSBkcml2ZXIg
d2lsbCB1c2UgdGhlc2UgaW5mb3JtYXRpb24gdG8gY29uZmlndXJlDQo+ID4gY3VycmVzcG9uZGlu
ZyBzZWN1cmUgRFJBTSBhZGRyZXNzIHRvIEhXIG92ZXJsYXkgaW4gc2VjdXJlIHdvcmxkLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMgfCAxMiArKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmggfCAgNCArKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYw0KPiA+IGluZGV4IDc3MWY0ZTE3MzM1My4uM2RjYTkzNmI5MTQz
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jDQo+ID4gQEAgLTExMSw2ICsxMTEsMTggQEAgdm9pZCBtdGtfZGRwX3dyaXRlX21hc2soc3Ry
dWN0IGNtZHFfcGt0DQo+ID4gKmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ID4gICAj
ZW5kaWYNCj4gPiAgIH0NCj4gPiAgIA0KPiA+ICt2b2lkIG10a19kZHBfc2VjX3dyaXRlKHN0cnVj
dCBjbWRxX3BrdCAqY21kcV9wa3QsIHUzMiBhZGRyLCB1NjQNCj4gPiBiYXNlLA0KPiA+ICsJCSAg
ICAgICBjb25zdCBlbnVtIGNtZHFfaXdjX2FkZHJfbWV0YWRhdGFfdHlwZSB0eXBlLA0KPiA+ICsJ
CSAgICAgICBjb25zdCB1MzIgb2Zmc2V0LCBjb25zdCB1MzIgc2l6ZSwgY29uc3QgdTMyDQo+ID4g
cG9ydCkNCj4gPiArew0KPiA+ICsjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4g
PiArCS8qIHNlY3VyZSBidWZmZXIgd2lsbCBiZSA0SyBhbGlnbm1lbnQgKi8NCj4gPiArCWlmIChj
bWRxX3BrdCkNCj4gDQo+IAlpZiAoIWNtZHFfcGt0KQ0KPiAJCXJldHVybjsNCj4gCWNtZHFfc2Vj
X3BrdF93cml0ZS4uLi4NCj4gDQpPSywgSSdsbCBjaGFuZ2UgaXQuDQoNClJlZ2FyZHMsDQpKYXNv
bi1KSC5MaW4NCg0KPiBSZWdhcmRzLA0KPiBBbmdlbG8NCj4gDQo+IA0KPiANCg==

--__=_Part_Boundary_002_1435254647.747881266--

