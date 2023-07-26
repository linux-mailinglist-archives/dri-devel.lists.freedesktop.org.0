Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0462762AB2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 07:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E36510E410;
	Wed, 26 Jul 2023 05:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3D310E410
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:21:18 +0000 (UTC)
X-UUID: 3c6661122b7411ee9cb5633481061a41-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OHm3h/6FkOeG5ql/lN6wQ/yT2Z24KX57Tjd5445KfQs=; 
 b=a1lHEwXje2JyF0qB0lSLLl7LIIh6d+jnWvvfaFD8EbtLkxP2JMMIVmM6ZypKa76TH7qgA4Im8g6k3PsDg+1v33hflQZ1JVf3OvT2VeEzJ0UyNNqQ1mOUcvOPUdioL1AEbdbRSRDoX/v+TyjtpWZQ4YJm5kBIxA+e4j203KNibpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:6910ab88-af5d-4274-ba0c-fe9a1be66553, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7562a7, CLOUDID:183bccb3-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3c6661122b7411ee9cb5633481061a41-20230726
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1535745176; Wed, 26 Jul 2023 13:21:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 13:21:11 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 13:21:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK5sXs8i8osYZKc2H4TuvMD/N6SIpOWuHl0T1T14ikk+0naP6I6b/L5Ht0zZpinabwtQb+gbvgUkrqlpS7PFsuHweOIE5NKv1NNgmAastRCOjJKkxCRmBmSmEtIH2bRp64h8YvHqvbI+80BIqykg3tx1y4RltqSZRoUBjatYQGb8oxfoXNtR3P+XkKybHqlYi3FMoT/Or4CiVIOG+KV4IkD3qyRKgoteXup4oUUxuw2fe5nk9dS36fIU7cbcg7wdhEbg1m3gzDmykYKmfNwiX6Iq59o/6vyrmThFD1xbcOYBjlAhtmg8PmFjn0Jlom5ou8tom1r/bniFCBPg0cwbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH7rUQB4aPcymbiV+rQfUroKoMgJGP2/L3bnjDlgWKg=;
 b=iul9U6aRwdWXeY5MYc7AB7g6VJJsan/MAjq3iLOeSyuy6fR5/7G83Upti/0jQtg40h4Wdo4DBeNQ9Gid5WVUq1WBKsvlmPN+l3x+RaaLIZD3AU99I2N6duwDN+MQJIl/HYP4ZHOFmNlvU8L+3EwR0UltdCKFoDhHE9GM1i2VSkKCN+0hbW1Fa88HGoT0USXtk/xCGlnxWhOIVDesiotOcC7K02OEHFxXYGf3KVQ26xvjFGxIdcX7N7L6ZhKA/kxhy8rkv/RXzQ1seLXe/uAD2PRM202W4PFEz+1fJBPxYKOurCmHk6XzADv5Js1Wk1WYCgp32vOH3ufx5R008oeuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH7rUQB4aPcymbiV+rQfUroKoMgJGP2/L3bnjDlgWKg=;
 b=op9Nnt4NqNCuoqAHvady4Qg9VGTrA6nl0bZjZWlgArshrtcDjpcGeXaOvN1xjRJ1dzN9VMM67YUj8WmcHSqVkHMRCZJ7FIDR7ArAAPa7gUKETcCUwtWVqJJ1W604VFOCFmtcleVcHAwJ7llXvuaNnlN6cfGJ617yY6yAh35PLwo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB5228.apcprd03.prod.outlook.com (2603:1096:4:10f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 05:21:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 05:21:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Topic: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Index: AQHZuhXZQux28wh05kKxYnXmvsQj4q/LjcsA
Date: Wed, 26 Jul 2023 05:21:09 +0000
Message-ID: <dde9d51db2c496fcddfb4161465851b6dff8e62e.camel@mediatek.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB5228:EE_
x-ms-office365-filtering-correlation-id: a55a24ec-51d1-49ca-af58-08db8d981ec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QrXcSY9HIGciKQTUo96w6G1VBZotGatRelJ5oIqKzADLSYVpudgdtL7E14v238VNSCrIrXXWz7T413g0GwoqibSGypaexGZ1AgaBAocC8bpkIcsCgscmq1ywT26rASDcUfAYgyrnlTAV7nj9e40VTL+NwQMbZEtHCs4c/q0cZ8eBGjUb6hP8B2aN24dHVbmv8TUT4wKU/6kmqx/DtxXyNv2c6NigRSB0U5ztU/P4HlKe7tRKVxk0ULeZvWt0Z2wu7p4fHRXAJo+fOt5Mg2TB3YMjL6QUfzsyS2bUjNlQN8za4TOoVn4MSmqumg1ojwFiQHhSsPEyc7HYj+rPE70AaCdFuBTt77zXOGOzn98lnoOm6C96mMORaADkI80ciPtOaI6NXKU7Hucm+5NCDgbXaKX2E9Xk8tcIqutu81wV6f/9S3feiLGQ4bisbvAYEa2Z+0W8m2scQZqdM2Wb6Q+5tfpas8cNuu5Wo16vj7gztoFf6BrUEblHvoRrkgxNPzT/hdidOYeBiQUeSSCbs1exfeEVP5OcYvSWcpBiLwet0OCqXvXOywwDFBjszBGhjng/7Rc5XPGDxEumfTEB3lCZQS9mQlFJUhG5Rl2bc9kkzDGllia5XPRiMhm5iDxQQyAaSUNavlFfKV22ltN2k8k7vyZh1R0NiLoCiE17z2+V+ZA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(110136005)(122000001)(6512007)(6486002)(38100700002)(478600001)(54906003)(41300700001)(2616005)(5660300002)(66446008)(66556008)(8936002)(66476007)(8676002)(64756008)(66946007)(71200400001)(76116006)(4326008)(316002)(186003)(83380400001)(6506007)(26005)(86362001)(2906002)(36756003)(85182001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFVvM1JMU0RmZDJHVnhnczRnVitnTVMyTXdhdWxPZ0RxRHRoRW8weFhJaXNI?=
 =?utf-8?B?QWhTdXJ4c3NCK01xNSt1NjNkVTNnNE9DamF0MGFJU0U2WU1HaGZ6VTM0UXdO?=
 =?utf-8?B?L25jRXppRDdBZEdLblg2Y09VQUJIc1ZsaFN1Z2E1aFJXWDUySnpGSm5qbnlM?=
 =?utf-8?B?bVVHcFk0VncwRDB6cjVNU0I1UWk5THN0WnFOYjhldUFTcnh5VHl5NW9LM2ln?=
 =?utf-8?B?MkpXekVGT2xHRDlOTWhvTlU4RlVITldEcVc5SU16R2xFeGRoV0xRcDQzdmww?=
 =?utf-8?B?NU1MSXNMRFplWEp4Q1VWOElXUG9RS2FkR1l3eWl3Q3NkWHR3OHArV0lTRlQ0?=
 =?utf-8?B?N1B6VnROVnZWMGtyem1DVHhnaGtiMzNWNTRIUjZ4S0pEQ0tTZUlyVlZDM2ww?=
 =?utf-8?B?M3RjUWpyTW9VQ0tjdGxiY3VRd2tyNG1EZmJUTFByckxid0tqOXBhc3M0OGth?=
 =?utf-8?B?QlhpdE42RXZjRzlDanFuWTdvZnduTmN2YWhHcGZuQUVTQlFOMzVueHhUdHNq?=
 =?utf-8?B?eTlYMkZ4QUNQTUdjZGwyQis3OHBrcUV0aTBpL0R5RERRclZZYXFVR2tVU3B3?=
 =?utf-8?B?N1B1aE15cnQvd0licTJOWmdndFRKSy9waTNnL2NVa3NmWmZwbmxGUzNrS1E3?=
 =?utf-8?B?eFZGRDd1NE9JNUFLSXRPd0trUndjazFHSE1UbWlRaEJTeDNCWmNLUS9JaWE1?=
 =?utf-8?B?NzAvbE5ySnN5RE5FOGZBdi9PYjZRcVZDamhhYXBrcTYwU3pCUGI4UWZ5ZkNq?=
 =?utf-8?B?ZjlBcjBSOStyMUY5L2FTaTNaMEdib0pZOVhhcm1SY3NDQ0FocmJJSWYvOEFJ?=
 =?utf-8?B?QkZaN2xOYjE1ZkdsdzRGR2xnWU5KbXBBQVhORDJLQlorajNJaGhpeUpDdkV2?=
 =?utf-8?B?emVCc0h6anp6MTJmeHpGZU94aU02R3dxNlpFL250ZzBGY0JoYmIvKy9hYklQ?=
 =?utf-8?B?YnIyZ2dWYVhpUEoyQU5USWlKamQxb3QwZ2w3WkcxUnBaQXZ6WTFibUZGblZv?=
 =?utf-8?B?M2RXdHFUbWxDZUtrc3dPMWFma3gxcDRGajNvZG1CYTRxNjViZUNHOE9lSzg3?=
 =?utf-8?B?anFiRXNuYUNFMFpLYUprRDVMSTNQOFRsWjR2d2VmcnpOcFhXaStHdS9VTWNN?=
 =?utf-8?B?bGhUME1TRFdENVFxT3FyZ0I1YkFsdjd5cmJzcWdGV2tIcFRYazluWURLYUc4?=
 =?utf-8?B?bVN6UkwwanFOQjNYYkx3RU5DVGNtS3VyeERUREF2L1lnVUE4aUd1aEFIQmtF?=
 =?utf-8?B?S25FZ1BwMlV0S05HRExWTFJsQzRxeUo1WTExMk50RDZQWXFvZWh4SHo0RjBR?=
 =?utf-8?B?dGZWUzV3U2QxN3dqSWlzV2UrK0hWQ2tKSWcxRmpsdzE0KzNQWWZYQTVKRWp2?=
 =?utf-8?B?bmU0aUE3MDZ2ZVRjQ1EwSVZOSGhlUXhSdXFMYzlrQzZJaHlJbnZIYkVmT1BQ?=
 =?utf-8?B?UEI3MHl2VW1md2FhbG1VWU0xdTNyTUlMR2p4YkxRRDJkT0xvd3lPOFFYemlj?=
 =?utf-8?B?cXV2b2pYbXBBSmEvcnlrbmhoMmswUk9uZStaQWp1YTcwdlJScGhLdnB0Q1Vv?=
 =?utf-8?B?N1FhN3owUWNGMmVyb3E4eFl4bWNxQnBselZ3TzA1TW1oVHMrN3hwY3RkZnRW?=
 =?utf-8?B?cTh6UklQUzhxb0VFeVRsNnFEMjlUQjBnN3BpSjBkWXNIL3FNcmErdWh4RENO?=
 =?utf-8?B?cEpMemo2TkRJMzlMc2RBbVhHdGZqM29WMkhWSm04dTdhZEZGTU0wbCtoOXpj?=
 =?utf-8?B?dit4aGl1aWFSdTdRVFJGbDUydkwwYkRxbDZNaThwR0Z0OUdseWwxSXY2Z1BF?=
 =?utf-8?B?ZmFmS3J6T1Z4ZGtPQXF6emNFMFVycko4d2VjVU1ISTQyUzhmTmlJQmdoMjRI?=
 =?utf-8?B?T0JobFAyaE5CMyswVzExMzBTTlo3V3RVa205bm9mazdOU2dHMHVRYXR2TXp0?=
 =?utf-8?B?RGpMSzVnN3pBWkF1bHUrMzdDRGhtYndXK29CRjRJS3FzUGtsRWhqWFVDUy8z?=
 =?utf-8?B?a0p3NGFIMmNsTExRdWJQblR1blZjSUxXa2NBTmhjMm43WUNKZS9RWTd4MlNB?=
 =?utf-8?B?V0szVFB2SlRrVlkva0szZU1KbkZ0R1dkVGRFZFF1aE9XWVdScDk0VTdncHJG?=
 =?utf-8?Q?TyjbSWn1irGty17kjRBiD55Ct?=
Content-ID: <B85ED63D3AE8B7468C51F6721C0F4499@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55a24ec-51d1-49ca-af58-08db8d981ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:21:09.3448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YQ9iHd8FAs1caW2COANADb3HuFSfMbAmbpqrO0e3RtJtuog02pL9IdQr12+xdtLzXc9Io9ig0lm6FY3mSy+jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5228
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1220541774.651668920"
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

--__=_Part_Boundary_003_1220541774.651668920
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0xOSYjMzI7
YXQmIzMyOzA5OjUwJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Q2hhbmdlJiMzMjtkcm1fYnJpZGdlX2FkZCgpJiMz
Mjt0byYjMzI7aXRzJiMzMjtkZXZtJiMzMjt2YXJpYW50JiMzMjt0byYjMzI7c2xpZ2h0bHkmIzMy
O3NpbXBsaWZ5JiMzMjt0aGUNCiZndDsmIzMyO3Byb2JlJiMzMjtmdW5jdGlvbi4NCg0KUmV2aWV3
ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMy
O0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjt8JiMzMjs2JiMzMjsrKystLS0NCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzMmIzMyO2luc2VydGlvbnMoKyks
JiMzMjszJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1n
aXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7Yi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7OTQ4
YTUzZjFmNGIzLi43NDA2OGFhNzBlMGMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEwOTAsMTEm
IzMyOysxMDkwLDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlfcHJvYmUo
c3RydWN0DQomZ3Q7JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMz
MjtkcGktJmd0O2JyaWRnZS5vZl9ub2RlJiMzMjs9JiMzMjtkZXYtJmd0O29mX25vZGU7DQomZ3Q7
JiMzMjsmIzMyO2RwaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMyO0RSTV9NT0RFX0NPTk5FQ1RP
Ul9EUEk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LWRybV9icmlkZ2VfYWRkKCZhbXA7ZHBp
LSZndDticmlkZ2UpOw0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7ZGV2bV9kcm1fYnJpZGdlX2Fk
ZChkZXYsJiMzMjsmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCkN
CiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMy
O3JldCYjMzI7PSYjMzI7Y29tcG9uZW50X2FkZChkZXYsJiMzMjsmYW1wO210a19kcGlfY29tcG9u
ZW50X29wcyk7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsocmV0KSYjMzI7ew0KJmd0OyYjMzI7LWRy
bV9icmlkZ2VfcmVtb3ZlKCZhbXA7ZHBpLSZndDticmlkZ2UpOw0KJmd0OyYjMzI7JiMzMjtkZXZf
ZXJyKGRldiwmIzMyOyZxdW90O0ZhaWxlZCYjMzI7dG8mIzMyO2FkZCYjMzI7Y29tcG9uZW50OiYj
MzI7JWQmIzkyO24mcXVvdDssJiMzMjtyZXQpOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyO3Jl
dDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7QEAmIzMyOy0xMTA3LDcmIzMyOysxMTA4LDYm
IzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2RwaV9yZW1vdmUoc3RydWN0DQomZ3Q7
JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMy
O210a19kcGkmIzMyOypkcGkmIzMyOz0mIzMyO3BsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0K
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7Y29tcG9uZW50X2RlbCgmYW1wO3BkZXYtJmd0
O2RldiwmIzMyOyZhbXA7bXRrX2RwaV9jb21wb25lbnRfb3BzKTsNCiZndDsmIzMyOy1kcm1fYnJp
ZGdlX3JlbW92ZSgmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0KDQo8L3ByZT48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_1220541774.651668920
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTE5IGF0IDA5OjUwICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gQ2hhbmdlIGRybV9icmlkZ2VfYWRkKCkgdG8g
aXRzIGRldm0gdmFyaWFudCB0byBzbGlnaHRseSBzaW1wbGlmeSB0aGUNCj4gcHJvYmUgZnVuY3Rp
b24uDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMNCj4gaW5kZXggOTQ4YTUzZjFmNGIzLi43NDA2OGFhNzBlMGMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBAQCAtMTA5MCwxMSArMTA5MCwxMiBAQCBzdGF0aWMg
aW50IG10a19kcGlfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlk
cGktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOw0KPiAgCWRwaS0+YnJpZGdlLnR5cGUg
PSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJOw0KPiAgDQo+IC0JZHJtX2JyaWRnZV9hZGQoJmRwaS0+
YnJpZGdlKTsNCj4gKwlyZXQgPSBkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwgJmRwaS0+YnJpZGdl
KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAgDQo+ICAJcmV0ID0gY29tcG9u
ZW50X2FkZChkZXYsICZtdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KPiAgCWlmIChyZXQpIHsNCj4g
LQkJZHJtX2JyaWRnZV9yZW1vdmUoJmRwaS0+YnJpZGdlKTsNCj4gIAkJZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gYWRkIGNvbXBvbmVudDogJWRcbiIsIHJldCk7DQo+ICAJCXJldHVybiByZXQ7DQo+
ICAJfQ0KPiBAQCAtMTEwNyw3ICsxMTA4LDYgQEAgc3RhdGljIGludCBtdGtfZHBpX3JlbW92ZShz
dHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBtdGtfZHBpICpkcGkg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gIA0KPiAgCWNvbXBvbmVudF9kZWwoJnBk
ZXYtPmRldiwgJm10a19kcGlfY29tcG9uZW50X29wcyk7DQo+IC0JZHJtX2JyaWRnZV9yZW1vdmUo
JmRwaS0+YnJpZGdlKTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0K

--__=_Part_Boundary_003_1220541774.651668920--

