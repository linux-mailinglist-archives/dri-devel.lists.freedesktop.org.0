Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86A79C6C0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 08:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9732110E389;
	Tue, 12 Sep 2023 06:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4075410E321
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 06:16:15 +0000 (UTC)
X-UUID: db6e7378513311ee8051498923ad61e6-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OxMHJIVg7S3jPS68i+fXcB/3HtQrbW8youfaXydohJE=; 
 b=CtHnuuc88tH9nj9e+pXJs9ooraqTLKaQjcScSEWVITFRHsdLMdU/pJi3RBjKLrwEtPqWJH6a0rmRWhZBJIermIeKbn1tLJlYzmRKPfuRuVDRV6RZR6PkTN/tQiq8WOSUHeclp/Vm2GC5v7GeZYGViy8OwsHOoR++Wy9bCmG3TyM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:d68a967d-0ad7-4b25-aac2-627f41a8ae1e, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:0ad78a4, CLOUDID:9fb4bbbe-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: db6e7378513311ee8051498923ad61e6-20230912
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1971845868; Tue, 12 Sep 2023 14:16:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 14:16:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 14:16:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6ga6BEHFWJjrEFC4ZwW5TlM/9+bkgCoGiu2YK55hB/s0BIxDRwWnNMr517OvsPh+VMa7P5xdvMjKSw1z+bbOYt8gPNR9SU+DYYz8ZV8G+2GnbV+AJNzZcFLVRF5qj3KLJpDnmf/uRbqVqDW15k24JP1YYLHuVWXGorsFXA6daio07HNTEu3HTDzNulEvuOaRBcEsFPO8my4jE53NEm8d47uqYJrjWiO1Tg0oS/OY6SbVrS97Q6p9CwNDH//BdsdwuJXGjiOuYhXgxN+VVlSpdFRvD6UY624M7lAMf9VJQIiiqId0ISsUXhszgaE40EQkDmLru5w8BfUfNpCsHL9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxMHJIVg7S3jPS68i+fXcB/3HtQrbW8youfaXydohJE=;
 b=SkTSqfbvYyHYfQuUNe7t4sKiJnJRlpL1gpBIzAKmMnf/BcfeJ2X7bJQrU9ZgJ3DXGr2WIIa4Bbv6GC3nQZG4Pgr1XWMSrmQIsxyVfHtZUlq5FmqZaNnJxoS1ozWmevzeFwFkvvvY0CLePAq6jBwbQsGgegvF42ttyboopIBOscvwtLs6IBVMzlFHNwlF00W/19rlxSjNAq8x7dSgU3bEsxldz8YuLTCPeiAz3eixin8ypKEYC7cSaK1YXO//S6urKlmmRh8K0GtGGz4oz3q58rYueEEC0nIFR1BG1yz8uJZJRJl0y2WGmjC/RQcbhLC9DLYLtsBecrSgz+1o24/0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxMHJIVg7S3jPS68i+fXcB/3HtQrbW8youfaXydohJE=;
 b=CF1rqsu87vEHTlnQ+UXWMOFHN4WkXMHNrQDNM6LmSpFfhG9RXDDgLwkeReKuA3llPbPvm5X/hWGOvUycBnCq98NXd6k3HCYe8F2VLZiXjAiJXgFXRIXxkTETwf9gsw9cm26opo1Hb+JyNzqVZ1xCQrCG/a51OfM9+NlhVgH//Nw=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEYPR03MB8270.apcprd03.prod.outlook.com (2603:1096:101:1a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 06:16:01 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:16:00 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrAVxRkAgADzaIA=
