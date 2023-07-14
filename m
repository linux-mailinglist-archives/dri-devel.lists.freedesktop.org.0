Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD2753259
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BD410E7CB;
	Fri, 14 Jul 2023 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555210E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 06:57:30 +0000 (UTC)
X-UUID: aed7d740221311eeb20a276fd37b9834-20230714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gftCCKCojVqb7Hpn8GKWWds/51GmNNwDPSQ2e+kxKlU=; 
 b=norKa65vZTAWD6clbgOTECmIoFvwey4sQK2XNUL8Z+6nq0PT3HLtn6dAOpoS+JMapGdXWPs8ECmHCf7zSmuUWZF8OmoN6k6qu8FEG+hGNMCjXN/zQSt4aypT5IyW9VxGnfa9o2dZ17XkstitKc7RGBM/bktIJFrnPqpf4OKYhws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:c7dc5f67-bffe-4ca7-897a-ecb1253e432f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:176cd25, CLOUDID:f0f896dc-dc79-4898-9235-1134b97257a8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aed7d740221311eeb20a276fd37b9834-20230714
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 90055948; Fri, 14 Jul 2023 14:57:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jul 2023 14:57:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jul 2023 14:57:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imOhr0evqhkiW8tu3/RstLY88BPwGE3ZJiPVDfS+p9DNg7jrUBKsGGFgp8p9/5PdpZvuxaNWtZAaF0mxn9vJfJa0wQc1ss+rS/p2E/j1dqmXeuC7rmKuYJ0Pf77v5L+U+RSeuMU/U3x6o+m1QK9odwbH82cosv2pWsVaUUrC2bIGujRfskfTmkqYcJG4yf0UVFhXnEi5Rta4WfUlk3f35h2yC2JvxkPxLqYB6z7dxmXVUsaryaGCpHFGfwmvBWf0Gc6X7Q5l56oAS/kBIbD9ykjQZTRwtCseTaeOgjHu8zvgZdyTpHTXUNevAsXssJC2/gcQ1VR6Ls+6vPPigY3pOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6cd/H929heQRDefIy1aBnZdxe85jz/037WO21ZN3Uk=;
 b=Zxrax9YQ7jzQn5Z7SQMXXxz/NtqQ/J4CufEkjoWcz9sbB0pyO4JEP9hDj0HM2tFSDUmURC1Grwj3SBM+hfedVN6V3vd45Vq5gkBiOSdBxEi6FiQFJRzHyhP9hlW8689QiaXH83ApsudylJZcMsvob3/3xSzMtDLOVXmmuivtJekYkCyuW5AtrTofvV6YRZzS0JWKR/A73yyjEsiXyhzQaJQziJyF7e8fk/x77ciJYqyTdnRAg4tqvEzrmemXoqkSClRZqQsI8uyWYumsuLTraU6j87tdZayuKEiIIsYQJgnFtWxfq/BaDbFYGMPUc3VxqbHlEFXjXlh9wXBKePDPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6cd/H929heQRDefIy1aBnZdxe85jz/037WO21ZN3Uk=;
 b=fqn98DfWBLrlgWOsjZgsfBNvzEogvwXOysPEA3tsuDcWO5Tk8yljJig/h9DsTiZduToGLSjCm4e2J7AizQfF2dvKno5JVtO6Ic/li+x91jbWQQPG/S7w8l2hT82BYTYAgbNf6FwRpyxdD6OkmrF3zjBus93OpMquITYYFxtnTIQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB5635.apcprd03.prod.outlook.com (2603:1096:820:5c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 06:57:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%7]) with mapi id 15.20.6588.022; Fri, 14 Jul 2023
 06:57:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Topic: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Index: AQHZsxGwMq+9pCAEu0Ga9M97Dlv5zq+42rSA
