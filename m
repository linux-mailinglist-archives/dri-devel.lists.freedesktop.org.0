Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAy8CkJWhGlb2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:35:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9DEFF25
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F8A10E7F4;
	Thu,  5 Feb 2026 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="byBe+FYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1010E7F4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 08:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/bR+vR0x/3BLj1zaepAuaBdZeBrFCkrIvdTE1CT+hdoK2qJR3au2Q7fEkNB+L/QqkNXjLmgbjyYeC3B2MWfmNMGMSQPbwzHSw+sibENUE2vfcthwowOx73JjgNnMyf5Gr1hqeozj7h7LsWQywxSYbucMjJBMTwEd/PHZiAL4fKisOw1SR1rP1L/DqYzT1BwBZxzfB9DJ7SilySCQUMyHr6o/JagtSMHdoZZVDE1E4MKq8Jj8DtX8nkuh9m22DGgSg8iB39pH8cHLzHiTKF3+HZYULWRTRN1/3O75Q6oU2DO2MPL0GEFLF3UoBi/X7RhdZyHQi5pRre5WAq7PYnTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giFs5nvQECkFN5rOZG2BQ8g5zyfL7hkOkVo41toQ5FY=;
 b=vDXvsITFL0txT78HzhKgEjEZIWILQRtet7ThFbrMG/3XXSTYK1hskMF5xsQL9qjfa6dP6FgV07eBSHARBP/Kv81tp+dEOjnbNxpSvKSyR+kz1DTWEHSUA36CqFPbvWAed17mIXZqP1lKWlMddLheIpET1MqzUVXhGMycXerInZtgHukSfoxFuSZ8S7amM0SRgPpj4MHe0OvIATFVmCjGi+HAvy0nTC15fYE2lqodn/00jgVqOpSfgMCB8f68xqiZXBbqDHujp8k99sLJbqyfubQsFPo6Exz2ZTw0GqG07GidxYW5/5/PFR1eRv8dr5e8JABJ7uiAuwnYkColBJiOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giFs5nvQECkFN5rOZG2BQ8g5zyfL7hkOkVo41toQ5FY=;
 b=byBe+FYj1+olDaKLO98lGRQ44lf5CfIeSqNlbKEqetuAEGiUYArkF1mmX0CV9w1ryqqn6XoWqYYq51fn0s+pjx62R5hmFv9kEaKVEr3AXMzBD+i4jCIgj1x0+R/MLOHICoSH1s+fbPgHT1941E3EB+X6s0rHUiUMLbb4gPi0R4XJ98muTuBbh0Zg/xNfrYVfKl2ppscG0F4VFDa3SYOn8udzQ92DZFQRRpZ7fjH94iLWmkcVe4wacHck1AkAIL/o6vYHqAgIxDb11ZqkyoNciZbFQNoUl7NmgC7jCDch/VvVwVgHNU/AKGLOnnOpaGmfh8boo4qoiEmtUk5lEAxGzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 08:35:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.014; Thu, 5 Feb 2026
 08:35:06 +0000
