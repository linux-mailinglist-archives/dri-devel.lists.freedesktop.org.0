Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE41619391
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 10:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B52310E71C;
	Fri,  4 Nov 2022 09:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EDC10E71C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 09:32:07 +0000 (UTC)
X-UUID: 409e7cb8ff5442fba7078d900bc62950-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3AaIvE9aI+1jzGPsHhYRc5Bds1U8Z2mMq5UacK7N79s=; 
 b=g26SnAKfeD2b6U+cHRjWkg3OgAG4Pw71P0vmhlTJreZDLx/wGwx3KSenJ/RoFW0//O2ozqwbknqggMyJmLPSmNTpUtPqwSyAZHVnD8Lr7KrnBnstne0cyB8MOLwxRoXEgRgFmeGsNVLQjjQm+3bGGKnVzw4NvZVT9cseGqGKDu8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:be364810-c783-490a-b1e4-567b537e0c85, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:2c7e9990-1a78-4832-bd08-74b1519dcfbf,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 409e7cb8ff5442fba7078d900bc62950-20221104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1041753468; Fri, 04 Nov 2022 17:32:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 17:32:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Fri, 4 Nov 2022 17:32:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RabtGL9Q1Oo+hHqyRzxUJXPmkVekHeM3EKfivExOgHXyQTT4DpFHpf6UmU8N1UeHeDAZCHbx7iI9qYAyWE8nlSeExBU23Tao8DwLkU9sQNVGGcmEHIO/aI6p2+uZ0DJOBwuKlyLzTnvFsLMcH5ga3mcTQLTfiYJxNYwp0h3Zf3HgL5jgbn31fLAxWVKwyiQmmK39Gg9QbpPwpfEf9gU2iIcETnbx9y30nY5ZOxL96WK7uxeQt6lAm29u5z/tF7rEwijorPgg2IkoBX8PrAbouLZI9B4/iRnODQVtpxGC4Dahwgvm/5a8LntQEc1qS7zj5ZMB8Km5oqYR8Ho5Zl/gLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=;
 b=R1I0h3YJ8aUGEK2IRv/5mK4lxiTYYBAvL6BTRyHgfUTf0v3jPlGzWA59gXZyJcJFmX77XrtWH0j2ljzpFCdlppdZtVyss92RqULjxUs5TorKH5G3eKsei9qPHbog6HnfInsp3Oa1d0aTmsoobg4xClhS7QAh2wfObYy4pEJTg91l5w9lWg1QA/LvaElRivFEQR+JpSsIsqLkshWkF+a2ek2CfzMye7+2Ofsvi11UAnADGR/fXz+sVg7ne9p2R/d1n5/ismRKOCyLUE0PXuccJsRPOMChuI7CVAavkdSiFhWJGNw5MGcDZzJJePY5gevLBj7/y06wBf1/kN2EX/tiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQII02DrL4NFH8tbTEvqJSx2wC05l1zzOImDyMIifw=;
 b=i+VVHfXsH/d64UnmNaTVVeKsE6j38D66ez01ccY4Jfo//jzTjakd1wmt8ljCYDamWzMfpgIWJojySYK37N0FpC6EytaNTT6ssWweflr5tU7JIcxJz8VZ4+am4TtAZyjleKnGMHkkWNfDcMfpmubmkHhJKGFQHDlIGkUFLVo3OMA=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PUZPR03MB6966.apcprd03.prod.outlook.com (2603:1096:301:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Fri, 4 Nov
 2022 09:31:59 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::8cda:5c09:3c2e:19%7]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 09:31:59 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "nfraprado@collabora.com" <nfraprado@collabora.com>
