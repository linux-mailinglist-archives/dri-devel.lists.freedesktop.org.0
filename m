Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77898FDAF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF1910E84C;
	Fri,  4 Oct 2024 07:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="f5E47dYA";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="W4B7aVOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2EC10E84C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 07:16:35 +0000 (UTC)
X-UUID: 938807d0822011ef8b96093e013ec31c-20241004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=o20B4rQ9CszWLd1vwBRg+qRm8hhJKOzgGXOO4XuIgyU=; 
 b=f5E47dYAxsZurjl4U5/T9sK1cfOmKUkTVOGlZBCEG5XnEfzD59JhYULaL848XgOAI59ujPtCaNV3QiwTzGYaPQDJGbw9qbLWHXtoBx9MoS8HP/Yh7u0TtkKXmLyCWIRgSZc7kD77T0dzOCA+ZwKcfOyL8CO+8+gzyxZv9dAc3G8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:7795f626-7078-4e02-bbeb-6e4e02287faa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:e4b8bb64-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 938807d0822011ef8b96093e013ec31c-20241004
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1515213917; Fri, 04 Oct 2024 15:16:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 4 Oct 2024 15:16:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 4 Oct 2024 15:16:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDzmm3t7o8q75bifUUdOrEiGBClhqWYNnMucjRTm54uvPl2Zqn/VDc4f/PbwVUanzBQ67bKgux0Zwcl7+zSxfpMyXKpWQfgi0NdR5a97NzXRQVBtgJVRgpLCY4gFlb8QD0lGjlPZy+6AsGimBUfhLVGACNjJ2/vNYkYVGOWCMHwgG2uWUK5NAmABZs64+fF25qs/cc9dBZNPhjJ0T8UkkpfXQZYiigfs4n503czaVfWafXGcOh4TEnQR0FpD1FYjCmghAoGk2tG0Pm/sQ1trUCKAQ+xX7oLO9kknk9DdVsng1obnoJsEhGQIzofe4351lv5GVwnGhYWTWB1dxNOKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o20B4rQ9CszWLd1vwBRg+qRm8hhJKOzgGXOO4XuIgyU=;
 b=nTBA6w9jxSPhn4c8votELRgbk/d9Ge4n+tXnicq/adckaNQR3MWCpSiHnLjStAjJdekPhG1PV00i/q+2WmDRkjIW46mBm6x4avQv1/DIg6Adjoe0KMItGKPJbU1LnTpfN7GdP+fO6jPC6bbSZyAnsVR6VgUoo53mh6VWWkB9+4HGr4DEOpLFLWmRZVZVAY1QFkAvTmCWF4WUhH4dsY/UnXo7V/s5hYHHnJTzxJ1VIXZYkrGmOaIf8qdjPudXyrdh4KzCJaxeOc/gyOpXR/cz96U0WOX/R13PREoLeWkoQyLNjbEDC4SD74A2yMII1J7OZ83QqA3v184c/7Usu144fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o20B4rQ9CszWLd1vwBRg+qRm8hhJKOzgGXOO4XuIgyU=;
 b=W4B7aVOhkfjp0/AD5eW7xwBr6jgS3E28vit/wJq388LoKleV9gp4Ea7uEqfeixALZKGr9ue1NnvSAzOz2UjtHDSuDSRO9rzOEjXvj7bJZyu95rSrrRGEo8zZxnOYZbYQ2Jroo0t5DWx0aDxE4JBPyGoadYPRwxuFFwLB8UvPlz0=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by OSQPR03MB8644.apcprd03.prod.outlook.com (2603:1096:604:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 07:16:23 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 07:16:23 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?=
 <Macpaul.Lin@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: split: add subschema
 property constraints
Thread-Topic: [PATCH v4] dt-bindings: display: mediatek: split: add subschema
 property constraints
Thread-Index: AQHbFgtN/iBjvQXfqUCbf6VDQYgSL7J2IwaAgAALhAA=
Date: Fri, 4 Oct 2024 07:16:23 +0000
Message-ID: <00fe988ac57393eb7dcc837631f2a94bc5e95c0b.camel@mediatek.com>
References: <20241004031245.27514-1-moudy.ho@mediatek.com>
 <ajydpbq4ygrfr3ahs5nuh72pdmbttus2kgjb6csxc3p4tcq5l2@dlmucrzchvgl>
In-Reply-To: <ajydpbq4ygrfr3ahs5nuh72pdmbttus2kgjb6csxc3p4tcq5l2@dlmucrzchvgl>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|OSQPR03MB8644:EE_
x-ms-office365-filtering-correlation-id: af35cfea-18d5-4492-bb8c-08dce44473d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODNNUTJvZHZBMDJNSVg5a2ZmL2xMWHQ2TmlsSEtKT1kyMWFERG1icmRtRStF?=
 =?utf-8?B?RGZrMnAwYzNrVGgxZFlzay9JUUl1OXpRdTc5dFpvamduZnFtVXVLQWFoWjRS?=
 =?utf-8?B?OVh6ZEoxOHlSRWhYaG1zWS9HN0tjcjVGbDh5Nk5UYThSdlp6bWtXU01tbitK?=
 =?utf-8?B?MkFsaVVpQThTa3YzQll0RlFzY2dzajVjeGpZY0s3NlhSTmU3eWFTajJOdWdm?=
 =?utf-8?B?V1k4WWVTTXZmZDRzbTNTMGJiSUF3ei91QnJ2aE1yelRydVV6TE9TcUVDMFVw?=
 =?utf-8?B?SzI4a01hM09UVmd0aUhwb3pnK2c2VmdpRk1SYkxVekFIQmc2Ti9tLzlXSGIy?=
 =?utf-8?B?bitOWDVxOE4vWDdLMnVnNDIvR0c1MGVmNGJwKzVSRm9RSU1oOXk4Rjd2cUNJ?=
 =?utf-8?B?M1grc21UUnEwbUQvWFYzWU80aGFFTnlKWXEwNGtCRlkrN25tZzZVNUlwU011?=
 =?utf-8?B?d1BjaThDcWUyeHJ0S3IwMGZCelludnlINlRTTUt1VHBxOUxLTzZCSFRHSlVt?=
 =?utf-8?B?Q0Jhb0VrOHFxZS9sd28yRTVPZHNmZ0Q0dkdsRFBtaC9kSjFKeXh0V0ZkMmtn?=
 =?utf-8?B?RlZEN0VQdUlCQ3RTN21KaEJrQkJyQTBVdklrNnJnNVdsc2VFV3FraVhudld1?=
 =?utf-8?B?YjlraWdBN2FUeXJiM0h4TnZ0bERhRjVvL0tBb1dGdFRIS0FYNFBNbEd5ekVa?=
 =?utf-8?B?Z2xFSmFDY2F1K3BNa1RBSmU5RFhxS0dNMWJoY1ZZajNBN0o5VTd5dTFoajAz?=
 =?utf-8?B?WWZ2UENwR1kwTlZxSjlJQ01NOHVDd3BMSC96RmVaaWlIaTI5VDZ2djlic0l2?=
 =?utf-8?B?dnlpT2laNlY4THBpcUViTnB3WHdvcHNzRnltZ25vWWM0a2w5SXB3Tmp2SWgw?=
 =?utf-8?B?Q2RQKzl1RkpESVpQNFFJL1FHaWlrUC9sSWN2RUF2N05DVjIyVkNSTkg3S29j?=
 =?utf-8?B?S2RJQnU3cjBkd004Z3ZhbEU0SklIdWIvWXNndU43TWJVQW9qWkxwdllIclFM?=
 =?utf-8?B?M3lKQ3prZXpUVVh2UmVXa3NqemZ6ZXF6TU92Q3N1RldrK1dmV21HdEh2L2Vk?=
 =?utf-8?B?ejFFc3BLTlUxeDUwajI4Smk5dkVkZDBuQVYxQ1FrYTdtWk5zZGVLdmpqWFMy?=
 =?utf-8?B?SHE4NU55b3pHY0U1RFVJUXM4L3hqdDBKb01nM1FLcS9pa3ZxaUlFQzRMc0No?=
 =?utf-8?B?RnhzZzMvU2pFQkI5QWJuVHA3YUpNSVd1VkJ1L2RZUThhay9BTHhwcnp0TEY1?=
 =?utf-8?B?YitWVzZWUVBzZ0p4YkVoQm5CRk1ocUVLcHRPQ096cXhVZ1R6L0c5bmhQUEJ5?=
 =?utf-8?B?WlFUeWxxY0JiMXpWR29oWmhqYzE5TG9KTXZqT0p0cGIxaWlzSnBHTUtzaHhj?=
 =?utf-8?B?Rkt3MjBNZnZPNTk4MkdIMXQ4SnBGMkg3MXRoUFY3ZnV2T3BCdnhPcUU4WUk3?=
 =?utf-8?B?Sk9ySXlscVRRbktsOGRVNnBmN09vRzJJaUVJaUF4c1dUSTd6ekR6OG92ci9l?=
 =?utf-8?B?T1BXRklKZnZkTXRGSHhKTzVORE1VV2x2b0pnaVVwL2FiR2J4TVo5SDdaN2lB?=
 =?utf-8?B?dXZlZ3NQM0hFNCt2eFVtL1J3NDZHK0VWenlseHMvWjNxVVdRVitpYzZhQlll?=
 =?utf-8?B?UmNUZDBjU0dHWWFaYmladmkwbUdKdWZDSkh1aFdEdndyQVdYQktMWnd2T1Zu?=
 =?utf-8?B?Wi9VZnphNFd2cHdBSjhnZ29FT09SUEZiZzRXbHN2QW80Vm1sOHdaa2J2U2t3?=
 =?utf-8?B?ejlheGpvT0FmMjhuN3dIeFdjYTJQeXVZV0VROWlSOVV3YW5MT2NiL2tvL1lP?=
 =?utf-8?B?eVZpVFhCNkZYZ2QwNzYwQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QytxVDRoSU1VbnNYNHgxK1MzTUxjRndBdkdnNzMyK0dqT2ltZlpvL1hxL3dN?=
 =?utf-8?B?SjZNT0ozL1daejQzb1FZTGtIUVRhOU1wdW5FZjFBMHNZd1NZeTNCaVhkTGJX?=
 =?utf-8?B?bVhhNVZLMkJEd1RValM2K1Rid0Vza3dxVWMwTjVuSFIvQzZURjhvNHpvSDg3?=
 =?utf-8?B?enI2alNnaTRzYzRQWW9DS2o1QzNPeGNVTFFQTUIvekcreHRIYmlHMTk1eUR4?=
 =?utf-8?B?L2lSdVBwT3NyV0ZSMzJ3NTFGSVFGMmVhUnB3d1ZkOE55Ly84UUg4L25qWjc4?=
 =?utf-8?B?allGZkZFQ1JhME4rYnJ3YSt5SUNxYjExVlBXME1PTzBlaTI4Z1F4QWYrL3Z2?=
 =?utf-8?B?cnRXemRGbHpvMmljaUVoeTdQaTJjb1JMOEJvSndvUHY1elM2YVpVRklBUWcz?=
 =?utf-8?B?YWZ1TkJBdkdVb1p6L1pKeE13dlZ2VjZqcWNIdVAxL1dVQk5ySUdRN1Fid0RF?=
 =?utf-8?B?WkF4VVZRUnFrZVNzWVp6Ty9Ma0JiNzVnVDVYbnlFU3AxTkdNcU8weGhsbjl5?=
 =?utf-8?B?enIxTzY2U2dhSTZrTHFkNzdLL2dJQkRhT1RCUDg4NnFYVWp1N2E0RmgveG9S?=
 =?utf-8?B?WTZSNDFtNG0zbElRUlJCcHhULzlCOXFXYzFvNWIzMVZYbXVUSG84elN0RHpX?=
 =?utf-8?B?N3NISEZqdkhhcHlKdGxzaE82ZllKWjUyM05HNkU3Z1UvemdHTTF2MndHVUZw?=
 =?utf-8?B?bjhnbUdTdDc2dllIYjZxUVV0R1FzaS9temdJeDA0M3Jya2NmWDhkV3pVc1BN?=
 =?utf-8?B?UXBEbHdKM3djZ3Y1UVVVWDJkeUxadDU3Ly9TeS9zdE5oTFVuM2kzSFN0ampr?=
 =?utf-8?B?QXJkZTJMM1gzSE16TzFiK0VsZmpvQjZDRERxZStrb053R0p6eWN3SFRpMDVZ?=
 =?utf-8?B?SGZpVDJFM3NIRUdhNTR0bi9nZFZTNlFtMDFkOTlheWtMa3o1c3d5cFk5V01Z?=
 =?utf-8?B?MmZBZFBwSnRSMUZkM2xFTUE0QlY1K0RFUFpWSE1GbTZCcHNjajdGOGRGN3pn?=
 =?utf-8?B?L1BQaXk0Mk5OTFBzVnhQbjhraTB6TDJJYnIvUHd3WEh0Wmd5ZUkwUGxCZGFF?=
 =?utf-8?B?OHdOa2V1LzFIZDkvWTJNYTg3eEY2OXBGWUNqZzZvZ3FEc2JZM1U2bUZGdzNi?=
 =?utf-8?B?N2Z6eGxYRzhRZ0EvWno1YVZUdFFMdVkwMjR2QjlReHV0aWJHZmRpU05zWmEv?=
 =?utf-8?B?V3dzeTdPUFIyZTJEK1VSVzNBcG5BY21SZktYWDN5bzAycjQ0REZxSVJKNTdq?=
 =?utf-8?B?TytqRmN4aTZYbzJsY0plWjJIY20rVWxmd3JQL1lFWEdmQmJEcDNoSWdncDhS?=
 =?utf-8?B?aEEvdmlXUEFqYUxCWGUvWHN5TzFGYk9WcExzM1dMRmxNQVJLZlJITUIyVGEw?=
 =?utf-8?B?Sm5iaUJaL3lESkZGVDBDREwzeUpPK1RKeU4xT0VjWDFjRy9wWFBIVkl3a29w?=
 =?utf-8?B?N0FNOTNMUkhhaHhKL0tzd0pyellLWkpqa2J1STJEaVIyMTVQc0tIc1FpakUy?=
 =?utf-8?B?ci91UTdqUjdvc3FIbzhHaVA0dmx2Q2dYNElib1FPbVNuZy9oSmkzSEpnZUdr?=
 =?utf-8?B?VHpTUEZ0VnN4S255RUpEbDFXNW03Z3cxMGJJMm5sN2FuNEZhSlpNa3hzL01U?=
 =?utf-8?B?UGFyQVgralBSK1cxQWtYYlV1UFI2N3V6VDN3R3c5MW1iNm81REhrUFYvOGww?=
 =?utf-8?B?U2xpWitpeDZOc3ZIVlRCS016aDdsQTZOZXlwY3lnTTBWMFI1NTdlRWZYMnB1?=
 =?utf-8?B?N1pxVEdRNkJ2aXVlci94cmRVaGx6WXZFb1gzUWVEZm9HcDIycFRpODUrNE55?=
 =?utf-8?B?T2ZGSFBsVlRnSVpxR2lTN3RjOEo0TElrZ1FEMzRoODBNNUQzQmRwc3l6elZ3?=
 =?utf-8?B?bmszaEZoRVVxbVpMeEVRbTBHMlB4MFkwRFltRE9zVVkxcy81WWpvYjA4UXdQ?=
 =?utf-8?B?VjhUd2c3N0ltSWtVaWhIUVB3bkQwaGJMOU5vdjYvKzdaSEF1aWVnVHFIUzk4?=
 =?utf-8?B?ajJQOVRhM3A1b09kZVFjUEZxMUxqUUdHY2t3Z25OQmw1dmg1WGkzYWNQN3ZF?=
 =?utf-8?B?MlF6bk1EUVp1aDVPUW5JWGpycGdYbE1wd055OXEzelBad21xTk5QQkJJc1Ru?=
 =?utf-8?B?UkRIQ1M2SXBYQUEvSWdKVXRWbkF0UFgzM0pWVkd0ZTU4MU43OW1paG9NZUxa?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D66BC2CDCE0C62458BF49A5D62BABEE9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af35cfea-18d5-4492-bb8c-08dce44473d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 07:16:23.1776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WweDxqLNBthgjvDcIjHKR88zhzWFdStQuX57tQp2Gr96BUIZtFI3C7PrTl/0dzXzGY/oBT7NpSinOTrGD6rAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8644
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.823300-8.000000
X-TMASE-MatchedRID: 6E41RGmUyPrUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCh2BfeLATnEWmlaAItiONP3hKQh1LCmGBlHpIy6wt5Uw9BQ
 FWu9qPYbplgSrImTSndOV3LZIq5O+PXdZx1sZHpB0BEBFOTiHn1ObpRiWjuVr0SxMhOhuA0RCYR
 6TCxHlSOlBmedFcLqghDb+7lXKeDSZdH+xzatcBDiPEKUh+xB+1kqyrcMalqXdeAKnvBMxfMbXz
 Amc72fpxkb9fACVrLLcE8K2LK1WT3N94JK30y2IMIiU395I8H19LQinZ4QefKU8D0b0qFy9suf7
 RWbvUtyrusVRy4an8bxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.823300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C249A4A1CFF5C2B86BE454524350212CCF12040B6E2CC21F5222433C57B7513F2000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBGcmksIDIwMjQtMTAtMDQgYXQgMDg6MzUgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBk
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2
ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgT24gRnJpLCBPY3QgMDQsIDIw
MjQgYXQgMTE6MTI6NDVBTSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gVGhlIGRpc3BsYXkg
bm9kZSBpbiBtdDgxOTUuZHRzaSB3YXMgdHJpZ2dlcmluZyBhIENIRUNLX0RUQlMgZXJyb3INCj4g
ZHVlDQo+ID4gdG8gYW4gZXhjZXNzaXZlbHkgbG9uZyAnY2xvY2tzJyBwcm9wZXJ0eToNCj4gPiAg
IGRpc3BsYXlAMTRmMDYwMDA6IGNsb2NrczogW1szMSwgMTRdLCBbMzEsIDQzXSwgWzMxLCA0NF1d
IGlzIHRvbw0KPiBsb25nDQo+ID4gDQo+ID4gVG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCB0aGUgY29u
c3RyYWludHMgZm9yICdjbG9ja3MnIGFuZA0KPiA+IG90aGVyIHByb3BlcnRpZXMgd2l0aGluIHRo
ZSBzdWJzY2hlbWEgd2lsbCBiZSByZWluZm9yY2VkLg0KPiA+IA0KPiA+IEZpeGVzOiA3MzkwNThh
OWM1YzMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IHNwbGl0OiBhZGQNCj4gY29t
cGF0aWJsZSBmb3IgTVQ4MTk1IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWNwYXVsIExpbiA8bWFj
cGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3Vk
eS5ob0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gLS0NCj4gPiBUaGlzIGlzIGJhc2VkIG9uIFt2
Ml0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBzcGxpdDogYWRkDQo+IGNsb2NrcyBj
b3VudCBjb25zdHJhaW50IGZvciBNVDgxOTUNCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYzOg0K
PiA+ICAgLSBDb3JyZWN0IHRoZSBjb21wYXRpYmxlIG5hbWUgZm9yIHRoZSBtdDgxNzMgc3BsaXQg
aW4gdGhlDQo+IHN1YnNjaGVtYS4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiA+ICAg
LSBSZXZpc2UgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+ICAgLSBFbmhhbmNlIHRoZSBkZXNjcmlw
dGlvbnMgb2YgJ2Nsb2NrcycuDQo+ID4gICAtIFN0cmVuZ3RoZW4gdGhlIGNvbmRpdGlvbnMgd2l0
aGluIHRoZSBzdWJzY2hlbWEuDQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPiAgIC0g
QWRkaW5nIGZ1bmN0aW9uYWwgZGVzY3JpcHRpb25zIGFuZCBxdWFudGl0eSByZXN0cmljdGlvbnMu
DQo+ID4gLS0tDQo+ID4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0LnlhbWwg
ICAgICB8IDI0DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3BsaXQueQ0KPiBh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxzcGxpdC55DQo+IGFtbA0KPiA+IGluZGV4IGU0YWZmYzg1NGYzZC4uODdmODQ3
N2E3YmU4IDEwMDY0NA0KPiA+IC0tLQ0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0LnkNCj4gYW1sDQo+ID4gKysrDQo+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssc3BsaXQueQ0KPiBhbWwNCj4gPiBAQCAtNTcsNiArNTcsOSBAQCBwcm9wZXJ0aWVzOg0K
PiA+ICAgIGNsb2NrczoNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9u
OiBTUExJVCBDbG9jaw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBVc2VkIGZvciBpbnRlcmZh
Y2luZyB3aXRoIHRoZSBIRE1JIFJYIHNpZ25hbA0KPiBzb3VyY2UuDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IFBhaXJlZCB3aXRoIHJlY2VpdmluZyBIRE1JIFJYIG1ldGFkYXRhLg0KPiA+ICsg
ICAgbWluSXRlbXM6IDENCj4gPiAgDQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJs
ZQ0KPiA+IEBAIC03Miw5ICs3NSwzMCBAQCBhbGxPZjoNCj4gPiAgICAgICAgICAgICAgY29uc3Q6
IG1lZGlhdGVrLG10ODE5NS1tZHAzLXNwbGl0DQo+ID4gIA0KPiA+ICAgICAgdGhlbjoNCj4gPiAr
ICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+IA0KPiBtaW5JdGVtcywg
bm90aGluZyBpbiB5b3VyIGNvbW1pdCBtc2cgc2F5cyB0aGF0IGNsb2NrcyBhcmUgb3B0aW9uYWwN
Cj4gDQoNClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBJIG1pc3VuZGVyc3Rvb2QgdGhlIGltcGxp
Y2F0aW9ucyBvZiB1c2luZw0KbWluL21heC4NCg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDMN
Cj4gPiArDQo+ID4gKyAgICAgICAgcG93ZXItZG9tYWluczoNCj4gPiArICAgICAgICAgIG1heEl0
ZW1zOiAxDQo+IA0KPiBUaGlzIHNob3VsZCBiZSBpbiB0b3AtbGV2ZWwsIG5vdCBoZXJlLg0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNClRoZSBhYm92ZSB0d28gd2lsbCBi
ZSBjb3JyZWN0ZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KU2luY2VyZWx5LA0KTW91ZHkgSG8N
Cg==
