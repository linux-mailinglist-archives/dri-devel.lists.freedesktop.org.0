Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381C6FC957
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034310E377;
	Tue,  9 May 2023 14:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F21410E377
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:43:46 +0000 (UTC)
X-UUID: e47a16bcee7711ed9cb5633481061a41-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Ua94bE2DnjdP4pBYUYans6Tdz2caqNX4bLJBLGL72uA=; 
 b=mVxHNGt+fOvUMW/V2Mtwj2ogwpsmvKv6F7Fj5mFsF/DC64FsCkDpajo7+2lyD2dptHvYy1ZhdzJ+Lp85i0B5YthAwuuqHR0RfVaY9fSfGbrU5toRoQ/VnrbouznCWYv3T8xI87fAcgSZ3oMLI/bgtKcdn6vMf7GyQYiqQkuMRTs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:568cb848-2523-4d57-aa23-895cbdf69bbd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.24, REQID:568cb848-2523-4d57-aa23-895cbdf69bbd, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:178d4d4, CLOUDID:6d2549c0-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:230509223838WCCCSQYY,BulkQuantity:14,Recheck:0,SF:38|17|19|102,TC:ni
 l,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,OSI:
 0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e47a16bcee7711ed9cb5633481061a41-20230509
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1759362810; Tue, 09 May 2023 22:43:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:43:40 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:43:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUSAy7YGSWyE5D9tWX3b57X7bmy83gcij1BvXvlNGAULjPuDSXFeF3fjKLWVtOk4K3PeZlB4VTH+EJJaAc+98o1j4cE91KxqmB9gzDHm1GpgHZ8me/E/sEfq66Ckwcn97wqsPVyl3xagQmoEr9dt0rbnR6mWa34CTpR5HsYUxgU+AsNmcTTEJEFp5q41NG4js4L0I4yOb0ol4JPMtNgOCPlRbLKuzEwCLNsqhAWk0i9Kxc0VD6fJ5KirtiwMMZdANqXEK4r5C6pk+0u9C4oGaC7ubmgh+ewe4AUtSqTDlQCxoAV3o4uhAiHXz+g/xoDVE5TJ7cf15iKOuyRob+2ZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSbIdcnwY67fg9oa6nzl1GLeFfLRHska3BKFCEJ4CBc=;
 b=dBKSlx4hbAksCtUAMdqATIohAWmakxxiO0OZ2KlIxHbDpnSfSR1sYvKZAxM4/q3X8voTGn1/Wb32L/jE9gniEPTChsJikg+lxixjfhhSkzTcx1ithUgP+gF+iLBA1DjzoEblSk+W9mjXbkJYfIh05tJ9bD41fFgl5HwpqcDi/+8WO4RtC+GaDzTZGsg5cdQvumfNQAlR3PBcz34L/voyP25PBAJXk7cFd0sUVaVyFNYjZw4ylGe1XhV/JgCGH1BDXY9uVTbutu5jrGu1hY6jxRuGAxCMpcA2g4StI1ZcQEyYctKCw5TdiPxtnLagebfRZlHbJS3FGTwKac2yzG+mKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSbIdcnwY67fg9oa6nzl1GLeFfLRHska3BKFCEJ4CBc=;
 b=a3ROpXq8DciTC4tI0ryLhcYpBWsRt6a3OQGiEx2VT254sgxKYon5RpmMLw8esGqZh9Ku2wV8Co8Dhpj66OVnafckkDUZuyLB23nDcmcWkEp4SUk6xRP6RQKbYMXyr8OxvBGiIzHHLDhhrOyd/8sUzjkq2lkw9IJv/G9floV4kTU=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:43:37 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:43:37 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 09/11] drm/mediatek: gamma: Add support for 12-bit LUT
 and MT8195
Thread-Topic: [PATCH v3 09/11] drm/mediatek: gamma: Add support for 12-bit LUT
 and MT8195
