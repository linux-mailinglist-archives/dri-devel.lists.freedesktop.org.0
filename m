Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E600F93367A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 07:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A16410E124;
	Wed, 17 Jul 2024 05:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eFxQrGpv";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ulYTK81i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63110E124
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 05:58:22 +0000 (UTC)
X-UUID: 8e32951e440111efb5b96b43b535fdb4-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=R61cLTahOu4I0HAZlzDE/aJCqrrnkH+Ar6yC+Rb9h7k=; 
 b=eFxQrGpvVYNBP/ssLczFR6g4Qfnfnhg0xZBgKTIkyYKOy0RLVEkrJ+hYKaGVDVAPWK9f6Xcd4vl7Ckc5OEDBoDThvABRtZD9dSpVdrcR8lk/iKXiklix26HgyTYzmlYhrclcLe7fmBnm/GXTKrMWY/FEs8Wx+RxGoCettWDfAmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:be393bd3-ce47-40ea-b9e5-a448f6349cd5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:fee66445-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8e32951e440111efb5b96b43b535fdb4-20240717
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1576223404; Wed, 17 Jul 2024 13:58:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 13:58:12 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 13:58:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLEpreSXcDVjHFNlkSw1YoOXsCxvMzKmruZFHuy0bo5hmnap7m3/291b7BvQB4d8wKtX6IBQjDddBnscKr1idTeP60Gbm1jZloOdrhN3RqicVNKPavRINyvTTpqegu7epD64EgqIjGfkD1zMscWQb/Q/mVCPg6PGujNSKwtCp4ftfk+NTFX5x7FdeUpj0ck8pGRC2fBtzQHpbJq1mLFMNm4kKM1mjjJ3rMItXuNRnc7n5SMKggjqWl0JEj0ZRdtCICJbbbsjbS4euFIWTOzSwqcEn/YPPYBoiNHCojUP8prx8thfWQl5vMczQLUE/8IDrKZNyTqhXMmFbFU7SZyuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=;
 b=dqfIp5aS3VAEivzKGNqI9chWBwPwhSAETnqe9FQAwyKIVwfOsbM+aSIndidQ2hkawPT3EZQYk/z/upIPIZO7/iPntH3t5GEoHxSlkyCrTVfRPSobRie7hJiiCi2qFOSOqBsDlMfFrA49lEyoyjCD4odHPKqnylxYoTIh3Dz8yzHkEHyFzsR8mwIL6RPg/eYXZUkMiX89ezrx1LFApa5q/sbilRcdEFQFeismAtiizgR6apUDfnwj/06978BlB8ZYJRMqQUOhTR8X/QdFTzyKgCldnLRrrge4I3Nz22HSbLz/MYhu7Jjrkq2RqasQo2zKUdH0rF3h9G2iF4ur6HdSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtlmabXVCyjfBvPEP7dbj/DCD68Jl9klh3Y0gD3AOHA=;
 b=ulYTK81iGc1+BYNyJf9KTizJdjPevO8bVqJ6USwDfD2kUMW6K7R3/p29ZEJuWGELNUE7r03JGPy7kf2v6yN1Z0Y+47kSbURmVVq5517vtj/lSdUtI4MQbA8WZ7qy89EL7/6RDvK0LE3jLsLFYQqJqxmr3OhFUHzEznqjLv+I9ls=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8799.apcprd03.prod.outlook.com (2603:1096:820:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 05:58:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 05:58:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v4 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Topic: [PATCH v4 2/5] drm/mediatek: Support "None" blending in Mixer
Thread-Index: AQHa2Am3A02oj/oD7Eajzek/9/n6PbH6bIcA
Date: Wed, 17 Jul 2024 05:58:10 +0000
Message-ID: <6d2300bbe467a929dc3cb8017464c4a069b3b8a1.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <20240717-alpha-blending-v4-2-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-2-4b1c806c0749@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8799:EE_
x-ms-office365-filtering-correlation-id: aa273155-7611-4b44-bee9-08dca6257038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RUwxdGlNM1ZyY252S083K0hndUFrbG4rWWdSYitXZEFsKzh2ZnNLUU9KRHZq?=
 =?utf-8?B?VHRxQkZWZmt4VUZxSFRxdXpDQ2t2eUZwMlJXTUdIemgxRDZZWEpRd1JKdlhM?=
 =?utf-8?B?cFg5ZUUwNndoNytvSllxR0J6d3JnalB1L2xZM1NWdStKL0hseGRSK2RIWFZT?=
 =?utf-8?B?VnJuVDBkQXlSNENRci9ibjBGZ08zZ1FGUStEMTlKbC80OWhRYm5jNEptbVVR?=
 =?utf-8?B?eFpqYjJKMDVRcUhXOGFtcExjYmMzS0U0aE43N2x1NDk0TXN0MDU3S0VEREkw?=
 =?utf-8?B?NTRVSTZWUDNkVW1oMmdldzdwbVhWZmZzalFGSFBEM2R5bmZpb21JNFhnWGlz?=
 =?utf-8?B?SEg5OVl4KzFmbDV2VmNTRnZZMit0Z3BWZjBlWnBBZ0w3WHJ3R2J5TVZ5S0pp?=
 =?utf-8?B?Sy9TN1RtNXpZNVNzUUEydG5QN0hweVVzaTBQeWU0NTZBN0s5RFB6dTEwcEFO?=
 =?utf-8?B?NlNpV0UrbU1ZZDhzeWh3cGFHZ0g2WDJuWkZzSG8ybEFjSklZbWhhcEluaHMy?=
 =?utf-8?B?VzVqbC8vcGZ0bEI3WHJjR0lIUWtMMzB1RjJEZzh2L2paZjgzRWUzdTVJdzRv?=
 =?utf-8?B?bTZmVExHTE83cU5mY0VmZDBIdjF4bkdyNC9NME8wdUdGWER0RExBbllCeGhn?=
 =?utf-8?B?empvUXJxeDJzdk5va1pKS3JOWCsra21ONzJ2SUc4ZTlvMGt1bEVvNFcvSjVV?=
 =?utf-8?B?RmZyTnFieURiaUlyeEJPZ2ExNmNaakJ1enVSZEV6emJLL3Jrcnprai90MVN1?=
 =?utf-8?B?MEhpb0dxY0lza2FWZVJ4MVVvM2dzZVVyczF2NStYa2dBbXNjRXJTUU1JZ09o?=
 =?utf-8?B?M0g1dEFSbDlPOU5MNVoxVlgzR1NFdDVpczFPa1ZCOVRZS1UwT3F6VUNnUGVz?=
 =?utf-8?B?cjIzSGJCUHhOZzVvbEJsK2I4S1gxOHVvYllXMWNxQVZGb3FETlBaY0V6L0tT?=
 =?utf-8?B?bFJ3eE4zU1YxbjZlKzZxdVdWK2V3RHFNdjhiZ2t2cEo4Y2xGdDJhYlYrTEM1?=
 =?utf-8?B?bDEwdElmZ2tpY21CTWZYVTJjZTIvSThPdVN6Si9uM0dOTTcxcGg5TVA1czBw?=
 =?utf-8?B?L2hPNjFXeHVQcUhtN1B2NDhvMlRNZ1d0Ti8vek11ZDVHSjBsQkVjbk1XVFpy?=
 =?utf-8?B?TXdLTDREMllmRDN0cUNDdVlmVDdoajI5L0hZejF5SUNlTGkvWGlUanc5d0c0?=
 =?utf-8?B?a2hrSnFPLzJUMndEMDF3dGgzUnhVRDVsT3BCRFNDb3BIZERBd0VpaTJOZndM?=
 =?utf-8?B?UDdEYXlzNlZ0emhBdmFhS0hRNzFMT0REQlFoVHlldlBvUWpRQlUyRUg0VXB6?=
 =?utf-8?B?WjEwSTh3dHZKeXlRR2g0Yy9PU0NTblRYVnNGbTFpWlpUQ3FSbFJHazcvMGc2?=
 =?utf-8?B?VEd5Y1hKcnJiYTBwd251ZWI4ZkIrVlIvc09CUFVRWFhwYzAyaTVaQTZKZFA2?=
 =?utf-8?B?bFNVUUplK016Y1NmR0prWE13b3FYOTVaVm82MWVpNVA4VDcvWFk1RnBaMy8z?=
 =?utf-8?B?WExaTVRWYnN4amdwZGNMcFlEL3dFeG81NTJVNWRPY0x5UitKQ3dvYlRHdXh4?=
 =?utf-8?B?UUVtekZzSnptS2xPSmd1a2FyOGpkNHVjd09ML2M3d1FzajkyT3p1bTVOUDFr?=
 =?utf-8?B?NVBTdEtJamtQNWdCVG1IU3JiQ0t5SHBIelRycTlyUytvNzlBWkIxWm5idndo?=
 =?utf-8?B?UHZWRGJqakpNaFBHOWZmdWMyc3dMUkwvY29HWlM0NVRsdjkvaEFMZzFWZGxn?=
 =?utf-8?B?WDJlWVcveTZpd3pROXd3a1pNcnNNQ0wwekxEenI1ZEo0WkE4d1FKK3pJSmlV?=
 =?utf-8?B?L3BGUWpNbythaUFiaGFWdlJNNGJxYWd3OUdwN1JyYkkyVDVBUm0zNk8ybHJG?=
 =?utf-8?B?MWtOQWxXL3c4c21BdDVPSlEzZjVlOEVDQ1JySmVSemZHclE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3RZMXoxcS9aUFU2T2ZoSW9RWENwSFJkaDMzbjVIcng2b2p0VDA2Y1hOOW1C?=
 =?utf-8?B?NWNkcG9UNERNVCs1cUFtdDREeWVrQXpkRVVPN0p1RTRySXphS3hvbTd3SHI5?=
 =?utf-8?B?WmZJdUw3bUVnNjgrckJkK0dOS1dzUVZlRXNYaTVtZ2FMaG4reWE2WVhia21Z?=
 =?utf-8?B?eDkrQmkwZVVkUXNmWW9ZUVZFK2JYRmdYVWgxa01XdFlneW1hbklzc2R3SnNM?=
 =?utf-8?B?bEY0UEUvdlNrdmtNUlJyTFJOTGhZMGdGVHhQVGhVT1dWT3Bpd1NkbzhnZlFi?=
 =?utf-8?B?MFRtVjhrK0tScFhzWGxJdSs4SllYRnF5Z0FHL0FxT00vUG5ZKzJROTlnMHM3?=
 =?utf-8?B?OXpJRTZGQlNqdDE1S2ZkT2lyY3F4cktyeURUcVMzemRjR1N0Ym13WHU4Vnlm?=
 =?utf-8?B?SStQUU5GbitsOThlUHlwRk13TGE3VVFHUy9mc0pKbExHMUdXWHdTb3VBS3VT?=
 =?utf-8?B?K3F1SEtQZk1kNktZbGRZbUE2Y2p2WENVc0Q1NXNQSU1NNWJtTUFmZkVJd05Z?=
 =?utf-8?B?cXZNZzZkZzM5U1NiLzNYZEJmbWc2bmlVaXBXQlhybndjZE04a3NCWTU0V2VD?=
 =?utf-8?B?VEhjUU4rTEFxZVRUU21pVHVJWlhZMWhVdVY0ZTI1cVlrWXFHb0RWVXhnRW9F?=
 =?utf-8?B?RmFYRVlVVW5NL2hNYmxvNkFBWlA2WHFZS256ZFRSV3RlYVdZMjlXazIvVVVp?=
 =?utf-8?B?RTh2S0NzMzB3M1pGMENWMUliRkNUaWRTOTRWY21oVmgvMkZ1eUxUbkIwYzds?=
 =?utf-8?B?cENycUJFbDBVLzZoNWhLQlRGeXl2SGdFUk1XMkJUQnB6NHhpMUhtYy9RTURR?=
 =?utf-8?B?aDd1MUlDWEdsY0lDbXRuUWZpL1hEaldSelZzWmUzODBJU0pSNmpOTXlTWjg3?=
 =?utf-8?B?Q3E0b3RjRWhqK2hDTVZHNWMyWm9jRG5VVmlzSEE3aXFRakxBeDdZN2Qwc21k?=
 =?utf-8?B?Q2NWSHpleldJVVdnM2tjejBwWVA1Z2F0amdkbVVSeURyZEoyQWJ4RFVQNGhz?=
 =?utf-8?B?NUNDME5Dc0NZSzNRSUdqMkxLSm1POXFEUUw0UnZQeFFLVzNoWXF5bmYzazJq?=
 =?utf-8?B?c2ZWYjFHK3ZlOEdGTjZMMGpSNE1YVHMrNXZxZStabmRNQjYzWDZhWUdOd3pP?=
 =?utf-8?B?NVpxQkpVOXFtTHU1U2VKNlNrSWUvMEx2QWtENXlBaHZBUzJldEVaRk9mYjRW?=
 =?utf-8?B?Y1E0c21EakRDWWphMkpmNGE1aWxDc1c2eklzaVVVZDh1dEw3UmYyUEcrbE5X?=
 =?utf-8?B?elUvT3pDc08xRjdWQmdyYUZtTnBvcWxDUEtnNFpMT0gxNFBnMHFGTWs5dnV3?=
 =?utf-8?B?OW1mTDd5a3o2UVk4TjhtZ1dtR01pRi9BdUpCRXFQL0ZSYXpzNEF6Um0wK3ph?=
 =?utf-8?B?emJVaWpKL1Z4dGt5ZmtuZ1RoL0Y5NDRpUmZrMmh6b053VUo3RVRaN3lUTXJV?=
 =?utf-8?B?UE9FVHM1VTBtY3dTeldwOVF0T1k0dkE4a3pOYVJXSVdqckxiUkMxRlM3UERE?=
 =?utf-8?B?QkRwWGQ5RlhmajFNWGY3bllyV0VtZms2R2ZZNllkczdMRmpISkN1Zmcxc2ZK?=
 =?utf-8?B?YS9RTEtaQmhYMkkwbjRaSmZFVzZ5OVN6OXZzcXNPdS94aTVVY0tHTjNGTk5W?=
 =?utf-8?B?cXlCWGhONFUzQ1NmcWtyTlRZNVNGbEo1cjdSQ1BQc0IvQ0haM1RRKzRKNzFh?=
 =?utf-8?B?aUR3cTJhV25uSk1WY3d2V1dteUVoZnNaWVMydVFjRmJDUm5tWC9PcFBPNUpM?=
 =?utf-8?B?RWFGVXR4aTRUMityaVN2U3F6WllEbngrdFZjNlNqMkQ5VVNYODZjWkF1SGtS?=
 =?utf-8?B?QTZUMmsyRmQyVTdyRUR1UWptU3hvdlZ3SEJXWWV5TXJzT2FpZ091U0FVam14?=
 =?utf-8?B?YUFRR091bG15eksvWmc5eUJLMkVuSGt4K3lId1RxWjZ6Z0d2d2x1QjVTcUZm?=
 =?utf-8?B?ZmpCd2ZvN3dBaTVYUS93cVZMOTJhcjJpa2l2b0ExWHIva3p1NTd2NXIvV294?=
 =?utf-8?B?eG8wMTBUTDM3VC93UVY0MGVjV1NMQnY1M25mc2UzRCt1c2NCcS8xSjVCOVFH?=
 =?utf-8?B?bXZtRitVbGRkRVhzN3Q0ajdMMnd0N2dsWVlNREc4QjdISnVZVlJ6WVpnL2lH?=
 =?utf-8?Q?3jNMSom5Y+O5GCjRQKuzvs1Be?=
Content-ID: <894DDFE625E36D469628CAC439ABFC87@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa273155-7611-4b44-bee9-08dca6257038
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 05:58:10.6462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeeHyABnAe+smOxo9QgRhPDQy1f0NPD0708WWVuf2Whinj7L0GobCR5jI4NdW7UhwBDkgzRSlqrDTGnUMbqG/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8799
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.399800-8.000000
X-TMASE-MatchedRID: VPleTT1nwdQ/XHdICuW5rya1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCks3z3wljuVXxQvMEFMAcCVaNaxZBRbNWv96+aVV/3FmpSh
 LJWs0HZyORmg3vGx7V9sIe/TXUbL1VJTV35UngiMVglQa/gMvfAreImldQ5BDHFSQk97VYGqEkN
 peaxt2NOLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge5sxB6vvd5JH/CF4
 ilfCqx6EnIzhwBsKz882aWxVOBv6uulxyHOcPoH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.399800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 88F29F253F8AD5F3322FC6D627CF9EED1184F6A1F97E35FD642F1989CC9D81562000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1954856707.1889985660"
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

--__=_Part_Boundary_006_1954856707.1889985660
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBXZWQsIDIwMjQtMDctMTcgYXQgMTM6MjQgKzA4MDAsIEhzaWFvIENo
aWVuIFN1bmcgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhh
dmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gIEZyb206IEhzaWFvIENo
aWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gU3VwcG9ydCAiTm9uZSIg
YWxwaGEgYmxlbmRpbmcgbW9kZSBvbiBNZWRpYVRlaydzIGNoaXBzLg0KDQpSZXZpZXdlZC1ieTog
Q0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0
ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyB8
IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBpbmRleCA5ZGZkMTNk
MzJkZmEuLjgwY2NkYWQzNzQxYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19ldGhkci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRo
ZHIuYw0KPiBAQCAtMyw2ICszLDcgQEANCj4gICAqIENvcHlyaWdodCAoYykgMjAyMSBNZWRpYVRl
ayBJbmMuDQo+ICAgKi8NCj4gIA0KPiArI2luY2x1ZGUgPGRybS9kcm1fYmxlbmQuaD4NCj4gICNp
bmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fZnJhbWVidWZm
ZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gQEAgLTE3NSw3ICsxNzYsOCBAQCB2
b2lkIG10a19ldGhkcl9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgaWR4LA0KPiAgYWxwaGFfY29uIHw9IHN0YXRlLT5iYXNlLmFscGhhICYgTUlYRVJfQUxQSEE7
DQo+ICB9DQo+ICANCj4gLWlmIChzdGF0ZS0+YmFzZS5mYiAmJiAhc3RhdGUtPmJhc2UuZmItPmZv
cm1hdC0+aGFzX2FscGhhKSB7DQo+ICtpZiAoKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFz
ZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpIHx8DQo+ICsgICAgc3RhdGUtPmJhc2UucGl4ZWxfYmxl
bmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSB7DQo+ICAvKg0KPiAgICogTWl4
ZXIgZG9lc24ndCBzdXBwb3J0IENPTlNUX0JMRCBtb2RlLA0KPiAgICogdXNlIGEgdHJpY2sgdG8g
bWFrZSB0aGUgb3V0cHV0IGVxdWl2YWxlbnQNCj4gDQo+IC0tIA0KPiAyLjQzLjANCj4gDQo+IA0K

--__=_Part_Boundary_006_1954856707.1889985660
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1dlZCwmIzMy
OzIwMjQtMDctMTcmIzMyO2F0JiMzMjsxMzoyNCYjMzI7KzA4MDAsJiMzMjtIc2lhbyYjMzI7Q2hp
ZW4mIzMyO1N1bmcmIzMyO3ZpYSYjMzI7QjQmIzMyO1JlbGF5JiMzMjt3cm90ZToNCiZndDsmIzMy
OyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNl
JiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjth
dHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3Ro
ZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtG
cm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRp
YXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1N1cHBvcnQmIzMyOyZxdW90O05vbmUm
cXVvdDsmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7bW9kZSYjMzI7b24mIzMyO01lZGlhVGVr
JiMzOTtzJiMzMjtjaGlwcy4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtj
ay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6
JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1i
eTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0
ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7fCYjMzI7NCYjMzI7KysrLQ0KJmd0OyYjMzI7JiMzMjsx
JiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMy
O2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2V0aGRyLmMNCiZndDsmIzMyO2luZGV4JiMzMjs5ZGZkMTNkMzJkZmEuLjgw
Y2NkYWQzNzQxYiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19ldGhkci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTMsNiYjMzI7KzMsNyYjMzI7
QEANCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtDb3B5cmlnaHQmIzMyOyhjKSYjMzI7MjAyMSYj
MzI7TWVkaWFUZWsmIzMyO0luYy4NCiZndDsmIzMyOyYjMzI7JiMzMjsqLw0KJmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOysjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fYmxlbmQuaCZndDsNCiZndDsm
IzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtkcm0vZHJtX2ZvdXJjYy5oJmd0Ow0KJmd0OyYjMzI7
JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2RybS9kcm1fZnJhbWVidWZmZXIuaCZndDsNCiZndDsmIzMy
OyYjMzI7I2luY2x1ZGUmIzMyOyZsdDtsaW51eC9jbGsuaCZndDsNCiZndDsmIzMyO0BAJiMzMjst
MTc1LDcmIzMyOysxNzYsOCYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19ldGhkcl9sYXllcl9jb25m
aWcoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtp
ZHgsDQomZ3Q7JiMzMjsmIzMyO2FscGhhX2NvbiYjMzI7fD0mIzMyO3N0YXRlLSZndDtiYXNlLmFs
cGhhJiMzMjsmYW1wOyYjMzI7TUlYRVJfQUxQSEE7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjstaWYmIzMyOyhzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1w
OyYjMzI7IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3sN
CiZndDsmIzMyOytpZiYjMzI7KChzdGF0ZS0mZ3Q7YmFzZS5mYiYjMzI7JmFtcDsmYW1wOyYjMzI7
IXN0YXRlLSZndDtiYXNlLmZiLSZndDtmb3JtYXQtJmd0O2hhc19hbHBoYSkmIzMyO3x8DQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5waXhlbF9ibGVuZF9tb2Rl
JiMzMjs9PSYjMzI7RFJNX01PREVfQkxFTkRfUElYRUxfTk9ORSkmIzMyO3sNCiZndDsmIzMyOyYj
MzI7LyoNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjtNaXhlciYjMzI7ZG9lc24mIzM5O3QmIzMy
O3N1cHBvcnQmIzMyO0NPTlNUX0JMRCYjMzI7bW9kZSwNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMz
Mjt1c2UmIzMyO2EmIzMyO3RyaWNrJiMzMjt0byYjMzI7bWFrZSYjMzI7dGhlJiMzMjtvdXRwdXQm
IzMyO2VxdWl2YWxlbnQNCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40
My4wDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1954856707.1889985660--

