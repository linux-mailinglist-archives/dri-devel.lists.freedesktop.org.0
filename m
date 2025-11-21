Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E5C7804F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 09:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73A10E7F7;
	Fri, 21 Nov 2025 08:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="R7PMvT+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11022136.outbound.protection.outlook.com [52.101.126.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A640110E0F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 02:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc5c0lghkKOotUpRefgmU8+7JJTH3co9hVT9xpqKKWetPZVGI17J+F0lIF6ThdIzbW0c4VtZ9FdozAmHF4NSqF2q+kGL1uh02DdfMN8Sk5B4iUiaf6k5bwLJHMnkuZSN7g6lRQts4p+bpnez8+XOxn6NS4PpBpPJ/9Lc97sDiyBC9kXKN3CzJqbRBw4EQAlOhs7M6Uu0NWsI1+iTjcvWi1sobhMUUqdnsebEVO65ctudROQCD+idNIY+b2BUH5kxWOgsYLBIB958xxddiVdzxEPrGhDe24EGJzxPdqWPuniYRR34DtnLpFgbezgiCgVrS7XHSi4QcHH5GYQUcWV5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6bAiq3Ex2yizmgrTm2sbk8l0WQLVR0JX9Hc6yK9LF8=;
 b=Ndf7lMkoYXbtAb9KzR8SjA4SMzagTub3Il0Gg+DdzhcsRjGM04wYp23+BjKTQ1lj852T1teVhUK132Vvb0JdT79GNbb5wU2MnHUuqWmNGNaPNENpp8bfkd4RIC0ytgBfuqIyywjI3WT4mzSJA8L59BZ87PzhsSpvMaM/2j/UT2gkbToBqafFI8dYGNhO4oS9tlbA48Jh1iUi54fH5Mv0/NRpZMVTaCoTKuVrXv2WXU03zYqMCb/W4gA54ZbbbeMTtK6HH/PZ0zFX8zUyb0QPMd/FYSgEkDwzrMu/AMeJyo23rhW1BSLwbeWX0eRZFuT4oUKS4QWJNfBeJ2K+5WAkgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6bAiq3Ex2yizmgrTm2sbk8l0WQLVR0JX9Hc6yK9LF8=;
 b=R7PMvT+WYw546ngGd/XdaDWn1DBtJ7n9cx5CQrSB8jQmC+RNCwgzADyI9+9GE4EXo7adjrHnhFplKSSgBZ/Q2Slt5MM/OW/fRx8RuuRSyjdnV7HFZ0wWejwTmKt08zMNbAM6e8djMm2TDUm+wLeE3kvuS681EClGMvjDjwBQW6+m1XP9tTKdOSYOiiqkWXYQovS4ryXw1S2LBpNpIIzbd7sqKfn90AnRsA3fMpyr8C9Wc3EKss1uuvxENL8dYnD1HrivogXdq1c2zbCFnXS3OtR/5wr9W8Ws88r0/qx7HaPWp7a31lvOmfh/IlIqAon8/d2xkmdr1uPYWI7Wa1GQ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by KUZPR03MB9382.apcprd03.prod.outlook.com (2603:1096:d10:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 02:55:29 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%4]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 02:55:29 +0000
