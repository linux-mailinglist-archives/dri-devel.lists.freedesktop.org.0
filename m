Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A9CDB298
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C823F10E31A;
	Wed, 24 Dec 2025 02:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="g7Yv8/Oe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gr+BVS5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9F710E31A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:21:51 +0000 (UTC)
X-UUID: 4c02881ee06f11f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hCL++4iIuScunicHh3z1rNJnYy8otbspOwc57r++rs4=; 
 b=g7Yv8/OeDs+knshMeJ0UYLzyLyrWphUySVb4GkowGBWQ62VjiadJBNBap+ItOrda+sM3isoUEVgzZbnxQ7E0d+0znI0mmmwvhbYxPEIk+TkkmHXA6LHKsBKuNn4LsJuf+n61ppnA0CdhBxuCTBEd+lVIiJSl/iM/Q33z6IopyDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:918f872d-4d67-4547-870b-5e31e58adf9b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:6ebbc6c6-8a73-4871-aac2-7b886d064f36,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4c02881ee06f11f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1974566448; Wed, 24 Dec 2025 10:21:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:21:46 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:21:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHEdei3WmwwfdpbIC0P+Bg1Wj0dwf8LoDSdQZNLO+HFJZGj3YlMkd8G73FFtXy/z01ikRwPRjaKy90xSYlxYgFmmTG8Gyiruy1c/WRmn2YkrK3+GU3FKhVd9Bp5OqTAOEjP7/B1gk816Y6MhgWcoOW1hX13DC2YQrnss9STilmxV0cQQYrV8gnRQflIqipb2ZoS2TlSa8+vW0FAQXcWKMyh1X1K+GJ2n27hmZLEHu7xP19s0dPJbV+1jEPV2wnx9qslc/quBGgjgSbNAMRJklr3dJJjv61xtxXmzJr6g2Vo16va99GAepw84TXbiuhVSkC+13JwTuVNAZMj9+/1W+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZwXdMAKhDbd5gg9jXDoXfQQwnSioxUQnuQlydsvgxM=;
 b=h508nGlbZMjHFJ9OOSEdrDFG8kTzKWpqKvq0HE2lYepgavk8T6oqOt8B18r7IDtgqhC86J7wv2TwlNNH+Afg+4+vc9TCkD5qaPUIl6LbWOtBJh2f0wHkli/wKZCSL3IfUFSDQXN4p2DcwBUI5qH5lMRHcsPzOA5ctXiu1NStODCTYUkmkHJTOKVX/rgx3o0T7T1KgZVZ7n8t6E7+sc6d/eaOzk8k2ejTEEqVx6m26/nGyA+kWX5pxjgBbGEoxMNC90JyWCpIdJgNZb1606LHJMFdAhekxCueCVBvVuHnXc++0JQ9JKCu715JThJwY99lka5T07EatFWrVvRSAbYNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZwXdMAKhDbd5gg9jXDoXfQQwnSioxUQnuQlydsvgxM=;
 b=gr+BVS5NyL4SuiwrAd+xai/CwBbmQLGur6YUwXrTI/UnKJyEC4uVpyq62S+scwtwRrCMaBsMHaQdM8+DbDYr+e7MU0mWoObXUl1er9XZEc4xj3QDwnd5/QiSGIOe9OXHjjvoPQftOROOa8abom8TdIyY82HsGRIpqXAUWR9gMt4=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:21:43 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:21:43 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
