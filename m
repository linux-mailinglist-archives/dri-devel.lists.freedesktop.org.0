Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA274CD66
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 08:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C1410E1AB;
	Mon, 10 Jul 2023 06:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C526210E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 06:45:55 +0000 (UTC)
X-UUID: 68634c0a1eed11ee9cb5633481061a41-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5XrrahZ+EIAmNU0to8PMteQB2Kut0CzB4hu7+FPTZ6U=; 
 b=bEAPfldaHilSrGCKaQH1888vBVraHo55XueXMOwopdowif/ukM/Fbylv8ODvdOWQgqBo8xU4f/GHPEVcGd6K00hrKQeHRSRFUuQkWnlvbb9IpmGpyfvDGJ5apXy9zlxB1F44J0bW9Q/+mmCaDJy+i2zdvPlsbt/9+di4s/EW1rs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:113c23db-de1a-4ef6-9fb1-0434ae2f1ea7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.27, REQID:113c23db-de1a-4ef6-9fb1-0434ae2f1ea7, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:01c9525, CLOUDID:04d30c68-314d-4083-81b6-6a74159151eb,
 B
 ulkID:230710120225EPH8ROPS,BulkQuantity:7,Recheck:0,SF:38|29|28|17|19|48|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:41,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_ULN, TF_CID_SPAM_SNR
X-UUID: 68634c0a1eed11ee9cb5633481061a41-20230710
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 779055320; Mon, 10 Jul 2023 14:45:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 14:45:49 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 14:45:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZrnAgICkeZHX9Iw/nt+aC1t29bkjG6Pi7H4u4K9y/0gE3G7K/ttvWrI5jUYofbErOMR1yb4OLq8trEGwzbk/6fvfbIzdnOhCrDEzn74AkbisEjRfaGgtKMoiHQRa5luEjQI4KsrI0PI3a3grOvBbOvBRtjQSMkpuakZogRADvZ6HLhGFAhC1EMvhYQFneiaqj/M3RnGD8FNw3x1rTCXN/Pf3/fwArPNoswqVRsoEVT6KnZtsdB+QB99fprJXwyevMyrwvtFsE5lk1/HrxMZDzBwIwp4/3a96W4NdqZTlZeUauoLr3K6SZpR/8Juen9Q0+6waEaDGjiGQay0JS4+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=;
 b=CDYANjARokV6MSsceFlBVMHjKSwZodWmgr3P9mxa6G6iGw5dtLF847jEOMZfhuREPYVoAMMyn0+3UdoB+j7LOEC3AxaFYcy+owT+VwK1jmI5lyzO5N60mC73Rux/PvkGsCGdbNer8yNcUxFYOwHUnwPWKeXEp43bYnH1MZc0CpbzHQ2imHd5aUv7cV1aaV4Uw0NzWfhpMJE3rTIS2PV3jJDzsbJhmjPnXfFaQezOuuQNSvyDTY4gZIat4t3GOWnLmTkWMdgN1qLFUoVivOZRsqvsFpREBc36CfdWOMrmzansqAs/mVgZQlgrMGJ/iK1W7NLpjWebEq4C/IP9dq0NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9no/i7Z+GMtXV7PT2kHIHl3r//QeKykhMwM4CUY/Bc=;
 b=YOsKVGV2h7gGYCYoKoHCSLt7KuLuaMqOAky6TAzBPzr0ndBOSD0ymMyRoUTg83x1wdUYf59ZAAneAhox0KW/fH2b2uWTMsfyDD4aaviLzmIKWsCgUh4zG9vNAJjwhtNZb5FCHSyI/4TZctUfkTYfSCCo2AMPsRC6tFumCvyoy9g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7668.apcprd03.prod.outlook.com (2603:1096:400:41a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Mon, 10 Jul
 2023 06:45:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%7]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 06:45:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/4] drm/mediatek: Add cnt checking for coverity issue