Message-ID: <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
Date: Fri, 21 Nov 2025 10:55:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|KUZPR03MB9382:EE_
X-MS-Office365-Filtering-Correlation-Id: d40038ee-c9dc-46bb-2ba7-08de28a96dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|42112799006|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG1PTUl1cFloRFk3UFgzc21wV2ZVT1ZoSlFDRHlZOXBGVnh3UkQ5VGhxOVRC?=
 =?utf-8?B?clE0K3ZienBidjJoR2JDVjZtWG1lanUzTkMzR2RwOE8vS0c3cVp5ZG1ISmRU?=
 =?utf-8?B?a01JaFBoQVlGTXR5VTB1Mys4ZWtWalAzU2NySzBXSW1ubUdBSGJ1bUFvS3U1?=
 =?utf-8?B?am1CclZ4alRtV0ZkMnJPRVFiOUp4d2l1amVJN25ZUXNEbTJ2ZGJFL29HTHVr?=
 =?utf-8?B?OGVmSTdTSHEwUzQ5eWR5YmM3SnhVTUxWNkZ2S1V4enJjL3YrNk5HM0RkZjRC?=
 =?utf-8?B?ZXF5cWxndk1heWVIMUFOaithSFBsbGNhWXh2NXIxbDUyMU9RK3k2ZTNWREda?=
 =?utf-8?B?Q20xNFBIMEVWbFdkVEtyanJUdElnZEduMDlWdk44NXRrMWh0ZjdBWFA5RXVT?=
 =?utf-8?B?b3FaWHAwUXQweXNySFoxbk9WTFNqQytDV3NOV3c2aUErTnk5QWJhNUlvOVFR?=
 =?utf-8?B?TGFxcXFObmhPZDk2Q3ZZV295eXdmUmdLUklWeTF2UDF0OUhhcmdYMTJJY1pD?=
 =?utf-8?B?VjJjNmxXVWZDUUJBV3hXZnlPTWNPTkg3VlI0blkrMFZzc2ovbDYwYjBnQ2lW?=
 =?utf-8?B?M2xFdHJWOUxiaFAzamhrRzZUcUs3M2R4UUxBMk9aMk9tRERVSHpkUkVVWjA0?=
 =?utf-8?B?RFliRjlWdjB0cEV5dWlDcHNPQ0JYM2ZqdzlHdkp4bWdBZ1hiMXBLVmJScFJu?=
 =?utf-8?B?d1J1S3lHYWpiZTRJcXBqOUFxc1VSSTg3OXRreEV5M3ZRbndqYUZCVnhtSHd2?=
 =?utf-8?B?am9tZUtjMS8rZkxHMHQxTFBRek0rNVJNdzgyMGl4TmxyMmdYWUdSeHNZMXE2?=
 =?utf-8?B?dnE1TllTZDJudjVTaDBCRjYrYkpDWmZFSWZZOFdyeDVUaUpOQzFSd0NlT1gr?=
 =?utf-8?B?RDBnM0EwZ2JwRHVzd3ZCVlF3N2hFT2NqUVZ6UjFBMklBSjlRNkVVUzlqUFVK?=
 =?utf-8?B?M0NzK1lDcGI3Ym9leXhBU1gvNCtXUTNhWlpGSks3MGMxWHVpajNOcFF2em1Q?=
 =?utf-8?B?empyVklZVXM0eGtQWnhQQlJXd1ZBQ3pjZmEyNW1OdUJhM0lZSXcvWWxwd01j?=
 =?utf-8?B?c0lVZ3k3YmVxalNPSnJiVFpnK3Q1ZFVmSzBTZW1EZFlieEhiUEJqaEFHcXRv?=
 =?utf-8?B?bjZ2cy8wV1NOY2tic1BJUkF5cUlmTGJHTnlVYXdhZ29LeDJjVjFLVVFFTVk1?=
 =?utf-8?B?SjFzTnZ5NHNUVk1lNEg0MFpnNkZBcVF4UWllanY5Q2IrMjJIMy8yRE5VRmJZ?=
 =?utf-8?B?c3R0NVhxbS8zdGY0dG5RTTh2WVlENEJyUUg0VEc5ZUtjZ1czVE9zQnA0MWJV?=
 =?utf-8?B?T2R6Wk1sanNWeWEwa3U4NmFpZVZhOGg4U0ZWOGU2SUFGUXFkdXlQbVkvL1BZ?=
 =?utf-8?B?OU9neWlwQUhXWldqR1M5M0RYc2tpWG4wVXpmSlJpOTM1dnVsM2ZZdUhoWnF1?=
 =?utf-8?B?Rmc4UDkrcFBqRjBTSHNIK3k3SXd3ZFVlTmdsVGJJZ2c5YXE0eVNYRU9uM1FB?=
 =?utf-8?B?SXJZK1hUTkQxTWJ6cFRXNDZpbTZMcWRHZUd3VVdFYWtZU3A3QVJUaUtDY1U0?=
 =?utf-8?B?K1NjWVhuR1ppdDRLNWFldlZKOTF4UCs1eUYxeVcvRnZFTzBQVVEwVmRjZmd0?=
 =?utf-8?B?SkE0UXNSdm5KdHRONjhqZVc1YzU0M3NOdk1jM1A4Y0RPc2dYYThDck54Z2dM?=
 =?utf-8?B?TkVzaEl6TVYwZi9FQzFGRHp3R250ZDRETEZHYWRtYS9kU0ltWnZhUDJkVFE0?=
 =?utf-8?B?ZmxXRzI4c254NjJrdXJ2Vk1Tek1RNGxRcHpObzI1WUZJdk0yZ3BLSUJHRmpp?=
 =?utf-8?B?L0xGMG9JaXdSZ24rY0JBTXNlZlpjR1pQUjc2QnFKdFpzbU82dUlaMFN1bTEx?=
 =?utf-8?B?VUwxaC9wZXlXTExFQm45OUV0YzdhMWozZ0x0d3ZkOHJwZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB7155.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(42112799006)(13003099007)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGkrZXlBaXVTNFh5YkV3Q1BHOXkxTkdZREJaZE1vU3M5V09hdnU4eW5KeWNa?=
 =?utf-8?B?QjBJbnZxMUlwZkY4bWhXWkp2anBmbkR0N1hWSzUxS1FCdFhsZ2wwL0lENW9m?=
 =?utf-8?B?SW1BNzl4L0s3TC9SSjBrL0VIRGFBTVNUNzJmOXI0THRUWlJBRUlRKzRDci9C?=
 =?utf-8?B?OW9nRFBBYmJHN1VsL3JNd0loY0tvMWFwVFBHUVpsT0RMcXBXS3d4aWpHL3FG?=
 =?utf-8?B?bHNQWU5abURtcGFLM3dSV3NVTWgwWXJTa004eDVVYjFaU0RsVFZmMW50MEY2?=
 =?utf-8?B?R0N5RUM3RHVRTVlMeXFlZllkMDhTQ1pRUko1SUJwUzZtOStRNEYzaWdvRlU4?=
 =?utf-8?B?MWJ5aWIzSG9sQmtISG80Y1hLUS9kQ000Y2xmKzgzMm10UjhLaVNjM0hpemFD?=
 =?utf-8?B?V3lUSzJSZmxDaWI4Nk9KQ3hXbHhySTFBUGhuTUhuYnZuZ2tvbUI2d3owSWkr?=
 =?utf-8?B?SW9hL2VSMGM3eXVMUlhZNHQyV3BzaHIzOUlaVjM0Q3c2MEd0WjlPaWhXaWQ0?=
 =?utf-8?B?d0pYT2VpV01ya0kvdDVkM1JjbjJ3WnQzOGh2Y2lBU0pmdXdvMCt0bDhjVnlR?=
 =?utf-8?B?dDZSWEZJYjlRalFyZWs4STNPNTYyN3prZFIyL2Y1a3E4d3krS3R2YzlOTXB0?=
 =?utf-8?B?cFhDR2g4aGxHSmozWWFmTHQ1RUU1dEhqV0VZd0dzOFVsMWJpYzZEQW5BRHVX?=
 =?utf-8?B?eVc5eCt1cDByeFRYMVl6UitxQ1dlcGxFT2xLMW15YUhiZG9rSWd6K2o0QmFS?=
 =?utf-8?B?N3VSeDIzREVwZ2Y4MDhxbS9veFhCWmNIWjB4ZTdVTkx4Z2pFOTFEaVRrYSt4?=
 =?utf-8?B?L3NEYjhVc0NIVS9KQllWeWR1M3MwbHZwMU5MdzhoWEoxcFdRTVV2aVovS3Bh?=
 =?utf-8?B?MVlkQ2JTaHhWY1IxZTV6Y3Y0ODU3S1REc0NxMUxHYmYwM0R4ajEyemQ4Nk1C?=
 =?utf-8?B?K3dFcWhPam9zUUhBTVJPNU5BRjUydmpsbHRSL1dRSGx2QTgzRHF1NnVBTWpV?=
 =?utf-8?B?eW1KY1kyejBzWFRWNHg0V3MwY2N4Mzh2Q3pPS0QxTXJXRFpRdDVoOExKaTBm?=
 =?utf-8?B?R2pkU09CZVZxSXp5Zy9aVHk3K2JSRVlHN3lTMVM1dTZldWtKOEtPVkUyazVK?=
 =?utf-8?B?SkFuVXE1WHk3M1A1WTJPMTdMZ0FhbVVTR2VUYklIOXRLZkVNVGFXZTZsUU5B?=
 =?utf-8?B?eG5vWi9NKzdUajNzazl6ZmgzUEs0YlhONFZTaElST3hMdzVORmVmTDhOeUE1?=
 =?utf-8?B?MWZxVTMzNFBVS0VmWCtmZEZxazA2RzY4LzlMZ1I4Y2xYZWgwT1NES3ZOQnNG?=
 =?utf-8?B?Ly94QlR5eHNCaldLY21keVFNbUNPd000b2tMOThKWURlRHhkZmxRMTVtdGph?=
 =?utf-8?B?MWpkbm10UXdzWXduendMcTB4emk2VVJhWFM1Q0c5VEY5VFpMKzB6UlR0WHFh?=
 =?utf-8?B?ZmlOWWpxRmdObTV4WjhDSGpiTG1uZDVDYnNQVk53WGZDSzgxQkRyRVF1czI4?=
 =?utf-8?B?czN6aUFPSmJLQkc5SnFHNzNRRWI1K0tqQWN0NTMwMkUwb0txTlZzZGx1TWJv?=
 =?utf-8?B?czZ5bGc1Yzhzcmw4em1aR3VLVkFaOFBRSVVhdHVFYnpyK0d0OWM5SjJjb1Zn?=
 =?utf-8?B?LzZtZmliSEZkKzlmS1lDZ1ZnVmNnTzE3b2dUMnF0VzRqaEJkM1lhako2TDQ5?=
 =?utf-8?B?SXBQWk1IWUZ1ZHVGelFuYi93NlBmc3BjL2R3RnVMWU1xUi9ZVUdVZVRJNkw2?=
 =?utf-8?B?eHM5OHdNZWRadVBwZ3RFSTBuNG1JOHgxMHVOMnowSGJWUlpCK1RpMzYxc2ln?=
 =?utf-8?B?eWZEc1VQVm9HU3R3M3lSTXdwaFBOVlhUU2RtV0lMY1R5R0h6ZGM4WEd6L3Jo?=
 =?utf-8?B?RjYyT2gzS3J1Z1VBcUxOSEVFcjVobXJHMWdpMXd6c2RyMzRObXJ1MVpLVU53?=
 =?utf-8?B?b3JwcFJ0RFRrQUhpS2VQbytIVnE1bThoV1E5QkE3RE12QXU5djlpdHZuT2M3?=
 =?utf-8?B?YlRtMTNFc0JQUWpmei8rQlpHWjdWdE91SFdEWXdTTXl0TlJsNWMvdU81cjVE?=
 =?utf-8?B?MkgrT1g2VENzN0x2QWNweXJoVFFJRk03NllSQldqOG43TXRKdHNBaHN2cUZ4?=
 =?utf-8?Q?P6VmV6WdcNXAjBZsrFhdiONEo?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40038ee-c9dc-46bb-2ba7-08de28a96dc2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:55:29.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv434kV8uKt/gC/SQPh4Un4sMWNBCvo75UN3KMI1BSz7xuo8jXIQkho3ByQQFBSuav/NEhi7rr3P24bla3/9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9382