Thread-Topic: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
Thread-Index: AQHcdEUAKSozSqvKwk+XJU5z3WPTI7UwD4sA
Date: Wed, 24 Dec 2025 02:21:42 +0000
Message-ID: <04894f0988cd81c7effb6fcbc2997108ba84b064.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: e763be08-9574-44f6-a020-08de42932dd2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T0xuVElUZlg5eWRsMHNBREl0LzFjMlhlMVRSNG9abnJldVQxdUphQm5GN2M4?=
 =?utf-8?B?eVdCeXh4cWI2eU5aM2Vsd2t0c2dSSHVHSXFpWUsweVlxNFRxd1lOOVVWSFRp?=
 =?utf-8?B?Y3Zkd3JIeGtXclJPTnVwZitwM0RhSldtUkJRbjNSZFlYVzBhcElSTnB4czRx?=
 =?utf-8?B?azhsMnZVS081SjZqYTJKQnhPeDBCMXp2Z2llT2crZVYxN1djNXA4clJpMGYr?=
 =?utf-8?B?MERsK3JKU2NYZ1pVdUJwcmZCdlJUS0sxVGhVMU1BcGVBZ0FKeFFtRU9aaC9G?=
 =?utf-8?B?WU5weUpNUHBkK1BUTzR2Z0FBUFEzUTB4ckEwak5EZlh5RGtJQTlVK0Vmb255?=
 =?utf-8?B?cys3eVBjaDYyS1RYUG5SL1Q2bzJVd3B1Q3FZcEF1bmdFVmpwZ0hFY3VQancr?=
 =?utf-8?B?Q0JkdkhpczZBRWhSK2NBVEtXaWF0Zmx5K0syMkt4U2tnMCtXUlU5RXRlK1k3?=
 =?utf-8?B?Q01aSzNUK0FZcytpbFp5QWFicDcyeFQvVmNFL2daZXllNWFYSkxoQnU5eStk?=
 =?utf-8?B?dDl2L0V0Ry9Cb2QrYlhTbkcxMFpXZXRHS0JHSC90cGJJYkdIYXAwb25QeHdn?=
 =?utf-8?B?cnh4ZVM0K3JlVklYdkhDbFJUNjhxRXpSeGRPTlNUZWVud2VYTFA1MXlHWU9o?=
 =?utf-8?B?R2NERFd5VHBvRnBlRkhJZ0t2SHpUSm5xZFJpKzlSZmNsSHNrbUJnUGZaYlQ3?=
 =?utf-8?B?Qi9Md1h0ZDNRWE1LaDhEM2lyU2JKemdzek42WWYxbkxub0NVaXFkNXJSbTN5?=
 =?utf-8?B?QVE0ODVmNDZjYk9kWVFBOU40eWNsUTVIYjU0Wk45S0VGQkJTelAxb0REeFJI?=
 =?utf-8?B?ejhERHV4b2llaE9WMWxCSXY4eUNRNjVOL3lETmIvSG9xTDVoaEJNYUhyeHBs?=
 =?utf-8?B?d1liS3hETVJBMDZBVXRHMlJqbGx0M3JtRVJCRE5wNjl0SHltRVJseGdNaEgw?=
 =?utf-8?B?UU42T1BGcm5vNWdvMmE3NFdqREhnU2ZsOTc4Q0Q0b01vYkdpOFJDem9JNm52?=
 =?utf-8?B?cm9mWHFnSEtSeWZ3QnlhV3YrNlFTS01vRWUwTExFOFRtbHVmc0tJcEZGcFJN?=
 =?utf-8?B?SGJkT3R3MmlJRDRvUDNrL0dlaXUzYmhFSGNjSUc1OWhEUDBHUjA2UTVHUkl4?=
 =?utf-8?B?SHJWNHFjMUhZUThKd1ZJV0o2RkgwdEczU285ZUo1Rlh1UVc1ZUcwNUoyMmZG?=
 =?utf-8?B?TFBycXZsYzJhcUdMenk4YkFlTkVxL2pWRGR5UjY2S1hHS0dpUElaMlp3b3Bk?=
 =?utf-8?B?U0I5Ui83ZkdPTElsY3kyRk5SQThhcEVaZTBob0NBOWppMlREczhDbW8xa3Rt?=
 =?utf-8?B?SzVtNHlPTTJlQW9SNDNMc3JHc1lMSHd0MHNTL3AzSmxHUW5GMFZyOVdoWjJT?=
 =?utf-8?B?WEU1YjNkZi9XRDVmaUswTWl2QWRVT3NsQ3lFZzNoS05XQVJwcmN2eFpjWCto?=
 =?utf-8?B?Ky9Pem9PaTU3cHNkaFMxNzR6ZktTVk9oWHk5NStoNENuSGFoUHQycW54NDZQ?=
 =?utf-8?B?M3VJZWlqazFGMnZCdDRxOHNpbjlXMFMvSFpldzVVc3JFbVY1SjZ1bUZvWDBJ?=
 =?utf-8?B?RFcvcSs2RWg1bjlOZXI0WWZpc3pPTWloNFlpTDFOcHNxRTBseUJlUnZISHBa?=
 =?utf-8?B?eDNyK0ZYU2g1L1grVVJnQXZFWTNKUGtabVlQaklIeW1tQ2kvdXlWanRSUmsw?=
 =?utf-8?B?b1RqcmlIUmVhVXdCUi9POWltKzE5WmdKdFlacGk0MnFNNlBIOTB4ZFVWakR1?=
 =?utf-8?B?MFFtbE5PdmRpMHZNUmRpcXVPaThjalNTZWhyNGhVUnEyM0MwNTZmaFZaWGdV?=
 =?utf-8?B?Tmp5YmZhZlBwR0FzeVJRRTRPWkdQNUZLVlMzRzI2anZCRDRzVFJnZzBQekN2?=
 =?utf-8?B?dkU0TXJEU0RjSzE1RFo5cS84eVFhTHlWY3dOWjJqVzNkcWxiaFlqVDB0TlRE?=
 =?utf-8?B?NmpTZy9jMCsxaDYzT0cxeEx3UEs1cmthOHM0Q2NWRDRoZDVxbkMzenFtTkhx?=
 =?utf-8?B?cHA1QW02UFZlbHQzaUI2T0tzeHh3d1R3Q3FxSnhnM1ptZFN5OTlYUGlDSGFn?=
 =?utf-8?B?SGtLdzZabzh5VHArUWVaVWdSbFB2RVJXdHlKdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR03MB7810.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGtmVkRrdGxNVFZ0cklUa3NVUWRiZ29ZTC82UXpRQ1dTRk5FbUdkVXBVQ2ZO?=
 =?utf-8?B?RTR1dTh4akhUaXhHTWE3aEVkWFl4cWE3Z29uYms3TW5iR0l0TWkxdHZhSVYy?=
 =?utf-8?B?MHdQTy9QQ1k1MVVTU2pad2t6WkErVkZmdER1eHFTdTRkaFU1RW5pV3VoMjN1?=
 =?utf-8?B?dGRrRzBDbENWSHcvOEtseUZJUGRsOUNHRHFHMFRPOFNELzJuWC9TYUpDdVNP?=
 =?utf-8?B?TE9sWjNmSnEvc3NPbmJCTWFONkJmYzh6WEsxN2lqU2d2alBHWHVXbmZJWlVu?=
 =?utf-8?B?YnY2K0JtNmpGNFJxcDZSR08yMnV4MUs4UVpXdGdsQ0RRajVNekMvSDJ1eTBk?=
 =?utf-8?B?ZytpNUVjVUNXRFBKRGxIUkRFSU1BU2M4allDeE53bjVQUG1Ha2l3b2dhQVYr?=
 =?utf-8?B?aTJJbzRpSTRGSlE4R0lqWjJOQzRsQ0lNQ3ppZjFxSXFxOXREM1RpMmVmajQw?=
 =?utf-8?B?VFB5d2xNZGl0VlpGREZ1eWZBVytHcWF2VUpKQ09SbFVvT1g2czlTS2Y5eUtz?=
 =?utf-8?B?SEZuRGpQUTc2Sk5oVkJFYWpoaTg0R1RjalFZeFdTRnVnNmlEOUVtZktvZUll?=
 =?utf-8?B?TE5BdVdZOERvc1NVaXBnM2liWHhDNy85OVJZNEhzN215am54Rk9IZVdZcG1M?=
 =?utf-8?B?QmZLQ2hEOFhVT0lmUjBLcnRtU2UvMzJLZkxoV2Yrd2dkOVpjcTdRSitmYmc4?=
 =?utf-8?B?a2tYTU9uMEEveWFQSE4vc0FEVDlRMUNyZW4rK1ZaeGR5dCtxTnREdSs2UUIz?=
 =?utf-8?B?ME9PZFJuWVNnajU3YWIxeUw0LzBKYmN1bldvQUthTXZ6ZTIzSWQwWjdFZUNp?=
 =?utf-8?B?MGx4K0xMK2xXUHZ5eVVWc3JwTytFcXY3K2U1eVhJWDVreXpNcVhIc1phc3Q0?=
 =?utf-8?B?Y2FUS2FZWFZNd0lmanZ4YjBjWlJhMlRMWEtFbkljeEJ5cHkzaFNFSHdvVm01?=
 =?utf-8?B?OXloM0laYUlCUTJwbytHSlZSQ29aRUZCT2tsRHhiWkh5SUxLUTBtSzN1OWth?=
 =?utf-8?B?ekdPV0F5VmZQK1JVRlpUWXRYNk1Gb0lPeVQvMFNOMm5hTlBHM1J4dmhOK1lP?=
 =?utf-8?B?MnZmT1pvSFZqQ3dXeTIyQ0dHemJnemxiajBDREUxN3l3dThSSEZ3MGJCdVFO?=
 =?utf-8?B?eTNiUDlpampSZWZ4eDlvSUlKdE9ySWRZSWd4UWxiMEc2ejkvMWllSUxMM2Rl?=
 =?utf-8?B?Si9PSlVGN1Fwc3JLNnB0NWo3c2s1WmdXN2RmRjRJMXlBNE52YWJneGYwdVIz?=
 =?utf-8?B?MFdMUndrZ3UrUXRZVGo5dmpDanFwa3RkdzRaNVdRNlljU012dEVieWhiMTNm?=
 =?utf-8?B?NG83a3RoZ0xmaEp6dFdHS0U2RFJySHpTUzdnNHM0TkdzWitmVHYyZmtMeElN?=
 =?utf-8?B?Ym9GVGV3ZXZ5aWloMzd3b2pXdVdPZDFJQzYydEl3NzBqQ2ZJbkRXSkptc1pT?=
 =?utf-8?B?aEErVWhVWFJXaUxNaGp5cEFjM0hpTVRFcXBGWFcrZG9FMS9TcGJxcjBsaDUy?=
 =?utf-8?B?cjBwcWYxeWNIdjBkN0JIYVhXR0xjZS9YU1Z5QmhNUjRtczRpeGt4VU9nL3pG?=
 =?utf-8?B?ekZaVGp0enVRU3ppM201Zmc0bHg5bVNjOEM1RlJLYmJicTA0S0syZnhCZE5Y?=
 =?utf-8?B?eHRMaVExV0E1TnNEWlJZNWQwR2d5MTF6MnhLblNRMDhyTDI1WDUvRHpOMThJ?=
 =?utf-8?B?djIvVUEwSmk2eldaQmpTMXpZdncrbTkvcmJkOWU0c2hPZWFaTnRPdEdGUWxu?=
 =?utf-8?B?bE82ZXEvdHhudXk4bnpackovZkI1RHBhYW1peTJMaGZWZ3pBbUVnQW9CTHVh?=
 =?utf-8?B?Ky80NmVWYWVxTTU4d0VMRGx2b3d4aDhPdzBjR3EveEdWcjZtcHVUYy9yMC9B?=
 =?utf-8?B?SFBPa2xqdTFKZmNuMHFiQnB4NTFRRVg5UnVEeDVlS0t2NUxwMGNmRTRqbUtV?=
 =?utf-8?B?b1ZMaWV6R0k4U0loa252NVJqSlhtTklYaVBxWEcrYnJjbVVReCtsREdFWnFh?=
 =?utf-8?B?dktSRkF6am44R0JDUXV6bFFhSWtzT1BaTUZUU0ovZWthSFp6OUIzUENzRjVi?=
 =?utf-8?B?bXhUdjRJdkxqSy9RLzNDZVdMbmg0MXg0MFlOR1p4N0pYZVF2N29sYS9abVNN?=
 =?utf-8?B?ZGI2WFVKNnh3cTJEbFRESEZwN0FCaDRkTHFxTnZKWmZwbUJod2l4YXpFYk9r?=
 =?utf-8?B?ZjdaT1ZpeVF1clBIMUxUVGtIVmVGRXpaU0FHL1RrUE03dkFnN2NXb3V3cU9u?=
 =?utf-8?B?UVJMT3piL0JwUVJxNDhqR2UweEVTQzVPZ2tBVVZDSmZKNmRWMWllK3NwUDBp?=
 =?utf-8?B?a0FnVURHVU9jNFRBZ3hmRUJRN1oxY2FHalZ4WkJyZThMbUxLaUtMaXRxTlp4?=
 =?utf-8?Q?r8fyQ7jbgGytJ8XQ=3D?=
