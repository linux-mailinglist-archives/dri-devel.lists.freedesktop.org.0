Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE16F11E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 08:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8A610EC5C;
	Fri, 28 Apr 2023 06:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1D10EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 06:45:44 +0000 (UTC)
X-UUID: 48650caee59011edb20a276fd37b9834-20230428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=9Z0ZA9z6GN2h4azdzK06PfYIY7o0jp+/vfGoETIuuKA=; 
 b=LfbJV708485Vr1MPxzIM6au4wq6wLJ5E3jIaHaTpjRWMnIRanmcu1RResZ/JXd1UILxfVOjRtJVtjzKaceOVN5BFPUbrvjX87G5DFBib0yOZ4qTCmJedtYE96NJT20QQs9N+jY45ltOP2zlBJlAM5jivndJbCuh6IHH2/FYyFFY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:f66448c1-4d30-42e8-9aef-506e60373797, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:8afb2a30-6935-4eab-a959-f84f8da15543,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 48650caee59011edb20a276fd37b9834-20230428
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1142856348; Fri, 28 Apr 2023 14:45:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 14:45:35 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.25 via Frontend Transport; Fri, 28 Apr 2023 14:45:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZGG7dI8pnCLo0DX+gD2oNd88wAdnaruYXd4Q+bRXph8hicCtijkeBtXhn3G8b1jZilU/siC+841x8bXvlrKtu+Ne1JrKGPS4sA+TgInSaAjhn5arZMJPldmuzhcs/ufMMjByA3qjIfFNl0FHanJUH/3aiXd6kpVtZl4Yu4e1NAdirRDfprbs6BaARgaogumFy/TdJAloxM0J38XbNoLVHjQpGMnsXcOSS5I44sBgrkb6V039GYJiQwlQXp6IFRNw0XNl6ShxXfnSJtN+lBIHB+v8yWSWd7Rp2ZKpl1ilOLCJx/O1FSRqbjQaRr6d0Yyv9n+XJWpE6GWiuLQBtPIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=;
 b=cuWto3HjJKGVhQoOkSzKX8kfedTWuVoQbYpKg2KfluHvT8PUlmSqpEOpsx+DejhfUsN1wjBQHwyjNuILtz4osqvCBbPZ6wC+CWUC7u1LcdsaKlxhkiPLfcraF7+0UQap11stS7DWGQMRxOSM0oRiUm8Qzi8KvqLqjqJ/VZtP6IOP0g8KNoUjfQB+Mc87bm/lDyz1ZPtPJdI6hJGKacZsoVaGhaD9W9Q94LR+/FPS6xIMjWCct1f5dyhh7249xnJRvMmHZy4S2iFQAJX09uDzkrICGa55V1YRDxbwy9BSkVPc7wszF6VlsJzhilJOHR/nNt5EvOwhKSvVCV07Y/kR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COABZQu//O/J6ejbrXyuXC1i+DRFsHIepUBdIvU61S4=;
 b=DRu345e8lnjX+n7oCAA5tk7u4v0MlNCsJfGHJ6KFdTAp/34Xo4FPXbxstuHq46eNwj0FdK+NzVhVa2UCW3IQ5hnmT4cb3U/MCJ5GscdV1xDGTuCbamz1vMeOQqduuhYrcF1C81RJTvotBsmkVSSrcXlwH08IOKiF8okGxahNDt0=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by SEZPR03MB7050.apcprd03.prod.outlook.com (2603:1096:101:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 06:45:32 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%6]) with mapi id 15.20.6340.023; Fri, 28 Apr 2023
 06:45:32 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Thread-Topic: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
Thread-Index: AQHYxkdKrueZqbInPkqaVhhgSOlpM68+3A8AgAHNiQCAAQPmgA==
Date: Fri, 28 Apr 2023 06:45:32 +0000
Message-ID: <e73d191f334804324dcaef882dfcb30b4e3e3964.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
 <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
