Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB9A03967
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 09:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1197410E1D0;
	Tue,  7 Jan 2025 08:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hZujVdKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8C110E1D0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 08:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg5/6SchcgfQDzAx1/5kfofB5KnJ3OUEqxFaUmhQBVCTcRKOBzweLsWvQr9DmFRyLSHRsCoTwj62agCRiy13QtQ1HcdwvSgG/DT3pknMKBkrYJopvgJ1j4zBwmb8MP7VT4JLuvnEmIQRvUgYExrZIiuC8evGivUCyNhdzBQX2PgmKZGwzP5E6PefArgkp41mHKVHGhNfG2EOJ3pPFSqJuTshRFc8AQhIldEXCZsXYwvJx+HIF+nBHkkt4oYRGsslqDF3VqIkiP3xlY2Q7opG2pQ/Wx1JqtHSLwYYDQtyL82FmDGgRcpq4Xl04dnr9tMZJBE0OpVzsunJRvHywr0lvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc0sXfPQXMZgNZZtJG5HsF0HSuD8s4sydwl/XVy9z6A=;
 b=PTn16DeZEOiQjOzHt2+XHN7vmMQ1714QzxFgwEMd4QFyWgwdQiOnxhm1MoHNsOM7BT7oP0airO3yPLcSZc+HabsTJKydeMZPy3KLsY8jVWXe+Q8qymL2QH1B+hjBRwjDCcIg8cAaXHfMFefApDAUoM6Fp8uvHJeyA3LOX5rHKhX3Q4Vy7klm5BwbbhHaCn8Z1t0XqqsEEj33xPy6ea2kPEK+glVFAuxhe1aFCddChaGdToddgaC9teZrGsqel2+RQAA2zPK+lX8YJUcrbN9EwmEmkWPts++0GKm+k0RLTpgOC+tbHmyJp82sYBGeWIpmmR96ZXTDcO6iSraA1Ku6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc0sXfPQXMZgNZZtJG5HsF0HSuD8s4sydwl/XVy9z6A=;
 b=hZujVdKxz6JyKMEueU2c3J4+ZwdsG/+AcPxDWHVmvT3oSbGbBdJCGh5CoaJsCDDKEF4u8FZ7gPAZqNodFFsWixIiY1bYU9TRU3+oaJml7P/iNK8XZWzUBSduFn7kik2k6iuXEW1E4rxAtTvQInhIk8WhEpoVpHalQkPGkLysqyH9oIExpp4hobKnnHDA2ZQgUHzRayF581sdCSrnfBAr7ccf5OwP4leb+SuAtUDIZ13g8T4195VNRpKpQpKBZAYGKAEao/hhw36qCouqQKwFqNUTz1zZ4sAEhwnqXTyIRlvpQnpKFXZ5aBm8/xq170eKMTUpUZV9uF6o+x2C88O2ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8129.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 05:37:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 05:37:35 +0000