Subject: Re: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Thread-Topic: [PATCH v27 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
Thread-Index: AQHY7zQIYLmWmoqLe068p111QNawC64tnk2AgADj2AA=
Date: Fri, 4 Nov 2022 09:31:59 +0000
Message-ID: <dae6f6075673919e22e0b642d1ebf2f601f94f1a.camel@mediatek.com>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-7-nancy.lin@mediatek.com>
 <20221103195625.azajpe3vf5kxccar@notapiano>
In-Reply-To: <20221103195625.azajpe3vf5kxccar@notapiano>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PUZPR03MB6966:EE_
x-ms-office365-filtering-correlation-id: 0c984e5f-9d34-4ae4-6522-08dabe476c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: igMzmi9J2/kqAG19Oa5+JSSY2st1GditRUohy/H8C7+T+zefHFYWuBvLTblm8ptbHVPZe5cFLVlMaS9dPdeVpG8BV9QJoe7d6Ydk4ptdOHQopvT3wkIGVH5JXlnrgRfTa1e2hjRrG/Ctzx7wvm1PKHspAl9ZqOZ2Lj23w64emxXOA+XUpc4pOwSWyZ7Pg59K+ODVYRf0psa4b145vvS3SpNbUJvBDA//YM8xSds5YjIbDuaYsRxBE0v+v68Ry29MkaingeTloOpXu2tiMxzJhaflCb0UbrvsiKaLvckTfrAyZDv991IM1zlA8Z6PF6A9j5lsZxfOI+Wn1ZSzWy7MxNLQKNHD9vLXPySgDIG+j0tbJDJCMZRRXadSgVEeW8211KG9q44liJ1ZdukwJ6CQtdlrY6uTiEx8YGYy3kLCoPP+iNHTAo13xaO6u7OLXqTLC1OxtNCHvRiRd6H3i9oW+26PZimyIhZ804iFDxLPfe943TNdM1VKnh0IuJu1r0gv8LLsSYQJhSxMyD7r072h2w3X/WnRqpr7ObqGfggIFtj6xzviAqbN6abEJ7Iw5a/BomNNi6gTyJltcffv9514I0bvLQNSA4roXMhWOcKqm95Ihlat85AyO0OB9D4oo6t0UjlHGxBMWih9BsVnNI6PpTNEXdwEX40PKUJR3LzmAHwdiJbH5Bj8ZnbOGO/TSu1cKnHqiIXw6l6wTu3C/9oICWndkxq5xakFknpvOhnTkazKZCj8C49HWap7oSzc36kucXO0a5ZIY5DRzpV251mp7lw0JW3S0IjLeQRp1g2MS6pqEOvFgyKLMeKkTZRb0xu3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5175.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(7416002)(4326008)(71200400001)(5660300002)(41300700001)(8676002)(38070700005)(66946007)(86362001)(66446008)(83380400001)(6486002)(66574015)(186003)(2616005)(122000001)(26005)(6512007)(91956017)(38100700002)(478600001)(64756008)(76116006)(6916009)(316002)(66476007)(66556008)(54906003)(8936002)(2906002)(6506007)(85182001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThBMDhldFR0WmU5RWJJTDBDTGhXTWd0bVNRWlQzZ2ZGTzRvaDBUeTdJOW1T?=
 =?utf-8?B?M01rQzRYZGhkeHhTalFWUEd4eUI4M3EyUzJWYklORUJWKzc4bG9IdDZoMjB1?=
 =?utf-8?B?cmc5Q29ZVnRIZlBCaFVjSllQZEpwYmZka2VxWmJwNWVWd0pENmZSUFR2Uk5h?=
 =?utf-8?B?Tnk2RlUvZ3dGUS9kd2s3dStPSk5HSXVFekxzOVA0N0dCWGZudHJ2b2lsUTFG?=
 =?utf-8?B?RTdzSDRjU25KcFdSNnRpT240Wi9IV2JvOVBmbjk3UkE3d0p6TURYSlBVU1lG?=
 =?utf-8?B?UWNyNEd4KzNadzQyMTFlcWZaNjNDSjYzb1RKb3BFNERUbHBMSFMwZFpLUGwx?=
 =?utf-8?B?cDJYc2poTk1nMjRmRnhjSDNiSEFlYThadGZYdkc4dzY2MzZ1ZnY3bERMS1Vt?=
 =?utf-8?B?T3JWY202cTV1UUNqMWpiYmJTK3A2c2ZXd2lEOFc3VkdrVEp4RmtIRXRoTkk4?=
 =?utf-8?B?WmhMcVZHNEM1aDI4WGM3Y0xEK3M5c2JweWZoa0lvZjVPTHV5N2Z5RWhhSE1t?=
 =?utf-8?B?VUZiTE0reVVFaVdJUnhtNmtVSXFTL3Z1dHpzbFNEQ3huWFFsVWFUWFJvcEND?=
 =?utf-8?B?eU5nUHpURkRnTTI1ZGVKS3MwS0Q3bG4yMEU0NU01MHdkZGt3aTNBN2ZDNU1F?=
 =?utf-8?B?c1VjT1BNRHNwaUJISWhlQVRKdGFyNFQ4VVJxa1BNSkpJVG5oYTdyN3NnakJu?=
 =?utf-8?B?cUhZZURtR0NVSmkzdWZXOTg2Q2J5dWh5UGtqQU02ZDc0KzBXSUxGY0lsLzdi?=
 =?utf-8?B?THRqNnZPQ3BCRzZTcFRKc1N5TE85dFdwcG5XbVpCQ1ZHWEVhM0daNzJtVUpu?=
 =?utf-8?B?Yy9hNWdkN3QwZ3VWSnpWK1FnRWxSVTRlbDUraEs1Nmg5Z3AwSTZwY1lreUt6?=
 =?utf-8?B?MlhhT2JMaGFLUC9WQWR6enNTYUEvL1o4WHlDOHNqTGhmMzArdUJmMWJJbXM1?=
 =?utf-8?B?NENJbDNYZG1VTWdwTXRQbXRaQkxVYzFHL3FybDRnT0NLd2VYVjRKeEhvZDl3?=
 =?utf-8?B?UGhsUkcyMmRMR0UyUDFuUW1zYzhKU0dEaTRBK3lVcHlvWXhobkJKTlU0c1Mw?=
 =?utf-8?B?NE1OZEdyeURHalVDTGtSVmJMaXlhaUpnNWY3Q01EdE42RVN2RkN0NVFpT2xS?=
 =?utf-8?B?Q0tXVnQ0eTBnWk41aUovcnJRNXRMaUNPTXBNZU5Jc2lVNFpwSEsrbEFld2xQ?=
 =?utf-8?B?VGhaTzJQNHhlczVkcTYzYUxleWl0S1NHd2laWGNjL1N0TmYvdEJHQXIvR05a?=
 =?utf-8?B?MG83cjQ2WGpHTDl3cUkxZk8rc3lMbWRPdW1zME0wN202djJWWXo1TW0ySlVt?=
 =?utf-8?B?cnNGYnBYMnF6alBtWktYbGkzbFJQV1p2clJ1c2JsSkRQN2FTQ1l6TXNUT3hz?=
 =?utf-8?B?MWhVTDZWQ3JTcnY5UWM0Z2NPK3U2bGxsOGVtSzA5cUNzNnV1WnVwVjRJQ0lo?=
 =?utf-8?B?SURrbjM2ajk2ZzZPSElaOGovenR4U2dVSmp1RTBJNTczdjJtaVNuSTFlMU84?=
 =?utf-8?B?UmlLRUs0d09uVFI5QlN1dks1bUlIY0tSdFN0eklLdGp5RE5yWTdFYVFGVW8y?=
 =?utf-8?B?cUtVQUZaR0xZZFdDSFdheFlUbXlKL0l5REhVb3Q2dEl3SEtJWHFOVzBrVUta?=
 =?utf-8?B?REJXYXJ5ZEZXR1VabTdjci9qN2pZTEVlMTNUb1A2T2M3RjNqeHJUbC8vTmtO?=
 =?utf-8?B?K1ZJcXZoMG96ODMzQUx3V09MMGlicFdmWjhWV2hMcDdySHQ1aktNWStoTmg4?=
 =?utf-8?B?MnJDR3FJc0tIZlBCMzhFMmQ2cnZscUpJbFd0TmNXbkhCejM2cnVxOEpGWGxJ?=
 =?utf-8?B?TXhHVXQ2NUdXZ0g0b3JwejlwMlI5VElsaWp2VWZCQXRpaE9qTElwenREdHVi?=
 =?utf-8?B?ZmdsSmdMbGcvNmhoQncvNE91VzE3MmhaMjU2RURZU0JnQm40enlTRG9aWjNM?=
 =?utf-8?B?bThsWjZnUDRhTFM2cFF2SXFmY21JYlQ5WXIvN2hCeFNmaVZaWmIxTUh1MkNZ?=
 =?utf-8?B?RDNwWVdqcnU0amhDd2xid1I4ek45VXBtTzFUaFdhK3gwK24ydUhkM0MxT2tE?=
 =?utf-8?B?ZXdrMVBnQVVLOUFrYlJuYW5meXFRTjJMQWFKdFJxL3NoaUllY1U1OU1XK1Bl?=
 =?utf-8?B?NFFsMmhqN3VTb3hPemZGNFlFeE52VlpQaTRlZjBZTEc4WlJsTzZMMUdYYnJH?=
 =?utf-8?B?QXc9PQ==?=
Content-ID: <FF59369F5AEA5248AFDBE7C3B3098A56@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c984e5f-9d34-4ae4-6522-08dabe476c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 09:31:59.1396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwYUPBPchtnyr6ffFkGDzZcGsHogNmATZLxpaVYPBNV1iq1+Kx0AbRkGODHONDYXNJta90bVI/bMnNjprIv5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6966
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1359840262.986134640"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1359840262.986134640
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkRlYXImIzMyO05pY29sYXMsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlldy4NCg0KT24mIzMyO1RodSwmIzMyOzIwMjItMTEtMDMmIzMyO2F0JiMzMjsxNTo1NiYjMzI7
LTA0MDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRvJiMz
Mjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtUaHUsJiMzMjtOb3YmIzMyOzAzLCYjMzI7MjAyMiYj
MzI7YXQmIzMyOzExOjI1OjA3QU0mIzMyOyswODAwLCYjMzI7TmFuY3kuTGluJiMzMjt3cm90ZToN
CiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7Zm91ciYjMzI7bW1zeXMmIzMyO2NvbmZpZyYjMzI7
QVBJcy4mIzMyO1RoZSYjMzI7Y29uZmlnJiMzMjtBUElzJiMzMjthcmUmIzMyO3VzZWQmIzMyO2Zv
ciYjMzI7Y29uZmlnDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttbXN5cyYjMzI7cmVnLiYjMzI7U29tZSYj
MzI7bW1zeXMmIzMyO3JlZ3MmIzMyO25lZWQmIzMyO3RvJiMzMjtiZSYjMzI7c2V0JiMzMjthY2Nv
cmRpbmcmIzMyO3RvJiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyO0hXJiMzMjtlbmdpbmUmIzMy
O2JpbmRpbmcmIzMyO3RvJiMzMjt0aGUmIzMyO21tc3lzJiMzMjtzaW11bHRhbmVvdXNseS4NCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7MS4mIzMyO210a19tbXN5c19tZXJn
ZV9hc3luY19jb25maWc6JiMzMjtjb25maWcmIzMyO21lcmdlJiMzMjthc3luYyYjMzI7d2lkdGgv
aGVpZ2h0Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7YXN5bmMmIzMyO2lzJiMz
Mjt1c2VkJiMzMjtmb3ImIzMyO2Nyb3NzLWNsb2NrJiMzMjtkb21haW4mIzMyO3N5bmNocm9uaXph
dGlvbi4NCiZndDsmIzMyOyZndDsmIzMyOzIuJiMzMjttdGtfbW1zeXNfaGRyX2NvbmZpbmc6JiMz
Mjtjb25maWcmIzMyO2hkciYjMzI7YmFja2VuZCYjMzI7YXN5bmMmIzMyO3dpZHRoL2hlaWdodC4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7Wy4uXQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMy
O2IvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCiZndDsmIzMyOw0KJmd0OyYjMzI7
Wy4uXQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K3ZvaWQmIzMyO210a19tbXN5c19oZHJfY29uZmluZyhz
dHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO2ludCYjMzI7YmVfd2lkdGgsJiMzMjtpbnQN
CiZndDsmIzMyOyZndDsmIzMyO2JlX2hlaWdodCkNCiZndDsmIzMyOw0KJmd0OyYjMzI7Y29uZmlu
ZyYjMzI7LSZndDsmIzMyO2NvbmZpZw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtOZWVkJiMzMjt0byYj
MzI7dXBkYXRlJiMzMjt0aGUmIzMyO2ZvbGxvd2luZyYjMzI7Y29tbWl0JiMzMjthcyYjMzI7d2Vs
bC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhhbmtzLA0KJmd0OyYjMzI7TiYjMjM3O2NvbGFzDQom
Z3Q7JiMzMjsNClNvcnJ5JiMzMjtmb3ImIzMyO3RoZSYjMzI7dHlwby4mIzMyO0kmIzMyO3dpbGwm
IzMyO2ZpeCYjMzI7aXQmIzMyO2luJiMzMjt0aGUmIzMyO25leHQmIzMyO3JldmlzaW9uLg0KDQpU
aGFua3MsDQpOYW5jeQ0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrew0KJmd0OyYjMzI7Jmd0OyYjMzI7
K210a19tbXN5c191cGRhdGVfYml0cyhkZXZfZ2V0X2RydmRhdGEoZGV2KSwNCiZndDsmIzMyOyZn
dDsmIzMyO01UODE5NV9WRE8xX0hEUkJFX0FTWU5DX0NGR19XRCwmIzMyOyYjMTI2OzAsDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YmVfaGVpZ2h0JiMz
MjsmbHQ7Jmx0OyYjMzI7MTYmIzMyO3wmIzMyO2JlX3dpZHRoKTsNCiZndDsmIzMyOyZndDsmIzMy
Oyt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2hkcl9j
b25maW5nKTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7Wy4uXQ0KJmd0OyYjMzI7Jmd0OyYjMzI7K3Zv
aWQmIzMyO210a19tbXN5c19oZHJfY29uZmluZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwm
IzMyO2ludCYjMzI7YmVfd2lkdGgsJiMzMjtpbnQNCiZndDsmIzMyOyZndDsmIzMyO2JlX2hlaWdo
dCk7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1suLl0NCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwh
LS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBl
LW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUg
DQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwg
ZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29w
eWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmlu
dGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1t
YWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5n
IHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8g
bm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1359840262.986134640
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMi0x
MS0wMyBhdCAxNTo1NiAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IE9u
IFRodSwgTm92IDAzLCAyMDIyIGF0IDExOjI1OjA3QU0gKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToN
Cj4gPiBBZGQgZm91ciBtbXN5cyBjb25maWcgQVBJcy4gVGhlIGNvbmZpZyBBUElzIGFyZSB1c2Vk
IGZvciBjb25maWcNCj4gPiBtbXN5cyByZWcuIFNvbWUgbW1zeXMgcmVncyBuZWVkIHRvIGJlIHNl
dCBhY2NvcmRpbmcgdG8gdGhlDQo+ID4gSFcgZW5naW5lIGJpbmRpbmcgdG8gdGhlIG1tc3lzIHNp
bXVsdGFuZW91c2x5Lg0KPiA+IA0KPiA+IDEuIG10a19tbXN5c19tZXJnZV9hc3luY19jb25maWc6
IGNvbmZpZyBtZXJnZSBhc3luYyB3aWR0aC9oZWlnaHQuDQo+ID4gICAgYXN5bmMgaXMgdXNlZCBm
b3IgY3Jvc3MtY2xvY2sgZG9tYWluIHN5bmNocm9uaXphdGlvbi4NCj4gPiAyLiBtdGtfbW1zeXNf
aGRyX2NvbmZpbmc6IGNvbmZpZyBoZHIgYmFja2VuZCBhc3luYyB3aWR0aC9oZWlnaHQuDQo+IA0K
PiBbLi5dDQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiAr
KysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiANCj4gWy4uXQ0KPiA+ICt2
b2lkIG10a19tbXN5c19oZHJfY29uZmluZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBiZV93aWR0
aCwgaW50DQo+ID4gYmVfaGVpZ2h0KQ0KPiANCj4gY29uZmluZyAtPiBjb25maWcNCj4gDQo+IE5l
ZWQgdG8gdXBkYXRlIHRoZSBmb2xsb3dpbmcgY29tbWl0IGFzIHdlbGwuDQo+IA0KPiBUaGFua3Ms
DQo+IE7DrWNvbGFzDQo+IA0KU29ycnkgZm9yIHRoZSB0eXBvLiBJIHdpbGwgZml4IGl0IGluIHRo
ZSBuZXh0IHJldmlzaW9uLg0KDQpUaGFua3MsDQpOYW5jeQ0KDQo+ID4gK3sNCj4gPiArCW10a19t
bXN5c191cGRhdGVfYml0cyhkZXZfZ2V0X2RydmRhdGEoZGV2KSwNCj4gPiBNVDgxOTVfVkRPMV9I
RFJCRV9BU1lOQ19DRkdfV0QsIH4wLA0KPiA+ICsJCQkgICAgICBiZV9oZWlnaHQgPDwgMTYgfCBi
ZV93aWR0aCk7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2hkcl9j
b25maW5nKTsNCj4gDQo+IFsuLl0NCj4gPiArdm9pZCBtdGtfbW1zeXNfaGRyX2NvbmZpbmcoc3Ry
dWN0IGRldmljZSAqZGV2LCBpbnQgYmVfd2lkdGgsIGludA0KPiA+IGJlX2hlaWdodCk7DQo+IA0K
PiBbLi5dDQo=

--__=_Part_Boundary_003_1359840262.986134640--

