Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319EA24B5E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF410E321;
	Sat,  1 Feb 2025 18:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="LWHMTJPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1933510E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ5aDwvpFKINohqDGjWbBI5w4cFXJ9V6VsvdJDqgqqnG7K/uHYAtlJGjW71SEwb7QOPVWpzzsJAfIhBPfIhzazze5bKlamQsGLSO+1VRxLWxNz8u/+pGCtoe9R0jgc4byH+s+hppxdvt5Q5QFP2egL7TgsrKLg4t/a9bTjOG774cfV1BJiCc539sszUf6XxcgnNARI4w79hTN1cdyeF36+5AHN1eU6eHAghwSXBMFlRKjGFe5xSxS+ja6RsF0Y+zDmgjEHei7aBhQpUGCGPTgsGmTu05qopLP1RFfLniHhtIMNKLTelhYLWABxvJgVbDka3ZURQEvQwJDariizmO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weWHAYHd7duyG5395Vm3F9/ZaVvWt55Dvk/XgFwGLyc=;
 b=irtfPKLgy2ZMtaPRad2Aj7LxqMKkdkJxdiKfxfrQpQzJjdnYEFmWO43iDZVq9xD8IqyXn9v1ihX+DuquH5Q7snSAdyXVUJcYaAXljFFJmhQ4y8cVOxkOsCVgLwmnhO7HDFLQ7smQL7w2kN+PjHwfCPEJCp6yv0M8tkKMMdLMTXKT0FE2+0uVEMp7ixlOmPmQN47tdHzRYrZkYkbu5b2JR74DHuLuF6qI8dbZp4aKpil09mnuGg4r+D/Fij2MlDQwJGJ0yftwvWAsuDTKMXp5qXpqaD7EWGVv2I+8yR2irFi24yDDSJkSFJtB3KKfaSFQv+Rq5kC5K2405ih45d66Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weWHAYHd7duyG5395Vm3F9/ZaVvWt55Dvk/XgFwGLyc=;
 b=LWHMTJPBBdmYWlnnATOiPHOUSW1hJXiWfEisQgGVdmPR77zIzpAdEp89ugvVAq/GVZ/MZZCI72pxHxvs/WeouIF00YFkM1Jk1btUlmIcjy7NIucIT14nSPm4r6zbgJZPXFehf7VeG2R48/RseY2aaPlCHx8LE23y3J4/OS3mHs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 16:38:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:38:36 +0000
