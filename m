Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F8AF6AC8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 08:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD7610E7C7;
	Thu,  3 Jul 2025 06:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DmCIrY7F";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HJ4zvweD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6827E10E7C7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 06:52:18 +0000 (UTC)
X-UUID: 39aec92a57da11f0b1510d84776b8c0b-20250703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rjYghOgEfyqvcpZ5whRGDyAqd7X5cjPgHfIaDzVQ/XI=; 
 b=DmCIrY7FZSvoEaw+uzqEDNx3Os+AKgSSsW7uU7rMJX6PXIPqMyN74gusJoHtXq97bfKsjE72GIfYXT5bcbcpnHIxJZmZ9nIdvTr9ZoSv9KXx0GUjAvF2gcJC4OKkFtmrNyDHziSnlE/mZyic+PFlt91QWUs4lPRB6E16p1C+dFk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:b66fc562-fc79-4dae-9f57-fb042a02d4f2, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:d53de75f-2aa0-4c76-8faa-804d844c7164,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39aec92a57da11f0b1510d84776b8c0b-20250703
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 713253218; Thu, 03 Jul 2025 14:52:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Jul 2025 14:51:55 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Jul 2025 14:51:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSBY6JKNICxAP+kJ/RBRin2Qj2rYDZ8Nwu7iAV1ryxNXoilSmOBoAmj9GCNBR0Z0o99ogi5Tp8pbBFNiZsuu3Lb0r3ByPiIIY6tEX3MRXIjUhvykrHQNhpX7WtVX2WKOCgJIiSktU1MY43ong96RnVTuLnhpFaWooQT4DwCiJVhb0ds02n/FClYznRAJn5CuMSKz/wouaoy7D9oxfuqLZeVJ7GyU8Bsq/ezFUPt3KTtSDmZuIhhHV3WGQxFLkBpyf2gwMSGt7QNICk4nfpReXwera3d8azKZz1rQegtIx0PkerZs1NEx6cdD/5fDvV3bP/BB6MGWe5ONuKxTTN9YMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwunKvz2TOUT1Lhx3Ui0cVZrNR+rXqImhceSX6MpMuo=;
 b=VezkmohT3dwjHfL+h5k+79RA6mDhUs8jq+axxxbBjv+G9RLWu3VkgcdWbm5MZrpHN3g4812Wtr1TvAK6umpLq5OafMVPLZAWJX7B5xA4bpfzjayAD7Pbxm+oHkp5dZlraw/Uc17I14sswjzmI0MTqQLp9vqV4ropRSVac3tbaCSwc3Kd3RTsVzPf4M9SoqSvEZsmo551KrZnlTCNyO+vs3JF0Sh6uMKcgmBxmNwSAEAnoW8wU8GXkeF53V5LFLsplETItSMee1j0cPqdHrvoP3n+UHDkfv/dQCNvGQHG+m7Aivo65t2PSfZTzJitoGuglLEMylk5BC3LNbmq12EIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwunKvz2TOUT1Lhx3Ui0cVZrNR+rXqImhceSX6MpMuo=;
 b=HJ4zvweD8B24G/7czj98U6FjfIIasSkaqYOC3czTv9JIdskHGle07QjjdSN3SOWTTXa3kS0Aqa7jdT1VXtFOlzYbxauxZg5Qj1fIeS29gWGRveXteetq54LmyXcp1LQ/L7SYt5+VW9ejLmkXj621qGjnSTSLEK4A2UhhDBT9EN4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SE2PPF543967443.apcprd03.prod.outlook.com (2603:1096:108:1::498)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 3 Jul
 2025 06:51:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 06:51:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "a-bhatia1@ti.com"
 <a-bhatia1@ti.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Louis-Alexis Eyraud
 <louisalexis.eyraud@collabora.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tomi.valkeinen@ideasonboard.com"
 <tomi.valkeinen@ideasonboard.com>, "lumag@kernel.org" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
 <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
Thread-Topic: [PATCH] drm/mediatek: dsi: Fix DSI host and panel bridge
 pre-enable order