Date: Tue, 12 Sep 2023 06:16:00 +0000
Message-ID: <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
In-Reply-To: <20230911154448.GA1279317-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEYPR03MB8270:EE_
x-ms-office365-filtering-correlation-id: 4f5a6265-a57a-45c9-4990-08dbb357bc40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UuZNJruUzC7YAI6Se9zQ1BXh0pYUhea+BNRADLBZP0gxSHpLQhmAbtFv2510qsO6GpnK/j4Eep7X+V7xwmhj/40LxRlsDMABY6UEz0To5D4lJ/plrAOl2zmfZSqu0P6/aV0eD09IgAeBDHcnQsupzZSqGboWrjGi4I2E5xf4FjhG9LjgztVg2CbwPf14S4Q9FIkXewcZeBvAlPTlIqFOGhqZ9ZYM/knq6KJ1AVrYkYZYQ3gjoLKeiinzg6sQ9T4gYjiPA+7clhtivmM1qCl3mzkReFCSGmIJKVri5XK1hF91wlqg2sbpzGY9XcE8eN69xnDMupDZoTBJMtOW/c2HdoZPas/oqCAKgBXr9cHXs2cKli3unBq3DYh2Cdwtv/77F5I3r0nC94FO+R8jyEd3eZS/pM184QaK49N7ubuhapr7D5NPE8BViwug/9iVEnK4YasHBGFmlVPLfDnDIapjqY3GT1nAgZ80DobKK6qp+UJ62NsTgazfbtwRvV/5ruS5PN3bMc+6i16aSQp8D/M5wNrlZHJ6/it6TOlRN0VdL2/JdaxfsMUjlWuwDi6hPfe91fZfTcPct1jcnOIse9OCwXmPVy3doVkKod8LC4JpO90AR0B0Sv9mevRblfOvTFQwY37vi8w7edoEAYo1Dq8VZBQM1y0NXblG2ue/NCvpcUGyX9HQhFdbcPm591j2xgkK5nydcWlYL/hQTlVqSKnfnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(71200400001)(6506007)(6486002)(478600001)(83380400001)(6512007)(76116006)(4326008)(26005)(41300700001)(2616005)(966005)(66556008)(2906002)(54906003)(316002)(64756008)(6916009)(91956017)(66446008)(66946007)(8936002)(5660300002)(8676002)(66476007)(7416002)(36756003)(86362001)(85182001)(38100700002)(38070700005)(122000001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RE11YngzREhQVDZJWDBhZmFOdXl6aWIyRzJOYzV4QXlGeTYrVWp0ajlsV281?=
 =?utf-8?B?NWxHaUR5cXVRYnFyUEZVS3dUM1FWLzArVVJVL1NLVEtvVm9wMUNESUtZUndr?=
 =?utf-8?B?M0xyOHMrMUV4dU9ETEw3QW5HejZqM3dMREJjT0Z6QVA3bm5HYVFSOHpGTzVJ?=
 =?utf-8?B?Q0pFUmdqbUF5bFpaQ3pwSUJrOVMrc3NvQzFMc0JaazIrMTJPUS9LMEd2UHRN?=
 =?utf-8?B?aXdSYXBiUnhTRjlKTU92NUFkem5jcFVFNkhUeEc5V0hQUnJhUUhRelVRVXdm?=
 =?utf-8?B?SzA4WG5sWDJRTGVpWnpxOEtVUEIyT012Z1NQUUxzUkNXMW9VODEyRFhUMnR5?=
 =?utf-8?B?TlpUVjQ5SEhrYU5MN2xxQ2xCMmhOa1VIWElOY1d6VU9tUnZ0NS9ZbU9sSU95?=
 =?utf-8?B?RXpGbVZGVlprY2N0N0NkaXZRUkhuWkVicjh1QWZDQ3FqeXIvUFhWVzllV1VZ?=
 =?utf-8?B?UkJpOXptSlJPUXdsTlRTQzVVRWVtM0ZuckxZUUo1Yk5NTjBlSnpGZGo2bWRs?=
 =?utf-8?B?MnkrMXJpZGhjUEoyTjAwZWlXSE5mTVc0VmRSQ2Y0K3lnR0R1K1J5aFFITnJG?=
 =?utf-8?B?OUt2U0lKZjBzeHJsMFlIM3JxTkIrNFVMQ284bnlvTStjaUpEdjRxVkRUL2Nj?=
 =?utf-8?B?eFhxZ0Rtb1NLKy82VUdnaEJ2eU5WSi9ncWZzWVhUeWdNejEraEYwRXo1V3Zn?=
 =?utf-8?B?K0I3OWlrY1BWZWFueVdXdVVqUTFlblhMelFkNkUvbjJ0TjJpMU9YUDFGb2Mw?=
 =?utf-8?B?dlF4QWY0R1pHWmlaZUQvNlZhYXRXajdyUDFkWjlyVldaVExtYlJpRkdISjN4?=
 =?utf-8?B?K3I5ckZZeFhHSGgybUtVOFh3NFlFOGtibVh3WDY0aXBiUllyRmViRjFkeUZZ?=
 =?utf-8?B?blRDK0RDZ0REY05oNHRhYnRmdTE5T1Bneis4OXhmQXpOcENRNlFtdUl0TVND?=
 =?utf-8?B?L0lxTjY3RzVMZVZwU0NIbmNvWFMzTE91aE5QZlVGMnlMZE1YckpYZjltdGIw?=
 =?utf-8?B?V21Obit4TG1oYmZTeGpkQmRZb0JVT1I3ZnhOcXhIOFFkRzFrMlFoZDNCbTRv?=
 =?utf-8?B?cS9JQzFkNnFwbnlmUEorSEQ0N05FVWJLQ0hCbHJsdDVqSlRGN0tjRnMvbUpE?=
 =?utf-8?B?czYrWWd0aHpTb040cXBTUG42aU13cGtmRkxKalBobjZpRGFkYXA2REhXbkow?=
 =?utf-8?B?R3A1ZVVLWWdFc2VuZHBpRUFnVWRyREhUZm9DQ2ZtVXVxR05OLzRsUnpCT3N6?=
 =?utf-8?B?em54VUZxd1ZxMTNJVXZJTjVUQ2txRTR5TWdtZDdsV2hyL293eFlrYkVxMUlh?=
 =?utf-8?B?eDYvc0VzaUpFd1lyOWRuSWJCVFhrUUs1N1ZCODFQV1YxK0tiRXA0OWtiK3Rq?=
 =?utf-8?B?ZitqSUNoYkJuUVdac2pHWnlGemxtOWlRejJYY0dab0Y0d3p6dUZNOUorMEN1?=
 =?utf-8?B?a3BzTE4vU01yZUJSbUZ0b0M3M0ZaV1ZHUFdaWmdsdGF6WDhlc3RtVWRLNXNs?=
 =?utf-8?B?YUx5b0IvM2s1ZG1jdjZDTHVWdW9BT0dPaDBzbXk4YmtTMG41Q0lvSnlBOExP?=
 =?utf-8?B?Z1VwSW1lb2ZCREhMcGYyTXdSSmpRL01nTlNLOGw5TlEvOWMrc3VQMURMOXZo?=
 =?utf-8?B?bEt2SDhQalVYTWI4NGVPcmN2UHZINWVkUnlrcWlCRXFlME0ycWtBWm1KREJ4?=
 =?utf-8?B?alNaUEh4TElIV0NVQ3Z2SDRudzBBWWx6djRkbGZVV0RCcGNlN0dMUjJ3aUVN?=
 =?utf-8?B?NUxidEQ3blllclp4TUw3b2ErNEZVSmoxN3lXZ3pRTkgzb0plM0pUTGYxVDdY?=
 =?utf-8?B?MlR4YjkydS9OS2EyczBMQS9iam56K1owNHF2Tk1TN2dtc0pYWFFBY0p1SlF0?=
 =?utf-8?B?cnNGWk1MNzRpK1d2Y2d6YXFuaVovZHFsUTRTQ0hsZXJtVHZYRGswMHhPZGJ5?=
 =?utf-8?B?UmhpSURJdzNrL0E5RDAyRk1hb3JydEhNMFhMTGh3YURBb3BHaXFGajNPL1Ns?=
 =?utf-8?B?Mm95cUpoekc4aEFUQkVORTgwbkVTaWYzT2g2R1FQeGNrVjdwNHdBaEZiWUNW?=
 =?utf-8?B?TUhhcmJVb2l3c3kwSHc4U0JCSGt4ejNleW1ZdGdlRzdFSGRPclM3eUxLZlRZ?=
 =?utf-8?B?dE9OV0g4YmNvM3VDcXJub0lmN1lySHNFUll0b3Q5NzIrS2haUUdWVjRzU0RZ?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C45D0FCAA4826E4E94B3AAAA014C783C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5a6265-a57a-45c9-4990-08dbb357bc40
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 06:16:00.4648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pGcfpBrZ1zbMsCUYrYiSzGS9ZQ+MtDMx91jn24ky4QEGoT9qsCMSuae9f4m+0BwOKzPc1xMUGY8fwazWpCOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8270
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--24.145900-8.000000
X-TMASE-MatchedRID: xIhOSkOSohXUL3YCMmnG4uYAh37ZsBDC1kqyrcMalqVV1lQ/Hn0TOskU
 hKWc+gwPyGJ1SiZNgOOsXAiB6VK48AbbLE2rYg/9wvqOGBrge3t2esxkSbCUdJ722hDqHosTLIb
 YUWjS7yjbT4dHnV2cQbvrVFvaS3pvaz+0XDplNBbCz1ymGcrCUcMdI0UcXEHz8QkGgrel/G4QIz
 eIWm4OKNYl5+U3IeZnRRqEtlXbEyAEQqIqKFLtThWCVBr+Ay98hV0srjoqtx/4JyR+b5tvoHq1v
 ZPzlqkE9p+FCsxUVBP/WfkXrytReFQhXn0EVdzOSEQN/D/3cG6Zf5btvM85ATPolapMwp0IuHQ5
 SWRKq/1tSym29fvkcsCl/H6Tvsoynuh7s4XRTZaeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyL3PDi
 XO/tFSY6HM5rqDwqtlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--24.145900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F6E2396F149DA0C0B615F847A136D0584D36E7708AD6B3394D46FEEA4BB7AC762000:8
X-MTK: N
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBNb24sIDIwMjMtMDktMTEg
YXQgMTA6NDQgLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1h
aWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwN
Cj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIE9uIE1v
biwgU2VwIDExLCAyMDIzIGF0IDEwOjMwOjM3QU0gKzA4MDAsIFlvbmcgV3Ugd3JvdGU6DQo+ID4g
VGhpcyBhZGRzIHRoZSBiaW5kaW5nIGZvciBkZXNjcmliaW5nIGEgQ01BIG1lbW9yeSBmb3IgTWVk
aWFUZWsNCj4gU1ZQKFNlY3VyZQ0KPiA+IFZpZGVvIFBhdGgpLg0KPiANCj4gQ01BIGlzIGEgTGlu
dXggdGhpbmcuIEhvdyBpcyB0aGlzIHJlbGF0ZWQgdG8gQ01BPw0KDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4u
Li9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwgICAgICAgICB8IDQyDQo+ICsrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZXNlcnZlZC0NCj4gbWVtb3J5L21lZGlhdGVrLHNlY3VyZV9jbWFfY2h1bmttZW0ueWFtbA0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVz
ZXJ2ZWQtDQo+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+IG1lbW9yeS9tZWRp
YXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2MxMGUwMGQzNWM0DQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC0NCj4g
bWVtb3J5L21lZGlhdGVrLHNlY3VyZV9jbWFfY2h1bmttZW0ueWFtbA0KPiA+IEBAIC0wLDAgKzEs
NDIgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiANCj4gaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVzZXJ2ZWQtbWVtb3J5L21lZGlhdGVrLHNlY3Vy
ZV9jbWFfY2h1bmttZW0ueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVkaWFUZWsgU2Vj
dXJlIFZpZGVvIFBhdGggUmVzZXJ2ZWQgTWVtb3J5DQo+IA0KPiBXaGF0IG1ha2VzIHRoaXMgc3Bl
Y2lmaWMgdG8gTWVkaWF0ZWs/IFNlY3VyZSB2aWRlbyBwYXRoIGlzIGZhaXJseSANCj4gY29tbW9u
LCByaWdodD8NCg0KSGVyZSB3ZSBqdXN0IHJlc2VydmUgYSBidWZmZXIgYW5kIHdvdWxkIGxpa2Ug
dG8gY3JlYXRlIGEgZG1hLWJ1ZiBzZWN1cmUNCmhlYXAgZm9yIFNWUCwgdGhlbiB0aGUgc2VjdXJl
IGVuZ2luZXMoVmNvZGVjIGFuZCBEUk0pIGNvdWxkIHByZXBhcmUNCnNlY3VyZSBidWZmZXIgdGhy
b3VnaCBpdC4NCiANCkJ1dCB0aGUgaGVhcCBkcml2ZXIgaXMgcHVyZSBTVyBkcml2ZXIsIGl0IGlz
IG5vdCBwbGF0Zm9ybSBkZXZpY2UgYW5kDQp3ZSBkb24ndCBoYXZlIGEgY29ycmVzcG9uZGluZyBI
VyB1bml0IGZvciBpdC4gVGh1cyBJIGRvbid0IHRoaW5rIEkNCmNvdWxkIGNyZWF0ZSBhIHBsYXRm
b3JtIGR0c2kgbm9kZSBhbmQgdXNlICJtZW1vcnktcmVnaW9uIiBwb2ludGVyIHRvDQp0aGUgcmVn
aW9uLiBJIHVzZWQgUkVTRVJWRURNRU1fT0ZfREVDTEFSRSBjdXJyZW50bHkoVGhlIGNvZGUgaXMg
aW4gDQpbOS85XSkuIFNvcnJ5IGlmIHRoaXMgaXMgbm90IHJpZ2h0Lg0KDQpUaGVuIGluIG91ciB1
c2FnZSBjYXNlLCBpcyB0aGVyZSBzb21lIHNpbWlsYXIgbWV0aG9kIHRvIGRvIHRoaXM/IG9yDQph
bnkgb3RoZXIgc3VnZ2VzdGlvbj8NCiANCkFwcHJlY2lhdGUgaW4gYWR2YW5jZS4NCg0KPiANCj4g
PiArDQo+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhl
IHJlc2VydmVkIG1lbW9yeSBmb3Igc2VjdXJlIHZpZGVvDQo+IHBhdGguDQo+ID4gKw0KPiA+ICtt
YWludGFpbmVyczoNCj4gPiArICAtIFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+
ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiByZXNlcnZlZC1tZW1vcnkueWFtbA0KPiA+
ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgY29uc3Q6
IG1lZGlhdGVrLHNlY3VyZV9jbWFfY2h1bmttZW0NCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+
ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSByZXVzYWJsZQ0KPiA+ICsN
Cj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6
DQo+ID4gKyAgLSB8DQo+ID4gKw0KPiA+ICsgICAgcmVzZXJ2ZWQtbWVtb3J5IHsNCj4gPiArICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwx
PjsNCj4gPiArICAgICAgICByYW5nZXM7DQo+ID4gKw0KPiA+ICsgICAgICAgIHJlc2VydmVkLW1l
bW9yeUA4MDAwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWss
c2VjdXJlX2NtYV9jaHVua21lbSI7DQo+ID4gKyAgICAgICAgICAgIHJldXNhYmxlOw0KPiA+ICsg
ICAgICAgICAgICByZWcgPSA8MHg4MDAwMDAwMCAweDE4MDAwMDAwPjsNCj4gPiArICAgICAgICB9
Ow0KPiA+ICsgICAgfTsNCj4gPiAtLSANCj4gPiAyLjI1LjENCj4gPiANCg==
