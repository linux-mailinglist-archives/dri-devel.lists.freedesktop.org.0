Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F79D3BF7A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 07:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE03D10E2C4;
	Tue, 20 Jan 2026 06:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Y4q1QlUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087C310E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmdhUQC7tpy9UtF90V8Y8tF1P/6UL5yf5kz0W4K8Zg2guR7/eAZnsX6PezIHC+lxqpXtpGZVrGGrHoL15jzA/tv7KUSttC1301wDufSgHU+GutnnyiyzMIxN/OYVNdKxEpZTe4+4y9eNyleBxDdnerWYN3Cgvi2bt5Wa1ZLuJqWxF66uc7RluFbqJK6fK0W/TOgBAm8AquKN9JcexgeaQcu2Qrw+2QdYCGTIzsjx6fmlFVuBH+jBhZgRAcWaj5aq2o8yzTTW1sxlduhZ6nrD47QPo2wRyPpR8U/2T9iyKO5d8vPGJVgHzLA4Mg41+yKnl8qO61/NY95Jvadfu50R6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAhbSqI55gEt0AZbHVgPjbWntiLEgHzRwEO7ftYdE7k=;
 b=THPv+dK0WYCufcK6T7XhcqhmLD51E9hOnIIKnuMeWTYOPaB0aQthZP3Yxz2Rjrnfw0thU9YyEOeT/tUyUYGEkpri47J59REZivGPrrZGRJ4iwhGiACoW8qMmteuq3BEC2LwkUy3BcleI4PrpSvVfLc2rkZnSZXmI8EnNWSWBpB6VoLlR5A+Qs2CsqaOzIovgeQyDu2VwNPzmKxnVMshsVaRm3GpugBcFwV1ya2oWUDau/fS7VPINklg1nNgsXdEgDSV3VyNmCkdMhFpOZNFtutIYaqRwPpauZg4K5YW+X/My4hOxGQtGr6P6FmpvieWVHAX34eY/zxpTI1y4rC/jCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAhbSqI55gEt0AZbHVgPjbWntiLEgHzRwEO7ftYdE7k=;
 b=Y4q1QlUlPoNUJQb39IsPNZRhIB11bwb3ysxdc1F7WfKfzbMl6l4rE/GU/BZNHoE5QeYpdlhy3wkQEGo+Y+ynaEla1REBJygX1EnMutO2UsQyCdGoo7KA4J8RpjIfFOJLjGI1/zZ2sF6WIQqTjkbez6GGPDrCCeA6W8BlY1QLP5Umwof7yqGsna4R7XZYYZ7xnVTK2cioqzkzeZGz1a3mvybZDwmqyyEqjY97kGeieXHZP11wScVuDsgoFbxNS2NnZ8AurCDTbGjejp3UJSd70VcoxPNCorcN21jUQC4v7OVg5g7gtpbp2Wmr0FqFry3XHMaQQqeS0SLh7Zs2jsFpNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9439.eurprd04.prod.outlook.com (2603:10a6:102:2ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 06:46:00 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:46:00 +0000
Message-ID: <0dfe7518-1148-4339-b562-7c7b01b7dae4@nxp.com>
Date: Tue, 20 Jan 2026 14:46:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,enable-termination-resistor
To: Fabio Estevam <festevam@gmail.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20251218110626.605558-1-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251218110626.605558-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e103b6f-8719-4553-0df6-08de57ef9254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlV5SVpocGRiV1RILzFXZWx1aHZ5UDNBdTJxeDROM1dKOUFibGFVTXpHTEFj?=
 =?utf-8?B?YS82WE9QZGEzZmV6Sy9ZOG5QSnhwOTUyMTJLUE5lS01RcGc5bmVFRmxKSWR4?=
 =?utf-8?B?aFZ1V1krdWpWMHVMaXhaTUlYQXlyQ2M4ZVYwZks4YVpNa3FieXBpUUFyYXR6?=
 =?utf-8?B?d21DVG9FZ0M5TFNpNXovQ0tsaU9pZEZxK0ZBRSt2dDJxckZ6S3NKVnR0WWcz?=
 =?utf-8?B?Qy9haDR1UUllTlZGZGJkdDlJTWEvQzgrQjFmR1R5Y1FtVFdvU0p0OTdNMW5m?=
 =?utf-8?B?U01kL2ExeXh0LzdKb2xNcTVrQWRnZ2Z6T2llYmdhdkZsaHB6eEpRSFYyVlFp?=
 =?utf-8?B?amhpb1dqOEZ0dm5PMndITE1GMjYvZHQ0SEtOUXlXKzF5VEFOWkYyRmt1Z01w?=
 =?utf-8?B?R093L0FPOHhyRXI5SWF0ckozM01hTVRYQlZNdmZNWkNqYmtlU0F0cFloV0lE?=
 =?utf-8?B?bW1oTXoxbmN5anVVV3FyOEdYV255b1RERVZ0SEhQSjM2alJyMTBVYWQ0ZlVZ?=
 =?utf-8?B?cWlSeXRoMXlIcjFzODBua0NPSDlNejVtTzRma1F6VWhvaFBqT21ETGZ2eXBt?=
 =?utf-8?B?eXpLRXgxS0J2ek9sNmlLTUQxdzBLeXhvd09mZVlXOUVJRnFKeGdvTEorRnQr?=
 =?utf-8?B?SXJpUnZuWmllMkI0N1YzY3N0eXR3czQ5NlJVcmZuNS9HSTBhQkt6TDNKRVQ5?=
 =?utf-8?B?b0xvd1F5K3BGZTVHOFU1a09Md3dudkdvd0RZMmlzSEkzd3p2S09mVHZGVW8y?=
 =?utf-8?B?eFUvQUhDdnhlUnJLZk44Y2RUTjIvb1JxMEFleXdzMm5EU0NMWEhpejJSaFVr?=
 =?utf-8?B?MjVodDVWeHh5U2JHVGhLQVd0eFphdDNISUMrK1FRbzdzQ0hpNWtvclY5QTJi?=
 =?utf-8?B?NWtyYzFZRkVUNUcvenEzMStjUG01MVhENUNEaVFkUzlyRkN3QkdIYW5abEpu?=
 =?utf-8?B?TUpQUk5FckRYSWl2Rmw3dFo3d1RVWk5IeDNINUk1aERMZCs4RmdiVWRDVk1n?=
 =?utf-8?B?YzNXTUJOVE1sOWNZUmFJbWNzWjRTSk1HZFg0RVRWeXA0eExRaTVDUFZvMHV1?=
 =?utf-8?B?WEI2OTVNTDh6WjVLdXk5L3NsQTB6QnVhTHhzb3JHU3hyV3IyRUVSNjk1UTN0?=
 =?utf-8?B?ckFnd0JYQmZhZ2pGbHdSQm80NEJXR3dpa0x2SzZLQW1pNit5UW9kMkVKWkF4?=
 =?utf-8?B?UTJJYW93UGNsa2FZd05Qbm9sUGRQY0hudFlGRTA1OXpZekR2eVlySXFvZ1RV?=
 =?utf-8?B?VTFlZjQybVE2cGVnVEczdFFJU0xIWUVKWmRsUnJHWEQ1ZDB4ZU9POS94cUZ5?=
 =?utf-8?B?UFp4ZXgwc29iUGd2a1ZsdzFkZDJ6dFEzdkNBYi92SjUzcGozTzBaOEdxSlhK?=
 =?utf-8?B?SUJzZDZEVDB2dXh5K2VvcllFVCtmNzZvZmtyc0RwS1ZZYUlNS0lCOVBWaWkz?=
 =?utf-8?B?WGRadnc0NE0yakVLd3ZybFVGaUhPeWh4TzV2Mm14Ly9hNW92Y0xYUlBvejMv?=
 =?utf-8?B?Rk9kZzRaOWJCQXhiVXZGdFNUUWQwaFdXSkJ6ZDgxY3Z6WlEzVXhlR2czL09D?=
 =?utf-8?B?NDdka0I4ZGRTU21sUUZVNjFqd25MT3V1S1dTNXRremlkOExjbXExMlhhNjFx?=
 =?utf-8?B?QXE2QXMvZW82YWlCSllMeWhQa0ViVDRqbStHS1N1OVRPQ3dmeVJDNitpT3k4?=
 =?utf-8?B?TnRCbXJ4YVpBWDlSZ05JUHZHV2NrYWgvbm53emZyYWRJL29rdlhhZXc2SVoz?=
 =?utf-8?B?NHhOQi85MjgxVHQraHdMSjNSeHNkK3lRUnVDdlA4eUp5cTE3WjF3L0JaRXZL?=
 =?utf-8?B?VEd1cU9ENFE0RWZiR00xWituQmhiMFVzVmdncHBkQnBtZVVCYklxQnpMOVA1?=
 =?utf-8?B?YXJRT0RSdFNjRVVESDBWdWoySkQrYlIvdlkyR2dqQmF5MnQ3NndUb3hHdjRX?=
 =?utf-8?B?WFoyUEFQUDRQSElWSzZORjBsMmJaSTZqcXlHMWswZ0FpTUQwRFYxRzQxbkNG?=
 =?utf-8?B?c1RNc3lROEdCVlZaVm14YU9zckFaSnFkWWRjWEU1eWMxS2swRnJEVkY1QXk2?=
 =?utf-8?B?QjJ1VmE5RFY5UmhKWTlvM0ZWRmxwMGx4N2RKRFdXeGtRN0JsaFFaSjZRNUFj?=
 =?utf-8?Q?cyBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJWNDg2dFFwQzFiblBlNEFPb1RmY0d2WkJQbEJmV3c2Nno2VDRQd1dNdVAy?=
 =?utf-8?B?N3liamhvUUozZXEybU1xZ1dkQXcyVkdnQWcwSkMzb1kxMC9vZUNRczBuMGd3?=
 =?utf-8?B?SU0yOWhrTFNKTXdtOGl3T25WTWROTUtPN1ZpTGszWGtaYU9seWZyZTQ4ZHNt?=
 =?utf-8?B?aWpiYVVqODMzSGs5QVd2VEdXbU9XVFlYMW53RGJEeExoUnNERnEyUlJvZHZM?=
 =?utf-8?B?czZ4T09COGgxVVdmVTNUNE4wS0FkYlRWdXRTdzVCd2NyUkx0cERuVnhEbXFB?=
 =?utf-8?B?OHJzL1BUOGlHaXlVc1gvVlphcklDWjVQVkx1d1JFN3Qwb002cWhSamtQYmMw?=
 =?utf-8?B?WGJjb2ZrRXFlY1lQN2FRRGVpNzB5MjVLYzdYbUNIbjZqWDlxV09ublozalds?=
 =?utf-8?B?VGNpT29lenB2Sk5BRDVMS2tMK0ZhaFRocG1VUlBEajhiZUxHQyt3b2ZKZmFI?=
 =?utf-8?B?R2NKb05RVVVyWnc3VEc2MkFoUFlFbFVrdGNPZ3Y5cjZmd2dKMFZpNGxyTGU1?=
 =?utf-8?B?Mk1GNDNKNHVFb1YzNElNK1lrakJXaWtFRFFqeHVKRVZzOFVLclkyZFEvOVFJ?=
 =?utf-8?B?YmRRVHBiV2JJRFRYOTUraFcyWGVpTzFPNUVqd21yMUFkZVJxeFh2aWpTOWxi?=
 =?utf-8?B?Z3drUWMrSTJYdTBUY2pUMkNxWWI2U1BZSGpZbzNQQ1ExMGVGTjBsVlNMRGFO?=
 =?utf-8?B?YzQvZkN0Mm9GYnlwK05mL01LcmpoQk56SGVDejlxTStNQmpQeUtQTjNhMHAz?=
 =?utf-8?B?R1VBSmRlTjByOExTQXhyTEVIZzQ2NkhKdittSkVpOXZnbEx6YWtFQSsweU1J?=
 =?utf-8?B?OVdVbWd0MHpFOGtCZlBFNkFDVlNjTllFWERqSk9maXh5ckY3dXI1Qit0emZw?=
 =?utf-8?B?dXRDaE9qVk55dWY3eGE4QVlVSWwzSDd3Qi9LbnhLWUFJUWVkV0pUK0hRRmdU?=
 =?utf-8?B?WEJDdGtvdDZkajhFVysrQjdCWGt6K29GYmJCb0lJaElXK2ZmbjFtZVNZMk1D?=
 =?utf-8?B?OXE5SHJ3ZGJxa2EwRFdmNWJod0pHaHVxVkJINkZyLzdBUFlaTnhjbFZKTmhX?=
 =?utf-8?B?Vk8rZkVBcnRITisvWmxBZkc3bVpDSkw4RUowSmZCMGhOQThXcU04RXYyY1VL?=
 =?utf-8?B?NC9EaDNDREgxWkNEeDNRbkttNkNqY002cmpEbEVoaWhCT3dDRTAzbDk3U3pB?=
 =?utf-8?B?WGxpWHpZcDVUbVJ6NjJSc1pJYWZLdm1LcUdUekplQ0JVL2xoSmM5Z2MyT1RX?=
 =?utf-8?B?VlpXaFZnNW9KLzV5d0JoQkpYaFVDTmNDSnhBd3VWOWhyd2IvZnc4TTM4c2N3?=
 =?utf-8?B?bVlEZ0YzYVg5bTZKV0JvWllXVXhSQ0R2OGhlSFNjbDgrdElnNDRrK1ZpL1py?=
 =?utf-8?B?R1l3TkFiV3dreHIrN25GZXYrN0tFVXM1UWYwbk9jWE1VMTNuajFKVWFKRlpU?=
 =?utf-8?B?T0FqamY3TVdQTmUwM2FaV2N2NlZCbXRsc2s5V1l2NldoWkpFazJoT2U4YmY3?=
 =?utf-8?B?cjRGNE11U1pvSzRINjBwbUFoczJNUTBXb2xLRWxrczVpc2JlMGNraHIwZ1E3?=
 =?utf-8?B?aE5yYzI4MnhZNFF5YUxFZVRGV0tBWUlIQVRzbVFVYW9lbmtvUnB2N1BzS1FH?=
 =?utf-8?B?YmtLN0tpOUFncytDdU4zeURoYm1qaG9OZTBYeENxcjNJUEkwcldmbUNJMmJU?=
 =?utf-8?B?YXJoeUd5eTdrYXpRSzdWNXdrTDllMUM3UzN3SFgzMy9uejBvMWJUUWVrSVBl?=
 =?utf-8?B?eHpOK3BYTytINWYxWE52bmpMUkFBcDhjbzY1OGhrNi93MzZ4SWZKWU9lUjEz?=
 =?utf-8?B?a2NXdC9XYWxBNHl6OXBrZlpKK0JHRCtEMlo3ZTJWcURWQy9hVGpRa0dQN251?=
 =?utf-8?B?VGl2UmNuaEw0ZC9TRHFSZXQ3a3AxWCtXUXl0YWY0Slg3TlVHblM3ZU8wV2Y1?=
 =?utf-8?B?Qm94NE04blZIM2ZRS0tiZkovZXQxb3lGd3VYcVVSWXFzeFBGL3VlVTg4em5F?=
 =?utf-8?B?NnhtNlNIOFNoRlhzZXhEbytVUVp4bGs4VFFaZGNNMlNlSXk5aFVKZWw5SjBs?=
 =?utf-8?B?VDVoU1FWNzgwTDhYYnZsNTJOb0NXMlFSejc5VnVkYTZ6UE1SdFBoSHJvU0E5?=
 =?utf-8?B?Y3h5RVdzSW5LQTBwQXhxb2x5d3RvNFl0bjVFTDlON0oyRjVVWXB5aU1QcTBT?=
 =?utf-8?B?ek5Ib2k4UTRGRjFMdkhVN2cyd0pZdUxuaStrQ0grQnZmVlMwSktLRkZEMnQ0?=
 =?utf-8?B?UW01STJ5aFNGNGQ5dXU2azJFWURzdE5iS1JESkEwTEkyUUZGRW5RcWFPWjll?=
 =?utf-8?B?WUpmUWJhdDNuUnFSQVhNQkVRNkRjVUpONHlubk10OHVkdkx6VGhmdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e103b6f-8719-4553-0df6-08de57ef9254
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:45:59.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMTUJ0RJRUjWRiFKjyeROXxNrciS1eOS8Fz10q9yAR1PpsHjVSyYt5jkjQr3JYkkvBJsV62q+NeY7mjAQt4ljg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9439
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

Hi Fabio,

On Thu, Dec 18, 2025 at 08:06:25AM -0300, Fabio Estevam wrote:
> Document the optional nxp,enable-termination-resistor property for the
> i.MX LVDS display bridge.
> 
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> Changes since v1:
> - Change the property name to nxp,enable-termination-resistor (Frank).
> 
>  .../devicetree/bindings/display/bridge/fsl,ldb.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 07388bf2b90d..6bc786204e65 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -35,6 +35,15 @@ properties:
>        - const: ldb
>        - const: lvds
>  
> +  nxp,enable-termination-resistor:
> +    type: boolean
> +    description:
> +      Indicates that the built-in 100 Ohm termination resistor on the LVDS
> +      output is enabled. This property is optional and controlled via the
> +      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
> +      quality and prevent visual artifacts on some boards, but increases
> +      power consumption.

i.MX6SX doesn't have the LVDS_CTRL register and the HS_EN bit, so this
property should be limited to i.MX8MP LDB and i.MX93 LDB.

> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  

-- 
Regards,
Liu Ying
