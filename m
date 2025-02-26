Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97FDA45D4D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1F210E8D9;
	Wed, 26 Feb 2025 11:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="IvCLnXiG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cCa9gCUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F058E10E283
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:37:48 +0000 (UTC)
X-UUID: 17065102f43611efaae1fd9735fae912-20250226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YqUnJgK5Q8Ns3AW8KnLj9+8AiQ6+aDBZyrw1PhUDN/c=; 
 b=IvCLnXiGrX4kTq6Ba0W/zelHvcs/whZINFvOObRn+RFAl0OMeaNjCrhjxMtpMR9KhuhYsmeKNnvsuSmt2n2o2kuupvwo4vJHjv0+rTHptbeArsZdZTdsFDIyIZBB/UwtRyNPSuIEoWYVJSCLEqljcWXVOYDzwdatQE3xBYmC7wM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:2373c1da-88ff-4811-92a4-ad1332a438c5, IP:0,
 U
 RL:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:12
X-CID-META: VersionHash:60aa074, CLOUDID:8067f3d9-654e-41f2-8a8e-a96c1e834c64,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 17065102f43611efaae1fd9735fae912-20250226
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1659608605; Wed, 26 Feb 2025 19:37:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 26 Feb 2025 19:37:41 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Wed, 26 Feb 2025 19:37:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQPVlJSSGBaRyI82kV3BAVXBCWd4laUy3SB7tQ46xXmgUw0f4jaZrOA7yETGBOXio+grxkXC24BoTLH7YYz7ul44L4pO7aNsiEAOsjIpG4U/lsaCO2eeLfU2aYQsgCjFCcODauTwuB+KaXhQmEKy60V+JlkEI7TGJ4tWinqD9UC57zsKKiGK0EIL9ZkE+c1xRwhNYkZ1CJne/PyM0/cFE2pDBJE6RdrfrJw/PDo87JvFxVlqqWBSiLemKQ+pn+oWbqZLB8+/e8arr2k3HaWuhqWxxPLClQhaaGZa7vrsgNWC4ZF/ZcfAbE0evcSi4wHB0aciVaGnXrGTYiIxHgJdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRgLmgEQAHTiH1rpIZsuyTAzN00daw5ynvemq3/dNxw=;
 b=pa4IbOckJUQnjYrSpZTLicevL1ziqW5U2IbE6eaxrztIJ00DLX1lHs7N3b/NaDAitiShHQfy9UAIz93heJaXW0mqvy/PNYuz5dIiQHC1Zq1c1ARcPO0KTRd6i9AoMF3ZDbUX4rk7XqX68u604cAnC3ZDimDRMsVwasY3QschPMj63hGUNyD2r4NJkake6iG9rSBtjUpMtgGKUe28wR/UTYSpCL5yUuwNBZ6JIlqnV5+N024lBGVKv+ti7ut/ff3hdiC170N9OL1dHeHrDfsD/1eXeizBS0quRWhbVlistWdRX39P8wfHSpajLUGfz0TtfgXLGGSC30Bl8Q7gEFdNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRgLmgEQAHTiH1rpIZsuyTAzN00daw5ynvemq3/dNxw=;
 b=cCa9gCUT0NqRjX09U9LaWtHx5VzT4LBBgFS8t3TtG/dPRLVc+XE1YidVIgwH43VbEcSAkgvLR5cCTRCX6HvkMEh8foqGhBE85cw8OHOcGwrjMPFh1B76cDl4+RKdyJKdWp5DiNj6j7AIQmZI0p15+d4ovqK+0CRpPu4EfwKXARE=
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com (2603:1096:400:459::6)
 by KL1PR03MB8260.apcprd03.prod.outlook.com (2603:1096:820:106::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 11:37:37 +0000
Received: from TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939]) by TYZPR03MB8136.apcprd03.prod.outlook.com
 ([fe80::c1dc:a4af:10cc:b939%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 11:37:37 +0000
From: =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
To: =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 7/7] dt-bindings: display: mediatek: tdshp: Add support
 for MT8196
Thread-Topic: [PATCH 7/7] dt-bindings: display: mediatek: tdshp: Add support
 for MT8196
Thread-Index: AQHbgq+5sxwOgnlvgEGophLUPTvB8bNOWu2AgAslXQA=
Date: Wed, 26 Feb 2025 11:37:37 +0000
Message-ID: <559fb0d86a25b7ad283eb71921128e8e11c507a4.camel@mediatek.com>
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-8-jay.liu@mediatek.com>
 <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
In-Reply-To: <4d8abd3f-c39b-49ea-8a43-b6ad0cf6fb15@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB8136:EE_|KL1PR03MB8260:EE_
x-ms-office365-filtering-correlation-id: 6665ae6a-e9f9-4970-3c2d-08dd5659f849
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Y3N3WllGZXgwTDVsUVpDcEMyc0VJaElld1FsbFc4YUpGb0xKMG9ma0xpSmY4?=
 =?utf-8?B?WlpoOGs3UG5BL3FCQkI3TWtNV1ZkeVVHY0xFMk5YL2ZtL0QwZitkb21wYU0r?=
 =?utf-8?B?NGlHNk55WnRick9VTWo0WW1wb09SYUMvRms0TWJpSDZOcnZTY0M5MTFUb1RP?=
 =?utf-8?B?ZzJzM2JqUTBjWVJKRkJ2RE5iQ0ozbEEvbHZ6aE5na1k2TCtQMFM5dUUyQ3pL?=
 =?utf-8?B?N2ZrTUZrSzRPZ0lmSTIveXhzalYzTFlJSGVyMDExWHYzR3VyNTFzMjJqSUtp?=
 =?utf-8?B?aHhSck5SRVFGOVo3NU53d0cyUFBrMVVnSFpjbUU2OEZyTkZwVDEzejQ1SFRI?=
 =?utf-8?B?c3lpMkhnTkoxUWQ2aTNUa0orbWhYMmdFRXRoeFlVT283QzBQTUx3Q1RNbWdI?=
 =?utf-8?B?enljUWRtYmI1RnUvSWdGcnRtTWxzajBFYzIwOUVxeS9aMjdMTEpEQ1d3U0Iz?=
 =?utf-8?B?S0I4ajNhS0R4N0wydXJlZE1xR0hqbVJqVUx4N0k4bmJ3VEVpT2lOa0VyNFhC?=
 =?utf-8?B?OHhWRlR2OXZlKytpZkxDalJ5SGpoQldEMDYwMndHa1V1TWc3Zk4veW5VUnJi?=
 =?utf-8?B?WWZXQnVCZnA1M2dvNnFyblNsc2RqTHQxc1lkR0orTnVNS0Q1bGozcFcrMkpl?=
 =?utf-8?B?RW5BVUlNaEhkSE8rZ2ludStQRUxFMDhXREdlNXdlN1VZQWNtUDErZDBnbzQw?=
 =?utf-8?B?Q0NvbjR5MGlNcjQxUk9BQnYzT2h1ZklGTms4SlYrOHlKM2I1eHlxVmJCZlkz?=
 =?utf-8?B?MG9iaS9XTUtzQ2IySmZyWFdzckc4eWtZYVJzUFhJTGNUbjNDSzhlT09tSXoy?=
 =?utf-8?B?WlIxajJQRkczOWJvcmo4QkhKSkRhaVVVb1NnWG9EWTJkUzFvMURwNDFiWUxY?=
 =?utf-8?B?RVY0Szd5dWhxczgvNElXSXM3elRoS0NGSDl6UmlUbXBOUEc2cXF6TnRqVWhR?=
 =?utf-8?B?K0V5dDFJbDd6VnVWR1FXamhQZGNRY0t6clBmUSt3eDh6VXVueitXMkNZSm81?=
 =?utf-8?B?cVUyY3VXdGYxMWQwOXJaZ2JFQlRRVHEwTXdORGxaOERUeTFsVjdTMXp2Sm1Z?=
 =?utf-8?B?bjRITHRvTUw0RVQ1QVVOMW9vQUJrcEtiUXhJKytuZTNRTHpMSUpqTndrZlo0?=
 =?utf-8?B?OUFIOWovNWVPYVpvbzhRRkthSm9ITHByVlFlZHo2QU4rMzRlcXJaNU1CTHR4?=
 =?utf-8?B?Tk1Jc0ErVWc5QXhldkxNTVBYUTlDaklqSzJDWkM5U0F3TDUvS1QzL1p3bkV2?=
 =?utf-8?B?cndrWE9BTG9xR0xVZHVBUkRTOGUzYjdlQVhaMmNSZWJZdTByenRlczN6TUVk?=
 =?utf-8?B?VFRNTW1qT2NTL2JJWmdOdmNzYU5SdUpJOVQwOUhZVE9MemYvSm0zakwwZ2dK?=
 =?utf-8?B?emtFV0JEMURyWDVHcVNNNTE3RGZzSEZYblNSMzNJTVRZelpMZk1KZG1GUkxD?=
 =?utf-8?B?MC91bWtjQ0dRa0k2anJCK0Evcm8wZlJxK1V4SHlGRWFFeWdyZWlGdTlKWDdy?=
 =?utf-8?B?KzlwSnBqU2ZHRDZXUVM3bzZZTVlVSXdWS3F3NHlVbHlnMFE3cWZITk5XYWhU?=
 =?utf-8?B?eCtlUjJUazk1ZVgzOXZYMUtvdjd1VmNjbWlaaTJDbjM2M3FTNlZhN2R2cHJt?=
 =?utf-8?B?VzdrVDlsVGUxOVh0Skl1cEU5THAxUFcwUmhkYys5VkxseldZbWVlQUxacTg0?=
 =?utf-8?B?bnVlSENDbkdtazl1b3RCYXJlTnY4cnNkTGZha0JONHBiZlZBd0lpZ21MV0Jo?=
 =?utf-8?B?OVNzcnhXNEJEclNKUXgyVVlFb3BCa0RMbllVT1Fkai80MUcvQzYwRXJQS1Nq?=
 =?utf-8?B?SVBaekRwazFkSjlIMnphQWtHNGQ3QTRsYy8valVVWTJCK05oNGt2cDVsRnN0?=
 =?utf-8?B?QlU1N3I4QTVQaUFXT1daVGZvVThzdjAyT3ZibUNVV2puV1VyTjFnS1lSb0s5?=
 =?utf-8?Q?Io4V/8HTbs0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB8136.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1ZicU42RkxnTDFvUGs3NmZ3WDg0bTFKSko1UXFFOVpLdmJXeVdQc0QyamdJ?=
 =?utf-8?B?WjRQNHVyUkFTelNhWTJCcXc5eVJSa1JEZWFUYzhDU2ppUkpZUUQzbUUzVGZi?=
 =?utf-8?B?WkRYV0FVYVlCNE9hR1BIbVZSWUZPYitpbEk0UUlKbUcxQzVhc1hZY1A4R1RR?=
 =?utf-8?B?Q3JHQmdmOUJvZ0NQN0JLU3B3aHFWWnlvVTRRY3pBQ2tqS2RWaEQ2NG1aN2wr?=
 =?utf-8?B?UjhwWGFFYlVkKytYOUErZ1EyNkpFYW5xdDlTZzI5V0ZOQWMvNk41cWMvOEZn?=
 =?utf-8?B?em5JQzg3V2wwUUM4ZHFqZGJ0d1VGanFWYjE5RGVWYkw3RHpnYTRqaEVjdVEx?=
 =?utf-8?B?Q2J0YlNYQWtlaUcyVFdHNHVYekpDUlFqRFFCTkRlN3VOQnd6WXZlNzYySWJJ?=
 =?utf-8?B?ZCtvRGsyYjNmRTN1eGF4Z0lTRWlZMzdQd3diSXF0YWJPaThOWVowbW5ZVG1X?=
 =?utf-8?B?MURHc3plc1FSMzNIUjY4WVhZdEZteVBpbXVuUDJWeVBIMHpubVl2V2VINW9y?=
 =?utf-8?B?YXgxR0c0ZHFpcE5wT3VmRmlaRVNCbUZ2dTBjSkl3aHpGWVYwNEFCYy9WcnND?=
 =?utf-8?B?UFVXZzFxOW9wanVNZ2hPR3I1Qmt2QmdCb1Q5SXdjSnpkS1hiVEZWTW11N0l4?=
 =?utf-8?B?L21zdzhiWndYczRHeHozcWRidzBId1JEM2VQY3dpMDNwVlFMYmhoQlE4aWxt?=
 =?utf-8?B?aEx6WEFWdmN4M1ovQkVNUmRwRkpBL05qeGlWN3R4T1ZqOGUyeWU5N3hsMDNi?=
 =?utf-8?B?emYyYytnUkpIY21VT1pYOG0zL1FFR01mU3N6ZXJtSENDMHp6T3FvOTBsdlpE?=
 =?utf-8?B?UXJpSGZVazdXaWhNMkpLREdiQXVLaDYzam5YMG42V0hDMXAwNXhKSkJ6ZWdm?=
 =?utf-8?B?RzhSRGR6R2lYZmQxMTk1TEI2Q2VIK1BXaXdjdmhFaGZ2cUJST0hYK3BSOUZ1?=
 =?utf-8?B?UFZqNTJzTkJ6UmltRXpmdWs4dUIwcGVoZjZUWjdCbHNwMGlzYkJINHo0THdM?=
 =?utf-8?B?SmFYTGxvWjlXdXdXeW4zSXFRUzJuYXdZaG5KWUZ2anNDRzNmdVZiMDRMTnQy?=
 =?utf-8?B?dGREWnM4VjZPWDRDNGJlNzgwaEhIRnFmalVzZWJ2REM4ci80dmkzcm1RSExD?=
 =?utf-8?B?MjY5R1NKb014ejgxSmJmM2FYaEI0M3RFaTUrTmFUME82SHVZT1Iwb0Fqd1E5?=
 =?utf-8?B?Z3djbU51MXZ5NXM2T01la2RMV1BOWnJYcS90cFkwZHM5SEwxYklBQk5FWmlD?=
 =?utf-8?B?VTgzUE80amNFRStaYTNkYlNMYlI0aHJtRXBZZFNyd0E0ZXNPcjJVL1o0OHFv?=
 =?utf-8?B?WlJVYXZ5TWRiNElYYXdxRE4yWWo1OWRJTW9LU0RFUUJ4NVpHK2hQTjJZQUNt?=
 =?utf-8?B?QVlaNTNoTC8xWWlGaUlpUTExU2N5ZnJwYXNwdjdUMldXQjJUQWpoM3hlaHVO?=
 =?utf-8?B?d0JmQUcraHBTdzBKSGJ0YVk3OC9DYzNCeUM4MGtYS3NKRXdpYmVHMy9DRG9x?=
 =?utf-8?B?MWhtd0lJTmFqZEh2QmgxZHp2dldNR05ucVVISEhZbkRKVDhWVjd1OUxQQkdV?=
 =?utf-8?B?cVpIekRZK1ZCRVNicTlaLy9aSkQwS1ViQWZ4TnlwVVpzUi9oS0I4NElxamlz?=
 =?utf-8?B?c29EbFhFYW4rTHRGZkFQQ2xEbEM1WlJrdjhpOWhsZFZvckhOV1hyamNuYmJj?=
 =?utf-8?B?eFRzMk9RQUhjK3lyUjJNMllTN0piakQ3OFppNGpqVFZOTXQ1TWt6dTF6dHlO?=
 =?utf-8?B?R2NFTENOckpEdzE1Q2JJbG1UTi9zRjA1TzJBQklFSm9sZ3FIeXNucXlzSGJH?=
 =?utf-8?B?cTRjNUpCcGR0U1Q2ZWM5SmRqK1hudnU5SXd6VUtkeEh5UE4raENTeHNFTzd2?=
 =?utf-8?B?MEJpNGo1bGozY1RrSTJnR3o4RW5VblllUG83UE81RC9rOE4wOWpZVkxqY1o3?=
 =?utf-8?B?K0ZYYU9kNmlFaTFLTGlQQmVrb2d6WDhKTm9mT2JvaUpiWXY0bVhRN3dWT0tG?=
 =?utf-8?B?TTlIcE1uNENObTNRRFNxaTZPblMvQjZ3clBXRi9BSHlrcldITFcveEkxZ3pF?=
 =?utf-8?B?anFhZTZmTFF6QVFpaXh2dnNyL1VVTnVBZnB2Tzh0dnRGdkdlYTFlcTFWSURK?=
 =?utf-8?Q?uqRYrnXx4zUE8yfQE6RCoHwM0?=
Content-ID: <1039F0C2E06AD64B833C3255020A6084@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB8136.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6665ae6a-e9f9-4970-3c2d-08dd5659f849
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 11:37:37.3655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++c/t21ENLAcrVjLVoyemui7Njyu0MnwUTkq/khmOYDORHpL4uLxRvSaHtRp6NOKiC1I3+vpLaisORpux/y1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8260
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1961280168.1559150513"
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

--__=_Part_Boundary_006_1961280168.1559150513
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTAyLTE5IGF0IDEwOjI1ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDE5LzAyLzIwMjUgMTA6MjAsIEpheSBMaXUgd3JvdGU6
DQo+ID4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE1lZGlhVGVrIE1UODE5NiBTb0MNCj4g
DQo+IE5vLCB0aGlzIGlzIGp1c3QgYm9ndXMgY29tbWl0IG1zZy4NCj4gDQo+IFlvdSBkaWQgbm90
IHRyeSBlbm91Z2gsIGp1c3QgcGFzdGVkIHNhbWUgdXNlbGVzcyBhbmQgaW5jb3JyZWN0DQo+IG1l
c3NhZ2UNCj4gdG8gZXZlcnkgcGF0Y2guDQo+IA0KDQpoaSBLcnp5c3p0b2YgLEkgd2lsbCB0cnkg
Zml4IHRob3NlIGlzc3VlIGluIG5leHQgdmVyc2lvbg0KDQpUaGFua3MgYSBsb3QNCkpBWQ0KDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmF5IExpdSA8amF5LmxpdUBtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHRkc2hwLnlhbWwgICAg
ICB8IDUxDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayx0ZHNocC55DQo+
ID4gYW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssdGRzaHANCj4gPiAueWFtbA0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssdGRzaHANCj4gPiAueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi41ZWQ3YmRkNTNkMGUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayx0ZHNocA0KPiA+IC55YW1sDQo+IA0KPiBGaWxlbmFtZSBtYXRjaGluZyBl
eGFjdGx5IGNvbXBhdGlibGUuDQo+IA0KPiA+IEBAIC0wLDAgKzEsNTEgQEANCj4gPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4g
KyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiANCj4gPiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayx0ZHNocC55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchbnI1ejN4TVRCVWZiTmZt
emtQMlA0X2dzMGhIanY4T1hlbUg1MmlwZ3EtWU5PVzRJVkhJTWExY1lZblltWVdkYW5GRmFpZ0hU
d2xvWCQNCj4gPiArJHNjaGVtYTogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5
d01nMEFSYnchbnI1ejN4TVRCVWZiTmZtemtQMlA0X2dzMGhIanY4T1hlbUg1MmlwZ3EtWU5PVzRJ
VkhJTWExY1lZblltWVdkYW5GRmFpcldDdUpfNCQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRl
ayBkaXNwbGF5IGNsYXJpdHkgY29ycmVjdGlvbg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+
ID4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gPiArICAt
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gKw0KPiA+ICtkZXNj
cmlwdGlvbjogfA0KPiANCj4gRG8gbm90IG5lZWQgJ3wnIHVubGVzcyB5b3UgbmVlZCB0byBwcmVz
ZXJ2ZSBmb3JtYXR0aW5nLg0KPiANCj4gPiArICBNZWRpYVRlayBkaXNwbGF5IGNsYXJpdHkgY29y
cmVjdGlvbiwgbmFtZWx5IFREU0hQLCBwcm92aWRlcyBhDQo+ID4gKyAgb3BlcmF0aW9uIHVzZWQg
dG8gYWRqdXN0IHNoYXJwbmVzcyBpbiBkaXNwbGF5IHN5c3RlbS4NCj4gPiArICBURFNIUCBkZXZp
Y2Ugbm9kZSBtdXN0IGJlIHNpYmxpbmdzIHRvIHRoZSBjZW50cmFsIE1NU1lTX0NPTkZJRw0KPiA+
IG5vZGUuDQo+ID4gKyAgRm9yIGEgZGVzY3JpcHRpb24gb2YgdGhlIE1NU1lTX0NPTkZJRyBiaW5k
aW5nLCBzZWUNCj4gPiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhDQo+ID4gbWwNCj4gPiArICBmb3IgZGV0YWlscy4NCj4g
DQo+IE1pc3NpbmcgYmxhbmsgbGluZS4gRG8gbm90IGludHJvZHVjZSBvd24gc3R5bGUuDQo+IA0K
PiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBvbmVPZjoNCj4g
DQo+IERyb3AsIHVubGVzcyB0aGlzIGlzIGFscmVhZHkgZ29pbmcgdG8gZ3Jvdz8NCj4gDQo+IA0K
PiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1kaXNw
LXRkc2hwDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICtyZXF1aXJl
ZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+
ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsNCj4gDQo+IERyb3ANCj4gDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0K

--__=_Part_Boundary_006_1961280168.1559150513
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDItMTkmIzMyO2F0
JiMzMjsxMDoyNSYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUm
IzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtPbiYjMzI7MTkvMDIvMjAyNSYjMzI7MTA6MjAsJiMzMjtKYXkmIzMyO0xp
dSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO2EmIzMyO2NvbXBhdGlibGUm
IzMyO3N0cmluZyYjMzI7Zm9yJiMzMjtNZWRpYVRlayYjMzI7TVQ4MTk2JiMzMjtTb0MNCiZndDsm
IzMyOw0KJmd0OyYjMzI7Tm8sJiMzMjt0aGlzJiMzMjtpcyYjMzI7anVzdCYjMzI7Ym9ndXMmIzMy
O2NvbW1pdCYjMzI7bXNnLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtZb3UmIzMyO2RpZCYjMzI7bm90
JiMzMjt0cnkmIzMyO2Vub3VnaCwmIzMyO2p1c3QmIzMyO3Bhc3RlZCYjMzI7c2FtZSYjMzI7dXNl
bGVzcyYjMzI7YW5kJiMzMjtpbmNvcnJlY3QNCiZndDsmIzMyO21lc3NhZ2UNCiZndDsmIzMyO3Rv
JiMzMjtldmVyeSYjMzI7cGF0Y2guDQomZ3Q7JiMzMjsNCg0KaGkmIzMyO0tyenlzenRvZiYjMzI7
LEkmIzMyO3dpbGwmIzMyO3RyeSYjMzI7Zml4JiMzMjt0aG9zZSYjMzI7aXNzdWUmIzMyO2luJiMz
MjtuZXh0JiMzMjt2ZXJzaW9uDQoNClRoYW5rcyYjMzI7YSYjMzI7bG90DQpKQVkNCg0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmF5JiMz
MjtMaXUmIzMyOyZsdDtqYXkubGl1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayx0ZHNocC55YW1sJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7NTENCiZndDsm
IzMyOyZndDsmIzMyOysrKysrKysrKysrKysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzUxJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayx0ZHNocC55DQomZ3Q7JiMzMjsmZ3Q7JiMzMjthbWwNCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQNCiZndDsmIzMyOyZndDsmIzMyO2Ev
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssdGRzaHANCiZndDsmIzMyOyZndDsmIzMyOy55YW1sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LHRkc2hwDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsueWFtbA0KJmd0OyYjMzI7Jmd0OyYjMzI7bmV3JiMz
MjtmaWxlJiMzMjttb2RlJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjsw
MDAwMDAwMDAwMDAuLjVlZDdiZGQ1M2QwZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjsvZGV2
L251bGwNCiZndDsmIzMyOyZndDsmIzMyOysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayx0ZHNo
cA0KJmd0OyYjMzI7Jmd0OyYjMzI7LnlhbWwNCiZndDsmIzMyOw0KJmd0OyYjMzI7RmlsZW5hbWUm
IzMyO21hdGNoaW5nJiMzMjtleGFjdGx5JiMzMjtjb21wYXRpYmxlLg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTAsMCYjMzI7KzEsNTEmIzMyO0BADQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrIyYjMzI7U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6JiMzMjsoR1BMLTIuMC1vbmx5JiMz
MjtPUiYjMzI7QlNELTItQ2xhdXNlKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KyVZQU1MJiMzMjsxLjIN
CiZndDsmIzMyOyZndDsmIzMyOystLS0NCiZndDsmIzMyOyZndDsmIzMyOysmIzM2O2lkOiYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayx0ZHNocC55YW1s
Kl9fO0l3ISFDVFJOS0E5d01nMEFSYnchbnI1ejN4TVRCVWZiTmZtemtQMlA0X2dzMGhIanY4T1hl
bUg1MmlwZ3EtWU5PVzRJVkhJTWExY1lZblltWVdkYW5GRmFpZ0hUd2xvWCYjMzY7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrJiMzNjtzY2hlbWE6JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO2h0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW5yNXozeE1UQlVmYk5mbXprUDJQNF9nczBo
SGp2OE9YZW1INTJpcGdxLVlOT1c0SVZISU1hMWNZWW5ZbVlXZGFuRkZhaXJXQ3VKXzQmIzM2Ow0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3RpdGxlOiYjMzI7TWVkaWFU
ZWsmIzMyO2Rpc3BsYXkmIzMyO2NsYXJpdHkmIzMyO2NvcnJlY3Rpb24NCiZndDsmIzMyOyZndDsm
IzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyttYWludGFpbmVyczoNCiZndDsmIzMyOyZndDsmIzMy
OysmIzMyOyYjMzI7LSYjMzI7Q2h1bi1LdWFuZyYjMzI7SHUmIzMyOyZsdDtjaHVua3VhbmcuaHVA
a2VybmVsLm9yZyZndDsNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7UGhpbGlw
cCYjMzI7WmFiZWwmIzMyOyZsdDtwLnphYmVsQHBlbmd1dHJvbml4LmRlJmd0Ow0KJmd0OyYjMzI7
Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2Rlc2NyaXB0aW9uOiYjMzI7fA0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtEbyYjMzI7bm90JiMzMjtuZWVkJiMzMjsmIzM5O3wmIzM5OyYjMzI7dW5s
ZXNzJiMzMjt5b3UmIzMyO25lZWQmIzMyO3RvJiMzMjtwcmVzZXJ2ZSYjMzI7Zm9ybWF0dGluZy4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtNZWRpYVRlayYjMzI7ZGlz
cGxheSYjMzI7Y2xhcml0eSYjMzI7Y29ycmVjdGlvbiwmIzMyO25hbWVseSYjMzI7VERTSFAsJiMz
Mjtwcm92aWRlcyYjMzI7YQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtvcGVyYXRpb24m
IzMyO3VzZWQmIzMyO3RvJiMzMjthZGp1c3QmIzMyO3NoYXJwbmVzcyYjMzI7aW4mIzMyO2Rpc3Bs
YXkmIzMyO3N5c3RlbS4NCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7VERTSFAmIzMyO2Rl
dmljZSYjMzI7bm9kZSYjMzI7bXVzdCYjMzI7YmUmIzMyO3NpYmxpbmdzJiMzMjt0byYjMzI7dGhl
JiMzMjtjZW50cmFsJiMzMjtNTVNZU19DT05GSUcNCiZndDsmIzMyOyZndDsmIzMyO25vZGUuDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyO0ZvciYjMzI7YSYjMzI7ZGVzY3JpcHRpb24mIzMy
O29mJiMzMjt0aGUmIzMyO01NU1lTX0NPTkZJRyYjMzI7YmluZGluZywmIzMyO3NlZQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttbA0KJmd0
OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtmb3ImIzMyO2RldGFpbHMuDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO01pc3NpbmcmIzMyO2JsYW5rJiMzMjtsaW5lLiYjMzI7RG8mIzMyO25vdCYjMzI7aW50
cm9kdWNlJiMzMjtvd24mIzMyO3N0eWxlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
cHJvcGVydGllczoNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7Y29tcGF0aWJsZToNCiZn
dDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO29uZU9mOg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtEcm9wLCYjMzI7dW5sZXNzJiMzMjt0aGlzJiMzMjtpcyYjMzI7YWxyZWFkeSYjMzI7
Z29pbmcmIzMyO3RvJiMzMjtncm93JiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51bToNCiZn
dDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5Ni1kaXNwLXRkc2hwDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyO3JlZzoNCiZndDsmIzMyOyZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO21heEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtjbG9ja3M6DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjttYXhJdGVtczomIzMyOzENCiZndDsmIzMyOyZndDsm
IzMyOysNCiZndDsmIzMyOyZndDsmIzMyOytyZXF1aXJlZDoNCiZndDsmIzMyOyZndDsmIzMyOysm
IzMyOyYjMzI7LSYjMzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjst
JiMzMjtyZWcNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7Y2xvY2tzDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrYWRkaXRpb25hbFByb3BlcnRpZXM6
JiMzMjtmYWxzZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2V4YW1w
bGVzOg0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjt8DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Ryb3ANCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_006_1961280168.1559150513--

