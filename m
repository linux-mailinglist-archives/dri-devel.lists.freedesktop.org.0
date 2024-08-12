Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B294E599
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 05:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9705010E09A;
	Mon, 12 Aug 2024 03:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="b8nM9ww7";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ChRn52KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DADD10E095
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:53:23 +0000 (UTC)
X-UUID: 68356776585e11ef9a4e6796c666300c-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vtSijZdx28w1LR77QX7NeTc/m2HIIQJCRYoPU8QFlNA=; 
 b=b8nM9ww7AlXANuXpFXCOQ4t5+rSxIe7Wz8WhBdUU8AKBZdvHA5UiKvBBhUIuR0fPFHLktFzwZRK3D3ul47frd5wjiEZIknYDKN7Rl/1pGGTw1Z+ba3US23IpP1dzk8+fETFrE1WW6vus6oB1VAmAr4RZ5epHDtTaVWQkMRa7r6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:9432e4b8-091f-4059-8d8a-93067a36bcef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:f5d50a3e-6aa5-4057-84d5-0e7d47251781,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 68356776585e11ef9a4e6796c666300c-20240812
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 110174739; Mon, 12 Aug 2024 11:53:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Aug 2024 11:53:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Aug 2024 11:53:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy3Ngb05qp/P0AdW9qL3bApsNNxXWB9I0vNihbWCVpgYssh2Lg/MarmnmBO72dOya39RH3KZE7F6N9hadGhEcJsOPwGFQL+1z+ee3olspaQrWkG7MkU4xxaqFTTnBDkAGGODP6SFRNXSewXJ97RXzQik0UKvTK0tRupM7gmRIFqVVH/J2++u3xZR0fDi7dJur9YRthv5rmVFzSUmf/X5C5Kayh2mnBSDEtlBI7/t2sSPQc9PZNo2k9NGnLxabhqcopxuuoVBf3gGpvottYMWGZ0ewc4IflXhH+nCaDu8n+qmpKQx8qmHQscN7nt1UJVUAzs652kU3J6Fspbf2d//oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCxXR98gW5l0v3DbG9fu0uPaX4s97pK9kQXdSIPYSIQ=;
 b=JtHStXAxzPcP4h1cwXjbHnErrdhofYHzYEtoBEyNU4BXmlBmeprDqxRnljeaQiX9FYRaYvXhiXC471DR54Cv3lzmWKVvlopqIRrOV6GToooJXCAjH/8hcQFCnOTdAQQMMmDOoGyr46Qhzv7Jh9l8BPgZI76gCHNDuUUWINJj/eSEIufXxYQvdGh5ws3KPoPy/74E8sNh+UQLhgsAiRtCNtmhKACVq3gF1nRVSSuUaH+PVeADmjaFIj3ju+0cHIyw2+blNu25UwcxX5YQBxfpc2SeKqjzPLvG5Wdf4ll6yY9b2vUgD58jaIAF2+nT11F5YXjNqi758b83dmYekiCmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCxXR98gW5l0v3DbG9fu0uPaX4s97pK9kQXdSIPYSIQ=;
 b=ChRn52KCPMf/YHtiqmWXQaZeRnCNqwcVEvc9kT5nYo+YfD2upEEUUxaTZEw8Ffm93qlFp4CsTytSESDc21OptTE1QMdsTPiwIpnfOxSxhB706W1W7yDn++WUqSj2trRodHYbN6EswMKCXaBGDQq65B1rF6O1PPa31TFZZpNjy9w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7518.apcprd03.prod.outlook.com (2603:1096:400:419::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 03:53:15 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 03:53:15 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm/mediatek: ovl_adaptor: add missing of_node_put()
Thread-Topic: [PATCH 2/3] drm/mediatek: ovl_adaptor: add missing of_node_put()
Thread-Index: AQHaxlXZQLWuiEF5YE+OZYOLHJnSCbIjSaWA
Date: Mon, 12 Aug 2024 03:53:15 +0000
Message-ID: <f67899d2567eee74a0a8609a2330b59aab018122.camel@mediatek.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
 <20240624-mtk_disp_ovl_adaptor_scoped-v1-2-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-2-9fa1e074d881@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7518:EE_
x-ms-office365-filtering-correlation-id: 67cbe02b-545a-42ee-b61f-08dcba824bb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eFFOd1FzQWliNWFmSXRpTDBWb0FDNXhTTG5MTW9KL24zcksrYVZXeGhhSVZJ?=
 =?utf-8?B?TGkxWmxqd05QUzBPOUFORXl4YjBLdjYyOGRHVmpuVEVpS29pKzVZazJMbGRJ?=
 =?utf-8?B?RWhNTkFGVWNXcDhUTXkxQmJjNWtickNJUGh5UGlDZ2EwWkppUW1yeHU1bXJR?=
 =?utf-8?B?UlU4VVNYbjdrekoySGRLamNGVFhzUFkzTWxwTTFScmFqWGRHWDBtdEFQdzhZ?=
 =?utf-8?B?ZStPYlMyYkorNUhVV3pXVUx2dmpoZTFWNzU1Y2wrdngxWFFQcW9pWTE2OHV1?=
 =?utf-8?B?YkhJaDVJUURoeTB2dDlJZWluZXpsR2dlNVZnYWFkYzFzYXl6SVZyamcrdHpn?=
 =?utf-8?B?b0xzZ2cvY2hhTmMxSFd3SGFaSU1nR1RkU1V5U3g3SzVhc2RGYW84MmhZTXk4?=
 =?utf-8?B?SzJEbmY2ZkpnQVZvL0ljWXZsN2p6SjJ6a1lFY3FLa2JDRG1RWlRHd2pDclhF?=
 =?utf-8?B?b1hTYjVybnVTVjcrQU9oU3ZmaERzNWl3QmVGajY2M0ZkNWF1c0VVam9wRFox?=
 =?utf-8?B?d2RpUzYrNEUrTCtJckJ1bUFrdzlRS3hvYzhqODRLQ2VYRkRoOC9aWVhFUlov?=
 =?utf-8?B?cXRhQkc0MHZBV1NjYXFBYzFOY2FDV1ZTR01XMDY2L0RGb2Q1cUJldHlFU0p2?=
 =?utf-8?B?b0VMcmphSWxrYkM2YnpUdmtZRUlNVGk3VFZyc2tCdzV4eWhqRDFkVnBuamd2?=
 =?utf-8?B?WlBSdTJOYVZjSjVqV0NhZjRadFdEZHMvTWd1VVBZQmE0NlF4MjZxWTVuMWhs?=
 =?utf-8?B?a2d3U1RnZGdZNldsbHMxYXBqbVRZTXlDRStSTHhTNzBKWVlwZjdueDZ5UndY?=
 =?utf-8?B?Wk13VDdaTFJZeTlBb2gwNkFqNGxjKzNpWHNUWGVmVzRvT2lRbklrcmhoZDdB?=
 =?utf-8?B?NUdHZGd6eXVGSytNUE1JbFRFbEpNY3ZmdDUrZXJNbVQ0NzZHOW1pcUpLcW9i?=
 =?utf-8?B?cU5yMENsbEJKRE1FV3V3Uno4MXhIbjdxY2pWNTlxOGpXMkNuNmhDZjc0ZG5z?=
 =?utf-8?B?dVZNdnAra2hWcFZlTjZtVDAvaHFiVm5ZMDNmK0ZDNTY4YTRNQ1dYak9xdEds?=
 =?utf-8?B?amVSRzE0NHBwOHpnbHF2Nk5xcFVFTHFlYjdCbTBtY1gyek1uMit6ME43Y1Vq?=
 =?utf-8?B?cVEyaXdkY0FGZUFhTkhwZ0xiM3NHNXFTWHJ1SjZoSUFtcGtmOXdWUFc0RXE0?=
 =?utf-8?B?azNCcnU0T3BxYjhidjV4M3lxZXlTeWMrb2MxOTRxQlJaRy9UZndDTzNDb1Qw?=
 =?utf-8?B?dUk5OEE2aW5tbUJtcXVCSkhqMUVQMDRvYmtEem5yUmxlaHJYT0JJKzJwT3F6?=
 =?utf-8?B?Z2pPVzJSbzNyQ2FlV1dxNUlKOCsrTkNKM2RGTGhlMDBHOHM0WmsxK1V2U2JN?=
 =?utf-8?B?UE8xZExQd0dCSU14QXNiMlVxdnhmbndrdWtkWHhiYUJMd2FGbHNUVy9aRUE2?=
 =?utf-8?B?TDMrVWlTZ0tWTHl5WjU1Z1F6Z09tdmhxRzdHQWUwK0ZvQXg2bjJYekFJbE93?=
 =?utf-8?B?NjV5SE9Rc2g5WnV5RnVhYjJ2aUxVY0ZsMzlsRTd0QXRVU3JHMEpncXRIL0tx?=
 =?utf-8?B?RWo2YjYrMEIvS3hOWktQbHh2WUxYYkNjMEFRYjRZVFVjNGFnOU1McDlYVXhv?=
 =?utf-8?B?N0JXaWNmaGJDQmRaNFRZeDdmMGphUE1IMkR0Vnk3Q1hkWDcwd0xsTFRITkxY?=
 =?utf-8?B?YVcwb3JKNXJvemF1SW92Y0UwalFkQkNoekFsU2dvbkZQZWx2aS8rNWFzUE5W?=
 =?utf-8?B?RERvei9sOUJ2OEl3bmVpNDFOem1DM3kzanV0V1FaaFRacUtleXJtWVNrcGZH?=
 =?utf-8?Q?RRBetJEQsn2RhzmBdHzQdez+ANsJi7dSgTjnk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVcveSs3TlhNZFhmMXVMVXBrYTZEMEhmdTdwSThWc2NXZUpORlRPT3FRVC9n?=
 =?utf-8?B?eTl5VklpOU5hamRWaDFsUkdhWHI5Z2JwbVJpczhSOTZPTkRTSU1Bb0x1SXRZ?=
 =?utf-8?B?WnNrZGU5ZHFveHdvZjFXOTdCajZaSnQ2QUR1NUY1QWtMY3pDSkdaajRWNzQ4?=
 =?utf-8?B?RlZuL0cyQXFSdDZWK0tWbEpKNU5Oc3g0MytyQmlsRkh6dURZZVJxazBzbndy?=
 =?utf-8?B?czVKbk5RVTVzeUVVZVZQbVI2SWx1TWEveHQ0VlMwbTI2Nzk0czhOWVloU1c4?=
 =?utf-8?B?djhQL2dsUVhFQmtpMms1L1gwREdVeXdobWlueVpOZGdSSmFGOThCbnN1ZFJi?=
 =?utf-8?B?Q0ZDaHpEbGIranhycEtUVEsxdTZVa1ViM1Buam9NZkxISmM2RHczdFp5QUly?=
 =?utf-8?B?RXRhQkRlcUU1d1dmVHUzT2FGdElvY0tpVlU5bUtUUWZZcGcwZzNyRENHZE4z?=
 =?utf-8?B?V0RTZEFZdFUyNldzczB3MVhGdHJxVWJhSnFpaHUrVVUya2ptTE5lTWtaaHlN?=
 =?utf-8?B?TmdkQ0hvTldQMDRrQzNVdXhJUFByVnVmU1R3djYwY29FZ3IwME9rdkkxUHNY?=
 =?utf-8?B?OERHbFFIcWxTY3VFRkIzbTN5UktFeTlVbjBVM0c3ejZQaHhCL1poWHN1TGZQ?=
 =?utf-8?B?WEZ5ZkVhMjk0OHZSdXplWDFWR2MxSUhHbCszTThSZ2VPdGRVMGZMWEIrSU5H?=
 =?utf-8?B?dzFURTdhSXZyd2hDaVlFdzVhb21uaUovMVQrQnRZRE4yWmJEWlNSM0NNT3VN?=
 =?utf-8?B?K0l5UkFDRC95ZVNlTDNZWm9LTnZtcVFzcFFUVlBJb29VSld3SmxaM0tuYnZs?=
 =?utf-8?B?UHZBcnRIa0wwcWNGN1A0blk5emlJTnhFdUY0akpTWFcvaWFlWlVXNnRkVkZD?=
 =?utf-8?B?NUszZVJxTTZJdjBJUXB3cVNQTFRtNFJINzRNcDZMN2hjQjBKMzdLK2Y3V3py?=
 =?utf-8?B?Qnlhdm1wbWZURFNRdFJHbDNuQXlXeDlDSkJ1cW5wR214V1B1dWNhN3dQRWpi?=
 =?utf-8?B?S2NxQzcrOEdjYVpFQ0Fid0d5QmV0Zi9IbVUzaGpGSFZ0Q21OQk5IaXJSVjg2?=
 =?utf-8?B?ZGFLM0VRWm00ODR3dEZ4YnlJblh3UnNIcHJyT2xWVUJWWkdxWW0rSE5BRmdj?=
 =?utf-8?B?TjBXbHMwV1kwUkNWbndXWSs0cmZsUjl0Qk5WV1ptV3BNZ1p4bDBxSnRzMG5S?=
 =?utf-8?B?cjhFaDJXVVVEVFJMNDRUR1RKaUVld3FQdlV4WkpMdHRRenJVdHkxZ2I4SHhX?=
 =?utf-8?B?NTRGdzlxZ2l3c3hxYmZPUUs5MVQ3OXI3TjBQT2tYdHhSdEtQeVNNcnV6ajUz?=
 =?utf-8?B?ZlZWa1M0YlRFODBtbm9yaDV3VUFOblV2Vk02TFRGOS9RTThYZjlGRzl6RFI1?=
 =?utf-8?B?a1hHY0NWRnNaVWNUS1NsMzg2cHFpcDN3bVUrQkNJMnZWNTB2UWRsVkwwd0NK?=
 =?utf-8?B?ZEhhZGpJSENGVkdxSitTQm5seEh5Yzg2S1NnN282YkRoeFh1NWRWcHdNd0Y1?=
 =?utf-8?B?MERVNGRkOEFwTGlXc1g0TjlvWlBnejByazhBVkFPdUR1VUZXZyt3Q2lvbVI1?=
 =?utf-8?B?anJYa1lZNEZRdGxka3Z0Uzk0VVpzZ0ZhVWYzZGVkVlJjRGd5cVIzUnZCNFRY?=
 =?utf-8?B?K2puaTdlNlBPSlFKRlFSNzQ1RDdRdzQvOC8xSHZJZmRuMms4QmhNWmZSQVVv?=
 =?utf-8?B?Mi9nVXhHbVExQzlXOWQvc0FqZkhHRnFURSsyS3E4T21aL3REWEtNaWJqV2N6?=
 =?utf-8?B?cGdnRXViTUttdjgxT1dSQlM1L2JDNzZ1a0Y2VHROSGhTYjBUWVFPbFM1elp3?=
 =?utf-8?B?YWhLQWVVZ0lmZ0hDOGpSejBGcHphMXErUmx3V1ltMktDb1YzWmJLN09MT01N?=
 =?utf-8?B?LytDOE1PWUl4U2RXNU93c2tVa3ZVSjdTTkdIQzlCbWpYZjBPSDZnYkZwWXh0?=
 =?utf-8?B?azlKWGJCaWJhMjloblo4ZW91WmxXazdjYXJEazB2cXFPNkZQY1k4dDZOTm83?=
 =?utf-8?B?RHN1dmpCVzhkcGxLbHlFUGtiemxwaWJHYkYvQWZ1YVJ3aDM2QVUvejVEc2hi?=
 =?utf-8?B?bys1SkRvelB6M3BKeGxRZDRCWmNFWHNLTFJCNUcyS3JiS2lXcmpJSS9Zc3pQ?=
 =?utf-8?Q?kv7g1ej0qmhGWr64qVBRaOZnf?=
Content-ID: <3A3EB4D1F645A144905764E8D999B465@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cbe02b-545a-42ee-b61f-08dcba824bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 03:53:15.7693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKb24aAyXMcJUicxA/3yAF7ShQ8EPBLc0gcFSkh7GNClGN0ztDIznvVOD/UjiSarxtI22jYaf8Q2SsbdOrD17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7518
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1736835030.2137106624"
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

--__=_Part_Boundary_007_1736835030.2137106624
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphdmllcjoNCg0KT24gTW9uLCAyMDI0LTA2LTI0IGF0IDE4OjQzICswMjAwLCBKYXZpZXIg
Q2FycmFzY28gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgRXJyb3IgcGF0aHMgdGhhdCBleGl0IGZvcl9l
YWNoX2NoaWxkX29mX25vZGUoKSBuZWVkIHRvIGNhbGwNCj4gb2Zfbm9kZV9wdXQoKSB0byBkZWNl
cmVtZW50IHRoZSBjaGlsZCByZWZjb3VudCBhbmQgYXZvaWQgbWVtb3J5IGxlYWtzLg0KPiANCj4g
QWRkIHRoZSBtaXNzaW5nIG9mX25vZGVfcHV0KCkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBG
aXhlczogNDUzYzMzNjQ2MzJhICgiZHJtL21lZGlhdGVrOiBBZGQgb3ZsX2FkYXB0b3Igc3VwcG9y
dCBmb3IgTVQ4MTk1IikNCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIENhcnJhc2NvIDxqYXZpZXIu
Y2FycmFzY28uY3J1ekBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bF9hZGFwdG9yLmMgfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+IGluZGV4IDE0MTg5OTIzMTFjNC4u
M2ZhZjI2YTU1ZTc3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiBAQCAtNTIyLDggKzUyMiwxMCBAQCBzdGF0aWMgaW50IG92
bF9hZGFwdG9yX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjb21wb25lbnRf
bWF0Y2ggKiptYQ0KPiAgfQ0KPiAgDQo+ICBjb21wX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9u
b2RlKG5vZGUpOw0KPiAtaWYgKCFjb21wX3BkZXYpDQo+ICtpZiAoIWNvbXBfcGRldikgew0KPiAr
b2Zfbm9kZV9wdXQobm9kZSk7DQo+ICByZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gK30NCj4gIA0K
PiAgcHJpdi0+b3ZsX2FkYXB0b3JfY29tcFtpZF0gPSAmY29tcF9wZGV2LT5kZXY7DQo+ICANCj4g
DQo+IC0tIA0KPiAyLjQwLjENCj4gDQo+IA0K

--__=_Part_Boundary_007_1736835030.2137106624
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXZpZXI6DQoNCk9uJiMzMjtNb24sJiMz
MjsyMDI0LTA2LTI0JiMzMjthdCYjMzI7MTg6NDMmIzMyOyswMjAwLCYjMzI7SmF2aWVyJiMzMjtD
YXJyYXNjbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5h
bCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMy
O2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3Um
IzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYj
MzI7Y29udGVudC4NCiZndDsmIzMyOyYjMzI7RXJyb3ImIzMyO3BhdGhzJiMzMjt0aGF0JiMzMjtl
eGl0JiMzMjtmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkmIzMyO25lZWQmIzMyO3RvJiMzMjtjYWxs
DQomZ3Q7JiMzMjtvZl9ub2RlX3B1dCgpJiMzMjt0byYjMzI7ZGVjZXJlbWVudCYjMzI7dGhlJiMz
MjtjaGlsZCYjMzI7cmVmY291bnQmIzMyO2FuZCYjMzI7YXZvaWQmIzMyO21lbW9yeSYjMzI7bGVh
a3MuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0FkZCYjMzI7dGhlJiMzMjttaXNzaW5nJiMzMjtvZl9u
b2RlX3B1dCgpLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1l
ZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtDYzomIzMyO3N0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcNCiZndDsmIzMyO0ZpeGVzOiYjMzI7NDUzYzMzNjQ2MzJhJiMzMjsoJnF1b3Q7
ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtvdmxfYWRhcHRvciYjMzI7c3VwcG9ydCYjMzI7Zm9y
JiMzMjtNVDgxOTUmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmF2aWVyJiMz
MjtDYXJyYXNjbyYjMzI7Jmx0O2phdmllci5jYXJyYXNjby5jcnV6QGdtYWlsLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsX2FkYXB0b3IuYyYjMzI7fCYjMzI7NCYjMzI7KysrLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2Rl
bGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jJiMzMjtiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtpbmRleCYj
MzI7MTQxODk5MjMxMWM0Li4zZmFmMjZhNTVlNzcmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMz
MjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7
JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFw
dG9yLmMNCiZndDsmIzMyO0BAJiMzMjstNTIyLDgmIzMyOys1MjIsMTAmIzMyO0BAJiMzMjtzdGF0
aWMmIzMyO2ludCYjMzI7b3ZsX2FkYXB0b3JfY29tcF9pbml0KHN0cnVjdCYjMzI7ZGV2aWNlJiMz
MjsqZGV2LCYjMzI7c3RydWN0JiMzMjtjb21wb25lbnRfbWF0Y2gmIzMyOyoqbWENCiZndDsmIzMy
OyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7Y29tcF9wZGV2JiMzMjs9JiMz
MjtvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOw0KJmd0OyYjMzI7LWlmJiMzMjsoIWNvbXBf
cGRldikNCiZndDsmIzMyOytpZiYjMzI7KCFjb21wX3BkZXYpJiMzMjt7DQomZ3Q7JiMzMjsrb2Zf
bm9kZV9wdXQobm9kZSk7DQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7LUVQUk9CRV9ERUZFUjsN
CiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtwcml2LSZndDtvdmxf
YWRhcHRvcl9jb21wW2lkXSYjMzI7PSYjMzI7JmFtcDtjb21wX3BkZXYtJmd0O2RldjsNCiZndDsm
IzMyOyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tJiMzMjsNCiZndDsmIzMyOzIuNDAuMQ0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1736835030.2137106624--

