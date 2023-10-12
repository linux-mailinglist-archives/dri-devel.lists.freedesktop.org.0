Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2928A7C65EA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8891C10E104;
	Thu, 12 Oct 2023 06:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E3F10E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:54:57 +0000 (UTC)
X-UUID: 3eb8154268cc11eea33bb35ae8d461a2-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=v7Pgo9wg7SLdpcrzaw/VkvY+0YEJLKDU+PrORTT++KE=; 
 b=uQ/Jon44ANbQPRb4PZHGvs5+080wnak3UldU7GYzA4coY9nr47q9AwrW5JKShbfr3yRs9DXCBoX7/OWUZkm7Abl5plWtuwZn9TodyGLgtdL+HqdOsMHXwBAQzEzOkNug3pOiIki+JxLtPBECBaxMHue++Hr8byLLouSeUlZHv7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:b3a22344-ab3c-4a10-a789-02a6952af8f0, IP:0,
 U
 RL:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:20
X-CID-META: VersionHash:5f78ec9, CLOUDID:47f3b3f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3eb8154268cc11eea33bb35ae8d461a2-20231012
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 883062587; Thu, 12 Oct 2023 14:54:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 14:54:51 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 14:54:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ305MMelpWfxMPVgyYRulRBzXABjSwSNFx21fJhrJbScFh7HnNxAjbapo7cHZAagvlhaPjCxcqHxrkLR8n+BDTQzQSBWyGoWqITGOlGeoHxaAD6fO9iMxEWd6xoW+iu2CNQ7t7/MYHmqioBN7eyvHtaU4hE/b/uv1uAm2BfZL6K+SuM3e0DWGfYVIEuVw1mgwZkpjFAlLHu/Pei/PaAPTmNxb0hKkPDM8U+MJembA5yGkbvkZQzhe0u4ek5RzrTv+Y/0isrEeFiq6haeMgA1FfahZqvVdxft7tYemDGe/k0ZopfKaQKteHhQNXYBwFfFCQi6cmPhyncN9zEqSEwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Pgo9wg7SLdpcrzaw/VkvY+0YEJLKDU+PrORTT++KE=;
 b=RhCkcqcaxG87HEIo5sNkM6qb8gN1ZxfsLvjc8dmo+yQ3PXbXzenSsX8rMOqUuMa9RNQ5UIqkfxRUcd4CIW1tObYfShC26ktU/VNMewjwQEBl3z1vFGV5ie2vrJac2VIY4qlFZRRb2R3sKvFnJPkQD7Rem5H9lRMGYDcXwYbBAH3S2OBJ+qlIpvObgFG+FusUTuz7mqychpCZUBQLtV+047805Tk52tszd76vMwoT+5c+wWEwDga37cUsazJgqUzd2UMpwzfGUuGowd/KkXH+UcrB8TJV5rBe9uFBHQR8dMl0Z1lOEOkQkL3nokHM6hW7rgs4ftw5hArNO2shy9eN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Pgo9wg7SLdpcrzaw/VkvY+0YEJLKDU+PrORTT++KE=;
 b=GsD0rxABzwyLjgEv49mBV+RRCtJeGmpWYDuJKvxpe4wfdcBdL/mUv7mYcortA14t0BVUioVWKKJjASie3YJABN4YrsW+UoyUimotMPov2h9VXbn8EqLCi3qFfzSsFBwnVzZsipqwJzDAMZbsPRmAGwvRWf2fK3jHzNRmPoLqEDo=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB7364.apcprd03.prod.outlook.com (2603:1096:400:420::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Thu, 12 Oct
 2023 06:54:49 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::363a:e9b4:c6c7:48ef%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 06:54:49 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "jkardatzke@google.com"
 <jkardatzke@google.com>, "krzysztof.kozlowski@linaro.org"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Topic: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Thread-Index: AQHZ5FgxjegLVruM7kG7VRoFLocLPrAVxRkAgADzaICAACUMgIAAHWgAgABe8QCACRiEgIACUqGAgCMkPoA=
Date: Thu, 12 Oct 2023 06:54:48 +0000
Message-ID: <8dbdb1e3e18cc290c8949947245b3c1eda83b6a3.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
 <20230911154448.GA1279317-robh@kernel.org>
 <c2f1df12cc2dc25b342029e49c6d3f120d380b47.camel@mediatek.com>
 <c62a7ed8-d80a-3a82-040a-d4c74a71285a@linaro.org>
 <95f9dd3b-1f33-4af5-8757-a97e8b9bb216@arm.com>
 <20230912155338.GA842444-robh@kernel.org>
 <a63ab61fbf4d2bdadeb68441050ff5187c93ba96.camel@mediatek.com>
 <CA+ddPcPFFpDA2qtxMg6BNztsXi3mVFRghBwe6556mAL54jB06g@mail.gmail.com>
In-Reply-To: <CA+ddPcPFFpDA2qtxMg6BNztsXi3mVFRghBwe6556mAL54jB06g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB7364:EE_
x-ms-office365-filtering-correlation-id: f8c1c466-3313-47ea-d994-08dbcaf02092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UAXr4Ap+0EIXj7s0YIhkQjWUvhWXdJBeltY8uLhrXRWJtuGhMV22VMWiax2z6L/ewm/KEYET60RS2Pw/qmkP3eJy6C7/R8ytQkKKJfXGq2g/Zvnc+D3WqCOFzOEgQ7UIl6vwg8peg2KZ7MXSGbYpdKEhlHGL/DQQGt875MXs9yMNSq84NdkeheMu9IIMkLKyBU1iE6Tc7cA8OzILgIE1s9eATJFRmSdLtZx7XhXs5p+e40Zysnma2MzQ1Ae2KUMVBG+1kNUzII8WR2hxpYZGk4WZIB3l/abvVuMukp6IgaSipgt+c1QCvp3nCG3i3+UD3RrS6es5fRs3hul/sa3qTHmhgQC3fd+ePTBplev2uwFiYI/Dfb5ac7IN8TCTjSbmWQiSxkCE9EcFWsd8HNcx6H3Iwz2f/dw3ubifcDIgxS4JgK5qRzPrhAIeiJ3X5HdKrwA7sfTDuRU8dNQL14i1lqhv637xqLKmfotx7n2ZP/WzvAuNzLH+CUwZmbLJhV5tKkel3Lg64gXhQILCs+PBMeQcYoS28lggKc3K3Qx0uUMeuVrzadlHE5E7QAkUB3XgCBelmX0N3rY04AjYHwQjm0fal3ysGoxPMLWJY1/rifdlypt/JRcFfLQFwHO6XWJKsYiim4HfQVZK4Jw/YPoVAZVcu3p60FBggDH3wtbxxbHUh68JSqThMUGeXt82ln4inyxzVTbPYNPv3B5fxCtUbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(85182001)(6506007)(53546011)(6512007)(26005)(71200400001)(36756003)(966005)(6486002)(478600001)(2616005)(110136005)(66946007)(83380400001)(66476007)(64756008)(316002)(66556008)(66446008)(38100700002)(54906003)(76116006)(122000001)(41300700001)(8676002)(4326008)(8936002)(5660300002)(38070700005)(66899024)(2906002)(86362001)(7416002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1I5ek1xMURydWhVcndEa3J6SlA4VWI2dDV5U3hkbFVJVnB4dWtGN0VLU3lX?=
 =?utf-8?B?NEpXNm45M1dwdzJnNlpibnFPUk4rYUROUktJTVVKKzFZanNZbFlyQnlNSGg5?=
 =?utf-8?B?cWtFeUFka3psem9XSU5NYm5FMDB6TU5qT0lmMXBtU1BmaUliVjN6UUlTTGNQ?=
 =?utf-8?B?UU1FclNZR1hBblYyaURFN3BTQ2s3QmZjbTUzeW5vMjlxVjZ0aUhOZmsyZW55?=
 =?utf-8?B?Y0dROWpsTURCUlpNTC9udGlNNDhSRFZVQWN6RDhCTy8wa01HZ0IrMEhjNkFW?=
 =?utf-8?B?dk5PYlBORkhmL1dVcS9WK3pHTGJGS0wyZVc0MGpHUElOcUpSNjhTVmlwL0ZI?=
 =?utf-8?B?TG0xeStYcmZWTHI2Wko1V3NMZVROczVZRCtDZVdIWTVVNENGQUZCUXF6UVo5?=
 =?utf-8?B?b1BKUlcrTUZ4Mk9GV0VNdjJYblFWbkpTd1RHdlRNVHo5a09lRlh5N0pKQU1m?=
 =?utf-8?B?MlJrd2RxRWdjc2NrTjdvTHk4ZzVXQ29LRytUS3JaVDBIOGl3WWpIRnNudXV2?=
 =?utf-8?B?c2JEc0VaL0dwM0lrUitqcURya1JrbVFJZnhScnBWeFFSRTR4REZNRWl2WFRo?=
 =?utf-8?B?VjNKRlJOUmFXMElXaXc0SWlETE9SN3dBajA4aThPdUZ5cmtCaUIrUmRVRERj?=
 =?utf-8?B?Vk9aT29wL1BaVXhOMXJ4SXk2M0hwR01nZmZZSk1oOXZ0cjJFZjhaSTVhWFpn?=
 =?utf-8?B?OVpOck9HdGJ0Y0pZWUZ0WDNHUnByWnZrNWZvV0hhcGVXbWdBanlzdnFZWmRZ?=
 =?utf-8?B?Nm5FMmg0TWt0K2kxREl2dk45SlVlTjU3ZEpOSkxocm9GZkpsMXdMeTloZmlH?=
 =?utf-8?B?ckxuVVNiUys2U3Qydkk0YXdCQXdsWFlVWCtFVzZBS2RBanJuelRWcG95OUFE?=
 =?utf-8?B?b1c1ZnU0bFZDcUwyaEJCV1NwQ28yNGdTa1lSVnRucU56bFpsc0pxMEl2OEt5?=
 =?utf-8?B?ZUFzcWVla2RYSGdZN3FyS0pqUzUzTmt2WnlmSE1laTFYZDVsY2p4TEM0MWhM?=
 =?utf-8?B?S3BFRXNYRFZKbWhlK01hTEYvNkVMTFhnN0QrYUxzY2pod05lbHYyZy9TbG1x?=
 =?utf-8?B?TWhiZ2I4R05kTjhsUjhMR0pCMEtPaU9YVXV4S0ZCbHpONy9yL2NxRlZrUjNw?=
 =?utf-8?B?TGZ1YkoyYzI2bkJib05welF5bkd3cW53YjhlbXpqL1NXaHRZZ3pONnVxeXpp?=
 =?utf-8?B?MXluU090Z2YzSW8zSXE4M1NSVExINjRqZWhMUWVvWDJnUytsaXR3eFpRQ1ls?=
 =?utf-8?B?VXNLOTNZSVhFSHcwNEI3SGphdmQzL2VzSmJtUFFQc05ZVFBSMERlTFFEa0tK?=
 =?utf-8?B?TkhtaUMvei9FTWkreGwwVTVwcVU1OG1EUTQrZHZOaFplZzZtcXBIZTdwa2pT?=
 =?utf-8?B?cUZuNHFLaUZUai9iRVdrOVUxbTFJZG1XL2NFb1dmOUtWckg3VFZaVWlmdzdu?=
 =?utf-8?B?T0hFSVJlZHNlVHdvazQ1T1ZKd01GMnVnUmVCcHM5aXNMR1VZY1VXbExYbVdx?=
 =?utf-8?B?NmJuM0hueWxNSjhEcEJzL1VVTmlPVGRJTlg4NGlhZ3BUc2tyVnNrYmROcnp5?=
 =?utf-8?B?Y3VOYjBFNE4xdzRkaGVSSWFFay9RRU9HZVRYeUx0ejcrWWFQT2lhMVRHS2Qw?=
 =?utf-8?B?elZkK3laVGsrRVA3dVRnOElvSnU2c3ZzWEdBcFQ4Rm1Hd3FhTXY0cTNLOUZh?=
 =?utf-8?B?eUlqT093Yng3cXJ0eUNSR3hQZEY3TERqME9SdzJWU1M4TVIwWGpmV1NETFhT?=
 =?utf-8?B?RE10SG8rN0lIRTVyWldHcWtSQzREL25SQ21NY2w1RTFqQTFFSWlqUGJkZTI0?=
 =?utf-8?B?cmtDYXBXRkYwek9tOFpwWGxYMDlOQ1Mxcml1Ynl5OHF2c01aa1pFZmc5TWpQ?=
 =?utf-8?B?V0gzek9KZi9WZjRKbGtxNnNCelFDWDBPejAvS0t3Q0NQQ3BvdUx5MUZtc1Jt?=
 =?utf-8?B?c1p4dEVBcGQwWVRlaHVZWTNkWkhUSURMRjAydGtJNW9yQVVYMUFQYkpHNE80?=
 =?utf-8?B?YTl2OWhDTm1xVWxCVG1jZG1hTVNxdjVBTU55MU1peEErZlp4REhHaENnYThW?=
 =?utf-8?B?c0lQRHFFUmN5aVJKb2Zvdy83dG9ETTJQYkMvWHo5bFpqUmc2SEJsN0NzNHhI?=
 =?utf-8?B?dVBsdkpwblVEcmtYTzlTQXhzSVBQa1dwS2FmSWNCcWRMUWlDai9kQVJiV3R5?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <216DC2F740DF544E8A9E88F8DEABB62D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c1c466-3313-47ea-d994-08dbcaf02092
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 06:54:49.0271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvqokl4lrepY8fvpAjpFfQEMOH46GRZeQg6Lzgy6jEc4CloC+8xHD8L98tI++yXASmjBbkihyZXDvCp3JeVn8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7364
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
 "krzysztof.kozlow.ski+dt@linaro.org" <krzysztof.kozlow.ski+dt@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpUaGFua3MgSmVmZnJleSBmb3IgdGhlIGFkZGl0aW9uLg0KDQpIaSBSb2IsIGtyenlzenRvZiwN
Cg0KSnVzdCBhIHBpbmcuIElzIEplZmZyZXkncyByZXBseSBvayBmb3IgeW91Pw0KDQpUaGFua3Mu
DQoNCg0KT24gVHVlLCAyMDIzLTA5LTE5IGF0IDE1OjE1IC0wNzAwLCBKZWZmcmV5IEthcmRhdHpr
ZSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBPbiBNb24sIFNlcCAxOCwgMjAyMyBhdCAzOjQ34oCv
QU0gWW9uZyBXdSAo5ZC05YuHKSA8WW9uZy5XdUBtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gT24gVHVlLCAyMDIzLTA5LTEyIGF0IDEwOjUzIC0wNTAwLCBSb2IgSGVycmluZyB3cm90
ZToNCj4gPiA+DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiB1bnRpbA0KPiA+ID4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+ICBPbiBUdWUsIFNlcCAxMiwgMjAyMyBh
dCAxMToxMzo1MEFNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6DQo+ID4gPiA+IE9uIDEyLzA5
LzIwMjMgOToyOCBhbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+ID4gPiBPbiAx
Mi8wOS8yMDIzIDA4OjE2LCBZb25nIFd1ICjlkLTli4cpIHdyb3RlOg0KPiA+ID4gPiA+ID4gSGkg
Um9iLA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gTW9uLCAyMDIzLTA5LTExIGF0IDEwOjQ0IC0wNTAw
LCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gRXh0ZXJu
YWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gPiA+IGF0dGFj
aG1lbnRzIHVudGlsDQo+ID4gPiA+ID4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+ID4gPiA+ID4gPiA+ICAgT24gTW9uLCBTZXAgMTEsIDIwMjMgYXQg
MTA6MzA6MzdBTSArMDgwMCwgWW9uZyBXdQ0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBUaGlz
IGFkZHMgdGhlIGJpbmRpbmcgZm9yIGRlc2NyaWJpbmcgYSBDTUEgbWVtb3J5IGZvcg0KPiA+ID4g
TWVkaWFUZWsNCj4gPiA+ID4gPiA+ID4gU1ZQKFNlY3VyZQ0KPiA+ID4gPiA+ID4gPiA+IFZpZGVv
IFBhdGgpLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBDTUEgaXMgYSBMaW51eCB0aGlu
Zy4gSG93IGlzIHRoaXMgcmVsYXRlZCB0byBDTUE/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRp
YXRlay5jb20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gICAuLi4vbWVk
aWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sICAgICAgICAgfCA0Mg0KPiA+ID4gPiA+ID4g
PiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+ID4gPiA+
ID4gPiA+IG1lbW9yeS9tZWRpYXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+ID4gPiA+ID4gPiA+IG1lbW9yeS9tZWRpYXRl
ayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtDQo+ID4gPiA+ID4gPiA+IG1lbW9yeS9tZWRp
YXRlayxzZWN1cmVfY21hX2NodW5rbWVtLnlhbWwNCj4gPiA+ID4gPiA+ID4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2MxMGUwMGQz
NWM0DQo+ID4gPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC0NCj4gPiA+ID4gPiA+
ID4gbWVtb3J5L21lZGlhdGVrLHNlY3VyZV9jbWFfY2h1bmttZW0ueWFtbA0KPiA+ID4gPiA+ID4g
PiA+IEBAIC0wLDAgKzEsNDIgQEANCj4gPiA+ID4gPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi0NCj4gQ2xhdXNlKQ0KPiA+ID4gPiA+ID4g
PiA+ICslWUFNTCAxLjINCj4gPiA+ID4gPiA+ID4gPiArLS0tDQo+ID4gPiA+ID4gPiA+ID4gKyRp
ZDoNCj4gPiA+ID4gPiA+ID4NCj4gPiA+IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9yZXNlcnZlZC1tZW1vcnkvbWVkaWF0ZWssc2VjdXJlX2NtYV9jaHVua21lbS55YW1sIw0KPiA+
ID4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMNCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gK3RpdGxlOiBN
ZWRpYVRlayBTZWN1cmUgVmlkZW8gUGF0aCBSZXNlcnZlZCBNZW1vcnkNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gV2hhdCBtYWtlcyB0aGlzIHNwZWNpZmljIHRvIE1lZGlhdGVrPyBTZWN1
cmUgdmlkZW8gcGF0aA0KPiBpcw0KPiA+ID4gZmFpcmx5DQo+ID4gPiA+ID4gPiA+IGNvbW1vbiwg
cmlnaHQ/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSGVyZSB3ZSBqdXN0IHJlc2VydmUgYSBi
dWZmZXIgYW5kIHdvdWxkIGxpa2UgdG8gY3JlYXRlIGENCj4gZG1hLQ0KPiA+ID4gYnVmIHNlY3Vy
ZQ0KPiA+ID4gPiA+ID4gaGVhcCBmb3IgU1ZQLCB0aGVuIHRoZSBzZWN1cmUgZW5naW5lcyhWY29k
ZWMgYW5kIERSTSkgY291bGQNCj4gPiA+IHByZXBhcmUNCj4gPiA+ID4gPiA+IHNlY3VyZSBidWZm
ZXIgdGhyb3VnaCBpdC4NCj4gPiA+ID4gPiA+IEJ1dCB0aGUgaGVhcCBkcml2ZXIgaXMgcHVyZSBT
VyBkcml2ZXIsIGl0IGlzIG5vdCBwbGF0Zm9ybQ0KPiA+ID4gZGV2aWNlIGFuZA0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gQWxsIGRyaXZlcnMgYXJlIHB1cmUgU1cuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IHdlIGRvbid0IGhhdmUgYSBjb3JyZXNwb25kaW5nIEhXIHVuaXQgZm9yIGl0LiBUaHVzIEkg
ZG9uJ3QNCj4gPiA+IHRoaW5rIEkNCj4gPiA+ID4gPiA+IGNvdWxkIGNyZWF0ZSBhIHBsYXRmb3Jt
IGR0c2kgbm9kZSBhbmQgdXNlICJtZW1vcnktcmVnaW9uIg0KPiA+ID4gcG9pbnRlciB0bw0KPiA+
ID4gPiA+ID4gdGhlIHJlZ2lvbi4gSSB1c2VkIFJFU0VSVkVETUVNX09GX0RFQ0xBUkUgY3VycmVu
dGx5KFRoZQ0KPiBjb2RlIGlzDQo+ID4gPiBpbg0KPiA+ID4gPiA+ID4gWzkvOV0pLiBTb3JyeSBp
ZiB0aGlzIGlzIG5vdCByaWdodC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElmIHRoaXMgaXMgbm90
IGZvciBhbnkgaGFyZHdhcmUgYW5kIHlvdSBhbHJlYWR5IHVuZGVyc3RhbmQNCj4gdGhpcw0KPiA+
ID4gKHNpbmNlDQo+ID4gPiA+ID4geW91IGNhbm5vdCB1c2Ugb3RoZXIgYmluZGluZ3MpIHRoZW4g
eW91IGNhbm5vdCBoYXZlIGN1c3RvbQ0KPiA+ID4gYmluZGluZ3MgZm9yDQo+ID4gPiA+ID4gaXQg
ZWl0aGVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlbiBpbiBvdXIg
dXNhZ2UgY2FzZSwgaXMgdGhlcmUgc29tZSBzaW1pbGFyIG1ldGhvZCB0byBkbw0KPiA+ID4gdGhp
cz8gb3INCj4gPiA+ID4gPiA+IGFueSBvdGhlciBzdWdnZXN0aW9uPw0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gRG9uJ3Qgc3R1ZmYgc29mdHdhcmUgaW50byBEVFMuDQo+ID4gPiA+DQo+ID4gPiA+IEFy
ZW4ndCBtb3N0IHJlc2VydmVkLW1lbW9yeSBiaW5kaW5ncyBqdXN0IHNvZnR3YXJlIHBvbGljeSBp
Zg0KPiB5b3UNCj4gPiA+IGxvb2sgYXQgaXQNCj4gPiA+ID4gdGhhdCB3YXksIHRob3VnaD8gSUlV
QyB0aGlzIGlzIGEgcG9vbCBvZiBtZW1vcnkgdGhhdCBpcyB2aXNpYmxlDQo+IGFuZA0KPiA+ID4g
PiBhdmFpbGFibGUgdG8gdGhlIE5vbi1TZWN1cmUgT1MsIGJ1dCBpcyBmdW5kYW1lbnRhbGx5IG93
bmVkIGJ5DQo+IHRoZQ0KPiA+ID4gU2VjdXJlDQo+ID4gPiA+IFRFRSwgYW5kIHBhZ2VzIHRoYXQg
dGhlIFRFRSBhbGxvY2F0ZXMgZnJvbSBpdCB3aWxsIGJlY29tZQ0KPiA+ID4gcGh5c2ljYWxseQ0K
PiA+ID4gPiBpbmFjY2Vzc2libGUgdG8gdGhlIE9TLiBUaHVzIHRoZSBwbGF0Zm9ybSBkb2VzIGlt
cG9zZQ0KPiBjb25zdHJhaW50cw0KPiA+ID4gb24gaG93IHRoZQ0KPiA+ID4gPiBOb24tU2VjdXJl
IE9TIG1heSB1c2UgaXQsIGFuZCBwZXIgdGhlIHJlc3Qgb2YgdGhlIHJlc2VydmVkLQ0KPiBtZW1v
cnkNCj4gPiA+IGJpbmRpbmdzLA0KPiA+ID4gPiBkZXNjcmliaW5nIGl0IGFzIGEgInJldXNhYmxl
IiByZXNlcnZhdGlvbiBzZWVtcyBlbnRpcmVseQ0KPiA+ID4gYXBwcm9wcmlhdGUuIElmDQo+ID4g
PiA+IGFueXRoaW5nIHRoYXQncyAqbW9yZSogcGxhdGZvcm0tcmVsYXRlZCBhbmQgc28gRFQtcmVs
ZXZhbnQgdGhhbg0KPiA+ID4gdHlwaWNhbA0KPiA+ID4gPiBhcmJpdHJhcnkgcmVzZXJ2YXRpb25z
IHdoaWNoIGp1c3QgcmVwcmVzZW50ICJzYXZlIHNvbWUgbWVtb3J5DQo+IHRvDQo+ID4gPiBkZWRp
Y2F0ZSB0bw0KPiA+ID4gPiBhIHBhcnRpY3VsYXIgZHJpdmVyIiBhbmQgZG9uJ3QgYWN0dWFsbHkg
YmVhciBhbnkgcmVsYXRpb25zaGlwDQo+IHRvDQo+ID4gPiBmaXJtd2FyZSBvcg0KPiA+ID4gPiBo
YXJkd2FyZSBhdCBhbGwuDQo+ID4gPg0KPiA+ID4gWWVzLCBhIG1lbW9yeSByYW5nZSBkZWZpbmVk
IGJ5IGhhcmR3YXJlIG9yIGZpcm13YXJlIGlzIHdpdGhpbg0KPiBzY29wZQ0KPiA+ID4gb2YNCj4g
PiA+IERULiAoQ01BIGF0IGFyaWJpdHJhcnkgYWRkcmVzcyB3YXMgcXVlc3Rpb25hYmxlLikNCj4g
Pg0KPiANCj4gQmVmb3JlIEkgcmVwbHksIG15IGNvbnRleHQgaXMgdGhhdCBJJ20gdXNpbmcgdGhl
c2UgcGF0Y2hlcyBmcm9tDQo+IE1lZGlhdGVrIG9uIENocm9tZU9TIHRvIGltcGxlbWVudCBzZWN1
cmUgdmlkZW8gcGxheWJhY2suDQo+IA0KPiA+IEkgZ3Vlc3MgdGhlIG1lbW9yeSByYW5nZSBpcyBu
b3QgImRlZmluZWQiIGJ5IEhXIGluIG91ciBjYXNlLCBidXQNCj4gdGhpcw0KPiA+IHJlc2VydmUg
YnVmZmVyIGlzIGluZGVlZCBwcmVwYXJlZCBmb3IgYW5kIHVzZWQgYnkgSFcuDQo+ID4NCj4gVGhl
IG1lbW9yeSByYW5nZSBpcyBkZWZpbmVkIGluIHRoZSBmaXJtd2FyZS4gVGhlIFRFRSBpcyBjb25m
aWd1cmVkDQo+IHdpdGggdGhlIHNhbWUgYWRkcmVzcy9zaXplIHRoYXQgaXMgYmVpbmcgc2V0IGlu
IHRoaXMgRFQgbm9kZS4gKHNvDQo+IGJhc2VkIG9uIGNvbW1lbnRzIGFscmVhZHksIHRoaXMgaXMg
YXBwcm9wcmlhdGUgdG8gcHV0IGluIHRoZSBEVCkuDQo+IA0KPiA+IElmIHRoaXMgaXMgYSBub3Jt
YWwgcmVzZXJ2ZWQgYnVmZmVyIGZvciBzb21lIGRldmljZSwgd2UgY291bGQNCj4gZGVmaW5lIGEN
Cj4gPiByZXNlcnZlZC1tZW1vcnkgd2l0aCAic2hhcmVkLWRtYS1wb29sIiwgdGhlbiB0aGUgZGV2
aWNlIHVzZSBpdCB2aWENCj4gPiAibWVtb3J5LXJlZ2lvbiIgcHJvcGVydHksIGlzIHRoaXMgcmln
aHQ/DQo+ID4NCj4gPiBIZXJlIGl0IGlzIGEgc2VjdXJlIGJ1ZmZlciBjYXNlIGFuZCB0aGlzIHVz
YWdlIHJlbGF0aW9uc2hpcCBpcw0KPiA+IGluZGlyZWN0LiBXZSBjcmVhdGUgYSBuZXcgaGVhcCBm
b3IgdGhpcyBuZXcgc2VjdXJlIHR5cGUgbWVtb3J5LA0KPiBvdGhlcg0KPiA+IHVzZXJzIHN1Y2gg
YXMgVkNPREVDIGFuZCBEUk0gYWxsb2NhdGUgc2VjdXJlIG1lbW9yeSB0aHJvdWdoIHRoZSBuZXcN
Cj4gPiBoZWFwLg0KPiA+DQo+ID4gQWJvdXQgdGhlIGFyaWJpdHJhcnkgYWRkcmVzcyBpcyBiZWNh
dXNlIHdlIGhhdmUgSFcgcmVnaXN0ZXIgZm9yIGl0Lg0KPiBBcw0KPiA+IGxvbmcgYXMgdGhpcyBp
cyBhIGxlZ2FsIGRyYW0gYWRkcmVzcywgaXQgaXMgZmluZS4gV2hlbiB0aGlzIGFkZHJlc3MNCj4g
aXMNCj4gPiBwYXNzZWQgaW50byBURUUsIGl0IHdpbGwgYmUgcHJvdGVjdGVkIGJ5IEhXLg0KPiA+
DQo+ID4gPg0KPiA+ID4gTXkgaXNzdWUgaGVyZSBpcyBtb3JlIHRoYXQgJ3NlY3VyZSB2aWRlbyBt
ZW1vcnknIGlzIG5vdCBhbnkgd2F5DQo+ID4gPiBNZWRpYXRlaw0KPiA+ID4gc3BlY2lmaWMuDQo+
ID4NCj4gPiBTb3JyeSwgSSBkb24ndCBrbm93IGlmIHRoZXJlIGFscmVhZHkgaXMgYW4gU1ZQIGNh
c2UgaW4gdGhlIGN1cnJlbnQNCj4gPiBrZXJuZWwuIElmIHNvLCBjb3VsZCB5b3UgaGVscCBzaGFy
ZSBpdD8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55IFNWUCAoU2VjdXJlIFZpZGVv
IFBhdGgpIGNhc2UgaW4gdGhlDQo+IGN1cnJlbnQNCj4ga2VybmVsLiBJIGFncmVlIHRoaXMgc2hv
dWxkbid0IGJlIGEgTWVkaWF0ZWsgc3BlY2lmaWMgc2V0dGluZywgYXMNCj4gdGhpcw0KPiBjb3Vs
ZCBiZSB1c2FibGUgdG8gb3RoZXIgU1ZQIGltcGxlbWVudGF0aW9ucy4NCj4gDQo+IEkgZG8gdGhp
bmsgdGhpcyBzaG91bGQgaGF2ZSAnY21hJyBpbiB0aGUgRFQgZGVzY3JpcHRpb24sIGFzIGl0IGRv
ZXMNCj4gcmVsYXRlIHRvIHdoYXQgdGhlIGRyaXZlciBpcyBnb2luZyB0byBkbyB3aXRoIHRoaXMg
bWVtb3J5IHJlZ2lvbi4gSXQNCj4gd2lsbCBlc3RhYmxpc2ggaXQgYXMgYSBDTUEgcmVnaW9uIGlu
IExpbnV4LiBUaGUgcmVhc29uIGl0IG5lZWRzIHRvIGJlDQo+IGEgQ01BIHJlZ2lvbiBpcyB0aGF0
IHRoZSBlbnRpcmUgbWVtb3J5IHJlZ2lvbiB3aWxsIG5lZWQgdG8gdHJhbnNpdGlvbg0KPiBiZXR3
ZWVuIHNlY3VyZSAoaS5lLiBURUUgb3duZWQpIGFuZCBub24tc2VjdXJlIChpLmUuIGtlcm5lbCBv
d25lZCkuDQo+IFNvbWUgY2hpcHNldHMgaGF2ZSB0aGUgYWJpbGl0eSB0byBjaGFuZ2UgbWVtb3J5
IHN0YXRlcyBiZXR3ZWVuIHNlY3VyZQ0KPiAmIG5vbi1zZWN1cmUgYXQgcGFnZSBsZXZlbCBncmFu
dWxhcml0eSwgYW5kIGluIHRoZXNlIGNhc2VzIHlvdSBkb24ndA0KPiBuZWVkIHRvIHdvcnJ5IGFi
b3V0IGhhdmluZyBhIENNQSByZWdpb24gbGlrZSB0aGlzLiBUaGF0IGlzIG5vdCB0aGUNCj4gY2Fz
ZSBvbiB0aGUgTWVkaWF0ZWsgY2hpcHMgd2hlcmUgdGhlcmUgaXMgYSBsaW1pdCB0byBob3cgbWFu
eSByZWdpb25zDQo+IHlvdSBjYW4gbWFyayBhcyBzZWN1cmUuIEluIG9yZGVyIHRvIGRlYWwgd2l0
aCB0aGF0IGxpbWl0YXRpb24sIG9uY2UgYQ0KPiBzZWN1cmUgYWxsb2NhdGlvbiBuZWVkcyB0byBi
ZSBwZXJmb3JtZWQsIHRoZSBrZXJuZWwgZHJpdmVyIGFsbG9jYXRlcw0KPiB0aGUgZW50aXJlIENN
QSByZWdpb24gc28gbm90aGluZyBlbHNlIHdpbGwgdXNlIGl0LiBUaGVuIGl0IG1hcmtzIHRoYXQN
Cj4gd2hvbGUgcmVnaW9uIHNlY3VyZSBhbmQgdGhlIFRFRSBjYW4gZG8gaXRzIG93biBhbGxvY2F0
aW9ucyBmcm9tIHRoYXQNCj4gcmVnaW9uLiBXaGVuIGFsbCB0aG9zZSBhbGxvY2F0aW9ucyBhcmUg
ZnJlZWQsIGl0IGNhbiBtYXJrIHRoYXQgcmVnaW9uDQo+IGFzIG5vbi1zZWN1cmUgYWdhaW4sIGRy
b3AgdGhlIHdob2xlIENNQSBhbGxvY2F0aW9uIGFuZCB0aGUga2VybmVsIGNhbg0KPiBtYWtlIHVz
ZSBvZiB0aGF0IENNQSByZWdpb24gYWdhaW4uICAodGhlcmUgaXMgdGhlIG90aGVyIGRtYS1oZWFw
IGluDQo+IHRoZWlyIHBhdGNoZXMsIHdoaWNoIGlzIGZvciBhIHNtYWxsZXIgcmVnaW9uIHRoYXQg
Y2FuIGFsd2F5cyBiZQ0KPiBzZWN1cmUuLi5idXQgdGhhdCBvbmUgaXMgYSBwZXJtYW5lbnQgY2Fy
dmVvdXQsIHRoZSBDTUEgcmVnaW9uIGlzDQo+IGF2YWlsYWJsZSB0byB0aGUga2VybmVsIHdoaWxl
IG5vdCBpbiB1c2UgZm9yIHNlY3VyZSBtZW1vcnkpDQo+IA0KPiBTbyBtYXliZSBzb21ldGhpbmcg
bGlrZToNCj4gDQo+ICt0aXRsZTpTZWN1cmUgUmVzZXJ2ZWQgQ01BIFJlZ2lvbg0KPiArDQo+ICtk
ZXNjcmlwdGlvbjoNCj4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyBhIENNQSByZWdpb24gdGhh
dCBjYW4gZHluYW1pY2FsbHkNCj4gdHJhbnNpdGlvbg0KPiBiZXR3ZWVuIHNlY3VyZSBhbmQgbm9u
LXNlY3VyZSBzdGF0ZXMgdGhhdCBhIFRFRSBjYW4gYWxsb2NhdGUgbWVtb3J5DQo+IGZyb20uDQo+
ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29t
Pg0KPiArDQo+ICthbGxPZjoNCj4gKyAgLSAkcmVmOiByZXNlcnZlZC1tZW1vcnkueWFtbA0KPiAr
DQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBzZWN1cmVf
Y21hX3JlZ2lvbg0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0g
cmVnDQo+ICsgIC0gcmV1c2FibGUNCj4gKw0KPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxz
ZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsNCj4gKyAgICByZXNlcnZlZC1tZW1v
cnkgew0KPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gKyAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MT47DQo+ICsgICAgICAgIHJhbmdlczsNCj4gKw0KPiArICAgICAgICByZXNlcnZl
ZC1tZW1vcnlAODAwMDAwMDAgew0KPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzZWN1cmVf
Y21hX3JlZ2lvbiI7DQo+ICsgICAgICAgICAgICByZXVzYWJsZTsNCj4gKyAgICAgICAgICAgIHJl
ZyA9IDwweDgwMDAwMDAwIDB4MTgwMDAwMDA+Ow0KPiArICAgICAgICB9Ow0KPiArICAgIH07DQo=