Date: Fri, 14 Jul 2023 06:57:17 +0000
Message-ID: <9ba9347d4e5e05299fef80707bd1b3c5db61d657.camel@mediatek.com>
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230710093253.32224-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB5635:EE_
x-ms-office365-filtering-correlation-id: 98bced02-9304-48b7-7d85-08db84379022
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ILWfymTjoR6w0glpszsMaphC1mXllS5PUNAXRhStsJ7LXLRDmDZdSMW5tpQcBZoQY5u+uwCVNA8vk2bzX0ekNGEWElJhM/yRbYVA6VJkrZQM2e2eIOABWLU6reiUzWlHIaEhIFLRkqJL+tNGZCL3ccZ4hL3g5fCtu1zIFAdTAh0NNnkj5unjqfiMDO3Aemo174E/TDnN7/ToAxNcB/4zzZPxVbH9BeiotUKZKg++PtSP4yWsPcl8AR3G46Yn/STotrnCyMYsfKwC4WMwi8cUoutFyIkD0CblXW84sesBTP+P6/pNv0LgAnAuQLm5bM9vn/w8QIgpJRDH23nJORAG7tbopw7n75jFIC/ZzHH8OAYYcbuzuqisgonO0EusvJFgK5nAubCwC0v7u1Q2t+jyWZfXQIl3VeUmzjU9U5rCLPcDBovBn4Kmq4fx3fy25KYViVIbtdyrejPDnx72S4ESnjJerFzJrl5vc/SbcEzi62G7sJ2Clr5Q3dwI65V9zZsQ/kn6RgUwZv+jtwiI8M0lCyNClLK1tPXXeOTkRmiI1IKika7RbVjcXHb7QqKjoR4zBeeVj1sK2VK6xvNIxK0gohZDqHOIZmzDdn4GIjpvVtP0umxCIP+a4BKRLKE1RZgogyORT+tQv1IJtWMp57ap31ies/VMV96UQqgxvc4m3tc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(6512007)(6486002)(71200400001)(83380400001)(186003)(85182001)(2616005)(122000001)(38100700002)(38070700005)(36756003)(86362001)(26005)(6506007)(4326008)(66476007)(66446008)(64756008)(76116006)(66946007)(66556008)(54906003)(110136005)(41300700001)(5660300002)(316002)(8936002)(8676002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFlZZ1R6T0NZcytDTEhydmdHYng2NWp1ZjNPUFpDOUJlZVpuQW1MdUdaQ3NN?=
 =?utf-8?B?Q0h0OEhSMWtTalpzcm8rQTc0YjRqZFNpOVFiaVJVdzNKSzVRdVkvN2JNcmd6?=
 =?utf-8?B?bDRvenRONWVHQzYvOVhoU1pLd1lrZW8zdG9FL2I3RzZIK1JLYTl2R29ENW1N?=
 =?utf-8?B?NHFuSXdBb0d4KzRLOTRHNnNmaUI2MnRyYURKQ1d5Z3ZTdm4ycnc3alBMcUY2?=
 =?utf-8?B?RE9WZXQra2ZPcFBJbkUyTGN0WnZLMkFZaDRBRUQ5a01VR0wyT1FoNEpwczkr?=
 =?utf-8?B?b2M2L1NtQkovV3dMSlZHOUd1UnR3dFNpdEttb1lCdmtqKzN5T3o5cWhXY1c2?=
 =?utf-8?B?WC9Sdk5CUUxiSWkxWWU0a1ZhOUo1a1liUHRabU9NZTRxcmZ3a1lpVnNBWFBH?=
 =?utf-8?B?bENwWlFtQklQQjdTbjBSaUh2U3JRVG83QVpoRUZSaWVNTFNpZDh2QVFPTjFX?=
 =?utf-8?B?em1EMnhnVXRmR252WnAvVjFSTWpaK0JrWnJoMVlVN2N1eWVJd2dYbVdNV3B0?=
 =?utf-8?B?MWpGUGFkYkZ5bU1qdWd5QkZMM2U4S0xDWS95c2ZJVVUrMjVQSEExNmxCZktV?=
 =?utf-8?B?WGtnSXBSNWdsaFFrOTRVdjhzSk9HWHZqUFdqdHhlUnBtM1h6QTlhb3pOK3lR?=
 =?utf-8?B?UDkxVUxNaFVHWHEvZUloR0NleDBPL2RWN1RFZk5EeTk3K1hRMVNkazNLK2t5?=
 =?utf-8?B?QUN2c1JhUk83ZjdMNkxEU3A0OTRlZnlqZzQwM2RVRitkaEJ3UU5CVVJkbDMv?=
 =?utf-8?B?elVZbjJlNnQwOVlPdEhvNzB2M2NMbUFnYXVlRHlEbzRxMzlKUVl5T3ArK1BP?=
 =?utf-8?B?YmFuZ2lTNXpsMzI5M0lPeEZYMDlnNmpIOXV2SHZybTJTMERCUVRVMktVT3dt?=
 =?utf-8?B?SVRMeE9GZ0dYc3ZhUVJ4a2xmOHFOejRZYzlZdlhWVi9CdGtMSmt1YkJ3VUhy?=
 =?utf-8?B?Vkh3NmhUTHN1bi9WRVEyY2NpNlo3Ukx4ZVdQekVlenpHaS9xbU5iL2NQNjdQ?=
 =?utf-8?B?OFIyc1BoSkl5aXdwanRQZmd5SnNKaUdWZG9NanpaTlQ0WjBveGtUQWpGUFNk?=
 =?utf-8?B?Mkh2Zk5XZHl1VWtJYk5qL1huMG8vRUsxNzAzVWxVOWNnbkF0UlcrdUd1K1Nm?=
 =?utf-8?B?ZHN3MWRBaFgzdjhvR0tXN0tsWTFNbnZCaDlNN09qSHYxT0lzZ1JhZmk4bmNi?=
 =?utf-8?B?bjc1Zkc4RVRaSUdMcFhGTVZOVzI1YUk0TXNvMFJPbTZwV1A0RHQwNXZ1enJv?=
 =?utf-8?B?c1ZDeXN1ZjUwQWFUYWhtN0lNb1lncmQzOCtndzNnbmNDcXB1NkN4V2NRVVNL?=
 =?utf-8?B?NXNtZVZZVFVZMXZMa2ZCaW9QYjBqMCtmMnZoSzVWUW9OVUxIanN0S2JDSzh0?=
 =?utf-8?B?MkMyQnU1eCtkR2R3VXk2bVBnMVFPVWsrK1oxTXY4LzN4a3hvQTF2aFNvQ2tn?=
 =?utf-8?B?N0RqbzB5cjQ3NVNVTXBUNEFOR21rSTExNTRZWkdrczZma2Y5bXR1MWQrMkx1?=
 =?utf-8?B?aWdmTGZXY3p5NmFQankrbzlTTlFFY1QwRndqY0JPRHc5bkhxL2lWS1lISHp1?=
 =?utf-8?B?NGRFZWdQSDB1TDgzNUVjTGVwUlVyNGRQT3h2ZGJ6dXhnc1laQzE2Nys4M2I4?=
 =?utf-8?B?ZkdLV2xkNWVNbEhrMkZrRTZyK0xzOTREaDBUa1hhclhEMU12T3V5WUNIRllP?=
 =?utf-8?B?RFBtbHJQSXk2T3BCZk14MEpVaFZodHJZSTUxS3JyZ0dDSFg4b1V5MlVTcWxJ?=
 =?utf-8?B?TmQ0bjYvdVBnMWdldmZJTXpXME1iZUR1dW96WnlUZVRyT1lieW04dE4wWktL?=
 =?utf-8?B?NGtXNHFubElTZXVIcHBTZHMwQ2dPZ0oyNVUzUGMwVTBFellPSEVYamNsNko4?=
 =?utf-8?B?MjFUVDk5UFdTd0Q4QzJiclBTUWVLa2NRK0ZoOGFiUVVvTWJCSVhxeWV1MHpo?=
 =?utf-8?B?cElLM0FuazcyZGpLQjhpNHhTaHpuS2ZSV0FkVVR5NzZLekpYYWVnc1NsWTB4?=
 =?utf-8?B?M2xUZGNUL01CbnJRMmpHdC91dkJRd3VCL2pEN0pJeHR0NHR3YXpOSzJRaTdD?=
 =?utf-8?B?VUhpcWo4UEVxcUpEQkM5WUdVaFJIRThOUE0zUG1MTnhtdzQ0ZkRNR2ZHUkNV?=
 =?utf-8?Q?GWWNCfXmRJViHOI5WptA9sMCq?=
Content-ID: <79237EBB801D44489CCCB5920EA00D50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bced02-9304-48b7-7d85-08db84379022
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 06:57:17.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSUkadEEmZ71RUz5TO2haJ61Hx4g9oVw7WfPa9ebsWIoHDx+Kw8VBzmWTyDJ/ThvpBBaV/SDI6cg7PhjXsUOSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5635
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_607662473.529409974"
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
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_607662473.529409974
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA3LTEwJiMzMjth
dCYjMzI7MTc6MzImIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO09WTCYjMzI7bGF5ZXImIzMyO3Nob3VsZCYjMzI7bm90JiMzMjtiZSYjMzI7ZW5hYmxlZCYj
MzI7YmVmb3JlJiMzMjtjcnRjJiMzMjtpcyYjMzI7ZW5hYmxlZC4NCiZndDsmIzMyO1RoZSYjMzI7
cGxhbmVfc3RhdGUmIzMyO29mJiMzMjtkcm1fYXRvbWljX3N0YXRlJiMzMjtpcyYjMzI7bm90JiMz
MjtzeW5jJiMzMjt0bw0KJmd0OyYjMzI7dGhlJiMzMjtwbGFuZV9zdGF0ZSYjMzI7c3RvcmVkJiMz
MjtpbiYjMzI7bXRrX2NydGMmIzMyO2R1cmluZyYjMzI7Y3J0YyYjMzI7ZW5hYmxpbmcsDQomZ3Q7
JiMzMjtzbyYjMzI7anVzdCYjMzI7c2V0JiMzMjthbGwmIzMyO3BsYW5lcyYjMzI7dG8mIzMyO2Rp
c2FibGVkLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyOzExOWY1MTczNjI4YSYjMzI7
KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7RFJNJiMzMjtEcml2ZXImIzMyO2ZvciYj
MzI7TWVkaWF0ZWsmIzMyO1NvQw0KJmd0OyYjMzI7TVQ4MTczLiZxdW90OykNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0
ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyYjMzI7fCYjMzI7MyYjMzI7KysrDQomZ3Q7JiMzMjsmIzMy
OzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjszJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2NydGMuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMNCiZndDsmIzMyO2luZGV4JiMzMjtkNDAxNDI4NDJmODUuLjUxZDEwZTY1MDA0
ZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjtAQCYjMzI7LTQxMCw2JiMzMjsrNDEwLDkmIzMy
O0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0DQom
Z3Q7JiMzMjttdGtfZHJtX2NydGMmIzMyOyptdGtfY3J0YykNCiZndDsmIzMyOyYjMzI7dW5zaWdu
ZWQmIzMyO2ludCYjMzI7bG9jYWxfbGF5ZXI7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMz
MjtwbGFuZV9zdGF0ZSYjMzI7PSYjMzI7dG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLSZndDtzdGF0
ZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO3Nob3VsZCYjMzI7bm90JiMzMjtlbmFi
bGUmIzMyO2xheWVyJiMzMjtiZWZvcmUmIzMyO2NydGMmIzMyO2VuYWJsZWQmIzMyOyovDQomZ3Q7
JiMzMjsrcGxhbmVfc3RhdGUtJmd0O3BlbmRpbmcuZW5hYmxlJiMzMjs9JiMzMjtmYWxzZTsNCg0K
QWxsJiMzMjtwbGFuZSYjMzI7aGFzJiMzMjtiZWVuJiMzMjtkaXNhYmxlJiMzMjtpbiYjMzI7bXRr
X2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCksJiMzMjtkb2VzbiYjMzk7dA0KaXQmIzYzOw0KDQpS
ZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7JiMzMjtjb21wJiMzMjs9JiMzMjttdGtfZHJtX2RkcF9j
b21wX2Zvcl9wbGFuZShjcnRjLCYjMzI7cGxhbmUsDQomZ3Q7JiMzMjsmYW1wO2xvY2FsX2xheWVy
KTsNCiZndDsmIzMyOyYjMzI7aWYmIzMyOyhjb21wKQ0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX2Nv
bXBfbGF5ZXJfY29uZmlnKGNvbXAsJiMzMjtsb2NhbF9sYXllciwNCg0KPC9wcmU+PCEtLXR5cGU6
dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0
eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_607662473.529409974
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBNb24sIDIwMjMtMDctMTAgYXQgMTc6MzIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gT1ZMIGxheWVyIHNob3VsZCBub3QgYmUgZW5hYmxlZCBiZWZvcmUgY3J0
YyBpcyBlbmFibGVkLg0KPiBUaGUgcGxhbmVfc3RhdGUgb2YgZHJtX2F0b21pY19zdGF0ZSBpcyBu
b3Qgc3luYyB0bw0KPiB0aGUgcGxhbmVfc3RhdGUgc3RvcmVkIGluIG10a19jcnRjIGR1cmluZyBj
cnRjIGVuYWJsaW5nLA0KPiBzbyBqdXN0IHNldCBhbGwgcGxhbmVzIHRvIGRpc2FibGVkLg0KPiAN
Cj4gRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9y
IE1lZGlhdGVrIFNvQw0KPiBNVDgxNzMuIikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGlu
IDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
DQo+IGluZGV4IGQ0MDE0Mjg0MmY4NS4uNTFkMTBlNjUwMDRlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+IEBAIC00MTAsNiArNDEwLDkgQEAgc3RhdGlj
IGludCBtdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1Y3QNCj4gbXRrX2RybV9jcnRjICptdGtfY3J0
YykNCj4gIAkJdW5zaWduZWQgaW50IGxvY2FsX2xheWVyOw0KPiAgDQo+ICAJCXBsYW5lX3N0YXRl
ID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQo+ICsNCj4gKwkJLyogc2hvdWxk
IG5vdCBlbmFibGUgbGF5ZXIgYmVmb3JlIGNydGMgZW5hYmxlZCAqLw0KPiArCQlwbGFuZV9zdGF0
ZS0+cGVuZGluZy5lbmFibGUgPSBmYWxzZTsNCg0KQWxsIHBsYW5lIGhhcyBiZWVuIGRpc2FibGUg
aW4gbXRrX2RybV9jcnRjX2F0b21pY19kaXNhYmxlKCksIGRvZXNuJ3QNCml0Pw0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiAgCQljb21wID0gbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoY3J0YywgcGxh
bmUsDQo+ICZsb2NhbF9sYXllcik7DQo+ICAJCWlmIChjb21wKQ0KPiAgCQkJbXRrX2RkcF9jb21w
X2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwNCg==

--__=_Part_Boundary_001_607662473.529409974--