Thread-Index: AQHZgBebYttNG8vUIkubRAaJq9wBS69SCReA
Date: Tue, 9 May 2023 14:43:37 +0000
Message-ID: <758626210e87fd23b0ed96fcab1f2768932746b7.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
 <20230506123549.101727-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-10-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: 05f4a8a6-97b2-46f5-dda1-08db509bc62c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cjqkDkPDiU4/PfOCmQy579SI4pf4qyaxtPADZ2pu0ewLWkGnwTDc6TijRClHxsEi4qkczS4mMWPcp6pv21sDO593bw800MPeyfAz5PGQVP01Il4VYFsFvwGvM6RuHT1lGSMPhCgn1ojVeYwBwtQuGnDbPWPQFgh7qdfNkl5ivkLfg3ackw2twNxbbEXOjh/FaewYnBTd8NcIvoJA6qmOLvMso0iZZoxHFOKLlL3p0bTN+tbqIpnfj6PiHk6BQ+yAi34z+0Bos5w9FfpuhDhmEESi8i3KYuonLLJoVn9ftK0dK5x8YAtBNrk49hKf6mK8on7CWSkDdxVUlZoTAhzyFzIYUUJZLWydgAJec5exyhuu312R6L8J93K4tqskx7a8znEY3bmNyVDVe5wyhTpfRBLdhSMGPPy2uSS2NRVa47XgjLaFadhZrzELvwZNwyElte7sel8NNy25VwghG3SP+GMJNEcfYe9pJzfz1rcTDY/mVZr7pjYe/zGhL2L6ou65MfxdabNMnOOlzmlfbkx5Kz+xHCcBD26E98PL/GFApT42lqgmzKaSe5q9hs+QvrBn4Wtp4R3Y+L1ZniEARLeoSwrFnuqEZJo2goiupRzKiwRkJ3XhN+FqpWW3OnY4A9SW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0lzN3hZYjdiZmxnNEg0dDRmTzBiNVNsRU5QY3UwdC83ZVNQNW56WlRtSmNU?=
 =?utf-8?B?ZjVGbmlLNHBkVDNhNVZTWklrRWsxb2RLTmR2bUcvaVFYVFAyRVhwaGplZXFl?=
 =?utf-8?B?eE5RMVVFTE1yMUxxYXFrbUhob3dEaHJTMWRobnIrVzFVeHdaQUhOSGYxYVFY?=
 =?utf-8?B?L1haR0Y3eC9jaUVqZnpZQ292Z0QzNkFwcDB0QzdyU2R5RVBLWWNtcXlPcDZn?=
 =?utf-8?B?M2c2T1ovK0dOSVVsbUJ5TnNRMHlGZnRtWHgyR0tBQ0VndUZKUUJlYmp6UU9P?=
 =?utf-8?B?ZWxERFZhZG9CWitKWmpJZ3J1UXVibG1UTnJVdyt6Z3hkQjBPZUhvTFYrK0Uz?=
 =?utf-8?B?N2xEdW1QdjNsRHhub0d5NjVWWGpWYU0ySmZ6RnAvcGlMNjkyZ0Y2WVRpbnBz?=
 =?utf-8?B?eGVSQTRISFBjMkpOdXZvU2JWL0R6YlZTQ3FUZllNN1BXZ0JKTm1JeWdWNS9E?=
 =?utf-8?B?bzgvZkE2b3dUekxCb2VkdFNDSmJTMGNITG96R3lEekF6L2ZRQ0pWakVSUHMw?=
 =?utf-8?B?bW1nZWRmSkVnS1VJTEJHTks5Y2k4Vy9ETFM2ZWhFbnFiWjIxMUQwQmc0SlE5?=
 =?utf-8?B?bXQvbzFGVmhZOG5Yck1jV3VLWXF1cGsvKzhGcEpMRzZGaUdtUVZwUkltc3Bm?=
 =?utf-8?B?VU1aTWROd0NXNU1ENWlVWCtaWHpRd1JLZVB5blgxSWlkSWQveVc3Q0RFL2ly?=
 =?utf-8?B?Y092QlcvZVJXSS9pZlRIR3BZREpBNXlteHllVUpmMDV5dnRwZHlscUxWV055?=
 =?utf-8?B?TVg4K0cxc1NqTDM2dVU2b2ZXdWw5VUdhR1kyelZ0NzlFRUxZcTJ6V3BRdzVi?=
 =?utf-8?B?cUIrbjhSTVN1WTJaRXhFYVlYRHlZSW8wZVBtamxkemljUHFBK20xLzdxZWZF?=
 =?utf-8?B?SndMdE12eHkwdEY1TDJINXA3bHFMT2xXd0VreUtGbWwzb2FPalViaUlIeVg0?=
 =?utf-8?B?ekxtU0tndU45SUQwek5kb2R1LzFLN05UWW14dytVWml3bXpwRnJOYjNLL3Rt?=
 =?utf-8?B?MzBCOUxvM2puMThqaUJES0pUejdWL3NZdHRKVG9oL1BlVmpKRnBPaytTaEpW?=
 =?utf-8?B?d3N1NTdjSTV6a3N6czBGTXFmZ2grblQvNGFzeUpKVTliRnVKSDJMd25oZUtq?=
 =?utf-8?B?ZFJpR3ZZQXRBK3R6SHRtRjlhVE1xZk13RUtnS0ptYkxxL212TVNQYVVnaFlm?=
 =?utf-8?B?Y0RyREh3Q0lvSWkyTXRaZHBBMnVnc093UTRza044b2orV1U4c1ZUUkRMMDN3?=
 =?utf-8?B?dEpub05zOCt3VFlLTDMrVGxGNS9YcmVDblpsblp4RE5sTFdBMlpwM0JtYm9v?=
 =?utf-8?B?dUFUblQ3c3JpSUplZVM0SEVYNE1HSkpwMTV1SWJFT1Vha29keVdWZ3hJSExw?=
 =?utf-8?B?MTdGblFrbzUyeHhXbFRsTkFqWWhZSlRieXMrcWlCWmo0Nm1jc3NBS1N3SnJy?=
 =?utf-8?B?VVArditJTlQ4MTZ5bmtlMGJ0a3k1YzdNWTlCSm45c2Y2Rk5rM01LbmRiajZo?=
 =?utf-8?B?WlVyY3Vkd3d6b3FSaDFlNXkyZUQyMEpTV2dnL0drc21oRGRrZDhxNVpHdzVY?=
 =?utf-8?B?VENEUi95bkx4bXArWWpVVWNhdHhlaFZtVWJMVGVySGJ5WHF6aWNFWS92SUxz?=
 =?utf-8?B?QStNamZhNmZzd0hIVERQYTROWVVUZFVSU1cyQ1Jqa3pUNk1GWWZvWlRIRkVr?=
 =?utf-8?B?cUQ2Ylc0a0FzWkh0bUNZeGt6cUJobWdzS3R3bzJWaGxBTC9DdGF0NFc1YnNu?=
 =?utf-8?B?cDRDTzRLQmgvUDFnWHpSRERBSkdnTUs1aDEyeDJIQW9JSjNCT1JmV0FqZ2JR?=
 =?utf-8?B?Ti9mZGo1NE1CR0gwVkdNQzJCMW1XUVdLZjA0eEF4Zys1aWpLcGs4SmEwYVds?=
 =?utf-8?B?QXBxZWRSOXUyRXlrY0NZUjVOakdEVG5abndGR01RY3F5cFQ4cXhxUldmRkcr?=
 =?utf-8?B?dm52NEthYk50M0NzeVFqZG5MMEhoVmZaVXFKSCtBclpPRURnK05RY0htMDE1?=
 =?utf-8?B?R21zYTU5eE8vVm05MGlBbThrUXV5cjFGc0FsRVVJcEpjL0FRR0VRRnk2V3Q3?=
 =?utf-8?B?ZFNzWTRRZ1h6NFlRTXRoSWt3eDV4SUJPWnYwTlhqVy9pTXRyTzVMSG9vQjJG?=
 =?utf-8?B?M1Q1a2J0UFpWY0FFYjQ1Mk0rR0hIU3hpRVA2ZDJ2UW5peS9jQkVranJVQWcw?=
 =?utf-8?B?cFE9PQ==?=
