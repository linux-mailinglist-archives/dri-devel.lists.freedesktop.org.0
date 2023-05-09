Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85606FC997
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01CC88867;
	Tue,  9 May 2023 14:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CAB10E386
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:53:57 +0000 (UTC)
X-UUID: 4e6e8494ee7911edb20a276fd37b9834-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=35ATf1xiH38iyd4fz7j06gW7SKWF6ouKCaURehDNDKg=; 
 b=F2lPc5ZP3nw3igrbe22RnsuqMpUDasWROTVeLfaTx2rD4ZeQJB4DFnFtJUX4Yi7q4rTjL3yvhCHUT0EWruFtH50Ou4nnqCbQf75Kz9dV55/BflXwU9f0XrVhmDshdBMV0RDTk1oHiLrvRbECv7ibges08Lg6AbKyhsAEQ/Oj0kE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:454b514b-a572-46cb-9b44-69cc6e11c9a1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:178d4d4, CLOUDID:4807426b-2f20-4998-991c-3b78627e4938,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 4e6e8494ee7911edb20a276fd37b9834-20230509
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 437683257; Tue, 09 May 2023 22:53:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:53:48 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:53:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCkVYUj9gsdBe+aHmyGuGUaQ/UbND9L7TFsijAkn0eRz0vFyRkHjKGVHQs+N33KwjFpIvgdzbiMCWU2m/7DGU6C9dMXPZOcbXP4QmdoWkVkPVTuh8kgsh2JMmk8Z6H4L9Ayy/WmUJTtxBXv0x1rcdBQ/KTKMxCgVaANMOJxf6Cq9YVpYihRdow0hTt6RCeQIMqdJU4Z+2H6rCQS7547ceqNzH4ek+GQAIXlbDm9MnFsZH5ryz1d2j3oGXeoEsLbseG+YmonJU9hvVcbwohZt+6GcSKmMKa6VfnGD+q7BXC6r5R2v1b1a4DqoBK1GLoANLtp48U0boNCTyoxtI3BNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHxLVPqeaIuocbSV8Cd4w0gqhd5gOpawunFhY3yOI5U=;
 b=P8wUZYJtISUxA8E2oPNuAkynGr+gnmpMSqOMPDj0zHX4yEcRCS7tTbGG1Kt0UMTMaEYsjp7jAB397Y1AIZDiVk9hP3kMGGE53qIHGtRxEeep19uIgFHnQdcigiyT7nnHBWl0ICBfQf3yeZcImPNqRfWgn9SEIenPSx7ngubvfYBvlJMOZZctG8gIzYQVAqLrqCds9bSPK2Mhsa9vLc7/GldTjLWStp5LBuIt/8+aKcUWYWY3f3+A7gMETTwsFMvEQZ3Ih3BTsXxkLHqZ4+5kT3mKifC75SeNWS4lj4NYNOh4oGbK/3RV8FED70KAjLq4vFf0HwIaZV/NN1CFmk+kVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHxLVPqeaIuocbSV8Cd4w0gqhd5gOpawunFhY3yOI5U=;
 b=G3fkB/Swik5xBtxjs2s8KOdT/1xokkr25rxBOS58W6U9etLJcT5NjRt6Dc8uPI9ta+MYXwJfiUhlbefJhLPhSaIwLetkxh48KvZp+ws+6E0aBgH3SWflEr0jnkUZMSaawP7i0WdX0r4muYq+Eu0FkZY6K9PLCb+e5HqCh1phkhc=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by JH0PR03MB7982.apcprd03.prod.outlook.com (2603:1096:990:36::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:53:44 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:53:44 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 11/11] drm/mediatek: gamma: Program gamma LUT type for
 descending or rising
Thread-Topic: [PATCH v3 11/11] drm/mediatek: gamma: Program gamma LUT type for
 descending or rising
Thread-Index: AQHZgBeboB+qwlQES0KGw/L3oFBzsa9SC+mA
Date: Tue, 9 May 2023 14:53:44 +0000
Message-ID: <67977ed39a850f3ad7338265dbad5dcc5ac63f01.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
 <20230506123549.101727-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-12-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|JH0PR03MB7982:EE_