In-Reply-To: <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|SEZPR03MB7050:EE_
x-ms-office365-filtering-correlation-id: 5f8a26c5-8ed1-4269-addd-08db47b429d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4c8p/JZT7txJ0RIweOGHaCO9hRaCiufbFHy4FkMPqH06wZzIzLqhT0TaQ6MAkomd3OXsfdUwLu+Vy8DW5dzHJH8bJTLSxced4Gzi+7XuPx6AJyU7ylWXVt8oEVuQScijRpBpQvvUqvNIxM8u7YjsERB/nWjpBMhAk4cS6MIDvmBsjNFlk6kLFVDsWM1qRMsVAh0xkTQGF125w1nx9JxNijIxPUstchhHE4PLyT52M3VKWyNbhzw8nyFxlXLBlyB3OiMotqywskPLuxOlPWtFLJsxizSx5GfGi3D7IbStF7ajVhO6yKD/05ocUOEIcA1oWZ7GMl774wIkkWPtV/v9JDjKcKxNLtlYPtrj2RIuo/ip8W16VPgJFLBexZWqCmqgmjdZ/46bqLwr2XXU4glpizqQJ5QR9kfw/oBbZ7OjH244Cb9xDQBz2OZQTPcOg9EJBPMbWrfeyTyD31XsoS2XeJkBgHxMA8Bsu+mRl9yK33fNR47PzxIUFGaCGuSpHjUOmIe2vfwDTd/sOexJVWoVi0olmBlsLVO78xHhIWwt1n9B6e5qcFPMlcldeqIIAYJowk5D0JpK+jR28zv4IzDKVSQoZyVT68byNoCi/SNeoYeHXxq21uG8qtk3VP2+HXzyrLoDdCfQBWYQ6ayGuiGXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(6512007)(26005)(6506007)(186003)(86362001)(110136005)(54906003)(478600001)(966005)(5660300002)(85182001)(71200400001)(8936002)(6486002)(36756003)(8676002)(7416002)(38070700005)(66946007)(38100700002)(316002)(4326008)(66476007)(91956017)(64756008)(66556008)(2906002)(66446008)(76116006)(122000001)(107886003)(41300700001)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEhxWUJqUzU4WUFjc2pnbFF4SGRNNzIwczRHMi95dlVYeEFUT1pkU2NMeFc2?=
 =?utf-8?B?MVQ0QkxWcVNYOVAydnpBVjMvaGxuMTdhVzhucXVJZy93bG5iY1FDZ3YraVU2?=
 =?utf-8?B?dGg0b3QwREEzM1ZMMUgxZUZzb3crN1ZVUjh2emZ1dVF5WEZLV1pQejRkeUJ2?=
 =?utf-8?B?L3hvbWJsR1BhcG1jRVQxUnpiRmN6TGlaRi95dENMdlZoNDBmYlVZZGlCL3RW?=
 =?utf-8?B?MkNlMWZnOTlKMGt1QXRiZkwrZTg2UEc4NWZJSFRyQzhtUTVXRjBidjVic1RB?=
 =?utf-8?B?RmpGRFpZQ2RRU1VKaCtZK25JUjlRY08wQ1JLeWRIUFB4Qm43cVJUWFJlV1RB?=
 =?utf-8?B?R2diSGU5cHJYdnVPeng3bzEwWmwvQkVKZEgxdWtRTzFGSjBBK3ltYk0zQjl5?=
 =?utf-8?B?TkVOdTkvRVp2MFpjRDRRYUl4dERQazZQUFdLQ2NuaXhnV01xOC9BcS9XT2Rq?=
 =?utf-8?B?cEl2N0R1TUI3Qmx1ZUJmTUl1ZVAyaHc2ZFI0SE1yTnNPT2h3bFE1SHoweE5K?=
 =?utf-8?B?UVdXRFB6S2lkN1YyT3ZDeWUrcUZaOGhRZFcySXJlY3V6R3pVcjIyTnpISUE0?=
 =?utf-8?B?OEdXS0hEYUlrem9NYVRBaUd4WWRYMVEvWWFNcjFuam5wdTlzaWo4QkRzdG5M?=
 =?utf-8?B?eXVJbkZVcXUvY2NmNTN1QmcyVW1ia2hzU3BlWVEweGYrd2d0bktUZ0laMXVJ?=
 =?utf-8?B?TGhlQXZ1dnNOZ0JpK2NTU3JOSVYyTWJNMmlTRFRNQmhJL05FY1VnaXhQbVNH?=
 =?utf-8?B?VkpaRE5YVCt0bkhENWx5ZGVzeDQrRlIwSk5zaC9ndW1ZL2VBdXhENHRlVFZH?=
 =?utf-8?B?bEczRTlnTkZtTjdNVmFlWUxzclBUdDViMDVvaUVmelRVMjBndStNZ1FQTVVS?=
 =?utf-8?B?WmpJa1E1UXNEb2Fab3RKMWVQM2RuQTBKNU1ZUGt3aFIrcW5DZVRLN0taeEFw?=
 =?utf-8?B?Y3pTY1prU0JqU3FXZ1BZS3JqWW8xT0V1UEk4Yk9CRU5XU3V1SEoxMU50MjJs?=
 =?utf-8?B?eFg1ZTdNUE04YTE2ZDYxMXYxL0lCUVRXQ0VxblViZ0NMR09lenVXdHZuZFdo?=
 =?utf-8?B?ZEVKNDV1SUY1TFhzL3lwcWZhTU1LNVRFQjZXWVFQUXpmTVU3Sk9pbEN3bCtT?=
 =?utf-8?B?WXFuSnExOUJITGJxK3RxMGNJU1F1SVh4ejhPcFI3c25yYjdiMjZyZjVGZmVz?=
 =?utf-8?B?WnB1Ukd2dUlXeENmVkl4dVJWeFhZbE4yclB2ZUk0V1RxcVJYdzhCVTk1Rk1n?=
 =?utf-8?B?ZGRWYVZDMVRVQWFFeG84VzZlcHZjbGtSNkRscFNuMis3MTFLeVRwZStsUjFO?=
 =?utf-8?B?S3ZKZ2pLR0VDLy9YeTJ1dnVPVW0zd21lUDBIVU9PNVc4a1lOZk5pYWFGdGFS?=
 =?utf-8?B?RnZJcU1VOWtFVmRVZldNMmgvNFFqTjMzOU1SK1g0VVd5OHNwMjVhdTgwbkR2?=
 =?utf-8?B?dVdHMWFHR09CM1hveHQrQVBDWTF3LzI2NlVXald4NHhjK2g5eGJiYTY3STJ0?=
 =?utf-8?B?b2J0d2RzYnRMWE9KM2IrMDhDaFV1UGRQTlVud0dPbXB4N0NCeDJyaDkyZllR?=
 =?utf-8?B?bU9BOEZuRk5aYVNNRVBJdmtRRXJOV0FpTk9mTXliR0ZLMmtpazVFd0lRc1h4?=
 =?utf-8?B?Zk9rZEpnZ0JUUEpoSkJOK2JnSVBqNkxxbmpkUHpPUjVzV0RWNXEwejJjKzB3?=
 =?utf-8?B?aHJUNHBOTnNIN1o5ajBjT08zdU9tWWRZWHJZVzl4VTFQYU02TktWMWVzWC96?=
 =?utf-8?B?WC83bEdGUXBaY251NXozNE5NanJVYjNiTjBKWk1HRmFRRjVXZTA0a3JzOUkw?=
 =?utf-8?B?Q1J3eFNGVjdLWmlqSlZaMjk1bzNtNmdJcGw3S0JieHh3c2FGSlo3MFZNOU51?=
 =?utf-8?B?dU9YMkpBekNZaEpRYVZTN0tNRFcrdGVnL2ZuQzVJMm84VEppM1kyMXhJbmN6?=
 =?utf-8?B?cHZ2K2ZjK09yNnNmVnBoRWI2eUpPV09FTmVEM3F6YTYvVEtkSjJrdCtvdHV1?=
 =?utf-8?B?TEdnUFpTdlhqVm5WM21pMzlYR0pmNWtac3BJZERSRFRUVG51aVkvd1BYbTNX?=
 =?utf-8?B?MDR1MzhmQXJFS3lzL3dlVE1qUWFZMWZQRVkzb05NcTd0aG5RODAvd1BxVnI2?=
 =?utf-8?B?SjFZSytqcWpkSjF2K3FxWWhtcHd5ZjNkOUhaNkFSMi9qckNibTZUYWNhM3o4?=
 =?utf-8?B?NlE9PQ==?=