Thread-Topic: [PATCH v3 2/4] drm/mediatek: Add cnt checking for coverity issue
Thread-Index: AQHZpCprBe8Tt23dtEuhVR6mTlSRaa+yq/mA
Date: Mon, 10 Jul 2023 06:45:46 +0000
Message-ID: <5579fba13bf27c79f0945571c5febf464d6ef98c.camel@mediatek.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230621102247.10116-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7668:EE_
x-ms-office365-filtering-correlation-id: b289b836-0fd7-4e19-070d-08db81114a52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slpESGUqUQcCz2UwiXLLvP7ctoF5H4PciFaUAe74nfdeMwUr5ggVbG8iy5uNoitSFQwlQa50loUGuZrYHLQGWM+kEe2H8/7r7Gf6QH0QWCYq/h0qyYQqv4TINYAmpJyRg6eEmLjHGCEMS2GTl6gtYzrGqb817J56+Cagzyg02EwyZVBo6T4trCiz4QSm+rqs57xaEd8ItTVY8fhs/DTNEmeDUpLrsr7YbwTMYehJ6FCOc/F2PotLK6BLnjtMxqpeK8SPQecCM0tiVIefRqqtSQuf/BsZufu7ytzv2i3CiPIejT9M0KJ+0P+XB1qik7vRN+HRV3taUc3cBHDZvEw6VAPV88fBAkCWg4Q3lJu69hkzZa5V+g/Mc6qv3VpitD1mItfueHi1Kt/a9YIiBJqeLy/OWmOHVUjRNr5Zjppx3+JnLAVzmfQxuNLlfaAuuL7ymkQ1pf+aSIn6vkIK6Ts9Pciy8A0yLYjZLzghoL1uEgU64G3zGojFuJSO9oBeqy0sv1x1utdBYLDCLVjzUBgHVovEO7QJPn/kE/BjFb7jo6L32RZ9pzYGJxrrZJBe3SiWvJg6prIkfF1ET6LkmZ4P9pZ8iCm3nhlE0QfAjUeW7C67CZe7IWQqzWFr2scWjIe0IhwNNDOfapgJIxu8zcP0fFynC2rSIzyjqos2cUrpFfY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(6506007)(2906002)(6486002)(71200400001)(110136005)(54906003)(478600001)(36756003)(85182001)(8676002)(8936002)(122000001)(41300700001)(76116006)(64756008)(316002)(66946007)(66556008)(66446008)(66476007)(4326008)(6512007)(83380400001)(38100700002)(5660300002)(38070700005)(86362001)(2616005)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjBWdHJDa1BmV3ZBVXhhZitKeUJINEtBNEwvMFlxd0NhY1YwbmswdXJPMmI4?=
 =?utf-8?B?bFBERldEL1g0WWFPRnhwTnQvYW9SWmp0RTJZbm41cjNMZXcrM0VBelZwc3BH?=
 =?utf-8?B?dXFyb3M5WGFzZTkvUTBDMFdpOWdPRnVsY3lvRmUzbHZvQ2hjbnI0bm9pY3ha?=
 =?utf-8?B?V3ZDdHI5bFRlVWwydXRzeVVZMklkL1J6WE5paWVFc3RwSEpWMzUybG1OZXF1?=
 =?utf-8?B?ZlhLYXhxRU5LdGQxR21FSDZyZGtjRm1QQVNLZzZHU0htQzlBMnhvTm1MTzVo?=
 =?utf-8?B?TktaU1pQYlNwQ2h1MzZ4eVhqVTVjaEtiOGw1OFowaEpYOE9PQXZ1S1JHdmZk?=
 =?utf-8?B?emVtdXlkZzVwbXZlYTZJWWV6ajJ3akhSVHlaZlptSUZmT1JRalpackhZVW1i?=
 =?utf-8?B?aTZDVXpRV1E5K3pVK0dJdHBIVkhMcDJ3SVpPTnJqZzkvRnd0RWErKzZobHJR?=
 =?utf-8?B?WTRBejFEb05Rd0dTcm9BSGxSUUl0VEhFNHI4SnZ5U0tyQWtLOUQxbm84aVlI?=
 =?utf-8?B?UGdEYzFaRTIwUmhlN0tybDBwY0s5RUdmT2RNZHVVeTdFQUIyRjd6QmtnZC9v?=
 =?utf-8?B?VnNwYzZ4SnVDSGtrQUxHb2VCVW1DSjdwU1Y1dlRZYTRvOTdVU0V2U0RqRnZz?=
 =?utf-8?B?WWRyNUdhZ3k4eE5ZNDVCQ01LcklRaWZsZ3grQmdNajNTTFJKTUpXRTgwWHBK?=
 =?utf-8?B?YStLWXB1VEU0b3FnbE5xZ0czVk5FRHA4TEFmZzVDYTd1aGt3QXVLenNjeDJv?=
 =?utf-8?B?RDltbmtCRU1kcFlaMm5tbVVWckVjZDUvUFU5WUFwUzJ0eFlaVXIzMmQ3OVBo?=
 =?utf-8?B?aUdzNU9hNjQwUDJXSGk2cTQrL1JIQ2c1eUtCSExKQlFsWnJxSXRKMzhMY0dL?=
 =?utf-8?B?ZC9vMnpRTTIrOXkzZG5zRkY4dE9HanEzRk54d1FSQTkwQjl2aG52NUJPSEpl?=
 =?utf-8?B?dTdOcEV4R3FkdktpSFluZ1VpR0EvT2lLdUV2THdYZ2ZGcURKUEhWd3gyMUJS?=
 =?utf-8?B?akdRMEdKRFhMZVVQNFFMK2VRM1Uva2dONWRSY1Q2WDlMdnNwRFdLQ0R2bEI0?=
 =?utf-8?B?bi9lMHB5ZDg3dy96dGxtTCtVRnJDRXhtZnBWVzI5RWRuOGN2UTNVSm81SXo1?=
 =?utf-8?B?SjJocUhRUFNmVFY0Zyt2RnRjdUZISVorMWMvLzZna1htRjd2TkNFNDFkZHpD?=
 =?utf-8?B?ZU1FWThrUWJibXo0eSsvbzVodWdUUWV3bUltT0VhRThweld2YWlFLzZiNGRr?=
 =?utf-8?B?UEo5RWJrVFlINmtjT2lrNGRneHhDYjdSS0NoOXBtZkRyWlFHV1F5UzRSVmdF?=
 =?utf-8?B?clZUMGFXRklpNlA4NUxrWEc2NThDNUsyNkdCS3lNcnB4YlEyQjdMallqak1n?=
 =?utf-8?B?MHl2SmZkdDlOY3RPRWtESnh4bmNNb2Q0SUl5K21QckNQc1lCdFpxVEZQM2xB?=
 =?utf-8?B?QStQdGFUMFI2Q0x5Q0RSeUFLNGEzREw4bEZDZlIyWEo2amZRcDZKYzZFQzRP?=
 =?utf-8?B?MVB3cGdMYzRucWgyazBxYlpVOTdiVTErYjBoZisxNURKRXc2S0VmT054S0lF?=
 =?utf-8?B?U1hHY3NJMUFudTFBbHZ6SmZyNjdQcUsxWHU0bE84T3ZNcTA3Zjl1T0ZqM2ZV?=
 =?utf-8?B?MkU2YlUvVG9xZmhFditTVmdzYXE1czJLR0JxYmUzSUJ2dGozVmxmUVYrOGVw?=
 =?utf-8?B?ZWp6eVM5WUxuMitZNFRUOE8weHZGK3ZNNmdENkREekFBSGZ1blBGWllXdVFY?=
 =?utf-8?B?ODlRSTBkU0FQL0RWc2JET1FTTi90U0doZUFEYk9ZMmJFb2Z4S0JUeE9KZ25p?=
 =?utf-8?B?NTd6ank0VXQ0NDZCUXRYd2w2cGVoNmJHVVlTV2IxL2lMd0RpTlJEVngvdlk0?=
 =?utf-8?B?a1VIWUovTkM3SGFLM1czVDRBNEpoUWVkTGVPdDRnS3kyb3g5dVo4OUdJV1lZ?=
 =?utf-8?B?L1pmQ2x1TiswM1Y2OU5Kb0hBS09FOUg5NDBZOVRQTVplQWFGTm8xUS82b3VL?=
 =?utf-8?B?MzA2bDdkS0U3ZVAzQkgrd3gzVHA2REZkT3NJY3NZMlJwbnVQdEpkUnUvWjFQ?=
 =?utf-8?B?S3NNNnNTRXRvS2RMZjhzNDlEQXRBSnpVYjZMeDNOeUJtK0VJZHZudFZwRXhP?=
 =?utf-8?Q?82NZibGIbpWQKxi0Tjr3gAuJG?=