x-ms-office365-filtering-correlation-id: 5c88f9ab-f045-4c54-b521-08db509d2f99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3DkBMOLqSGsL193+hqlQY/oGs+OOCBjdkZSY2HKPT3gaKV4mEuXU1b4FFXFGUPAOMmlkup42x2WEMgNvqLHJF0Yc0nNGuPVraX9Hk0uwJOE19IejilnL9IMctG6bGOHHXeuisE80cd3PUT23xolLOTpmmOyACcfuYcOxnx+cx9ri0+uhfc7x1f9IxP3l+zLCgFnTesDVOLrTfWcfpjRAnekaC5wO7RgDC6dXvF9jzfgfSTOzZT6CR7IKXrBeB3Dghgt9brXswyh0P1/Cn6Jn8Jawi+Fl4WeiT5mRv+k1cQWveHfhAnZbHokq2Ox8afZ6xsV9beuB6yvFpRjNChBp9TZcuInng3+9mPmby+sVqf66eQnkAX/YJEyMLqn4Fwieww2RSoUJyu7ssxmqhU1G51VBzxT7g3CcPxqqyKeuNaG/Sipad/qG6X4vmurSD14L6RCDDmcPf3mUOoXuaNl58Ib5EBd9AmsyAetpZJPFW401MyCS/tsuSe3rYMU/T0Z2sEcoBI8PSA6Ntm4aNp/Bsu9Ubv6t5Og3sqoMeqm35MIEGlN/BAbDM9pTRY5SUhljVE6IdWlBVYCYMQflXYRj3Vd1MK++1Gat4edoAjzkJJOFgXU/LDVcdlwQ4rrOb3i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(36756003)(316002)(478600001)(66556008)(83380400001)(91956017)(66446008)(66946007)(64756008)(66476007)(4326008)(76116006)(6486002)(2616005)(54906003)(71200400001)(6506007)(6512007)(26005)(110136005)(186003)(4744005)(86362001)(2906002)(85182001)(41300700001)(122000001)(5660300002)(8676002)(38100700002)(8936002)(38070700005)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRnSmZnOWg1VVdmTytWRlpxWUZCRU5NQWZxSjZJYjdDaTRJUGhSR1dteHhn?=
 =?utf-8?B?RC82cDh0dEZoeFNLdWE3TkR4WGZCT2t2T3ZVQkZhVHF5a3pLamRiZWJQVXRH?=
 =?utf-8?B?RkR6Sk9abTlZRm11dHQwYmI1NnA1QXpzalloVVZPR3FUSElYdnNUM0FUU1VJ?=
 =?utf-8?B?eXVuV1NMSWIxNFlkeVAxVXV4djVkTnlaVzRjZWdVUy9JT0tWR0EvcnJaMTdW?=
 =?utf-8?B?M3NPWHR0aitkN2tYQ3VSRWpYODlaa0h5N2lwYmVQaExyYlRpa1hBQXlBUGZz?=
 =?utf-8?B?VC9XWk1hNzBhWUhabWxvWi9GRExTTmpHRlJZYzdncVFKanNOckhUSXh4Smxq?=
 =?utf-8?B?RW82cXBycUhGUHlEWENaWDR6alZQaXZzN3RKU1pKK3BCVDVBTUx6dTFnNmV0?=
 =?utf-8?B?WSs0emNwNGNNMG9lYU1wY09jc2JuKy9KUFRqTEE5RVhKdFIxb1R6VzNsWURZ?=
 =?utf-8?B?cFJ6OE9MVWxpTnNJbFRLcFFkWGZiVVpvVVZlQm5CL0hWRVlFUFJMWXRNSHlB?=
 =?utf-8?B?YlpETjhKN2xTNTRITkRWYndBQnRJdVl1Zi85ZVNYMFBQNGpIQ2I3aGEzT2ZT?=
 =?utf-8?B?UkFEZVhKeUljN2xmMTFHNlVudUZiUnNTSy80OW5KcXB2RnppY0UwQngzWWVX?=
 =?utf-8?B?KzlhRDU4Mit5ZHNmbXdhK1JjMFlRS20yRXk1Q2FyRXRCSXh5TW9LWmx4R0wx?=
 =?utf-8?B?bmcwb1A1MDdubXFDVU5USXh3UW50YVlTd3lGTU5OVzg1NCtKTG10aWRrTnN5?=
 =?utf-8?B?dmtWd0RLTy9xNU5paTNsWGgxaFJ2bitHK085amlsc3BNRVpHamM0SWRNeEZD?=
 =?utf-8?B?dWpscVF1Z1ZlUExnN05KZjNkVG1jQzJ4aTJaZTJYcUdRNDI2dHV0d2hiZXN6?=
 =?utf-8?B?M1RYNE9pdGpBaXNKNXpmSVlYWjJXbUp4K3VoK2FMbkZ5SWFOM2gybDhEZHRu?=
 =?utf-8?B?TXd0U1hoc3BnMTVQZnFEYmx5UTZHK3JNSmI2SkduWWt3Z3BIR3pJYXVGR3pG?=
 =?utf-8?B?NXRUSXBaZDJqVDFVdG5DZ21qTnZtdXpjTEJEV0s4NUIrbkVaQWNnRzZ4alIw?=
 =?utf-8?B?Wk5TTnBmUmpTNlNzUm1nSGZBbjFUTnpuRHYxRXpKeS9kb1FyQ1lneHFLOG5v?=
 =?utf-8?B?NGxFZEk0MTFxL205dFdMdlVZcVhJMzNkdUVJaGRSQTRId1M5SER6ejYyeDNY?=
 =?utf-8?B?N0xhUjd4cXRtalp0TXc1dHhsU2tuRG8rOFNHd3dTZElIaW4vaFdvZ0c4TVg0?=
 =?utf-8?B?MG1FMzZVczY1ZFJYWERMYUFQRDVGbHExLzVOZmsrT01mYUh3L0g2V0JKMGg0?=
 =?utf-8?B?bU84Y3VxeXVNQy9lRHpJaUQreHcySVNRbkdFWFRBemc0TGdwcEVRc1RFeDhX?=
 =?utf-8?B?ckRBb2t6UTVBQTVKeVRNLzl1QUhWbHNWRkdjbHNpN0NvelRCTzlUeEJyeC8w?=
 =?utf-8?B?aW9weXNnVE5uQWRSNnpvUk9HM0R6Vkk3UXVwMDJVSElqNzR4aC8rVUs4U0Nh?=
 =?utf-8?B?WEtOYnJKRWJPNlRhUW9PejhjREt2aDY4clhNY0JNZlRVT2ZYTGdVQ1EyYnFo?=
 =?utf-8?B?U2FUek1QNyt3WXZtRkxNM1RiZ3UrUWFOenFvWmJVMERGOTdMT3NxN09aeHl3?=
 =?utf-8?B?Ujg2bmVNb2NzdXl2bXRwcURRU0NsQ1dJdXdtcEJoQzE0WVErWjIzangvTEZS?=
 =?utf-8?B?czhjbDlwNTFrWGlVenB3MnAwQWoyTWZPTVoxR0NuVThGendEM1ZJTUxaVEdB?=
 =?utf-8?B?bEFCaFFmemJYSEJ0cWdEenRtaDFLNk9md2hwNFFtakI0RmE5TkFYbTN3T2l3?=
 =?utf-8?B?REMzTUlyYmtuUnYxaG5UTzlVaHM5UzhHcExCNUtVekFSK0k5V3MwTmF6M0lN?=
 =?utf-8?B?bUdQYUpzSUczUGF3WGxHa3Qva3lXeDd6ZkVWVUtQcWdxSUlGMTVLTUp6QnpV?=
 =?utf-8?B?L3JFUGtjaGNtaTg1T1pHdzRJdXRrV0tjZ0NENVZOWHowSEI1ZUpxQXJ5WWlK?=
 =?utf-8?B?NkJWN2pzVDdLeTFYekswS3VhT2xxQ2djUEloRTRaSFZENUtlWm1sSVc5d2RR?=
 =?utf-8?B?ekQvNjlHTVdmTzloK0dOTDhkTXk4WHZUYUxXYm1FUVRsZWY3b1BPSUlPNjF4?=
 =?utf-8?B?eUtIQXo5ZHJoSzlSZDFlbWNtWGNUd0VWSXRjUVhtc1Ryb2lla1lCT0N3ekwz?=
 =?utf-8?B?Nmc9PQ==?=
