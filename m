Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8F87F84B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 08:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF85210F367;
	Tue, 19 Mar 2024 07:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="a/gJ3CO9";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tUTV2lBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5106910E772
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 07:25:22 +0000 (UTC)
X-UUID: d6121920e5c111ee935d6952f98a51a9-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vu5X1uVsV5V8RDmrYpHu2TiQQTJEWsy+y9NCoLxZelI=; 
 b=a/gJ3CO9Trxzvyo9+X1BXyBdK/WvmyLWrAm65nr1Y7p37Gxd44E6J8ejeQqwZomL4b2LjxfROEjQGqQUYJFtxdzI07jZOgyvO2Kp1A5XMOk2NMS3AtPFT604usYjGx+oE3PMO8VPqu/LIqc2aYpKmlFjwwvNDUw0tHl3YekmZ6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:4861b6cb-186f-4ae7-b504-5b6f728c452f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:4c3b2b85-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d6121920e5c111ee935d6952f98a51a9-20240319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1906366360; Tue, 19 Mar 2024 15:25:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:25:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:25:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8y5ysppgba4+7lBjnD1E92jCaTMgS8fFo6/0wiZh43Z/kNxAC29BWNxhv4a9IGERLKh2UUHrcwqAfFz+Oc2Nq98wcd46lZswIoM7kUBiQgd7EXD9VShhH1aB0UugLFStLmFrBEVReoE0hvAJktLO378fAy1C7j2+5tuklwqNjGKb0wzwbUFp/prfxASQjU+o6f/dki3hCp+sW0yvhnp9tnC7+GNQeBQTFR22EKVdrJumALxp71Wp9yZ0rgdnpJHu5ClCEuuTSlIeksZHX9YFEdOmXydqQF6RYFhFbLOyoem6h4vutTo1ElMZREMj9DdtDdiMunMwySMPHpk5IuhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/i0sNDR6iHFJv9RjiWLJ/l0HGOHgJyU2ysXF3JutAQ=;
 b=eJ4GDW7ciTpDppke8IbKy5PyNJ3ad52DEEnm1bdmh8A4I/JkzwIOcD+haaPcTBnuTi4b3pQrrWYhqMdrqx6CYHJ97GMLVT5QFNPWc/FdHHMJd2dhVJ9AcHprTC0MYxBEeb+Rqsl/07wpNJqCKKXPoMcUGfpD3if1gea9bPeCZ8tZGwGJjprsf27DJfgOrXWPJIeCtOHGEuZv6/ycH6y5pEIUj0HZGy8S9bik2u2ByIYPzIYTcNq7XdI+fMn0F7LOxsr0g334XVZlq2edp3x3C3OgjfUCBWVizWbvxPKQB92/VNsINjKuh8er6OWhVr2eehLpulNXIt1n/nXE5yVvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/i0sNDR6iHFJv9RjiWLJ/l0HGOHgJyU2ysXF3JutAQ=;
 b=tUTV2lBpqVSYYaij2/Qd/PRPxq1BWRpz0EBsSL9bPJMPB+HGqKfHuUyXo88FOhsj2f8OzVF/FlQgxukt9pk4z9y0cHEniSsvY5og0qfyDAt4KDjTmG/qFjDF3nx7HQWqBnW1PWEeMVryTh90Z2YPFbgwe2RT9R0shzpJvX931e8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8992.apcprd03.prod.outlook.com (2603:1096:405:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Tue, 19 Mar
 2024 07:25:14 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 07:25:14 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
 <fshao@chromium.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: mediatek: gamma: Add support
 for MT8188
Thread-Topic: [PATCH v2 2/3] dt-bindings: display: mediatek: gamma: Add
 support for MT8188
Thread-Index: AQHaax57HBP5i5Vvkkm9tEYcK3ZAp7E+xuyA
Date: Tue, 19 Mar 2024 07:25:14 +0000
Message-ID: <f1603b23fe5bf207bf70e93fd717a0e5cee697fc.camel@mediatek.com>
References: <20240229144844.1688-1-jason-jh.lin@mediatek.com>
 <20240229144844.1688-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20240229144844.1688-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8992:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RnRRR6YarTuak5rgmH10bHS261WgsazWX1e1LqHIo36tOWEYopyuTfvaEruVwzKX0bLDa5UDzfhhoTFjNf7zw0RE/aj00lR0Ldejjy/3UXLXbALotzclNnWYwCSxH7xLG2aFKBfxbY2aBjBrxMsVXJ/MO1AiIJSsMtKMc2PN05lJvbndQG5N7cJc5Ou3oj+5Pz7O7s69lcFtoGEBY0OC9JNaRh9RdequzNk0280Y9B8CrGt6Gh2bGiorTjvjYgHM3P3golzX+5UFV+myEc43eAhv3i3RjdhNN6mnfEAsAgbBoAgpup0cMAR7e6TLksbY3g1tPAZSb4oAJ6nCLfhq57lBBtr0DjuPa05BGc3ndL5oX4bzJhgjPh1U3wr933DIo6838pKJ3YGuZyZej1z3hzrzgy1nQ1RgqargEgEqDZoWD4AlQxtQ4qvSzLwmhVZPaYJXd5jAXdply4UZRX1P3VTa958qAnqhchybPFyS1c9K2KreAxWWkABjl9Oe40ZcTXGQY3v4oDKbUqIJ4ekFRHeKpX5Rkz3bUEW2gMbuaNSineNzUT6LurmmUQ3Rllp/6Tw92kSC/YR0dAesvBeEcLHCkQgk+38pUindGNmqAOk/xJ1npZ+US4eyvZzHpM5X8dErCTuyj+ppCfEq/dgYjUqQyUocg4Nu2TDcaxh30zA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHVyTW1XUGhwak85UnJEeWRNNkhQYmtyRXV0QTBaaDBrVHFTcFBhcFdHR2dE?=
 =?utf-8?B?RFN2NEZuSkVBbE11SXdsWDJZY1VxWG9YMnhNM21hY3QzNEtNL25xcVdRTzFM?=
 =?utf-8?B?RU1VWlBzK1NicGR5bWNBQkdMU0syaDl2ZVllMmpBYnBSWXI2dGtTd3VFVEZ3?=
 =?utf-8?B?ZktMZlVrRlFEM1JYQjBidUgwb1l1c0R1RFdSWUlwRU5LR2RYb1BPbWxiV3F4?=
 =?utf-8?B?YnRTVEtxZndoNjJIUlVmem9GbWdOU3Z2Q2FUbWVWSUM3WUN3VGJwYlBCRjFh?=
 =?utf-8?B?Z241WXJiRnR4SURRM0V3UWt3VFA3UXFLMmZ4UTRZWlk0Z1NwcWtORkVnaTQy?=
 =?utf-8?B?b2d4QWY4RTljTVRLU3p6aGs1dFN6bWF1OGFGV01sWnZZMzlhdDhPaTVIa2hq?=
 =?utf-8?B?R3ptcWk5SmlUTCtzZUFCcStERjViUzhDQkZqZ24yMkNHeEJjYlA4Qjh6RXc3?=
 =?utf-8?B?UHdwVTNNcWE3MVNsZlFpVlA0L3Y5SnZxOEZQQkc1SVJoSlFITHZxdStxQ0ll?=
 =?utf-8?B?VUQ4WHdzRFBTYTQ5MW1XdU94aFV6TzRqTjJmZkZLS1p2SXVhOVdjc3FRMWpi?=
 =?utf-8?B?bmdxZmFlNDhaTW5ESnJWY1Z5RjE5eGNMYVF6Z3k0S0hDQTFiQmpjdm9XQ3hu?=
 =?utf-8?B?aUNlUVJ3cEM0Ym9CeUdyY2liQWJRMXp6VDVuWXdVVk93dm5TbklWcG4xZmU4?=
 =?utf-8?B?aGEreDF3OU1PRnNKV3B4dkJEY3h0R1lhdEJJb2dSaVRwcjBSbDhXaEVaVzdh?=
 =?utf-8?B?STZxUUxNTTNCdC9mcWsvTDhCS1pwWTBFNkR2UFUvb2FLbzJOeWtJdnBXMUZz?=
 =?utf-8?B?WVNFVHU3MDg1RUZCV0FDN2pjcjdVaFNiOUs2YndyWFNGYkk3dkxxNDg3dmk4?=
 =?utf-8?B?a1VQb3d2aWtKZC9mcDcyN3o0ODgzd3dtQXBXRWdtRERhOXRkcXJGeG9hNytj?=
 =?utf-8?B?TmZqaWVKNGFXZkRmM1ZlVlF2MzBEa00wNFpzVGI4dGpyZ1BDaUdBQWI3bkQx?=
 =?utf-8?B?blMrTmxoK3hkZVlxR2hpQTZ6Q25pc3phUEZqa1IrZzRlYkR4T0JFOCs1THBi?=
 =?utf-8?B?WFQ4OGljZEdObklaYnovV1BSTDFUeEtpM0tqaDNBT01Yd3VUaldsaVpRWVA2?=
 =?utf-8?B?UkZzdjN3cC8wNWJHVUU4R0pCejdXU1lwSGJva2hHWklTNXNRU0c2VEVZdWQ3?=
 =?utf-8?B?dEVPQnlJdGtlZFRXUGtkaEgzd2NHT0Y1WitJeWZnRGFsVG9vRXhGL0w3ZGgx?=
 =?utf-8?B?ODUxemVOTTFJNEF1emMvOWNic0U3YXozTjdBTU1HOUtEYVlkREFCLzQvRDJ0?=
 =?utf-8?B?bVdEWXo2Z1BrMU0rQVlCdGtrU2YySWpld05DdVJ0Q2Vac0JKd2R6aTlDNC9K?=
 =?utf-8?B?L3dGSnNVbnJJTmV0dTlkNjc4bjkwT1BQN0xKVEE2d0UwY1pvbGlzRkdPUU0v?=
 =?utf-8?B?MkZicU84ZVhncVB0T2M1MkZrVU1sbzRUeThJL25RQ0lQM1h4MCtyWVBrdm11?=
 =?utf-8?B?SUNBWCtCdDg4UmFsU0p1TnFOWUdvTVNJd2UrcDZRYnhEMndNYUJwcG5RNEtv?=
 =?utf-8?B?cVN2cHBVbHRBTEFCeDFSR2VHeUJpQTNuaTllUTcwRDJSclgxcXlza2tsazI1?=
 =?utf-8?B?M1lFMVZaSUpqYUdLN1ZicFF5cWV5RjVDaHN2TW93SElObGp2ZVY0RkIwbHNx?=
 =?utf-8?B?VDVNRTRoejFWYWNPT2NsWFFvTXNyUVhkUmRISmcxdkZnZElCaS91WmwrNTFW?=
 =?utf-8?B?ZlQyMWFib2x3MER0T3l4cTZxalc3L1RtN2VQVG4rUTltdVJMaTdZelR5bTlv?=
 =?utf-8?B?TmNkRWt5K0o2QXkweDFzaldvcFArSlc3b05wcElERHZMWXFUMHV5Y05mK3BP?=
 =?utf-8?B?UlF5eHZoRC8rRkM3NVBwS1VsWTdPVGJHL0FVQmlPRWJZLzI5OGRrcnM2WTZs?=
 =?utf-8?B?ekhFSXlldTgxUFhva1ZqQ0tkdHdkTUx5ZlBINEtTenpOSHlQTFNMUUtGZ2ts?=
 =?utf-8?B?V1ZnMlNvNFVKbWNnOTZKSHRhc055UXplTnJlTmlOTmxINlpLajJZZE1hbUlX?=
 =?utf-8?B?TlpVQWRFcUptdHE1Q251MjVSdzR2S2tzRFFEbE9xNS9jSGdoSGFZekt0N0Fz?=
 =?utf-8?Q?x9sixGH/hm2TGdTGQLjLyO7r+?=
Content-ID: <A33EB74A62DF8D42B867DD3F8903CB59@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a56ac4-c1b2-462e-f71c-08dc47e5b844
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 07:25:14.3886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BlM0ubDmuukf7HfTBcScUnSeBsKAJOlAn+a9llRqa+g0Mcctf5WbOd/+lZ1i6PenrLpqEVuclpGTO4qhEEesHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8992
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1061358365.316262565"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_1061358365.316262565
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjQtMDItMjkgYXQgMjI6NDggKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVGhlIGdhbW1hIExVVCBzZXR0aW5nIG9mIE1UODE4OCBhbmQgTVQ4MTk1
IGFyZSB0aGUgc2FtZSwgc28gd2UgY3JlYXRlDQo+IGEgb25lIG9mIGl0ZW1zIGZvciBNVDgxODgg
dG8gcmV1c2UgdGhlIGRyaXZlciBkYXRhIHNldHRpbmdzIG9mDQo+IE1UODE5NS4NCg0KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdu
b0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZ2FtbWEueWFtbCAgfCA0DQo+ICsrKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxnYW1tYS55
DQo+IGFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLGdhbW1hLnkNCj4gYW1sDQo+IGluZGV4IGVmMWY1NzU3NTdmNi4uYjhi
OGU4M2ViYzNmIDEwMDY0NA0KPiAtLS0NCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxnYW1tYS55DQo+IGFtbA0KPiArKysNCj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxnYW1tYS55DQo+IGFtbA0KPiBAQCAtMzYsNiArMzYsMTAgQEAgcHJvcGVydGllczoNCj4g
ICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTItZGlzcC1nYW1tYQ0KPiAgICAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5NS1kaXNwLWdhbW1hDQo+ICAgICAgICAgICAgLSBjb25zdDog
bWVkaWF0ZWssbXQ4MTgzLWRpc3AtZ2FtbWENCj4gKyAgICAgIC0gaXRlbXM6DQo+ICsgICAgICAg
ICAgLSBlbnVtOg0KPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4OC1kaXNwLWdhbW1h
DQo+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LWRpc3AtZ2FtbWENCj4gIA0K
PiAgICByZWc6DQo+ICAgICAgbWF4SXRlbXM6IDENCg==

--__=_Part_Boundary_007_1061358365.316262565
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDItMjkmIzMyO2F0JiMzMjsyMjo0OCYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhlJiMzMjtnYW1tYSYjMzI7TFVUJiMzMjtzZXR0aW5nJiMz
MjtvZiYjMzI7TVQ4MTg4JiMzMjthbmQmIzMyO01UODE5NSYjMzI7YXJlJiMzMjt0aGUmIzMyO3Nh
bWUsJiMzMjtzbyYjMzI7d2UmIzMyO2NyZWF0ZQ0KJmd0OyYjMzI7YSYjMzI7b25lJiMzMjtvZiYj
MzI7aXRlbXMmIzMyO2ZvciYjMzI7TVQ4MTg4JiMzMjt0byYjMzI7cmV1c2UmIzMyO3RoZSYjMzI7
ZHJpdmVyJiMzMjtkYXRhJiMzMjtzZXR0aW5ncyYjMzI7b2YNCiZndDsmIzMyO01UODE5NS4NCg0K
UmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7
DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYj
MzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjtSZXZpZXdlZC1i
eTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsm
IzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjsuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGdhbW1hLnlhbWwmIzMyOyYjMzI7fCYjMzI7NA0KJmd0OyYjMzI7KysrKw0K
Jmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NCYjMzI7aW5zZXJ0aW9u
cygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdA0KJmd0OyYjMzI7YS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxn
YW1tYS55DQomZ3Q7JiMzMjthbWwNCiZndDsmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZ2FtbWEueQ0KJmd0OyYjMzI7YW1s
DQomZ3Q7JiMzMjtpbmRleCYjMzI7ZWYxZjU3NTc1N2Y2Li5iOGI4ZTgzZWJjM2YmIzMyOzEwMDY0
NA0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGdhbW1hLnkNCiZndDsmIzMyO2FtbA0KJmd0
OyYjMzI7KysrDQomZ3Q7JiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGdhbW1hLnkNCiZndDsmIzMyO2FtbA0KJmd0OyYjMzI7
QEAmIzMyOy0zNiw2JiMzMjsrMzYsMTAmIzMyO0BAJiMzMjtwcm9wZXJ0aWVzOg0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTkyLWRpc3AtZ2FtbWENCiZndDsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5NS1kaXNwLWdhbW1hDQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7LSYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDgxODMtZGlzcC1nYW1tYQ0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1zOg0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7
ZW51bToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTg4LWRpc3At
Z2FtbWENCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTk1LWRpc3AtZ2FtbWENCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZWc6DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7bWF4SXRlbXM6JiMzMjsxDQoNCjwvcHJlPg0KPC9wPjwvYm9k
eT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElB
VEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSAN
CmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUg
bGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25h
dGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24s
IHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBh
bmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRz
KSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0
aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0t
Pg==

--__=_Part_Boundary_007_1061358365.316262565--

