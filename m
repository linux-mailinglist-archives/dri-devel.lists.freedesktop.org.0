Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88E6372EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 08:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A41F10E689;
	Thu, 24 Nov 2022 07:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B05D10E261
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 07:34:37 +0000 (UTC)
X-UUID: 021de7bd03ae4c5988d5bc17f2d91f9e-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xSkOqjvMm8Wiuc1O2wHgEEFPPTNjL1U5CiMrcdb0QIU=; 
 b=XCVefoXjvkPYCrO0TYVGGXUGVHDqkVb/G4vnfmLmtovVIcKAIaePRr2BAdvd/qI1S/uj0h20Q7tpJg7dJWA1sOuMpNB00W9VvR2VQ2MUHfSStamwbsd3CoDCHfaJAph7H4NMC8KQ/LZey1QH2p77AioVtRTVpjFJVGpEFlsROtE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:e878e477-ae3b-49c9-b1cc-9749dd461a9f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:23
X-CID-INFO: VERSION:1.1.14, REQID:e878e477-ae3b-49c9-b1cc-9749dd461a9f, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:28,RULE:Release_Ham,ACTION:
 release,TS:23
X-CID-META: VersionHash:dcaaed0, CLOUDID:9532b32f-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:2211221851400JCHRE6A,BulkQuantity:23,Recheck:0,SF:38|17|19|102,TC:ni
 l,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:
 0
X-UUID: 021de7bd03ae4c5988d5bc17f2d91f9e-20221124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1343676621; Thu, 24 Nov 2022 15:34:31 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 15:34:30 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Thu, 24 Nov 2022 15:34:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BawrTPuzigXrwAeMR44iHZRqs0+J8nbrlQse6vA5wv5Tu4md2cXV85VMagHCD6RP2agRXFURpooXm2KHpltssgbJQ8trjCVLfJzMZxZ8z/hW8G4EyOS5Ueq6RdRo29wAO4MjAxHbXtnP2wiNXIsICOQeUcW1yhVtczfLK89VMHeoxic8uAuSSFBjY0Eg261lVF/UcpJBIZfK1n6n0cNrUL+z2dv6RawQTe9l5R9i73hZHKh9GFgSeAAz0X4tuA7Wv41NogEi7+ZR3auO2aB7fWZxM+hStLRPAMOnqPicKyCl84UXzTtiBeQt+vtpOC7YQCkaQcQl/mRRDQrZaQAmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfj0uLLTZuj/OOqsVVBRb917YRDEGsRta0X4TBogZM4=;
 b=QJ7NsjByOxn95tLNhkvEoYfsMbi8CHFj83MWzyXf5A9LNw7ngie932+tQc6/yvPp6yHpU53Te0ZPiA4/vh9XMxZEtNh3wuzzut39e+BL4UQT30YIhXn3mNQVHIw6Y2Na1C+npNGrzFuPiI0c4EMcW37+JYvycKhYWY0LoE93IaBz9MV0cf8ZAgdRFdJMH5EvFYBx8nRxYdmuoEaf7IHP5oSQxt21vPKT0+THz9MxS6oOulHjjF75iNCYDrNUyklFLOIIM7NHuIHcK2iPTbH42NkhbjneMmTgigyd6vH6FLvrPrgUjR25g3F2usiay6ATb6vvOxdWSoTMmJWhT073CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfj0uLLTZuj/OOqsVVBRb917YRDEGsRta0X4TBogZM4=;
 b=kcdgOan3h0g6eD2ccVVWOAVD9SCpX7c7R/kM//eB1mVp2c3MesysZqchRWy2WVkfKRg1lPirSP7UcggrqB647V6G8Ipq67A3s8aSkeZevtw7fkbON1BEExjb2qaABNJW1NZL2QX79khxSiQiCvNTUC6YjsZ0cb37nR/DcszGLAc=
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com (2603:1096:820:8::11)
 by PSAPR03MB5349.apcprd03.prod.outlook.com (2603:1096:301:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 07:34:26 +0000
Received: from KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::9386:8c80:d06e:1c5b]) by KL1PR03MB5175.apcprd03.prod.outlook.com
 ([fe80::9386:8c80:d06e:1c5b%5]) with mapi id 15.20.5857.017; Thu, 24 Nov 2022
 07:34:26 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk@kernel.org"
 <krzk@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Thread-Topic: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Thread-Index: AQHY8nnSexf5uHq4NEqdiRYMbNh8ra5MxgMAgAEDY4A=