Message-ID: <82416e30-9b73-4a60-81df-27b823246f39@nxp.com>
Date: Thu, 5 Feb 2026 16:35:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: imx8mp-hdmi-pai: enable PM runtime
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260130080910.3532724-1-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260130080910.3532724-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cee58c9-15d5-4689-04b3-08de6491767e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmZ2K3VBWkZUNUNUdmsyK2xxN3hqZTZkVENGZE5BdW9hejBYK0hmdUtxa09r?=
 =?utf-8?B?VTFYMnhvL0tSMVB1Q0lKNFlwV3cxY2xOdVpQdWJVNUxoYWN0RUQyWDZyQVZ2?=
 =?utf-8?B?QXFuK0FWS2ZNWHpoY2htd2EwMGN1L2VNWi9HWmxoampNNkp2OG1sY3F4c2Mv?=
 =?utf-8?B?NmhEL1VrSHkzU3ZTNXdtR1VkTytaZkJyaDJzS1dIeC81QVRKSVk4TldNSklB?=
 =?utf-8?B?ZlFOdEZTOXhQenFBaURBdnhueS9DNU15SHpCNi8wQ09YL0ZOUEkyTVdKRFc0?=
 =?utf-8?B?NkdHaGFMRkltMHJBZ1pHYWVhOWphQlJvZHN2OXpURDRQMmtDQUQwZU9FSy85?=
 =?utf-8?B?QnVjdnh1M3VNWVRCcHEyT0V2Qk1nTEFmbmRpSVlEcmV1R0tlRGdsVW9EQ0hy?=
 =?utf-8?B?WXRtQ29tZk9QQ0xvdjZnMWhFR0ZmVE1IeGhoSjZMVEE5WmdkSjg4cUJ3UGFW?=
 =?utf-8?B?UGdUak9xMjdaV1o4UFZrT1FXbnNPbVlDVS9OSGR0OCtqSVRmSWp1NllmYlBs?=
 =?utf-8?B?UURhSFhMWENQTFJJRzJFWFdaSEFMY0hHV3B5RW9FZ0NjT21LcGpsOW1RcjYy?=
 =?utf-8?B?UDBVUXJnU0Fnd1lLV2VDODNYTGdzN0VoRnZ4aTJpc3JpMGNKdHFwOFJjRHRr?=
 =?utf-8?B?TWpleGs4TXNrMUpnM2YzYldRNFZld3RsamNxU3E4MkF6cUI4UFNCdlZscnVn?=
 =?utf-8?B?L1dENFQ2dVZaVlZncFZLSVFOVTZ5S1grdkU2R25ES0RHdVN3aDNOSVV6S3oy?=
 =?utf-8?B?bDc5bU1CSHFacE5uSWwyd0tnZTk2UkVIeHgyU2Y0cXlEeStRa1RvVmZORGxG?=
 =?utf-8?B?UXZGdFVCcU1zYnFjS2x3Zlo4MEpsaGc1TlZlaVU0NzlEczRxT3dJcUpCTklI?=
 =?utf-8?B?dU5RcUlXZXlZWFpyRFkyNHpFNnRIL2JYaGdGaEY1d3EvVjZqVkVVTWROaisv?=
 =?utf-8?B?ZVpJUGZjbkZmSXduWmN2ZnB2VXJCZ0Q5eFZhcHoxb2p0ZkJ2YTdpcC80QmNP?=
 =?utf-8?B?M2VCN2lOcXVocFhiMmJlK051WjRXMGNHNFB0ZjVKOHYwLzIycFJ4S2txTFoy?=
 =?utf-8?B?U09NVVFvUDNmU3NhOVJWQXNzWDlydy9tZ0JwNW5kN3REbittbjVYVmRaUmFT?=
 =?utf-8?B?cGlFc1B0TGpZNnAzQ2tkTzE3emxncUN6YnpWTWxuNWtEK1FLcFhlUWlDamRH?=
 =?utf-8?B?aWM0Ull6SWg4V1BvempQRHhRR2ZwbWRKTENaZlExekk3SU5ibWxvVWI1V3ZS?=
 =?utf-8?B?amJES1gzSUlRQzJwdG1wZ3ZBYllFTWJyV2oxZEtBUE1KWW5PaFI3a3YzOTB4?=
 =?utf-8?B?dlNnT2xsbGVBV1dhRUFKSWw0QUlHTy8xT2VuMnhvbmRpSkI0czZqeHNhMWV2?=
 =?utf-8?B?em84V2xTYTgvY25PYlRxMWd3ZDBKTUcxSkliODNESVhYMGhNZmF0dm1SY0RS?=
 =?utf-8?B?MnhMQ2dQUndtNWJoNzg5NnlvQ3lJdFNmUTVraDVxYno3RW5TOFBuN0dVZEZ3?=
 =?utf-8?B?UVdyaEZlZitNcXBGaWxySTd4aHNYS2VSRkRZcEVSTGFrNUdGZ1pSMDlrR1Z5?=
 =?utf-8?B?UktUL0EwSFVwTThVcSthRHZMM3lCejh2TUZrRVJlVjJLVGJ5RkwzOUhGeVdQ?=
 =?utf-8?B?NER0RllJdkVvbUdYMmVtMVVrbU12WURCUnJsenFoaDZhTFVHeXQzcGxtOFNQ?=
 =?utf-8?B?SnJpYkU4MWpQN0xKRUkrZ1lnbU9MWGlFTnNWTDZLWjl6WDBEMWFFZ0VTbmk5?=
 =?utf-8?B?NE9sZm5sTWRQeW5CK1hnb291R0JFdFJJRi9KZm5yakhGdHVCaG1GR25zT2Qy?=
 =?utf-8?B?V2k1RnhiRVRFQ0lQN1F2dTlqOTBVZVdtZkZoSkVpMFFYWERUSHBPbXZKb3N2?=
 =?utf-8?B?S2JFM1NVeWQ1bitDejA0WEQ2T0h6NTZYTnorbUFZc09GMEx0blNGaXZNLzFu?=
 =?utf-8?B?M0lBL2Jrd3Z4aW9ta1lFOGlQQ041TmR0NXFiTXQ2T2J1a1AyZFVHREZxMDV5?=
 =?utf-8?B?ZmNVKy91NDBXcmVBdE1qcWRWdWNFaXQ2c2prOWpTTzUwdUlITks5bjRHWGlB?=
 =?utf-8?B?RUFIcjlsemVVTlpYUUY4Z2NNQ3Jqa0JueWlLb1lCK1JrK09Md0FmcEgrWTRG?=
 =?utf-8?B?NEM4K2JyZkNyMDhEZlhsK3c5ZlNCN3k2cXd5ekd2ZjE4aEt1dy9yV2c0UytD?=
 =?utf-8?B?SlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkkyTXQ3UFVybXNJVzJaL0F6S2JuV2l1VkRpK2tYZDdOeDBWdW5tQkY1WWRs?=
 =?utf-8?B?dEhaRi9xTVYxcGRhSnIwRDd5NmZpalEycE5IeWhDY1VvQWltemh2VUJMaytk?=
 =?utf-8?B?ZFdXWndTbnBqVktwVC9YaWxGNjNqV25SQ3Njek84SEJqSk96MkhIRlFyQitD?=
 =?utf-8?B?LzB1ZUNjbVBzdmhVTVlVRkdOZnBKV28vVU1OaHUxbDRVWVluck1sa2M1OXE0?=
 =?utf-8?B?bWZ2TDM5SW5LamFhSGtSbkdhcmdXZTVYSDZ1cllqUjN1M1F0NzdLZ3Z6alRN?=
 =?utf-8?B?S1AreDUwQ2xWRFlJNGtXb2pKN09lVlpkR1VZMk04WHZRWmtuc0ZJZWlGVnRC?=
 =?utf-8?B?VWNxdVFiYms4RGZodWdVeCtqd2tCU3EzNk9oR2tEWlBaSklWYTlFUlV6aE5D?=
 =?utf-8?B?RlE5MGVTQkxzR0lSQ3pMRXJVT3dXVkkyUkZMbkxmY0tzOGJBU2J1c2tPVkRv?=
 =?utf-8?B?eStRWWEyM0toYUw1cVB6RFhHZVcvelFnMnU1bnQ1SlNHZmdSRUtvWVpXV0tO?=
 =?utf-8?B?bU1Xd0ZkYjJydG93R0V2M0RrWDlJWU1wTHJmeGx5M1g4ZzdtZkxnK1BZOW1r?=
 =?utf-8?B?dUlFd0k0VVVSVGpJbUNkUHNPNThDalhqUUVDdU03ZjY4QTZrZUpmK2UrYk5I?=
 =?utf-8?B?UkV4SUh5bU8zdWZpRG4rMVowbld1TjdRZVdZWjlEb0pzV00rNkIwQzdUUDE2?=
 =?utf-8?B?TFJhM3h2Y2NldWJ2T3RkQ3lCNlRKNXlkWlRsVE5iWi84Mkt1U2FIQW42eUpI?=
 =?utf-8?B?Z2tqajJvUndyanJORnlRcXpGdE9RQWFDdzhjdnFIdFdBamczTFZzVC9TaWtM?=
 =?utf-8?B?U00zNWx3RGdxbjFpL2tSUkNaUG9ZL0RKcUw5SUFLTGttZmg0ajZYQ29EaTFI?=
 =?utf-8?B?eSsralZZM3daVi9CN1FERUxnRmZFL1dmMTN5OVNqNzZyVXV4M3RrSTZPY0ty?=
 =?utf-8?B?clhyL3J0ZE9LRUprVndmRTg1UHhaTDRIZ1pDMWgwdUoySzFVbHVhTGhkRnRt?=
 =?utf-8?B?Y1hkZXlFTmhPdjg4VjBFWWZOMEV1SVVUTUxSUVloakwwb01PNEl4L2tlVFEw?=
 =?utf-8?B?V1pqYkhlRnNvVFhBdzR0MjJLQlU1cHIwMGNKMncvUFlPKzFRdGxXellXUkp2?=
 =?utf-8?B?Snl6L1VWWFZKU0JiaDR3NXVlMFBvV2pUWU5BYXhnc01IcnJXUHpSMTBtN1Uw?=
 =?utf-8?B?YzlROGNLRCtHUnc1RVFYOFBXOGpLOVF4T25SMFViYTlMMnVTNmF1QUk2VlJo?=
 =?utf-8?B?T05salA0c0tpUlFuazg3ZXg1OUs1MUhib2hzS0owVkFKK1ZySGdlNUV6TnY3?=
 =?utf-8?B?VnZXUm51UWRYQXhZY1U0eWY2OTUrZTJScFBMUUUyMUFjcUYxejROaFhyVVZv?=
 =?utf-8?B?U3VrZnE4b0VVdEpJaTFiKytxdnlmcUFZa0xxR0VldytaY2J0UnM3LzRCem52?=
 =?utf-8?B?ekswdURSM0t3VUlTZTU1UXVEQ1RUck1ZcDdkS2JHNHgwK2hhbUVFODJERFhM?=
 =?utf-8?B?d0dHdFI5RERVd3BRaVl0UVRtd2NxTmNiN3lxdW80V0xmZ0MzVmsrNGdKMGtR?=
 =?utf-8?B?M0w5eGg5dFczK0VwSUMzdHYrZkVkM1FOZ0tWR0JCY1IxaUxEWDlhOCtNY0hs?=
 =?utf-8?B?WUVDMWV0a1E5YUVIR3J5eWlYT0JheTVpdEYvYUc4amtoV3ZJT0tKNllDZWVR?=
 =?utf-8?B?NjRPelQ3NTAzLysySU1OcEIrM2JYV0JDSW80dC9NbmhOU1pXdE5NbmpsNmYx?=
 =?utf-8?B?WmN1Q3BFaW1kdzZsMTFjZmhQOEdvS1pKNnJQREZYandnZENYcjRYSmFTclQv?=
 =?utf-8?B?M0FXQlQvc2prcjdQSmcxVFFtQm43cEhsZWtSTjEvay9yaytKeThBaXd6L2N5?=
 =?utf-8?B?VTI2U1JHZTVNVjUxTGtXQ0VyYWZjaGwzZTBZdWVob2VMR0p0Q1ZvMkRBNG1k?=
 =?utf-8?B?UFkwOWxYWWszSjljNlB2UmplNWJ2U3lmUWNpSHUwbmZSZzhVbW0yZk1GMDNE?=
 =?utf-8?B?WjFpYUk4ejhhcUdlTWpwbnlDZHZyTDR1b3EyUTUxdXQ1TlE4MTFYZFdIU0JR?=
 =?utf-8?B?cGZQcjlrZjdveUo1QzI4NXF4YXJqZ1EwMWY2VnViUmdzSHBVQktzbFh3dU5Q?=
 =?utf-8?B?UFBDQWZyNTRicVdGbVJBVzdoYjJIQ0xpWlVPdWhWcG1FNzhaSVBZNDI3ZFh0?=
 =?utf-8?B?bFZnV0NRMjVMRGxOeno0REt5bW8yZzNzQUJDdnc0djNnUm93ZWF2eFRUaStC?=
 =?utf-8?B?LzlFZVhrNFdla3cwbGJaSHlNb3pDT2FFOFA0b0xhWDkvU2JsMUhiMjRTaWRV?=
 =?utf-8?B?M3RzZ3IySkk5bUN6bEczeXV5NXBOZHlrNWFOY0diWWc1Y3NXamVwdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cee58c9-15d5-4689-04b3-08de6491767e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:35:05.9016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbvEb1yXWzJ/p46FEvLn0IbosBQkLoNKfifVbldnv0tl+QVV76LPy7g9A0r/Nyjc+JodAAA2ctMGfY9EKr5zJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8AE9DEFF25
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:09:10PM +0800, Shengjiu Wang wrote:
> There is an audio channel shift issue with multi channel case - the
> channel order is correct for the first run, but the channel order is
> shifted for the second run. The fix method is to reset the PAI interface
> at the end of playback.
> 
> The reset can be handled by PM runtime, so enable PM runtime.
> 
> Fixes: 0205fae6327a ("drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - update commit message
> - add fixes tag
> - use pm_runtime_resume_and_get()
> 
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Applied to misc/kernel.git (drm-misc-fixes).  Thanks!

-- 
Regards,
Liu Ying
