Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014F7BB20C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0078410E20C;
	Fri,  6 Oct 2023 07:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB19910E20C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:15:50 +0000 (UTC)
X-UUID: 2a716aec641811eea33bb35ae8d461a2-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=UBZjvN4Z2ZpzBlxr6JnAcEiYGW0O1Txolrk2ol6oH5c=; 
 b=sUiv4CmcMWxReq+KXZpydMxqjLcrKsXw3Do/kvfdYsljod0IKZ+ywAbcCwZFgcQO912F9VJaLYXthGKsXU5qaNTwPGnx+odohnsbr3nzY5THSrKeyNa7C3DhKmF2+O+SrDj5D1BfJsX3vGzx0BNM5znSgB5zrnJn4mAMwkyxizE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:fca2ae84-aa1f-4241-9c9a-f1390d726655, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:219b82f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2a716aec641811eea33bb35ae8d461a2-20231006
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1109097178; Fri, 06 Oct 2023 15:15:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:15:43 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:15:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxK+l8imy7EIJxk+tUtd7db4j4koiexC9JCfn8DhV04juCR8dxUTbW6yX3y0lilnZ8SsBdwfqnCJ5ca/whlpB39ti/M36cm+FgdEAN9LjRRE6dvaS913sPoTICnquuqifN/bnvJgprQ0bgNyTQGXFAfOiZ5kBdeIreW2s3/NokTw7TSJShs3FyquIIloCLPLkChBnQsxEYr6oHIWrlGWBYRUs1yWP2jxh/xCwOmJJ4+Vh3nFc3wxJ31RVRWsXJPHieX69KMunFlQlqIuWdfRdFvSl3Cb1VMPc+hekPVnuIO7FydiazQhgBLvZGgAa01/R4CMBwhL0E49nka23Sf0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPRpAVlv0j6EuthApOy3r9m24sfbGeZ3VShDEECtjeY=;
 b=SM/ofWZLotp1J6X+RmWi+RSpwrhLb+F1yf3LVNZ5kSf9gvWUuKJyXjgKGM6WvGQksNF7jdrT/429t2sPFBYqqF1xgkZ38a+Eb+SBIPqe3alP+YjUQOakagvstNcZIJo6uHyR8Au2e2/V2r7HrbpgJt956w+95J4u95U9Ot0wc7QUdaf0ybtCUbiM57iYI7py6CHmeTMV4UqQNy/ESuUWZdjsnW+CRt3xYkmm4qt+N3FRdoxLHH+3tZZsVcaMzU89l+/BA8vDBk49tteAwbzIEHPrKOf/0kiERh7vCiga2uplYjvlBZDHqnfJ9I1+oyrdsiQyeGsMnDD/fA/mYTal+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPRpAVlv0j6EuthApOy3r9m24sfbGeZ3VShDEECtjeY=;
 b=C3w4w8e10X1xko7RasAfxDlxDQjSlq5ILiVkIfus+BvN7DGeGG3TVHXSns7q6StUGd5DeyTyita/hlw6bNjdgHKLBizqyfRIaRjGZZM0AjKdiRfzJdqSDRDW9KGOCFT7TU8b+c9qDX2WugiDzdp0GlvuMf90y0jEmYgJahHDH5M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB5858.apcprd03.prod.outlook.com (2603:1096:4:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 07:15:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 07:15:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 4/9] drm/mediatek: Add encoder_index interface for
 mtk_ddp_comp_funcs
Thread-Topic: [PATCH v11 4/9] drm/mediatek: Add encoder_index interface for
 mtk_ddp_comp_funcs
Thread-Index: AQHZ9mw/NyY62LReaUqm5D1KavECPrA8XPoA
Date: Fri, 6 Oct 2023 07:15:41 +0000
Message-ID: <e1f306995937bf1fdbcee8d4d0875062d21cffa0.camel@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
 <20231004024013.18956-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20231004024013.18956-5-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB5858:EE_