Date: Thu, 24 Nov 2022 07:34:26 +0000
Message-ID: <8c71e2466f2eeda3f15bb1d73443202203167516.camel@mediatek.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
 <9b74bde1-53e8-0435-9913-af88f626d737@kernel.org>
In-Reply-To: <9b74bde1-53e8-0435-9913-af88f626d737@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5175:EE_|PSAPR03MB5349:EE_
x-ms-office365-filtering-correlation-id: 74c8eef2-e236-4e5b-fc58-08dacdee50ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFhg3kBatEOp04utdDUF3IPjHLZl7AUs7cmmcHrW/eVtPINzwP81FonPK8Lwryl7vf9MJLge8xdHRgMZidF5W/15/R0NeRDEh3YwtyzUo9y7fIE7GRRITLA2hre5aKx6YGesGvabPyME6RkXmpwNm8GFYa7ZAZu8wgKISJXzUbElg6MFXlyRyDPBBXKNI7YA6sKrdWkqgSdy1nYrXWVoc2jiuFptrMJ3amp6ErmiIkVEZ5cVpVgBMWW4O9BQ/pDA1hgE1trGDFbgHC5tyoUywV8XQ+izW2wzcR8XiXE6PvaHkVTFiSd8sC4aSRsERx1KsJTiVlueWCqLX11YRFUr6zihrKrpfL2tGC0b2eMbTFM29CGlcRTM+9uMhBntXAWPRviN34diuyeZNDL/dV7B3S6sWwyFDTALJ8Gk2t9SNKyqBenYRdCmtyRrmKCdbpmJHJTfiJnINK9fLipyTIueheFaRYGN8XLqgbKywRulnTi0jPKnQfvLMqSjrpVPhPn9bHhmBD7SjhpT1W9j45iQfcLWSq1BBheug2XO39BhJRQgud24bnc4IDAb5wy8vg29ijzZR7c4BgibuIfd3e2ve+9EO1kTbfuvieTbYKrafc150xBp/ZjPPb1Li8HaN4YYceprV7tIp/YuPU7a7xSzTpIO1ILbRaHKcJ8UW4hopt5y7YFiYiFqTNVm0RhkY3jDDE8a0m48hwLBoE8YuHwvUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5175.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199015)(2906002)(4001150100001)(83380400001)(5660300002)(478600001)(2616005)(4744005)(8936002)(66574015)(7416002)(186003)(6506007)(41300700001)(6486002)(85182001)(53546011)(122000001)(4326008)(86362001)(66446008)(91956017)(66946007)(71200400001)(76116006)(66476007)(8676002)(64756008)(66556008)(38100700002)(38070700005)(6512007)(36756003)(26005)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnVudHY1RENleHNxTEJRdmVPR0FnazN4VFJ4QkQ5MFdlb2xVRzNtOWo0bnpE?=
 =?utf-8?B?Q0EvNXNTTlVIM3ZUcFM4RHZTQ0VUTVFLVkZ2bi9YMWF6YWlMckVPeTQ0QzVG?=
 =?utf-8?B?LzlyWUd2NEJrOFVEaDRiblBZOWI3VXZhdE8rOXpBRU14T2ZKNkthS2wwSkNM?=
 =?utf-8?B?U1ZydjZSamVMU3RpaXZJaHgwOSs3aGFwQkx1WDZFb1NMcC85bXd5emZoTHFq?=
 =?utf-8?B?RW1aTlBQdU80R1dWZUdYQXZOSmxRREtVUHlTcnlPaFdNVG81Uk1KVzNHekt6?=
 =?utf-8?B?ZTZxRWRRYk50Y1VDTEdpUTNPbUlMejlmQXg1NXNKNGpuSmZNNy9mKzRTVysw?=
 =?utf-8?B?STRXckI4STFmckRpTTVycXJNTFhoTmROeEpMQncvc2tjYVNwTVROd1FQemwx?=
 =?utf-8?B?YitHaVRJdlNNR1lMMGt5aTFWMldvYkdqT1U0NXV5ZlVmRmxvOVY2Y1RqcHpy?=
 =?utf-8?B?WFkvRCtENW5LQjlzWVljT0Erb0xUc09WdjZGM2hLbW1zWnlVZVJ0SjVCbXZr?=
 =?utf-8?B?MGpFdkQzcXZkcDNyQXk3dXI5NlhXNlJKcHZzdzE5TmtkWVRTTGk5VlBEWWZx?=
 =?utf-8?B?UWo2VTY3eXAxemVSMmRFWVFrSjV4bEFVRlUvV2l6R1liOTlwNVB5V2dqUU9U?=
 =?utf-8?B?QjUrcTNVaW9UWmFzRmxNZ0ZqS2FHc0tHWkQwN1Fma3JxZDVycHpYRWJDQ1Nr?=
 =?utf-8?B?SkVLaEliYklqM3E5eFNBSWpiQW81TkZ0YmE2NkRKQmNBaUJPd2tSRWVsL1BD?=
 =?utf-8?B?QWlkUTI0YzVMcmV1eHQ4ZnRNVWQxNk5KK29KT1ZKdHBHWWk3K3pFVWZ0NDF2?=
 =?utf-8?B?QmFoN1ZIWjB0L0lMSU9kYXNqaHZqUmtDbHdZVVNyTzhwU1d6a3BYWFVEbWU0?=
 =?utf-8?B?VnQzaVNlb0ZyMW9YSUlvMVhTdmlyeEtqRHBzS2xvaXJNRnJnTGdKd0IzOW9B?=
 =?utf-8?B?SFA3Uld3aDJ1MS9tMm9vck9xV01wMGUxQ0pQejc2dU5MZ29LVGp6b29YdjU0?=
 =?utf-8?B?YmdLUXp1UHFJendPbTgzd25TNTFjK3FRUTVxMFlkZEo4MnZWanpOMnZEN0xa?=
 =?utf-8?B?RFZmclA1bWlkc2VrOGlrZkFCY2diUXo5SHhCOVZoakhvcVpNZFgrUXA2QVZB?=
 =?utf-8?B?UnQvL3ovOUhJWWc1UkNGVFZqcStORmZVQnNGc010dEJkck85Y1EyL1RMSE5G?=
 =?utf-8?B?dkNTaitrRlExK3dnNjkvNmY0aXp1Q2kwL3FqUXBBcVhxYUs3c0dYbDB3NU9l?=
 =?utf-8?B?MzhzY3RHTno4akVMYVg5Z1JZZ0JlWTZydXNXUjI4VFV0WkhLOVlOWElqbmpS?=
 =?utf-8?B?SzBRVmZWQlJnQjNZenI1eVptSkN5ZUhmVnp5a3FqMkZETWk0UmJPYmNkeEti?=
 =?utf-8?B?SWN4cDViN2xVTS9scGt1a3RseHQ0OFptZjlNR2dIcWVQOG1FMzNzZVdUZ09j?=
 =?utf-8?B?NEhGdFhnMlpnVDVpMkxkWmZmMEVuWkpwcGFYRWNTSzFMaURTWjBxTnFFZzdE?=
 =?utf-8?B?d1BuazVRUnlEcENwZURjUFB6VHJOM3dFdHhCOHUrMjhvREpWbDhXNkpXR3Vl?=
 =?utf-8?B?S3JFQjVQbGZJSFZjWU1VTHExVS9LVzBsMU5RQzZRbERacEkyUkdOaXVKeE0z?=
 =?utf-8?B?aEJwc1g5L1F6TkE1aVBOZUgvNC9jQkZQTlhDaklsNWsvVVRFZGk0dmVnRWFT?=
 =?utf-8?B?WWlRYUttWjRENnQxUWU5NHJmTE5NczhsQk5EN2tWaWcxVzFMRkxIQVBkVmpE?=
 =?utf-8?B?MEwrRHZMZFNCMlc0blcvM240bzJIODlGWE4zVkpzbXA1TzdqVmxIZHU3bFg4?=
 =?utf-8?B?NnNLYy9EVFQzcStEVC8vZmtOWDdQL1NDNlB6NUFtREZQVDRrRGlJVzYrdmRO?=
 =?utf-8?B?M3pta2pncnc3Q1Q2cXhjZGJaZXQ0RnpQZGNQNXZjdnRqUTNYQ2pzdUFZRU8x?=
 =?utf-8?B?ZU8rbGhUTk1VRFB2L2Z1R015NjBFMXFYWE9hazNnNlhmeE4vd3IyZW51enRp?=
 =?utf-8?B?ZnQyTVdxQTI0dW1iS2g4U0I3d2JxTlBzOEZROXVkdStWTnN1cWpOajYwblB6?=
 =?utf-8?B?bStHS1R2SXFMT2dkZTBnazd4MnpXYzJPN0pFZnhIbFBJc3lHL3ptbjUxNWVC?=
 =?utf-8?B?S3VWRDFzYlpjNVdJa1IxZUhKOVBSbS9reVhSU1VxdDJqWFpDOTJnR2dzNmtz?=
 =?utf-8?B?M3c9PQ==?=