Message-ID: <8ad30e14-e785-4e3a-ba92-644e7fb07759@cherry.de>
Date: Fri, 31 Jan 2025 17:38:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add HDMI0 audio output on
 rock-5b
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Algea Cao <algea.cao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250130165126.2292107-1-detlev.casanova@collabora.com>
 <20250130165126.2292107-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250130165126.2292107-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d4f25a-2b92-43db-5b55-08dd4215b54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjZPTDMyMC8zS1EvNHpaYmRrZUV5cGsybGZCRUxyRWRBTFE3REVzekZTVmR3?=
 =?utf-8?B?WWJPOHBMRGZ3ejh3SGRPVEtyYmVZak0yc0dTbkE3ZDhMYXNDb3JhSzFMWklQ?=
 =?utf-8?B?SGhqZ2hMZkh5Yk9VM0Q5TWh1MEFyWFVtbnZUclhnZjNkUkdESUVmSEkrQUt1?=
 =?utf-8?B?TGozNUt1cXBwVXllMXo1aitrSk10aHQ5WDdJUzlORDcxbjNCMGF4Zm9LOTRT?=
 =?utf-8?B?ajdiYm1RK1h2YTNKb2lsbktId3dwSW0wZGFrek1QTU5ROE4vOUNjQ1BwV05R?=
 =?utf-8?B?M3VwL0hWVUdCMWRJM2g4SzNRNU80ZGlCRXFOcUF2cUk3TktKMG1RNTh3TkRG?=
 =?utf-8?B?V3VXU3ZEbWI0V1NvcUZPcHd2QStzYnkxYVg1MkI5dy9uR0VCazJDQWp3eEZi?=
 =?utf-8?B?V1hWb1ZwTFhPeHNHcTlrNHhrakZMUmROYlJJSmplTExFZlFhTDJPOWlueWdF?=
 =?utf-8?B?QXo4Q045ODM0WE1MZEhkaGZZNGpodWpXamhuU1NkNUYvQmZnR0hnRnp6SVdT?=
 =?utf-8?B?VG8xRVp1Q3JoZTViWjlMSTBSQTdKRFllTEJwWVBjU2pydm1YZVh4R1hTczFk?=
 =?utf-8?B?bmc5M09ybHBDQVlKUitGSERhajBkdXlycHlOaksxR0VCWWFXYzRubXczRlRG?=
 =?utf-8?B?T09veDI4LytkYnl0VlhJZHFJWTBDdmFucS9QcmVzeW5jUUVxeWtZRXg0enR4?=
 =?utf-8?B?akFQSm05T3QxaFFBeVdWVTdWeThUWVFObG01OWtjMUxYM1FWT0UyR3ZPWGE2?=
 =?utf-8?B?ZFJIWlhSdU5VTXU0QTlCVllONFJhbWpwM0ErVEJjclVvcUR0Q21WSG5iZnZK?=
 =?utf-8?B?QVVLWXBlNEh4Q1JEL2hzbm5BNm9WeXpIeDJmYnVwVXNZdHMzS0VybjRwc213?=
 =?utf-8?B?eGV5eVA2d3pCK29nUXBteFdyU29Db1NEdk5iZDBwY0FXdWh4ZlUwL2dtcXky?=
 =?utf-8?B?MkczaGVoZW1ZckNtek5NWVN3d3JRejVNYTVIYURSUExkQVBsTU5pVWIyMWR1?=
 =?utf-8?B?dlEzbG1MZnd3NmdQZklxZzRYZlRPK0Y0ZlZtVG80MTZUUWdTckpnVmp0OHdS?=
 =?utf-8?B?MHJOWlhMR1hHSGFNOXUvSnJScW5NRUNGN0xuZXJEM2pUOUxCU2RsM3ZRajNM?=
 =?utf-8?B?Q2RSVXJXSDY4ZERNeXZGdk5TZVZ4Yy9KNmI3VURaNWorSlFYcmlla1R6L2JN?=
 =?utf-8?B?NG83Z0ZSSUFhM2VZYlo3MUgvSnhBQ2RHOE9Zbnkwc3czMGJYVHA2M0lZd2hL?=
 =?utf-8?B?czZGbjNzRHU0UmJPVU9KOHloR2VkQVI4Mmh5TjFydkFUbzF5QWhpVUNtOGtM?=
 =?utf-8?B?QVcyMGt0aUYzczl1WFFEcENZNEF5Um4rU1lTMWJTNmkwNUJPRUtZMGlCMkNE?=
 =?utf-8?B?VWRmQ202eTRQOVhHenBVR3hoYTcrUFZxdVIrZTdQVmJJaEdlZXpmVVUvKzNx?=
 =?utf-8?B?TzBCRzRKTTBXQk5tYy9JUHN4VTVOc2dxSEJZTUdUV3hpRWdyVitrNFZlZ0tX?=
 =?utf-8?B?d1E3elhQNUQ1NzJYeVFRakhWVTBFMWlCUXhjL1M4RWVDSkQ0bithc3l4d3VC?=
 =?utf-8?B?OE5CcWNxbFZxZFRodHNEclgwOVVOYXdOK2R3OXh6bkVJeno4RVBHNDhyWlpk?=
 =?utf-8?B?TXpnZ1RHYldUeHNybUV4WlprSjJIcTI4QkVQeVE3eHRVMDl1d2pzc2J1WmU4?=
 =?utf-8?B?TEJXOGV1RlkwcW5TTko2VkZMTmYwNjloMmNXSmxxblIxNE0rVW5MaUdCdWNp?=
 =?utf-8?B?RWhKaFpvVTdEbHgzalpYdEM5OFljTVhzUlRXY3VYWmx5d0lFMS9mN0FZeFVu?=
 =?utf-8?B?aHNUcC9ra0s1R3F4K3pqdEl2bkhiQzd0eXh5NUpWUEppdHU0UGl5VWFFZEU2?=
 =?utf-8?Q?d02T6lHHtDsyk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N296Q0g3WUErTUJiS0hRUUVZRDQ5TkN2bGZyM2p5bm9KcGxIdTJCWmNoZEp6?=
 =?utf-8?B?ckdKVmZsYlJaa0RJVW5SUS9lNVRHT1cwUDJDMzhyZkFHNUhtN2dQLzVqdngz?=
 =?utf-8?B?ZkZTM1N6aVNlZHhEMTdZTU1pU3czdEV4UGJWS1FRNXFydDJkV1dUMDBpbUIz?=
 =?utf-8?B?N0NpUnlxYnBMczdWcTB4SGV6eUFyQlpteis1YW5zL01WK1F2UW1HbWFUOHNw?=
 =?utf-8?B?NS94Q2Q2YUVvUTFBOHltVmNHNlhsRWovV1J5dnVPOXdIb1NHdjRsVmFya0pJ?=
 =?utf-8?B?YnZHYm1vZWl2UW1wWU9SdmRvTzlPdUxSZ0RpdlNMeXRDMUpDQ0Y5MHdqN1FL?=
 =?utf-8?B?b3V5c0hSUFkxVjFJb1U5eXppbFEySEdjQXNCMzlUSnRYYklzUDdSbm1WTUIr?=
 =?utf-8?B?Sy81RXJDQmlwaE9RZVVCVHV6YjRoZ2hEelRPV2RVc3FMb2VHdFV6VFd1aSs1?=
 =?utf-8?B?SSttSUtYSHRHUHp0NE9ZVXoxZEZjaE4vS0V3b01PMGZDZG8wVkhlQkhQdEdm?=
 =?utf-8?B?ZmZsRFM2L3ZaZndiYlFIVGl5RU11VTdKbGg2aFFod1VoeitxL0RxQlFmRnZ6?=
 =?utf-8?B?cDRFWmF1WHo2UGtlWEdKeGxmRjNOeGV0ZFQ1Nm5rWkRIR1JFeFdyQTdQV2VD?=
 =?utf-8?B?bWZ2alBjSkVVQ1doM0xURkZ1WnI5WHNrVjJHUjFxNUM1TU5OT1RxUDVwY3JV?=
 =?utf-8?B?clVIQVV1QWZ0cWp5TVlCeW5HcG5CTGpXcE1FQUNNZWxHSm1tOW1Hd2Znalp6?=
 =?utf-8?B?Vk04UUZQRlllb3dmRnBWRGxERmJXbk1tOUd2K2ZzVGVwMk1ibE5mRGJIWk8y?=
 =?utf-8?B?UGMxRlB5OXlWdy92Y01MdjQ3SUg1NlNVMXNxTzNENWdJV3NCbTVXbEVxZE5o?=
 =?utf-8?B?VllnZE9lWmNsOEpzQWRyVU1WN3lPNzVaRnNDMyt0WHJkTmpqQlF2cTdCeTJC?=
 =?utf-8?B?aXk2YXFZdjROWnNmOVg4ZTRZSVU1M1crWEZzUXZMNmh5Z2lyUG9EeCtKdWNt?=
 =?utf-8?B?NzZXbXNxdW5hSXByc0hZODl4eU1uUmVoOExJeE4vZkJzRXU1NEwwV3R1OWo5?=
 =?utf-8?B?ZFI1YmhpL2JLUVdNSzdlL2lpV0Jnc2IwaXcrRStDMk5PVkRzS29Tb0phazVP?=
 =?utf-8?B?NGh0emlnVnE3UVBqeTV0a1Zvc1BheC8waWlNY3I3TGlpc0ZKL3NtWW81U3p3?=
 =?utf-8?B?V0dwZm9SMWNjS0dCVDQ2M3pJNGNQTW54cDIySU4zNEkyZG9zY0JhN1Bwb1RU?=
 =?utf-8?B?NEIyZTJrVFJabTZHaDFSanpjaU83bXR0Y2tHUmtHWUVSdkwwZkJlYk5BWXk0?=
 =?utf-8?B?Qno3T2RjcW9Xdy9PNVJhWnNlWEhsQVVKUDVibFpJcks3RUtoVTV4L0tnckY2?=
 =?utf-8?B?ZlIyZ29DcGtKSFFRdGpKbXEvQUFXaXF1aFpKRVJOYjBGd0lwaHZyd3dQcTZ2?=
 =?utf-8?B?T0JuMVJnSWhDZHBkZGdVbm9LVTZzWi9rNVVlajgwcGZIbnNLZFo5TDNMYUVN?=
 =?utf-8?B?STdPaTJoQ2tVY25Ba1FUUTZyRWw5Mk8xeDZmQXhzb3QzVkZsTEM0aGdISkZq?=
 =?utf-8?B?c24xQmRGMHVUbUcrK0NtQWlOcDZvR0hqZkpDdDR2c2dhb3BNWkRmWU5Tc0t3?=
 =?utf-8?B?RzVXa0w0akNVQWdkS0JoL0lUNm1HVThlKzM2TktYRnp1T2YzQlhsdVNvU0Qy?=
 =?utf-8?B?K3ZKS3FDZkdPZ0JWdEYwZ3VSRjVETjBMOEFzdXIyVXc1TkRwRDBsOXJmUnU3?=
 =?utf-8?B?Umo2S282UWpkQW15QVNaYXBZSWNyeGYyMVAxV0V5TzcvbWxWSzZiOUpQVDF1?=
 =?utf-8?B?NUo1T0VqdDRYbnluaHJibjM5bEFNRnVMdGF0SDd1OHR2TFQ3SFZSeXM0NnJY?=
 =?utf-8?B?UXJ6bmJnTUxHaTNoWGJYT203T3dweTdBSk1XWkx1elRiM05zNmpCcFFBRGti?=
 =?utf-8?B?K0hibWJ6bDJTcVZmK2NZeFAxUEdPV3pEanhUSlE0Z29VZGJOVDlkZnZSa2JT?=
 =?utf-8?B?RlUxc1lObjY1S0k1RC9MbUtleG1kWmNRQnRFQ2U0K2M0Yk9vaWJTSy9jdXpW?=
 =?utf-8?B?S3pJZmVINzk5b1I5aEpXS0FUVloreFltTzY1a0cyVkpDNERuNUVoNDdhOXd0?=
 =?utf-8?B?TndrU21XdENsNC9zaGVLaC9YdzZubG5aNUJtTE5tVTNSWkJwVGlYNTRobVoy?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d4f25a-2b92-43db-5b55-08dd4215b54e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:38:36.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExdIP04pj+KAL39uVh6YrKM3fHs9LrGCXiqtMPnVj1H4qCCd5WAB1znl0yJYPfvFZEuX7CQQVsdeNgZ2QpfxZdeV4fQ31BRCqyj7Jn3wt+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:56 +0000
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

