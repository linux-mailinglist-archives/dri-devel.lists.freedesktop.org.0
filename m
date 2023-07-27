Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF7764380
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 03:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3A10E043;
	Thu, 27 Jul 2023 01:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961EC10E043
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:47:40 +0000 (UTC)
X-UUID: 8eca81262c1f11ee9cb5633481061a41-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=SHjTdsVLYDSx7X4Mv9UJaieVUi5vGutss3gtK7a7ZG8=; 
 b=mUHZMzhHVg4mU0T0xLyJ1rXNP+ittNZ3KCEEbUmCnHFL3CvR9P6HSaP9TVBY3YB6mAhgMXyOE7qELmiE8N4SLs6vC95wSUkboY4XaIeLdZuFSmKf5BCnClryOxPYaULLFeoxMYDDplGV8sjSAxz/22UDELzdp6xCZIA4uqwT760=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:a99a14db-2e67-417b-b5e5-8f74107be45b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.29, REQID:a99a14db-2e67-417b-b5e5-8f74107be45b, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:e7562a7, CLOUDID:b6ab7f42-d291-4e62-b539-43d7d78362ba,
 B
 ulkID:230727094737C3FSNLGM,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN
X-UUID: 8eca81262c1f11ee9cb5633481061a41-20230727
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 233380353; Thu, 27 Jul 2023 09:47:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 09:47:33 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 09:47:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0RXZn5ZQNy+HfeSJhuzdv5NYkuu6q5+a6T+LyvFc7Amj3kUCfAdHoQEgwBSMr8EEFwZwR4fTwvRvp+n+n/7DtaOkx/X5qysGha1sd25aMK4PYS+QIz3x4OEiXWMUEWli7GMEapW1j83J3f9hmnL5eVzsxJKEYDgq4N1iuf/waXj7wJazlyp5KJpIhhpcNOBrYdq54YukthniJzC2zLmn5U5/iVKmTEK2vvpkqa8R6sl08ZwHfLKmjT7WwjsZRPcGAfJXgp1g94U8M1tFzI4mO63e3x893FjJefMzHO6NcUnQ2lR5lHVA2sh+NOHH3+4rquaPYRlFG48FmH13iuivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym9YcaAtMxeEE+lss/gn0MptWfFhOdFuFMXEKc3l6q0=;
 b=QLMlk2A1p9HEO4/7bOS0iCai6Df24oiOTZVMyLVpqxZpyqCRbfAWeU2+aHNvx4cg0FTWOaejOIertrzB7sTRyLB/ZUGh9EtnobivAQgQeHoPjbcSMo3tR3a54x19WtQ2giKCoRBDdUlLO3EfUD87/qSHqoFl0/3B+KuzPxIZXJxJ1cxNdK/eMhgw3teWdFI7C7mBbswYwZLokPRZ/XsifxwrmoPA3+HD4+2PMyOw1TPbA+wOVoK2JcFN/LNsAx837xoHa+HDbmt8QI/ZD5dGZ/Nb6Cs/DMhb48VNPTju+ik4vjsuU90gKo/Js+8YfstbbC2WKWXfkYR/VgWbs+R1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym9YcaAtMxeEE+lss/gn0MptWfFhOdFuFMXEKc3l6q0=;
 b=mTaai/fH5lWKzfCjXNPaNKMprpmIZh2aY00yFF7rom6Ol9AJmipxOatCWPkpLgnkF6tzATHQ9/S+uIiUTO7te4iPfFS1/o77PMdtdxDcG16B47le2aWa5BlVRwnXv0d96fI/5k1AUNrMiYoD+WZXNCsbzA7+Sc3gZaeWxbgnC2E=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7999.apcprd03.prod.outlook.com (2603:1096:101:17d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 01:47:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 01:47:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "suijingfeng@loongson.cn"
 <suijingfeng@loongson.cn>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
Thread-Topic: [PATCH v2] drm/mediatek: Fix potential memory leak if vmap() fail
Thread-Index: AQHZsA+KVbORg+HgoUuQTPMiWGSNE6/M+HwA
Date: Thu, 27 Jul 2023 01:47:31 +0000
Message-ID: <6c639e58198680a8d2fb903bb27184bd328e2d54.camel@mediatek.com>
References: <20230706134000.130098-1-suijingfeng@loongson.cn>
In-Reply-To: <20230706134000.130098-1-suijingfeng@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7999:EE_
x-ms-office365-filtering-correlation-id: d01a8304-1469-4446-06af-08db8e437109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JhydWuyt2aWqoUjpyFHN/xt5uFEfdc04q8tk04d3F93lU7wXVVZ9Rue3NK/O6w+kZWNJINUsAdlvOa8mQa9dDm7GR3O1vMTxtgvoPmLMvbZW7hvToaLakNIXvwgX2q5s5+0omRS0QhER15F2Qw2kcvrzTUpYPLbVMrIyFp3PntZbeqApqP7+dKcsLbOQ64cTFVOZE1/npqUfSb5DB7pgfI6XbeVqlT8fLqQrfsHBoOK+K56R73G65Bq/pN2P2bJYAvG7KERMH46AMjOFzsZEQqOY8XHyaZ5rsCWnrn5EhKl5A5BRMud5GEhA2AOIjl5B9Yk47eljbn6oOE27u6xRDYiaNllLAiKOS3qpqSxOAtwKUf9DaLZn0srUlD9k0mFZL5oWdrHeA+elc6CY+sgxBL3w+67St46Vw5QgQmXkTmFk0NtOnWxBAa7B+t+DitGGHoSFR8JTFThPkeUklUiIB3PgRUalLp+zKCtuMHMq1Coo4sL7PJSY7dWx56ZsdPUiFMWEE3fjHVnotsvVKO4Yqxube2KFSIQvmGMyRPgqueGAIb8ZdbLpQHc8UUwBOiLL/qkKUF+59QgyFS98Osx4XkryhCP1i7O49zvja9vRKgR7YSJ66LauPQVmXPWcfiRJQBrTWAV8O732Y+nKjv139w0JPrHEmlKR2KOOADnEvVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(6512007)(71200400001)(6486002)(186003)(83380400001)(2616005)(85182001)(36756003)(86362001)(38070700005)(122000001)(38100700002)(6506007)(26005)(66446008)(64756008)(4326008)(2906002)(66556008)(76116006)(66476007)(66946007)(316002)(5660300002)(7416002)(41300700001)(8936002)(8676002)(478600001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGRQVjdnNkx2QndPRkEyVTgyZlpTMEVDa3ZSTWJPdkhHR3ZPSlJGdGk1V1hL?=
 =?utf-8?B?RUF3OVFRMUovZjhVVWdSZXo1RFo3TndXbG0zY0dqSnpBR2kxd05oRnBwaTRQ?=
 =?utf-8?B?aU9RZnM4K0o1RE9ZYjFLQ0RxUkVtVVVTQmR0VHFMWmNVZXJLMlRYUGtLSmJu?=
 =?utf-8?B?MCtvUmhWN1huQTQxYkZIVE5NVGtBdkhGU0lVejJ0SDNQNGlVK2JDVVB0N1hU?=
 =?utf-8?B?YWk5cFF3WUd0Y2FiL2FjVVlJeTE5eXIrVE5NcVhkekZNM200RWVSTitDamxl?=
 =?utf-8?B?MEVUTFIwekNsc1lpdnBySnhJQTNlSk94endtNVQ1M1hDZlpQaGdtL1FjM0xF?=
 =?utf-8?B?d1dwR3kzMWxRSGpUYkFwTEhMb1VQVlRLR2Z0cXNiSkpRL2pkK1hQMjQ1M0ty?=
 =?utf-8?B?K3Q4NTcyYnFkM0xFK0lqbVg5b3p1QWl5MlVrdEsvSVU3Q0twckNhMVdwVDhN?=
 =?utf-8?B?eDVtU2psb2pCTEZweGFPUmpWRDZsMTVxZUdxQlVkOWloMjB6TkVvMW9RaHRl?=
 =?utf-8?B?Z3VWYlMvQklzbWU2aldzTDFHV0JNOTZSUWZnYmlIM2ZSSk1GMjdLZDBNOHFN?=
 =?utf-8?B?Q0NiVEpPVU9yc2orYVA4aG1iVDBLWU1SY2hBdDRlN2sxR29PZHZEMUhTaTFr?=
 =?utf-8?B?RHNpMm9MWXBQUWZ3ZUg5SmQ4bk5kbXpKbC9CTmsxdFB4S1IxbDlRNExaQUIv?=
 =?utf-8?B?WnlXT2FOYzVMYWp5aFVHd0J3Q2k1Zi9Ec1VBYkNkSks0eXNMNFJ2blJFcjFm?=
 =?utf-8?B?NEhHeGtEVkgrUmtrVG50WUVFS3ZibmVMK1hxWVJlTk15aUtDdGhGdytKUXh3?=
 =?utf-8?B?TTN2NzRBaEJvRHNSR3dCd1VpeUZRWDVjdDFFR3ZYVGxxSm5lMEJ0UDFKZFl2?=
 =?utf-8?B?djc5emlxb0ZmbWJwbTNhUDZ5a0ZRN1dZSWFUd0Z0TktnRkRPMGZRRVk5NmVO?=
 =?utf-8?B?WUhpdHFwbjVOQnNMaXBEcFg4RjEybXgyTmFOL1Z2VVM3eWdZNjVuK2JNTHZQ?=
 =?utf-8?B?RWpCeDdZRFRaOFRTNFFsd0xGdWNsdStUQ1hDdUdVU01XeDhoRGhmdzJoVEF4?=
 =?utf-8?B?cEFUWXJhd0M1QVRCbXNaRGJ2b3BwR3ZjczVRbmNOU1cxcWZBNjZzUEVZMnI5?=
 =?utf-8?B?VW5wYjk5S0hVYVE0SjRhSWhPNUZIQmt5and3U0NzcWRkSzBuNVFXdE8wQkxG?=
 =?utf-8?B?c2lEdEluTG9PeHhEUWljOHpLd01Kb0NUUm1TVnlXUVVaQ2Q4M0tSeEcvM0lB?=
 =?utf-8?B?cSttOE9WTHUrT2JBOS9DTEM0cFg1NGI5WHlEd2hndkdiWHk1RDRiaEg4dnFi?=
 =?utf-8?B?YzU0TDFoSnlaUk13dWM1aEJFaS9FT1gxRDJXMEhVUkdwKzhpV2M4SzBoQmFD?=
 =?utf-8?B?VEJMTlYrTmhpRXAxcy8wVm4zOXVsaXpqWXR2VE93RVR0MzRBQ0NMRWtxRERp?=
 =?utf-8?B?emZhM0dFLyt2L21TVDZmTzBtRGFTMmVLVDlyY083aUFRTHlSNG8rSHlxYUFj?=
 =?utf-8?B?RGpPZk5iM2hsOWVsQzU0Sk95N2VqUjluQUtRRU9nTW5HdjBGQjlLeXdzQ0hE?=
 =?utf-8?B?ckYyd2V0aWNmZ1ltRmJqbHJXNGNQZVh0MEdSdmJVcG9JTjU4VHQ4ZEQvT2hz?=
 =?utf-8?B?WEQzbTJMSWl5NklRT1M3RmRhZHJ5VWJoeERvM0tLRXRmMTRoT2VXRlkwb3Rw?=
 =?utf-8?B?Z2Z3ZDBUS3loazA5WEhISWNNV0kwc0YwclRPY0pNVnMvSXpEMStza3g3Y3Jt?=
 =?utf-8?B?aEJVcWdpTC83TTdUcTh4bXlxQXJRV2JPTVI0WHZhNVNZcy9qc3llaVdOU1RH?=
 =?utf-8?B?dkZMT2hLNHBkKzdhK01wZXdFMXlYMjBvMWVKdWxjelZoVjdOZXhzNDFWbmpJ?=
 =?utf-8?B?cVBCVHVVbGdCSFlRK1RRQkdDdGZWblVDR0NUaW1jTGpRZkVsYjRZdGZUYTlo?=
 =?utf-8?B?RXdHWUs4OFdOYld3ZWNGZ1hTdFk1ZUpWZGliVXVWcllRbzdrbDRPY1NtL0cy?=
 =?utf-8?B?MVN0VHQ3RWN6dktkbWVBQlBpMEJyVTl2S3p1RVhCLzJDc1FkWXB1MTJFYzhW?=
 =?utf-8?B?bHJtZ3J5SGE5cXp4NG9td3BEZnpQRlhlM1JxVE1QUnEyTVBkK2I3VVpDVmVq?=
 =?utf-8?B?STBVSmVYemp2UHh0dHdQSUtyaEZqcVJGTVhYbDJqcU9KM2RXcVQ4bGVOWS9J?=
 =?utf-8?B?MGc9PQ==?=
Content-ID: <BD3220012A6AD64789DF26A033AE7D3F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01a8304-1469-4446-06af-08db8e437109
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 01:47:31.2931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEl0BPm6qI9LAjz/ZhCdpSTsXSCpAnJ8WjWhtgXzCOGh8ccySpK/OoUdtHbyxv8L934kJWnJ9XCwZzIvCK2KaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7999
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1102649006.404076733"
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
Cc: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1102649006.404076733
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmluZ2Zlbmc6DQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA3LTA2JiMz
MjthdCYjMzI7MjE6NDAmIzMyOyswODAwLCYjMzI7U3VpJiMzMjtKaW5nZmVuZyYjMzI7d3JvdGU6
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzom
IzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7
b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMy
O3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4N
CiZndDsmIzMyOyYjMzI7QWxzbyYjMzI7cmV0dXJuJiMzMjstRU5PTUVNJiMzMjtpZiYjMzI7c3Vj
aCYjMzI7YSYjMzI7ZmFpbHVyZSYjMzI7aGFwcGVucywmIzMyO3RoZSYjMzI7aW1wbGVtZW50JiMz
MjtzaG91bGQNCiZndDsmIzMyO3Rha2UNCiZndDsmIzMyO3Jlc3BvbnNpYmlsaXR5JiMzMjtmb3Im
IzMyO3RoZSYjMzI7ZXJyb3ImIzMyO2hhbmRsaW5nLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMz
MjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtGaXhlczomIzMyOzNkZjY0ZDdiMGE0ZiYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0lt
cGxlbWVudCYjMzI7Z2VtJiMzMjtwcmltZSYjMzI7dm1hcC92dW5tYXANCiZndDsmIzMyO2Z1bmN0
aW9uJnF1b3Q7KQ0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtNYXR0aGlhcyYjMzI7QnJ1Z2dl
ciYjMzI7Jmx0O21hdHRoaWFzLmJnZ0BnbWFpbC5jb20mZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdlZC1i
eTomIzMyO0FsZXhhbmRyZSYjMzI7TWVyZ25hdCYjMzI7Jmx0O2FtZXJnbmF0QGJheWxpYnJlLmNv
bSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTdWkmIzMyO0ppbmdmZW5nJiMzMjsm
bHQ7c3VpamluZ2ZlbmdAbG9vbmdzb24uY24mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMmIzMyO3wmIzMyOzYmIzMy
OysrKysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NSYjMzI7
aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQom
Z3Q7JiMzMjtpbmRleCYjMzI7YTI1YjI4ZDNlZTkwLi45ZjM2NGRmNTI0NzgmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5j
DQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2Vt
LmMNCiZndDsmIzMyO0BAJiMzMjstMjQ3LDcmIzMyOysyNDcsMTEmIzMyO0BAJiMzMjtpbnQmIzMy
O210a19kcm1fZ2VtX3ByaW1lX3ZtYXAoc3RydWN0JiMzMjtkcm1fZ2VtX29iamVjdA0KJmd0OyYj
MzI7Km9iaiwmIzMyO3N0cnVjdCYjMzI7aW9zeXNfbWFwJiMzMjsqbWFwKQ0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOyYjMzI7bXRrX2dlbS0mZ3Q7a3ZhZGRyJiMzMjs9JiMzMjt2bWFwKG10a19n
ZW0tJmd0O3BhZ2VzLCYjMzI7bnBhZ2VzLCYjMzI7Vk1fTUFQLA0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3BncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9L
RVJORUwpKTsNCiZndDsmIzMyOy0NCiZndDsmIzMyOytpZiYjMzI7KCFtdGtfZ2VtLSZndDtrdmFk
ZHIpJiMzMjt7DQomZ3Q7JiMzMjsra2ZyZWUoc2d0KTsNCiZndDsmIzMyOytrZnJlZShtdGtfZ2Vt
LSZndDtwYWdlcyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjstRU5PTUVNOw0KJmd0OyYjMzI7K30N
CiZndDsmIzMyOyYjMzI7b3V0Og0KJmd0OyYjMzI7JiMzMjtrZnJlZShzZ3QpOw0KJmd0OyYjMzI7
JiMzMjtpb3N5c19tYXBfc2V0X3ZhZGRyKG1hcCwmIzMyO210a19nZW0tJmd0O2t2YWRkcik7DQom
Z3Q7JiMzMjstLSYjMzI7DQomZ3Q7JiMzMjsyLjM0LjENCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1102649006.404076733
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEppbmdmZW5nOg0KDQpPbiBUaHUsIDIwMjMtMDctMDYgYXQgMjE6NDAgKzA4MDAsIFN1aSBK
aW5nZmVuZyB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBbHNvIHJldHVybiAtRU5PTUVNIGlmIHN1
Y2ggYSBmYWlsdXJlIGhhcHBlbnMsIHRoZSBpbXBsZW1lbnQgc2hvdWxkDQo+IHRha2UNCj4gcmVz
cG9uc2liaWxpdHkgZm9yIHRoZSBlcnJvciBoYW5kbGluZy4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAzZGY2NGQ3YjBhNGYgKCJkcm0v
bWVkaWF0ZWs6IEltcGxlbWVudCBnZW0gcHJpbWUgdm1hcC92dW5tYXANCj4gZnVuY3Rpb24iKQ0K
PiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBNZXJnbmF0IDxhbWVyZ25hdEBiYXlsaWJyZS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgfCA2ICsr
KysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCj4gaW5kZXggYTI1
YjI4ZDNlZTkwLi45ZjM2NGRmNTI0NzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2dlbS5jDQo+IEBAIC0yNDcsNyArMjQ3LDExIEBAIGludCBtdGtfZHJtX2dlbV9wcmlt
ZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdA0KPiAqb2JqLCBzdHJ1Y3QgaW9zeXNfbWFwICpt
YXApDQo+ICANCj4gIAltdGtfZ2VtLT5rdmFkZHIgPSB2bWFwKG10a19nZW0tPnBhZ2VzLCBucGFn
ZXMsIFZNX01BUCwNCj4gIAkJCSAgICAgICBwZ3Byb3Rfd3JpdGVjb21iaW5lKFBBR0VfS0VSTkVM
KSk7DQo+IC0NCj4gKwlpZiAoIW10a19nZW0tPmt2YWRkcikgew0KPiArCQlrZnJlZShzZ3QpOw0K
PiArCQlrZnJlZShtdGtfZ2VtLT5wYWdlcyk7DQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArCX0N
Cj4gIG91dDoNCj4gIAlrZnJlZShzZ3QpOw0KPiAgCWlvc3lzX21hcF9zZXRfdmFkZHIobWFwLCBt
dGtfZ2VtLT5rdmFkZHIpOw0KPiAtLSANCj4gMi4zNC4xDQo=

--__=_Part_Boundary_001_1102649006.404076733--