Content-ID: <E9C4BE3DB8F8B546A71C5F35EC4964B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8a26c5-8ed1-4269-addd-08db47b429d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 06:45:32.3808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ly2C9si1dwSgSjvSoF3b0SkdyqrGR5nzDshUy5VLRQRFfFpG9OMv3ZwlUBn2gd5Sbq6Vas9VciT1ctDSHTzlMhVV6DnlbsTTiniWLvPS84s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7050
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1163268791.2105602037"
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
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_1163268791.2105602037
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCg0KT24mIzMyO1RodSwmIzMyOzIwMjMtMDQtMjcmIzMy
O2F0JiMzMjsxNzoxNSYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMy
O1JlZ25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7
UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVu
JiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVy
aWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjsyNi8wNC8yMyYjMzI7MTM6NDMsJiMz
MjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjtoYSYjMzI7c2NyaXR0bzoN
CiZndDsmIzMyOyZndDsmIzMyO0lsJiMzMjsxMi8wOS8yMiYjMzI7MDM6MjksJiMzMjtKYXNvbi1K
SC5MaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U2lu
Y2UmIzMyO3RoZSYjMzI7Z2FtbWFfc2V0X2NvbW1vbigpJiMzMjtmdW5jdGlvbiYjMzI7Zm9yJiMz
MjtwcmV2aW91cyYjMzI7U29DLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7c3VjaCYjMzI7
YXMmIzMyOyYjMzI7bXQ4MTczJiMzMjthbmQmIzMyO210ODE4MywmIzMyO2lzJiMzMjtkZXNpZ25l
ZCYjMzI7Zm9yJiMzMjs5Yml0LXRvLTEwYml0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtj
b252ZXJzaW9uLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7bXQ4MTk1JiMzMjtpcyYjMzI7
dXNpbmcmIzMyOzEwYml0LXRvLTEyYml0JiMzMjtjb252ZXJzaW9uLCYjMzI7d2hpY2gmIzMyO2lz
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtub3QmIzMyO2NvbXBhdGlibGUmIzMyO3dpdGgm
IzMyO3RoZSYjMzI7cHJldmlvdXMmIzMyO2Z1bmN0aW9uLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtUaHVzLCYjMzI7bmVlZCYjMzI7dG8m
IzMyO3VwZGF0ZSYjMzI7dGhlJiMzMjtmdW5jdGlvbiYjMzI7dG8mIzMyO2ZpdCYjMzI7dGhlJiMz
MjtuZWVkJiMzMjtvZiYjMzI7bXQ4MTk1Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtIZWxsbywNCiZndDsmIzMyOyZndDsmIzMyO2NhbiYjMzI7eW91JiMzMjtwbGVhc2Um
IzMyO3Jlc3BpbiYjMzI7YW5kJiMzMjtmaXgmIzMyO3RoaXMmIzMyO3NlcmllcyYjMzI7b24mIzMy
O3RoZSYjMzI7bGF0ZXN0JiMzMjtsaW51eC1uZXh0JiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QmVzaWRlcywmIzMyO3BsZWFzZSYjMzI7dGVzdCYjMzI7aXQmIzMy
O2NhcmVmdWxseTomIzMyO2FzJiMzMjtmYXImIzMyO2FzJiMzMjtJJiMzMjtjYW4mIzMyO3NlZSwm
IzMyO0dOT01FJiMzMjtOaWdodA0KJmd0OyYjMzI7Jmd0OyYjMzI7TGlnaHQNCiZndDsmIzMyOyZn
dDsmIzMyOyhvciYjMzI7b3RoZXJzKSYjMzI7YXJlJiMzMjtub3QmIzMyO3dvcmtpbmcmIzMyO29u
JiMzMjtNVDgxOTUmIzMyOyhjb2xvciYjMzI7dGVtcGVyYXR1cmUvY2NvcnIpLg0KJmd0OyYjMzI7
Jmd0OyYjMzI7QXMmIzMyO2ZvciYjMzI7Z2FtbWEmIzMyO2l0c2VsZiwmIzMyO3RoYXQmIzM5O3Mm
IzMyO25vdCYjMzI7d29ya2luZyYjMzI7ZWl0aGVyOyYjMzI7eW91JiMzMjtjYW4mIzMyO3Rlc3Qm
IzMyO2l0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjt3aXRoJiMzMjthJiMzMjt0b29sDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjt0aGF0JiMzMjt3aWxsJiMzMjtjcmVhdGUmIzMyO2EmIzMyO2NvbG9yJiMzMjtwcm9m
aWxlJiMzMjtieSYjMzI7YXBwbHlpbmcmIzMyO2EmIzMyO25ldyYjMzI7VkNHVCYjMzI7dGFibGUs
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwbGVhc2UmIzMyO2xvb2sNCiZndDsmIzMyOyZndDsmIzMyO2F0
JiMzMjtbMV0mIzMyO2lmJiMzMjt5b3UmIzMyO25lZWQmIzMyO3Rvb2xzLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtXZSYjMzI7Y2FuJiMzMjtjb25maXJtJiMzMjt0aGF0
JiMzMjtjb2xvciYjMzI7Y29ycmVjdGlvbiYjMzI7d29ya3MmIzMyO29uJiMzMjthdCYjMzI7bGVh
c3QmIzMyO01UODE5Mg0KJmd0OyYjMzI7Jmd0OyYjMzI7KGNvbG9yZCksJiMzMjtzbw0KJmd0OyYj
MzI7Jmd0OyYjMzI7aXQmIzM5O3MmIzMyO01UODE5NSYjMzI7YXQmIzMyO2ZhdWx0Lg0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtbMV06JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vemIzL2du
b21lLWdhbW1hLXRvb2xfXzshIUNUUk5LQTl3TWcwQVJidyFpYjV2c19tcUtXbHlDOFZiTE5aYmM0
RmMwLWU2ZEw1Wi1PTTVwTHNWUm5RT1dBY2tSNkVUVjFtUllSa3otNXJLQjdmZFl2WTRMcllvSEtE
bHY2alBTS3pvQy0yNDVKVFlhUSYjMzY7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7TmV2ZXJtaW5kLiYjMzI7SSYjMzk7dmUmIzMyO2FjdHVhbGx5JiMzMjtmaXhlZCYj
MzI7dGhpcyYjMzI7Y29kZSYjMzI7YW5kJiMzMjtyZWZhY3RvcmVkJiMzMjtpdCYjMzI7YSYjMzI7
Yml0JiMzMjthcw0KJmd0OyYjMzI7d2VsbC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzk7bGwm
IzMyO3B1c2gmIzMyO215JiMzMjtvd24mIzMyO3ZlcnNpb24mIzMyO3Nvb24uJiMzMjtObyYjMzI7
YWN0aW9uJiMzMjtyZXF1aXJlZC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsm
IzMyO0FuZ2Vsbw0KJmd0OyYjMzI7DQoNCk9LJiMxMjY7DQpUaGFua3MmIzMyO2ZvciYjMzI7eW91
ciYjMzI7Z3JlYXQmIzMyO2hlbHAhJiMzMjs6KQ0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoN
CjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1163268791.2105602037
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQoNCk9uIFRodSwgMjAyMy0wNC0yNyBhdCAxNzoxNSArMDIwMCwgQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjYvMDQvMjMg
MTM6NDMsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86DQo+ID4gSWwgMTIv
MDkvMjIgMDM6MjksIEphc29uLUpILkxpbiBoYSBzY3JpdHRvOg0KPiA+ID4gU2luY2UgdGhlIGdh
bW1hX3NldF9jb21tb24oKSBmdW5jdGlvbiBmb3IgcHJldmlvdXMgU29DLA0KPiA+ID4gc3VjaCBh
cyAgbXQ4MTczIGFuZCBtdDgxODMsIGlzIGRlc2lnbmVkIGZvciA5Yml0LXRvLTEwYml0DQo+ID4g
PiBjb252ZXJzaW9uLg0KPiA+ID4gbXQ4MTk1IGlzIHVzaW5nIDEwYml0LXRvLTEyYml0IGNvbnZl
cnNpb24sIHdoaWNoIGlzDQo+ID4gPiBub3QgY29tcGF0aWJsZSB3aXRoIHRoZSBwcmV2aW91cyBm
dW5jdGlvbi4NCj4gPiA+IA0KPiA+ID4gVGh1cywgbmVlZCB0byB1cGRhdGUgdGhlIGZ1bmN0aW9u
IHRvIGZpdCB0aGUgbmVlZCBvZiBtdDgxOTUuDQo+ID4gDQo+ID4gSGVsbG8sDQo+ID4gY2FuIHlv
dSBwbGVhc2UgcmVzcGluIGFuZCBmaXggdGhpcyBzZXJpZXMgb24gdGhlIGxhdGVzdCBsaW51eC1u
ZXh0Pw0KPiA+IA0KPiA+IEJlc2lkZXMsIHBsZWFzZSB0ZXN0IGl0IGNhcmVmdWxseTogYXMgZmFy
IGFzIEkgY2FuIHNlZSwgR05PTUUgTmlnaHQNCj4gPiBMaWdodA0KPiA+IChvciBvdGhlcnMpIGFy
ZSBub3Qgd29ya2luZyBvbiBNVDgxOTUgKGNvbG9yIHRlbXBlcmF0dXJlL2Njb3JyKS4NCj4gPiBB
cyBmb3IgZ2FtbWEgaXRzZWxmLCB0aGF0J3Mgbm90IHdvcmtpbmcgZWl0aGVyOyB5b3UgY2FuIHRl
c3QgaXQNCj4gPiB3aXRoIGEgdG9vbA0KPiA+IHRoYXQgd2lsbCBjcmVhdGUgYSBjb2xvciBwcm9m
aWxlIGJ5IGFwcGx5aW5nIGEgbmV3IFZDR1QgdGFibGUsDQo+ID4gcGxlYXNlIGxvb2sNCj4gPiBh
dCBbMV0gaWYgeW91IG5lZWQgdG9vbHMuDQo+ID4gDQo+ID4gV2UgY2FuIGNvbmZpcm0gdGhhdCBj
b2xvciBjb3JyZWN0aW9uIHdvcmtzIG9uIGF0IGxlYXN0IE1UODE5Mg0KPiA+IChjb2xvcmQpLCBz
bw0KPiA+IGl0J3MgTVQ4MTk1IGF0IGZhdWx0Lg0KPiA+IA0KPiA+IFsxXTogDQo+ID4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS96YjMvZ25vbWUtZ2FtbWEt
dG9vbF9fOyEhQ1RSTktBOXdNZzBBUmJ3IWliNXZzX21xS1dseUM4VmJMTlpiYzRGYzAtZTZkTDVa
LU9NNXBMc1ZSblFPV0Fja1I2RVRWMW1SWVJrei01cktCN2ZkWXZZNExyWW9IS0RsdjZqUFNLem9D
LTI0NUpUWWFRJA0KPiA+IA0KPiANCj4gTmV2ZXJtaW5kLiBJJ3ZlIGFjdHVhbGx5IGZpeGVkIHRo
aXMgY29kZSBhbmQgcmVmYWN0b3JlZCBpdCBhIGJpdCBhcw0KPiB3ZWxsLg0KPiANCj4gSSdsbCBw
dXNoIG15IG93biB2ZXJzaW9uIHNvb24uIE5vIGFjdGlvbiByZXF1aXJlZC4NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IEFuZ2Vsbw0KPiANCg0KT0t+DQpUaGFua3MgZm9yIHlvdXIgZ3JlYXQgaGVscCEgOikN
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_009_1163268791.2105602037--