X-Mailman-Approved-At: Fri, 21 Nov 2025 08:56:49 +0000
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

Hi Piotr，

     I will check this issue

在 2025/11/19 18:27, Piotr Oniszczuk 写道:
> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Pls see inline
>
>> Wiadomość napisana przez Chuan Liu <chuan.liu@amlogic.com> w dniu 19 lis 2025, o godz. 03:57:
>>
>> Hi Piotr,
>>
>>
>> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>> [ EXTERNAL EMAIL ]
>>> Ao,
>>> Is there any chance to get this s4 drm hdmi series for current 6.18?
>>> (i tried backport this series to 6.18 but have some issues with reparent vpu_0_sel to sysclk_b_sel)
>> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
>> background here?
> Well - it looks it is because bug....
> Martin Blumenstingl had perfect eye and catch typo in patch https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com/:
>
> By replacing:
> assigned-clock-parents = <&clkc_periphs CLKID_FCLK_DIV3>,
> <0>, /* Do Nothing */
> <&clkc_periphs CLKID_VPU_0>,
> <&clkc_periphs CLKID_FCLK_DIV4>,
> <0>, /* Do Nothing */
> <&clkc_periphs CLKID_VAPB_0>;
>
> with:
> assigned-clock-parents = <&clkc_pll CLKID_FCLK_DIV3>,
> <0>, /* Do Nothing */
> <&clkc_periphs CLKID_VPU_0>,
> <&clkc_pll CLKID_FCLK_DIV4>,
> <0>, /* Do Nothing */
> <&clkc_periphs CLKID_VAPB_0>;
>
> dmesg is like this https://termbin.com/6020
>
> So i'm getting hdmi working - but only when device boots _without_ connected hdmi at boot (and connected later)
> If hdmi is connected at boot - boot hangs at:
>
>      0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX controller v2.01a with HDCP (meson_dw_hdmi_phy)
> [    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered DesignWare HDMI I2C bus driver
> [    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops meson_dw_hdmi_ops)
> [    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on minor 0
>
> FYI: It is after applying https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com/ on mainline 6.18 (with some my adjustments on this series required by changes in 6.18).
> For VPU clk changes see https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/files/0312-drm-meson-add-vpu-clk-setting-for-S4.patch
> It is 6.18 adaptation of https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v1-9-cbc2d5edaae8@amlogic.com/
>
> As kernel hangs - i have limited caps to drill where root cause is.
>
> Maybe above hang is reason of my backports or missing any pre-req required to get s4 drm working?
> Anyway - it will be good to test with updated to 6.18 series of Add DRM support for Amlogic S4 (plus info about any pre-req required to get s4 drm working)
>
>
>> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
>> selectable clock sources, so this reparent operation will definitely
>> fail. This has nothing to do with the kernel version.
>>
>>>> Wiadomość napisana przez Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. 06:39:
>>>>
>>>> From: Ao Xu <ao.xu@amlogic.com>
>>>>
>>>> Add devicetree document for S4 HDMI controller
>>>>
>>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>>> ---
>>>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>> index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
>>>> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>>>> @@ -55,6 +55,7 @@ properties:
>>>>            - const: amlogic,meson-gx-dw-hdmi
>>>>        - enum:
>>>>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
>>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>>
>>>>    reg:
>>>>      maxItems: 1
>>>>
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-amlogic mailing list
>>>> linux-amlogic@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
