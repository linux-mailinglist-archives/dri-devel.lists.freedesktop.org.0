Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64C9B8D67
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 10:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CB810E1A7;
	Fri,  1 Nov 2024 09:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YaHg8mB0";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="G0ljeDCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBC010E077
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 09:02:09 +0000 (UTC)
X-UUID: f6035ed0982f11efbd192953cf12861f-20241101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=cUG2nKbP96gCUi90cV3biRIpoSgmiOUfg+oUxo4VyA0=; 
 b=YaHg8mB0/K3WrPlr/PL/LgKVqGbEcVp/KnJGuxMdP/4kr81QHcjUENXp5ErLzGpNXabNMPrvqqijC69jVENfTzdcC1wQXa9gpRTFyR34XdoY8ncQNZxIaMJihBaJRUFUUfKNNGFe/4wsAb5eiOWkXywWyTX46/n3omusL0AWG2g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:82f6fdc8-f282-40e5-8936-2f1553d6abed, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:1b5665e7-cb6b-4a59-bfa3-98f245b4912e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f6035ed0982f11efbd192953cf12861f-20241101
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1132644113; Fri, 01 Nov 2024 17:02:03 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Nov 2024 02:02:01 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Nov 2024 17:02:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbIyeLGZnZOhOh7XN66UO4FQ/15n4fVo6hQGBKzpQPdfaZmRRuydHw84OyusSzoVDr4RtFJ8DWSWRdHYJGrMYtCmvoC4SGeiQoU9B0Jd2PC7MjTngiohxx+hcTZQU+iqBAzYQkIlcQXIlj2xJu0hnVkKJHq1gG/bmowQMWgvQ96McAJ65QJCWuuab0qGdXm4gNCNVxgMsHZc89vLrRZjEh7Jp7F6Wi8kmSymGeTSnQR0qz1g7hwukaT/C4qK+9Gboyicu86RL8cvrw3jtJbfMklsThlMLGKXspRpjCeAHXDuxrGN6zjJ5u8tkrCHZHB9P8Vj2HlBurBKfBus3IyVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Cft/XqPqHVbg67LjATCgJRPPnJBRZQQiLnZ5UqfWvU=;
 b=fzLIQ8aeqvCOJ1b2d8dYRhw0m7VhqRcdeUcV6aQqP9XLA/bBXvaXVw4ddWzCW9BPrwOzSxxAhbxtomzi2tvBHlkAtoGDAS9gwkjhJDVgDUIx3hqh7jz7bdo10BBV4cQb9BFXdhEI3n6d22sipgO3qxuqPzDE6U4jAlQ1E+U1I+XnGHCAVk1elDre7l3bo+BXtAjqPhnP3Vb4Va91nMZfp92BK3cA/yu3PTXqRIwDxJ+dXUtpEVGRRoBuIXp/wJ0yg4Jm6s9UnQ9Le1J3b/A6eTGcWfm4cv5kZ4dcOq82xfIgMW+gqqc/7G+xQ1ljuoxxYPQMrrJNtXWKWp7psYAk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Cft/XqPqHVbg67LjATCgJRPPnJBRZQQiLnZ5UqfWvU=;
 b=G0ljeDCd0jdu9zgH+qs7XGnpu/aYrWQlcm8w7Kw4G7f/ATxFvhee9zJVTBskboUjH70zjPSrlV1NNUPgTAo27LEoL5NcYpUSbo48oIieYaNglVMJb7qsBfeEfk6lP2uJ+Ep8b6EzsUpmTR5xu9MAkc1KuVdbhcsnVa0LV07H1QU=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYSPR03MB7689.apcprd03.prod.outlook.com (2603:1096:400:414::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 09:01:58 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 09:01:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLKjBjCA
Date: Fri, 1 Nov 2024 09:01:58 +0000
Message-ID: <ca952cc93f8e616423b6d9ebc78ac2ee0232dab8.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYSPR03MB7689:EE_
x-ms-office365-filtering-correlation-id: 1320e2f8-61e1-433e-5768-08dcfa53d79b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bjZJSkt0YTVOUm5YZVByOGtIVlBhSlIxV0FDZ1F5MzBEdEFDVWNvR2ZwU2lE?=
 =?utf-8?B?eDZ4cHhpd1YxeW1URGhMUlY1Vk84bTVhcmk4Q2pxaEFPQ3NvMm4ydWZldHo5?=
 =?utf-8?B?dExkYkZiYmtXekoxYW9PSVdTV3J2c0czSE1XTUNkb1RGOUhYSXpmSnl3SFlt?=
 =?utf-8?B?bWorSnp1V2VtNG5qbVYwUnNVSThZZ2Fnbm1sc2pXb3NqNVZNK3d4c0NkTEhx?=
 =?utf-8?B?YU92ZjhwS0NyWWZQRjZLN0tUNHR4TDQ4dDlpd09Xc0pEL1B5MitqM2NLT2Fi?=
 =?utf-8?B?SnNmZ2VrZjFDNkxlM3pjMjMzSDBjSi9LN0wwQVFaSkVkdlhqcks3bFUyd2V4?=
 =?utf-8?B?ZHo5Zzh4NzRZU244bkQzd0ZPTkZJSUk3MTJadnRualJhQ0xJYlYxNkEyNThG?=
 =?utf-8?B?b2RpUFpoR3hzbGdwYVgzQ3JUUzBBb2U1QWx3MDBpU0lMMzhPbWNpM0M0eWdF?=
 =?utf-8?B?SWZqcTgxY3JMSWRwZ3hMeERiWEVUTFI1MmtCR0lNQXdHWGlSMGwyTXFSbnFs?=
 =?utf-8?B?dUxFb2p0Z3VCYXJpUitpOGlFdmpBc01CQkpKYVpBTWsrcVRrNXRmMkNKdWRY?=
 =?utf-8?B?b1p6UVRWUTNqR3lYc1J3TFdneEFZbTdpOWQvbmZaK0tJVDZJdi9pT0ZqYUlk?=
 =?utf-8?B?Wm1jKytDRTRKTDFoZGk3a3NlUGpVdjNBQjBMWWtmLzB6S0k0OWhTY25jR1VC?=
 =?utf-8?B?dXFwOVpKSVpVMnhqcFU3MlFtVUxCaDNOVXhPdWttR0Q1U2l2ajhrOUFJZU53?=
 =?utf-8?B?Yzh4c1FZQlBWSFVFL3N2cG9TM3VrOHNSVkRPZUR2K3B3RDFxcDczWlIvMWdG?=
 =?utf-8?B?MUxRSTFadkMwYjFzSWJucVo5eThNbDAxU3hUZFRyVzBZOElnWUh0eU9LQk9h?=
 =?utf-8?B?V1RvaU5nYytWaEtGUGtWYWJ4NTlST2V5NDRJK2xSZDNXMExnTUxTQWtjcjBB?=
 =?utf-8?B?T1E4dGQvNkRpWVJIME5vdWZaRDFvZ3A3K2lackhkcmV2UnJYUUJpL0xZNlU4?=
 =?utf-8?B?UnFrdkJpZW1TaXEvVnh5K2p3TnR4VGJHWGpCc1VjVHJ5WEdGemo0bzQ4SDZL?=
 =?utf-8?B?RE5jb1RhK2Y5aFZwZFpkTjJRV21udzBaVGJvbXl6ZzlRZDhsVWlaY0E1cW5T?=
 =?utf-8?B?Qzhld2dWZ2pTM0svcUFjZ3lhUDNyQmw2U2xHYzlZL2dMaS8wdzUrQlZWUGV2?=
 =?utf-8?B?UkRtcXo3SFRORFZUY2cyL2c2cytDL3ZGbDFkcmwzQUFhZCtrYWlHL0FiWENn?=
 =?utf-8?B?alZETFJzUDkxOEsvM1pSQ1NHeVNES21IWVFNcjZLMWVhY3VXdGh0MWRSQ04w?=
 =?utf-8?B?NzZmRmt2TnFtME9hSDdQclN3VnFySVFIR1JnUHVNMWIyTmNma2NOVnYwVnhq?=
 =?utf-8?B?TkZkeU43UzZnTmNkb0lxZ3hCdUtGMXRGLzY2S1VHMWxJYlhWWnlpL04zeGJF?=
 =?utf-8?B?V2VsN2RLd0xnbklGOHpTbW50MWpGbHk1RWhxWmFvQmVjOEVlZnpVelJOUlVH?=
 =?utf-8?B?V3E1Q1BOT1k3Q3BEd1k1SFJrSFNueGNCM0NzT04vb1cxZDk4M0I4SDA1My9G?=
 =?utf-8?B?MHlsa3lpZis2RkRkYWVZM1JKNllwTEh5MUNyaU9tQXVkbE8vQ2NZZXF2OW9i?=
 =?utf-8?B?cXlDVEdYNXRyN2RIMENpSmVONkdXY05IK1BlWUtpY2U1NTRiYWsrVnZPMEQv?=
 =?utf-8?B?dG8wQVFXSFRqS2IxRXp6MVNUYnN6TDFhQnRkNWlpbURNRUVTSldpM2lxV0J4?=
 =?utf-8?B?ZnRqbUF4UGJ6dDQ0ZEFFanlDVmt1UFprVGdVVHNaajlYc0oyUlAwa3pZUC92?=
 =?utf-8?Q?aSiOv3fiL05+gj5VkjPFD6LH7+LWiffWr6ypo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2l6RGVNMUJRekwyR0Q5Z1JkNWpJalF0YWsxS0IrY2Z6SnN1ZUFVWFg0YUhy?=
 =?utf-8?B?YzZGMy90ZHJGTHlqeWVlNlUwSXowUm5PQUVveko4SzZwelFMNVZOSG1tcUMw?=
 =?utf-8?B?aTkxc2pZbVN0MUNiUjYwN3NvS1MwUDIxRm1LWnNLTEFjMTF1WER1VWc1OVdV?=
 =?utf-8?B?TkZhU1I4cDZPNllHeWVmazZiUUlONStCR2x6RzEvWWRJdldtTm40NUdUM3Zk?=
 =?utf-8?B?aHFnckQ2RE04VHF6RUlmYkYyOEpiVmcrZFYxWjJyWU9OM1F1RVlkVFZmM1pw?=
 =?utf-8?B?S3R2STRaOFg3MWkvRC9raW9leXBjS2dlKzlyUFozMzd1RE1OSXBOS3gxUDk4?=
 =?utf-8?B?QmZVVmZRWmg0SGlZN2pjMFI0MHdhdm9EMGpUd1BHY0tCaU5mc1B3QU00ZnZU?=
 =?utf-8?B?cTdaWmNYS0FOWlB3RFpjd2c4UWV6UWdYQ2Z4WjU4T2p0QjFZa2dnNWYyaG04?=
 =?utf-8?B?NlBHSkFnLzBmQlBVQTBZbnFaL21zVUZRWHBHZHJjMmZweFRVZU8xZGZoTm1S?=
 =?utf-8?B?NTR6T0s3bzNIUGpsR1RZRzZTYURUY3AxTmVBRFQvOERhMXI0ZjNYclk2eXph?=
 =?utf-8?B?cWNHUDc5eGJxUmljb1lYdENZZW5ibmVKVCtXMEhNcHo0TnlWbzIraGFkVWpX?=
 =?utf-8?B?cFFuSDFEanhNVmlMSSsrS09kSk5IcmgvdWh0TWZ2eWxOakZqODRqaWVIOEVX?=
 =?utf-8?B?U0lNYkVpWExMcDR3Zm4yL0FZZ0YvYnA0OXpQR2ZMWHM0T2JKM21xRXlOSVBP?=
 =?utf-8?B?OURoU1NSdDRtMHFvZ2JZcUJwb2VuKzdySUc0MDZ0bzF5ZGZvMzkwaytqTXpz?=
 =?utf-8?B?ZkpsR2VtWVg1bmNUTUhmNlZUclg5bkcvOExIV2tKS3FaN1RLLzB2NlBYejBz?=
 =?utf-8?B?RlFrS0lCSXN2ZG44K3R1S3YrVGhtUFUvT1NZbDJZODJ5Y2w5dVlGQVlHbXd2?=
 =?utf-8?B?QnA0Y2NxM3BucjF3VEpKdE53aWVtUmdhZ29QTVNuRGs2OXQvN1k2MHQxaGFp?=
 =?utf-8?B?Q2dMWlVDUVZVaSt5U0JCVVFPa2t2bDd6SFZpSTJ3OTlML256WFFxZCtIODlX?=
 =?utf-8?B?M05MUTVCWVJiMkZwMXEyT21uOHd5dk5OaThuRlNCMmltb1diVUVGc1dhMkJN?=
 =?utf-8?B?bU0rbkd5aHdINzBhbjlEVXhDUVdkVmpBS08wamdYVUt3MWNsaS9oNysvcFR2?=
 =?utf-8?B?VDhZSmlFbzF2MHQwcGcwYWJpRm90YTFZczV3T0FvVDRzV1AzbDBOOXRuY2lV?=
 =?utf-8?B?ZlQ4cXJTWmZBcjRlWk0wTEl3L3ZZdHFYMmJoNGdCc2xiaDdDTUt3eGtlM3B4?=
 =?utf-8?B?WC94SmZXM3VtQlhSOThJNmZwbUxPQVpOZzE5azJSYlRvWG4zYVNRQm5SdkFN?=
 =?utf-8?B?U2NYdFRoWG02ZEUyTGg2T3dnZnJqK3MvMTlRR2JZQ0RpUFhBRWdxS2JZY2ZY?=
 =?utf-8?B?MDlFUlluQ2c4Y1hvVXh4M0FlM3YvUjRia085TFNHbHRjMDNTbEVhaU9qbHJE?=
 =?utf-8?B?emRwWG00OS9mOVZEREI0cHd1RXp0Wm5vQUp4T0wwMVgwVEhXVytoeVlxK0xo?=
 =?utf-8?B?Q1NGeE1jMC9DeWhqR1Qzb0N0b1VGa0paQnY2dHVhSjFPbW1DaS9PdWt1Q0VL?=
 =?utf-8?B?NHZaYWFDVjBzNkE4Y1ErV1I2OWxrRDBaN3FjKzhJZTZQU0VZUzNSNWsrQnlp?=
 =?utf-8?B?ZUVrQXNSNUFlbzNJc1IrMElTTll1NzVlTjdlQUNpdWdLeXpQVTVnN0F1S0Fw?=
 =?utf-8?B?eTdpQXhyRmMwMm9LNU1RS0RGVDhKbEhWcE1PL3NzcEdYMVRBblRRa3RLb1lx?=
 =?utf-8?B?OUpoeVZOS09jeU4wdVR1TXRQNnNTbFRCMjZlL05ReGpwalREWnEzMFpNK3RW?=
 =?utf-8?B?QUR2QS8xcCtzdTNWb1NjYU5jSmpBYklXazl1dnk2SXdXQWk4VjRVWVh6T0xY?=
 =?utf-8?B?WXVQeExVSHB4UUNhMUc2MFdvWGdWVXMwM1dVbDZSR3lLV1V0cE5IWTNRc2I1?=
 =?utf-8?B?TzhxNHNFdnR5cExYUmo4SUNnYm5LV0ZrNEI0RjI4WXVLeE1MaUxFanlya0lJ?=
 =?utf-8?B?ZVBIa3NhZ1c0cEtOY0VKenRIekx0ZmlXNk1MbU5mMDZTanIwVGx6QjdTOFps?=
 =?utf-8?Q?jFu6WFxLxhNOImBqrjNnO23U7?=
Content-ID: <D904967D82E61B4C943419F4A1D5A3E9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1320e2f8-61e1-433e-5768-08dcfa53d79b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 09:01:58.5997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iDBTTWklZJIsdBE7DS0cRw00IyOYV8zI8/ZJYLeP7z0nRlGdLA1THutjJ8nnWbly6KkBXEA4tbB/Yed0PCja7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7689
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_963093590.1662008821"
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

--__=_Part_Boundary_007_963093590.1662008821
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X3dyaXRlX3NlbmRfYWNrKHN0cnVjdCBtdGtf
aGRjcF9pbmZvICpoZGNwX2luZm8pDQo+ICt7DQoNClRoaXMgZnVuY3Rpb24gaXMgb25seSBjYWxs
ZWQgYnkgb25lIHBsYWNlIGFuZCB0aGlzIGZ1bmN0aW9uIGp1c3QgZG9lcyBvbmUgdGhpbmcsIHNv
IG1lcmdlIHRoaXMgZnVuY3Rpb24gaW50byBjYWxsZXIgZnVuY3Rpb24uDQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICsJc3RydWN0IG10a19kcCAqbXRrX2RwID0gY29udGFpbmVyX29mKGhkY3BfaW5mbywg
c3RydWN0IG10a19kcCwgaGRjcF9pbmZvKTsNCj4gKwlzc2l6ZV90IHJldDsNCj4gKw0KPiArCWRl
dl9kYmcobXRrX2RwLT5kZXYsICJbSERDUDIuWF0gSERDUF8yXzJfU0VORF9BQ0tcbiIpOw0KPiAr
DQo+ICsJcmV0ID0gZHJtX2RwX2RwY2Rfd3JpdGUoJm10a19kcC0+YXV4LCBEUF9IRENQXzJfMl9S
RVBfU0VORF9BQ0tfT0ZGU0VULA0KPiArCQkJCWhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4
LnNlbmRfYWNrLnYsDQo+ICsJCUhEQ1BfMl8yX1ZfUFJJTUVfSEFMRl9MRU4pOw0KPiArCWlmIChy
ZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cg0K

--__=_Part_Boundary_007_963093590.1662008821
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hkY3AyeF93cml0ZV9z
ZW5kX2FjayhzdHJ1Y3QmIzMyO210a19oZGNwX2luZm8mIzMyOypoZGNwX2luZm8pDQomZ3Q7JiMz
Mjsrew0KDQpUaGlzJiMzMjtmdW5jdGlvbiYjMzI7aXMmIzMyO29ubHkmIzMyO2NhbGxlZCYjMzI7
YnkmIzMyO29uZSYjMzI7cGxhY2UmIzMyO2FuZCYjMzI7dGhpcyYjMzI7ZnVuY3Rpb24mIzMyO2p1
c3QmIzMyO2RvZXMmIzMyO29uZSYjMzI7dGhpbmcsJiMzMjtzbyYjMzI7bWVyZ2UmIzMyO3RoaXMm
IzMyO2Z1bmN0aW9uJiMzMjtpbnRvJiMzMjtjYWxsZXImIzMyO2Z1bmN0aW9uLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRrX2RwJiMzMjs9JiMz
Mjtjb250YWluZXJfb2YoaGRjcF9pbmZvLCYjMzI7c3RydWN0JiMzMjttdGtfZHAsJiMzMjtoZGNw
X2luZm8pOw0KJmd0OyYjMzI7K3NzaXplX3QmIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMy
OytkZXZfZGJnKG10a19kcC0mZ3Q7ZGV2LCYjMzI7JnF1b3Q7W0hEQ1AyLlhdJiMzMjtIRENQXzJf
Ml9TRU5EX0FDSyYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9
JiMzMjtkcm1fZHBfZHBjZF93cml0ZSgmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7RFBfSERDUF8y
XzJfUkVQX1NFTkRfQUNLX09GRlNFVCwNCiZndDsmIzMyOytoZGNwX2luZm8tJmd0O2hkY3AyX2lu
Zm8uaGRjcF90eC5zZW5kX2Fjay52LA0KJmd0OyYjMzI7K0hEQ1BfMl8yX1ZfUFJJTUVfSEFMRl9M
RU4pOw0KJmd0OyYjMzI7K2lmJiMzMjsocmV0JiMzMjsmbHQ7JiMzMjswKQ0KJmd0OyYjMzI7K3Jl
dHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3JldHVybiYjMzI7MDsNCiZndDsm
IzMyOyt9DQomZ3Q7JiMzMjsrDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_963093590.1662008821--