Content-ID: <A33D172D9E627F448FC5AF60B2A81DDF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e763be08-9574-44f6-a020-08de42932dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:21:42.9530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TfFUebBeeRToRDnxlwFY16+8Ul4i0VaOle5z5bnZEQaHC4j147gs4tuA3a5+LsjB6ZXieCO8x0POT+8vJ1is74XGlGauQkNadOsShN0v3nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_474561093.1502339836"
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

--__=_Part_Boundary_009_474561093.1502339836
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gSW50cm9kdWNlIGRlZmluaXRpb24gb2YgYSBoeWJyaWQgbG9nLWdhbW1hIGVs
ZWN0cm8tb3B0aWNhbCB0cmFuc2Zlcg0KPiBmdW5jdGlvbiBmb3IgMUQgQ3VydmUgY29sb3JvcHMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JvcC5j
IHzCoCAxICsNCj4gwqBpbmNsdWRlL2RybS9kcm1fY29sb3JvcC5owqDCoMKgwqAgfCAxMCArKysr
KysrKysrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NvbG9yb3AuYw0KPiBpbmRleCBmYWZlNDViOTNmZjguLmExOWUwM2ZiOWM3YyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCj4gQEAgLTc5LDYgKzc5LDcgQEAgc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdA0KPiBjb2xvcm9wX2N1cnZlXzFkX3R5cGVfbmFtZXNbXSA9IHsNCj4gwqDC
oMKgwqDCoMKgwqAgW0RSTV9DT0xPUk9QXzFEX0NVUlZFX0JUMjAyMF9PRVRGXSA9ICJCVC4yMDIw
IE9FVEYiLA0KPiDCoMKgwqDCoMKgwqDCoCBbRFJNX0NPTE9ST1BfMURfQ1VSVkVfR0FNTUEyMl0g
PSAiR2FtbWEgMi4yIiwNCj4gwqDCoMKgwqDCoMKgwqAgW0RSTV9DT0xPUk9QXzFEX0NVUlZFX0dB
TU1BMjJfSU5WXSA9ICJHYW1tYSAyLjIgSW52ZXJzZSIsDQo+ICvCoMKgwqDCoMKgwqAgW0RSTV9D
T0xPUk9QXzFEX0NVUlZFX0hMR19FT1RGXSA9ICJITEciLA0KPiDCoH07DQo+IA0KPiDCoHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0DQo+IGRybV9jb2xvcm9wX2x1dDFkX2lu
dGVycG9sYXRpb25fbGlzdFtdID0gew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yb3AuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmgNCj4gaW5kZXggZWU2NDU0YjA4YjJk
Li44ZWM5ODUyMTYwN2QgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yb3AuaA0KPiBAQCAtMTI2LDYgKzEyNiwxNiBA
QCBlbnVtIGRybV9jb2xvcm9wX2N1cnZlXzFkX3R5cGUgew0KPiDCoMKgwqDCoMKgwqDCoMKgICog
VGhlIGludmVyc2Ugb2YgJkRSTV9DT0xPUk9QXzFEX0NVUlZFX0dBTU1BMjINCj4gwqDCoMKgwqDC
oMKgwqDCoCAqLw0KPiDCoMKgwqDCoMKgwqDCoCBEUk1fQ09MT1JPUF8xRF9DVVJWRV9HQU1NQTIy
X0lOViwNCj4gKw0KPiArwqDCoMKgwqDCoMKgIC8qKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBARFJN
X0NPTE9ST1BfMURfQ1VSVkVfSExHX0VPVEY6DQo+ICvCoMKgwqDCoMKgwqDCoCAqDQo+ICvCoMKg
wqDCoMKgwqDCoCAqIGVudW0gc3RyaW5nICJITEciDQo+ICvCoMKgwqDCoMKgwqDCoCAqDQo+ICvC
oMKgwqDCoMKgwqDCoCAqIEh5YnJpZCBsb2ctZ2FtbWEgdHJhbnNmZXIgZnVuY3Rpb24uDQo+ICvC
oMKgwqDCoMKgwqDCoCAqLw0KPiArwqDCoMKgwqDCoMKgIERSTV9DT0xPUk9QXzFEX0NVUlZFX0hM
R19FT1RGLA0KPiArDQo+IMKgwqDCoMKgwqDCoMKgIC8qKg0KPiDCoMKgwqDCoMKgwqDCoMKgICog
QERSTV9DT0xPUk9QXzFEX0NVUlZFX0NPVU5UOg0KPiDCoMKgwqDCoMKgwqDCoMKgICoNCj4gDQo+
IC0tDQo+IDIuNTEuMA0KPiANCj4gDQoNClJldmlld2VkLWJ5OiBNYWNwYXVsIExpbiA8bWFjcGF1
bC5saW5AbWVkaWF0ZWsuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpNYWNwYXVsIExpbg0K

