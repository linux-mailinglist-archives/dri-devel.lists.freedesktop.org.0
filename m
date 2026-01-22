Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLEVHarncWkONAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887163C61
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A3410E95B;
	Thu, 22 Jan 2026 09:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x0Kt3wAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ADF10E963
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu4u+PD+CHF8g5cIX7/Ds1TI7789/tjJHVjEZoNj6IkA4jjNB0lA9GfODUgeCcII5Q4s9Z1Zg/JGRPLlpsYLeI+HJTQNTGlusu6enX3LA1fBlbPCeK+fER6n/wHI2QNAeNxbxX2ZlDCJ7UflShPqK8b1W9JUg/lTGbDOIUaPEfOZbFrtk5rnUQiV6gU48RInWVd/dtFOHYgr/uE4TtZhFEfHktsEyVjofIC8GOE3dyYriEGOsHtAeN/SHkeXFPUhbVTU9QAnofwtEiMVsbMMZ5jH9vh6af8QaEimUruWEMODXfD1MuurY6RGGA87Boe2F3V1h2O7RStuANSF05t/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rEXvg/Qw5B4zOpe0GKOk4USg2iPGS2KsctpEQBRBGc=;
 b=T2GXBBAKQUeiqIOMH4FWZ6EZu85Tx2e734DUy0HpTY2UQbr/wshtS7C6x/GT3lJG9pxHh40pPBoMh6jEfxi3QquSQxlW1+OKpEw1k3PoOmrokrv4H2hTkDavDGwtPwnOpXzl7kYeWqce568X7XkgnHpcIzgdwGqwwAdXh0FBAsyPXHygd3AuQfNcnPDXfwKkf7fUHgSWhg0lnnZ8X6NMwt9+US64INlMuBi5S3dWh9HvCp/4mVvJs67uSEWryzLdiO1wXCCbM+idM4opHWKakjmbreFgTEcz2/wwVZC3a9LtJ690uGAmMrxiRy8Yxp6ACnZhLHKjrrOAoObEcsy6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rEXvg/Qw5B4zOpe0GKOk4USg2iPGS2KsctpEQBRBGc=;
 b=x0Kt3wAeyLg0paaXl+YuihByeMrHxz0h4/6XneU4eVtyd7l8o2ACk7OJ99Sr3Ri6/hiMDxFze0dsEhKOWzxDeaLun/Fd3gYweOYYJVRldCIfWP+tFMNa5HnLtbZO1MNW3m2CN0xS9lVZPMXt3dPRwnJHeL3jNFGuAezwohmk2zm1JIZnRRUiXtYrS7XbYzDoi++JfsQiNMZW8tvBPY5hKTvGi8hHrrsc9BUdxAlYO1BDgmh6HonN92z+3wHdLeMQxPg7urZJ9JJRI301WufcI9MaLKwcrr4y1l3kW75Bq4/o0l/gM3AA4JRNYvKXC2Y8bSQf0ffjUS/vX+FlCuOTUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by GV1PR04MB11014.eurprd04.prod.outlook.com (2603:10a6:150:208::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:02:25 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:02:25 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
 Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Francesco Valla <francesco@valla.it>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Thu, 22 Jan 2026 09:01:40 +0000
Message-ID: <20260122-dcif-upstreaming-v7-2-19ea17eb046f@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::20) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|GV1PR04MB11014:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b989ee-5f4e-493f-cc39-08de5994f617
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzJ1QlJYNk0wZkF1UE4rOWE4WTFTYnhCR1krUmc2UlM4K0R3Sk9Uckpsajc1?=
 =?utf-8?B?SkRzcXRLbkdNRG1CQzg2T1h4NTRLV3YxeDA5YlpXM0dBbVJIc1IyZG1iVVd1?=
 =?utf-8?B?Si8rRE1HTE9jWlB5NkNkZHg5aGFZS29mQ0JSWE5ONFM3eHg0cjFzdDdzaG5v?=
 =?utf-8?B?Szk5TkxjMStZMGVodVJsTk8wd25mM0FibFhHbEt6MFNLRU1DN2JMTmk4eXZY?=
 =?utf-8?B?aGJSSW5RY3JVNFdJZlVvd1lOSDUyUzFTZVgyaitWa05ON2ZBeHQyNkJldmEz?=
 =?utf-8?B?WllmcitYb3JSS2hwYzIvYlQydzdRVFpqc1BXbkpwcWFWbGZPUzM3K1VlR1Uy?=
 =?utf-8?B?MWZOM1R1UFhQQlU1Y3dPUktjbmZzd2dmM2pjRTVRRit4c3B2eWRWRWJLNy80?=
 =?utf-8?B?bTN2SCtKa1ZZQmNIc0xReDJQdG90bnQyalJVYU5UWURrWTNERDZ4OWtSV3BJ?=
 =?utf-8?B?YndtVjI4eE9rMHBUUzFaSit1bXA1b0QwaHkvVlRCZitHN1ZQd1I1SjJPblFZ?=
 =?utf-8?B?VzFLblRKOURmc1FOYUQvTnByVWVYV2YyK0c3S0NaS1Y5eEtLUEZXV1FBWTFX?=
 =?utf-8?B?YUorOCtiUDN1akVwSkxRZzl0N2pkWlhsdHFMOU1aU2VobGRzaFhsRkF2bTVk?=
 =?utf-8?B?K2Q3NWxta3hpNE5WMlN4TUw5blBYM1V2MlAzRXNsZU1GVDM5MVNlMG9lRys2?=
 =?utf-8?B?SGJWb3dyWmViWDErYVZTNW1FZk5JREtIZnpidXFUVzlkd3VvMlFjc2d1UHFS?=
 =?utf-8?B?ZXlwdWNhYkx4UVBsckEyOE85SUpYOWdNblBaWHdQQ01UYWJyR0V4bWdjVFZO?=
 =?utf-8?B?YkVrSURtdEEydW5WTGw3QmFOcitSNUt0Tzl1NEc4M0plazNUMkxBaGN0NGl2?=
 =?utf-8?B?NGRObHFodDJLZk81UXhhL3BCT3Q0QW95M3pOV2RaM0ZYSVN1SmVFenNBcisv?=
 =?utf-8?B?MXdHZnZSV3VvRnlsekpDWmEwQno0TXN4UVBvQTFjenVhaVAwZitvOUpmMWcy?=
 =?utf-8?B?WXo1UlhSMzN1aC9IWk12VHMzUFp5aWZGRTB3QjExd3pML2FUdmg2b1ZaaUVD?=
 =?utf-8?B?NXJXVUpxL2Q4VnNpaVBTdWQ1NkJrdXREZjNKN1JsbFFpTnc4aXVpVXJrU2Vv?=
 =?utf-8?B?U3BDcHVlaFIwamk5Zk5qQSt1NDZpUUxuMHVNVkw4WnQyR3gyMFZyMzZyYzZ4?=
 =?utf-8?B?UXRFN3Y2b2twWmRzYmt4aDBUbWZrSE9WQnB0cnFZSGJJMXhFbURGNkFHeEcr?=
 =?utf-8?B?d0JiZVk5bnd0ek1JZVY1UVRTUlJZeW10ekNzZWpUOWluRVZNZVlnSEhCaUF3?=
 =?utf-8?B?Uk1EOGpuSWpYaUhBUEYxTm1OT21jWVM5bll0THkvSFpGR3R2UlkrVnp1STFK?=
 =?utf-8?B?UlA5cWNWSlVGdDB0Y0I4VXZiSnE2QldqYXVmOFoxK05qbzk3MjB6U3BhMHNl?=
 =?utf-8?B?aXBRREh2bEh5QVpnSTI0aDE4dWVpQkJPczVsUThMZ0JwaFF2WTBKMGhxRUR2?=
 =?utf-8?B?akh0a2luSHFFeUVKNVNheFJ3cGZZcDgrQkNOSWt0YkU1SHBDWldDYTFiQW4v?=
 =?utf-8?B?THhtL2xMOHE0Lys3dHY4RXc4LzZNcnp5TzNMSTcyZEdjVzIzbVUweVJCWkZs?=
 =?utf-8?B?bkxNMis5cnM2QkgvcGhXTVpLbk1xdVBRWVQvSlNMdlVYRGNzOVIwaFIxVEN3?=
 =?utf-8?B?MDh5QWprUFE2cDFaTDdHT2VFREp1SHY5NExORlVaU3BVQVJuMHI4NzBpd1pp?=
 =?utf-8?B?WXd4aTh3R1JYVW9qUkFjVDArUUZxLyszc1FUWHNic2ZTRlpWLzBLbUJVaWkr?=
 =?utf-8?B?TlBHNXM1YTBOY2NGSXNCcXJyaWhHK0VtdWxIMU5UN0xDYktQV2FITDRjR2po?=
 =?utf-8?B?M0kyS1NMcy9lQnFNWGRRTVZEZW9na0lNRnJlZmhoSmhjVmJHM0h5VFFaVWdP?=
 =?utf-8?B?d2xQNjVKaEVkWmFqRGM1c29yc0N5T09QdlkyWDdnZTZJNDl1U0xaMmhmZ2Y1?=
 =?utf-8?B?ZjI1ajFXWHcvWC82bzRxWGRCOTlBNUR5NlExSDRiM0REVVF4ZldSQkh0cTJ0?=
 =?utf-8?B?RzA1dDAzN1AvSXd2RTg2WTlsa0VVN0JOL2UxeW1NMHU2eXRpRkNZdkxKSFZa?=
 =?utf-8?B?L3JqOEJRU2ozcTZ6c1JHd2tvL0x3YkdCMEVKWk9RY25rUXdCZEtKV0RhQjl4?=
 =?utf-8?B?amc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlOaXlXNHp1cUE4di9VZnRDNjkycExETUVGdnJSYUkyYm1UQVZscFlvWFpL?=
 =?utf-8?B?cmhJbS9aZWdZa2c3cGFkV2thNXhUVTN5SngyamZJdGQ4bnJRcHVHM3B4Umcy?=
 =?utf-8?B?WGpuOU5ZRkwrb2k5OG5LMUNsNUNlVkRINnZ6YzJUdERVVzhCUSt5SHlQZEpV?=
 =?utf-8?B?SCtVNzdSeVk0Yml4U1RFV09paWYyWit3bGZuUVk1bVBsNFJtNHhjamd6V0Zi?=
 =?utf-8?B?dHdGUXFpOTllbGowZmQ3MlFxVUd5M0VIM0NRc1ErbHdyRm93ck1FR3JXcDBH?=
 =?utf-8?B?TC85YU5xcVZxK0JHSDR3ZHBCVHRRcHVHTHJPTXBWUnNwVXRqNnJLN2FmZ0c1?=
 =?utf-8?B?cjdyRUM5bHExS01ZZDYyRnlIYzJMR0JIYS9IR2h1andaQ3Q5S0N6U3g0WDY3?=
 =?utf-8?B?eVgwd0FwUGZaRllBWFpSdkdMTjhjL2JrTU9EbGdXalk5R2w2WXJDQnVWQWZC?=
 =?utf-8?B?WFRvaXJPS2FlcVFGZkdOdWozLzltRFpuSGd1QXl2N3NyS1ZodW1VT2kzMG5t?=
 =?utf-8?B?c3VaOHB3NThISXdZSjVaazFKZmkyelFvQ0lLenFLVjNLRjZVVkpoWGM3cWh4?=
 =?utf-8?B?YjJiUXRkd3M2aERmbTR2ejBWVXhrSjJFTll1ejJTbkNQZ3Z2UFN3SUV4T2I3?=
 =?utf-8?B?ekUzQkRDTzMvSW5TWk5UZ2Fwd2hlNzNJR2pPckdOZzhudFVxSUQwdURITUlJ?=
 =?utf-8?B?RUtHRHNwb2QybTFCTFhoaGQ0aFEzeEVyT29Tc1N6alpqVHRGOUZqWG5QbWVX?=
 =?utf-8?B?ams3ZXg0UjFkaGtZYWoyK1MyR1ljWGdibThsMENLY0k1STZhRytlTWlhSTRr?=
 =?utf-8?B?eEZQb0gvbmtPZE4ySVFpQzZhVCtMcUovU0d3anhXV2pJZVZOcWRjc1k2STRJ?=
 =?utf-8?B?d2hNUnhWZHJqcG5PZGw1RUpkWklSeHpGKy9ydUlnTTdvemJ3aEgvSTl1Qzkw?=
 =?utf-8?B?NmcwaUhJalduUWxMSmRWaFhwTGtnZkxmTURJZnAzMjlPMFFGRG1FdEVtZE9D?=
 =?utf-8?B?cWE1VWVNVU1XTWZqdUExMWVkM2hyeDJoa2tnQTNxNWF3U0hJNHpiQ2ROUEln?=
 =?utf-8?B?K2lNZTVLdjhKUWRZczZTSm1nTVJtOHlHYTVQUlpBd1g1UWI1VTJvWVIrMHEx?=
 =?utf-8?B?QU9QUUtDM0E5K2c5Vm0veFJkVEg2ZmQ2VUgweU9LMUhON3creDlkcDlwRHl5?=
 =?utf-8?B?WUxPcE0waENQbGRvanZkd1NpMjh4dkNzakhKdG9XbFMxb05jNHk0ZUovUTNy?=
 =?utf-8?B?RTlQM0R6TmpxV2Q0WXgyTHZmMmM0OHdTK1p4WXlhMXhvQ1VmOG1wSEFscmtO?=
 =?utf-8?B?T1JrdnNZc0Q4bTV2R2Z0UU5MM0lGVDdXckUvUUJEaUcza0tENy96T2pUbHYz?=
 =?utf-8?B?WjVEa09GWEg1YVNvdU1Fd0dkK3ZQV0dVTUx5cnJoSlQxL1E2dk9peFNtNlF5?=
 =?utf-8?B?QTRkQ1hWMUZWRzMxVWc3dnJwRGFZaGZ5cnNBc1Q1THRCUFkvSU1lVzRtekJZ?=
 =?utf-8?B?cis4NWswTldrYm9xYS93M05PaWdWYkRRSEllenJseUxPM1hTSFN5RVJ6aUpK?=
 =?utf-8?B?NjJHaVN3WXZtbDBPTVd5c3pIT2Z3SVQvYkhGMCtoSjFXTHN2S3lTS1BDT2VZ?=
 =?utf-8?B?R1BXY240M3pFNWZxcUw2Q1F5VlhIZysxVitkYUdhTDdZcHRHWXUvZnJrZzB6?=
 =?utf-8?B?aVQ0N21YNzNLRzY3ajJEaXBFNFBoeUJxWmtUdzRxSVJNcXBkanNOY0ZSSHMv?=
 =?utf-8?B?OGNoeG02S0g5ZGZkcEt3U0tPSHVET0U2ckkxTE5ZZGZMdFdHZmtRQVVLbDdR?=
 =?utf-8?B?ck53RU5KODRKU3NNcUtTK3RQaTliQUUrNm1rY3hyUlVOU0dDL0lhVVQyb09Q?=
 =?utf-8?B?TUJXcWlITk9rRzZVNkU5ZzFTdXR1ZDc0QVVWK2x3OVBSb1UyR3ZOV2E4QzVD?=
 =?utf-8?B?MGlwY2VTVC83SmI1ekRHTk50Y0V3TFpYTHhzOHJIWlByclFiNFUvVkY5SVdB?=
 =?utf-8?B?N3VETE1GeWZBV3FtQkdHc1I3RGRSVTh2SEJ1T2ljcmhXcGRPbjc3dUpxaUcx?=
 =?utf-8?B?UkxBQ2dFbWZxRHMzWURjbis4MEVsdkF0TS9rbktMTFJXVXBNWG55UXZyMmpQ?=
 =?utf-8?B?bXBySDJ2cmIxRWRRS3A5L3lCWG50WWJpendBZW9paHpwQW5HdkpFajZYSk5j?=
 =?utf-8?B?U3djU25LT3IxVytrbXZXRTZmNHJvT1JjN2F3TGs5NzVnL3NsWVlZWm5JNGRQ?=
 =?utf-8?B?QUFEQTVXbklYWW1jbmZyZldRUlV6dnRScldNREhRSFpFeWxCZnF1Ui9YbDE5?=
 =?utf-8?B?YlY2dTJMWldBN0o4ejNIZTF6dXpaaE8rRXRCQjJTOFo0UWcraHhJcWVmOTI0?=
 =?utf-8?Q?t8FzL4F2DJTteghQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b989ee-5f4e-493f-cc39-08de5994f617
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:02:25.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rLR+XfF4a7Qk9onCTsC8/ca4vYAfBHCNpnVp62NoPEBHqoiOlzg0oWlCHX7BqmaK9pm5aJKfXdhzneWUk9frQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11014
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:imx@lists.linux.dev,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Li@nxp.com,m:victor.liu@nxp.com,m:laurentiu.palcu@oss.nxp.com,m:dmitry.baryshkov@linaro.org,m:francesco@valla.it,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[lists.linux.dev,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,valla.it:email]
X-Rspamd-Queue-Id: 0887163C61
X-Rspamd-Action: no action

From: Liu Ying <victor.liu@nxp.com>

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..665053d0cb79d2b4f50e69c397863ab024553867 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -118,7 +117,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -317,33 +314,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

-- 
2.49.0
