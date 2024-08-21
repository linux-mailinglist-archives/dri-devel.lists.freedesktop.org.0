Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF7959362
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 05:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD83F10E4EE;
	Wed, 21 Aug 2024 03:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="C3B7aLls";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SBYFgWRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD47910E4EE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 03:44:10 +0000 (UTC)
X-UUID: 9c89e0525f6f11ef8b96093e013ec31c-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=xFXIS2p45hG0PWRzC9GJUfdxgWPb2akocKE1Pz/8ZUw=; 
 b=C3B7aLlsIp6f49bzivS6radVtqR3b/ydO46Csh5Tiv+Zb/F1JoQumlHIN2RJV98gE4w9TZLne+l21lmCpuZJHIkqCKhT/gR8q4swrQE1DC+xJktWPbn0SibDxzq3Pmnda0zdC0apXj9vZFqyers/R/PrJ80J7LCi5/BCGP/x/pQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:85dd45d5-933a-4cc7-afc2-728b54f01da1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:e781aebe-d7af-4351-93aa-42531abf0c7b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9c89e0525f6f11ef8b96093e013ec31c-20240821
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 779597400; Wed, 21 Aug 2024 11:44:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 11:44:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 11:44:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnnS4vKrgP3JCq+qvBOJXHNxpKEfFwWLnFsokDfStQyDPwyu5opDHx1Nm3AxM0JbfB+SYlZXCXMeuEAPTLCJT7NF6S5zNlRHre98js/O3rj8jpk1SHPKf7cruF/DPpS7rfyIohs0CWxCM5rFC/zZEUwP5jQkiVGUqTEI0ylggm8l0rh3dKRsJFkepW3ponchv5Axr1nMCc6bFcBWea6hEVvuxn/4ZfRhSBfp/t0YhRFU7w6QLpMdP9TS1qFOL/VvszPyvCkXU/wuNAX+SN5zB1vL1+DxnAHCf2yyow4k2iajkiq8t6U5rmLZ9C0ALHQmVaw0HUnPGi+NID900LFOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
 b=MxtD/Fi4G1XYB/Qr8cPZZB9et3hqVuLMEvYJAVAIHuiI585OLeRaoUiNwCFC/pYT3fJGtR8dzsqG3SZ9V7D3doaTY5+36Doorf3kUf9eNaEbNNkdDNW6g6+TAKcNMdXdSswQ+TX0xefduTlUKLEqGSohXt+HX3b6bhhWutH2QECGsjM26sOO6YAn5C8MxFESodNMa8kShBYB/63Ki/u/q1gCrCI51ns9ltQUtsCkBXNNBffC5X0NNonWKYJxQigwn2O6E/ULrrapzlv1DKsq9lwaRFtzVwcd82+4vFt0PSQJwXhcydUOz8FpM2HwdOuvL5x6FrxK4RjoblvBRbolGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia/Hqa/lAxB4LCwj21QfIWRe4113el0fV/IiAAa4oiw=;
 b=SBYFgWRjcOwK0d6oM+iQ4O0eCraonQtMxMH3sWVSPld/TQeCha0XBXhsiAhqAeN/HApO1AIjahXuWvp2PswYCU0uM7fYGNCA6dxV1nvfQQF9bMHK6eXnctNI0sT8sj0PeScc+yENaRBxq+UfLtyu4WXPE/qjuWjQalaEyvrHH7E=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6465.apcprd03.prod.outlook.com (2603:1096:101:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 03:44:01 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 03:44:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
Thread-Topic: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
Thread-Index: AQHaZaXYtP+8+9hIl0yZSAvleBI2BbG7SX6AgHbj7QA=
Date: Wed, 21 Aug 2024 03:44:00 +0000
Message-ID: <6f6c2bb63b4d0a2a5efa295b756ccfda5a0f3ac4.camel@mediatek.com>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-11-chunkuang.hu@kernel.org>
 <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
In-Reply-To: <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6465:EE_
x-ms-office365-filtering-correlation-id: 53e171d8-6078-4245-60ad-08dcc1937eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?V0NSYloxN3FiNEo2L3ltdEFSdkxTME5DbldUOWVzaWdmWkVyOFpGalQ4SzdR?=
 =?utf-8?B?cUNBQ2pMVGpqdVhuSnRMTG9zMlhRNWMvY2UvUW5ncXVxQzRlNmZ5TERldFp4?=
 =?utf-8?B?TmlNcHlsMXFhSlNpRjY4SnM3bWJVYlpxeGJEL096R3lpdldSOE92TFhCWU9H?=
 =?utf-8?B?bVNSTG1ocmg5OVdLYkwvbWpYc2YxWjN0dTgrd2tOT3pwUnZ5UFFGNFZuN1NC?=
 =?utf-8?B?SzFZVm5CVEhQallnRTgydXZjQitEbHNLV1RHSWs1bWZnS0FqczJhaDJVL0Qv?=
 =?utf-8?B?L2ZqOCtIRGt4NEhNSGU2WDFDZTBiL2VpblZXb2NOakhHY3dJMkxYcHg1aTRI?=
 =?utf-8?B?YjFGYjlvQzUzR2p0cW04dmNjdWRJZk9WaU5YR2lYdHFadS9KeXdBcS9kc2ti?=
 =?utf-8?B?Y3RmYzQ4TGVZSTV4bS82akh1NWpRc2tRTnY0U3Z5aEpzbVV5MHA1emlhY1pn?=
 =?utf-8?B?TU9ERUlYbmZHQisvVXdXN0pqTFJVT1ZZYXQ1U2RQdXV5Z0Y1c0RQODU1bDhw?=
 =?utf-8?B?T2tPMEtMWXlnYWlFUzFCUFdxNDBXUDVuTkI3QzZSTDhlM1VlTnlOUUtBOER5?=
 =?utf-8?B?cGpONDlUdG5KMXk2Q3N0cHVEV29nbHZGcmwwNk1VYnZEWDNRSXdwQVFRdWdF?=
 =?utf-8?B?Qko3N1hrWWY2ZXdETElyM1luamh2NVRaQmF0UDZubUJvdmorLzdCQW41eHZk?=
 =?utf-8?B?cmJ2ZjAvK3VWakIyd0tHdFFmQm5OeCs2enV0NVA1YUIwb3JqVzM1eWVPVVI5?=
 =?utf-8?B?RXkzSjRyR3lOMnlMczhFVEFQazFwNzFDOExtN3pWWFBtV1IrNFg3Z0oxcy9m?=
 =?utf-8?B?S2JwK1pUanVPOWFjYkRmdmZ4Vi9Vbk5ZcjgrTnMxZTFLZ25SSGJBOXJGY0NG?=
 =?utf-8?B?cVlkNlBTRG12dDFseG5oWWY3M1BmZGFubG03MmhKS2NocWNoWGpiVENJZ2NE?=
 =?utf-8?B?aExVSUZtbzhNQW1pSGtRV0I0WkNocTVFTG9HVXhBcW51OWRMc0NkWnlvQTcw?=
 =?utf-8?B?aEI4YzE5dEtCNSsyN1BRbGRwRDY5amJIMU5ZbDJ3eU4ra2lRYWp6RzdTVGZN?=
 =?utf-8?B?Z2NaWVhPaHlVMHJCcXM0U0g2QkppdGpwUENyY1dPdmU2Wk9ZNW1aS1N1OXFi?=
 =?utf-8?B?Q3M5bm5yTjdkTlVoVW84ZUxmTHdaZ0kxUzU4ZXJDU2VibFYzV3VpK2RDcnpH?=
 =?utf-8?B?T1ZtdXc0NkJXcnQ3dkE0YUREK2JwSXNGUGVOcVhlMFc5NHhHM2JVaUlCN2J3?=
 =?utf-8?B?aXNXVm50MS9KK2hZK3lDNlErQzd6U3dFY3pWaG9abGlmUjl1VCtVcVR1aG5x?=
 =?utf-8?B?ck8zaVk0bGRGVm9JTzZmUVdaWUY2R0h4MDV1ZFI1ZjRqZUJGb0tXRmgxL0p5?=
 =?utf-8?B?VWFpL3ZESUxVVmlndmpwSkwzdUFCa3NOMk80eXo4RjVLdkZ1VkhrOW12Yml3?=
 =?utf-8?B?OS8wWVh5bkRoNTdaL0R2bDZJMmpNdGZZbmFGRGlPWkd1a3JvRXJrUmJMc2dZ?=
 =?utf-8?B?bkZqaEx4N1ZNNFM5dU9kcUpkcHpLQkt4WWdmL0FYK2plZFVUdjg3TTdoZlB5?=
 =?utf-8?B?L0NUUW1vWlorTlZic0gxK2NHaU9CR1VuZWZwUVp2SnYrblVxSU1SeG9TaVY1?=
 =?utf-8?B?N1ZUWW1mQXBRR2NTUDI0QWQycmd4YVh1dmN0d0NFNHp4dGQ4WHBOVDN6U2x0?=
 =?utf-8?B?allqaFI0NndQMlJCZnhORFJHcjVvQWlIOGNjeWZoQmpEVVd2WU83Sk1KTlYz?=
 =?utf-8?B?b1B3cmE3Ti9OZ2JSbTdXd1Flbjh0SkxSVDB2OTFmNzNwL3luYnRFNDR3cDB0?=
 =?utf-8?B?cExtck5tL0hTbFplRVMxYjBCUzBtQ3VvbEFXZXlVTkNwbCtHYzk2aFBiRTFh?=
 =?utf-8?B?RnZqWE1rN3YrUFJGY1JmN1hYY2dBcHVTcnBIVFh6L1BscFNid0ZieE9hTjJY?=
 =?utf-8?Q?yi3/gTypUOg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEhLN0ova0RhR0pzeU5HREtyMGk0MDZVT0hBblA3ZGllS3F3RXd3WEpoc3U0?=
 =?utf-8?B?YXVxVFBrbXZDWTYxSEc0SVg4b2NhOVZPb0FhdlBsMUZJL0RsT0pmZy8xUDIz?=
 =?utf-8?B?M1RMdE9ISjRCYUpxeDA0SHlRZis2eVg4NnZtc08rb3JnQWZ4bjNudWp1VFhv?=
 =?utf-8?B?S1NFeUkwMlE1MWd4cE8rYzF5WDdtZkJDUzQ1Yy83dytzVER3YXdHREZ1ODR1?=
 =?utf-8?B?MURDK1MxOEtFRHVBQ2lYRUlaRHBiaW5ibVFIdkxJdncrVnNzTTJyRnAzRWdM?=
 =?utf-8?B?R0ZIVHppWDMyTFJPalNQeCs3Ym9ma3k5ZWRMcWNOd1U1TE9nZ0xobkpYQ3Vw?=
 =?utf-8?B?QnNDWHIxendEdVhVanVRYy81NmpweTFkMzJraHFtbU1JVlVYdXJQR005eU4y?=
 =?utf-8?B?WkZHWWY3RHFoMXJKUU9XYkl0djU0U2dXTEtWL1NuaHBnNUMwamRVSWdRbSs5?=
 =?utf-8?B?a0p2RDVDbm9UaU51Qmtuc3RIM2UrTTNYbzhyelh6ZldEcWlRNE1GYkQ5bnVq?=
 =?utf-8?B?MnVKc1VXRzRUZk1Ua0NTelNtWEIxNlNyUGxSK2RNYVR0QWw4SkZCSkk2b1Zn?=
 =?utf-8?B?bG5JSjdndkJwV2Nxa2pSNjNVRVBqaHhTbTZWUHZETy9NQXYwOWhKS2RZL0V1?=
 =?utf-8?B?OVlRWU5hei9TS1J2WlQxb2s3VHZySDAvT3V6d1d5cnRRem5RS2c0MnBjUjF6?=
 =?utf-8?B?VnRwQk9WTlltUlV5L3pLU2pha0J4TW16RTNxN0gxQTlla0t0UFNKNmJkUG1T?=
 =?utf-8?B?OVNuN0ViVW1qWmdHMCtCYjhyRThRYnliNXBpQk42QmRCYVNZYzZhL09FVGJD?=
 =?utf-8?B?eVJ3VFE5QTZEN2pNcmdCNUVNYnpRaFZ5QWpGYlg5RWJRc05LS0hTOHE5cng4?=
 =?utf-8?B?YU0wMHZ5cGdnSkdURGxZbFNEZVc1bVRjTDg5WjFKMU9yRkkraXAycEQwYlpT?=
 =?utf-8?B?TnI1YlZnZ3ROWGM1WmlCMVZFUjdwZGJGT3pNTHhsYS9NbzdNTWxrcm1DNElX?=
 =?utf-8?B?YzhEYktYTEsvL1Q3MlNTekx4ZlJzMHJZNnBEUW5ZZUx6cFdqYi9oU0JDb0hn?=
 =?utf-8?B?cXNOR29MdlFJODA4ZFF2NU1rbTA4cnNvd3M4eDkzYWtsU05LQkFVZFJBemth?=
 =?utf-8?B?SG95VGhNWGxyZ3Y0R2d1Y09wazQ0a1JibkQyWVh1ZGNQZWJjaUtzQlphK1NJ?=
 =?utf-8?B?TzFVcytBY05SaTB3N2ZDYjgwUmZzWFBkOG5CcFBKVk1TMHZkdzFFNWErMFZa?=
 =?utf-8?B?OXBZcXBBM0ZQUzIxdHdGY0thTHhyUE1jbk1zeXNYTzdTd05VSnpoZjFFY0hW?=
 =?utf-8?B?ZnptSUtxdi9ITit4R2V3UURZcE1OS29LemNYUHA4aGc5YUM5VjlWSS9SY3h1?=
 =?utf-8?B?a0FsTWJJOUR6VDdwb3J5UGNXaC83TXZhQkhJMmFyanQyOVRkRU5lcy9CN01I?=
 =?utf-8?B?WHVRVlI2cnlNN3JES2IyRGNDdExPS243MlJ2ejU1R1JDcElJTTlQNjdTdjky?=
 =?utf-8?B?Z2oyYi9JZ09FSDVHOUhYUDd5TFl5ZDIwSGhlZk1JQVJWMlpFN3l1UWZQWjU0?=
 =?utf-8?B?ajhvNk5KdXNaQlF5Z1ROMjdqOHVmRlljTVl1K1BmZjhvSzZMbVRwZXhBbDY0?=
 =?utf-8?B?aUM4Y3ZmcjRidGxhL0dzMUN6Z2NrVG1ING5BdjZpNFVESGdHaFJnd0tvd3Rk?=
 =?utf-8?B?Z2ZUeHFkeGRMMGlTdmNTSU5HR3hzYjFZeVFTekU4NjcxbDYzMFRoVUJTd2hY?=
 =?utf-8?B?ZTdsdDVESnplTTBwRlFZSitwWGZMajFiS2Z6NUx2RWM0N0ZmZHIrZkxQMU1w?=
 =?utf-8?B?em5kSjJOam45a1IyMEdNRFg4cFF0UjVmMjFoVVJoZ1VITFFPazhHa2ZYYS9F?=
 =?utf-8?B?dENjUitNMGNMSC83a29UNHFtZk03S2RNUzRvZ0JzVTJEWGQzY3k2MUk4TEY2?=
 =?utf-8?B?SWY5VFFZcWt1NnFxQzIvTmhxNVJNMlI4dmRvMks3ZG1xdlpia21sR0tLL0hE?=
 =?utf-8?B?WUp4SUxHRmJkYi9ScHE5dlhVMFRzaHRncThzM2RDRTg5amxhY1FvQkVzRnE2?=
 =?utf-8?B?bHVkL1hPakdHUzUyVEo2ZHZSOG9yenkxWlpoNTB0dlp4ak41dHlwUVplZTdF?=
 =?utf-8?Q?6X+3Uih/MQMVfLaGec9hGfljf?=
Content-ID: <9AA56D7297E13A4CAE3B12D8C2236F99@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e171d8-6078-4245-60ad-08dcc1937eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 03:44:00.9454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgwFLeXmnEY0Wha6oV4ey1mJbWIYyC6TBVbvQXju6OUZCG8xokXdf6N2iG5XBNWVr2Y+wpTNgYXTnhB0pFCLOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6465
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1835742867.600467276"
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

--__=_Part_Boundary_008_1835742867.600467276
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEJlbmphbWluOg0KDQpPbiBUaHUsIDIwMjQtMDYtMDYgYXQgMTQ6MDkgKzAyMDAsIEJlbmph
bWluIEdhaWduYXJkIHdyb3RlOg0KPiBMZSAyMi8wMi8yMDI0IMOgIDE2OjQxLCBDaHVuLUt1YW5n
IEh1IGEgw6ljcml0IDoNCj4gPiBJbiBvcmRlciB0byBoYXZlIGZpbmUtZ3JhaW5lZCBjb250cm9s
LCB1c2UgY21kcV9wa3RfZW9jKCkgYW5kDQo+ID4gY21kcV9wa3RfanVtcF9yZWwoKSB0byByZXBs
YWNlIGNtZHFfcGt0X2ZpbmFsaXplKCkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jIHwgMyArKy0NCj4g
PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMg
fCAyICsrDQo+ID4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5oIHwgMSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KPiA+IGluZGV4IDZhZGFjODU3YTQ3Ny4u
YjcyMGU2OWIzNDFkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQo+ID4gQEAgLTQ3MSw3ICs0NzEsOCBA
QCBpbnQgbWRwX2NtZHFfc2VuZChzdHJ1Y3QgbWRwX2RldiAqbWRwLCBzdHJ1Y3QgbWRwX2NtZHFf
cGFyYW0gKnBhcmFtKQ0KPiA+ICAgCQlkZXZfZXJyKGRldiwgIm1kcF9wYXRoX2NvbmZpZyBlcnJv
clxuIik7DQo+ID4gICAJCWdvdG8gZXJyX2ZyZWVfcGF0aDsNCj4gPiAgIAl9DQo+ID4gLQljbWRx
X3BrdF9maW5hbGl6ZSgmY21kLT5wa3QpOw0KPiA+ICsJY21kcV9wa3RfZW9jKCZjbWQtPnBrdCk7
DQo+ID4gKwljbWRxX3BrdF9qdW1wX3JlbCgmY21kLT5wa3QsIENNRFFfSU5TVF9TSVpFLCBtZHAt
PmNtZHFfc2hpZnRfcGEpOw0KPiA+ICAgDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IG51bV9jb21w
OyBpKyspDQo+ID4gICAJCW1lbWNweSgmY29tcHNbaV0sIHBhdGgtPmNvbXBzW2ldLmNvbXAsDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGst
bWRwMy1jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5jDQo+ID4gaW5kZXggOTRmNGVkNzg1MjNiLi4yMjE0NzQ0YzkzN2MgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNv
cmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGst
bWRwMy1jb3JlLmMNCj4gPiBAQCAtMjMxLDYgKzIzMSw4IEBAIHN0YXRpYyBpbnQgbWRwX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJCWdvdG8gZXJyX3B1dF9zY3A7
DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gKwltZHAtPmNtZHFfc2hpZnRfcGEgPSBjbWRxX2dldF9z
aGlmdF9wYShtZHAtPmNtZHFfY2x0LT5jaGFuKTsNCj4gPiArDQo+ID4gICAJaW5pdF93YWl0cXVl
dWVfaGVhZCgmbWRwLT5jYWxsYmFja193cSk7DQo+ID4gICAJaWRhX2luaXQoJm1kcC0+bWRwX2lk
YSk7DQo+ID4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbWRwKTsNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUu
aCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmgN
Cj4gPiBpbmRleCA3ZTIxZDIyNmNlYjguLmVkNjFlMGJiNjllZSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5oDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUu
aA0KPiA+IEBAIC04Myw2ICs4Myw3IEBAIHN0cnVjdCBtZHBfZGV2IHsNCj4gPiAgIAl1MzIJCQkJ
CWlkX2NvdW50Ow0KPiA+ICAgCXN0cnVjdCBpZGEJCQkJbWRwX2lkYTsNCj4gPiAgIAlzdHJ1Y3Qg
Y21kcV9jbGllbnQJCQkqY21kcV9jbHQ7DQo+ID4gKwl1OAkJCQkJY21kcV9zaGlmdF9wYTsNCj4g
DQo+IENhbiBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgYmVjYXVzZSB0aGlzIHBh
dGNoIGNhbid0DQo+IGJlIGFwcGxpZWQgb24gbWVkaWFfdHJlZS9tYXN0ZXIgYnJhbmNoLg0KPiBU
aGUgY29kZSBsb29rIGNvcnJlY3QgZm9yIG1lIGJ1dCB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gYXBw
bGllZCBpdA0KPiB0byBwZXJmb3JtIG1vcmUgY2hlY2tzLg0KDQpOZXcgdmVyc2lvbiBoYXMgYmVl
biBzZW50Lg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhL3BhdGNoLzIwMjQwODEwMDkwOTE4Ljc0NTctNC1jaHVua3VhbmcuaHVAa2VybmVsLm9y
Zy8NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEJlbmphbWluDQo+IA0KPiA+
ICAgCXdhaXRfcXVldWVfaGVhZF90CQkJY2FsbGJhY2tfd3E7DQo+ID4gICANCj4gPiAgIAlzdHJ1
Y3QgdjRsMl9kZXZpY2UJCQl2NGwyX2RldjsNCj4gDQo+IA0K

--__=_Part_Boundary_008_1835742867.600467276
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtCZW5qYW1pbjoNCg0KT24mIzMyO1RodSwm
IzMyOzIwMjQtMDYtMDYmIzMyO2F0JiMzMjsxNDowOSYjMzI7KzAyMDAsJiMzMjtCZW5qYW1pbiYj
MzI7R2FpZ25hcmQmIzMyO3dyb3RlOg0KJmd0OyYjMzI7TGUmIzMyOzIyLzAyLzIwMjQmIzMyOyYj
MjI0OyYjMzI7MTY6NDEsJiMzMjtDaHVuLUt1YW5nJiMzMjtIdSYjMzI7YSYjMzI7JiMyMzM7Y3Jp
dCYjMzI7Og0KJmd0OyYjMzI7Jmd0OyYjMzI7SW4mIzMyO29yZGVyJiMzMjt0byYjMzI7aGF2ZSYj
MzI7ZmluZS1ncmFpbmVkJiMzMjtjb250cm9sLCYjMzI7dXNlJiMzMjtjbWRxX3BrdF9lb2MoKSYj
MzI7YW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjbWRxX3BrdF9qdW1wX3JlbCgpJiMzMjt0byYjMzI7
cmVwbGFjZSYjMzI7Y21kcV9wa3RfZmluYWxpemUoKS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0NodW4tS3VhbmcmIzMyO0h1JiMzMjsm
bHQ7Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmcmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZn
dDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L21kcDMvbXRrLW1kcDMtY21kcS5jJiMzMjt8JiMzMjszJiMzMjsrKy0NCiZndDsmIzMyOyZndDsm
IzMyOyYjMzI7JiMzMjtkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5jJiMzMjt8JiMzMjsyJiMzMjsrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMy
O2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmgmIzMy
O3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjszJiMzMjtmaWxlcyYj
MzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2luc2VydGlvbnMoKyksJiMzMjsxJiMzMjtkZWxldGlvbigt
KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5j
JiMzMjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRx
LmMNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjs2YWRhYzg1N2E0NzcuLmI3MjBlNjliMzQx
ZCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7
KysrJiMzMjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1j
bWRxLmMNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNDcxLDcmIzMyOys0NzEsOCYjMzI7QEAm
IzMyO2ludCYjMzI7bWRwX2NtZHFfc2VuZChzdHJ1Y3QmIzMyO21kcF9kZXYmIzMyOyptZHAsJiMz
MjtzdHJ1Y3QmIzMyO21kcF9jbWRxX3BhcmFtJiMzMjsqcGFyYW0pDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7ZGV2X2VycihkZXYsJiMzMjsmcXVvdDttZHBfcGF0aF9jb25maWcmIzMyO2Vy
cm9yJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtnb3RvJiMzMjtl
cnJfZnJlZV9wYXRoOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOyZn
dDsmIzMyOy1jbWRxX3BrdF9maW5hbGl6ZSgmYW1wO2NtZC0mZ3Q7cGt0KTsNCiZndDsmIzMyOyZn
dDsmIzMyOytjbWRxX3BrdF9lb2MoJmFtcDtjbWQtJmd0O3BrdCk7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsrY21kcV9wa3RfanVtcF9yZWwoJmFtcDtjbWQtJmd0O3BrdCwmIzMyO0NNRFFfSU5TVF9TSVpF
LCYjMzI7bWRwLSZndDtjbWRxX3NoaWZ0X3BhKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtmb3ImIzMyOyhpJiMzMjs9JiMzMjswOyYj
MzI7aSYjMzI7Jmx0OyYjMzI7bnVtX2NvbXA7JiMzMjtpKyspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzMyOyYjMzI7bWVtY3B5KCZhbXA7Y29tcHNbaV0sJiMzMjtwYXRoLSZndDtjb21wc1tpXS5jb21w
LA0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYyYjMzI7Yi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtpbmRleCYjMzI7OTRmNGVkNzg1MjNiLi4yMjE0NzQ0YzkzN2MmIzMyOzEwMDY0NA0KJmd0OyYj
MzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tdGstbWRwMy1jb3JlLmMNCiZndDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtAQCYjMzI7LTIzMSw2JiMzMjsrMjMxLDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYj
MzI7bWRwX3Byb2JlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7JiMzMjtnb3RvJiMzMjtlcnJfcHV0X3NjcDsNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrbWRwLSZndDtjbWRxX3NoaWZ0X3BhJiMzMjs9JiMzMjtjbWRxX2dldF9zaGlm
dF9wYShtZHAtJmd0O2NtZHFfY2x0LSZndDtjaGFuKTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZn
dDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtpbml0X3dhaXRxdWV1ZV9oZWFkKCZhbXA7bWRwLSZn
dDtjYWxsYmFja193cSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7aWRhX2luaXQoJmFt
cDttZHAtJmd0O21kcF9pZGEpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3BsYXRmb3Jt
X3NldF9kcnZkYXRhKHBkZXYsJiMzMjttZHApOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAz
LWNvcmUuaCYjMzI7Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY29yZS5oDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7N2UyMWQyMjZjZWI4Li5lZDYx
ZTBiYjY5ZWUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmgNCiZndDsmIzMyOyZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRr
LW1kcDMtY29yZS5oDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTgzLDYmIzMyOys4Myw3JiMz
MjtAQCYjMzI7c3RydWN0JiMzMjttZHBfZGV2JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
OyYjMzI7dTMyaWRfY291bnQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMz
MjtpZGFtZHBfaWRhOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7Y21k
cV9jbGllbnQqY21kcV9jbHQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdThjbWRxX3NoaWZ0X3BhOw0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtDYW4mIzMyO3NlbmQmIzMyO2EmIzMyO25ldyYjMzI7dmVyc2lv
biYjMzI7b2YmIzMyO3RoaXMmIzMyO3NlcmllcyYjMzI7YmVjYXVzZSYjMzI7dGhpcyYjMzI7cGF0
Y2gmIzMyO2NhbiYjMzk7dA0KJmd0OyYjMzI7YmUmIzMyO2FwcGxpZWQmIzMyO29uJiMzMjttZWRp
YV90cmVlL21hc3RlciYjMzI7YnJhbmNoLg0KJmd0OyYjMzI7VGhlJiMzMjtjb2RlJiMzMjtsb29r
JiMzMjtjb3JyZWN0JiMzMjtmb3ImIzMyO21lJiMzMjtidXQmIzMyO3dlJiMzMjtuZWVkJiMzMjt0
byYjMzI7YmUmIzMyO2FibGUmIzMyO3RvJiMzMjthcHBsaWVkJiMzMjtpdA0KJmd0OyYjMzI7dG8m
IzMyO3BlcmZvcm0mIzMyO21vcmUmIzMyO2NoZWNrcy4NCg0KTmV3JiMzMjt2ZXJzaW9uJiMzMjto
YXMmIzMyO2JlZW4mIzMyO3NlbnQuDQoNClsxXSYjMzI7aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL3BhdGNoLzIwMjQwODEwMDkwOTE4Ljc0NTctNC1jaHVu
a3VhbmcuaHVAa2VybmVsLm9yZy8NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYj
MzI7UmVnYXJkcywNCiZndDsmIzMyO0JlbmphbWluDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyOyYjMzI7JiMzMjt3YWl0X3F1ZXVlX2hlYWRfdGNhbGxiYWNrX3dxOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
djRsMl9kZXZpY2V2NGwyX2RldjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9w
PjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRl
IGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48
IS0tfS0tPg==

--__=_Part_Boundary_008_1835742867.600467276--