Content-ID: <CAD519A45F9EF74FAE5631F151323C05@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5175.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c8eef2-e236-4e5b-fc58-08dacdee50ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 07:34:26.5302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUjamC7jz+5CmbJuCATStRXBVcumh09XmmUr473DU1/DP6ilETx7Rr7HQF9hGDydFrakFb1QwryDLnzU4e5hAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5349
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_147389361.529755496"
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
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_147389361.529755496
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkRlYXImIzMyO0tyenlzenRvZiwNCg0KVGhhbmtzJiMzMjtmb3ImIzMyO3RoZSYjMzI7
cmV2aWV3Lg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMi0xMS0yMyYjMzI7YXQmIzMyOzE3OjA2JiMz
MjsrMDEwMCwmIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tpJiMzMjt3cm90ZToNCiZndDsmIzMy
O09uJiMzMjswNy8xMS8yMDIyJiMzMjswODoyMiwmIzMyO05hbmN5LkxpbiYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO3Zkb3N5czEmIzMyO21tc3lzJiMzMjtjb21wYXRpYmxl
JiMzMjtmb3ImIzMyO01UODE5NSYjMzI7cGxhdGZvcm0uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO0ZvciYjMzI7TVQ4MTk1LCYjMzI7VkRPU1lTMCYjMzI7YW5kJiMzMjtW
RE9TWVMxJiMzMjthcmUmIzMyOzImIzMyO2Rpc3BsYXkmIzMyO0hXJiMzMjtwaXBlbGluZXMmIzMy
O2JpbmRpbmcNCiZndDsmIzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyJiMzMjtk
aWZmZXJlbnQmIzMyO3Bvd2VyJiMzMjtkb21haW5zLCYjMzI7ZGlmZmVyZW50JiMzMjtjbG9jayYj
MzI7ZHJpdmVycyYjMzI7YW5kJiMzMjtkaWZmZXJlbnQNCiZndDsmIzMyOyZndDsmIzMyO21lZGlh
dGVrLWRybSYjMzI7ZHJpdmVycy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7U2lnbmVkLW9mZi1ieTomIzMyO05hbmN5LkxpbiYjMzI7Jmx0O25hbmN5LmxpbkBtZWRpYXRl
ay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO04mIzIzNztjb2xh
cyYjMzI7Ri4mIzMyO1IuJiMzMjtBLiYjMzI7UHJhZG8mIzMyOyZsdDtuZnJhcHJhZG9AY29sbGFi
b3JhLmNvbSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7QW55JiMzMjtyZWFzb24mIzMyO2ZvciYj
MzI7bm90JiMzMjtDQy1pbmcmIzMyO21haW50YWluZXJzJiMzMjtwb2ludGVkJiMzMjtvdXQmIzMy
O2J5DQomZ3Q7JiMzMjtnZXRfbWFpbnRhaW5lcnMucGwmIzYzOw0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQomZ3Q7JiMzMjsNCg0KJmd0
OyYjMzI7SSYjMzI7dXNlZCYjMzI7dGhlJiMzMjtyZWNvcmRlZCYjMzI7bWFpbnRhaW5lciYjMzI7
bGlzdCwmIzMyO2luc3RlYWQmIzMyO29mJiMzMjtleGVjdXRpbmcmIzMyO3RoZQ0KJmd0OyYjMzI7
bWFpbnRhaW5lci5wbCYjMzI7ZXZlcnkmIzMyO3RpbWUuJiMzMjtJJiMzMjt3aWxsJiMzMjt1cGRh
dGUmIzMyO21haW50YWluZXImIzMyO2luJiMzMjt0aGUmIzMyO25leHQNCiZndDsmIzMyO3Jldmlz
aW9uJiMzMjtzb29uLiYjMzI7U29ycnkmIzMyO2ZvciYjMzI7dGhlJiMzMjtpbmNvbnZpbmVuY2Uu
DQoNClJlZ2FyZHMsDQpOYW5jeQ0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJl
PioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioq
KioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNz
YWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHBy
b3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1
cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVk
IG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0
aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVj
aXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJ
ZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJl
bGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVh
c2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBl
LW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Ns
b3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5r
IHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_147389361.529755496
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gV2VkLCAyMDIy
LTExLTIzIGF0IDE3OjA2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiAw
Ny8xMS8yMDIyIDA4OjIyLCBOYW5jeS5MaW4gd3JvdGU6DQo+ID4gQWRkIHZkb3N5czEgbW1zeXMg
Y29tcGF0aWJsZSBmb3IgTVQ4MTk1IHBsYXRmb3JtLg0KPiA+IA0KPiA+IEZvciBNVDgxOTUsIFZE
T1NZUzAgYW5kIFZET1NZUzEgYXJlIDIgZGlzcGxheSBIVyBwaXBlbGluZXMgYmluZGluZw0KPiA+
IHRvDQo+ID4gMiBkaWZmZXJlbnQgcG93ZXIgZG9tYWlucywgZGlmZmVyZW50IGNsb2NrIGRyaXZl
cnMgYW5kIGRpZmZlcmVudA0KPiA+IG1lZGlhdGVrLWRybSBkcml2ZXJzLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
Pg0KPiANCj4gQW55IHJlYXNvbiBmb3Igbm90IENDLWluZyBtYWludGFpbmVycyBwb2ludGVkIG91
dCBieQ0KPiBnZXRfbWFpbnRhaW5lcnMucGw/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPiANCg0KPiBJIHVzZWQgdGhlIHJlY29yZGVkIG1haW50YWluZXIgbGlzdCwgaW5zdGVh
ZCBvZiBleGVjdXRpbmcgdGhlDQo+IG1haW50YWluZXIucGwgZXZlcnkgdGltZS4gSSB3aWxsIHVw
ZGF0ZSBtYWludGFpbmVyIGluIHRoZSBuZXh0DQo+IHJldmlzaW9uIHNvb24uIFNvcnJ5IGZvciB0
aGUgaW5jb252aW5lbmNlLg0KDQpSZWdhcmRzLA0KTmFuY3kNCg==

--__=_Part_Boundary_007_147389361.529755496--

