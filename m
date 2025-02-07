Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A892A2B914
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8479810EA03;
	Fri,  7 Feb 2025 02:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tMdJ+e7y";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iVFIU/u4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85C910E9FF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:26:48 +0000 (UTC)
X-UUID: f9a3f32ae4fa11efb8f9918b5fc74e19-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uXdhgMMQFcDmVaq9Jjz8k+PQ5P9XDoSr8zQkcw35ZQE=; 
 b=tMdJ+e7y1TfIkWwuZZdstlif0ayz75MW+tW7xyVEbesQ0xOAMbSY2PenCs1D5u+gPZ534IqUnaovX7FO5URUZo/rR15DJjMkSowII0Ag04hX/9WQi/pTFUiRS1o0b2/p6C7qP23CVMCOgjLvR84gw+teQ7kzHQKlY/is1yjhN1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:3fa6e2ec-1e4c-426f-a549-23d5a393a1ea, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:c00b327f-427a-4311-9df4-bfaeeacd8532,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f9a3f32ae4fa11efb8f9918b5fc74e19-20250207
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1569436222; Fri, 07 Feb 2025 10:26:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 10:26:44 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 10:26:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+m7P/A+5KnmBrUKj6KNML81Wu5sGBvVvISA2iHGlFw57bajXDydjhi7ztpF42y9ocs0q+UKQiLmN1l+aFC8AkXAlCXstxNeSwgQFiqAQ9dYwPvp/Bie5CAseSeIQYMAv2zO475qDcRAKN3gz7qNayTpOBfbdqAWGNlyfiF4ghFranbD1Wj1cipgSmvNTeB8lDeWNE/VarJXv6iZ2RDiDp0iyDbZ7mNUT3z6DAgSKN/Sbq9vnJUI4UWPBQwUSxNfbgQSB0+4n9O+r70e0yAY4Vp1QZvPIFHHu9ubKP10iQzjNVsAlf8tSUGmZJdC197H+qWP1L+kcasXBqgT98RH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/I9bn1YMAXdJTTGsJTTH6J5hjIZkZIV+1wpRw9OVNw=;
 b=MH1vGKpdT1+V7+1QOiOj6GdhJePgthpTW1GHfbk/3JsSOSXqr57Sd5nVKloiFpaqEuElKGqq9ZM+FBvIP8KyJ08TtgEe2zm8x2P2lMY9Jxfnaucmu6ScU27CXgXfprG2+x1dT8NY54d2rguXSUt+Kgl/X2BjCUrfqp9fNsJDTt7wDKdRGczO8xm3KARHNQ8+eIauLosaGMD4OGBl7oTHdupsBc5rPoGEoLmhPp26HIk+I60HMU1kP68ouyI3ptEjJIPzuEI5RhlHBKkheA8RW+B4J5nnV+Vqk2Na8ZvbWSa4RYzRTPik9a8U2kvYf3tNwx/wnjjHmWPMgYJZANj/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/I9bn1YMAXdJTTGsJTTH6J5hjIZkZIV+1wpRw9OVNw=;
 b=iVFIU/u47ZV1QvFmWZLqF07VQ/IKrwWTC9Ll4BBW1jrGmrhim912uBEJe+OW989hARhyp7HoXNfHRg3d4lHr0rvssYByQJIwCQX5jrx/ogRCqXheq/Dk2YFZ0n4gl0tY4a/9WmPX1Iu21LfrV7oTmmUyX29rShIAbpmtZZ6FHBE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6803.apcprd03.prod.outlook.com (2603:1096:4:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 7 Feb
 2025 02:26:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 02:26:41 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "oushixiong1025@163.com" <oushixiong1025@163.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "oushixiong@kylinos.cn" <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/mediatek: Convert to use
 devm_platform_ioremap_resource
Thread-Topic: [PATCH] drm/mediatek: Convert to use
 devm_platform_ioremap_resource
Thread-Index: AQHbcXW0BpQUMeA/lEKn00Yh6saKX7M7LIUA
Date: Fri, 7 Feb 2025 02:26:41 +0000
Message-ID: <17d991fd6b45b11f215d976bd702251ceb994bcf.camel@mediatek.com>
References: <20250128094118.1526-1-oushixiong1025@163.com>
In-Reply-To: <20250128094118.1526-1-oushixiong1025@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6803:EE_
x-ms-office365-filtering-correlation-id: 56def4ca-0b41-4e66-d0fd-08dd471edb52
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?eEMxNkdSS040WExmakRkdmhmRVFSK2FlbStTZ0FPbHc5aG80NkhFK2o5aGla?=
 =?utf-8?B?Mzd1S1dQZS9sb2FzeSs4bTVEdktqM3ZLWjh6UURweG5CMjdXZ0RjQXhJcm1K?=
 =?utf-8?B?aVpsRC9BMGJjUjdHUDBidXZUYTdjWFN3Q01oTWFmUmJpTDFiSHVhMVc5U0d0?=
 =?utf-8?B?YlE2WkxQNVJvWDVRZWtyL01IWDdUaVFncmtsdG4xMEk3cFE1SnZzUU5pN1dJ?=
 =?utf-8?B?SnBiRXpLMXFZYjVZakFLQy9sRkppQkJ0WFE0TEd6anlKdGQzOXdrVEwvNWhu?=
 =?utf-8?B?VDJDRXlxUjlmWFNnY1NHd1pwaWdKVEppQzgxWkNwVWVEQ0Y1eFpPMGV6clk2?=
 =?utf-8?B?c3JPZFh4dHorN21zY1FOc2JGU29JWjFuWDJlSXdpZDh5c1k2WHV6RXJXbEov?=
 =?utf-8?B?K0ltR1dvNkxqRHE4N1hYQ0htalV6MTFXanBlYzQzNEo0Zkg1bGtURFhxQ3lO?=
 =?utf-8?B?L3RkUUJYdXF4bHplbzFPSW1ydzErTWRIWmgwUkd6MWFIdWY0WDF3N1VZRGdn?=
 =?utf-8?B?emd3bHRUQktoZFlVSUEvMEFFdHBNcGQ4Z1ZkOXZ3aUtmMUlNenVHZjZieERK?=
 =?utf-8?B?VFV2a2JCVllQWG9qeENiUU5VTEg0ZWZyTmErSkdUZXRZL2NmR1dQdklPUEtu?=
 =?utf-8?B?UmJHSk5DZzUwcmdJUmZGUWZha3pvbHJDa1o3R1d4dGNyWWhENHJXT0JnOUJF?=
 =?utf-8?B?dWFXMEJva25LYjFhN1pHZ2xrNnBnUVYrbXEwVDR4dnVnckVWelVJQzkwV2VJ?=
 =?utf-8?B?Yk12THdZaHQzZ21EZmlEejlaRkJocWxCSk9vejlxbE5sRXg4VEM4TmFOemI0?=
 =?utf-8?B?TXh4T1NwUTFnK0l6OGYvRGhXczhFRENUcW5uUlNLNjdNeGh5YWZudjlFWkpz?=
 =?utf-8?B?ZE9YdUQ4MFdYaU1MT0hLTmltbkl2RzVuWjUzUFhxTEdaQTBQVEtVOVBvR0lh?=
 =?utf-8?B?bTYwbjUvVnExY2FCK3d1dDFhdUx3UjhLUmd6Ti91Z0kyT0NTTTJwM0ZrdWUx?=
 =?utf-8?B?ckFyZ1dnK1hFa3VvYlNMMG5nWHNJWksyQm54YVhETy80M3FXb05vbk1HUUdz?=
 =?utf-8?B?eHl3d2k4Rkl0YnRFQUliV2x5cEl5dXhEQW9xcDYwNTE3SC9UYUtGQjNIQVNK?=
 =?utf-8?B?TjB5WGZ3ZkFONjRDU2k1RmNkRzZrSlJQUVpBNnQ2Mk5ZWjBLeDFSR0JFMGsx?=
 =?utf-8?B?WSt0UVFGLzBqUkM3dkFHbzNiUTRHdDlGRjlmYTB5Z0VLMUZEVUxtRUliWU1L?=
 =?utf-8?B?a1dZUmFHWW9jVzZOb3ZLeG9CZU9na2p5MGR4TElOYktocGxWYU9xRklESVp5?=
 =?utf-8?B?dFV2OWpZTzFvVGVRNXJlUDZkTjlkeWxIQytpMzZhL0pMdGNaZWFBb0pTSy9k?=
 =?utf-8?B?Qlh0bytTZ2E1RjMwV0RYb0xhSEMxa1FmbUF5OHUwVEhqZmFGVHYxZ0ZYS28z?=
 =?utf-8?B?czluK0UxNUN5S0JFTmtBNW1VUFg5RWJBKzBKY2J1OFhMUTJKT0VGa3FLbzc2?=
 =?utf-8?B?c1BCMkVLUEhMWVdxUjhSVXVtWjlqM0NnbHlTSzZxUGFRY3ZSc3A0WUhncDRa?=
 =?utf-8?B?OUlvT2NXbVpyRVRDbndYVExVVUNzOTlZeVgreWxPQlFnOGUzYzVlalVGSWRF?=
 =?utf-8?B?akRYSm80S2x1ekVad3BMbUdkMmt0a1k5Vnc1Z25OYSthU1ltd0JkOVM2eEFT?=
 =?utf-8?B?cGtzdm1hSXhNKzNrZUl3Tk5nZE5ZVmlYelhaTTNHQUNxWGt0ejRJNyszUWov?=
 =?utf-8?B?OW15cXJ3bjV5K05BVU1vaDhFZWtzR2ZjVWtjVjJxbUJFc2xxaURIWVdUZ1Nu?=
 =?utf-8?B?cDNjSWRrTlhGQlVRWW5maHRLNVgyYmkvbURoVjRtYTk1ZXRDQUtHcEtWZEYx?=
 =?utf-8?B?RGxST1FSSFE1MkFSL0pHcFMzWXNPZTVCbmpqOVFKQlFhNHRhNzVqUXl5OVlo?=
 =?utf-8?Q?00p5bjtwYXSCJ+yDe3gTxn6PpWvX8A3S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXU3VWVzR3VYa0YvV2p2VWk1VHoxejc0enNVSjFtNjlWdHV0bE1JWXJiTi9o?=
 =?utf-8?B?K0tQQllTMHBneXVGM1JkU0piRytaUUdxNkI1aUZkR0NJV2N0RFNEaVpESG1M?=
 =?utf-8?B?S3JrcGIyczFLMkpLS2MvTmE1ZDhIcFdvc2krYTUrOXRISXlDYzZ6c0I3dytt?=
 =?utf-8?B?UHVFdmYwcEpiMkxDKzQzcU1xWTBDVUlEeHZmb1p5N0JQamVlVDNoTXJqeklM?=
 =?utf-8?B?TVp3NXBja1dSa3RieXBvVW9LWG5YYnMwN0xDd2hYVkp3UEdWQ0JyY1Y3MVVk?=
 =?utf-8?B?TDZsQ0laZU9qcGNlbkR2Rys5Vk14ZVlVY0RCUmFJdlVHVFp6enBnMXJydkFZ?=
 =?utf-8?B?QlZkZ2NHL2R5eEs1VDNud242R21PSDBRNnRqUDZHbUNENTlRS1RMbEdOZEVk?=
 =?utf-8?B?dWErSFRPRDhDRmJYNFYxZ0FWSUVpRGhueitpRVVENk5WTXd2Tk5iTHJKUDZu?=
 =?utf-8?B?R0NXV3pJb2JFcERMbyt1bUZwaGQzaW5xUGVlRGFHV0hxQXNueW9ubzFjcEVD?=
 =?utf-8?B?TE5QRDYrY0NnNytDQ3Vta0VrTmpCWlh1V01JQ2R4bWlJVFF5V3pOd3ZUb3Jt?=
 =?utf-8?B?eXlNMU1uNVNFRFVOVjRocEtFZGdvSERyVjRFM2RIOVp2RTFCZWlOSjhmVUhs?=
 =?utf-8?B?bERqcnphaVNxTk9IQm05TDJhcGFxTTFrb0tZblJ0QXFaZVprUmhPV3NicHFW?=
 =?utf-8?B?Ry8vYk5WMzlTWVZtcThxSExIcUdjOFRWRE1jd21xZDYvVkJGMWdndmRKTEx2?=
 =?utf-8?B?eEY1YmQzQWRvNFErYjFNd0loTEhxOXEwTStsRkUvZWRja3NNUFUyclFPbEZ4?=
 =?utf-8?B?ZmRjeWRoUldRb3kxSEs3TlNaT3pTRG5yemkxSFdBMUptTW8wYThsZzNHb3c0?=
 =?utf-8?B?TU5qelpyVjFaRlN0OEU3a1JXakxaK3BzTkdFb2lYbnR1OCtwbkd2Rml2WFEz?=
 =?utf-8?B?QkdBcFNjazkzckpMcVlCZjVEUHZrQ3VPYU52OGVJSGRWMUE0YlN4ZndEV29z?=
 =?utf-8?B?SjV4cUEyai9VZnV4VTdRMUtyQU1XRG1sY2R5MzdpUXN4SWcrdzFmQldPQ25q?=
 =?utf-8?B?WjA3UTMrSE52V3VaRnpqRkZwTTJwdXh5WmZTTlYrMXFGdVlmRkZWWmRVV3Bl?=
 =?utf-8?B?emNOdnhZRUgyeHVSNmFVSUdxSjBzNFBuRHVOTUN1bkFxT21BVXd3aDlVUmtq?=
 =?utf-8?B?NS9rajdTR0VxTDIvMU1Fc2F2V2ord0xGa3VWWDVOdUg5NEtBZzZVaHdpUFJw?=
 =?utf-8?B?SkRXQjdzaXJ4Y0xPSVRtV01Na0dpbnhha3FRWXBIL3hPQ3c1Zk80aHVUN1hT?=
 =?utf-8?B?Q3dmREtWOWorQ3JRRkJEcVYzZURxd3RrZ2JNUjZzS0x4RS8zU2d0VnVLNlJw?=
 =?utf-8?B?N2l3Q0Q2RDhwLzlQeER0Ym1jVERjbmhQTGowSDhrVHhtNDMwelVlMlRZM2c2?=
 =?utf-8?B?cGZILzZ5bnFEa3ZMbGxrT0p6NUpxVHZqTGRxdlhPNXc5MHB6NTF0RytXOVdB?=
 =?utf-8?B?bmkzbkIwOGordElubW5RNWRBZ3IreGNzVlFpeEc0WlhUL0I3TjFGd1RWRG5t?=
 =?utf-8?B?Vk4wSjRoalhUWUhRTjBpd1NBZzZCNUdJV2ZpZWhhTUEyclkzU200REFYc0ZS?=
 =?utf-8?B?SHhySnF6YlZBcnpFZGQ1VUJIblI4Y1FuUk5yTDJRU1hhWlM1R0JYU3NCQk9M?=
 =?utf-8?B?Y0d3VzE5cWNwYmc2cjQzZXA1Y2VnSFoxYm03bEZrci9zSHVlM0REU0pNTDNh?=
 =?utf-8?B?UlB1UzRlMUJOUk5FM3BIUHBGUm9WYTl3aHZiU0ZzekYwUDNPcS94ekpoZzlt?=
 =?utf-8?B?WjB0N2pLakRRZ3pXc1MyNmdkSjM0akhWTGpnQk8vL2psRzcwNHMvbjgyWkZJ?=
 =?utf-8?B?Sm1uQnlWcHhUd1RXbnBTWEYzRTlYdFlJRkhvZUV0MXJhWnBESWV0VElHQmll?=
 =?utf-8?B?WHNSTGFTbFFGUStrUlRBdHA1Y3VWNzM4Zys0TVlVNERhY2NmbDZCdXRUb1ls?=
 =?utf-8?B?a0RxRlJuaWw1S3RUZk1PL0tkR1NWZkJOcFF2WlpBUEgxWnZMZStrN09kZWtr?=
 =?utf-8?B?U09ZR01qVlRPb2FHK2lBenczWlZuQThNWHhmUUJRRnVMVFpGaFkzcS9Ob3RP?=
 =?utf-8?Q?Cs085AXDwdtlv4cJB1lQgtm96?=
Content-ID: <A8ADB20DDD199343BE7AE150DFD6BA7D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56def4ca-0b41-4e66-d0fd-08dd471edb52
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 02:26:41.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qed9KYBVW/LA4IVCTjxaQJRYjzXkkChDgoq2ieqAmn/RgXYf7SFYAqPFNM7rI5AhQNI4CMgn6O/XwSBf+RXYWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6803
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1699610630.303399331"
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

--__=_Part_Boundary_001_1699610630.303399331
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoaXhpb25nOg0KDQpPbiBUdWUsIDIwMjUtMDEtMjggYXQgMTc6NDEgKzA4MDAsIG91c2hp
eGlvbmcxMDI1QDE2My5jb20gd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gRnJvbTogU2hpeGlvbmcgT3Ug
PG91c2hpeGlvbmdAa3lsaW5vcy5jbj4NCj4gDQo+IERvIG5vdCBuZWVkIHRvIGdldCByZXNvdXJj
ZSwgc28gY29udmVydCB0byB1c2UNCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlLg0K
DQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2hpeGlvbmcgT3UgPG91c2hpeGlvbmdAa3lsaW5vcy5jbj4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYyB8IDMgKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYw0KPiBpbmRleCBiNGUzZTVhMzQyOGIuLjdlMzAyNzI0
ZTc0YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5n
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5nLmMNCj4gQEAg
LTk1LDcgKzk1LDYgQEAgc3RhdGljIGludCBtdGtfcGFkZGluZ19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7DQo+ICAgICAgICAgc3RydWN0IG10a19wYWRkaW5nICpwcml2Ow0KPiAtICAgICAg
IHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiAgICAgICAgIGludCByZXQ7DQo+IA0KPiAgICAgICAg
IHByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4g
QEAgLTEwNyw3ICsxMDYsNyBAQCBzdGF0aWMgaW50IG10a19wYWRkaW5nX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIFBUUl9FUlIocHJpdi0+Y2xrKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IGNsa1xuIik7DQo+IA0KPiAtICAgICAgIHByaXYt
PnJlZyA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZy
ZXMpOw0KPiArICAgICAgIHByaXYtPnJlZyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZShwZGV2LCAwKTsNCj4gICAgICAgICBpZiAoSVNfRVJSKHByaXYtPnJlZykpDQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+cmVnKSwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZG8gaW9yZW1h
cFxuIik7DQo+IC0tDQo+IDIuNDMuMA0KPiANCj4gDQoNCg==

--__=_Part_Boundary_001_1699610630.303399331
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGl4aW9uZzoNCg0KT24mIzMyO1R1ZSwm
IzMyOzIwMjUtMDEtMjgmIzMyO2F0JiMzMjsxNzo0MSYjMzI7KzA4MDAsJiMzMjtvdXNoaXhpb25n
MTAyNUAxNjMuY29tJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7
OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMz
MjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVy
aWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Zyb206JiMzMjtTaGl4aW9uZyYjMzI7T3UmIzMy
OyZsdDtvdXNoaXhpb25nQGt5bGlub3MuY24mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0RvJiMz
Mjtub3QmIzMyO25lZWQmIzMyO3RvJiMzMjtnZXQmIzMyO3Jlc291cmNlLCYjMzI7c28mIzMyO2Nv
bnZlcnQmIzMyO3RvJiMzMjt1c2UNCiZndDsmIzMyO2Rldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRl
ay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NoaXhp
b25nJiMzMjtPdSYjMzI7Jmx0O291c2hpeGlvbmdAa3lsaW5vcy5jbiZndDsNCiZndDsmIzMyOy0t
LQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYyYj
MzI7fCYjMzI7MyYjMzI7Ky0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQs
JiMzMjsxJiMzMjtpbnNlcnRpb24oKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19wYWRkaW5nLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRkaW5n
LmMNCiZndDsmIzMyO2luZGV4JiMzMjtiNGUzZTVhMzQyOGIuLjdlMzAyNzI0ZTc0YSYjMzI7MTAw
NjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wYWRk
aW5nLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3Bh
ZGRpbmcuYw0KJmd0OyYjMzI7QEAmIzMyOy05NSw3JiMzMjsrOTUsNiYjMzI7QEAmIzMyO3N0YXRp
YyYjMzI7aW50JiMzMjttdGtfcGFkZGluZ19wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2Rldmlj
ZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiYjMzI7PSYj
MzI7JmFtcDtwZGV2LSZndDtkZXY7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfcGFkZGluZyYjMzI7KnByaXY7DQomZ3Q7JiMz
MjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO3Jlc291cmNl
JiMzMjsqcmVzOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO2ludCYjMzI7cmV0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7cHJpdiYjMzI7PSYjMzI7ZGV2bV9remFsbG9jKGRldiwmIzMy
O3NpemVvZigqcHJpdiksJiMzMjtHRlBfS0VSTkVMKTsNCiZndDsmIzMyO0BAJiMzMjstMTA3LDcm
IzMyOysxMDYsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfcGFkZGluZ19wcm9i
ZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7ZGV2X2Vycl9wcm9iZShkZXYsJiMzMjtQVFJfRVJS
KHByaXYtJmd0O2NsayksDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZxdW90O2ZhaWxlZCYjMzI7
dG8mIzMyO2dldCYjMzI7Y2xrJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7LSYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cHJpdi0mZ3Q7cmVnJiMzMjs9JiMzMjtk
ZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2LCYjMzI7MCwmIzMyOyZh
bXA7cmVzKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3By
aXYtJmd0O3JlZyYjMzI7PSYjMzI7ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYs
JiMzMjswKTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtpZiYjMzI7KElTX0VSUihwcml2LSZndDtyZWcpKQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtyZXR1cm4mIzMyO2Rldl9lcnJfcHJvYmUoZGV2LCYjMzI7UFRSX0VSUihwcml2LSZn
dDtyZWcpLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmcXVvdDtmYWlsZWQmIzMyO3RvJiMzMjtk
byYjMzI7aW9yZW1hcCYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Mi40My4w
DQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVk
aWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBj
b3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5
b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1h
aWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1699610630.303399331--