x-ms-office365-filtering-correlation-id: b2a55a01-68c8-401d-eea5-08dbc63c0c5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JsrJY2u5mJwddpUSXuLHQxE/XjYDWc1qsNpDf2A2SyKaFol/Zx5n9saEDcOkuJ9R0rmLHdV7ASGEJtvVWRd0PurI2RtO1eFfzAr7UwQP03QU83xOV28WBLY9o0NCRCRMhBBC3kSBJI7wtZ8luKp5RbwMV2J/obeFur8G62P0zqch+NtXz+UNmBxhKitZAii8PEHijkGWOt14V/vXPIiQmiershDJk9b2GPWVYVuTfMM6wvO2B9uX3m1DwYr/qxqK9HDtfFiqNjcIhq8crQY/c62Um8v/ibnGLG61fTNjCnj0U8Lqpq00AH5Sa4f6Q0nYkg6uJvdFBjpQlraWkVN7zpjx36GtFVtDNNaE4U6lkpBhfa4VC8BjlWlsYVzOgNCi3/AVuGTBWYN10oMWs+E+bAlYxXRmTlI7Il6XRhEAt3HMntuETnBipgsc4Bm1sle21gQRC9k1N+rQVfih4Q+rpNE1ljkj2JHFhJuTwoIy3zJvrEo99wLKLKVDZZZS0OL5kZwfJXe0AMagLpReXadUnhUvxdHfq8Dm762dHzaBjTuoI3r4NJfLDfbUiIDw+ANyPQIUul0lVuYHXl4CWtZnnEuzy0IEgtv+n4yqGOYLjYebULBOYa0kK+hxudEHDCMXiG4RsiiWyGB1wmnTosWTos9Loz+vyDjAq0j+J5kMvIk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(71200400001)(26005)(6486002)(6506007)(6512007)(478600001)(110136005)(76116006)(316002)(4326008)(41300700001)(8936002)(66946007)(66446008)(8676002)(64756008)(66556008)(66476007)(2616005)(54906003)(5660300002)(122000001)(2906002)(38070700005)(38100700002)(36756003)(85182001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3dINkUzL2hwdS9XQXZwQXNnSWo4a0lHVUpCNk5SUjJYNEVnQVlacFY1SDE2?=
 =?utf-8?B?Nm9HSysydGFXUWdyd0lZOFJYaTVHSkxsbVUrNzVyV1BXRWtrc2FkbEZoY0cr?=
 =?utf-8?B?dDBYUm9nNTVlWlIzYSs5VnpQZjVCTXMvamNvZ0F2SkZrMmNzVTVpVFhTY0VQ?=
 =?utf-8?B?SGoyc2tNMHBKTEZpUCsvcXE2MTE5NitWVm1NL2pWcHB3eFNBK3FudG5VK3lB?=
 =?utf-8?B?UHhxVi9hQzRFbkFBNDJadVh0Uno4b3grTElzQm02OGRkcC9rYnNjWEdyM0li?=
 =?utf-8?B?SlFvUEdkNWRLL2owdlc0VmE0M3RLeGMxc2ExempOSEdlSFFlNkt5VWVvNlVv?=
 =?utf-8?B?QlJINmJVdGd6dXJ3NFEwRDM1RXFwMFN2bmx3ZEZYdkZKSGdyZ1IwdHMyWWNG?=
 =?utf-8?B?SS9GZlBBY2FLT2pqQjVDNGpCYVU2eDM2NG1LNlgrT3NjWmZkTXY1aWtuZzNn?=
 =?utf-8?B?UDFHeWNJaFRZT0VCa01vd2JFMUU1MDFFMm50TE9ocmpNS1JwMy9TNmtNdThm?=
 =?utf-8?B?MUwwWGJrWXlvRnN6KytUUm5Ba1VHcHB4UEFLYlFmOEFNMmxWVzlnNVlYeHJV?=
 =?utf-8?B?dDBzSnpaOG9lVmxhQnBNQnpLTGN6UjdwNUlFY1FtZitWRHpNdnllSXh6VGVL?=
 =?utf-8?B?MUNsNkhKaXhzcnlVNXJiRVFZU0xaM3hoOUdrVWQ3M3NPNXFFcHlMR2Z1YkpZ?=
 =?utf-8?B?TmZ0MUtVS3JVOGlRSGhNU055NGc4UFdZdk9hY2U4a0xHLzJxK0pPVjNTYlln?=
 =?utf-8?B?aE5uVFUwUHFKQitLajJIRmVmMmkyVzR3cGQycVhIV3FaYXM1MUFaL0MvNjJu?=
 =?utf-8?B?UkNMcjRrcEpFeUYzV25SSzM2bE1DN21xeHpwNzlqQ25tM2kwaDhIRktveEQ1?=
 =?utf-8?B?TnRvVE1uREhxNkdqVVBaWDRUYzFVSmptczZ4cU93bllicDQ4T2tVRHJ4OEZv?=
 =?utf-8?B?Z0dyTy91UUdJZHNqTE02Q1dNSEtLZzBXaGNOT1UwMFMzTHhEc000TmhicEll?=
 =?utf-8?B?dlVkRHE5UElvUEc5QkxnbWFuUW5YbVlrSWg2d1FDbC9TRHE5dHY5Q2xWUFRi?=
 =?utf-8?B?RVRnWlREbjBHbml6bzBsMjVMK2FSTUdVNzd6ME9mN3o2WVBHVDhPL2RYbnl2?=
 =?utf-8?B?VUpwTXZKbmVYeERuU0FaMVFJY2dRSU1FT1k4MHdpak1sS0hnYXdZVjB3aits?=
 =?utf-8?B?NDFSRGJzWWJuS3h0dVpacHlmSnNsT3FkNWNvSldyZDBOUTBMUG9iKzdSTlhE?=
 =?utf-8?B?N0gwajRQNW1vQmtsRUVaZlBBcWlyNGRpWjNremVBWC9NOHNqRjlVY1NWcnJu?=
 =?utf-8?B?RkNMTzdENlFZSVdSSzVMaUNzcmI5K09hL3lvZEJrejd6c09vRjh1TTlCV3Zm?=
 =?utf-8?B?TkdZenZmMFlUQ0dzTHJiOEcwY25CUkQrdDRncEpSTHBhZWQrY3l2UlJjbUVK?=
 =?utf-8?B?KzZSb2Q0QVZHd2ZxdmFUV1NtL0J1RDNMWlpoQlF1d2Y3KysxSmppTkpjZHpl?=
 =?utf-8?B?bGNPcHdqazdUdW9HS2tKdjBrQWNFelNocFZ6NlRXRzVLV2hlL25nNXN1YzEz?=
 =?utf-8?B?N2x6ZW83SWZlUmI0eWVuODQ0Z1YvNFprWUphUzFrKy80YU0zUlE0UFRTeFRa?=
 =?utf-8?B?b0ZxUmgzdVhXU0U1dUxwdVVyR1hwbGQ2WlgyNGRVRXFaK3NBNUJUOFNUUEhE?=
 =?utf-8?B?SXZvdkgxUCsxR3A0NEZBOStJWVJZZXpsTURhUzdiQ3JvczZwbmQzU3dqRS8r?=
 =?utf-8?B?OC9QMnVDNWxONTdPd1hpQ01jRG04bTdmUmkyT2VLNzdWN3NtTzh4ZmUweU9l?=
 =?utf-8?B?NGxwcnZYQXUvbUxqUUttOVFtdkhzNHVrNzRpaVJndUVhdXk3K09TNUUwcXpl?=
 =?utf-8?B?d0tDMWJUTHh0akY5UEd3ZkVVOE1hTUl1STBsL1JlMkpqWlJDU0dxN1VNb3ds?=
 =?utf-8?B?YnVpSUVhT3BDYkE1UGNHZnhodFFDMUxSNXM4d21YNlZwdlNLdUJKd1BGempa?=
 =?utf-8?B?dlJBSXB1TlhrblF0bEtSYUorajRUM2d5Kyt6R0NkejJKL0hIcTBwSzMwbjRX?=
 =?utf-8?B?OFc1b2dLR09KOHVVOHJ2clMxeDd3ZGJrNElWZEhOTVBudWMxcjJ5ZVFCM2V3?=
 =?utf-8?Q?XOtLI5KjsmqdVMhla7NRj73k6?=
Content-ID: <FA6509FDB96FE347B409325D5B0C602C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a55a01-68c8-401d-eea5-08dbc63c0c5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 07:15:41.0689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 309rGR4YxLwE7253X4EP2cqvlFK8g7fqMFx7Z5rS3Q5faK9Ih7Tzi8xlFdY5/y5WkzTl0VBteImurgxPCjCnFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5858
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_945369372.981039482"
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_945369372.981039482
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTEwLTA0JiMzMjth
dCYjMzI7MTA6NDAmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO1RvJiMzMjtzdXBwb3J0JiMzMjtkeW5hbWljJiMzMjtjb25uZWN0b3ImIzMyO3NlbGVjdGlv
biYjMzI7ZnVuY3Rpb24sJiMzMjtlYWNoJiMzMjtkZHBfY29tcCYjMzI7bmVlZA0KJmd0OyYjMzI7
dG8NCiZndDsmIzMyO2dldCYjMzI7dGhlaXImIzMyO2VuY29kZXJfaW5kZXgmIzMyO3RvJiMzMjtp
ZGVudGlmeSYjMzI7d2hpY2gmIzMyO2Nvbm5lY3RvciYjMzI7c2hvdWxkJiMzMjtiZQ0KJmd0OyYj
MzI7c2VsZWN0ZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0FkZCYjMzI7ZW5jb2Rlcl9pbmRleCYj
MzI7aW50ZXJmYWNlJiMzMjtmb3ImIzMyO210a19kZHBfY29tcF9mdW5jcyYjMzI7dG8mIzMyO2dl
dCYjMzI7dGhlJiMzMjtlbmNvZGVyDQomZ3Q7JiMzMjtpZGVudGlmaWVyJiMzMjtieSYjMzI7ZHJt
X2VuY29kZXJfaW5kZXgoKS4NCiZndDsmIzMyO1RoZW4mIzMyO2RybSYjMzI7ZHJpdmVyJiMzMjt3
aWxsJiMzMjtjYWxsJiMzMjttdGtfZGRwX2NvbXBfZW5jb2Rlcl9pbmRleF9zZXQoKSYjMzI7dG8m
IzMyO3N0b3JlDQomZ3Q7JiMzMjt0aGUNCiZndDsmIzMyO2VuY29kZXJfaW5kZXgmIzMyO3RvJiMz
MjtlYWNoJiMzMjtkZHBfY29tcCYjMzI7aW4mIzMyO2Nvbm5lY3RvciYjMzI7cm91dGVzLg0KDQpS
ZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsN
Cg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMz
MjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5
OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYj
MzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmgmIzMyO3wmIzMyOzgmIzMyOysrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUm
IzMyO2NoYW5nZWQsJiMzMjs4JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmgNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuaA0KJmd0OyYjMzI7aW5kZXgmIzMyO2ZlYmNhZWVmMTZhMS4uMDc5N2IzYWM3NWQ4JiMz
MjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuaA0KJmd0OyYjMzI7QEAmIzMyOy04MCwxMiYjMzI7KzgwLDE0
JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfZGRwX2NvbXBfZnVuY3MmIzMyO3sNCiZndDsmIzMy
OyYjMzI7dm9pZCYjMzI7KCpkaXNjb25uZWN0KShzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwm
IzMyO3N0cnVjdCYjMzI7ZGV2aWNlDQomZ3Q7JiMzMjsqbW1zeXNfZGV2LCYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7bmV4dCk7DQomZ3Q7JiMzMjsmIzMyO3ZvaWQmIzMyOygqYWRkKShzdHJ1Y3Qm
IzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7bXRrX211dGV4JiMzMjsqbXV0ZXgp
Ow0KJmd0OyYjMzI7JiMzMjt2b2lkJiMzMjsoKnJlbW92ZSkoc3RydWN0JiMzMjtkZXZpY2UmIzMy
OypkZXYsJiMzMjtzdHJ1Y3QmIzMyO210a19tdXRleCYjMzI7Km11dGV4KTsNCiZndDsmIzMyOyt1
bnNpZ25lZCYjMzI7aW50JiMzMjsoKmVuY29kZXJfaW5kZXgpKHN0cnVjdCYjMzI7ZGV2aWNlJiMz
MjsqZGV2KTsNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMy
O3N0cnVjdCYjMzI7bXRrX2RkcF9jb21wJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
ZGV2aWNlJiMzMjsqZGV2Ow0KJmd0OyYjMzI7JiMzMjtpbnQmIzMyO2lycTsNCiZndDsmIzMyOyYj
MzI7dW5zaWduZWQmIzMyO2ludCYjMzI7aWQ7DQomZ3Q7JiMzMjsraW50JiMzMjtlbmNvZGVyX2lu
ZGV4Ow0KJmd0OyYjMzI7JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZGRwX2NvbXBfZnVu
Y3MmIzMyOypmdW5jczsNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjtAQCYjMzI7LTI3NSw2JiMzMjsrMjc3LDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbmxpbmUm
IzMyO2Jvb2wNCiZndDsmIzMyO210a19kZHBfY29tcF9kaXNjb25uZWN0KHN0cnVjdCYjMzI7bXRr
X2RkcF9jb21wJiMzMjsqY29tcCwmIzMyO3N0cnVjdCYjMzI7ZGV2DQomZ3Q7JiMzMjsmIzMyO3Jl
dHVybiYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMz
Mjsrc3RhdGljJiMzMjtpbmxpbmUmIzMyO3ZvaWQmIzMyO210a19kZHBfY29tcF9lbmNvZGVyX2lu
ZGV4X3NldChzdHJ1Y3QNCiZndDsmIzMyO210a19kZHBfY29tcCYjMzI7KmNvbXApDQomZ3Q7JiMz
Mjsrew0KJmd0OyYjMzI7K2lmJiMzMjsoY29tcC0mZ3Q7ZnVuY3MmIzMyOyZhbXA7JmFtcDsmIzMy
O2NvbXAtJmd0O2Z1bmNzLSZndDtlbmNvZGVyX2luZGV4KQ0KJmd0OyYjMzI7K2NvbXAtJmd0O2Vu
Y29kZXJfaW5kZXgmIzMyOz0mIzMyOyhpbnQpY29tcC0mZ3Q7ZnVuY3MtDQomZ3Q7JiMzMjsmZ3Q7
ZW5jb2Rlcl9pbmRleChjb21wLSZndDtkZXYpOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZn
dDsmIzMyOyYjMzI7aW50JiMzMjttdGtfZGRwX2NvbXBfZ2V0X2lkKHN0cnVjdCYjMzI7ZGV2aWNl
X25vZGUmIzMyOypub2RlLA0KJmd0OyYjMzI7JiMzMjtlbnVtJiMzMjttdGtfZGRwX2NvbXBfdHlw
ZSYjMzI7Y29tcF90eXBlKTsNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7bXRr
X2RybV9maW5kX3Bvc3NpYmxlX2NydGNfYnlfY29tcChzdHJ1Y3QmIzMyO2RybV9kZXZpY2UNCiZn
dDsmIzMyOypkcm0sDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioq
KioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioq
KioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGlu
Y2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRh
cnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRl
ciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0
byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0K
ZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQo
cykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBh
cmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSAN
CnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCks
IGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K
PC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_945369372.981039482
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMTAtMDQgYXQgMTA6NDAgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVG8gc3VwcG9ydCBkeW5hbWljIGNvbm5lY3RvciBzZWxlY3Rpb24gZnVu
Y3Rpb24sIGVhY2ggZGRwX2NvbXAgbmVlZA0KPiB0bw0KPiBnZXQgdGhlaXIgZW5jb2Rlcl9pbmRl
eCB0byBpZGVudGlmeSB3aGljaCBjb25uZWN0b3Igc2hvdWxkIGJlDQo+IHNlbGVjdGVkLg0KPiAN
Cj4gQWRkIGVuY29kZXJfaW5kZXggaW50ZXJmYWNlIGZvciBtdGtfZGRwX2NvbXBfZnVuY3MgdG8g
Z2V0IHRoZSBlbmNvZGVyDQo+IGlkZW50aWZpZXIgYnkgZHJtX2VuY29kZXJfaW5kZXgoKS4NCj4g
VGhlbiBkcm0gZHJpdmVyIHdpbGwgY2FsbCBtdGtfZGRwX2NvbXBfZW5jb2Rlcl9pbmRleF9zZXQo
KSB0byBzdG9yZQ0KPiB0aGUNCj4gZW5jb2Rlcl9pbmRleCB0byBlYWNoIGRkcF9jb21wIGluIGNv
bm5lY3RvciByb3V0ZXMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgOCArKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oDQo+IGluZGV4IGZlYmNhZWVmMTZhMS4uMDc5
N2IzYWM3NWQ4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmgNCj4gQEAgLTgwLDEyICs4MCwxNCBAQCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1bmNz
IHsNCj4gIAl2b2lkICgqZGlzY29ubmVjdCkoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
aWNlDQo+ICptbXN5c19kZXYsIHVuc2lnbmVkIGludCBuZXh0KTsNCj4gIAl2b2lkICgqYWRkKShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdGtfbXV0ZXggKm11dGV4KTsNCj4gIAl2b2lkICgq
cmVtb3ZlKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdGtfbXV0ZXggKm11dGV4KTsNCj4g
Kwl1bnNpZ25lZCBpbnQgKCplbmNvZGVyX2luZGV4KShzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiAg
fTsNCj4gIA0KPiAgc3RydWN0IG10a19kZHBfY29tcCB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2
Ow0KPiAgCWludCBpcnE7DQo+ICAJdW5zaWduZWQgaW50IGlkOw0KPiArCWludCBlbmNvZGVyX2lu
ZGV4Ow0KPiAgCWNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgKmZ1bmNzOw0KPiAgfTsN
Cj4gIA0KPiBAQCAtMjc1LDYgKzI3NywxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wNCj4gbXRrX2Rk
cF9jb21wX2Rpc2Nvbm5lY3Qoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgc3RydWN0IGRldg0K
PiAgCXJldHVybiBmYWxzZTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGlubGluZSB2b2lkIG10a19k
ZHBfY29tcF9lbmNvZGVyX2luZGV4X3NldChzdHJ1Y3QNCj4gbXRrX2RkcF9jb21wICpjb21wKQ0K
PiArew0KPiArCWlmIChjb21wLT5mdW5jcyAmJiBjb21wLT5mdW5jcy0+ZW5jb2Rlcl9pbmRleCkN
Cj4gKwkJY29tcC0+ZW5jb2Rlcl9pbmRleCA9IChpbnQpY29tcC0+ZnVuY3MtDQo+ID5lbmNvZGVy
X2luZGV4KGNvbXAtPmRldik7DQo+ICt9DQo+ICsNCj4gIGludCBtdGtfZGRwX2NvbXBfZ2V0X2lk
KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwNCj4gIAkJCWVudW0gbXRrX2RkcF9jb21wX3R5cGUg
Y29tcF90eXBlKTsNCj4gIHVuc2lnbmVkIGludCBtdGtfZHJtX2ZpbmRfcG9zc2libGVfY3J0Y19i
eV9jb21wKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkcm0sDQo=

--__=_Part_Boundary_002_945369372.981039482--