--__=_Part_Boundary_009_474561093.1502339836
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMjMmIzMyO2F0
JiMzMjsxNjo0NCYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0ludHJvZHVjZSYjMzI7ZGVmaW5pdGlv
biYjMzI7b2YmIzMyO2EmIzMyO2h5YnJpZCYjMzI7bG9nLWdhbW1hJiMzMjtlbGVjdHJvLW9wdGlj
YWwmIzMyO3RyYW5zZmVyDQomZ3Q7JiMzMjtmdW5jdGlvbiYjMzI7Zm9yJiMzMjsxRCYjMzI7Q3Vy
dmUmIzMyO2NvbG9yb3BzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7
TiYjMjM3O2NvbGFzJiMzMjtGLiYjMzI7Ui4mIzMyO0EuJiMzMjtQcmFkbyYjMzI7Jmx0O25mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzE2MDtkcml2
ZXJzL2dwdS9kcm0vZHJtX2NvbG9yb3AuYyYjMzI7fCYjMTYwOyYjMzI7MSYjMzI7Kw0KJmd0OyYj
MzI7JiMxNjA7aW5jbHVkZS9kcm0vZHJtX2NvbG9yb3AuaCYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMzI7fCYjMzI7MTAmIzMyOysrKysrKysrKysNCiZndDsmIzMyOyYjMTYwOzImIzMyO2ZpbGVz
JiMzMjtjaGFuZ2VkLCYjMzI7MTEmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYj
MzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCiZn
dDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCiZndDsmIzMyO2luZGV4JiMz
MjtmYWZlNDViOTNmZjguLmExOWUwM2ZiOWM3YyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMy
O2EvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NvbG9yb3AuYw0KJmd0OyYjMzI7QEAmIzMyOy03OSw2JiMzMjsrNzks
NyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO2NoYXImIzMyOyomIzMyO2NvbnN0DQom
Z3Q7JiMzMjtjb2xvcm9wX2N1cnZlXzFkX3R5cGVfbmFtZXNbXSYjMzI7PSYjMzI7ew0KJmd0OyYj
MzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtbRFJNX0NP
TE9ST1BfMURfQ1VSVkVfQlQyMDIwX09FVEZdJiMzMjs9JiMzMjsmcXVvdDtCVC4yMDIwJiMzMjtP
RVRGJnF1b3Q7LA0KJmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMzMjtbRFJNX0NPTE9ST1BfMURfQ1VSVkVfR0FNTUEyMl0mIzMyOz0mIzMyOyZxdW90
O0dhbW1hJiMzMjsyLjImcXVvdDssDQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzMyO1tEUk1fQ09MT1JPUF8xRF9DVVJWRV9HQU1NQTIyX0lOVl0m
IzMyOz0mIzMyOyZxdW90O0dhbW1hJiMzMjsyLjImIzMyO0ludmVyc2UmcXVvdDssDQomZ3Q7JiMz
MjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtbRFJNX0NPTE9ST1Bf
MURfQ1VSVkVfSExHX0VPVEZdJiMzMjs9JiMzMjsmcXVvdDtITEcmcXVvdDssDQomZ3Q7JiMzMjsm
IzE2MDt9Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzE2MDtzdGF0aWMmIzMyO2NvbnN0JiMzMjtz
dHJ1Y3QmIzMyO2RybV9wcm9wX2VudW1fbGlzdA0KJmd0OyYjMzI7ZHJtX2NvbG9yb3BfbHV0MWRf
aW50ZXJwb2xhdGlvbl9saXN0W10mIzMyOz0mIzMyO3sNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL2luY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmgmIzMyO2IvaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yb3AuaA0KJmd0OyYjMzI7aW5kZXgmIzMyO2VlNjQ1NGIwOGIyZC4uOGVjOTg1MjE2MDdkJiMz
MjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9pbmNsdWRlL2RybS9kcm1fY29sb3JvcC5oDQom
Z3Q7JiMzMjsrKysmIzMyO2IvaW5jbHVkZS9kcm0vZHJtX2NvbG9yb3AuaA0KJmd0OyYjMzI7QEAm
IzMyOy0xMjYsNiYjMzI7KzEyNiwxNiYjMzI7QEAmIzMyO2VudW0mIzMyO2RybV9jb2xvcm9wX2N1
cnZlXzFkX3R5cGUmIzMyO3sNCiZndDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7KiYjMzI7VGhlJiMzMjtpbnZlcnNlJiMzMjtvZiYjMzI7
JmFtcDtEUk1fQ09MT1JPUF8xRF9DVVJWRV9HQU1NQTIyDQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyovDQomZ3Q7JiMzMjsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO0RSTV9DT0xPUk9QXzFE
X0NVUlZFX0dBTU1BMjJfSU5WLA0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7LyoqDQomZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsqJiMzMjtARFJNX0NPTE9ST1BfMURfQ1VS
VkVfSExHX0VPVEY6DQomZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMzMjsqDQomZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMzMjsqJiMzMjtlbnVtJiMzMjtzdHJpbmcmIzMyOyZxdW90O0hMRyZxdW90
Ow0KJmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7Kg0KJmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMzI7KiYjMzI7SHlicmlkJiMzMjtsb2ctZ2FtbWEmIzMyO3RyYW5zZmVyJiMzMjtmdW5jdGlv
bi4NCiZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzMyOyovDQomZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMz
MjtEUk1fQ09MT1JPUF8xRF9DVVJWRV9ITEdfRU9URiwNCiZndDsmIzMyOysNCiZndDsmIzMyOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7LyoqDQomZ3Q7JiMz
MjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyom
IzMyO0BEUk1fQ09MT1JPUF8xRF9DVVJWRV9DT1VOVDoNCiZndDsmIzMyOyYjMTYwOyYjMTYwOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Kg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjstLQ0KJmd0OyYjMzI7Mi41MS4wDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KDQpSZXZpZXdl
ZC1ieTomIzMyO01hY3BhdWwmIzMyO0xpbiYjMzI7Jmx0O21hY3BhdWwubGluQG1lZGlhdGVrLmNv
bSZndDsNCg0KQmVzdCYjMzI7cmVnYXJkcywNCk1hY3BhdWwmIzMyO0xpbg0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_009_474561093.1502339836--

