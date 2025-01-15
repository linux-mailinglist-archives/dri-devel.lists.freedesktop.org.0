Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F18A1239B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18E510E4F2;
	Wed, 15 Jan 2025 12:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FkoUJHxy";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="I6Rrahr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796710E4F2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:13:27 +0000 (UTC)
X-UUID: 1d81ab66d33a11ef99858b75a2457dd9-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=eWRF4GpCnWw5mRHwKta5OZeVLOytkLjPGgCzfSd/kx4=; 
 b=FkoUJHxysfUoXHq5VOMCyr0HdWQDT0omRFBqsCYEsSneXimPWP0RBZGDqnWTO2Yq/1K44A0xOXxDvX/aIe7x7xkxpY5DXV003/r5iTXHss56xTkp3Cxy3pkArYAH2h27fspH/3EN0sd0O4CcFfJN4dN259kuBRAlN/Be1hajCLA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:064cf709-dd87-4fab-bf15-8a415dbca634, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:0e6eed37-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d81ab66d33a11ef99858b75a2457dd9-20250115
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1342893400; Wed, 15 Jan 2025 20:13:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 20:13:21 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 20:13:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVmLb8V45vFA69966L2689wurnwI/Zo+7XyhUdFKWjEI+Y0O9Vt60BCeHHrA7grxnoI/kgVtrDdwW7ea2XbjcFkJxJOCgjXwELX3jmUUz1B8UxRTDOD1d1JZnOdRlnGgQYAeoXI9BTWC+qLmXnjL+dDjBQOf7wkWO8va+Kb1kJoZ90hPmt2l9rFMC0fC/53lV54txK+I8z8rr5g2DV25dWryVqXTVWCWoHB3KK9KdooPMZEpGTyqWAclyfmg7srcA9bpxQm+cF5cO341uW6u7yyxg5nsmrYstBfJxmwY7HwV/IQDY2cC6uo3mCXoCvCvA3iBK5HzifvfJNUI+HxWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKfybv/iAdWzJhig38D9HSnlDQ5AlJu4gVtnc2gJ6nc=;
 b=MvSFD8e5IwjMEtjv8X4xuAPoYVKJK33+rmNE8G7X8GKpiOZc6SMHT5hzS7EsKVGQj25wcfJGO0wt4kMmn316VCkhhFELIEt0V1OSh9GgIxGMJvwUVOlleIhGYV9zqi9gtpWHwbSlNZtHk7O/nVcB7DOusREkkKVDxMCl9jYpj5+o22VvjvgjGT5CaWaDwGquQkKFKkrPuK052GKCC8Y81b3dM5rEM1EuEJ9j6XpoH7csY8J4XPoKILZ5AdCaRM5hZ2zo/iBlz/G23ublmFarPGTcRGHYep1sLGR3JK8IMouyFJpERDicsn81XgQCHkNi1xKI1Wu48z3fD0OhyJOHLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKfybv/iAdWzJhig38D9HSnlDQ5AlJu4gVtnc2gJ6nc=;
 b=I6Rrahr52CDLhk0f0B3kqrjnRVZEfF11br5r91IFYGrvVh7L2p8xuu5S6hIYVcc6aUd5cjjCbpco+2vsOUBKmZsQ/BBuokgZUVUNUm4RqMSvaBukLo4PItdr9ct2Gjo1XfbkwpvlLfd2vn0IjsLcT8gmY4uddlRgUP41hEExCSg=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 TYZPR03MB8559.apcprd03.prod.outlook.com (2603:1096:405:65::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 12:13:19 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 12:13:19 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCAAE/YgIABrgkA
Date: Wed, 15 Jan 2025 12:13:18 +0000
Message-ID: <23b4d17ed982172de9576dfe6b6c782596e176ff.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <eef2ead1-e9d7-4f9c-8aca-fa84da3e2210@collabora.com>
In-Reply-To: <eef2ead1-e9d7-4f9c-8aca-fa84da3e2210@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|TYZPR03MB8559:EE_
x-ms-office365-filtering-correlation-id: 9a78d976-43a3-4e8d-f629-08dd355dff69
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZWt2alR5cEpTUnZnL0ZuQkNwbFhvMXRMS0RaSXBkeG1JZTJsc3NEYldyK2Jo?=
 =?utf-8?B?T25DZVRSeEYwdkd4RThBOFJ3SFgzam9iYmVmMW1rSGY0Zkw5NUlvREZ1enM4?=
 =?utf-8?B?YW1PZHoxbTRUelhpQThOK0ZoNEpUS2NidTZXa3hZL0ZBT2ZxWUFobzd1MlBj?=
 =?utf-8?B?WEcxUmE0UE12Z3E2cHQyU0xqUE1GOVl4c1FlVEhZKzdkVEMxTkg3QklSZGVQ?=
 =?utf-8?B?TTh5RTViVE9YSFdCZ2FxdC9nUXhiZG5LUWZpVXdsN2ljdHhCMnhxSjBIM3M1?=
 =?utf-8?B?NzlXdk85TE1qcWNFaHB2amxRT25Ic05pbEppSmJkOEdZRG5aRXQ4b2x4TC82?=
 =?utf-8?B?R2JkUWxYRXJhbFNEcUhrYVNKVllGUFBGM1pFMkViQmN2cnN5K2xuckhQWHJJ?=
 =?utf-8?B?U3BqbTg0L2xueGNCVU0yVTdRT2l2SVhTZjF1TUIrTjNneHpJZWxMMkZOdnd1?=
 =?utf-8?B?MkZkTFc1ZzFaQTJ2a0FqcVdYZHhtVWk2TU5ZL0tHS1R2RVRPQ096eVFtZ3dk?=
 =?utf-8?B?aEM1UUNmN3JLNjhLNS9qZUtiQmR4WlJtK05XR2JiSWNOM2xBUEsxdnc4ZVZK?=
 =?utf-8?B?TzVRSE9nZXI4VTlxaVFMSGhFd2xhN2d4T0YyY2Fiemd5Sy9WM0hOejlWWXJ1?=
 =?utf-8?B?bTVmOFdRY0h3N3dXKzFaeG5jSlVqL1VmVVVuYThHY1c2bXpOMW9ySDBXSlZh?=
 =?utf-8?B?ajM0T2FKNzk4cThqL0JQTHRpaWY5bFRwV2dVMEQrTkEwMzhwOTkrZjhJb3E0?=
 =?utf-8?B?azdLeFZkRExid1hveHdVcUdtYnVEdjlVaFEyTGU2ZTd0VENqak84bUlNanVW?=
 =?utf-8?B?UW5JVlp1Ris4b2M3dTU3aWM5Tmk3a2NSVUlDL1VxVkNXVW83YlIrYmQ2cStB?=
 =?utf-8?B?VjZVRkhyQzVOZTJTSDFWQm1WaDlBTXdKbmh0WGlXMlRlQzdhMU1qMS8wa2xp?=
 =?utf-8?B?MkVrQUE0azRqbVFtdzl4K3NjRTdDbFJTaUhtc2xweFAxMzJGVXZaVkx6Q2R4?=
 =?utf-8?B?dkJPby9MZDIyamFuQW51SGs3dGI4Q2tQb1V3cWtJc0dEZE9HTXRoZjJrYmJJ?=
 =?utf-8?B?OE1abzlZSEh4cXNUTFkyaTg3Ykpiak1JeEM3Ylk5QlNPT0g2WUZKb3RscktW?=
 =?utf-8?B?a1B4bXZqMHMwM0hjQzZrc1NRYmN0cWNOTmRhWmdpYWJBUkdtV2Q0bnVOUnA3?=
 =?utf-8?B?dDVLVEF5bTdjaHltQWI5MWl0Um92d3F0dDF6elJaTERzK1NvWWtoSks5OWZB?=
 =?utf-8?B?VGpYWmlQUTNrWGZrN1ZyWk14MXI0cEtvTEw2SzZZNDdWcEpEWTU1eGw2d2Nu?=
 =?utf-8?B?VzkyaHphNW1sb09GRGpGVVdvaUVWZS9OSFlPdmZyS1B6UkVHT0N3VnRiSFBI?=
 =?utf-8?B?M2I1ODdwU3JLb3lsTmJKcWxoZUx1bkJWMWc1UmdKZ2ViZFRtcGllUkFldnpC?=
 =?utf-8?B?R0lHOWhNdmlyT0tTaXBjUE5wblBNclh0ZGtWRVpCRW52UklNdlFtVSt6b05C?=
 =?utf-8?B?RlpxR3pWRDJTVUNDWThmbjBIUnRhK2lJZmVENjlaK3l0bG0rSW1VR2FPZGc2?=
 =?utf-8?B?aDVNekRBZ0V6dnVIZjhqY21ORktWdllsOFBoM2tmV3l1ejl2RWFncnV1MXBZ?=
 =?utf-8?B?LzlqcFhTS0M5dkJMcVZEZjNVSHBIWkoyOU9yK0JIelJLWkRFK0ZpUFA1VFdL?=
 =?utf-8?B?VzNEYUZ4d1FWM0R2WDZvUmErTGlpZUpYVG5CVksyZmJpYjc4VjlvYUNLUmZo?=
 =?utf-8?B?LzhNblZxdndaT0lBdE1QTmJUdm9CUFBJWVB0aHhTSGNkZXBuMzJGOXp2OHBw?=
 =?utf-8?B?UkRkenBZbXl5TDYvN3ppNEhOb1B4cnlQUnRXNHRXUklOelYyMlRWaGt1TEZj?=
 =?utf-8?B?MmtCM1VTeldLR3M3R3R2ZGFQdzExQWJMRTArcXFVZDdBc0svYkthUCsxY1o2?=
 =?utf-8?Q?R1Z/Bvnku4J0UTrEfuCgwF8s9RKTYEh1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEdKbWNnOGdWTnR5YjlGZGlzT0t3TmpvS3JteGFVNlBKYzN2QjVYdHVkV0hP?=
 =?utf-8?B?b0hocTZwcVZXV2h4U0FZcTEreVQvQVZlenNxSDRUZHhSZGZRL0lvczNtZTVQ?=
 =?utf-8?B?bFJlUHlaNGFiYXpyeGNld0FYeklVSXMzQUNxeDA2MUxIU0lpRVhza0lpdERj?=
 =?utf-8?B?K0RRbmJ1TVloKzRvcWpCdDJ6U054dzIwR0lFcStneFlDTmZvRzJ1Nk1IY1l5?=
 =?utf-8?B?aG5NSU1rNWpsZ3JSQk55RVlBbFNqU0FjcmgvdGpwajdUVFhjdTBxNFZhSVQz?=
 =?utf-8?B?WXgxUXVhMEhudUVQSzI3d1ZDM3B6VndKSytFTTFEM05wY2dUcG96aitiYkVn?=
 =?utf-8?B?dDZVTlNiQ0N6alQ5K3F1NXY1V0RtN014YzhLeGsvQlhvMWhTQ0N6clFWaFA2?=
 =?utf-8?B?Wlh5MUxQajRhUzB5ZTRZNjlqSjBGMXl1aFZBK0tHdzFWQkNUT0Vpb1JyUS9J?=
 =?utf-8?B?d2lwMUJ4UytqcUxHeWR1SEZMckZDWmRLSkJ4N0VzNzc4WXZPRlNVc0RFVGJG?=
 =?utf-8?B?cUwxSkU0ZkRVQVhxOGZPb2tvN0pTdFhNR3BqQ1lrcnVtUUZxb0dlVXJ3UThi?=
 =?utf-8?B?UDZzUUY1bUJhTEJRRThsdG90TWE1NGI2bzBmblFocngvUVJ3T0NnN2F1Tkwz?=
 =?utf-8?B?VWhQeHRsbzIxazhvQU1pbjRxdGhBWDZQL0dFUUZXMVJJZHFrUk4rbkZkNU5V?=
 =?utf-8?B?NE5WQ0JKZ2RiTXEzb1R1VEpYQmVpSzJGcE1qSEdrZ0t5YzR0Y0VPakhkMmpD?=
 =?utf-8?B?S1lqUUk3aFZZOHhXU01kM09aZmorL0gxN1UwRmJRTStOUHlYVDRKMFhJV1F1?=
 =?utf-8?B?STU1TnI0QmQ0d2xjeTFMRWphSVJZZWJVaHgvTlhURDF6eGR4NC90eTcvMlNP?=
 =?utf-8?B?OEpscFVEMFIvMTM5cXhjTHFDUkZqTmppYmpneWMyUlVPVTZZS2hqUVhoZjNW?=
 =?utf-8?B?c3RVRnJVQTdWMEI1MzduQ3JqTnB3bms4ZjdWc3ozZTRxL0VENklRWWgvVG5o?=
 =?utf-8?B?NERKS0RKc1NmZ1RDdzB1UmJ0aCt4M2RIWCs5SzYwTVNacnpDVDloNUdxK2ZG?=
 =?utf-8?B?cVo2YkFCWmc4c0pVbC9IaFpoSVFSUDN2c3AvT2tVUk9FSEZub29qQWVmZEtH?=
 =?utf-8?B?a0RlN3ppT1FDYmQwd3BWNW8wUVFHZ2tkZkNoTHNmTFRjSlJ0VVdwNTg2RWgr?=
 =?utf-8?B?K3BHZHdFVHM0NHpXQ3NVU3o4R3p3bkpkQ0lSNUZsNUc4a2xoZ3kyMGhqWUpN?=
 =?utf-8?B?WmlYY2N2cHVLeXVSZ2ZiMjdRTEhmTlpXQzF0eUtLajdjdHNWa1pZZHZXTE4w?=
 =?utf-8?B?M09uSGswYk5BbHl1RTFLbE9nS2VOSHhjS2gyVVlZZU9TWHU0R3FzbE9Sanl1?=
 =?utf-8?B?cEFTY0ZqbkFocVlGM1NTS1k4aUoxV2NBcmtBdVA1S3FFUC9meVNuMjBVS0hm?=
 =?utf-8?B?YnpkK1RiQWUrUXdQaGluZ21iTDl0c2FwNFlvWkFXK1o5T21pdlM3Nk52dFBH?=
 =?utf-8?B?K2xudVBNVWNoK0dXbjBzYkdqakpXTHo1czRMa3hmNlBQWTYzWVdrMGxuNEVQ?=
 =?utf-8?B?R3duRytvVVpvbklHeGgyczdFc3hXTW4vYUtpZklRaDBzejFSd0hxRnE4a0VV?=
 =?utf-8?B?VGM4ejdaS1hXY250eVh5VyttL2RGMkRmeFg1SGVvRmQzR054dHpNZzdkejA4?=
 =?utf-8?B?OFlZNzBpSUE4Q3VKeG04SzJuVUEwcW5XdDhYMWJDTlBpSzl3V01tTVRKaXZh?=
 =?utf-8?B?OExkK0J5K1NrYWgxRnNJdU5wdzRSY2dwdDZsU1ZUQ2tuQWdrTHdTWStFdTUw?=
 =?utf-8?B?QnpZa1lsTnRYekFkK25VbUg3YzF4M2dUd2p1bzd4TnRvZThLZlJ0aHJzcEpP?=
 =?utf-8?B?ZHVxd0hTMHljb1hLdjVsa2E3Zmhyd3VwNzROdEZ3ZW9pVTdYcW5aMlozcXJz?=
 =?utf-8?B?aEZjcytQaW5mVzdaS2x6UWVBaXdKSHNxZlU0bmUvb04rWUZCZ3hOUGc1ZWk2?=
 =?utf-8?B?a3hEWjNhc0xQK2FZbVZOVjVFWGhCUEcvSjBJOTdCa3VudGpSVWIvK1RMSEl5?=
 =?utf-8?B?b290cS9uMjVmQ2o1L1FtVGNJTWs2S1luWDgrTGUxU1k1dXdUQjJNV0R1ejI3?=
 =?utf-8?B?a0pPYXJWVXJNSmE4THhvSHJGNDdYSHl2TWY5ay9NK0FnaUtmdnA3T2JDM21m?=
 =?utf-8?B?Mnc9PQ==?=
Content-ID: <F7CA1F10A757D04B8C2DB875E90DCCF1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a78d976-43a3-4e8d-f629-08dd355dff69
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 12:13:18.9275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5Lt5hR1s8cZlhd8S6Di4bxPUxAomcaCmZnF/UohuDTnAJtmih+rIN3kyqhDSKN8p51eEpBfhb0Kuz0UKtAPX17Mb7mFpJlKiYbB6pTCyMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8559
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_946413693.313222949"
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

--__=_Part_Boundary_002_946413693.313222949
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAxLTE0IGF0IDExOjM0ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTQvMDEvMjUgMDY6NDksIFBhdWwt
cGwgQ2hlbiAo6Zmz5p+P6ZyWKSBoYSBzY3JpdHRvOg0KPiA+IEhpIFJvYg0KPiA+IFRoYW5rcyBm
b3IgdGhlIGFkdmljZS4NCj4gPiBUaGUgcm9vdCBjYXVzZSBvZiB0aGUgZXJyb25lb3VzIGxvZyBt
ZXNzYWdlIGlzIGR1ZSB0byBtaXNzaW5nDQo+ID4gcG93ZXIvY2xvY2sgZGVwZW5kZW5jaWVzLg0K
PiA+IE9uY2UgdGhlIE1USyBjbG9jay9wb3dlciBoZWFkZXIgZmlsZSBpcyB1cHN0cmVhbWVkLA0K
PiANCj4gVGhlIG10ODE5Ni1jbGsvcG93ZXIuaCBmaWxlbmFtZXMgYXJlIGFueXdheSB3cm9uZyBm
b3IgdXBzdHJlYW0uLi4uIDotDQo+ICkNCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KSGks
IEFuZ2VsbyANCg0KbWF5IEkgYXNrIGlmIHlvdSBtZWFuIHRoYXQgdGhlIGZpbGVuYW1lcyAibXQ4
MTk2LWNsay9wb3dlci5oICJuZWVkIHRvDQpiZSBjaGFuZ2VkIHRvIHRoZSBmb2xsb3dpbmc/DQog
DQoibWVkaWF0ZWssbXQ4MTg4LWNsay5oIg0KIm1lZGlhdGVrLG10ODE4OC1wb3dlci5oIg0KSWYg
c28sIHdlIHdpbGwgYXNrIHRoZSBNZWRpYXRlayBjbG9jay9wb3dlciBvd25lciB0byBzdWJtaXQg
dGhlbQ0KYWNjb3JkaW5nIHRvIHRoZSBjb3JyZWN0IHVwc3RyZWFtIGZvcm1hdC4NCj4gDQoNCg0K
QmVzdCwgDQoNClBhdWwNCi8vc25pcA0K

--__=_Part_Boundary_002_946413693.313222949
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDEtMTQmIzMyO2F0
JiMzMjsxMTozNCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzE0LzAxLzI1JiMzMjsw
Njo0OSwmIzMyO1BhdWwtcGwmIzMyO0NoZW4mIzMyOygmIzM4NTE1OyYjMjY1NzU7JiMzODY3ODsp
JiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyO0hpJiMzMjtSb2INCiZndDsm
IzMyOyZndDsmIzMyO1RoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO2FkdmljZS4NCiZndDsmIzMy
OyZndDsmIzMyO1RoZSYjMzI7cm9vdCYjMzI7Y2F1c2UmIzMyO29mJiMzMjt0aGUmIzMyO2Vycm9u
ZW91cyYjMzI7bG9nJiMzMjttZXNzYWdlJiMzMjtpcyYjMzI7ZHVlJiMzMjt0byYjMzI7bWlzc2lu
Zw0KJmd0OyYjMzI7Jmd0OyYjMzI7cG93ZXIvY2xvY2smIzMyO2RlcGVuZGVuY2llcy4NCiZndDsm
IzMyOyZndDsmIzMyO09uY2UmIzMyO3RoZSYjMzI7TVRLJiMzMjtjbG9jay9wb3dlciYjMzI7aGVh
ZGVyJiMzMjtmaWxlJiMzMjtpcyYjMzI7dXBzdHJlYW1lZCwNCiZndDsmIzMyOw0KJmd0OyYjMzI7
VGhlJiMzMjttdDgxOTYtY2xrL3Bvd2VyLmgmIzMyO2ZpbGVuYW1lcyYjMzI7YXJlJiMzMjthbnl3
YXkmIzMyO3dyb25nJiMzMjtmb3ImIzMyO3Vwc3RyZWFtLi4uLiYjMzI7Oi0NCiZndDsmIzMyOykN
CiZndDsmIzMyOw0KJmd0OyYjMzI7Q2hlZXJzLA0KJmd0OyYjMzI7QW5nZWxvDQomZ3Q7JiMzMjsN
CkhpLCYjMzI7QW5nZWxvJiMzMjsNCg0KbWF5JiMzMjtJJiMzMjthc2smIzMyO2lmJiMzMjt5b3Um
IzMyO21lYW4mIzMyO3RoYXQmIzMyO3RoZSYjMzI7ZmlsZW5hbWVzJiMzMjsmcXVvdDttdDgxOTYt
Y2xrL3Bvd2VyLmgmIzMyOyZxdW90O25lZWQmIzMyO3RvDQpiZSYjMzI7Y2hhbmdlZCYjMzI7dG8m
IzMyO3RoZSYjMzI7Zm9sbG93aW5nJiM2MzsNCiYjMzI7DQomcXVvdDttZWRpYXRlayxtdDgxODgt
Y2xrLmgmcXVvdDsNCiZxdW90O21lZGlhdGVrLG10ODE4OC1wb3dlci5oJnF1b3Q7DQpJZiYjMzI7
c28sJiMzMjt3ZSYjMzI7d2lsbCYjMzI7YXNrJiMzMjt0aGUmIzMyO01lZGlhdGVrJiMzMjtjbG9j
ay9wb3dlciYjMzI7b3duZXImIzMyO3RvJiMzMjtzdWJtaXQmIzMyO3RoZW0NCmFjY29yZGluZyYj
MzI7dG8mIzMyO3RoZSYjMzI7Y29ycmVjdCYjMzI7dXBzdHJlYW0mIzMyO2Zvcm1hdC4NCiZndDsm
IzMyOw0KDQoNCkJlc3QsJiMzMjsNCg0KUGF1bA0KLy9zbmlwDQoNCjwvcHJlPg0KPC9wPjwvYm9k
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

--__=_Part_Boundary_002_946413693.313222949--