Thread-Index: AQHb6lowDwL+Oq7N+E6xEvzKycJpV7Qf+QKA
Date: Thu, 3 Jul 2025 06:51:10 +0000
Message-ID: <7de3ce656c7fd2f53948abc862a222719b7bce0f.camel@mediatek.com>
References: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
In-Reply-To: <20250701-mediatek-drm-fix-dsi-panel-init-v1-1-7af4adb9fdeb@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SE2PPF543967443:EE_
x-ms-office365-filtering-correlation-id: 93c40590-13ea-45d9-533a-08ddb9fdff18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|42112799006|376014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MllsbEdZMDh1T3M0M0llc3pJUkhKTnVHUzAzVlBDOFhhS3NmalByWWdraUpO?=
 =?utf-8?B?VG9rZXF0UUJLMGl4N3g3NWpBM2svWTJ0T3hWZDZNVDNubitod2pHSlNZVEx1?=
 =?utf-8?B?MlVUVWlzaWhGWkhuTjhydjM5ZkVtYTFxMmFJMkJ6WWxlNTRiVXJJbjhMM2hv?=
 =?utf-8?B?WHhCTzBma2w2OVlBVWFIVmRzUnlxT0FnRjJpczczTUZrY1Yrd3RYTFlqODI3?=
 =?utf-8?B?YThzZ0tpZk1mcnVJaUZJbHg5b2hwSzdnYXpXWHRENk9GQkc5WXJrYzZrcDBV?=
 =?utf-8?B?QWJ2dTJkNnZ4QXNwWHNNUStmZUtYa0FQQytiTTlHc21WY2R1d3FSMEFiamJM?=
 =?utf-8?B?UDJaNS9UMkJrT2haRFZYYWhRL0l2RXJKMTNTc2hUOWc4eGZvcTFmWjhNcG1Y?=
 =?utf-8?B?TTRMTVREY0hnMEw5SnVjNVo3bjlKUGZvU28xMFdUK0FJTlJTOUdkd294eFlV?=
 =?utf-8?B?bkZuS3NHTjZUaW5MYk9CdEJKQldGN1RaT2UrVzFESWR1UEdRWkE3NFBiT1p5?=
 =?utf-8?B?TDZBeHJQcmZqY2s0TjluOWROdzdKT1FnYVhDTEZRbmtWNTFJYnhzN1dYNlBC?=
 =?utf-8?B?c1ZzMXFqKzljR1NrMzRuZFg4ZHQvdjl5c3RkRWMwVkZRZzl1QlVRZVp4alRX?=
 =?utf-8?B?dXVvNUxEK1pzZ3FCWXo5THNTcnRaaE8wbTJiKzh3eTNmRnFTdEdaMGlVZ1Fs?=
 =?utf-8?B?WlU2MkpHbnViYVN2ZnRvRGlwUlN2cWFrRDIrbDFLaW1uZDNCalB4bTVtVzM3?=
 =?utf-8?B?RTVUSnYyajhlVVl2UzRtTVVKZ3BTT3duekdOR2FFd2k5ZVcyQ3RZOUc5QVFM?=
 =?utf-8?B?c2FMcjhRMVhlZ1N5N0hmVTJEMTRrcE1NT3ZyK1llV0tGR1pZdWZxZzZhY2JV?=
 =?utf-8?B?UFlaRXA0ejRoYnp3WFdSUTZsSDUrbEJjY01MYlBSeDJqUllwWW90Ymc4SkQ4?=
 =?utf-8?B?SWVZTlRiczRyMGg2M3dJVWVhcFRPeFJsTWs4R0JRU2g0MFdjQWpjZVNWaTkr?=
 =?utf-8?B?WmhzbUhqRTk4bHBEc0JkSzRmbWIwbFIvQnpHWFE0M0M4TFJDYy9TaG1kbmY4?=
 =?utf-8?B?QnhqYWRhNGVQbm5RMDAxaTVtbDNhVGJBeUdTMTlSWmh2aUFacktSRDhUVFcw?=
 =?utf-8?B?cmhkSEt4MEF6OVhDaWVWajJNM0F1TjFWZEtzcXFGYm9UdXEwc0VISXdab1Z1?=
 =?utf-8?B?UFVOTmtUYlVFUzdzdVhPRzcwVlJJYXNYMXRyR2hJRXZlYTlIbkFuYy85UkE5?=
 =?utf-8?B?Q1Z6aTIzblQrRC9pZVRMZEpqdUZ3cGdHbzdUVmZqTTF1Zks1ZXYrcUdITEZB?=
 =?utf-8?B?b28ySkUzU1g2SjZtc2xmWGIwVFpXUGF3M2JyK24zWWtEbGRSUDRDY01ZLy81?=
 =?utf-8?B?U3hQU3dHbHZIQjA4WFlsSEFnSUtpeDdrVlk0U3dKQzdIMDZ5cDB0ZS9PNmIz?=
 =?utf-8?B?RHlYdlZnUHFvNXIrM1pvbm9QZzg0SkdDVktwY2p3L25xV3daVU14QUxvZk9N?=
 =?utf-8?B?VUtYWVRaWXBaRC82WTZ5eHVrZFdYOS9HNHVXOTFQMW02aEg2ZnF3djN4WHd3?=
 =?utf-8?B?ZWNObmdVRjk0Zmljd0ZjZGJ0VTRkSmlqVDFoUkFVZ2w1c081MFV6Mk02dkt5?=
 =?utf-8?B?a05wVFNxK1RHeXAxYUNudGxhZ0tFcnRrNmZnOXpzUmtqNzNGajhTTThWWHlV?=
 =?utf-8?B?UG1rbTR0WG9RREczK0NnUjcvUE01Ky9KbU5PYXVpK3JmdjZ0V3dqQk5DdElh?=
 =?utf-8?B?byt4Y1NCdUdjZVFpZzJMQUtPbmpwdlJRUmF0ZlNDR21mZEtXM2dibVhaL0F1?=
 =?utf-8?B?WER2OVlYNU44Ym9FSjR6MG5oeExTN1Uzcmc1WkVjRDg2dGxyNWxaRENpNUMr?=
 =?utf-8?B?WGFDeUN6SG5SRVhWWlY1NnUweVFFK0NlVUhGR3A0QWdlYU81K1hRS0l0T2Jz?=
 =?utf-8?B?UzNvMUpBejhRZ2xSUmIxSkFibVRQNmlzbXhEaitYNVNPak5ORjRGbHNibzVR?=
 =?utf-8?Q?RQEbXSiONEZUC8CUB2XcTfeSBJ2Slo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(42112799006)(376014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZC9LZXRrb2t5dk9lYUltc0xlNXZsaFozNGFNNnlvU1lXUVcwMVFUNWpPMUIr?=
 =?utf-8?B?WkUrRjc2aE5pZUo2NGsxeWJSb1g3Nm0yUlVNKzdtZWZ4RzgrZy9QT3dUSWwz?=
 =?utf-8?B?eHh2R3pLY2NtSElOTFQ1RHdXSjdhYXdDVkNuTzZLVC9jRUp4NlJwVjBOWjg5?=
 =?utf-8?B?L2ZiQkZvb1JSY1FBZEt4Lzh2Wk5GT3FFRzVhY3R1NHh4V3VNNlYyLzYwd3ox?=
 =?utf-8?B?NlplRW9oSWEySStLZ2JjL09PVUhnNTVGTjQ1T1h4S05Db2JFVGYwQ21UaUFU?=
 =?utf-8?B?TW9SRjJ6N1VBUWNUR2U4a3JmL3FXQVlvVUhLalRtRjFwYzhpMThFekpGcHJC?=
 =?utf-8?B?YnZkVUt6RGphOWtTamp3S3FpODgzaEk1eUhMNi9INng3TFpocld3alI1OUsx?=
 =?utf-8?B?WEhLaXhtNTV6UVJSUnAzZWdRQmIwUUJQazYvUEY5YkxxRkpoWFhFQ2g1cUY0?=
 =?utf-8?B?QlU5Q0ZKZzE4c0M4c0Vyb0pRUnQ1UTQ3Z1pZRlU1ayt0RXFSSlRUNU43cmJW?=
 =?utf-8?B?bW94VnNRTFhvSHFqYmNZdHN3VDY0NGlSMERQOUZubDU5TTl1c002aHY3RkJO?=
 =?utf-8?B?WmhnTVI2T2FyemtkVVJadksyL2tuL2J0RnBwTi82YUFNMjRnWmowcHE2NkZr?=
 =?utf-8?B?RlpTU2prU1pLSW5NeDh6ZlJjZkxWa1NIVG9OcXUwam4vTDBKRk83RDhWK0xM?=
 =?utf-8?B?UUNKckozN3BwMnh1NVZjTmpWZ2c5ZE9xY0xWZEdBaFFsVjIrblN3YTN3UDFJ?=
 =?utf-8?B?eVhLWGYvSFFyN251d2h3eU1hbDJyRm5zVzRqb0llcWEzKzNKN3YyMCtYeUV3?=
 =?utf-8?B?aGRxTnpoSlNWbjJxVEx2bVk5dkdaUXdBcFM0VlZrRnUrTGZPeERIb2p6QXJJ?=
 =?utf-8?B?VVp2SldJM1VmR3hQdTlXYWE3UElVWGNzRnd0TDdUNmdrR3FNQTNoamRBbkNt?=
 =?utf-8?B?dEJoKzRnWEsrRUdMTXl6M3dpRWR0K0hYak03N0NjTnJrY2FreGtFMVVwZTZ2?=
 =?utf-8?B?T0R1T1FxMlJlWUFXTng0dVMyc28wZ2dobjJjT2RqcUNvUGNqY08wbTlLRExX?=
 =?utf-8?B?dGpMVGZYRkd4Z3c3QzdwVGUzRCtITFFLSTBhZWdJUHVpT25KVWswTERaKzJk?=
 =?utf-8?B?b3lLTnI2OFNQWi82R3BHMkFvRk4wSzhRVkhoVm1FdXppMksrd0hPL1lXWTY3?=
 =?utf-8?B?UXVoVVpOMmtWR2tra05ObnNScEVSZzFxSzZaTUd1ZVFtVjdnVzM1VlNhMUph?=
 =?utf-8?B?c2JJSXVCeWtGNlNpM2VqSmQ5U0lkL2xZTTdSNkNVcHpaYU9POTJPcDZPNWpK?=
 =?utf-8?B?YWdQV3NxUGtWM1lxTGJ4Qm05dFl3dXFacGJoN0FOenZoTHRmTHNCS1JwTm01?=
 =?utf-8?B?U1NYK1VjbFByQlkvTTc0TUxhZ1dPK1hTNFRQOWFrVkgvVFpEcWJKSzlmU3ZW?=
 =?utf-8?B?VTNOMitVaCtBaFluSis2THhrcFBoQ2Q1TjNKMWdpV3JCZldSTWVwUm1DL2hK?=
 =?utf-8?B?UGdLb3VXeUxuR0N3emd1NTZnL2VOSzl3d3ZHNlhYUWVVempjR3Z2KzRqRXFY?=
 =?utf-8?B?bjVTV3dxQldITG5FdjI2L0oxRnBBMjFrSlBBVW9Kb3p4aE8wU1AweXFXUUhj?=
 =?utf-8?B?Z2MxeVp0N2JPUlk1SmpuOXNCNHdBWUl1dFJiMHVPZnBsMEc0NUtUNDJaelVo?=
 =?utf-8?B?a2xBc0FtWk9KK2srTVFMRzZrSSs0d3o3ZFJqQ09wQ2FGWWZ5R1dkZXRhaE9W?=
 =?utf-8?B?enYwZytRbU1ZRURmaFZVVjNFR2ZPWmZzNXoxM2Q2OXM2a1plS25jaDIwdVA5?=
 =?utf-8?B?czJkeWkxRlo0R0J2OFMwcGE3bnJDVEM0Vnd5VzZpZkozY0s3TWFFRWQranR3?=
 =?utf-8?B?REwzcDhvcXhVTFVhWG9nL2NUWlY3T1dHRmphZW1lWld2U0pORTc4ZENOcGEy?=
 =?utf-8?B?TDdZVzFqbDlYTXk0Wm1TV2Q4VU9EYXZZeUtXL0lrbm1lZU4rNnNYdSttWXB6?=
 =?utf-8?B?Wm9pN0oyZnkvdzB5bzBIN3FGRmxoVFJQR1RLRjRsRTRudW5oalhSSVpZeFBT?=
 =?utf-8?B?N2pwNHpUYWRkT1cxbTlzTStHTTI1TVNmQko3ZzZRZ0twUVFMQWtOWHhiejkv?=
 =?utf-8?Q?UDtqYciLC26VIhzVbKiEd6QnH?=
Content-ID: <B17471BD1A86E445A141863C3A50ACD2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c40590-13ea-45d9-533a-08ddb9fdff18
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 06:51:11.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AW5o15KLjrddBE34hOkazcjQgjwEfgyfy5ckvfCgy1m/vftCrfc1dLS79UsVvUCGs4uLPDNmRTDRhWxHZjHMMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF543967443
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_481586589.68108269"
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

--__=_Part_Boundary_009_481586589.68108269
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTA3LTAxIGF0IDA5OjMwICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IFNpbmNlIGNvbW1pdCBjOWIxMTUwYTY4ZDkgKCJkcm0vYXRvbWlj
LWhlbHBlcjogUmUtb3JkZXIgYnJpZGdlIGNoYWluDQo+IHByZS1lbmFibGUgYW5kIHBvc3QtZGlz
YWJsZSIpLCB0aGUgYnJpZGdlIHByZV9lbmFibGUgY2FsbGJhY2tzIGFyZSBub3cNCj4gY2FsbGVk
IGJlZm9yZSBjcnRjIGVuYWJsZSwgYW5kIHRoZSBicmlkZ2UgcG9zdF9kaXNhYmxlIGNhbGxiYWNr
cyBhZnRlcg0KPiB0aGUgY3J0YyBkaXNhYmxlLg0KPiBJbiB0aGUgbWVkaWF0ZWstZHJtIGRyaXZl
ciwgdGhpcyBjaGFuZ2UgbGVhZHMgdG8gdHJhbnNmZXIgZXJyb3JzIG9uDQo+IG10a19kc2lfaG9z
dF90cmFuc2ZlciBjYWxsYmFjayBwcm9jZXNzaW5nIGR1cmluZyB0aGUgcGFuZWwgYnJpZGdlDQo+
IHByZS1lbmFibGUgc2VxdWVuY2UgYmVjYXVzZSB0aGUgRFNJIGhvc3QgYnJpZGdlIHByZV9lbmFi
bGUgYW5kIENSVEMNCj4gZW5hYmxlIHNlcXVlbmNlcywgdGhhdCBhcmUgZW5hYmxpbmcgdGhlIHJl
cXVpcmVkIGNsb2NrcyBhbmQgUEhZIHVzaW5nDQo+IG10a19kc2lfcG93ZXJvbiBmdW5jdGlvbiwg
YXJlIGNhbGxlZCBhZnRlci4NCj4gDQo+IFNvLCBpbiBvcmRlciB0byBmaXggdGhpcyBjYWxsIG9y
ZGVyIGlzc3VlLCByZXF1ZXN0IHRoZSBEU0kgaG9zdCBicmlkZ2UNCj4gYmUgcHJlLWVuYWJsZWQg
YmVmb3JlIHBhbmVsIGJyaWRnZSBieSBzZXR0aW5nIHByZV9lbmFibGVfcHJldl9maXJzdA0KPiBm
bGFnIG9uIERTSSBkZXZpY2UgYnJpZGdlIGluIHRoZSBtdGtfZHNpX2hvc3RfYXR0YWNoIGZ1bmN0
aW9uLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4g
Rml4ZXM6IGM5YjExNTBhNjhkOSAoImRybS9hdG9taWMtaGVscGVyOiBSZS1vcmRlciBicmlkZ2Ug
Y2hhaW4gcHJlLWVuYWJsZSBhbmQgcG9zdC1kaXNhYmxlIikNCj4gU2lnbmVkLW9mZi1ieTogTG91
aXMtQWxleGlzIEV5cmF1ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0t
LQ0KPiANCg0K

--__=_Part_Boundary_009_481586589.68108269
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDctMDEmIzMyO2F0
JiMzMjswOTozMCYjMzI7KzAyMDAsJiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3Nl
bmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtTaW5jZSYjMzI7Y29tbWl0JiMzMjtjOWIxMTUwYTY4ZDkmIzMyOygmcXVvdDtkcm0v
YXRvbWljLWhlbHBlcjomIzMyO1JlLW9yZGVyJiMzMjticmlkZ2UmIzMyO2NoYWluDQomZ3Q7JiMz
MjtwcmUtZW5hYmxlJiMzMjthbmQmIzMyO3Bvc3QtZGlzYWJsZSZxdW90OyksJiMzMjt0aGUmIzMy
O2JyaWRnZSYjMzI7cHJlX2VuYWJsZSYjMzI7Y2FsbGJhY2tzJiMzMjthcmUmIzMyO25vdw0KJmd0
OyYjMzI7Y2FsbGVkJiMzMjtiZWZvcmUmIzMyO2NydGMmIzMyO2VuYWJsZSwmIzMyO2FuZCYjMzI7
dGhlJiMzMjticmlkZ2UmIzMyO3Bvc3RfZGlzYWJsZSYjMzI7Y2FsbGJhY2tzJiMzMjthZnRlcg0K
Jmd0OyYjMzI7dGhlJiMzMjtjcnRjJiMzMjtkaXNhYmxlLg0KJmd0OyYjMzI7SW4mIzMyO3RoZSYj
MzI7bWVkaWF0ZWstZHJtJiMzMjtkcml2ZXIsJiMzMjt0aGlzJiMzMjtjaGFuZ2UmIzMyO2xlYWRz
JiMzMjt0byYjMzI7dHJhbnNmZXImIzMyO2Vycm9ycyYjMzI7b24NCiZndDsmIzMyO210a19kc2lf
aG9zdF90cmFuc2ZlciYjMzI7Y2FsbGJhY2smIzMyO3Byb2Nlc3NpbmcmIzMyO2R1cmluZyYjMzI7
dGhlJiMzMjtwYW5lbCYjMzI7YnJpZGdlDQomZ3Q7JiMzMjtwcmUtZW5hYmxlJiMzMjtzZXF1ZW5j
ZSYjMzI7YmVjYXVzZSYjMzI7dGhlJiMzMjtEU0kmIzMyO2hvc3QmIzMyO2JyaWRnZSYjMzI7cHJl
X2VuYWJsZSYjMzI7YW5kJiMzMjtDUlRDDQomZ3Q7JiMzMjtlbmFibGUmIzMyO3NlcXVlbmNlcywm
IzMyO3RoYXQmIzMyO2FyZSYjMzI7ZW5hYmxpbmcmIzMyO3RoZSYjMzI7cmVxdWlyZWQmIzMyO2Ns
b2NrcyYjMzI7YW5kJiMzMjtQSFkmIzMyO3VzaW5nDQomZ3Q7JiMzMjttdGtfZHNpX3Bvd2Vyb24m
IzMyO2Z1bmN0aW9uLCYjMzI7YXJlJiMzMjtjYWxsZWQmIzMyO2FmdGVyLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtTbywmIzMyO2luJiMzMjtvcmRlciYjMzI7dG8mIzMyO2ZpeCYjMzI7dGhpcyYjMzI7
Y2FsbCYjMzI7b3JkZXImIzMyO2lzc3VlLCYjMzI7cmVxdWVzdCYjMzI7dGhlJiMzMjtEU0kmIzMy
O2hvc3QmIzMyO2JyaWRnZQ0KJmd0OyYjMzI7YmUmIzMyO3ByZS1lbmFibGVkJiMzMjtiZWZvcmUm
IzMyO3BhbmVsJiMzMjticmlkZ2UmIzMyO2J5JiMzMjtzZXR0aW5nJiMzMjtwcmVfZW5hYmxlX3By
ZXZfZmlyc3QNCiZndDsmIzMyO2ZsYWcmIzMyO29uJiMzMjtEU0kmIzMyO2RldmljZSYjMzI7YnJp
ZGdlJiMzMjtpbiYjMzI7dGhlJiMzMjttdGtfZHNpX2hvc3RfYXR0YWNoJiMzMjtmdW5jdGlvbi4N
Cg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20m
Z3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4ZXM6JiMzMjtjOWIxMTUwYTY4ZDkmIzMyOygm
cXVvdDtkcm0vYXRvbWljLWhlbHBlcjomIzMyO1JlLW9yZGVyJiMzMjticmlkZ2UmIzMyO2NoYWlu
JiMzMjtwcmUtZW5hYmxlJiMzMjthbmQmIzMyO3Bvc3QtZGlzYWJsZSZxdW90OykNCiZndDsmIzMy
O1NpZ25lZC1vZmYtYnk6JiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7Jmx0O2xvdWlz
YWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsN
Cg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioq
KioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwg
bWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFs
LCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNj
bG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252
ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2Vt
aW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1
bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBv
ciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_481586589.68108269--

