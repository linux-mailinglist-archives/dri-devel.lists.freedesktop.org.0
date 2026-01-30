Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFDtNWRufGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:40:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA5B8800
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0B10E96C;
	Fri, 30 Jan 2026 08:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fxbmNev3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013069.outbound.protection.outlook.com
 [52.101.83.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507A710E978
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 08:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2Yae1sm2AVbEIHrwUIo6vE4OPWMoNwGlH7qg5SU2z4Byb03VYZndgm69blBcV1xSnPsoJ9hJ7w2DBOIHGzXSqDkrUoSW8KaWj/0mZN1J4nZ6a9p4R7CY3cBaNw4WrBmBXJiAonxQFXwxoS1XdwW97/AzKCxzUFmBZOzP/Oi+qFxNfT34XSYg+zNp1g7UuVhzPDQZgpJK4dNpC9L+SiZmHtcqMawV7MDeDe7ODvW07uGKhV4cZi7SwsXjZxIfO8pdfT/TeHJgELse8RR163KrH047Y+26xcB0m29ffFLVlkNh9qxB4C2BYVMWPqIdmK23S7xnwDNvgP0KPCMSQ9jSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxtWNez9/i84N1cyeZiuN5cgTywKhdqz0LWf7SV99UU=;
 b=thik9xa2EjcXc1rkrGbfuhEkuS/40Z4NcMVq/Fe1yhu7Z4g5rNiLFoqqPE1AB4d8SQ5cqIQQedEfXXNR60BsmHdMrrpNbeU0WVd+kATO1fsOSMtQ+nyRSF039AtLF8Qu0z5vGO3zqlyUrjjelnPTIYCRFjTEETaUKS9rd19ee8cbRJC76XUyE1OVKiqn3zHpLnrUiO5oY4em4O47BLP4Y9CnCOdwqMv0UlQp7IGMgjwyp9h2mwS06pef1BZNTo9rX/RQ3YNEc0BGjI7dlPfk20lo6uUnKqAnTfoet09sUd02AiQAo9vmXUGxVehtfOkmIUWVdF3GwP8uKBfAps2tNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxtWNez9/i84N1cyeZiuN5cgTywKhdqz0LWf7SV99UU=;
 b=fxbmNev3EsmUxpPaFJBXZqdIqKl/AVFEX5eXlBvJ7/36eACwomkQafdrHJokctjKXgCicOUzP0nslei5c2oRNS3TRPpahsk4aefhrZqbElccwJjxnfWZhAYJBTw44hq57905gXj9zvC7qIKa2YQlXB+8gkmIFrYV59hAKsRimBDAWBnQIBIsOE9zvGuTx9Px1xI5rvLXEY5SrZGuckN9zWvjxd0C3DiH0F6vEVzli+A2Xm4eyL5whiosVG0hgatLp+m6iz6bvsURKl+Cw/JEbjaT49AV/idS3k9+qKabk5DN9a+kSlaVgBsK6/q5YKyVUCYQMqEcTp4WZLRkShixNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9622.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:39:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 08:39:55 +0000
Message-ID: <a2ca752a-c70e-4348-bdb7-e89ac119c842@nxp.com>
Date: Fri, 30 Jan 2026 16:40:46 +0800
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
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: fd34eb95-873e-409c-cd88-08de5fdb24c4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDlxaUpUN2tEcGhySkRZWEVrK0ppK3g3TGx3NkNqM2k4V0J5eU5FT3o5SEVz?=
 =?utf-8?B?V0dObUZ1Nk1jZkZjME9hc1pjK21tMURQaVdEblNCUU4vR3ZUajZacTI3NHY5?=
 =?utf-8?B?bVpWcDBXYUIzTjR3UTdJZHU0bmYveFRIVGJuckFMSnkwRG51Y2lwTG14TW1z?=
 =?utf-8?B?Yzd2T25sMFRybzR0QlZJZXZnNmt1RnhtWm5uSUpjNFJpbXllRUpZUzFJbE1r?=
 =?utf-8?B?YTdiS2s5WGRHeHM4QTlxSWxNNnBDOFc5dWR4RmRjbjJLVTVtcnZJUHdMUXJK?=
 =?utf-8?B?V0htMThlb0YrSmw0RlZtR2hBQi8zRWJSTVVmNk5TZ2lxSkVnaGQxb1VXZ2xs?=
 =?utf-8?B?SWZPbklWemUvTTVOWjRQbFFwOEw1SWp6cUpNMmx1Ymk3Q1JKQ2t0NlEvVXRL?=
 =?utf-8?B?NFlTcS9ocTNnY3ZPcEd0S0VHMUJGQmRzOE9zQXhsSGdrS2pTcU9xc01JTkV2?=
 =?utf-8?B?VWQrWTl3R2F3R1dJdE5ueDVjdHZscXZ0aDFFNi94Wmg0OEY1U0I5UGh0ZWF5?=
 =?utf-8?B?Y1FwVzNqS09JMHozbCtrM1U2ZUkrdDYyelVaWUFkTVZnSTB0SkFram5ZY3Ey?=
 =?utf-8?B?R0lwaDkzdTJJOVVjaERtdTM1MGNRelorUEpCZjNZSkRDdzdqdFd3SFhLbFQ0?=
 =?utf-8?B?T01TcGc0NlVpaHJrRzlTY3pXUFBMc1d1czBMM2hZeVY3TzB5TzY0cjJrM292?=
 =?utf-8?B?NkluNGFvcEpnL0Q3Nnc4TUhnaWVZdGJkckEyNnE4bTRUVTROand4TFhpblpW?=
 =?utf-8?B?ckRaV3p6elo5STNqTlRTZ0FJQmRMTmlZbjI5QVUzR25PRXhlTTFFTCtvMmlO?=
 =?utf-8?B?UVBycmI0dW1kQUJrR0pzc0Q1YWZ4ZWZxZUZCeEVWU1l3T2VVWnhlcDlLSzNR?=
 =?utf-8?B?bkxNZStRSkt1a3lISVZWNnA4MkszUmRQMmg5MWM3MEZZZklZdEk5SVdvcS93?=
 =?utf-8?B?cTg2djN3dUpEKzc0Uk1NUENyZDZYUzhyRnhlZ2NWdUhHN2tRZ1NmS2R2dlRt?=
 =?utf-8?B?ZzRtVnBwNnhVRW9yL3cxSjgwanVpaGN4RlhPQ3lqTTAyeDlDWGxSaUNwWTNi?=
 =?utf-8?B?WUJsc1pwL0R3VmxKbEN1UXNOV0lvL241T3U1WGNqNlZ2bzd0MTJJN3o3aTJH?=
 =?utf-8?B?VjR5Z1UzbEI2Yk1iVnhiaVRqQVZvL2hKcm1FaWRkRitUOGRPTDRtaGJvbWtZ?=
 =?utf-8?B?Q1VFNTlwMFg3NEoxVjYwb2I3UzhOSVY0RHoyamxnQUZ6NUxUTVl4c0R3Uzly?=
 =?utf-8?B?QXVSZ3VaaXpuL2Vpbk9WOUVXcktiR01iYVBTRFpyd2pkZkNPYjh3dlNRYnFq?=
 =?utf-8?B?SzBjTG1SUUZYSHJtcVB6Y0tHZUs3N25IMTJJcUk2OVFDaTZFUXZBdEY2a2Nl?=
 =?utf-8?B?d1ZDYmFaVDhSakY5NHB3bjZMNkZuZitnYmJIQXkvajZEV2JyM3NHbDB3MFND?=
 =?utf-8?B?N0lueklDQ3lNYU9qL0Q3NFNvTGEwRzJTNzJ5aXFmUVQxUU1HTUtVY1Fyanhx?=
 =?utf-8?B?a1ZIYjI2K1FQTnppQkNkVjBSV1N5dmt2Uzl0ZzZGa3BTSlB6aWkrVDV4QVlz?=
 =?utf-8?B?a3RIZVJvbFFYZFRUTzd0WFVpeEx5ZURZdVJSMWlmQTArbWgrdElDY0F0ZFpv?=
 =?utf-8?B?d1FvcEZLZGFKNW82bXhDb2UxMk1PSWN3NmlOK3hmbU9OZjhMTWQrYVRMWFVz?=
 =?utf-8?B?dGZDYzNQQzAxY29vVGh0cnp3U0EyK2xpT1M0Tmg4K3FXT3dQbzB6WG5VZ0lF?=
 =?utf-8?B?SUZQWExkdzMzcVNpZk1uMStGbVRlbU84K1ROQVBlQm1xWFRYeHBRMEVUdllw?=
 =?utf-8?B?MFdaSWN5dFdqL2tzN1F6UGFRaUl6bTJBQzZSdmVDWGNZQllYc0pCTzZLNjRT?=
 =?utf-8?B?ZkMwei9NU0ZjOG1yYkQ5aXF5U3d1YUV3RDVjdkRQQmlsc1M0djk0NktSVXcr?=
 =?utf-8?B?K3NRZFNzbkVDWE1sNnNxaDFrN1JRUWkwMXBTYmR4L3duU05ZVnRqN3RDYStZ?=
 =?utf-8?B?VDNyNUJQdm1HajZkZDZTaTA0RDBYZ3hWcW9MNTJJdE1tUWRxZW1neUpkNVpQ?=
 =?utf-8?B?RS9zaDFrZ0MxWTRUQTJ6US9Jd1MwcGFZR01IWnkrT1hSeHM5QTlTMjJzWXpR?=
 =?utf-8?B?U3ViM2dhN25iWjUvV0dWWWl4Mmwxa08rYTRIRmZKWjJpQ3pIOTNNQlpCd1dM?=
 =?utf-8?B?Snc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHU0YlJkcFhTRnhTR3UxSG11NmpPZ1NPYW80VEJjV2N6R0VxNzdWY2cwQVo0?=
 =?utf-8?B?cFBreWxnZEhOUU9IdnF0Z3lva2NwRzFVWkU0UTNieEk2T2cvZ0JXZGtqV2hI?=
 =?utf-8?B?RFFoVm1JUWxHcmZBZlcwcDMrR1ZBR25pUlpiM282c3AyWjFuRGpnN2poRTUy?=
 =?utf-8?B?c0l2TSthckdTRkVBbmRQU1ZYWldsUVZuM3Z1WWsvdm80bTNlNlNsQ1EzQXcr?=
 =?utf-8?B?ODNLcGJONjloczAwVENkZ0tyMk9HcUJwZmFyLzVrVDhtcDB1M0pVT1BlVUdl?=
 =?utf-8?B?N3JrT2JGRUc0Nk9NTzZEbUNnbDNkNGJidkI3eFRjbVRudFcxRkpHOVpScUJL?=
 =?utf-8?B?UnRzR1NYN082d09ZVnpVSy9aSW96bW83Q1E0bUVHQ0VWZjJ3R2JsYmZhOGJF?=
 =?utf-8?B?ZDFGT3hXdUVRNVk1RGdPSDFwRXcrZFVKNUMrdUhqSW5vNXY3aldqSHpKS2J3?=
 =?utf-8?B?a3lFTG85OEVSME12SHI0R2x4dE1zaXE0R2syQWdOOXI2Uko3MWR4MHVBWUlv?=
 =?utf-8?B?RDA3MWZQVEp5T0w3dHhCZGFSbDJKZnBic0JMMXRickJnZy9ocWs2a0k3WFNn?=
 =?utf-8?B?b3hvMlhhSFVGckd6alEreFpsVlVJMmdYUlA5VzFrU2F0R0VJcnc1VGJ0a1Vu?=
 =?utf-8?B?aEl6ajlmV3VaMmNwYURzNWU0UTloWTFkMlJSNGlxRjFxVnZ6QnBnU1JURlhJ?=
 =?utf-8?B?OTRQVFFPNWFtVldRL2lFbk9YcUdCWEsxV3oycjRVeGQ3UElCZ21qZTdPbDBM?=
 =?utf-8?B?RXp6aHlJcGNXNUY3Q1B6SmNsV1Ezc3NKWkhESXNBT3FXY3JqTXp6U1REZ0Rx?=
 =?utf-8?B?TG5sSTJMRUJuV3ZhQlJpOTgzUk8xNHk0bnRqTUVNazhKOWV5Tlp3T3hxUU5X?=
 =?utf-8?B?YTc1QjJXd29OZk5lQUNjLzMyeU5tcVdFTnlDSGsvR1BlZmRQeUJ6SjlnSjV1?=
 =?utf-8?B?aGM4K1AvM3pyNjJDcExMZ3Y5ZldTUnpLc2F4QUtydUUzb2FxbTFNTGxMbWJD?=
 =?utf-8?B?cnNiQWxjcWJEZGg5VStDcVpON3JzMlpQTEVPNWdYOGFwR0NZc3RQMjBESVhj?=
 =?utf-8?B?RGpHWnFpQXNuZTQ2OEZUbnZzT2Fmd21kUTdLeFduQlZlM2hZeVdzS1JQY3FF?=
 =?utf-8?B?VGw2eXRlcDFJMXloajdaMzhPWlQyT2t6RXByZTB1Mjl5TFJjU2JncTlqTDBy?=
 =?utf-8?B?WWtQVG5LYnVHdWdkZjFZb0I3MlFMSGd6d082Vk5kRERBSDRuVFhXSW8xTUJv?=
 =?utf-8?B?NnAyQWw3UGZ4TFdwY2J4Rlk3SWE4dGxyUmYwR29HOG50U1p3WXFWRTY3ekFq?=
 =?utf-8?B?ZVFSRmViTHFnaUVCU1pnRTNSaTAvN1g0SnJHNHBiYVo0cTVsQ2hoT2VQc1E2?=
 =?utf-8?B?MTZ2NnRrNGc2VFM4VDRmWWlwc3AxL2dnYWVzanNNSjBhOGxucWpjS0dlSkdC?=
 =?utf-8?B?a05HVHRqWTVROEdnUmZ0OE9WeGdta3I5S045QVdCZ3BNQzNGbUNSdTVyanJk?=
 =?utf-8?B?VjlEY0VNOEQ2Q0Q0Skx3UDRzSWF2QndoK3pUNWhJSE4xWDM1ZDFSbThBZVpW?=
 =?utf-8?B?U3dWTlFMM0lCOHhpM1Y0RG9TR3pjelVZdGtpRm1QczRBbHhDTW94SzVLWjc4?=
 =?utf-8?B?L2FtTU4rNHpDWDc2aXRaakE3RVExOWFvZWdsS3IxRi9uY0dkNzdzQjFoa0xy?=
 =?utf-8?B?MDZna0RlNFF4VDY2b3NPdk9MR0dLUjFhZjlDVmR5Sllzd3c1ZkpacjFJMDc4?=
 =?utf-8?B?WXpkbGEzM0cva2tFWlBGbVg0bG1kOTVSVHpZQnpRcWI0SHBLM040bUFETG92?=
 =?utf-8?B?ZEFnSStFM25xV1RTeUpmMkdBbzFMM3c5RVp2Sy9EdUtNdU95ZVo1R2FMeUh0?=
 =?utf-8?B?YVpDckFsUzVKRVJWYXR1cXRiWUJpV2U3K1FWTURRdXBwL0Q3ZHY4dVlxdXdD?=
 =?utf-8?B?QXluTGZNZHgxNUNyOG5CRnRTWnI4Q1dTOFhjaUdLK0twVzNHQnBDYm43NVdk?=
 =?utf-8?B?THR5ckNHcityakIrQ3R1NVgwQlRoQ01GV1N0SDlmSENCYWYyNmw2U0FieDlG?=
 =?utf-8?B?WGkvQWphcWppK3FFTFN2bjNvVGVrQU1OeGlQRGZITUwzYkM4aFVKSDU3b3R2?=
 =?utf-8?B?UVhGS0xNSzdxdGtPYm9jZzZpTmtjYmZpRmRPd3QyZDZ1SkJmWk9DWVFSQnpF?=
 =?utf-8?B?Y3IxME1pR0xyeWFQWFFUM3JzTHNGdEVNR0UrTERsb005UmZTdFFxM2o0Snh1?=
 =?utf-8?B?aUlSMGF3bUNUY0lGakhvSFVMd0hyWlVnbGZ3WjB6eTg5U3RWQVdJK09xWmor?=
 =?utf-8?B?VW1HZldCTVQycWxSdjNFS1JGdGk3VThncEJOTDRFY0paYnRGSTB1Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd34eb95-873e-409c-cd88-08de5fdb24c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:39:55.6130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5p+7El+qwXA7MnLtcB7LYtIQJnIVd6DY+Qvj6347i1Dtmc2jNAJaBAZwRaDPQxE+x1orZ5anJtfSDZ0lQ8UMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9622
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 43DA5B8800
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

You also fixed subject and fixed error msg for devm_pm_runtime_enable().

Anyway,
Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks!

> 
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

-- 
Regards,
Liu Ying