Hi Detlev,

On 1/30/25 5:45 PM, Detlev Casanova wrote:
> Use the simple-audio-card driver with the hdmi0 QP node as CODEC and
> the i2s5 device as CPU.
> 
> The simple-audio-card,mclk-fs value is set to 128 as it is done in
> the downstream driver.
> 
> The #sound-dai-cells value is set to 0 in the hdmi0 node so that it can be
> used as an audio codec node.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  1 +
>   .../boot/dts/rockchip/rk3588-rock-5b.dts      | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8cfa30837ce72..790c1c25a3e41 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1394,6 +1394,7 @@ hdmi0: hdmi@fde80000 {
>   		reset-names = "ref", "hdp";
>   		rockchip,grf = <&sys_grf>;
>   		rockchip,vo-grf = <&vo1_grf>;
> +		#sound-dai-cells = <0>;
>   		status = "disabled";
>   
>   		ports {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d597112f1d5b8..1909078538367 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -49,6 +49,21 @@ hdmi0_con_in: endpoint {
>   		};
>   	};
>   
> +	hdmi0-sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,mclk-fs = <128>;
> +		simple-audio-card,name = "hdmi0";
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&hdmi0>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s5_8ch>;
> +		};
> +	};
> +

This is SoC specific and not board specific I believe. I2S5 is not 
usable anywhere else but with HDMI0 controller if I've read the TRM 
properly.

Therefore, I would suggest to move this to rk3588-base.dtsi (with 
status=disabled; and when hdmi1-sound comes up, to rk3588-extra.dtsi), 
the same way we've done for RK3399 for example.

The only hesitation I have is that HDMI0 can use either I2S or SPDIF for 
audio, both audio controllers internal exclusive to HDMI0/1 controller. 
But the user could anyway define their own simple audio card for spdif 
or modify this one if they wanted to.

I've tested with my suggested change and same changes than for Rock 5B 
DTS on RK3588 Tiger Haikou with speaker-test -c 2 -t wav, left is left, 
right is right :)

I'm not giving my Tb here as the commit title is specifically about Rock 
5B and I haven't tested this series on it. If you had a separate patch 
for the hdmi sound node and enabling it on Rock 5b, I would have given 
my Tb on the former and not the latter.

Thanks!
Quentin