Content-ID: <E3A98D3FA5CD114EA5A45BBFDEF3A8DA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b289b836-0fd7-4e19-070d-08db81114a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 06:45:46.3938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWQ6l0M8WIW26GGSati5ZYQ7mcx58SDBMjQ0wyd8tS8wEdigDeaZVK3WCPbTFMzl9U5XgVQxF6kX3HiMWfnVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7668
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_281437238.1955019031"
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

--__=_Part_Boundary_009_281437238.1955019031
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTA2LTIxJiMzMjth
dCYjMzI7MTg6MjImIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0NFUlQtQyYjMzI7Q2hhcmFjdGVycyYjMzI7YW5kJiMzMjtTdHJpbmdzJiMzMjsoQ0VSVCYj
MzI7U1RSMzEtQykNCiZndDsmIzMyO2FsbF9kcm1fcHJpdltjbnRdJiMzMjtldmFsdWF0ZXMmIzMy
O3RvJiMzMjthbiYjMzI7YWRkcmVzcyYjMzI7dGhhdCYjMzI7Y291bGQmIzMyO2JlJiMzMjthdCYj
MzI7bmVnYXRpdmUNCiZndDsmIzMyO29mZnNldCYjMzI7b2YmIzMyO2FuJiMzMjthcnJheS4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7SW4mIzMyO210a19kcm1fZ2V0X2FsbF9kcm1fcHJpdigpOg0KJmd0
OyYjMzI7R3VhcmFudGVlJiMzMjt0aGF0JiMzMjtzdG9yYWdlJiMzMjtmb3ImIzMyO3N0cmluZ3Mm
IzMyO2hhcyYjMzI7c3VmZmljaWVudCYjMzI7c3BhY2UmIzMyO2ZvciYjMzI7Y2hhcmFjdGVyDQom
Z3Q7JiMzMjtkYXRhJiMzMjthbmQmIzMyO3RoZSYjMzI7bnVsbCYjMzI7dGVybWluYXRvci4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U28mIzMyO2NoYW5nZSYjMzI7Y250JiMzMjt0byYjMzI7dW5zaWdu
ZWQmIzMyO2ludCYjMzI7YW5kJiMzMjtjaGVjayYjMzI7aXRzJiMzMjttYXgmIzMyO3ZhbHVlLg0K
DQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZn
dDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyOzFlZjdlZDQ4MzU2YyYjMzI7KCZx
dW90O2RybS9tZWRpYXRlazomIzMyO01vZGlmeSYjMzI7bWVkaWF0ZWstZHJtJiMzMjtmb3ImIzMy
O210ODE5NQ0KJmd0OyYjMzI7bXVsdGkmIzMyO21tc3lzJiMzMjtzdXBwb3J0JnF1b3Q7KQ0KJmd0
OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxp
bkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0FuZ2Vsb0dpb2Fj
Y2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMz
Mjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyYjMzI7fCYjMzI7NSYjMzI7
KysrKy0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzQmIzMyO2lu
c2VydGlvbnMoKyksJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtk
aWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0
OyYjMzI7aW5kZXgmIzMyOzZkY2I0YmEyNDY2Yy4uZmMyMTdlMGFjZDQ1JiMzMjsxMDA2NDQNCiZn
dDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0K
Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
DQomZ3Q7JiMzMjtAQCYjMzI7LTM1NCw3JiMzMjsrMzU0LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMy
O2Jvb2wmIzMyO210a19kcm1fZ2V0X2FsbF9kcm1fcHJpdihzdHJ1Y3QNCiZndDsmIzMyO2Rldmlj
ZSYjMzI7KmRldikNCiZndDsmIzMyOyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNl
X2lkJiMzMjsqb2ZfaWQ7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7ZGV2aWNlX25vZGUmIzMy
Oypub2RlOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRybV9kZXY7DQom
Z3Q7JiMzMjstaW50JiMzMjtjbnQmIzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMy
O2ludCYjMzI7Y250JiMzMjs9JiMzMjswOw0KJmd0OyYjMzI7JiMzMjtpbnQmIzMyO2ksJiMzMjtq
Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7Zm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShw
aGFuZGxlLSZndDtwYXJlbnQsJiMzMjtub2RlKSYjMzI7ew0KJmd0OyYjMzI7QEAmIzMyOy0zNzUs
NiYjMzI7KzM3NSw5JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtib29sJiMzMjttdGtfZHJtX2dldF9h
bGxfZHJtX3ByaXYoc3RydWN0DQomZ3Q7JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsm
IzMyO2FsbF9kcm1fcHJpdltjbnRdJiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZHJtX2Rldik7
DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsoYWxsX2RybV9wcml2W2NudF0mIzMyOyZhbXA7JmFtcDsm
IzMyO2FsbF9kcm1fcHJpdltjbnRdLQ0KJmd0OyYjMzI7Jmd0O210a19kcm1fYm91bmQpDQomZ3Q7
JiMzMjsmIzMyO2NudCsrOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoY250JiMzMjs9
PSYjMzI7TUFYX0NSVEMpDQomZ3Q7JiMzMjsrYnJlYWs7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsm
IzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsoZHJtX3ByaXYtJmd0O2RhdGEtJmd0O21t
c3lzX2Rldl9udW0mIzMyOz09JiMzMjtjbnQpJiMzMjt7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQt
LT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90
aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0
IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRv
IGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1
c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9y
IGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkg
dW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0K
YmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwg
aW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBs
eWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5k
IGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVy
IHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_281437238.1955019031
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMDYtMjEgYXQgMTg6MjIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQ0VSVC1DIENoYXJhY3RlcnMgYW5kIFN0cmluZ3MgKENFUlQgU1RSMzEt
QykNCj4gYWxsX2RybV9wcml2W2NudF0gZXZhbHVhdGVzIHRvIGFuIGFkZHJlc3MgdGhhdCBjb3Vs
ZCBiZSBhdCBuZWdhdGl2ZQ0KPiBvZmZzZXQgb2YgYW4gYXJyYXkuDQo+IA0KPiBJbiBtdGtfZHJt
X2dldF9hbGxfZHJtX3ByaXYoKToNCj4gR3VhcmFudGVlIHRoYXQgc3RvcmFnZSBmb3Igc3RyaW5n
cyBoYXMgc3VmZmljaWVudCBzcGFjZSBmb3IgY2hhcmFjdGVyDQo+IGRhdGEgYW5kIHRoZSBudWxs
IHRlcm1pbmF0b3IuDQo+IA0KPiBTbyBjaGFuZ2UgY250IHRvIHVuc2lnbmVkIGludCBhbmQgY2hl
Y2sgaXRzIG1heCB2YWx1ZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IEZpeGVzOiAxZWY3ZWQ0ODM1NmMgKCJkcm0vbWVkaWF0ZWs6IE1vZGlmeSBt
ZWRpYXRlay1kcm0gZm9yIG10ODE5NQ0KPiBtdWx0aSBtbXN5cyBzdXBwb3J0IikNCj4gU2lnbmVk
LW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiBSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYw0KPiBpbmRleCA2ZGNiNGJhMjQ2NmMuLmZjMjE3ZTBhY2Q0NSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTM1NCw3ICszNTQsNyBA
QCBzdGF0aWMgYm9vbCBtdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3RydWN0DQo+IGRldmljZSAq
ZGV2KQ0KPiAgCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX2lkOw0KPiAgCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZTsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkcm1fZGV2Ow0KPiAtCWludCBj
bnQgPSAwOw0KPiArCXVuc2lnbmVkIGludCBjbnQgPSAwOw0KPiAgCWludCBpLCBqOw0KPiAgDQo+
ICAJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwaGFuZGxlLT5wYXJlbnQsIG5vZGUpIHsNCj4gQEAg
LTM3NSw2ICszNzUsOSBAQCBzdGF0aWMgYm9vbCBtdGtfZHJtX2dldF9hbGxfZHJtX3ByaXYoc3Ry
dWN0DQo+IGRldmljZSAqZGV2KQ0KPiAgCQlhbGxfZHJtX3ByaXZbY250XSA9IGRldl9nZXRfZHJ2
ZGF0YShkcm1fZGV2KTsNCj4gIAkJaWYgKGFsbF9kcm1fcHJpdltjbnRdICYmIGFsbF9kcm1fcHJp
dltjbnRdLQ0KPiA+bXRrX2RybV9ib3VuZCkNCj4gIAkJCWNudCsrOw0KPiArDQo+ICsJCWlmIChj
bnQgPT0gTUFYX0NSVEMpDQo+ICsJCQlicmVhazsNCj4gIAl9DQo+ICANCj4gIAlpZiAoZHJtX3By
aXYtPmRhdGEtPm1tc3lzX2Rldl9udW0gPT0gY250KSB7DQo=

--__=_Part_Boundary_009_281437238.1955019031--