Content-ID: <0A86FEDBFB7EBD499DD6163DFA3EA9D4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c88f9ab-f045-4c54-b521-08db509d2f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:53:44.1686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hd6JZt532TDPTzLgRJ1geBB4kgBE3/wOIldP7c8aMIgHwRBl7ON26YHoZZqbuR2gI0M9yUD9EcTKmEqjJnpjNvZpOUbZgb3maCgJ2KjOC2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7982
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1506394627.1289560356"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_1506394627.1289560356
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA1LTA2JiMzMjth
dCYjMzI7MTQ6MzUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBbGwmIzMyO29mJiMzMjt0aGUmIzMyO1NvQ3MmIzMy
O3RoYXQmIzMyO2RvbiYjMzk7dCYjMzI7aGF2ZSYjMzI7ZGl0aGVyaW5nJiMzMjtjb250cm9sJiMz
MjtpbiYjMzI7dGhlJiMzMjtnYW1tYSYjMzI7SVANCiZndDsmIzMyO2hhdmUmIzMyO2dvdCYjMzI7
YSYjMzI7R0FNTUFfTFVUX1RZUEUmIzMyO2JpdCYjMzI7dGhhdCYjMzI7dGVsbHMmIzMyO3RvJiMz
Mjt0aGUmIzMyO0lQJiMzMjtpZiYjMzI7dGhlJiMzMjtMVVQmIzMyO2lzDQomZ3Q7JiMzMjsmcXVv
dDtkZXNjZW5kaW5nJnF1b3Q7JiMzMjsoYml0JiMzMjtzZXQpJiMzMjtvciYjMzI7JnF1b3Q7cmlz
aW5nJnF1b3Q7JiMzMjsoYml0JiMzMjtjbGVhcmVkKTomIzMyO21ha2UmIzMyO3N1cmUmIzMyO3Rv
JiMzMjtzZXQNCiZndDsmIzMyO2l0JiMzMjtjb3JyZWN0bHkmIzMyO2FmdGVyJiMzMjtwcm9ncmFt
bWluZyYjMzI7dGhlJiMzMjtMVVQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMz
MjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQoNClJldmlld2Vk
LWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZn
dDsNCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0K
ICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZp
ZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZy
b20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJl
IA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2Us
IGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNv
cHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5p
bnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUg
dW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUt
bWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_1506394627.1289560356
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEFsbCBvZiB0aGUgU29D
cyB0aGF0IGRvbid0IGhhdmUgZGl0aGVyaW5nIGNvbnRyb2wgaW4gdGhlIGdhbW1hIElQDQo+IGhh
dmUgZ290IGEgR0FNTUFfTFVUX1RZUEUgYml0IHRoYXQgdGVsbHMgdG8gdGhlIElQIGlmIHRoZSBM
VVQgaXMNCj4gImRlc2NlbmRpbmciIChiaXQgc2V0KSBvciAicmlzaW5nIiAoYml0IGNsZWFyZWQp
OiBtYWtlIHN1cmUgdG8gc2V0DQo+IGl0IGNvcnJlY3RseSBhZnRlciBwcm9ncmFtbWluZyB0aGUg
TFVULg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0K
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQoNClJldmlld2VkLWJ5
OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQoNClJlZ2FyZHMsDQpK
YXNvbi1KSC5MaW4NCg==

--__=_Part_Boundary_006_1506394627.1289560356--