Message-ID: <0b1c9897-2769-4ca0-9927-ac930b4c634b@nxp.com>
Date: Tue, 7 Jan 2025 13:38:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105190659.99941-2-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250105190659.99941-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0227.apcprd06.prod.outlook.com
 (2603:1096:4:68::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 68227812-d576-479c-9a28-08dd2edd63e1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blJZUnVKL21LWCt6SWVVSWZ0L1VuOStLL056cWxlblVmK3ZOQVJwNGVqS2VI?=
 =?utf-8?B?VmthZzhRY1RZdUV4STU3SnUyZngwOFlBQVA4WmZPeVE1QndqaTRGZzZ4QWxy?=
 =?utf-8?B?SVYzdUY3NjJWdzdscDA3dHB3aWd3dkhjeGJ2bmNyeXpXTWFSQ1JZcGtUZWZ1?=
 =?utf-8?B?MU5PNlVyY0xqaHBITU9NZTROQndLakRWR2xJU3I3TmpmY2p3di9SeWFNWE5X?=
 =?utf-8?B?ckI5WEppNFNaZVczVWNNUHlFTkFIa1FEVnhqNFhDWkRjbnJ2WUt1cE9CUS9n?=
 =?utf-8?B?UUl5bW5aZFNTbEFhaEY0Um1ORUowajJvWm5MeWZSZXRsR3h0SXpCYVIwMkRp?=
 =?utf-8?B?OXJoVVhaeWY4NjZvTFNQK0ltMEt1c1cxSmFwRGhWd1FRaUpkYzV6YU9vMTBW?=
 =?utf-8?B?a0lndUpCTEpIT3hhQU9LeHMrQThiN2FWcUpNSFh4NzYvMy93SXNhTTBQOW9T?=
 =?utf-8?B?L3ZSUnZtYWZKd1k4WnNjM0lmSmc2YzJVcGtMTUVqQTZPTUtaSEhhVGdoV1pD?=
 =?utf-8?B?Slk1Z1R4UEVPcWZUTldaQWhqTUhRYzJBZnRMVEs5dXNFRjVFN1ZnM0lVaUV1?=
 =?utf-8?B?eHhJOUs5UGkwWWo0RUJ6bTUxcmJqcnhRMVJDcjdMS3ZBRXVxSGhPK0MxYVdV?=
 =?utf-8?B?NEh5cnp3QVRaUm5kcTEzZjFhQkxHOUc3WExzS1hncnp3VVJ3VUtPSWJNaGhR?=
 =?utf-8?B?L2NmVXo2dzZHb3ZMTWJhTmE2WEZFd3Nvd05uNVFSZVI2N0pad0VYQVptL3lh?=
 =?utf-8?B?Qy9lcEFDMExuczFJaGRmWk9YRzQ1WG4vTkx0VUh5L0xYRk5tRjlpeTkzdEVG?=
 =?utf-8?B?QU1wN0ZoMVlhVUUwY3JYMm5xQ2RTS3pVdGFjZFdic25aMHM2MUZQSkNPVkh4?=
 =?utf-8?B?eDRUNlI0ZWpSazFyMlhDV2NrOXRjVDFvU0Z0YWVyNnZ2UTdwd05zbzh4dGJa?=
 =?utf-8?B?a1R1UFArRTdQNlVpYVBXbmJ3d1AxSzRubzZtbEs2WThjaG1IeURsZWFScTV1?=
 =?utf-8?B?NXl1Y2UzL0ZERlM5OHpYM0x3ZG9aOVlTaS82ZzRvRWhaMDZiWndaaFBDM1dy?=
 =?utf-8?B?a29xSHdwdG9iK1dQeVFoV2VRY0pacHpFUWpubXlwd2FuYWV1anFsNDlORlQy?=
 =?utf-8?B?dDJYWXVpSW1KTGpDTlpUczhEd2NCZ0xVNHRHblBmZVF3Y0trWXU4dVltOVM2?=
 =?utf-8?B?c2FrVDZDVDlQNUJZdEJlM3pXRlZINkRPK2sxVU0rUWZJWGlZSG5LeHRoWWlj?=
 =?utf-8?B?d1J3SVVETzRLaFBFOVp6cDlHTHRsVDR6dzNadHlwQmpBTUdnTjUzdGhsakhm?=
 =?utf-8?B?UW9XWFl1MENYTC9BRWV2T09SaXRyZFhCbUpHMkhVK2ZYcUNjMVRiOERlRzlx?=
 =?utf-8?B?T3VJR2ZOZDJTUkRZZVlQVnN3UW9DaWMxU3JmQ3hMMWZvWllMR3JFNFNKcDZF?=
 =?utf-8?B?ZExDWkF3RVVFOG5GR2tTcWRacHVWZkt6RE5PV2RkSGVyODRwN2M3UlBnZHNm?=
 =?utf-8?B?M2F3cEczb2xXeHRoUjJIeEhHM0lsdzRuUkpZdlNxUVZsZVkzc3U2cmN1dE1n?=
 =?utf-8?B?b0hLQWxsRVZTZ2owWkZNYTl4ajZMOWR0WEdsREFqaktGUXl4UTdueURkYXpG?=
 =?utf-8?B?MzZzeWxwdWtYTzFOWW9VamJqbVdOR1N6Y0xSM05qTVhlRk4vR1doOExxZkk3?=
 =?utf-8?B?bTBueEpETVp6ZGk1VzgwbjlBcTFYa21BY3BtSXFxSTVOY0h5Z0ZkYUl5TmFV?=
 =?utf-8?B?eklJRXJCODZCVVQzK1Ztd1Y5bWRSaWV2cXNUTjI1M0IvaytodjFhM1g5aklS?=
 =?utf-8?B?eVhQblNoNHFzY3lvbWtORU11ZGFEVGFLMm41THFuSVF1Y0N4cVVZdy9raEVG?=
 =?utf-8?Q?zLLeixFV7MoLb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdwUGkxZ0JuMTc3Mm5Iazc1Yzdra1VBbk51SHFwTlhnenFJcEJoSGRzVWFS?=
 =?utf-8?B?ZHRLL280MkZ0bVYzdkU3V2RnT1hSTHVzUWwvS3grY3hZRmZkeVpqSmljZ3J0?=
 =?utf-8?B?d0RNM2RIUTAzUjVJNEczcTdmdEszOWtrbWFycWxGSVlUVUM3aTFBQ3dCRkVr?=
 =?utf-8?B?dVk4UlVCYXpYbnBDdjc1ZHlSNkl1SEl6YlpFU2FIdFBKcUQ1d1RXMU02Zjd4?=
 =?utf-8?B?V0toWVVrK1hxNElZUXVBbGZDS3RLT2J1ejJxaFBvU1VuTmxycWFuaHFMczZ2?=
 =?utf-8?B?djg3Mk9Kdk1KZ25qWWJ5d24rQjk0UCtYZEdYbDJsWVFhcnA1YUF1L0xaRk1T?=
 =?utf-8?B?U3NvUFV1TDhvQnVnQmN2RFAyZGZQZEZXYUlYeUJRdG5CYkxzcE9mYWs5T3N1?=
 =?utf-8?B?UzFEZURyLy9ESC9NQzJPSlc5cFVGOUVUTzJjZnp2NDIxUWFMR1A1T0c0Wk5W?=
 =?utf-8?B?Yk9nelBHZS9TZjJqRksrNTFLbUg2Y2hUZGFCajhBS29IR3R4M1dHS1Niamgz?=
 =?utf-8?B?SUY0V2dvRjhNOGhiVUZrQWo5OFdiY3lxTVVIVHZ1aXBqWjhJTmxaZGdIOWtk?=
 =?utf-8?B?RzR6UC9YUnNZS3hlb0RNV2xtMXJhcGI2K0psOTkwa1cwa2kzL1hIN0pZL3hT?=
 =?utf-8?B?ZXRHeUZYRVVyY3FseVBveHVlcDM3SExmU2F6SjV3Tm50TUl6cEd4MzQ2TnNz?=
 =?utf-8?B?L1cvenhlNWNJZEl6YzA2LzJ0VVpQU0w2QURLejE5SDU3S25vSUVWd1pKM3ht?=
 =?utf-8?B?QmRrZ3RiNDNkVUtvZmJnNlRKM29OZlRZMk1IQ1V0VXExemFLRWhRTWREUFlG?=
 =?utf-8?B?OXJmNmZUSDVUUjdxODExRHJaNnJWWWQ0bnFTdU03QkNRN1ZtTExRdG9MdU1D?=
 =?utf-8?B?Mm4wMitWY1k2R2dweHh1VWFOSVMrMyt1Z3hjUlU4RCt4aUVIbmxpNHNlTHB1?=
 =?utf-8?B?cHU3Ny9NWlkzWDV3V2cwV3FSREx1YnBRT244cjBsMWNZd0JVOTRpdU1LbDVI?=
 =?utf-8?B?azYwcGFWN3ZpcEZPRzNWeGV4SWNaWVRDVk9xZU9rUnRtZnB5R2RoQ2ZIZWl3?=
 =?utf-8?B?eXdZblZ1MU5sUVFpMnNXRWM2OHFBdzhud3pPajhmVGZ3b2szYmxXMHhORmtx?=
 =?utf-8?B?UEoydjBiRG1PTitXVy9jSXg1QXQ5VDF0bWo4Yk42SytvbTExWUIycENUWUpT?=
 =?utf-8?B?L2Z4RmFjVXI3anpGb0lLOWV5STdnd0p3TDFBRjlGb2d1Z0Y3bkRoVU80YjZo?=
 =?utf-8?B?NlFRZmpNVkQ3NThObFVaendWMjN5eDBmdmJKN2lJRm1mbEFMZHpGQ08rbldt?=
 =?utf-8?B?UE5WQjViNlJ1QzhaN01xek5KM0JMak5TbXZuZEdwRWhCREdYYzJGOU8wTGNx?=
 =?utf-8?B?OUVQVlNVNXBZR2pIRWMzWUswc0crcVV3RUE4ckswTitIQ0NiQVRzVmlCcVVo?=
 =?utf-8?B?K1JReWN3aTBPamR5NHJjT25WNXp5VU9iS0twSTE4ZWs3M1RJcUNrQkc4cFpX?=
 =?utf-8?B?VGRldi9xY3ZsZDV1eTFkcGo3b3kraHNWNHB6NVJrR1VQOE5vZUtLNmRNMUcr?=
 =?utf-8?B?aStwWWRncmFySDBESFVZQndGQkVnOU5uVk9VaGJYZklDTjFWeEcwVU5jQ0pl?=
 =?utf-8?B?WE1CYTZuNHFSVkdlTGpGWXpXZ2VHWW9CT01vRUdJejB5bXVlWEkrUVRJaUgy?=
 =?utf-8?B?YU81N3hvbUk5bzFWdnJ2UlkwbWl2czVPN1ZzVnhzVWJleU4xQWxoYUVKbzNW?=
 =?utf-8?B?WGhoN0t6K2YvWlRyVWwyU1M0ZlptOFVZcUwyUnk5MzZlRzliWUNYVW8zTDNB?=
 =?utf-8?B?TmwvT3hQeFhac2ZYbXF5OUFPMGdFeEVvb3VpKzN3b3NvZ0hnb2JCV3loemxo?=
 =?utf-8?B?N0NSa1ZMVUZWV0xhbWpZK2tlVlhPVnFxOURQcml0WW96S2tnb3REY0t4QlJq?=
 =?utf-8?B?RmtzMm1KbTk1bnFBSCtZVll6b3BUajIzUHdWaS9Lc3U4aEhaa00xTFhESGNO?=
 =?utf-8?B?dVUwWGFKK1V4Zi9UakxqejVTRG5QSGlDaWo0eGh3NHFNaFRLR2lJdWZ5MU02?=
 =?utf-8?B?WENGSERxUllyN3NDY1pvN3pWYW9wOWxRWXpPR29tclA2dFczMUlwQ1BvZGE0?=
 =?utf-8?Q?YGkrdU4tVPdMCd2m1Nlr3+at9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68227812-d576-479c-9a28-08dd2edd63e1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 05:37:35.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL/JDXmH9i8eRDEWj8UimRdPBC1bjZj7DkSh8GtQY0oGELCuR3TGbhci48xUPchHvbphTylFEEwxjgUffDo8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8129
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

On 01/06/2025, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> the oldest commit which adds HDMI support is commit:
> 
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> 
> That already contains the HDMI connector node. Most follow up additions
> of HDMI support to another devices has been a variation of the same commit,
> including connector node, which is the proper way of eanbling HDMI on the
> i.MX8MP.
> 
> The rest should be covered by output_port_optional which should make systems
> with DTs without HDMI connector node work, but such DTs should be updated and
> the HDMI connector node should be added.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: No change
> V3: - Update commit message
>     - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>     - Enable output_port_optional
> V4: - Remove select DRM_DISPLAY_CONNECTOR
> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..3d63200e468bf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;

How would you keep the behaviour of the connector after adding
DRM_BRIDGE_ATTACH_NO_CONNECTOR in display controller driver?
dw_hdmi_connector_create() implements CEC support at least.  This was pointed
out in v2 and v3 comments.

https://lore.kernel.org/all/vvsj6ri2ke25nzocbq736yv7rphzma6pn3yk2uh7iu43zfe2sa@2fwye4k4w6he/

> +	plat_data->output_port_optional = true;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))

-- 
Regards,
Liu Ying