Content-ID: <75FD886D0341C64DBBCDA2AB00070C7D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f4a8a6-97b2-46f5-dda1-08db509bc62c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:43:37.8037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlSP4J3enXzL1GDV0iwwx3P5K6s8B5V3RplIXZFk4X+ouTWf1ALXitNxdiUraeDa/hBlIFbRO8eK0quiwDDMkK+1rZF2O5jrm6fDDdt/eOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_205661375.1178969551"
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

--__=_Part_Boundary_004_205661375.1178969551
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA1LTA2JiMzMjth
dCYjMzI7MTQ6MzUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7MTIt
Yml0JiMzMjtnYW1tYSYjMzI7bG9va3VwJiMzMjt0YWJsZXMmIzMyO2FuZCYjMzI7aW50cm9kdWNl
JiMzMjt0aGUmIzMyO2ZpcnN0DQomZ3Q7JiMzMjt1c2VyJiMzMjtmb3ImIzMyO2l0OiYjMzI7TVQ4
MTk1Lg0KJmd0OyYjMzI7V2hpbGUmIzMyO2F0JiMzMjtpdCwmIzMyO2Fsc28mIzMyO3Jlb3JkZXIm
IzMyO3RoZSYjMzI7dmFyaWFibGVzJiMzMjtpbiYjMzI7bXRrX2dhbW1hX3NldF9jb21tb24oKQ0K
Jmd0OyYjMzI7YW5kJiMzMjtyZW5hbWUmIzMyOyYjOTY7bHV0X2Jhc2UmIzk2OyYjMzI7dG8mIzMy
OyYjOTY7bHV0MF9iYXNlJiM5NjsmIzMyO3RvJiMzMjtpbXByb3ZlJiMzMjtyZWFkYWJpbGl0eS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8m
IzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbSZndDsNCg0KUmV2aWV3ZWQtYnk6JiMzMjtKYXNvbi1KSC5MaW4m
IzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KDQpSZWdhcmRzLA0KSmFzb24t
SkguTGluDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_004_205661375.1178969551
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEFkZCBzdXBwb3J0IGZv
ciAxMi1iaXQgZ2FtbWEgbG9va3VwIHRhYmxlcyBhbmQgaW50cm9kdWNlIHRoZSBmaXJzdA0KPiB1
c2VyIGZvciBpdDogTVQ4MTk1Lg0KPiBXaGlsZSBhdCBpdCwgYWxzbyByZW9yZGVyIHRoZSB2YXJp
YWJsZXMgaW4gbXRrX2dhbW1hX3NldF9jb21tb24oKQ0KPiBhbmQgcmVuYW1lIGBsdXRfYmFzZWAg
dG8gYGx1dDBfYmFzZWAgdG8gaW1wcm92ZSByZWFkYWJpbGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPg0KDQpSZXZpZXdlZC1ieTogSmFzb24tSkguTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQo=

--__=_Part_Boundary_004_205661375.1178969551--

